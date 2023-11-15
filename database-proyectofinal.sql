CREATE DATABASE  IF NOT EXISTS `databasempc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `databasempc`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: databasempc
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'categoria1','descripcion'),(2,'categoria2','descripcion'),(3,'categoria3','descripcion'),(5,'categoria4','descripcion'),(7,'categoria6','descripcion');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleador`
--

DROP TABLE IF EXISTS `empleador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleador` (
  `usuario` int NOT NULL,
  `mision` varchar(45) DEFAULT NULL,
  `vision` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`),
  CONSTRAINT `empleador_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleador`
--

LOCK TABLES `empleador` WRITE;
/*!40000 ALTER TABLE `empleador` DISABLE KEYS */;
INSERT INTO `empleador` VALUES (1,'mision1','vision1');
/*!40000 ALTER TABLE `empleador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrevista`
--

DROP TABLE IF EXISTS `entrevista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrevista` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `direccion` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `notas` varchar(45) NOT NULL,
  `solicitante` int NOT NULL,
  `oferta` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `solicitante` (`solicitante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrevista`
--

LOCK TABLES `entrevista` WRITE;
/*!40000 ALTER TABLE `entrevista` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrevista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta`
--

DROP TABLE IF EXISTS `oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `f_limite` datetime NOT NULL,
  `empresa` int NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  `f_publicacion` datetime NOT NULL,
  `contratado` int DEFAULT NULL,
  `modalidad` varchar(45) NOT NULL,
  `comision` varchar(45) NOT NULL,
  `detalles` varchar(45) DEFAULT NULL,
  `salario_min` int unsigned NOT NULL,
  `salario_max` int unsigned NOT NULL,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `empresa` (`empresa`),
  KEY `contratado` (`contratado`),
  CONSTRAINT `oferta_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empleador` (`usuario`),
  CONSTRAINT `oferta_ibfk_2` FOREIGN KEY (`contratado`) REFERENCES `solicitante` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta`
--

LOCK TABLES `oferta` WRITE;
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
INSERT INTO `oferta` VALUES (1,'descripcion1','ACTIVA','Oferta1','2023-04-12 00:00:00',1,'ubicacion1','2023-03-12 00:00:00',NULL,'MIXTA','75','detalles',4000,4500,'1'),(2,'descripcion2','ACTIVA','Oferta2','2023-04-12 00:00:00',1,'ubicacion2','2023-03-12 00:00:00',NULL,'REMOTO','75','detalles',4000,4500,'1'),(3,'descripcion3','ACTIVA','Oferta3','2023-06-12 00:00:00',1,'ubicacion3','2023-05-14 00:00:00',NULL,'REMOTO','75','detalles',4000,4500,'1'),(4,'descripcion4','ACTIVA','Oferta4','2023-10-25 00:00:00',1,'ubicacion4','2023-10-20 00:00:00',NULL,'PRESENCIAL','75','detalles',4000,4500,'1'),(5,'descripcion5','ACTIVA','Oferta5','2023-04-12 00:00:00',1,'ubicacion5','2023-03-09 00:00:00',NULL,'PRESENCIAL','75','detalles',4000,4500,'1'),(6,'descripcion6','ACTIVA','Oferta6','2023-08-12 00:00:00',1,'ubicacion1','2023-06-21 00:00:00',NULL,'PRESENCIAL','75','detalles',4000,4500,'1'),(7,'descripcion7','ACTIVA','Oferta7','2023-07-14 00:00:00',1,'ubicacion7','2023-07-12 00:00:00',NULL,'PRESENCIAL','75','detalles',4000,4500,'1'),(8,'descripcion8','ACTIVA','Oferta8','2023-09-12 00:00:00',1,'ubicacion8','2023-07-13 00:00:00',NULL,'PRESENCIAL','75','detalles',4000,4500,'1'),(9,'descripcion9','ACTIVA','Oferta9','2023-06-21 00:00:00',1,'ubicacion9','2023-06-20 00:00:00',NULL,'PRESENCIAL','75','detalles',4000,4500,'1'),(10,'descripcion10','ACTIVA','Oferta10','2023-04-12 00:00:00',1,'ubicacion2','2023-08-10 00:00:00',NULL,'PRESENCIAL','75','detalles',4000,4500,'1'),(11,'descripcion11','ACTIVA','Oferta11','2023-04-12 00:00:00',1,'ubicacion1','2023-02-12 00:00:00',NULL,'MIXTA','75','detalles',4000,4500,'1'),(12,'descripcion12','ACTIVA','Oferta12','2023-11-18 00:00:00',1,'ubicacion12','2023-11-08 00:00:00',NULL,'MIXTA','75','detalles',4000,4500,'1');
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferencias`
--

DROP TABLE IF EXISTS `preferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferencias` (
  `usuario` int NOT NULL,
  `categoria` int NOT NULL,
  `codigo` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigo`),
  KEY `usuario` (`usuario`),
  KEY `categoria` (`categoria`),
  CONSTRAINT `preferencias_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `solicitante` (`usuario`),
  CONSTRAINT `preferencias_ibfk_2` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencias`
