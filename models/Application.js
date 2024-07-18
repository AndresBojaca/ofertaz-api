// models/Application.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const User = require('./User');
const JobOffer = require('./JobOffer');

const Application = sequelize.define('Application', {
  userId: {
    type: DataTypes.INTEGER,
    references: {
      model: User,
      key: 'id'
    },
    allowNull: false,
    primaryKey: true
  },
  jobOfferId: {
    type: DataTypes.INTEGER,
    references: {
      model: JobOffer,
      key: 'id'
    },
    allowNull: false,
    primaryKey: true
  },
  appliedAt: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
  status: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: 'Postulada',
  }
});

// Definir las relaciones
Application.belongsTo(User, { foreignKey: 'userId' });
Application.belongsTo(JobOffer, { foreignKey: 'jobOfferId' });

User.belongsToMany(JobOffer, { through: Application, foreignKey: 'userId' });
JobOffer.belongsToMany(User, { through: Application, foreignKey: 'jobOfferId' });

module.exports = Application;
