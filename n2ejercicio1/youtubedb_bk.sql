-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: youtubedb
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
-- Current Database: `youtubedb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `youtubedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `youtubedb`;

--
-- Table structure for table `canales`
--

DROP TABLE IF EXISTS `canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canales` (
  `CanalID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Descripcion` text,
  `FechaCreacion` date DEFAULT NULL,
  `UsuarioID` int DEFAULT NULL,
  PRIMARY KEY (`CanalID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `canales_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales`
--

LOCK TABLES `canales` WRITE;
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` VALUES (1,'Canal de Viajes','Explorando el mundo','2022-01-15',1),(2,'Canal de Cocina','Recetas deliciosas','2022-02-20',2),(3,'Canal de Deportes','Lo mejor en deportes','2022-03-25',3),(4,'Canal de M├║sica','M├║sica para todos','2022-04-30',4),(5,'Canal de Educaci├│n','Aprendizaje en l├¡nea','2022-05-05',5);
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `ComentarioID` int NOT NULL AUTO_INCREMENT,
  `TextoComentario` text,
  `FechaHoraComentario` datetime DEFAULT NULL,
  `VideoID` int DEFAULT NULL,
  `UsuarioID` int DEFAULT NULL,
  PRIMARY KEY (`ComentarioID`),
  KEY `VideoID` (`VideoID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`VideoID`) REFERENCES `videos` (`VideoID`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'Gran video, me encant├│ el contenido','2023-01-10 08:30:00',1,2),(2,'┬íExcelente explicaci├│n! Gracias por compartir','2023-01-12 15:45:00',2,3),(3,'Este video es asombroso, no puedo dejar de verlo','2023-01-14 19:20:00',3,4),(4,'┬┐Puedes hacer un tutorial sobre temas relacionados?','2023-01-16 12:10:00',4,5),(5,'Buen video, pero creo que podr├¡a ser m├ís corto','2023-01-18 10:05:00',5,1);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `EtiquetaID` int NOT NULL AUTO_INCREMENT,
  `NombreEtiqueta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EtiquetaID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
INSERT INTO `etiquetas` VALUES (1,'Viajes'),(2,'Cocina'),(3,'Deportes'),(4,'M├║sica'),(5,'Educaci├│n');
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likesdislikescomentarios`
--

DROP TABLE IF EXISTS `likesdislikescomentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likesdislikescomentarios` (
  `LikeDislikeID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int DEFAULT NULL,
  `ComentarioID` int DEFAULT NULL,
  `Tipo` enum('like','dislike') NOT NULL,
  `FechaHoraAccion` datetime DEFAULT NULL,
  PRIMARY KEY (`LikeDislikeID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `ComentarioID` (`ComentarioID`),
  CONSTRAINT `likesdislikescomentarios_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `likesdislikescomentarios_ibfk_2` FOREIGN KEY (`ComentarioID`) REFERENCES `comentarios` (`ComentarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likesdislikescomentarios`
--

LOCK TABLES `likesdislikescomentarios` WRITE;
/*!40000 ALTER TABLE `likesdislikescomentarios` DISABLE KEYS */;
INSERT INTO `likesdislikescomentarios` VALUES (1,1,1,'like','2023-01-10 09:00:00'),(2,2,1,'dislike','2023-01-10 09:30:00'),(3,3,2,'like','2023-01-11 10:15:00'),(4,4,3,'like','2023-01-12 14:20:00'),(5,5,4,'dislike','2023-01-13 16:45:00');
/*!40000 ALTER TABLE `likesdislikescomentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likesdislikesvideos`
--

DROP TABLE IF EXISTS `likesdislikesvideos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likesdislikesvideos` (
  `LikeDislikeID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int DEFAULT NULL,
  `VideoID` int DEFAULT NULL,
  `Tipo` enum('like','dislike') NOT NULL,
  `FechaHoraAccion` datetime DEFAULT NULL,
  PRIMARY KEY (`LikeDislikeID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `VideoID` (`VideoID`),
  CONSTRAINT `likesdislikesvideos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `likesdislikesvideos_ibfk_2` FOREIGN KEY (`VideoID`) REFERENCES `videos` (`VideoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likesdislikesvideos`
--

LOCK TABLES `likesdislikesvideos` WRITE;
/*!40000 ALTER TABLE `likesdislikesvideos` DISABLE KEYS */;
INSERT INTO `likesdislikesvideos` VALUES (1,1,1,'like','2023-01-10 09:00:00'),(2,2,1,'dislike','2023-01-10 09:30:00'),(3,3,2,'like','2023-01-11 10:15:00'),(4,4,3,'like','2023-01-12 14:20:00'),(5,5,4,'dislike','2023-01-13 16:45:00');
/*!40000 ALTER TABLE `likesdislikesvideos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `PlaylistID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `FechaCreacion` date DEFAULT NULL,
  `Estado` enum('publica','privada') NOT NULL,
  `UsuarioID` int DEFAULT NULL,
  PRIMARY KEY (`PlaylistID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'Favoritos de Viajes','2023-01-10','publica',1),(2,'Canciones Relajantes','2023-01-11','publica',2),(3,'Mis Videos Deportivos','2023-01-12','privada',3),(4,'Aprendizaje en L├¡nea','2023-01-13','publica',4),(5,'Mis Recetas','2023-01-14','privada',5);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `SuscripcionID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int DEFAULT NULL,
  `CanalID` int DEFAULT NULL,
  PRIMARY KEY (`SuscripcionID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `CanalID` (`CanalID`),
  CONSTRAINT `suscripciones_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `suscripciones_ibfk_2` FOREIGN KEY (`CanalID`) REFERENCES `canales` (`CanalID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
INSERT INTO `suscripciones` VALUES (1,1,2),(2,2,1),(3,3,1),(4,4,3),(5,5,4);
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `NombreUsuario` varchar(255) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Sexo` varchar(10) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `CodigoPostal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'usuario1@example.com','contrasena1','JohnDoe','1990-05-15','M','Estados Unidos','90210'),(2,'usuario2@example.com','contrasena2','JaneSmith','1985-12-10','F','Canad├í','H2X1Y2'),(3,'usuario3@example.com','contrasena3','MariaGarc├¡a','1998-08-22','F','Espa├▒a','28001'),(4,'usuario4@example.com','contrasena4','CarlosL├│pez','2000-03-30','M','M├®xico','12345'),(5,'usuario5@example.com','contrasena5','SophieMartin','1995-07-05','F','Francia','75001');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `VideoID` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) DEFAULT NULL,
  `Descripcion` text,
  `Tamano` int DEFAULT NULL,
  `NombreArchivoVideo` varchar(255) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Thumbnail` varchar(255) DEFAULT NULL,
  `Reproducciones` int DEFAULT '0',
  `Likes` int DEFAULT '0',
  `Dislikes` int DEFAULT '0',
  `Estado` enum('publico','oculto','privado') NOT NULL,
  `UsuarioID` int DEFAULT NULL,
  `FechaPublicacion` datetime DEFAULT NULL,
  PRIMARY KEY (`VideoID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'Vacaciones en Hawai','Un video sobre nuestras vacaciones en Hawai',2048,'hawaii_vacaciones.mp4','00:12:45','thumbnail_hawaii.jpg',0,0,0,'publico',1,'2023-11-05 18:08:07'),(2,'Receta de Pastel de Chocolate','Aprende a hacer un delicioso pastel de chocolate',1024,'pastel_chocolate.mp4','00:08:30','thumbnail_pastel.jpg',0,0,0,'privado',2,'2023-11-05 18:08:07'),(3,'Entrenamiento de CrossFit','Rutina intensa de entrenamiento de CrossFit',1536,'crossfit_entrenamiento.mp4','00:20:15','thumbnail_crossfit.jpg',0,0,0,'publico',3,'2023-11-05 18:08:07'),(4,'Resumen del Mundial de F├║tbol','Lo mejor del Mundial de F├║tbol 2022',4096,'mundial_resumen.mp4','00:16:30','thumbnail_mundial.jpg',0,0,0,'oculto',4,'2023-11-05 18:08:07'),(5,'Viaje por la Ruta 66','Nuestro viaje por la hist├│rica Ruta 66 en EE. UU.',8192,'ruta66_viaje.mp4','00:42:00','thumbnail_ruta66.jpg',0,0,0,'publico',5,'2023-11-05 18:08:07');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videosetiquetas`
--

DROP TABLE IF EXISTS `videosetiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videosetiquetas` (
  `VideoID` int NOT NULL,
  `EtiquetaID` int NOT NULL,
  PRIMARY KEY (`VideoID`,`EtiquetaID`),
  KEY `EtiquetaID` (`EtiquetaID`),
  CONSTRAINT `videosetiquetas_ibfk_1` FOREIGN KEY (`VideoID`) REFERENCES `videos` (`VideoID`),
  CONSTRAINT `videosetiquetas_ibfk_2` FOREIGN KEY (`EtiquetaID`) REFERENCES `etiquetas` (`EtiquetaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videosetiquetas`
--

LOCK TABLES `videosetiquetas` WRITE;
/*!40000 ALTER TABLE `videosetiquetas` DISABLE KEYS */;
INSERT INTO `videosetiquetas` VALUES (1,1),(1,2),(2,3),(2,4),(3,5);
/*!40000 ALTER TABLE `videosetiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videosplaylists`
--

DROP TABLE IF EXISTS `videosplaylists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videosplaylists` (
  `VideoID` int NOT NULL,
  `PlaylistID` int NOT NULL,
  PRIMARY KEY (`VideoID`,`PlaylistID`),
  KEY `PlaylistID` (`PlaylistID`),
  CONSTRAINT `videosplaylists_ibfk_1` FOREIGN KEY (`VideoID`) REFERENCES `videos` (`VideoID`),
  CONSTRAINT `videosplaylists_ibfk_2` FOREIGN KEY (`PlaylistID`) REFERENCES `playlists` (`PlaylistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videosplaylists`
--

LOCK TABLES `videosplaylists` WRITE;
/*!40000 ALTER TABLE `videosplaylists` DISABLE KEYS */;
INSERT INTO `videosplaylists` VALUES (1,1),(2,1),(3,2),(4,2),(5,3);
/*!40000 ALTER TABLE `videosplaylists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-06 10:06:04
