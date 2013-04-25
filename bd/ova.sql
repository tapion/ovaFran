CREATE DATABASE  IF NOT EXISTS `cuestionario` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `cuestionario`;
-- MySQL dump 10.13  Distrib 5.5.30, for Linux (x86_64)
--
-- Host: localhost    Database: cuestionario
-- ------------------------------------------------------
-- Server version	5.5.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('8ee951d39fb86ceaf590c27403873c53','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:20.0) Gecko/20100101 Firefox/20.0',1366864350,'a:4:{s:9:\"user_data\";s:0:\"\";s:6:\"userid\";s:1:\"5\";s:8:\"username\";s:9:\"profesor1\";s:7:\"role_id\";s:1:\"3\";}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla imagenes',
  `ruta` varchar(200) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Rutas para las imagenes a asignar en las preguntas del test',
  `pregunta_id` int(11) NOT NULL COMMENT 'Identificador de pregunta a la que pertenece',
  `orden` int(1) DEFAULT '0' COMMENT 'Orden en que se mostraran las imagenes',
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT 'NO ASIGNADO' COMMENT 'Nombre de la imagen a buscar en el texto cuando se va a reemplazar',
  PRIMARY KEY (`id`),
  KEY `FK_imagenes` (`pregunta_id`),
  CONSTRAINT `FK_imagenes` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena la ruta de las imagenes que pertenecen a las pregun';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (10,'Penguins.jpg',15,0,'pii'),(11,'',74,0,''),(12,'',74,0,''),(13,'IMG_20121125_121053.jpg',74,0,'Hola'),(18,'IMG_20121125_121053.jpg',73,0,'Imagen 1'),(19,'',73,0,''),(20,'IMG_20121125_121053.jpg',74,0,'Hola');
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla',
  `test_id` int(11) DEFAULT NULL COMMENT 'Identificador para test',
  `orden_test` int(11) DEFAULT NULL COMMENT 'Orden para la presentacion el test',
  PRIMARY KEY (`id`),
  KEY `FK_orden` (`test_id`),
  CONSTRAINT `FK_orden` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena el orden de las tareas para principal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Idetificador de la tabla',
  `pregunta` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Texto para la pregunta planteada',
  `valor` int(11) DEFAULT NULL COMMENT 'Valor asignado a la pregunta',
  `respuestacorrecta` int(11) DEFAULT NULL COMMENT 'Id de respuesta correcta para la pregunta',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'Fecha de creacion',
  `fechaactualizacion` datetime DEFAULT NULL COMMENT 'Fecha de actualizacion',
  `usuario_id` int(11) DEFAULT NULL COMMENT 'Usuario que modifico o actualizo la pregunta',
  `idtest` int(11) DEFAULT NULL COMMENT 'Identificador de test al que pertenece',
  `subcategoria` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Identificador para la subcategoria asignada',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (14,'Pregunta No1 Diferenciacion',445,1,'2013-03-15 12:35:00','2013-03-15 12:35:00',1,-1,'Transformación Mental'),(15,'el estomago es el encargado de almacenar el alimnto?\r\n',1,3,'2013-03-07 15:39:02','2013-03-07 15:39:03',1,-1,'Conceptualización'),(16,'como se llama la parte dura del diente que se encarga de romper los alimentos',1,4,'2013-01-29 19:04:39','2013-01-29 19:04:39',1,27,'dientes'),(19,'cual es la funcion del estomago',2,3,'2013-02-19 21:02:16','2013-02-19 21:02:16',1,28,'estomago'),(20,'es la lengua un organo movil o inmovil',12,1,'2013-03-05 20:23:50','2013-03-05 20:23:50',1,-1,'Identificación'),(21,'la saliva contiene',5,3,'2013-03-05 20:27:58','2013-03-05 20:27:58',1,-1,'Diferenciación'),(22,'el estoamgo es',5,4,'2013-03-05 20:29:19','2013-03-05 20:29:19',1,-1,'Diferenciación'),(23,'el pancreas secreta',8,3,'2013-03-05 20:31:14','2013-03-05 20:31:14',1,-1,'Representación Mental'),(24,'cuando una masa se presenta en el abdomen que s',8,4,'2013-03-05 20:37:34','2013-03-05 20:37:34',1,-1,'Representación Mental'),(25,'que requiere el acvido para no matar las celulas estomacales',8,4,'2013-03-05 20:44:11','2013-03-05 20:44:11',1,-1,'Clasificación'),(26,'QUE SE REQUIERE PARA ALIMENTAR EL CUERPO HUMANO',45,4,'2013-03-05 20:47:40','2013-03-05 20:47:40',1,-1,'Clasificación'),(27,'ES EL ORGANO AMS GRANDE DE L CUERPO HUMANO',0,0,'2013-03-05 20:52:07','2013-03-05 20:52:07',1,-1,'Codificación'),(28,'ORGANO ENCARGADO DE TRITURAR LOS ALIMENTIOS',45,1,'2013-03-05 20:54:49','2013-03-05 20:54:49',1,-1,'Codificación'),(29,'OBSORVE LOS NUTRIENTES DE LA NUTRICION',56,2,'2013-03-05 20:56:00','2013-03-05 20:56:00',1,-1,'Descodificación'),(30,'propone emityir señales ',78,3,'2013-03-05 20:59:27','2013-03-05 20:59:27',1,-1,'Descodificación'),(31,'usa la pepsina para descomprimir proteinas',58,3,'2013-03-05 21:01:23','2013-03-05 21:01:23',1,-1,'Descodificación'),(32,'si se quita el pancreas que no puede comer',78,1,'2013-03-05 21:05:29','2013-03-05 21:05:29',1,-1,'Proyección'),(33,'cuando se quita el estomago que nop puede comer la persona',68,3,'2013-03-05 21:07:06','2013-03-05 21:07:06',1,-1,'Proyección'),(34,'si te da diarrea que no funciona bien',485,2,'2013-03-05 21:09:46','2013-03-05 21:09:46',1,-1,'Análisis'),(35,'como se genera la saliva',56,1,'2013-03-05 21:11:14','2013-03-05 21:11:14',1,-1,'Análisis'),(36,'que parte de intestino absorve los nutrientes',561,2,'2013-03-05 22:53:58','2013-03-05 22:53:58',1,-1,'Síntesis'),(37,'como se elabora la papsina',784,3,'2013-03-05 22:56:33','2013-03-05 22:56:33',1,-1,'Síntesis'),(38,'si se quita el higado que sucederia',78,1,'2013-03-05 23:00:17','2013-03-05 23:00:17',1,-1,'Inferencia Lógica'),(39,'se podra vivir sin estomago?',4635,2,'2013-03-05 23:07:20','2013-03-05 23:07:20',1,-1,'Identificación'),(40,'queda al lado derecho encima del colon',45,3,'2013-03-05 23:13:21','2013-03-05 23:13:21',1,-1,'Identificación'),(41,'un pancreas con cancer se puede quitar?',78,3,'2013-03-05 23:18:02','2013-03-05 23:18:02',1,-1,'Razonamiento Analógico'),(42,'si se quita en colon como se podria vivir',78,4,'2013-03-05 23:28:20','2013-03-05 23:28:20',1,-1,'Razonamiento Analógico'),(43,'se puede comer boqui arriba?',78,4,'2013-03-06 01:25:13','2013-03-06 01:25:13',1,-1,'Razonamiento Hipotético'),(44,'i a es b b es a',63,2,'2013-03-06 01:26:44','2013-03-06 01:26:44',1,-1,'Razonamiento Hipotético'),(45,'en que se convierte el alimento luego de estar en el estomago',58,1,'2013-03-06 01:28:20','2013-03-06 01:28:20',1,-1,'Razonamiento Transitivo'),(46,'cuano el quimo pasa al intestino delgado en que se transaforma',23,2,'2013-03-06 01:29:38','2013-03-06 01:29:38',1,-1,'Razonamiento Transitivo'),(47,'la luna es a noche como estomago a?',54,3,'2013-03-06 01:31:26','2013-03-06 01:31:26',1,-1,'Razonamiento Silogístico'),(48,'la capa que produce el acido es',51,2,'2013-03-06 01:33:02','2013-03-06 01:33:02',1,-1,'Razonamiento Silogístico'),(49,'la funcion del acido estomal es',58,4,'2013-03-06 01:34:15','2013-03-06 01:34:15',1,-1,'Pensamiento Divergente-Convergente'),(50,'el intestino delgado tiene un conducto que lleva los nutrientes a la sangre',37,4,'2013-03-06 01:35:42','2013-03-06 01:35:42',1,-1,'Pensamiento Divergente-Convergente'),(51,'el higado es',56,2,'2013-03-06 01:36:41','2013-03-06 01:36:41',1,-1,'Conceptualización'),(52,'las hemorroides son',73,2,'2013-03-06 01:38:02','2013-03-06 01:38:02',1,-1,'Conceptualización'),(53,'Prueba.',2,1,'2013-03-11 15:24:50','2013-03-11 15:24:50',1,-1,'Identificación'),(54,'Pregunta Prueba',21,1,'2013-03-11 15:38:47','2013-03-11 15:38:47',1,-1,'Síntesis'),(56,'cuando se cae el quimo asl colon se hace',45,1,'2013-03-12 15:48:39','2013-03-12 15:48:39',1,29,'intestino grueso'),(57,'los dientes son organos duros',1,2,'2013-03-13 20:17:43','2013-03-13 20:17:43',1,30,'dientes'),(58,'la lengua permite ',2,3,'2013-03-13 20:19:37','2013-03-13 20:19:37',1,30,'lengua'),(59,'ES CAPAZ EL ESTOMAGO DE CREAR AMILASA',5,1,'2013-03-13 20:33:09','2013-03-13 20:33:09',1,30,'dientes'),(60,'',0,1,'2013-03-13 21:12:44','2013-03-13 21:12:44',1,-1,'Identificación'),(61,'pruba ivergente',54,1,'2013-03-15 11:37:32','2013-03-15 11:37:32',1,-1,'Pensamiento Divergente-Convergente'),(62,'KJUYHAQIUWIUWIUW',0,1,'2013-03-15 12:20:47','2013-03-15 12:20:47',1,-1,'Transformación Mental'),(63,'QWSWW',0,1,'2013-03-15 12:21:25','2013-03-15 12:21:25',1,-1,'Comparación'),(64,'QWEDASAsSADXS',0,3,'2013-03-15 12:22:13','2013-03-15 12:22:13',1,-1,'Comparación'),(65,'fcsgvsxgvsxgsxgvs',0,3,'2013-03-15 20:49:19','2013-03-15 20:49:19',1,-1,'Inferencia Lógica'),(66,'Esta pregunta es una prueba de todo lo que es posible realizar en la base de datos',NULL,NULL,'2013-04-20 17:11:57','2013-04-20 17:11:57',1,27,'dientes'),(67,'Jjejeje otra pregunta de prueba',NULL,NULL,'2013-04-20 17:16:47','2013-04-20 17:16:47',1,27,'dientes'),(68,NULL,0,0,'2013-04-20 17:17:42','2013-04-20 17:17:42',1,27,NULL),(69,'asdasdasd',NULL,NULL,'2013-04-20 17:18:21','2013-04-20 17:18:21',1,27,'dientes'),(70,'asdasdasd',NULL,NULL,'2013-04-20 17:18:51','2013-04-20 17:18:51',1,27,'dientes'),(71,NULL,0,0,'2013-04-20 17:19:02','2013-04-20 17:19:02',1,27,NULL),(72,NULL,0,0,'2013-04-20 17:19:52','2013-04-20 17:19:52',1,27,NULL),(73,'zxcdsfsadfdsfs [Imagen 1]',0,1,'2013-04-20 19:05:15','2013-04-20 19:05:15',1,32,'dientes'),(74,'zxcdsfsadfdsfs',0,1,'2013-04-20 18:33:44','2013-04-20 18:33:44',1,32,'dientes');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `principal`
--

DROP TABLE IF EXISTS `principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `principal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla principal',
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT 'No Asigando',
  `fechacreacion` datetime DEFAULT NULL,
  `fechaactualizacion` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL COMMENT 'Orden para el test, comic, y video',
  PRIMARY KEY (`id`),
  KEY `FK_principal` (`orden_id`),
  CONSTRAINT `FK_principal` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principal`
--

LOCK TABLES `principal` WRITE;
/*!40000 ALTER TABLE `principal` DISABLE KEYS */;
/*!40000 ALTER TABLE `principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de respuesta',
  `pregunta_id` int(11) NOT NULL COMMENT 'Identificador de la pregunta a la que pertenece',
  `texto` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto de la respuesta',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'Fecha de creacion',
  `fechaactualizacion` datetime DEFAULT NULL COMMENT 'Fecha de actualizacion',
  `usuario_id` int(11) DEFAULT NULL COMMENT 'Identificador de usuario',
  PRIMARY KEY (`id`),
  KEY `FK_respuestas` (`pregunta_id`),
  CONSTRAINT `FK_respuestas` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (34,14,'higado.','2013-01-23 15:15:26','2013-03-11 15:38:25',1),(35,14,'pancreas','2013-01-23 15:15:26','2013-03-11 15:38:25',1),(36,14,'polimorfes','2013-01-23 15:15:26','2013-03-11 15:38:25',1),(37,14,'direcionalismo','2013-01-23 15:15:26','2013-03-11 15:38:25',1),(38,16,'corona','2013-01-29 19:05:20','2013-01-29 19:05:20',1),(39,16,'esmalte','2013-01-29 19:05:20','2013-01-29 19:05:20',1),(40,16,'dentina','2013-01-29 19:05:20','2013-01-29 19:05:20',1),(41,16,'raiz','2013-01-29 19:05:20','2013-01-29 19:05:20',1),(42,16,'corona','2013-01-29 19:06:22','2013-01-29 19:06:22',1),(43,16,'esmalte','2013-01-29 19:06:22','2013-01-29 19:06:22',1),(44,16,'dentina','2013-01-29 19:06:22','2013-01-29 19:06:22',1),(45,16,'raiz','2013-01-29 19:06:22','2013-01-29 19:06:22',1),(66,19,'asdf','2013-02-19 21:06:10','2013-02-19 21:06:10',1),(67,19,'ghj','2013-02-19 21:06:10','2013-02-19 21:06:10',1),(68,19,'rty','2013-02-19 21:06:10','2013-02-19 21:06:10',1),(69,19,'qwer','2013-02-19 21:06:10','2013-02-19 21:06:10',1),(70,21,'amilasa','2013-03-05 20:28:41','2013-03-05 20:28:41',1),(71,21,'lipasa','2013-03-05 20:28:41','2013-03-05 20:28:41',1),(72,21,'melasa','2013-03-05 20:28:41','2013-03-05 20:28:41',1),(73,21,'aidasa','2013-03-05 20:28:41','2013-03-05 20:28:41',1),(74,23,'a','2013-03-05 20:33:11','2013-03-05 20:33:11',1),(75,23,'s','2013-03-05 20:33:12','2013-03-05 20:33:12',1),(76,23,'d','2013-03-05 20:33:12','2013-03-05 20:33:12',1),(77,23,'e','2013-03-05 20:33:12','2013-03-05 20:33:12',1),(78,22,'pacreasa','2013-03-05 20:33:40','2013-03-05 20:33:40',1),(79,22,'asontasa','2013-03-05 20:33:41','2013-03-05 20:33:41',1),(80,22,'lepilasa','2013-03-05 20:33:41','2013-03-05 20:33:41',1),(81,22,'asorasa','2013-03-05 20:33:41','2013-03-05 20:33:41',1),(82,22,'pacreasa','2013-03-05 20:36:00','2013-03-05 20:36:00',1),(83,22,'asontasa','2013-03-05 20:36:01','2013-03-05 20:36:01',1),(84,22,'lepilasa','2013-03-05 20:36:01','2013-03-05 20:36:01',1),(85,22,'asorasa','2013-03-05 20:36:01','2013-03-05 20:36:01',1),(86,24,'cancer','2013-03-05 20:38:12','2013-03-05 20:38:12',1),(87,24,'tumor','2013-03-05 20:38:13','2013-03-05 20:38:13',1),(88,24,'melanoma','2013-03-05 20:38:13','2013-03-05 20:38:13',1),(89,24,'carcinoma','2013-03-05 20:38:13','2013-03-05 20:38:13',1),(90,15,'no es el encargado de segregarlogbsbhs','2013-03-05 20:41:39','2013-03-05 20:41:39',1),(91,15,'es el encargadod e comprimirlo','2013-03-05 20:41:40','2013-03-05 20:41:40',1),(92,15,'es el encargado de disolverlo','2013-03-05 20:41:40','2013-03-05 20:41:40',1),(93,15,'es una bolsa no mas','2013-03-05 20:41:40','2013-03-05 20:41:40',1),(94,25,'acido','2013-03-05 20:45:22','2013-03-05 20:45:38',1),(95,25,'salidificacion','2013-03-05 20:45:23','2013-03-05 20:45:38',1),(96,25,'AGUA','2013-03-05 20:45:23','2013-03-05 20:45:39',1),(97,25,'bicarbonato','2013-03-05 20:45:23','2013-03-05 20:45:39',1),(98,27,'HIGADO','2013-03-05 20:52:56','2013-03-05 20:52:56',1),(99,27,'PANCREAS','2013-03-05 20:52:56','2013-03-05 20:52:56',1),(100,27,'ESTOMAGO','2013-03-05 20:52:56','2013-03-05 20:52:56',1),(101,27,'INTESTINO','2013-03-05 20:52:56','2013-03-05 20:52:56',1),(102,26,'AGUS','2013-03-05 20:53:18','2013-03-05 20:53:18',1),(103,26,'VERDURAS','2013-03-05 20:53:18','2013-03-05 20:53:18',1),(104,26,'VEGETALES','2013-03-05 20:53:18','2013-03-05 20:53:18',1),(105,26,'GASEOSA','2013-03-05 20:53:18','2013-03-05 20:53:18',1),(106,29,'intestino','2013-03-05 20:58:30','2013-03-05 20:58:30',1),(107,29,'sofago','2013-03-05 20:58:30','2013-03-05 20:58:30',1),(108,29,'higado','2013-03-05 20:58:31','2013-03-05 20:58:31',1),(109,29,'pancreas','2013-03-05 20:58:31','2013-03-05 20:58:31',1),(110,30,'intesttino','2013-03-05 20:59:59','2013-03-05 20:59:59',1),(111,30,'pncreas','2013-03-05 20:59:59','2013-03-05 20:59:59',1),(112,30,'estomago','2013-03-05 20:59:59','2013-03-05 20:59:59',1),(113,30,'colon','2013-03-05 20:59:59','2013-03-05 20:59:59',1),(114,31,'estomago','2013-03-05 21:04:40','2013-03-05 21:04:40',1),(115,31,'amilasa','2013-03-05 21:04:40','2013-03-05 21:04:40',1),(116,31,'lipas','2013-03-05 21:04:40','2013-03-05 21:04:40',1),(117,31,'peptasa','2013-03-05 21:04:40','2013-03-05 21:04:40',1),(118,32,'azucar','2013-03-05 21:05:51','2013-03-05 21:05:51',1),(119,32,'miel','2013-03-05 21:05:51','2013-03-05 21:05:51',1),(120,32,'sal','2013-03-05 21:05:51','2013-03-05 21:05:51',1),(121,32,'gaseosa','2013-03-05 21:05:51','2013-03-05 21:05:51',1),(122,33,'agua','2013-03-05 21:08:25','2013-03-05 21:08:25',1),(123,33,'arroz','2013-03-05 21:08:25','2013-03-05 21:08:25',1),(124,33,'carne','2013-03-05 21:08:25','2013-03-05 21:08:25',1),(125,33,'sopa','2013-03-05 21:08:25','2013-03-05 21:08:25',1),(126,34,'higado','2013-03-05 21:10:22','2013-03-05 21:10:22',1),(127,34,'intestino delgado','2013-03-05 21:10:22','2013-03-05 21:10:22',1),(128,34,'pancreas','2013-03-05 21:10:22','2013-03-05 21:10:22',1),(129,34,' lengua','2013-03-05 21:10:22','2013-03-05 21:10:22',1),(130,35,'asei','2013-03-05 21:54:16','2013-03-05 22:32:03',1),(131,35,'gvgvaggv','2013-03-05 21:54:16','2013-03-05 22:32:03',1),(132,35,'vgvgvgv%7C','2013-03-05 21:54:16','2013-03-05 22:32:03',1),(133,35,'jgvgvgv','2013-03-05 21:54:16','2013-03-05 22:32:03',1),(134,36,'pepsina','2013-03-05 22:54:27','2013-03-05 22:54:27',1),(135,36,'vellosidades','2013-03-05 22:54:27','2013-03-05 22:54:27',1),(136,36,'amilasa','2013-03-05 22:54:27','2013-03-05 22:54:27',1),(137,36,'peptidasa','2013-03-05 22:54:27','2013-03-05 22:54:27',1),(138,37,'celulosa','2013-03-05 22:57:36','2013-03-05 22:57:36',1),(139,37,'cerosa','2013-03-05 22:57:36','2013-03-05 22:57:36',1),(140,37,'maltosa','2013-03-05 22:57:36','2013-03-05 22:57:36',1),(141,37,'peptidasa','2013-03-05 22:57:36','2013-03-05 22:57:36',1),(142,38,'se moriria si higado no se puede vivir','2013-03-05 23:01:07','2013-03-05 23:01:07',1),(143,38,'no podria comer azucar','2013-03-05 23:01:07','2013-03-05 23:01:07',1),(144,38,' no podria comer sal','2013-03-05 23:01:07','2013-03-05 23:01:07',1),(145,38,'la sangre se continaminaria','2013-03-05 23:01:07','2013-03-05 23:01:07',1),(146,40,'estomago','2013-03-05 23:13:48','2013-03-05 23:13:48',1),(147,40,'pancreas','2013-03-05 23:13:48','2013-03-05 23:13:48',1),(148,40,'higado','2013-03-05 23:13:48','2013-03-05 23:13:48',1),(149,40,'esofago','2013-03-05 23:13:48','2013-03-05 23:13:48',1),(150,39,'si sin comer solidos','2013-03-05 23:15:14','2013-03-05 23:15:14',1),(151,39,'si comiendo de todo menos carne','2013-03-05 23:15:14','2013-03-05 23:15:14',1),(152,39,'no es imposible','2013-03-05 23:15:14','2013-03-05 23:15:14',1),(153,39,'no la sangre no tiene antioxidantes','2013-03-05 23:15:14','2013-03-05 23:15:14',1),(154,41,'si','2013-03-05 23:27:26','2013-03-05 23:27:26',1),(155,41,'no','2013-03-05 23:27:26','2013-03-05 23:27:26',1),(156,41,'talves','2013-03-05 23:27:26','2013-03-05 23:27:26',1),(157,41,'depronto','2013-03-05 23:27:26','2013-03-05 23:27:26',1),(158,43,'si por el peristaltismo','2013-03-06 01:25:47','2013-03-06 01:25:47',1),(159,43,'no','2013-03-06 01:25:47','2013-03-06 01:25:47',1),(160,43,'si pero si luego nos paramos','2013-03-06 01:25:47','2013-03-06 01:25:47',1),(161,43,'talves','2013-03-06 01:25:47','2013-03-06 01:25:47',1),(162,42,'estariamos jniuasiuhiuhisuahduhasiudhasiudhdiuashaisudhd','2013-03-06 01:26:14','2013-03-06 01:26:14',1),(163,42,'adiuosahdiuahsd','2013-03-06 01:26:14','2013-03-06 01:26:14',1),(164,42,'sadasdsdsd','2013-03-06 01:26:14','2013-03-06 01:26:14',1),(165,42,'dsdsd','2013-03-06 01:26:14','2013-03-06 01:26:14',1),(166,44,'hbhah','2013-03-06 01:27:00','2013-03-06 01:27:00',1),(167,44,'sa','2013-03-06 01:27:00','2013-03-06 01:27:00',1),(168,44,'da','2013-03-06 01:27:00','2013-03-06 01:27:00',1),(169,44,'sas','2013-03-06 01:27:00','2013-03-06 01:27:00',1),(170,45,'quimo','2013-03-06 01:28:36','2013-03-06 01:28:36',1),(171,45,'lipasa','2013-03-06 01:28:36','2013-03-06 01:28:36',1),(172,45,'melasa','2013-03-06 01:28:36','2013-03-06 01:28:36',1),(173,45,'peptasa','2013-03-06 01:28:36','2013-03-06 01:28:36',1),(174,46,'quimo','2013-03-06 01:29:59','2013-03-06 01:29:59',1),(175,46,'quilo','2013-03-06 01:29:59','2013-03-06 01:29:59',1),(176,46,'petdasa','2013-03-06 01:29:59','2013-03-06 01:29:59',1),(177,46,'amilasa','2013-03-06 01:29:59','2013-03-06 01:29:59',1),(178,46,'quimo','2013-03-06 01:30:13','2013-03-06 01:30:13',1),(179,46,'quilo','2013-03-06 01:30:13','2013-03-06 01:30:13',1),(180,46,'petdasa','2013-03-06 01:30:13','2013-03-06 01:30:13',1),(181,46,'amilasa','2013-03-06 01:30:13','2013-03-06 01:30:13',1),(182,46,'quimo','2013-03-06 01:30:34','2013-03-06 01:30:34',1),(183,46,'quilo','2013-03-06 01:30:34','2013-03-06 01:30:34',1),(184,46,'petdasa','2013-03-06 01:30:34','2013-03-06 01:30:34',1),(185,46,'amilasa','2013-03-06 01:30:34','2013-03-06 01:30:34',1),(186,47,'caja','2013-03-06 01:31:48','2013-03-06 01:31:48',1),(187,47,'zapato','2013-03-06 01:31:48','2013-03-06 01:31:48',1),(188,47,'bolsa','2013-03-06 01:31:49','2013-03-06 01:31:49',1),(189,47,'recolector','2013-03-06 01:31:49','2013-03-06 01:31:49',1),(190,47,'caja','2013-03-06 01:32:00','2013-03-06 01:32:00',1),(191,47,'zapato','2013-03-06 01:32:00','2013-03-06 01:32:00',1),(192,47,'bolsa','2013-03-06 01:32:00','2013-03-06 01:32:00',1),(193,47,'recolector','2013-03-06 01:32:00','2013-03-06 01:32:00',1),(194,48,'cerosa','2013-03-06 01:33:25','2013-03-06 01:33:25',1),(195,48,'mucosa','2013-03-06 01:33:25','2013-03-06 01:33:25',1),(196,48,'muscular','2013-03-06 01:33:25','2013-03-06 01:33:25',1),(197,48,'tangencia','2013-03-06 01:33:25','2013-03-06 01:33:25',1),(198,49,'absorver nutrientes','2013-03-06 01:34:51','2013-03-06 01:34:51',1),(199,49,'eliminar bacterias','2013-03-06 01:34:51','2013-03-06 01:34:51',1),(200,49,'agrupar','2013-03-06 01:34:51','2013-03-06 01:34:51',1),(201,49,'descomponer','2013-03-06 01:34:51','2013-03-06 01:34:51',1),(202,50,'peptidasa','2013-03-06 01:36:08','2013-03-06 01:36:08',1),(203,50,'mucosa','2013-03-06 01:36:08','2013-03-06 01:36:08',1),(204,50,'celulosa','2013-03-06 01:36:08','2013-03-06 01:36:08',1),(205,50,'vellosidades','2013-03-06 01:36:08','2013-03-06 01:36:08',1),(206,51,'fabrica de quimicos','2013-03-06 01:37:26','2013-03-06 01:37:26',1),(207,51,'descompensor de grasas','2013-03-06 01:37:26','2013-03-06 01:37:26',1),(208,51,'anulador de toxinas','2013-03-06 01:37:26','2013-03-06 01:37:26',1),(209,51,'mejora el metabolismo','2013-03-06 01:37:26','2013-03-06 01:37:26',1),(210,52,'dilatasion de la mucosa gastrica','2013-03-06 01:38:47','2013-03-06 01:38:47',1),(211,52,'dilatacion de la mucosa del colon','2013-03-06 01:38:47','2013-03-06 01:38:47',1),(212,52,'dilatacion de la serosa gastrica','2013-03-06 01:38:47','2013-03-06 01:38:47',1),(213,52,'dilatanicon del esfinter pilorico','2013-03-06 01:38:47','2013-03-06 01:38:47',1),(214,53,'Prueba. ','2013-03-11 15:23:35','2013-03-11 15:38:08',1),(215,53,'Prueba. ','2013-03-11 15:23:35','2013-03-11 15:38:08',1),(216,53,'Prueb. ','2013-03-11 15:23:35','2013-03-11 15:38:08',1),(217,53,'pRUEBA. ','2013-03-11 15:23:35','2013-03-11 15:38:08',1),(218,54,'asd','2013-03-11 15:39:07','2013-03-11 15:39:07',1),(219,54,'asd','2013-03-11 15:39:07','2013-03-11 15:39:07',1),(220,54,'asd...','2013-03-11 15:39:07','2013-03-11 15:39:07',1),(221,54,'asd','2013-03-11 15:39:07','2013-03-11 15:39:07',1),(222,56,'muere','2013-03-12 15:48:13','2013-03-12 15:49:00',1),(223,56,'colestomi','2013-03-12 15:48:13','2013-03-12 15:49:00',1),(224,56,'braqueotomia','2013-03-12 15:48:13','2013-03-12 15:49:00',1),(225,56,'pluretomia','2013-03-12 15:48:13','2013-03-12 15:49:00',1),(230,57,'no talvez ','2013-03-13 20:17:39','2013-03-13 20:17:39',1),(231,57,'si ','2013-03-13 20:17:39','2013-03-13 20:17:39',1),(232,57,'depronto','2013-03-13 20:17:39','2013-03-13 20:17:39',1),(233,57,'gres','2013-03-13 20:17:39','2013-03-13 20:17:39',1),(234,58,'saborear','2013-03-13 20:21:13','2013-03-13 20:21:13',1),(235,58,'delimitar alimento','2013-03-13 20:21:13','2013-03-13 20:21:13',1),(236,58,'permitir respirar','2013-03-13 20:21:13','2013-03-13 20:21:13',1),(237,58,'COONCORDANCIA','2013-03-13 20:21:13','2013-03-13 20:21:13',1),(238,59,'NO','2013-03-13 20:33:43','2013-03-13 20:33:43',1),(239,59,'SI CADA VEZ QUE SEGREGA ACIDO','2013-03-13 20:33:43','2013-03-13 20:33:43',1),(240,59,'TALVEZ','2013-03-13 20:33:43','2013-03-13 20:33:43',1),(241,59,'DEPRONTO','2013-03-13 20:33:43','2013-03-13 20:33:43',1),(242,61,'d','2013-03-15 11:40:32','2013-03-15 11:40:32',1),(243,61,'eddr','2013-03-15 11:40:32','2013-03-15 11:40:32',1),(244,61,'eded','2013-03-15 11:40:32','2013-03-15 11:40:32',1),(245,61,'edred','2013-03-15 11:40:32','2013-03-15 11:40:32',1),(246,20,'GJVSAVUYHB','2013-03-15 12:11:10','2013-03-15 12:11:10',1),(247,20,'KJBUXZBKBS U','2013-03-15 12:11:10','2013-03-15 12:11:10',1),(248,20,'|JBOIHOIUN OIKJNN','2013-03-15 12:11:10','2013-03-15 12:11:10',1),(249,20,'OIJOIOIJH','2013-03-15 12:11:10','2013-03-15 12:11:10',1),(250,62,'RERE','2013-03-15 12:21:04','2013-03-15 12:21:04',1),(251,62,'WEWE','2013-03-15 12:21:04','2013-03-15 12:21:04',1),(252,62,'WEWEWE','2013-03-15 12:21:04','2013-03-15 12:21:04',1),(253,62,'WEWEWE','2013-03-15 12:21:04','2013-03-15 12:21:04',1),(254,63,'QQQQ','2013-03-15 12:21:39','2013-03-15 12:21:39',1),(255,63,'WWWW','2013-03-15 12:21:39','2013-03-15 12:21:39',1),(256,63,'EEEEEEE','2013-03-15 12:21:39','2013-03-15 12:21:39',1),(257,63,'RRRRRR','2013-03-15 12:21:39','2013-03-15 12:21:39',1),(258,64,'ASA','2013-03-15 12:22:25','2013-03-15 12:22:25',1),(259,64,'SASA','2013-03-15 12:22:25','2013-03-15 12:22:25',1),(260,64,'ASAS','2013-03-15 12:22:25','2013-03-15 12:22:25',1),(261,64,'ASAS','2013-03-15 12:22:25','2013-03-15 12:22:25',1),(262,28,'jgvjgvsq','2013-03-15 20:48:23','2013-03-15 20:48:23',1),(263,28,'hbhahbah','2013-03-15 20:48:23','2013-03-15 20:48:23',1),(264,28,'hhha','2013-03-15 20:48:23','2013-03-15 20:48:23',1),(265,28,'hhshs','2013-03-15 20:48:23','2013-03-15 20:48:23',1),(266,65,'fgdfg','2013-03-15 20:51:08','2013-03-15 20:51:08',1),(267,65,'dfgf','2013-03-15 20:51:08','2013-03-15 20:51:08',1),(268,65,'dffffdf','2013-03-15 20:51:08','2013-03-15 20:51:08',1),(269,65,'dffdfvg','2013-03-15 20:51:08','2013-03-15 20:51:08',1),(270,74,'','2013-04-20 18:33:39','2013-04-20 18:33:39',1),(271,74,'','2013-04-20 18:33:39','2013-04-20 18:33:39',1),(272,74,'','2013-04-20 18:33:39','2013-04-20 18:33:39',1),(273,74,'','2013-04-20 18:33:39','2013-04-20 18:33:39',1),(274,73,'','2013-04-20 18:34:34','2013-04-20 18:34:34',1),(275,73,'','2013-04-20 18:34:34','2013-04-20 18:34:34',1),(276,73,'','2013-04-20 18:34:34','2013-04-20 18:34:34',1),(277,73,'','2013-04-20 18:34:34','2013-04-20 18:34:34',1);
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados_examen_final`
--

DROP TABLE IF EXISTS `resultados_examen_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultados_examen_final` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador propio de la tabla',
  `username` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'NO ASIGNADO' COMMENT 'Nombre del usuario de moodle',
  `subcategoria` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'NO ASIGNADO' COMMENT 'Subcategoria a la que pertenece',
  `resultado` varchar(100) COLLATE utf8_spanish_ci DEFAULT 'NO ASIGNADO' COMMENT 'Resultado Obtenido',
  `fechaactualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha Actualizacion Registro',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'Fecha en la que se realizo el examen final',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=288836 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados_examen_final`
--

LOCK TABLES `resultados_examen_final` WRITE;
/*!40000 ALTER TABLE `resultados_examen_final` DISABLE KEYS */;
INSERT INTO `resultados_examen_final` VALUES (288368,'admin','Identificación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288369,'admin','Diferenciación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288370,'admin','Representación Mental','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288371,'admin','Transformación Mental','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288372,'admin','Comparación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288373,'admin','Clasificación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288374,'admin','Codificación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288375,'admin','Descodificación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288376,'admin','Proyección','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288377,'admin','Análisis','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288378,'admin','Síntesis','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288379,'admin','Inferencia Lógica','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288380,'admin','Razonamiento Analógico','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288381,'admin','Razonamiento Hipotético','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288382,'admin','Razonamiento Transitivo','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288383,'admin','Razonamiento Silogístico','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288384,'admin','Pensamiento Divergente-Convergente','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288385,'admin','Conceptualización','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288386,'admin','Identificación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288387,'admin','Diferenciación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288388,'admin','Representación Mental','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288389,'admin','Transformación Mental','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288390,'admin','Comparación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288391,'admin','Clasificación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288392,'admin','Codificación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288393,'admin','Descodificación','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288394,'admin','Proyección','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288395,'admin','Análisis','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288396,'admin','Síntesis','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288397,'admin','Inferencia Lógica','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288398,'admin','Razonamiento Analógico','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288399,'admin','Razonamiento Hipotético','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288400,'admin','Razonamiento Transitivo','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288401,'admin','Razonamiento Silogístico','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288402,'admin','Pensamiento Divergente-Convergente','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288403,'admin','Conceptualización','Malo','2013-03-07 22:23:24','2007-03-13 17:03:24'),(288422,'','Identificación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288423,'','Diferenciación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288424,'','Representación Mental','Regular','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288425,'','Transformación Mental','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288426,'','Comparación','Malo','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288427,'','Clasificación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288428,'','Codificación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288429,'','Descodificación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288430,'','Proyección','Regular','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288431,'','Análisis','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288432,'','Síntesis','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288433,'','Inferencia Lógica','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288434,'','Razonamiento Analógico','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288435,'','Razonamiento Hipotético','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288436,'','Razonamiento Transitivo','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288437,'','Razonamiento Silogístico','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288438,'','Pensamiento Divergente-Convergente','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288439,'','Conceptualización','Regular','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288440,'','Identificación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288441,'','Diferenciación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288442,'','Representación Mental','Regular','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288443,'','Transformación Mental','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288444,'','Comparación','Malo','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288445,'','Clasificación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288446,'','Codificación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288447,'','Descodificación','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288448,'','Proyección','Regular','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288449,'','Análisis','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288450,'','Síntesis','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288451,'','Inferencia Lógica','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288452,'','Razonamiento Analógico','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288453,'','Razonamiento Hipotético','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288454,'','Razonamiento Transitivo','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288455,'','Razonamiento Silogístico','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288456,'','Pensamiento Divergente-Convergente','','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288457,'','Conceptualización','Regular','2013-03-12 23:20:48','2012-03-13 13:03:48'),(288458,'','Identificación','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288459,'','Diferenciación','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288460,'','Representación Mental','Regular','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288461,'','Transformación Mental','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288462,'','Comparación','Malo','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288463,'','Clasificación','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288464,'','Codificación','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288465,'','Descodificación','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288466,'','Proyección','Regular','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288467,'','Análisis','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288468,'','Síntesis','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288469,'','Inferencia Lógica','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288470,'','Razonamiento Analógico','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288471,'','Razonamiento Hipotético','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288472,'','Razonamiento Transitivo','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288473,'','Razonamiento Silogístico','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288474,'','Pensamiento Divergente-Convergente','','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288475,'','Conceptualización','Regular','2013-03-12 23:20:49','2012-03-13 13:03:49'),(288476,'','Identificación','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288477,'','Diferenciación','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288478,'','Representación Mental','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288479,'','Transformación Mental','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288480,'','Comparación','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288481,'','Clasificación','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288482,'','Codificación','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288483,'','Descodificación','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288484,'','Proyección','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288485,'','Análisis','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288486,'','Síntesis','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288487,'','Inferencia Lógica','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288488,'','Razonamiento Analógico','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288489,'','Razonamiento Hipotético','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288490,'','Razonamiento Transitivo','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288491,'','Razonamiento Silogístico','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288492,'','Pensamiento Divergente-Convergente','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288493,'','Conceptualización','Malo','2013-03-13 08:04:39','2012-03-13 22:03:39'),(288835,'tutor01','Conceptualización','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288834,'tutor01','Pensamiento Divergente-Convergente','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288833,'tutor01','Razonamiento Silogístico','Regular','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288832,'tutor01','Razonamiento Transitivo','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288831,'tutor01','Razonamiento Hipotético','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288830,'tutor01','Razonamiento Analógico','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288829,'tutor01','Inferencia Lógica','Regular','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288828,'tutor01','Síntesis','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288827,'tutor01','Análisis','Regular','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288826,'tutor01','Proyección','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288825,'tutor01','Descodificación','Regular','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288824,'tutor01','Codificación','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288823,'tutor01','Clasificación','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288822,'tutor01','Comparación','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288821,'tutor01','Transformación Mental','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288820,'tutor01','Representación Mental','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288819,'tutor01','Diferenciación','Malo','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288816,'estudiante1','Pensamiento Divergente-Convergente','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288817,'estudiante1','Conceptualización','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288818,'tutor01','Identificación','Regular','2013-03-16 06:53:18','2015-03-13 20:03:18'),(288815,'estudiante1','Razonamiento Silogístico','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288814,'estudiante1','Razonamiento Transitivo','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288813,'estudiante1','Razonamiento Hipotético','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288810,'estudiante1','Síntesis','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288811,'estudiante1','Inferencia Lógica','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288812,'estudiante1','Razonamiento Analógico','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288808,'estudiante1','Proyección','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288809,'estudiante1','Análisis','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288807,'estudiante1','Descodificación','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288806,'estudiante1','Codificación','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288805,'estudiante1','Clasificación','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288804,'estudiante1','Comparación','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288803,'estudiante1','Transformación Mental','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288802,'estudiante1','Representación Mental','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288801,'estudiante1','Diferenciación','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58'),(288800,'estudiante1','Identificación','Malo','2013-03-16 06:46:58','2015-03-13 20:03:58');
/*!40000 ALTER TABLE `resultados_examen_final` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados_test`
--

DROP TABLE IF EXISTS `resultados_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultados_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla',
  `username` varchar(255) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Identificador de usuario para moodle',
  `idtest` int(11) NOT NULL COMMENT 'Identificador de test realizado',
  `intentosfallidos` int(11) DEFAULT '0' COMMENT 'Numero de intentos fallidos antes de aprobar el test',
  `ultimo_orden_valido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `rutaaprendizaje_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resultados_test_rutaaprendizaje1_idx` (`rutaaprendizaje_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados_test`
--

LOCK TABLES `resultados_test` WRITE;
/*!40000 ALTER TABLE `resultados_test` DISABLE KEYS */;
INSERT INTO `resultados_test` VALUES (1,'profesor1',28,0,'comic',30),(2,'estudiante12',28,0,'comic',30);
/*!40000 ALTER TABLE `resultados_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutaaprendizaje`
--

DROP TABLE IF EXISTS `rutaaprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutaaprendizaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'NO ASIGNADO',
  `data` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '{}',
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `sistema_digestivo_codigo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sistemaruta` (`sistema_digestivo_codigo`),
  CONSTRAINT `fk_rutaaprendizaje_unico` FOREIGN KEY (`sistema_digestivo_codigo`) REFERENCES `sistemas_digestivos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutaaprendizaje`
--

LOCK TABLES `rutaaprendizaje` WRITE;
/*!40000 ALTER TABLE `rutaaprendizaje` DISABLE KEYS */;
INSERT INTO `rutaaprendizaje` VALUES (27,'asdsdaasdsad','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,30,2,3,0,1,4',1,'0000-00-00','alto'),(30,'medio','medio.flv,comic_medio.swf,act_medio.jclic.zip,presmedio.swf,28,2,1,0,3,4',1,'0000-00-00','medio');
/*!40000 ALTER TABLE `rutaaprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_config`
--

DROP TABLE IF EXISTS `sf_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_config` (
  `sf_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `sf_table` varchar(64) NOT NULL DEFAULT '',
  `sf_field` varchar(64) NOT NULL DEFAULT '',
  `sf_type` varchar(16) DEFAULT 'default',
  `sf_related` varchar(100) DEFAULT '',
  `sf_label` varchar(64) DEFAULT '',
  `sf_desc` tinytext,
  `sf_order` int(3) DEFAULT NULL,
  `sf_hidden` int(1) DEFAULT '0',
  PRIMARY KEY (`sf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_config`
--

LOCK TABLES `sf_config` WRITE;
/*!40000 ALTER TABLE `sf_config` DISABLE KEYS */;
INSERT INTO `sf_config` VALUES (1,'orden','id','default','','',NULL,NULL,0),(2,'orden','test_id','default','','',NULL,NULL,0),(3,'orden','orden_test','default','','',NULL,NULL,0),(4,'preguntas','id','default','','',NULL,NULL,0),(5,'preguntas','pregunta','default','','',NULL,NULL,0),(6,'preguntas','valor','default','','',NULL,NULL,0),(7,'preguntas','respuestacorrecta','default','','',NULL,NULL,0),(8,'preguntas','fechacreacion','default','','',NULL,NULL,0),(9,'preguntas','fechaactualizacion','default','','',NULL,NULL,0),(10,'preguntas','usuario_id','default','','',NULL,NULL,0),(11,'principal','id','default','','',NULL,NULL,0),(12,'principal','nombre','default','','',NULL,NULL,0),(13,'principal','fechacreacion','default','','',NULL,NULL,0),(14,'principal','fechaactualizacion','default','','',NULL,NULL,0),(15,'principal','usuario_id','default','','',NULL,NULL,0),(16,'principal','orden_id','default','','',NULL,NULL,0),(17,'respuestas','id','default','','',NULL,NULL,0),(18,'respuestas','pregunta_id','default','','',NULL,NULL,0),(19,'respuestas','texto','default','','',NULL,NULL,0),(20,'respuestas','fechacreacion','default','','',NULL,NULL,0),(21,'respuestas','fechaactualizacion','default','','',NULL,NULL,0),(22,'respuestas','usuario_id','default','','',NULL,NULL,0),(23,'test','id','default','','',NULL,NULL,0),(24,'test','nombre','default','','',NULL,NULL,0),(25,'test','fechacreacion','default','','',NULL,NULL,0),(26,'test','fechaactualizacion','default','','',NULL,NULL,0),(27,'test','usuario_id','default','','',NULL,NULL,0),(28,'test_preguntas','id','default','','',NULL,NULL,0),(29,'test_preguntas','test_id','default','','',NULL,NULL,0),(30,'test_preguntas','pregunta_id','default','','',NULL,NULL,0),(31,'test_preguntas','fechacreacion','default','','',NULL,NULL,0),(32,'test_preguntas','fechaactualizacion','default','','',NULL,NULL,0),(33,'test_preguntas','usuario_id','default','','',NULL,NULL,0);
/*!40000 ALTER TABLE `sf_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistemas_digestivos`
--

DROP TABLE IF EXISTS `sistemas_digestivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistemas_digestivos` (
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codsistema` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistemas_digestivos`
--

LOCK TABLES `sistemas_digestivos` WRITE;
/*!40000 ALTER TABLE `sistemas_digestivos` DISABLE KEYS */;
INSERT INTO `sistemas_digestivos` VALUES ('Sistema digestivo Alto','alto'),('Sistema digestivo Bajo','bajo'),('Sistema digestivo Medio','medio');
/*!40000 ALTER TABLE `sistemas_digestivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de subcategoria',
  `sistema_digestivo` varchar(255) COLLATE utf8_spanish_ci DEFAULT 'No Asignado' COMMENT 'Sistema digestivo al que pertenece la subcategoria',
  `subcategoria` varchar(255) COLLATE utf8_spanish_ci DEFAULT 'No Asignado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategorias`
--

LOCK TABLES `subcategorias` WRITE;
/*!40000 ALTER TABLE `subcategorias` DISABLE KEYS */;
INSERT INTO `subcategorias` VALUES (1,'alto','dientes'),(2,'alto','lengua'),(3,'alto','glandulas salivales'),(4,'alto','esofago'),(5,'medio','estomago'),(6,'medio','No Asignado'),(7,'medio','No Asignado'),(8,'bajo','intestino delgado'),(9,'bajo','intestino grueso'),(10,'final','Identificación'),(11,'final','Diferenciación'),(12,'final','Representación Mental'),(13,'final','Transformación Mental'),(14,'final','Comparación'),(15,'final','Clasificación'),(16,'final','Codificación'),(17,'final','Descodificación'),(18,'final','Proyección'),(19,'final','Análisis'),(20,'final','Síntesis'),(21,'final','Inferencia Lógica'),(22,'final','Razonamiento Analógico'),(23,'final','Razonamiento Hipotético'),(24,'final','Razonamiento Transitivo'),(25,'final','Razonamiento Silogístico'),(26,'final','Pensamiento Divergente-Convergente'),(27,'final','Conceptualización');
/*!40000 ALTER TABLE `subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla',
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre de test o descripcion',
  `valor` int(11) DEFAULT NULL COMMENT 'Valor con el cual puede aprobar el test',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'Fecha creacion',
  `fechaactualizacion` datetime DEFAULT NULL COMMENT 'Fecha actualizacion',
  `usuario_id` int(11) DEFAULT NULL COMMENT 'Identificador del usuario',
  `tipo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Tipo de test Alto Medio Bajo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (27,'primero',5,'2013-01-29 19:02:57','2013-02-11 18:06:40',1,'alto'),(28,'segundo',2,'2013-02-19 20:59:41','2013-04-23 21:43:14',1,'medio'),(29,'sistem bajo',89,'2013-03-12 15:46:17','2013-03-12 15:46:17',1,'bajo'),(30,'test 1',6,'2013-03-13 20:12:16','2013-03-13 20:12:16',1,'alto'),(31,'sadasdasdad',0,'2013-04-20 17:20:38','2013-04-20 17:20:38',1,'alto'),(32,'asdsadsad',0,'2013-04-20 17:21:08','2013-04-20 17:32:17',1,'alto'),(33,'sadasdasd',0,'2013-04-20 17:22:51','2013-04-20 17:22:51',1,'alto'),(34,'sadasdsad',0,'2013-04-20 17:23:02','2013-04-20 17:23:02',1,'alto'),(35,'dasdasd',0,'2013-04-20 17:24:46','2013-04-20 17:24:46',1,'alto'),(36,'dasdasd',0,'2013-04-20 17:25:04','2013-04-20 17:25:04',1,'alto'),(37,'dasdasd',0,'2013-04-20 17:25:51','2013-04-20 17:25:51',1,'alto'),(38,'dasdasd',0,'2013-04-20 17:26:47','2013-04-20 17:26:47',1,'alto'),(39,'dasdasd',0,'2013-04-20 17:27:38','2013-04-20 17:27:38',1,'alto');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_preguntas`
--

DROP TABLE IF EXISTS `test_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla',
  `test_id` int(11) DEFAULT NULL COMMENT 'Identificador de test al que pertenece',
  `pregunta_id` int(11) DEFAULT NULL COMMENT 'Identificador de pregunta a la que pertenece',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'fecha de creacion',
  `fechaactualizacion` datetime DEFAULT NULL COMMENT 'fecha de actualizacion',
  `usuario_id` int(11) DEFAULT NULL COMMENT 'identificador de usuario',
  PRIMARY KEY (`id`),
  KEY `FK_test_preguntas` (`test_id`),
  KEY `FK_test_preguntas_many` (`pregunta_id`),
  CONSTRAINT `FK_test_preguntas` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_test_preguntas_many` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_preguntas`
--

LOCK TABLES `test_preguntas` WRITE;
/*!40000 ALTER TABLE `test_preguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cuestionario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-24 23:34:38
