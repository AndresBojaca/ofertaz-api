const express = require('express');
const router = express.Router();
const { Company } = require('../models');
const auth = require('../middleware/authMiddleware');

// Ruta para obtener todas las empresas (requiere autenticación)
router.get('/', auth, async (req, res) => {
  try {
    const companies = await Company.findAll();
    res.json(companies);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Ruta para crear una empresa (requiere autenticación)
router.post('/', auth, async (req, res) => {
  const { name, logo, website, description, industry, size, founded, location } = req.body;

  try {
    const company = await Company.create({
      name,
      logo,
      website,
      description,
      industry,
      size,
      founded,
      location
    });
    res.status(201).json(company);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
