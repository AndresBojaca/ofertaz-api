const Sequelize = require('sequelize');
const sequelize = require('../config/database');

// Importar los modelos
const User = require('./User');
const JobOffer = require('./JobOffer');
const Company = require('./Company');
const Application = require('./Application');

// Definir las relaciones
JobOffer.belongsTo(Company, { foreignKey: 'companyId' });
Company.hasMany(JobOffer, { foreignKey: 'companyId' });

JobOffer.belongsTo(User, { foreignKey: 'userId' });
User.hasMany(JobOffer, { foreignKey: 'userId' });

// Exportar los modelos
module.exports = {
  sequelize,
  Sequelize,
  User,
  JobOffer,
  Company,
  Application
};
