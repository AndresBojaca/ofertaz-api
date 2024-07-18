const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const { sequelize } = require('./models');

// Configurar dotenv para manejar variables de entorno
dotenv.config();

// Crear una instancia de Express
const app = express();

// Middleware para habilitar CORS
app.use(cors());

// Middleware para analizar JSON
app.use(express.json());

// Conectar a la base de datos
sequelize.authenticate()
  .then(() => console.log('Conectado a MySQL...'))
  .catch(err => console.log('Error al conectar a MySQL:', err));

// Sincronizar modelos con la base de datos
sequelize.sync({ alter: true })
  .then(() => console.log('Modelos sincronizados con la base de datos'))
  .catch(err => console.log('Error al sincronizar modelos:', err));

// Rutas
const userRoutes = require('./routes/users');
const jobOfferRoutes = require('./routes/jobOffers');
const authRoutes = require('./routes/auth');
const companyRoutes = require('./routes/company');
const applicationRoutes = require('./routes/applications');

app.use('/users', userRoutes);
app.use('/jobOffers', jobOfferRoutes);
app.use('/auth', authRoutes);
app.use('/company', companyRoutes);
app.use('/applications', applicationRoutes);

// Definir una ruta básica
app.get('/', (req, res) => {
  res.send('API de plataforma de empleo funcionando');
});

// Escuchar en el puerto especificado
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Servidor corriendo en el puerto ${PORT}`));
