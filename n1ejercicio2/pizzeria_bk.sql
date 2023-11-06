-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
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
-- Current Database: `pizzeria`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pizzeria`;

--
-- Table structure for table `categoria_pizza`
--

DROP TABLE IF EXISTS `categoria_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_pizza` (
  `id_categoria_pizza` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_pizza`
--

LOCK TABLES `categoria_pizza` WRITE;
/*!40000 ALTER TABLE `categoria_pizza` DISABLE KEYS */;
INSERT INTO `categoria_pizza` VALUES (1,'clasicas'),(2,'especialidades');
/*!40000 ALTER TABLE `categoria_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `id_categoria_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (1,'pizzas'),(2,'hamburguesas'),(3,'bebidas');
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(90) NOT NULL,
  `direccion` varchar(90) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `id_localidad` int DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_localidad` (`id_localidad`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','P├®rez Garc├¡a','Calle Mayor 123','28001',1,'555-123-4567'),(2,'Ana','L├│pez Mart├¡nez','Avenida Central 456','46002',4,'555-987-6543'),(3,'Pedro','Rodr├¡guez S├ínchez','Plaza del Sol 789','41001',7,'555-234-5678'),(4,'Mar├¡a','Fern├índez L├│pez','Calle Primavera 234','28005',2,'555-876-5432'),(5,'Carlos','G├│mez Mart├¡n','Paseo del R├¡o 567','46005',5,'555-345-6789'),(6,'Laura','Torres P├®rez','Calle Nueva 456','41003',8,'555-654-3210'),(7,'Miguel','D├¡az Rodr├¡guez','Avenida Principal 789','28010',3,'555-432-1098'),(8,'Elena','S├ínchez G├│mez','Calle Mayor 123','46004',6,'555-210-9876'),(9,'David','Mart├¡nez Fern├índez','Paseo Central 234','41002',9,'555-876-5432'),(10,'Isabel','L├│pez Garc├¡a','Calle del Sol 567','28020',1,'555-543-2109'),(11,'Javier','Ruiz P├®rez','Avenida de la Playa 890','46003',4,'555-321-0987'),(12,'Carmen','Garc├¡a S├ínchez','Plaza del Parque 123','41004',7,'555-654-3210'),(13,'Sergio','Fern├índez L├│pez','Calle del Bosque 456','28015',2,'555-432-1098'),(14,'Natalia','Ram├¡rez Mart├¡nez','Avenida del Lago 789','46006',5,'555-321-0987'),(15,'Ra├║l','Torres L├│pez','Calle de la Luna 123','41005',8,'555-210-9876');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
  `apellidos` varchar(90) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `cocinero` tinyint(1) NOT NULL,
  `repartidor` tinyint(1) NOT NULL,
  `id_tienda` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_tienda` (`id_tienda`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Antonio','L├│pez Garc├¡a','12345678A','555-111-1111',1,0,1),(2,'Mar├¡a','Rodr├¡guez P├®rez','87654321B','555-222-2222',1,0,1),(3,'Juan','Mart├¡nez L├│pez','98765432C','555-333-3333',1,0,1),(4,'Pedro','S├ínchez Garc├¡a','45678901D','555-444-4444',0,1,1),(5,'Laura','P├®rez Rodr├¡guez','34567890E','555-555-5555',0,1,1),(6,'Carlos','Gonz├ílez Mart├¡nez','23456789F','555-666-6666',0,1,1),(7,'Isabel','Garc├¡a L├│pez','98765432A','555-777-7777',1,0,2),(8,'Sergio','Mart├¡nez P├®rez','12345678B','555-888-8888',1,0,2),(9,'Elena','S├ínchez Rodr├¡guez','87654321C','555-999-9999',1,0,2),(10,'Pedro','G├│mez Garc├¡a','23456789D','555-000-0000',0,1,2),(11,'Laura','L├│pez Mart├¡nez','34567890E','555-111-1111',0,1,2),(12,'Juan','D├¡az P├®rez','45678901F','555-222-2222',0,1,2),(13,'Manuel','Fern├índez Garc├¡a','12345678A','555-777-7777',1,0,3),(14,'Cristina','G├│mez P├®rez','98765432B','555-888-8888',1,0,3),(15,'Antonia','S├ínchez Rodr├¡guez','87654321C','555-999-9999',1,0,3),(16,'Jos├®','Mart├¡nez L├│pez','23456789D','555-000-0000',0,1,3),(17,'Marta','P├®rez Mart├¡nez','34567890E','555-111-1111',0,1,3),(18,'Andr├®s','L├│pez S├ínchez','45678901F','555-222-2222',0,1,3),(19,'Sara','Garc├¡a L├│pez','12345678A','555-777-7777',1,0,4),(20,'Javier','Fern├índez Mart├¡nez','98765432B','555-888-8888',1,0,4),(21,'Luis','S├ínchez P├®rez','87654321C','555-999-9999',1,0,4),(22,'Laura','P├®rez Garc├¡a','23456789D','555-000-0000',0,1,4),(23,'Pablo','Mart├¡nez S├ínchez','34567890E','555-111-1111',0,1,4),(24,'Eva','L├│pez Mart├¡nez','45678901F','555-222-2222',0,1,4),(25,'Silvia','Mart├¡nez Garc├¡a','12345678A','555-777-7777',1,0,5),(26,'Pablo','S├ínchez P├®rez','98765432B','555-888-8888',1,0,5),(27,'Elena','Garc├¡a L├│pez','87654321C','555-999-9999',1,0,5),(28,'Manuel','P├®rez Mart├¡nez','23456789D','555-000-0000',0,1,5),(29,'Ana','Gonz├ílez L├│pez','34567890E','555-111-1111',0,1,5),(30,'Diego','Fern├índez S├ínchez','45678901F','555-222-2222',0,1,5),(31,'Sara','G├│mez Mart├¡nez','12345678A','555-777-7777',1,0,6),(32,'Alejandro','L├│pez P├®rez','98765432B','555-888-8888',1,0,6),(33,'Olga','Fern├índez Garc├¡a','87654321C','555-999-9999',1,0,6),(34,'Jos├®','P├®rez L├│pez','23456789D','555-000-0000',0,1,6),(35,'Isabel','Garc├¡a P├®rez','34567890E','555-111-1111',0,1,6),(36,'Luis','Mart├¡nez S├ínchez','45678901F','555-222-2222',0,1,6),(37,'Roberto','G├│mez P├®rez','12345678A','555-777-7777',1,0,7),(38,'Nuria','L├│pez Mart├¡nez','98765432B','555-888-8888',1,0,7),(39,'Diego','Fern├índez S├ínchez','87654321C','555-999-9999',1,0,7),(40,'Marina','P├®rez L├│pez','23456789D','555-000-0000',0,1,7),(41,'Andr├®s','Garc├¡a Mart├¡nez','34567890E','555-111-1111',0,1,7),(42,'Sandra','Mart├¡nez Garc├¡a','45678901F','555-222-2222',0,1,7),(43,'Marta','Garc├¡a P├®rez','12345678A','555-333-3333',1,0,8),(44,'Adri├ín','Mart├¡nez L├│pez','98765432B','555-444-4444',1,0,8),(45,'Sof├¡a','L├│pez Mart├¡nez','87654321C','555-555-5555',1,0,8),(46,'Hugo','Fern├índez S├ínchez','23456789D','555-666-6666',0,1,8),(47,'Luc├¡a','G├│mez Mart├¡n','34567890E','555-777-7777',0,1,8),(48,'V├¡ctor','S├ínchez L├│pez','45678901F','555-888-8888',0,1,8),(49,'Beatriz','Mart├¡nez P├®rez','12345678A','555-333-3333',1,0,9),(50,'Roberto','G├│mez L├│pez','98765432B','555-444-4444',1,0,9),(51,'Sara','S├ínchez Mart├¡n','87654321C','555-555-5555',1,0,9),(52,'├ülvaro','Garc├¡a S├ínchez','23456789D','555-666-6666',0,1,9),(53,'Eva','L├│pez Mart├¡nez','34567890E','555-777-7777',0,1,9),(54,'Luis','Rodr├¡guez Mart├¡n','45678901F','555-888-8888',0,1,9);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `id_localidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `id_provincia` int DEFAULT NULL,
  PRIMARY KEY (`id_localidad`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Barcelona',1),(2,'Hospitalet de Llobregat',1),(3,'Badalona',1),(4,'Valencia',2),(5,'Paterna',2),(6,'Gand├¡a',2),(7,'Sevilla',3),(8,'Dos Hermanas',3),(9,'Alcal├í de Guada├¡ra',3);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL,
  `entrega_domicilio` tinyint(1) NOT NULL,
  `cantidad_productos` int NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_tienda` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tienda` (`id_tienda`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2023-11-05 14:00:00',1,3,15.99,3,4),(2,'2023-11-05 15:30:00',1,4,19.99,7,6),(3,'2023-11-05 17:30:00',1,2,9.49,12,8),(4,'2023-11-05 19:00:00',0,2,8.99,10,5),(5,'2023-11-05 20:30:00',0,3,13.49,13,2),(9,'2023-11-05 21:15:00',0,4,17.99,1,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_reparto`
--

DROP TABLE IF EXISTS `pedido_reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_reparto` (
  `id_pedido_reparto` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_hora_entrega` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pedido_reparto`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `pedido_reparto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `pedido_reparto_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_reparto`
--

LOCK TABLES `pedido_reparto` WRITE;
/*!40000 ALTER TABLE `pedido_reparto` DISABLE KEYS */;
INSERT INTO `pedido_reparto` VALUES (1,1,6,'2023-11-05 14:30:00'),(2,2,11,'2023-11-05 16:00:00'),(3,3,16,'2023-11-05 18:00:00');
/*!40000 ALTER TABLE `pedido_reparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(90) DEFAULT NULL,
  `precio` decimal(5,2) NOT NULL,
  `id_categoria_producto` int DEFAULT NULL,
  `id_categoria_pizza` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria_producto` (`id_categoria_producto`),
  KEY `id_categoria_pizza` (`id_categoria_pizza`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categoria_producto` (`id_categoria_producto`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_categoria_pizza`) REFERENCES `categoria_pizza` (`id_categoria_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Agua Mineral','Botella de agua mineral sin gas',NULL,1.50,3,NULL),(2,'Coca-Cola','Refresco de cola en lata',NULL,2.00,3,NULL),(3,'Zumo de Naranja','Zumo de naranja natural',NULL,2.50,3,NULL),(4,'T├® Helado','T├® helado con lim├│n',NULL,2.20,3,NULL),(5,'Caf├®','Taza de caf├® reci├®n hecho',NULL,1.80,3,NULL),(6,'Hamburguesa Cl├ísica','Hamburguesa con carne de res, lechuga, tomate y queso',NULL,4.99,2,NULL),(7,'Hamburguesa de Pollo','Hamburguesa con filete de pollo empanizado y aderezos',NULL,5.49,2,NULL),(8,'Hamburguesa Vegetariana','Hamburguesa vegetariana con base de garbanzos y verduras',NULL,4.79,2,NULL),(9,'Hamburguesa Doble','Doble hamburguesa con doble carne, queso y aderezos',NULL,6.99,2,NULL),(10,'Hamburguesa con Bacon','Hamburguesa con bacon, queso, lechuga y tomate',NULL,5.29,2,NULL),(11,'Pizza Margarita','Sencilla y deliciosa con salsa de tomate, mozzarella y albahaca',NULL,7.99,1,1),(12,'Pizza Pepperoni','Con salsa de tomate, mozzarella y abundantes rodajas de pepperoni',NULL,8.49,1,1),(13,'Pizza Hawaiana','Salsa de tomate, mozzarella, jam├│n y pi├▒a',NULL,8.99,1,1),(14,'Pizza Napolitana','Tomate, mozzarella, anchoas, aceitunas negras y alcaparras',NULL,9.29,1,1),(15,'Pizza 4 Quesos','Una mezcla de cuatro quesos: mozzarella, gorgonzola, parmesano y queso de cabra',NULL,9.99,1,1),(16,'Pizza Carbonara','Salsa de nata, mozzarella, huevo, bacon y queso parmesano',NULL,10.99,1,2),(17,'Pizza Barbacoa','Salsa barbacoa, mozzarella, carne de cerdo desmenuzada, cebolla y ma├¡z',NULL,11.49,1,2),(18,'Pizza Vegetariana','Salsa de tomate, mozzarella y una variedad de verduras frescas',NULL,9.79,1,2),(19,'Pizza Marinera','Salsa de tomate, mozzarella, mariscos y aceite de oliva',NULL,12.29,1,2),(20,'Pizza Del Chef','Salsa de tomate, mozzarella, jam├│n serrano, r├║cula y lascas de parmesano',NULL,11.99,1,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Barcelona'),(2,'Valencia'),(3,'Sevilla');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `id_tienda` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(90) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `id_localidad` int DEFAULT NULL,
  `id_provincia` int DEFAULT NULL,
  PRIMARY KEY (`id_tienda`),
  KEY `id_localidad` (`id_localidad`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id_localidad`),
  CONSTRAINT `tienda_ibfk_2` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'Calle Rambla de Catalunya 123','08001',1,1),(2,'Calle de Sant Josep 456','08901',2,1),(3,'Calle del Mar 789','08911',3,1),(4,'Avenida de la Paz 123','46001',4,2),(5,'Calle Mayor 456','46980',5,2),(6,'Carrer del Marjal 789','46701',6,2),(7,'Calle Sierpes 123','41001',7,3),(8,'Avenida de Espa├▒a 456','41701',8,3),(9,'Calle de la Feria 789','41500',9,3);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-06 10:05:24
