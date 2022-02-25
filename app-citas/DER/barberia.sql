-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-02-2022 a las 13:00:20
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barberia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `visible` int NOT NULL,
  `fechar` datetime NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `id_tipo_documento` int NOT NULL,
  `numero_documento` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `visible` int NOT NULL,
  `fechar` datetime NOT NULL,
  `id_cargo` int NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `fk2_id_persona` (`id_cargo`) USING BTREE,
  KEY `fk_id_persona` (`id_tipo_documento`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_servicios` int NOT NULL,
  `id_persona` int NOT NULL,
  `visible` int NOT NULL,
  `fechar` datetime NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_id_reserva` (`id_persona`) USING BTREE,
  KEY `fk1_id_reserva` (`id_servicios`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE IF NOT EXISTS `servicios` (
  `id_servicios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  `duracion` time NOT NULL,
  `visible` int NOT NULL,
  `fechar` datetime NOT NULL,
  PRIMARY KEY (`id_servicios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_documento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `visible` int NOT NULL,
  `fechar` datetime NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_documento`, `nombre`, `visible`, `fechar`) VALUES
(1, 'Cedula', 1, '2022-02-07 07:40:42'),
(2, 'Tarjeta de Identidad', 2, '2022-02-07 07:41:03');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk2_persona` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_persona` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk1_reserva` FOREIGN KEY (`id_servicios`) REFERENCES `servicios` (`id_servicios`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_reserva` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
