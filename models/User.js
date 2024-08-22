const Roles = require('./Roles');
const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const User = sequelize.define('User', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  photoUrl: {
    type: DataTypes.STRING,
    allowNull: true
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false
  },
  rolesId: {
    type: DataTypes.INTEGER,
    references: {
      model: Roles,
      key: 'id'
    },
    allowNull: false,
  }
});

// Definir las relaciones
User.belongsTo(Roles, { foreignKey: 'rolesId' });


module.exports = User;
