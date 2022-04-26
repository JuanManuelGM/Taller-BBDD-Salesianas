-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 26-04-2022 a las 17:22:02
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pandemia`
--

CREATE DATABASE PANDEMIA;

USE PANDEMIA;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ID_CIUDAD` int(6) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `PROVINCIA` varchar(30) DEFAULT NULL,
  `POBLACION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`ID_CIUDAD`, `NOMBRE`, `PROVINCIA`, `POBLACION`) VALUES
(1, 'Madrid', 'Madrid', 3305408),
(2, 'Barcelona', 'Barcelona', 1636732),
(3, 'Valencia', 'Valencia', 789744),
(4, 'Sevilla', 'Sevilla', 684234),
(5, 'Zaragoza', 'Zaragoza', 675301),
(6, 'Málaga', 'Málaga', 577405),
(7, 'Murcia', 'Murcia', 460349),
(8, 'Palma de Mallorca', 'Islas Baleares', 419366),
(9, 'Las Palmas de Gran Canaria', 'Las Palmas', 378675),
(10, 'Bilbao', 'Vizcaya', 346405),
(11, 'Alicante', 'Alicante', 337304),
(12, 'Córdoba', 'Córdoba', 322071),
(13, 'Valladolid', 'Valladolid', 297775),
(14, 'Vigo', 'Pontevedra', 293837),
(15, 'Gijón', 'Asturias', 268896),
(16, 'Hospitalet de Llobregat', 'Barcelona', 264657),
(17, 'Vitoria', 'Álaba', 253093),
(18, 'La Corunia', 'La Corunia', 245468),
(19, 'Elche', 'Alicante', 234205),
(20, 'Granada', 'Granada', 231775),
(21, 'Tarrasa', 'Barcelona', 223011),
(22, 'Badalona', 'Barcelona', 223006),
(23, 'Oviedo', 'Asturias', 217552),
(24, 'Cartagena', 'Murcia', 216365),
(25, 'Sabadell', 'Barcelona', 216204),
(26, 'Jerez de la Frontera', 'Cádiz', 212801),
(27, 'Móstoles', 'Madrid', 209639),
(28, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 208563),
(29, 'Pamplona', 'Navarra', 203081),
(30, 'Almería', 'Almería', 200753),
(31, 'Alcalá de Henares', 'Madrid', 195982),
(32, 'Fuenlabrada', 'Madrid', 192233),
(33, 'San Sebastián', 'Guipúzcoa', 188102),
(34, 'Leganés', 'Madrid', 187762),
(35, 'Getafe', 'Madrid', 183095),
(36, 'Burgos', 'Burgos', 174051),
(37, 'Albacete', 'Albacete', 172722),
(38, 'Castellón de la Plana', 'Castellón', 172589),
(39, 'Santander', 'Cantabria', 172221),
(40, 'Alcorcón', 'Madrid', 170817),
(41, 'San Cristóbal de la Laguna', 'Santa Cruz de Tenerife', 158010),
(42, 'Logroño', 'La Rioja', 150808),
(43, 'Badajoz', 'Badajoz', 150610),
(44, 'Marbella', 'Málaga', 147958),
(45, 'Salamanca', 'Salamanca', 143269),
(46, 'Huelva', 'Huelva', 142538),
(47, 'Lérida', 'Lérida', 140080),
(48, 'Dos Hermanas', 'Sevilla', 136250),
(49, 'Tarragona', 'Tarragona', 135436),
(50, 'Torrejón de Ardoz', 'Madrid', 132771);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contagios`
--

