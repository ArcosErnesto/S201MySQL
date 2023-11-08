CREATE DATABASE  IF NOT EXISTS `optica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optica`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id_cliente`),
  KEY `cliente_recomendador_id` (`cliente_recomendador_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`cliente_recomendador_id`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan Pérez','Carrer de Sant Antoni',45,'4','2','Barcelona','08001','España','648236841','juan@example.com','2022-03-01',NULL),(2,'Ana García','Avinguda Diagonal',123,'7','C','Barcelona','08002','España','679246158','ana@example.com','2022-05-15',NULL),(3,'Carlos Martínez','Carrer de Gran de Gràcia',78,'2','1','Barcelona','08003','España','631846921','carlos@example.com','2023-07-09',2),(4,'Laura Sánchez','Plaça de Catalunya',101,'3','E','Barcelona','08004','España','694321064','laura@example.com','2022-09-23',2),(5,'Pedro Rodríguez','Rambla de Catalunya',222,'1','1','Barcelona','08005','España','609482346','pedro@example.com','2023-01-10',4),(6,'María López','Carrer de la Riera',555,'8','A','Sabadell','08201','España','604871356','maria@example.com','2023-01-30',NULL),(7,'Isabel Fernández','Plaça Major',777,'3','2','Terrassa','08202','España','647523951','isabel@example.com','2023-03-07',NULL),(8,'Javier Torres','Carrer de la Creu',333,'4','1','Granollers','08401','España','615789230','javier@example.com','2023-06-25',7),(9,'Elena Ruiz','Rambla de la Pau',999,'2','C','Mataró','08301','España','636495210','elena@example.com','2023-10-15',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `nif` varchar(15) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Luis Martínez','45615978G','631458968','2022-02-20'),(2,'Carmen Rodríguez','32584298K','631458969','2023-01-15'),(3,'Pablo Sánchez','23575641J','631458970','2023-03-10');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `id_gafa` int NOT NULL AUTO_INCREMENT,
  `id_marca` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `graduacion_cristal_l` decimal(5,2) DEFAULT NULL,
  `graduacion_cristal_r` decimal(5,2) DEFAULT NULL,
  `tipo_montura` varchar(50) NOT NULL,
  `color_montura` varchar(50) DEFAULT NULL,
  `color_cristales` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_gafa`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_marca` (`id_marca`),
  CONSTRAINT `gafas_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  CONSTRAINT `gafas_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,1,1,-2.25,-2.50,'Pasta','Negro','Azul',120.00),(2,1,1,-1.75,-2.00,'Metálica','Plateado','Verde',110.50),(3,1,1,-2.00,-2.25,'Flotante','Rojo','Amarillo',125.99),(4,2,1,-2.50,-2.75,'Pasta','Negro','Gris',140.00),(5,2,1,-3.00,-3.25,'Metálica','Plateado','Azul',165.50),(6,2,1,-2.25,-2.50,'Flotante','Rojo','Amarillo',125.99),(7,3,1,-1.75,-2.00,'Flotante','Negro','Azul',130.00),(8,3,1,-2.25,-2.50,'Pasta','Marrón','Negro',145.75),(9,3,1,-2.00,-2.25,'Metálica','Plateado','Gris',120.50),(10,4,1,-2.75,-3.00,'Flotante','Negro','Amarillo',135.00),(11,4,1,-2.25,-2.50,'Metálica','Plateado','Marrón',155.50),(12,4,1,-3.00,-3.25,'Pasta','Negro','Negro',180.00),(13,5,2,-2.00,-2.25,'Pasta','Negro','Marrón',145.50),(14,5,2,-1.50,-1.75,'Metálica','Dorado','Gris',138.00),(15,5,2,-2.75,-3.00,'Flotante','Plateado','Marrón',152.75),(16,6,2,-2.00,-2.25,'Pasta','Negro','Marrón',125.50),(17,6,2,-1.50,-1.75,'Metálica','Dorado','Gris',118.00),(18,6,2,-2.75,-3.00,'Flotante','Plateado','Marrón',130.75),(19,7,2,-2.25,-2.50,'Flotante','Negro','Azul',120.50),(20,7,2,-1.75,-2.00,'Metálica','Plateado','Verde',110.25),(21,7,2,-2.00,-2.25,'Pasta','Negro','Azul',110.00),(22,8,2,-2.75,-3.00,'Metálica','Plateado','Marrón',155.50),(23,8,2,-2.25,-2.50,'Pasta','Negro','Verde',142.75),(24,8,2,-2.50,-2.75,'Flotante','Negro','Negro',120.50),(25,9,3,-1.75,-2.00,'Flotante','Azul','Marrón',138.25),(26,9,3,-2.00,-2.25,'Pasta','Marrón','Verde',142.75),(27,9,3,-2.50,-2.75,'Metálica','Negro','Marrón',155.00),(28,10,3,-2.75,-3.00,'Pasta','Negro','Azul',130.75),(29,10,3,-2.25,-2.50,'Flotante','Plateado','Verde',120.00),(30,10,3,-3.00,-3.25,'Metálica','Dorado','Gris',145.50);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`id_marca`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Ray-Ban',1),(2,'Oakley',1),(3,'Prada',1),(4,'Versace',1),(5,'Gucci',2),(6,'Dolce & Gabbana',2),(7,'Armani',2),(8,'Fendi',2),(9,'Persol',3),(10,'Tom Ford',3);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Ópticas Sol','Avenida Diagonal',123,'Piso 2',NULL,'Barcelona','08025','España','934561237','934561238','B58732536'),(2,'Gafas Mundo','Calle Mayor',456,NULL,NULL,'Madrid','28001','España','917890123',NULL,'A12345678'),(3,'Lentes Vision','Calle Comercial',789,'Planta 3',NULL,'Valencia','46002','España','963456789','963456790','C87654321');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `num_factura` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_gafa` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`num_factura`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_gafa` (`id_gafa`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`id_gafa`) REFERENCES `gafas` (`id_gafa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2022-03-02',1,1,1,120.00),(2,'2022-10-25',2,2,9,120.50),(3,'2023-01-20',3,2,4,140.00),(4,'2023-02-15',5,3,7,130.00),(5,'2023-03-20',4,1,2,110.50);
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

-- Dump completed on 2023-11-07 14:29:38
