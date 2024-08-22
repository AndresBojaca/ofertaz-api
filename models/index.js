const Sequelize = require('sequelize');
const dbConfig = require('../config/database');

// Importar los modelos
const User = require('./User');
const JobOffer = require('./JobOffer');
const Company = require('./Company');
const Application = require('./Application');
const Roles = require('./Roles');

// Exportar los modelos
module.exports = {
  Sequelize,
  dbConfig,
  User,
  Roles,
  JobOffer,
  Application,
  Company,
};