CREATE TABLE `contagios` (
  `ID_RECUENTO_CONT` int(8) NOT NULL,
  `CONTAGIOS_TOTALES` int(11) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ID_CIUDAD` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospitalizaciones`
--

CREATE TABLE `hospitalizaciones` (
  `ID_RECUENTO_HOS` int(8) NOT NULL,
  `CONTAGIOS_TOTALES` int(11) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ID_CIUDAD` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `ID_PROVINCIA` int(6) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `COMUNIDAD_AUTONOMA` varchar(30) DEFAULT NULL,
  `POBLACION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`ID_PROVINCIA`, `NOMBRE`, `COMUNIDAD_AUTONOMA`, `POBLACION`) VALUES
(1, 'Madrid', 'Comunidad de Madrid', 6736407),
(2, 'Barcelona', 'Cataluña', 5629629),
(3, 'Valencia', 'Comunidad Valenciana', 2577506),
(4, 'Sevilla', 'Andalucía', 1958922),
(5, 'Alicante', 'Comunidad Valenciana', 1897848),
(6, 'Málaga', 'Andalucía', 1700752),
(7, 'Murcia', 'Región de Murcia', 1516055),
(8, 'Cádiz', 'Andalucía', 1257785),
(9, 'Baleares', 'Islas Baleares', 1219404),
(10, 'Las Palmas', 'Canarias', 1152224),
(11, 'Vizcaya', 'País Vasco', 1134616),
(12, 'La Coruña', 'Galicia', 1119957),
(13, 'Santa Cruz de Tenerife', 'Canarias', 1094146),
(14, 'Asturias', 'Asturias', 1008897),
(15, 'Zaragoza', 'Aragón', 972528),
(16, 'Pontevedra', 'Galicia', 941995),
(17, 'Granada', 'Andalucía', 928357),
(18, 'Tarragona', 'Cataluña', 821413),
(19, 'Córdoba', 'Andalucía', 779009),
(20, 'Gerona', 'Cataluña', 773577),
(21, 'Almería', 'Andalucía', 720033),
(22, 'Guipúzcoa', 'País Vasco', 713810),
(23, 'Toledo', 'Castilla-La Mancha', 704532),
(24, 'Badajoz', 'Extremadura', 667620),
(25, 'Navarra', 'Navarra', 656836),
(26, 'Jaén', 'Andalucía', 623981),
(27, 'Cantabria', 'Cantabria', 583684),
(28, 'Castellón', 'Comunidad Valenciana', 575897),
(29, 'Huelva', 'Andalucía', 531969),
(30, 'Valladolid', 'Castilla y León', 517360),
(31, 'Ciudad Real', 'Castilla-La Mancha', 490576),
(32, 'León', 'Castilla y León', 453295),
(33, 'Lérida', 'Cataluña', 435911),
(34, 'Albacete', 'Castilla-La Mancha', 388025),
(35, 'Cáceres', 'Extremadura', 387159),
(36, 'Burgos', 'Castilla y León', 353687),
(37, 'Álava', 'País Vasco', 329228),
(38, 'Salamanca', 'Castilla y León', 326464),
(39, 'Lugo', 'Galicia', 325194),
(40, 'La Rioja', 'La Rioja', 315811),
(41, 'Orense', 'Galicia', 304068),
(42, 'Guadalajara', 'Castilla-La Mancha', 265508),
(43, 'Huesca', 'Aragón', 221993),
(44, 'Cuenca', 'Castilla-La Mancha', 199080),
(45, 'Zamora', 'Castilla y León', 168661),
(46, 'Ávila', 'Castilla y León', 159413),
(47, 'Palencia', 'Castilla y León', 157701),
(48, 'Segovia', 'Castilla y León', 153909),
(49, 'Teruel', 'Aragón', 133109),
(50, 'Soria', 'Castilla y León', 89041),
(51, 'Melilla', 'Melilla', 83489),
(52, 'Ceuta', 'Ceuta', 82787);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunaciones`
--

CREATE TABLE `vacunaciones` (
  `ID_RECUENTO_VAC` int(8) NOT NULL,
  `VACUNACIONES_TOTALES` int(11) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ID_CIUDAD` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ID_CIUDAD`);

--
-- Indices de la tabla `contagios`
--
ALTER TABLE `contagios`
  ADD PRIMARY KEY (`ID_RECUENTO_CONT`,`ID_CIUDAD`),
  ADD KEY `ID_CIUDAD` (`ID_CIUDAD`);

--
-- Indices de la tabla `hospitalizaciones`
--
ALTER TABLE `hospitalizaciones`
  ADD PRIMARY KEY (`ID_RECUENTO_HOS`,`ID_CIUDAD`),
  ADD KEY `ID_CIUDAD` (`ID_CIUDAD`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`ID_PROVINCIA`);

--
-- Indices de la tabla `vacunaciones`
--
ALTER TABLE `vacunaciones`
  ADD PRIMARY KEY (`ID_RECUENTO_VAC`,`ID_CIUDAD`),
  ADD KEY `ID_CIUDAD` (`ID_CIUDAD`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contagios`
--
ALTER TABLE `contagios`
  ADD CONSTRAINT `contagios_ibfk_1` FOREIGN KEY (`ID_CIUDAD`) REFERENCES `ciudad` (`ID_CIUDAD`);

--
-- Filtros para la tabla `hospitalizaciones`
--
ALTER TABLE `hospitalizaciones`
  ADD CONSTRAINT `hospitalizaciones_ibfk_1` FOREIGN KEY (`ID_CIUDAD`) REFERENCES `ciudad` (`ID_CIUDAD`);

--
-- Filtros para la tabla `vacunaciones`
--
ALTER TABLE `vacunaciones`
  ADD CONSTRAINT `vacunaciones_ibfk_1` FOREIGN KEY (`ID_CIUDAD`) REFERENCES `ciudad` (`ID_CIUDAD`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
