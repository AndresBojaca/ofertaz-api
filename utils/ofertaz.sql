-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-07-2024 a las 21:14:31
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ofertaz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `applications`
--

DROP TABLE IF EXISTS `applications`;
CREATE TABLE IF NOT EXISTS `applications` (
  `userId` int NOT NULL,
  `jobOfferId` int NOT NULL,
  `appliedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Postulada',
  PRIMARY KEY (`userId`,`jobOfferId`),
  UNIQUE KEY `Applications_jobOfferId_userId_unique` (`userId`,`jobOfferId`),
  KEY `jobOfferId` (`jobOfferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `applications`
--

INSERT INTO `applications` (`userId`, `jobOfferId`, `appliedAt`, `createdAt`, `updatedAt`, `status`) VALUES
(1, 1, '2024-07-18 08:31:47', '2024-07-18 08:31:47', '2024-07-18 08:31:47', 'Postulada'),
(1, 4, '2024-07-18 19:03:56', '2024-07-18 19:03:56', '2024-07-18 19:03:56', 'Postulada'),
(1, 5, '2024-07-18 19:04:39', '2024-07-18 19:04:39', '2024-07-18 19:04:39', 'Postulada'),
(1, 6, '2024-07-18 11:08:02', '2024-07-18 11:08:02', '2024-07-18 11:08:02', 'Postulada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `industry` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `founded` int DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `responseTime` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name_3` (`name`),
  UNIQUE KEY `name_4` (`name`),
  UNIQUE KEY `name_5` (`name`),
  UNIQUE KEY `name_6` (`name`),
  UNIQUE KEY `name_7` (`name`),
  UNIQUE KEY `name_8` (`name`),
  UNIQUE KEY `name_9` (`name`),
  UNIQUE KEY `name_10` (`name`),
  UNIQUE KEY `name_11` (`name`),
  UNIQUE KEY `name_12` (`name`),
  UNIQUE KEY `name_13` (`name`),
  UNIQUE KEY `name_14` (`name`),
  UNIQUE KEY `name_15` (`name`),
  UNIQUE KEY `name_16` (`name`),
  UNIQUE KEY `name_17` (`name`),
  UNIQUE KEY `name_18` (`name`),
  UNIQUE KEY `name_19` (`name`),
  UNIQUE KEY `name_20` (`name`),
  UNIQUE KEY `name_21` (`name`),
  UNIQUE KEY `name_22` (`name`),
  UNIQUE KEY `name_23` (`name`),
  UNIQUE KEY `name_24` (`name`),
  UNIQUE KEY `name_25` (`name`),
  UNIQUE KEY `name_26` (`name`),
  UNIQUE KEY `name_27` (`name`),
  UNIQUE KEY `name_28` (`name`),
  UNIQUE KEY `name_29` (`name`),
  UNIQUE KEY `name_30` (`name`),
  UNIQUE KEY `name_31` (`name`),
  UNIQUE KEY `name_32` (`name`),
  UNIQUE KEY `name_33` (`name`),
  UNIQUE KEY `name_34` (`name`),
  UNIQUE KEY `name_35` (`name`),
  UNIQUE KEY `name_36` (`name`),
  UNIQUE KEY `name_37` (`name`),
  UNIQUE KEY `name_38` (`name`),
  UNIQUE KEY `name_39` (`name`),
  UNIQUE KEY `name_40` (`name`),
  UNIQUE KEY `name_41` (`name`),
  UNIQUE KEY `name_42` (`name`),
  UNIQUE KEY `name_43` (`name`),
  UNIQUE KEY `name_44` (`name`),
  UNIQUE KEY `name_45` (`name`),
  UNIQUE KEY `name_46` (`name`),
  UNIQUE KEY `name_47` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name`, `logo`, `website`, `description`, `industry`, `size`, `founded`, `location`, `createdAt`, `updatedAt`, `responseTime`) VALUES
(1, 'Tech Innovators Inc.', 'https://media.licdn.com/dms/image/D4D0BAQF3zJeJBYfVNg/company-logo_200_200/0/1692162043192?e=1728518400&v=beta&t=3qndDKv9XmI56qQHVKCqtrb6rPpgDzt4I9hXC30Npm0', 'https://techinnovators.example.com', 'Una empresa líder en innovación tecnológica.', 'Tecnología', '50-100 empleados', 2010, 'San Francisco, CA', '2024-07-05 06:41:53', '2024-07-05 06:41:53', '5 a 8 Días'),
(2, 'Creative Minds', '', 'https://creativeminds.example.com', 'Una agencia de diseño centrada en el diseño UX/UI y la marca creativa.', 'Diseño', '10-50 empleados', 2015, 'San Francisco, CA', '2024-07-07 11:05:16', '2024-07-07 11:05:16', '1 a 7 Días'),
(3, 'Health Innovators', 'https://media.licdn.com/dms/image/C4D0BAQES8mt_CGGjtQ/company-logo_200_200/0/1630545238101/health_innovators_logo?e=1728518400&v=beta&t=DyUCQlBJF8qpk4rIZ8RfSPPVhZi7HRiJmbXMU7oEHFo', 'https://healthinnovators.example.com', 'Una startup de salud que desarrolla productos de tecnología de salud de vanguardia.', 'Salud', '50-200 empleados', 2018, 'Boston, MA', '2024-07-07 11:06:05', '2024-07-07 11:06:05', '8 a 12 Días'),
(4, 'Green Energy Co.', '', 'https://greenenergyco.example.com', 'Una empresa dedicada a proporcionar soluciones energéticas sostenibles.', 'Energía', '200-500 empleados', 2012, 'Seattle, WA', '2024-07-07 11:06:11', '2024-07-07 11:06:11', '8 a 12 Días');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `joboffers`
--

DROP TABLE IF EXISTS `joboffers`;
CREATE TABLE IF NOT EXISTS `joboffers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contract` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `perks` json DEFAULT NULL,
  `skills` json DEFAULT NULL,
  `companyId` int DEFAULT NULL,
  `userId` int NOT NULL,
  `salary` double NOT NULL,
  `applications` int NOT NULL,
  `salaryCurrency` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `joboffers`
--

INSERT INTO `joboffers` (`id`, `title`, `description`, `location`, `createdAt`, `updatedAt`, `position`, `date`, `role`, `level`, `contract`, `perks`, `skills`, `companyId`, `userId`, `salary`, `applications`, `salaryCurrency`) VALUES
(1, 'Desarrollador Full Stack', 'Buscamos un desarrollador full stack con experiencia en Node.js y React.', 'Remoto', '2024-07-06 20:31:34', '2024-07-06 20:31:34', 'Senior Developer', '2024-02-01 00:00:00', 'Developer', 'Senior', 'Full-time', '[\"Trabajo remoto\", \"Horarios flexibles\", \"Seguro de salud\"]', '[\"JavaScript\", \"Node.js\", \"React\", \"MySQL\"]', 1, 1, 2000, 34, 'USD'),
(2, 'Desarrollador Backend', 'Buscamos un desarrollador backend con experiencia en Node.js y bases de datos SQL.', 'Remoto', '2024-07-07 08:27:58', '2024-07-07 08:27:58', 'Backend Developer', '2024-07-02 00:00:00', 'Developer', 'Mid', 'Full-time', '[\"Seguro médico\", \"Bonos trimestrales\", \"Capacitación continua\"]', '[\"Node.js\", \"Express\", \"SQL\", \"Docker\"]', 2, 1, 1000, 102, 'USD'),
(3, 'Diseñador UX/UI', 'Se necesita un diseñador UX/UI con habilidades para crear interfaces de usuario atractivas y funcionales.', 'Remoto', '2024-07-07 08:28:21', '2024-07-07 08:28:21', 'UX/UI Designer', '2024-07-03 00:00:00', 'Designer', 'Junior', 'Contract', '[\"Trabajo remoto\", \"Horario flexible\", \"Vacaciones pagadas\"]', '[\"Figma\", \"Sketch\", \"Adobe XD\", \"HTML/CSS\"]', 3, 1, 1800000, 22, 'COP'),
(4, 'Gerente de Producto', 'Buscamos un gerente de producto con experiencia en la gestión de ciclos de vida de productos tecnológicos.', 'Madrid, España', '2024-07-07 08:28:38', '2024-07-07 08:28:38', 'Product Manager', '2024-07-04 00:00:00', 'Manager', 'Senior', 'Full-time', '[\"Seguro médico\", \"Bonos de desempeño\", \"Capacitación continua\"]', '[\"Gestión de producto\", \"Scrum\", \"Kanban\", \"JIRA\"]', 2, 1, 1200, 10, 'USD'),
(5, 'Analista de Datos', 'Se requiere un analista de datos para interpretar grandes conjuntos de datos y generar informes útiles.', 'Ciudad de México, México', '2024-07-07 08:29:06', '2024-07-07 08:29:06', 'Data Analyst', '2024-07-05 00:00:00', 'Analyst', 'Mid', 'Full-time', '[\"Trabajo remoto\", \"Horario flexible\", \"Seguro dental\"]', '[\"SQL\", \"Python\", \"Excel\", \"Tableau\"]', 3, 1, 8500000, 2, 'COP'),
(6, 'Ingeniero DevOps', '<div class=\"\">\r<h2 class=\"text-heading-large\">\r               Acerca del empleo\r             </h2>\r \r <!---->            <div class=\"mt4\">\r                 <span><p><!---->ATC, Amapola Tecnologies Corp busca Ingeniero DevOps para la ciudad de Bogotá.<span class=\"white-space-pre\"> </span></p></span><span><p><span class=\"white-space-pre\"> </span><!----><!----></p></span><span><p><span><strong><!---->Objetivo del Rol<!----></strong></span><!---->: Mejorar la colaboración y la entrega continua de software mediante la automatización de procesos y la gestión eficiente de la infraestructura.<!----></p></span><span><p><span><br></span></p></span><span><p><span><strong><!---->Experiencia indispensable en:<!----></strong></span></p></span><span>      <ul><span><li><!---->Automatizar la integración y entrega continua (CI/CD) para facilitar el despliegue rápido y confiable de aplicaciones.<!----></li></span><span><li><!---->Gestionar y optimizar la infraestructura de nube y on-premise usando herramientas como Docker, Kubernetes, etc.<!----></li></span><span><li><!---->Monitorear y mejorar el rendimiento y la disponibilidad de las aplicaciones y servicios.<!----></li></span><span><li><!---->Colaborar estrechamente con equipos de desarrollo y operaciones para fomentar una cultura DevOps.<!----></li></span></ul>\r </span><span><p><span class=\"white-space-pre\"> </span><!----><!----></p></span><span><p><span><strong><!---->Habilidades:<!----></strong></span></p></span><span>      <ul><span><li><!---->Experiencia en automatización de infraestructura y despliegue continuo.<!----></li></span><span><li><!---->Conocimiento profundo de herramientas de configuración y gestión como Ansible, Chef, Puppet, etc.<!----></li></span><span><li><!---->Habilidades avanzadas en scripting y programación para automatización.<!----></li></span><span><li><!---->Capacidad para analizar métricas de rendimiento y optimizar la infraestructura de manera eficiente.<!----></li></span></ul>\r </span><span><p><span><br></span></p></span>\r <!---->            </div>\r           </div>', 'Remoto', '2024-07-07 08:29:16', '2024-07-07 08:29:16', 'DevOps Engineer', '2024-07-07 11:00:16', 'Engineer', 'Senior', 'Full-time', '[\"Trabajo remoto\", \"Seguro médico\", \"Bonos de desempeño\"]', '[\"AWS\", \"Docker\", \"Kubernetes\", \"CI/CD\"]', 1, 1, 2000000, 70, 'COP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `photoUrl` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `email_10` (`email`),
  UNIQUE KEY `email_11` (`email`),
  UNIQUE KEY `email_12` (`email`),
  UNIQUE KEY `email_13` (`email`),
  UNIQUE KEY `email_14` (`email`),
  UNIQUE KEY `email_15` (`email`),
  UNIQUE KEY `email_16` (`email`),
  UNIQUE KEY `email_17` (`email`),
  UNIQUE KEY `email_18` (`email`),
  UNIQUE KEY `email_19` (`email`),
  UNIQUE KEY `email_20` (`email`),
  UNIQUE KEY `email_21` (`email`),
  UNIQUE KEY `email_22` (`email`),
  UNIQUE KEY `email_23` (`email`),
  UNIQUE KEY `email_24` (`email`),
  UNIQUE KEY `email_25` (`email`),
  UNIQUE KEY `email_26` (`email`),
  UNIQUE KEY `email_27` (`email`),
  UNIQUE KEY `email_28` (`email`),
  UNIQUE KEY `email_29` (`email`),
  UNIQUE KEY `email_30` (`email`),
  UNIQUE KEY `email_31` (`email`),
  UNIQUE KEY `email_32` (`email`),
  UNIQUE KEY `email_33` (`email`),
  UNIQUE KEY `email_34` (`email`),
  UNIQUE KEY `email_35` (`email`),
  UNIQUE KEY `email_36` (`email`),
  UNIQUE KEY `email_37` (`email`),
  UNIQUE KEY `email_38` (`email`),
  UNIQUE KEY `email_39` (`email`),
  UNIQUE KEY `email_40` (`email`),
  UNIQUE KEY `email_41` (`email`),
  UNIQUE KEY `email_42` (`email`),
  UNIQUE KEY `email_43` (`email`),
  UNIQUE KEY `email_44` (`email`),
  UNIQUE KEY `email_45` (`email`),
  UNIQUE KEY `email_46` (`email`),
  UNIQUE KEY `email_47` (`email`),
  UNIQUE KEY `email_48` (`email`),
  UNIQUE KEY `email_49` (`email`),
  UNIQUE KEY `email_50` (`email`),
  UNIQUE KEY `email_51` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`, `photoUrl`) VALUES
(1, 'Andrés Felipe Bojacá Santiago', 'andresfelipebs@outlook.com', '$2a$10$tK/PKL0m5ltXq9EaSZ5/EOGIWclDV2cWJvnQxZEe.x8xoVJ8vVm3q', '2024-07-04 23:10:51', '2024-07-04 23:10:51', '');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`jobOfferId`) REFERENCES `joboffers` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `joboffers`
--
ALTER TABLE `joboffers`
  ADD CONSTRAINT `JobOffers_companyId_foreign_idx` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_10` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_12` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_13` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_14` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_15` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_16` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_17` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_18` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_19` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_20` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_21` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_22` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_23` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_24` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_25` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_26` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_27` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_28` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_29` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_3` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_30` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_31` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_32` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_33` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_34` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_35` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_36` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_37` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_38` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_39` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_4` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_40` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_41` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_42` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_43` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_44` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_45` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_46` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_47` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_48` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_49` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_50` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_51` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_52` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_53` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_54` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_55` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_56` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_57` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_58` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_59` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_6` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_60` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_61` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_62` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_63` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_64` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_65` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_66` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_67` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_68` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_69` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_70` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_71` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_72` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_73` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_74` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_75` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_76` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_77` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_78` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_79` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_8` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_80` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_81` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_82` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_83` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_84` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_85` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `joboffers_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `JobOffers_userId_foreign_idx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
