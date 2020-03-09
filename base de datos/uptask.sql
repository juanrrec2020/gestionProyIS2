-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-03-2020 a las 17:38:04
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `uptask`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fase`
--
-- Creación: 09-03-2020 a las 17:18:55
--

CREATE TABLE `fase` (
  `id_fase` int(10) NOT NULL,
  `descripcion` char(60) NOT NULL,
  `id_linea_base` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--
-- Creación: 09-03-2020 a las 17:18:17
--

CREATE TABLE `item` (
  `id_item` int(10) NOT NULL,
  `nombre` char(45) DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `historial_cambios` longtext NOT NULL,
  `version` char(10) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `id_linea_base` int(10) DEFAULT NULL,
  `id_fase` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_base`
--
-- Creación: 09-03-2020 a las 17:16:48
--

CREATE TABLE `linea_base` (
  `id_linea_base` int(10) NOT NULL,
  `nombre` char(100) DEFAULT NULL,
  `tarea` char(50) DEFAULT NULL,
  `tiempo_estimado` int(10) DEFAULT NULL,
  `responsable` char(50) DEFAULT NULL,
  `estado` char(40) DEFAULT NULL,
  `id_proyecto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--
-- Creación: 09-03-2020 a las 17:15:49
--

CREATE TABLE `proyecto` (
  `id_proyecto` int(10) NOT NULL,
  `nombre_proyecto` char(45) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin_estimada` date DEFAULT NULL,
  `anho_proyecto` int(11) DEFAULT NULL,
  `estado` char(3) NOT NULL DEFAULT 'PEN',
  `id_fase` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--
-- Creación: 09-03-2020 a las 14:51:58
-- Última actualización: 09-03-2020 a las 17:24:06
--

CREATE TABLE `rol` (
  `id_rol` int(10) NOT NULL,
  `nombre_rol` char(30) NOT NULL,
  `descripcion_rol` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `descripcion_rol`) VALUES
(1, 'Administrador', 'Administrador del sistema - acceso total'),
(2, 'Desarrollador', 'Persona encargada en el desarrollo de los proyectos'),
(3, 'Consulta', 'Consulta sobre el estado de un proyecto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permisos`
--
-- Creación: 09-03-2020 a las 17:14:56
-- Última actualización: 09-03-2020 a las 17:25:40
--

CREATE TABLE `rol_permisos` (
  `id_permiso` int(10) NOT NULL,
  `id_rol` int(10) NOT NULL,
  `observacion` char(60) DEFAULT NULL,
  `nombre_permiso` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol_permisos`
--

INSERT INTO `rol_permisos` (`id_permiso`, `id_rol`, `observacion`, `nombre_permiso`) VALUES
(1, 1, NULL, 'Permiso total'),
(2, 3, NULL, 'permiso consulta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 09-03-2020 a las 17:13:05
-- Última actualización: 09-03-2020 a las 17:28:15
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nombre` char(30) NOT NULL,
  `apellido` char(30) NOT NULL,
  `correo_electronico` char(40) NOT NULL,
  `descripcion` char(60) DEFAULT NULL,
  `telefono` char(15) NOT NULL,
  `estado` char(9) DEFAULT NULL,
  `ultima_sesion` time DEFAULT NULL,
  `id_rol` int(10) DEFAULT NULL,
  `id_proyecto` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `nombre`, `apellido`, `correo_electronico`, `descripcion`, `telefono`, `estado`, `ultima_sesion`, `id_rol`, `id_proyecto`) VALUES
(9, 'admin', '$2y$12$DQuF.qjNZmWueB7qkifJze.qS8t8xLHfEpYZHA2h1v43smFK8dKPa', '', '', '', NULL, '', NULL, NULL, NULL, NULL),
(12, 'jorge', '$2y$12$Vt.ER7oMZCFt8JDdVpBHi.uABUy14lEbec.nqMoPdvYqDB6TeHMYW', 'Jorge', 'Gauto', 'jorgegauto@gmail.com', 'descripcion', '0981-999999', 'estado', '25:01:08', 3, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fase`
--
ALTER TABLE `fase`
  ADD PRIMARY KEY (`id_fase`),
  ADD UNIQUE KEY `id_linea_base` (`id_linea_base`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD UNIQUE KEY `id_linea_base` (`id_linea_base`,`id_fase`);

--
-- Indices de la tabla `linea_base`
--
ALTER TABLE `linea_base`
  ADD PRIMARY KEY (`id_linea_base`),
  ADD UNIQUE KEY `id_proyecto` (`id_proyecto`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD UNIQUE KEY `id_fase` (`id_fase`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD UNIQUE KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_rol` (`id_rol`,`id_proyecto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fase`
--
ALTER TABLE `fase`
  MODIFY `id_fase` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `linea_base`
--
ALTER TABLE `linea_base`
  MODIFY `id_linea_base` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id_proyecto` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  MODIFY `id_permiso` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
