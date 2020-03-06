-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2020 at 02:44 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.28-3+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `der`
--

-- --------------------------------------------------------

--
-- Table structure for table `fase`
--

CREATE TABLE `fase` (
  `id` decimal(10,0) NOT NULL,
  `descripcion` char(60) NOT NULL,
  `id_linea_base` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` decimal(10,0) NOT NULL,
  `nombre` char(45) DEFAULT NULL,
  `descripcion` longtext,
  `historial_cambios` longtext,
  `version` char(10) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `id_linea_base` decimal(10,0) DEFAULT NULL,
  `id_fase` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `linea_base`
--

CREATE TABLE `linea_base` (
  `id` decimal(10,0) NOT NULL,
  `nombre` char(100) DEFAULT NULL,
  `tarea` char(50) DEFAULT NULL,
  `tiempo_estimado` decimal(10,0) DEFAULT NULL,
  `responsable` char(50) DEFAULT NULL,
  `estado` char(40) DEFAULT NULL,
  `id_proyecto` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proyecto`
--

CREATE TABLE `proyecto` (
  `codigo` char(4) NOT NULL,
  `nombre_proyecto` char(45) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin_estimada` date DEFAULT NULL,
  `anho_proyecto` char(4) DEFAULT NULL,
  `estado` char(3) DEFAULT 'PEN',
  `id_fase` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id` decimal(10,0) NOT NULL,
  `nombre_rol` char(30) NOT NULL,
  `descripcion_rol` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rol_permisos`
--

CREATE TABLE `rol_permisos` (
  `id_permiso` decimal(10,0) NOT NULL,
  `id_rol` decimal(10,0) NOT NULL,
  `observacion` char(60) DEFAULT NULL,
  `nombre_permiso` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` decimal(10,0) NOT NULL,
  `nombre` char(30) NOT NULL,
  `apellido` char(30) NOT NULL,
  `correo_electronico` char(40) NOT NULL,
  `nombre_usuario` char(30) NOT NULL,
  `contrasenha` char(8) NOT NULL,
  `descripcion` char(60) DEFAULT NULL,
  `telefono` char(15) NOT NULL,
  `estado` char(9) DEFAULT NULL,
  `ultima_sesion` time DEFAULT NULL,
  `id_rol` decimal(10,0) DEFAULT NULL,
  `id_proyecto` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fase`
--
ALTER TABLE `fase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_linea_base_fk` (`id_linea_base`) USING BTREE;

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_linea_base_fk` (`id_linea_base`),
  ADD KEY `id_fase_fk` (`id_fase`) USING BTREE;

--
-- Indexes for table `linea_base`
--
ALTER TABLE `linea_base`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linea_base_proyecto_fk` (`id_proyecto`);

--
-- Indexes for table `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `id_fase_fk` (`id_fase`) USING BTREE;

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD PRIMARY KEY (`id_permiso`) USING BTREE,
  ADD KEY `rol_permisos_rol_fk` (`id_rol`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_unico` (`nombre_usuario`),
  ADD KEY `usuario_proyecto_fk` (`id_proyecto`),
  ADD KEY `usuario_rol_fk` (`id_rol`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fase`
--
ALTER TABLE `fase`
  ADD CONSTRAINT `fase_ibfk_1` FOREIGN KEY (`id_linea_base`) REFERENCES `linea_base` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_linea_base_fk` FOREIGN KEY (`id_linea_base`) REFERENCES `linea_base` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `linea_base`
--
ALTER TABLE `linea_base`
  ADD CONSTRAINT `linea_base_proyecto_fk` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`id_fase`) REFERENCES `fase` (`id`);

--
-- Constraints for table `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD CONSTRAINT `rol_permisos_rol_fk` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_proyecto_fk` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_rol_fk` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
