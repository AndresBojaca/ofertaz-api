const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Company = require('./Company');
const User = require('./User');

const JobOffer = sequelize.define('JobOffer', {
  title: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  description: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  position: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  date: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
  role: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  level: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  contract: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  perks: {
    type: DataTypes.JSON,
    allowNull: true,
  },
  skills: {
    type: DataTypes.JSON,
    allowNull: true,
  },
  location: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  salary: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  salaryCurrency: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  applications: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  companyId: {
    type: DataTypes.INTEGER,
    references: {
      model: Company,
      key: 'id'
    },
    allowNull: false,
  },
  userId: {
    type: DataTypes.INTEGER,
    references: {
      model: User,
      key: 'id'
    },
    allowNull: false,
  }
});

// Definir las relaciones
JobOffer.belongsTo(Company, { foreignKey: 'companyId' });
Company.hasMany(JobOffer, { foreignKey: 'companyId' });

JobOffer.belongsTo(User, { foreignKey: 'userId' });
User.hasMany(JobOffer, { foreignKey: 'userId' });

module.exports = JobOffer;
