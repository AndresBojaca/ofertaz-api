const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Roles = sequelize.define('Roles', {
  roleDescription: {
    type: DataTypes.STRING,
    allowNull: false,
  }
});

module.exports = Roles;
