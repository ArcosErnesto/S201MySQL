-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `optica`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `optica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `optica`;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion_calle` varchar(45) NOT NULL,
  `direccion_numero` int NOT NULL,
  `direccion_piso` varchar(10) DEFAULT NULL,
  `direccion_puerta` varchar(10) DEFAULT NULL,
  `direccion_ciudad` varchar(45) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `cliente_recomendador_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_recomendador_id` (`cliente_recomendador_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`cliente_recomendador_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan P├®rez','Carrer de Sant Antoni',45,'4','2','Barcelona','08001','Espa├▒a','648236841','juan@example.com','2023-10-01',NULL),(2,'Ana Garc├¡a','Avinguda Diagonal',123,'7','C','Barcelona','08002','Espa├▒a','679246158','ana@example.com','2023-10-02',NULL),(3,'Carlos Mart├¡nez','Carrer de Gran de Gr├ácia',78,'2','1','Barcelona','08003','Espa├▒a','631846921','carlos@example.com','2023-10-03',2),(4,'Laura S├ínchez','Pla├ºa de Catalunya',101,'3','E','Barcelona','08004','Espa├▒a','694321064','laura@example.com','2023-10-04',2),(5,'Pedro Rodr├¡guez','Rambla de Catalunya',222,'1','1','Barcelona','08005','Espa├▒a','609482346','pedro@example.com','2023-10-05',4),(6,'Mar├¡a L├│pez','Carrer de la Riera',555,'8','A','Sabadell','08201','Espa├▒a','604871356','maria@example.com','2023-10-06',NULL),(7,'Isabel Fern├índez','Pla├ºa Major',777,'3','2','Terrassa','08202','Espa├▒a','647523951','isabel@example.com','2023-10-07',NULL),(8,'Javier Torres','Carrer de la Creu',333,'4','1','Granollers','08401','Espa├▒a','615789230','javier@example.com','2023-10-08',7),(9,'Elena Ruiz','Rambla de la Pau',999,'2','C','Matar├│','08301','Espa├▒a','636495210','elena@example.com','2023-10-09',NULL),(10,'Sergio G├│mez','Carrer de Sant Pau',111,'1','B','Badalona','08901','Espa├▒a','666666666','sergio@example.com','2023-10-10',9);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Luis Mart├¡nez','631458968','2023-06-20'),(2,'Carmen Rodr├¡guez','631458969','2023-01-15'),(3,'Pablo S├ínchez','631458970','2023-03-10'),(4,'Isabel Gonz├ílez','631458971','2023-08-05');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL,
  `graduacion_cristal_l` decimal(5,2) DEFAULT NULL,
  `graduacion_cristal_r` decimal(5,2) DEFAULT NULL,
  `tipo_montura` varchar(50) NOT NULL,
  `color_montura` varchar(50) DEFAULT NULL,
  `color_cristales` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `proveedor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `gafas_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,'OptiStyle',-2.25,-2.50,'Flotante','Negro','Azul',125.50,1),(2,'CrystalWave',-3.00,-3.25,'Pasta','Marr├│n','Gris',150.75,1),(3,'VisionPro',-1.75,-2.00,'Met├ílica','Plateado','Verde',110.00,1),(4,'LensCraft',-3.50,-3.75,'Pasta','Negro','Negro',180.25,1),(5,'SunLuxe',-2.00,-2.25,'Flotante','Rojo','Amarillo',135.99,1),(6,'SightMasters',-1.50,-1.75,'Pasta','Negro','Azul',120.00,1),(7,'EyeGlo',-2.75,-3.00,'Met├ílica','Plateado','Marr├│n',155.50,1),(8,'LensXpress',-2.25,-2.50,'Pasta','Negro','Verde',142.75,1),(9,'FrameFusion',-3.25,-3.50,'Met├ílica','Dorado','Gris',165.00,1),(10,'ClearVision',-1.75,-2.00,'Flotante','Azul','Marr├│n',120.50,1),(11,'Visionary',-1.25,-1.50,'Pasta','Negro','Azul',110.25,1),(12,'ElegantEye',-2.75,-3.00,'Flotante','Plateado','Verde',130.75,1),(13,'SunSpecs',-3.25,-3.50,'Pasta','Negro','Negro',145.50,1),(14,'UrbanGaze',-1.50,-1.75,'Met├ílica','Dorado','Gris',118.00,1),(15,'VibrantView',-2.00,-2.25,'Flotante','Negro','Amarillo',135.99,1),(16,'LuxeLenses',-2.25,-2.50,'Pasta','Rojo','Marr├│n',125.00,1),(17,'ChicSight',-1.75,-2.00,'Met├ílica','Plateado','Azul',138.25,1),(18,'TrendyOptics',-2.50,-2.75,'Flotante','Negro','Negro',120.50,1),(19,'ModaGlasses',-2.00,-2.25,'Pasta','Marr├│n','Verde',142.75,1),(20,'StyleVision',-3.00,-3.25,'Met├ílica','Negro','Marr├│n',155.00,1);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion_calle` varchar(45) NOT NULL,
  `direccion_numero` int NOT NULL,
  `direccion_piso` varchar(45) DEFAULT NULL,
  `direccion_puerta` varchar(45) DEFAULT NULL,
  `direccion_ciudad` varchar(45) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `nif` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'├ôpticas Alfa','Calle Mayor',33,NULL,NULL,'Barcelona','08025','Espa├▒a','933216547','934561237','B58732536');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  `id_gafa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gafa_unico` (`id_gafa`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`id_gafa`) REFERENCES `gafas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2023-10-15',1,4,15),(2,'2023-10-16',7,3,9),(3,'2023-10-17',4,2,3),(4,'2023-10-18',3,1,20),(5,'2023-10-19',9,3,2),(6,'2023-10-19',5,2,8);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-06 10:03:01
