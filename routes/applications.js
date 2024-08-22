
const express = require('express');
const router = express.Router();
const { Application, JobOffer, Company } = require('../models');
const auth = require('../middleware/authMiddleware');

// Obtener todas las postulaciones de un usuario
router.get('/user/:userId', auth, async (req, res) => {
  try {
    const applications = await Application.findAll({
      where: { userId: req.params.userId },
      include: [{
        model: JobOffer,
        include: [Company]  // Incluir la compañía asociada
      }]
    });
    res.json(applications);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Verificar si un usuario ha aplicado a una oferta específica
router.get('/user/:userId/jobOffer/:jobOfferId', auth, async (req, res) => {
  try {
    const application = await Application.findOne({
      where: {
        userId: req.params.userId,
        jobOfferId: req.params.jobOfferId
      }
    });
    if (application) {
      res.json({ applied: true, application });
    } else {
      res.json({ applied: false });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Crear una nueva postulación
router.post('/', auth, async (req, res) => {
  const { userId, jobOfferId } = req.body;
  try {
    const application = await Application.create({
      userId,
      jobOfferId
    });
    res.status(201).json(application);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Eliminar una postulación
router.delete('/:userId/:jobOfferId', auth, async (req, res) => {
  try {
    const rowsDeleted = await Application.destroy({
      where: {
        userId: req.params.userId,
        jobOfferId: req.params.jobOfferId
      }
    });
    if (rowsDeleted) {
      res.json({ message: 'Application deleted' });
    } else {
      res.status(404).json({ message: 'Application not found' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
