# MySQL-Front 5.0  (Build 1.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: agua
# ------------------------------------------------------
# Server version 5.5.27

#
# Table structure for table detalle_planilla
#

DROP TABLE IF EXISTS `detalle_planilla`;
CREATE TABLE `detalle_planilla` (
  `Id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `Id_planilla` int(11) DEFAULT NULL,
  `valor` double(4,2) DEFAULT NULL,
  PRIMARY KEY (`Id_detalle`),
  KEY `fk_Id_planilla` (`Id_planilla`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
INSERT INTO `detalle_planilla` VALUES (1,4,12.3);
INSERT INTO `detalle_planilla` VALUES (2,7,2.5);
INSERT INTO `detalle_planilla` VALUES (3,1,2.9);
INSERT INTO `detalle_planilla` VALUES (4,1,2.9);
INSERT INTO `detalle_planilla` VALUES (5,7,2.5);
INSERT INTO `detalle_planilla` VALUES (6,2,3);
INSERT INTO `detalle_planilla` VALUES (7,7,2.5);
INSERT INTO `detalle_planilla` VALUES (8,13,2.4);
INSERT INTO `detalle_planilla` VALUES (9,12,2.4);
INSERT INTO `detalle_planilla` VALUES (10,14,2.4);
INSERT INTO `detalle_planilla` VALUES (11,15,2.4);
INSERT INTO `detalle_planilla` VALUES (12,16,2.4);
INSERT INTO `detalle_planilla` VALUES (13,17,2.4);
INSERT INTO `detalle_planilla` VALUES (14,18,2.4);
INSERT INTO `detalle_planilla` VALUES (15,19,2.4);
INSERT INTO `detalle_planilla` VALUES (16,20,2.4);
INSERT INTO `detalle_planilla` VALUES (17,21,2.5);
INSERT INTO `detalle_planilla` VALUES (18,22,2.4);
INSERT INTO `detalle_planilla` VALUES (19,23,2.4);
INSERT INTO `detalle_planilla` VALUES (20,24,2.4);
INSERT INTO `detalle_planilla` VALUES (21,26,0.42);
INSERT INTO `detalle_planilla` VALUES (22,27,0.38);
INSERT INTO `detalle_planilla` VALUES (23,28,3.94);
INSERT INTO `detalle_planilla` VALUES (24,29,0.38);
INSERT INTO `detalle_planilla` VALUES (25,30,3.9);
/*!40000 ALTER TABLE `detalle_planilla` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table login
#

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `Id_login` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(40) DEFAULT NULL,
  `clave` varchar(40) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
INSERT INTO `login` VALUES (1,'diego','12345','admin');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table medidor
#

DROP TABLE IF EXISTS `medidor`;
CREATE TABLE `medidor` (
  `numero_medidor` int(11) NOT NULL AUTO_INCREMENT,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`numero_medidor`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
INSERT INTO `medidor` VALUES (1,'1');
INSERT INTO `medidor` VALUES (2,'1');
INSERT INTO `medidor` VALUES (3,'1');
INSERT INTO `medidor` VALUES (4,'1');
INSERT INTO `medidor` VALUES (5,'1');
INSERT INTO `medidor` VALUES (6,'1');
INSERT INTO `medidor` VALUES (7,'1');
INSERT INTO `medidor` VALUES (8,'1');
INSERT INTO `medidor` VALUES (9,'1');
INSERT INTO `medidor` VALUES (10,'1');
INSERT INTO `medidor` VALUES (11,'1');
INSERT INTO `medidor` VALUES (12,'1');
INSERT INTO `medidor` VALUES (13,'1');
INSERT INTO `medidor` VALUES (14,'1');
INSERT INTO `medidor` VALUES (15,'1');
INSERT INTO `medidor` VALUES (16,'1');
INSERT INTO `medidor` VALUES (17,'1');
INSERT INTO `medidor` VALUES (18,'1');
/*!40000 ALTER TABLE `medidor` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table numero
#

DROP TABLE IF EXISTS `numero`;
CREATE TABLE `numero` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
INSERT INTO `numero` VALUES (1,8);
/*!40000 ALTER TABLE `numero` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table planilla
#

DROP TABLE IF EXISTS `planilla`;
CREATE TABLE `planilla` (
  `Id_planilla` int(16) NOT NULL AUTO_INCREMENT,
  `Id_socio` int(11) DEFAULT NULL,
  `fecha_emision` varchar(15) DEFAULT NULL,
  `fecha_pago` varchar(15) DEFAULT NULL,
  `metros_Consumo` double(4,2) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Id_planilla`),
  KEY `fk_Id_socio` (`Id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
INSERT INTO `planilla` VALUES (1,1,'2019-09-17','2019-09-30',1.45,'C');
INSERT INTO `planilla` VALUES (2,3,'2019-09-18','2019-09-30',1.5,'C');
INSERT INTO `planilla` VALUES (3,10,'2019-09-17','2019-09-30',1.3,'D');
INSERT INTO `planilla` VALUES (4,4,'2019-09-18','2019-09-30',1.85,'C');
INSERT INTO `planilla` VALUES (5,11,'2019-09-18','2019-09-30',1.55,'D');
INSERT INTO `planilla` VALUES (6,10,'2019-09-24','2019-09-30',1.2,'D');
INSERT INTO `planilla` VALUES (7,15,'2019-10-3','2019-10-31',1.25,'C');
INSERT INTO `planilla` VALUES (8,13,'2019-10-6','2019-10-31',1.2,NULL);
INSERT INTO `planilla` VALUES (9,13,'2019-10-6','2019-10-31',1.2,NULL);
INSERT INTO `planilla` VALUES (10,13,'2019-10-6','2019-10-31',1.2,NULL);
INSERT INTO `planilla` VALUES (11,15,'2019-10-7','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (12,15,'2019-10-7','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (13,14,'2019-10-16','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (14,15,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (15,15,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (16,14,'2019-10-16','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (17,15,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (18,15,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (19,14,'2019-10-16','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (20,15,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (21,15,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (22,15,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (23,15,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (24,4,'2019-10-8','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (25,14,'2019-10-16','2019-10-31',1.2,'D');
INSERT INTO `planilla` VALUES (26,1,'2019-10-9','2019-10-31',1.3,'C');
INSERT INTO `planilla` VALUES (27,15,'2019-10-10','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (28,17,'2019-10-15','2019-10-31',12.3,'C');
INSERT INTO `planilla` VALUES (29,17,'2019-10-16','2019-10-31',1.2,'C');
INSERT INTO `planilla` VALUES (30,15,'2019-10-16','2019-10-31',12.2,'C');
/*!40000 ALTER TABLE `planilla` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table socios
#

DROP TABLE IF EXISTS `socios`;
CREATE TABLE `socios` (
  `Id_socio` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `numero_medidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_socio`),
  KEY `fk_numero_medidor` (`numero_medidor`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
INSERT INTO `socios` VALUES (1,'0707012605','ALEJANDRA','SANCHEZ','PASAJE','0979843800','1',1);
INSERT INTO `socios` VALUES (2,'0707012609','ANDRES','PONCE','PASAJE','0979843500','0',3);
INSERT INTO `socios` VALUES (3,'0707012891','MATEO','RODRIGUEZ','BUENAVISTA','0979843533','1',2);
INSERT INTO `socios` VALUES (4,'0707012465','ALEJANDRA','PEREZ','SANTA ELENA','0987564534','1',5);
INSERT INTO `socios` VALUES (5,'0707012609','ANDRES','PONCE','PASAJE','0979843500','0',NULL);
INSERT INTO `socios` VALUES (6,'0707012705','PEDRO','SANCHEZ','PASAJE','0979843533','0',NULL);
INSERT INTO `socios` VALUES (7,'0707012460','MARIA','AYALA','SANTA ROSA','0979843531','0',10);
INSERT INTO `socios` VALUES (9,'0978958756','ANDRES','PONCE','BUENAVISTA','0979843533','0',NULL);
INSERT INTO `socios` VALUES (10,'0707012460','MARIA','AYALA','SANTA ROSA','0979843531','0',10);
INSERT INTO `socios` VALUES (11,'0984673683','FERNANDO','MIRANDA','PASAJE','0992294342','0',11);
INSERT INTO `socios` VALUES (12,'0707012605','RODRIGO','SANTOS','BUENAVISTA','132435','0',12);
INSERT INTO `socios` VALUES (13,'0703887273','LOURDES','PESANTEZ','COCHA','0809787563','1',10);
INSERT INTO `socios` VALUES (14,'0705838993','PERUANO','MAGUIBER','MI CASA','01234556','1',14);
INSERT INTO `socios` VALUES (15,'0926908633','JOSE','PLUTARCO','PASAJE','1123436574','1',15);
INSERT INTO `socios` VALUES (16,'0703989781','DOLORES','DURCA','PASAJE','0979843533','0',16);
INSERT INTO `socios` VALUES (17,'0706727906','SHEYLA','GOMEZ','GUABO','0979843500','1',17);
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table detalle_planilla
#

ALTER TABLE `detalle_planilla`
ADD CONSTRAINT `fk_Id_planilla` FOREIGN KEY (`Id_planilla`) REFERENCES `planilla` (`Id_planilla`);

#
#  Foreign keys for table planilla
#

ALTER TABLE `planilla`
ADD CONSTRAINT `fk_Id_socio` FOREIGN KEY (`Id_socio`) REFERENCES `socios` (`Id_socio`);

#
#  Foreign keys for table socios
#

ALTER TABLE `socios`
ADD CONSTRAINT `fk_numero_medidor` FOREIGN KEY (`numero_medidor`) REFERENCES `medidor` (`numero_medidor`);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
