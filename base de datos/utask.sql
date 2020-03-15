-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.24


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema uptask
--

CREATE DATABASE IF NOT EXISTS uptask;
USE uptask;

--
-- Definition of table `fase`
--

DROP TABLE IF EXISTS `fase`;
CREATE TABLE `fase` (
  `id_fase` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` char(60) NOT NULL,
  `id_linea_base` int(10) NOT NULL,
  PRIMARY KEY (`id_fase`),
  UNIQUE KEY `id_linea_base` (`id_linea_base`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fase`
--

/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
/*!40000 ALTER TABLE `fase` ENABLE KEYS */;


--
-- Definition of table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id_item` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` char(45) DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `historial_cambios` longtext NOT NULL,
  `version` char(10) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `id_linea_base` int(10) DEFAULT NULL,
  `id_fase` int(10) NOT NULL,
  PRIMARY KEY (`id_item`),
  UNIQUE KEY `id_linea_base` (`id_linea_base`,`id_fase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


--
-- Definition of table `linea_base`
--

DROP TABLE IF EXISTS `linea_base`;
CREATE TABLE `linea_base` (
  `id_linea_base` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) DEFAULT NULL,
  `tarea` char(50) DEFAULT NULL,
  `tiempo_estimado` int(10) DEFAULT NULL,
  `responsable` char(50) DEFAULT NULL,
  `estado` char(40) DEFAULT NULL,
  `id_proyecto` int(10) NOT NULL,
  PRIMARY KEY (`id_linea_base`),
  UNIQUE KEY `id_proyecto` (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `linea_base`
--

/*!40000 ALTER TABLE `linea_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `linea_base` ENABLE KEYS */;


--
-- Definition of table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE `proyecto` (
  `id_proyecto` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` char(45) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin_estimada` date DEFAULT NULL,
  `anho_proyecto` int(11) DEFAULT NULL,
  `estado` char(3) NOT NULL DEFAULT 'PEN',
  `id_fase` int(10) NOT NULL,
  PRIMARY KEY (`id_proyecto`),
  UNIQUE KEY `id_fase` (`id_fase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proyecto`
--

/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;


--
-- Definition of table `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id_rol` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_rol` char(30) NOT NULL,
  `descripcion_rol` char(60) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol`
--

/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id_rol`,`nombre_rol`,`descripcion_rol`) VALUES 
 (1,'Administrador','Administrador del sistema - acceso total'),
 (2,'Desarrollador','Persona encargada en el desarrollo de los proyectos'),
 (3,'Consulta','Consulta sobre el estado de un proyecto');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


--
-- Definition of table `rol_permisos`
--

DROP TABLE IF EXISTS `rol_permisos`;
CREATE TABLE `rol_permisos` (
  `id_permiso` int(10) NOT NULL AUTO_INCREMENT,
  `id_rol` int(10) NOT NULL,
  `observacion` char(60) DEFAULT NULL,
  `nombre_permiso` char(60) NOT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol_permisos`
--

/*!40000 ALTER TABLE `rol_permisos` DISABLE KEYS */;
INSERT INTO `rol_permisos` (`id_permiso`,`id_rol`,`observacion`,`nombre_permiso`) VALUES 
 (1,1,NULL,'Permiso total'),
 (2,3,NULL,'permiso consulta');
/*!40000 ALTER TABLE `rol_permisos` ENABLE KEYS */;


--
-- Definition of table `sequence_data`
--

DROP TABLE IF EXISTS `sequence_data`;
CREATE TABLE `sequence_data` (
  `nombre` varchar(50) DEFAULT NULL,
  `incremento` int(11) NOT NULL DEFAULT '1',
  `min_valor` int(11) NOT NULL DEFAULT '1',
  `max_valor` bigint(20) NOT NULL DEFAULT '9223372036854775807',
  `cur_valor` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sequence_data`
--

/*!40000 ALTER TABLE `sequence_data` DISABLE KEYS */;
INSERT INTO `sequence_data` (`nombre`,`incremento`,`min_valor`,`max_valor`,`cur_valor`) VALUES 
 ('SEC_ID',1,1,9223372036854775807,3);
/*!40000 ALTER TABLE `sequence_data` ENABLE KEYS */;


--
-- Definition of table `usu_rol_pro`
--

DROP TABLE IF EXISTS `usu_rol_pro`;
CREATE TABLE `usu_rol_pro` (
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `id_rol` int(11) NOT NULL DEFAULT '0',
  `id_proyecto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_usuario`,`id_rol`),
  KEY `FK_usu_rol_pro_2` (`id_rol`),
  CONSTRAINT `FK_usu_rol_pro_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK_usu_rol_pro_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usu_rol_pro`
--

/*!40000 ALTER TABLE `usu_rol_pro` DISABLE KEYS */;
/*!40000 ALTER TABLE `usu_rol_pro` ENABLE KEYS */;


--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `id_proyecto` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_rol` (`id_rol`,`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`,`usuario`,`password`,`nombre`,`apellido`,`correo_electronico`,`descripcion`,`telefono`,`estado`,`ultima_sesion`,`id_rol`,`id_proyecto`) VALUES 
 (9,'admin','$2y$12$DQuF.qjNZmWueB7qkifJze.qS8t8xLHfEpYZHA2h1v43smFK8dKPa','','','',NULL,'',NULL,NULL,NULL,NULL),
 (12,'jorge','$2y$12$Vt.ER7oMZCFt8JDdVpBHi.uABUy14lEbec.nqMoPdvYqDB6TeHMYW','Jorge','Gauto','jorgegauto@gmail.com','descripcion','0981-999999','estado','25:01:08',3,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


--
-- Definition of function `fn_CURVALUE`
--

DROP FUNCTION IF EXISTS `fn_CURVALUE`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_CURVALUE`(VSEC_NAME VARCHAR(11)) RETURNS bigint(20)
BEGIN
   DECLARE EXIST_SEC INT;
   DECLARE VCUR_VALOR BIGINT(20);

   SET EXIST_SEC = (SELECT count(1) FROM sequence_data where nombre = VSEC_NAME);
   SET VCUR_VALOR = NULL;

   IF EXIST_SEC > 0 THEN
      SET VCUR_VALOR = (SELECT CUR_VALOR FROM sequence_data where nombre = VSEC_NAME);
   END IF;



   RETURN VCUR_VALOR;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `fn_NEXTVALUE`
--

DROP FUNCTION IF EXISTS `fn_NEXTVALUE`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_NEXTVALUE`(VSEC_NAME VARCHAR(50)) RETURNS bigint(20)
BEGIN
   DECLARE EXIST_SEC INT;
   DECLARE VCUR_VALOR BIGINT(20);

   SET EXIST_SEC = (SELECT count(1) FROM sequence_data where nombre = VSEC_NAME);

   IF EXIST_SEC > 0 THEN
      UPDATE sequence_data
      SET CUR_VALOR = IF (  (IFNULL(CUR_VALOR,0)+INCREMENTO) < MAX_VALOR,
                             IFNULL(CUR_VALOR,0)+INCREMENTO,
                             MAX_VALOR);
   END IF;

   SET VCUR_VALOR = (SELECT CUR_VALOR FROM sequence_data where nombre = VSEC_NAME);

   RETURN VCUR_VALOR;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
