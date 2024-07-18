const express = require('express');
const router = express.Router();
const { JobOffer, Company, User } = require('../models');
const auth = require('../middleware/authMiddleware');

// Ruta para obtener todas las ofertas de trabajo
router.get('/', async (req, res) => {
  try {
    const jobOffers = await JobOffer.findAll({
      order: [
        ['date', 'DESC'],
      ],
      include: [Company, User]
    });
    res.json(jobOffers);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Ruta para obtener los detalles de una oferta de trabajo por ID
router.get('/:id', async (req, res) => {
  try {
    const jobOffer = await JobOffer.findByPk(req.params.id, {
      include: [Company, User]
    });
    if (jobOffer) {
      res.json(jobOffer);
    } else {
      res.status(404).json({ message: 'Job offer not found' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Ruta para crear una oferta de trabajo (requiere autenticación)
router.post('/', auth, async (req, res) => {
  const {
    title,
    description,
    position,
    date,
    role,
    level,
    contract,
    perks,
    skills,
    location,
    salary,
    applications,
    companyId
  } = req.body;

  try {
    const company = await Company.findByPk(companyId);
    if (!company) {
      return res.status(400).json({ message: 'Company not found' });
    }

    const jobOffer = await JobOffer.create({
      title,
      description,
      position,
      date,
      role,
      level,
      contract,
      perks,
      skills,
      location,
      salary,
      applications,
      companyId,
      userId: req.user.id  // Utiliza el ID del usuario autenticado
    });
    res.status(201).json(jobOffer);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
