// api/auth.js

const express = require('express');
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
    let user = await User.findOne({ where: { email }});
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
    let userCreated = await User.findOne({ where: { email },   include: [{ model: Roles, as: 'Role', attributes: ['id', 'roleDescription']}] });

    // Firmar el token
    jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' }, (err, token) => {
      if (err) throw err;
      res.json(
        {
          sessionUser: { token: token, user: userCreated, role: userCreated.Role.roleDescription }
        }); // Devuelve también el ID del usuario
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
    let user = await User.findOne({ where: { email },   include: [{ model: Roles, as: 'Role', attributes: ['id', 'roleDescription']}] });
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

// Middleware para verificar token activo
const verifyToken = (req, res, next) => {
  const token = req.cookies.token;

  if (!token) {
    return res.status(401).json({ msg: 'No token, authorization denied' });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded.user;
    next();
  } catch (err) {
    res.status(401).json({ msg: 'Token is not valid' });
  }
};

// Ruta protegida para obtener datos del usuario
router.get('/user', verifyToken, async (req, res) => {
  try {
    const user = await User.findByPk(req.user.id);
    if (!user) {
      return res.status(404).json({ msg: 'User not found' });
    }
    res.json(user);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server error');
  }
});

module.exports = router;
