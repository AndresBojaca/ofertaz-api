// api/auth.js

const express = require('express');
const transporter = require('../config/email');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { body, validationResult } = require('express-validator');
const User = require('../models/User');
const Roles = require('../models/Roles');

const router = express.Router();

// Ruta para registrar un nuevo usuario
router.post('/register', [
  body('name').not().isEmpty().withMessage('Name is required'),
  body('email').isEmail().withMessage('Please include a valid email'),
  body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters')
], async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { name, email, password, rolesId } = req.body;

  try {
    // Verificar si el usuario ya existe
    let user = await User.findOne({ where: { email } });
    if (user) {
      return res.status(400).json({ msg: 'User already exists' });
    }

    // Crear nuevo usuario
    user = User.build({ name, email, password, rolesId });

    // Hash de la contraseña
    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(password, salt);

    await user.save();

    // Crear payload del token
    const payload = {
      user: {
        id: user.id
      }
    };

    // Consultar nuevo usuario
    let userCreated = await User.findOne({ where: { email }, include: [{ model: Roles, as: 'Role', attributes: ['id', 'roleDescription'] }] });

    // Firmar el token
    jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' }, async (err, token) => {
      if (err) throw err;

      // Envía el email de confirmación
      const confirmUrl = `${process.env.FRONTEND_URL}/confirmAccount/${token}`; // URL de confirmación con el token
      const mailOptions = {
        from: process.env.EMAIL_USER,
        to: user.email,
        subject: 'Confirma tu cuenta',
        html: `<h1>Confirma tu cuenta</h1>
               <p>Hola ${user.name}, por favor confirma tu cuenta haciendo click en el siguiente enlace:</p>
               <a href="${confirmUrl}">Confirmar cuenta</a>`
      };

      try {
        await transporter.sendMail(mailOptions);
        res.json({ token });
      } catch (error) {
        console.error('Error al enviar el email:', error);
        res.status(500).send('Error al enviar el email');
      }
    });
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server error');
  }
});

// Ruta para iniciar sesión
router.post('/login', [
  body('email').isEmail().withMessage('Please include a valid email'),
  body('password').exists().withMessage('Password is required')
], async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { email, password } = req.body;

  try {
    // Verificar si el usuario existe
    let user = await User.findOne({ where: { email }, include: [{ model: Roles, as: 'Role', attributes: ['id', 'roleDescription'] }] });
    if (!user) {
      return res.status(400).json({ msg: 'Invalid Credentials' });
    }

    // Verificar la contraseña
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: 'Invalid Credentials' });
    }

    // Crear payload del token
    const payload = {
      user: {
        id: user.id
      }
    };

    // Firmar el token
    jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' }, (err, token) => {
      if (err) throw err;
      res.json(
        {
          sessionUser: { token: token, user: user, role: user.Role.roleDescription }
        }); // Devuelve también el ID del usuario
    });
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server error');
  }
});

router.post('/confirm', async (req, res) => {
  try {
    const { token } = req.body;
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await User.findByPk(decoded.user.id);

    if (!user || user.confirmed) {
      return res.status(400).json({ msg: 'Invalid or expired token' });
    }

    user.confirmed = true;
    await user.save();

    res.json({ msg: 'Account confirmed successfully' });
  } catch (err) {
    console.error(err.message);
    res.status(400).send('Invalid token');
  }
});



module.exports = router;