--

LOCK TABLES `preferencias` WRITE;
/*!40000 ALTER TABLE `preferencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitante`
--

DROP TABLE IF EXISTS `solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitante` (
  `curriculum` blob,
  `usuario` int NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitante`
--

LOCK TABLES `solicitante` WRITE;
/*!40000 ALTER TABLE `solicitante` DISABLE KEYS */;
INSERT INTO `solicitante` VALUES (NULL,0),(NULL,2),(NULL,4),(NULL,5),(NULL,7),(NULL,8),(NULL,9);
/*!40000 ALTER TABLE `solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `codigo_oferta` int NOT NULL,
  `usuario_solicitante` int NOT NULL,
  `mensaje` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo_oferta`,`usuario_solicitante`),
  KEY `solicitudes_ibfk_1_idx` (`usuario_solicitante`),
  CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`usuario_solicitante`) REFERENCES `solicitante` (`usuario`),
  CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`codigo_oferta`) REFERENCES `oferta` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (4,2,'dsfsd','RECIBIDA'),(4,4,'este es un mensaje 223','RECIBIDA'),(4,5,'este es un mensaje 223','RECIBIDA'),(8,4,'este es un mensaje 223','ACEPTADA'),(12,2,'dssdfffsdfd','RECIBIDA'),(12,4,'este es un mensaje 223','RECIBIDA');
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `numero` int unsigned NOT NULL,
  `titular` varchar(45) NOT NULL,
  `CV` int unsigned NOT NULL,
  `usuario_propietario` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numero`),
  KEY `usuario_propietario` (`usuario_propietario`),
  CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`usuario_propietario`) REFERENCES `empleador` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `cui` char(13) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'nombre1','direccon1','1234567891234','correo1','telefono1','2008-07-04','123','username1','2'),(2,'nombre2','direccon2','1000000000000','correo2','telefono2','2008-07-04','123','username2','3'),(4,'nombre3','direccon3','1000230000000','correo3','telefono3','2004-05-24','321','username2','3'),(5,'nombre5','direccon5','5000230000000','correo5','telefono5','2005-05-25','351','username5','3'),(6,'nombre8','direccon5','1234555551234','correo8','telefono8','2005-07-04','123','username5','3'),(7,'sfda fdsa','direccion12321','1234444444444','fdsd','12321321','2002-12-12','123','sfda_fdsa?823','3'),(8,'sfda fdsa','direccion12321','1234444554444','fdsdsdfa','12321321','2002-12-12','123','sfda_fdsa?952','3'),(9,'dsffasfsa sdafasfda','fdsafsdaf','3333333333333','fdgfdg','12345689','1990-10-12','123','dsffasfsa_sdafasfda?773','3');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'databasempc'
--

--
-- Dumping routines for database 'databasempc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-15 15:06:30
