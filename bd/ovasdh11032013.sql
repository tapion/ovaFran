/*
SQLyog Ultimate v9.63 
MySQL - 5.0.51b-community-nt-log : Database - cuestionario
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cuestionario` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

USE `cuestionario`;

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) collate utf8_spanish_ci NOT NULL default '0',
  `ip_address` varchar(45) collate utf8_spanish_ci NOT NULL default '0',
  `user_agent` varchar(120) collate utf8_spanish_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL default '0',
  `user_data` text collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('887c83ea13615253bc5f39c9a8d1d0f0','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.152 Safari/537.22',1363037938,'a:4:{s:9:\"user_data\";s:0:\"\";s:6:\"userid\";s:1:\"6\";s:8:\"username\";s:7:\"tutor01\";s:7:\"role_id\";s:1:\"3\";}');

/*Table structure for table `imagenes` */

DROP TABLE IF EXISTS `imagenes`;

CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de tabla imagenes',
  `ruta` varchar(200) collate utf8_spanish_ci NOT NULL COMMENT 'Rutas para las imagenes a asignar en las preguntas del test',
  `pregunta_id` int(11) NOT NULL COMMENT 'Identificador de pregunta a la que pertenece',
  `orden` int(1) default '0' COMMENT 'Orden en que se mostraran las imagenes',
  `nombre` varchar(100) collate utf8_spanish_ci default 'NO ASIGNADO' COMMENT 'Nombre de la imagen a buscar en el texto cuando se va a reemplazar',
  PRIMARY KEY  (`id`),
  KEY `FK_imagenes` (`pregunta_id`),
  CONSTRAINT `FK_imagenes` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena la ruta de las imagenes que pertenecen a las pregun';

/*Data for the table `imagenes` */

insert  into `imagenes`(`id`,`ruta`,`pregunta_id`,`orden`,`nombre`) values (10,'Penguins.jpg',15,0,'pii');

/*Table structure for table `orden` */

DROP TABLE IF EXISTS `orden`;

CREATE TABLE `orden` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de tabla',
  `test_id` int(11) default NULL COMMENT 'Identificador para test',
  `orden_test` int(11) default NULL COMMENT 'Orden para la presentacion el test',
  PRIMARY KEY  (`id`),
  KEY `FK_orden` (`test_id`),
  CONSTRAINT `FK_orden` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena el orden de las tareas para principal';

/*Data for the table `orden` */

/*Table structure for table `preguntas` */

DROP TABLE IF EXISTS `preguntas`;

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Idetificador de la tabla',
  `pregunta` varchar(255) collate utf8_spanish_ci default NULL COMMENT 'Texto para la pregunta planteada',
  `valor` int(11) default NULL COMMENT 'Valor asignado a la pregunta',
  `respuestacorrecta` int(11) default NULL COMMENT 'Id de respuesta correcta para la pregunta',
  `fechacreacion` datetime default NULL COMMENT 'Fecha de creacion',
  `fechaactualizacion` datetime default NULL COMMENT 'Fecha de actualizacion',
  `usuario_id` int(11) default NULL COMMENT 'Usuario que modifico o actualizo la pregunta',
  `idtest` int(11) default NULL COMMENT 'Identificador de test al que pertenece',
  `subcategoria` varchar(255) collate utf8_spanish_ci default NULL COMMENT 'Identificador para la subcategoria asignada',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `preguntas` */

insert  into `preguntas`(`id`,`pregunta`,`valor`,`respuestacorrecta`,`fechacreacion`,`fechaactualizacion`,`usuario_id`,`idtest`,`subcategoria`) values (13,'Pregunta Prueba',30,4,'2013-03-11 16:05:55','2013-03-11 16:05:55',1,26,'esofago'),(14,'Pregunta No1 Diferenciacion',445,1,'2013-01-23 15:15:16','2013-01-23 15:15:16',1,-1,'Transformación Mental'),(15,'el estomago es el encargado de almacenar el alimnto?\r\n',1,3,'2013-03-07 15:39:02','2013-03-07 15:39:03',1,-1,'Conceptualización'),(16,'como se llama la parte dura del diente que se encarga de romper los alimentos',1,4,'2013-01-29 19:04:39','2013-01-29 19:04:39',1,27,'dientes'),(17,'pailas gustativas encargadas del sabor percibir el sabor dulce',2,2,'2013-01-29 19:48:54','2013-01-29 19:48:54',1,27,'lengua'),(18,'glandulas que se encuentran en el maxilar superior',2,1,'2013-01-29 19:49:18','2013-01-29 19:49:18',1,27,'glandulas salivales'),(19,'cual es la funcion del estomago',2,3,'2013-02-19 21:02:16','2013-02-19 21:02:16',1,28,'estomago'),(20,'es la lengua un organo movil o inmovil',12,1,'2013-03-05 20:23:50','2013-03-05 20:23:50',1,-1,'Identificación'),(21,'la saliva contiene',5,3,'2013-03-05 20:27:58','2013-03-05 20:27:58',1,-1,'Diferenciación'),(22,'el estoamgo es',5,4,'2013-03-05 20:29:19','2013-03-05 20:29:19',1,-1,'Diferenciación'),(23,'el pancreas secreta',8,3,'2013-03-05 20:31:14','2013-03-05 20:31:14',1,-1,'Representación Mental'),(24,'cuando una masa se presenta en el abdomen que s',8,4,'2013-03-05 20:37:34','2013-03-05 20:37:34',1,-1,'Representación Mental'),(25,'que requiere el acvido para no matar las celulas estomacales',8,4,'2013-03-05 20:44:11','2013-03-05 20:44:11',1,-1,'Clasificación'),(26,'QUE SE REQUIERE PARA ALIMENTAR EL CUERPO HUMANO',45,4,'2013-03-05 20:47:40','2013-03-05 20:47:40',1,-1,'Clasificación'),(27,'ES EL ORGANO AMS GRANDE DE L CUERPO HUMANO',0,0,'2013-03-05 20:52:07','2013-03-05 20:52:07',1,-1,'Codificación'),(28,'ORGANO ENCARGADO DE TRITURAR LOS ALIMENTIOS',45,1,'2013-03-05 20:54:49','2013-03-05 20:54:49',1,-1,'Codificación'),(29,'OBSORVE LOS NUTRIENTES DE LA NUTRICION',56,2,'2013-03-05 20:56:00','2013-03-05 20:56:00',1,-1,'Descodificación'),(30,'propone emityir señales ',78,3,'2013-03-05 20:59:27','2013-03-05 20:59:27',1,-1,'Descodificación'),(31,'usa la pepsina para descomprimir proteinas',58,3,'2013-03-05 21:01:23','2013-03-05 21:01:23',1,-1,'Descodificación'),(32,'si se quita el pancreas que no puede comer',78,1,'2013-03-05 21:05:29','2013-03-05 21:05:29',1,-1,'Proyección'),(33,'cuando se quita el estomago que nop puede comer la persona',68,3,'2013-03-05 21:07:06','2013-03-05 21:07:06',1,-1,'Proyección'),(34,'si te da diarrea que no funciona bien',485,2,'2013-03-05 21:09:46','2013-03-05 21:09:46',1,-1,'Análisis'),(35,'como se genera la saliva',56,1,'2013-03-05 21:11:14','2013-03-05 21:11:14',1,-1,'Análisis'),(36,'que parte de intestino absorve los nutrientes',561,2,'2013-03-05 22:53:58','2013-03-05 22:53:58',1,-1,'Síntesis'),(37,'como se elabora la papsina',784,3,'2013-03-05 22:56:33','2013-03-05 22:56:33',1,-1,'Síntesis'),(38,'si se quita el higado que sucederia',78,1,'2013-03-05 23:00:17','2013-03-05 23:00:17',1,-1,'Inferencia Lógica'),(39,'se podra vivir sin estomago?',4635,2,'2013-03-05 23:07:20','2013-03-05 23:07:20',1,-1,'Identificación'),(40,'queda al lado derecho encima del colon',45,3,'2013-03-05 23:13:21','2013-03-05 23:13:21',1,-1,'Identificación'),(41,'un pancreas con cancer se puede quitar?',78,3,'2013-03-05 23:18:02','2013-03-05 23:18:02',1,-1,'Razonamiento Analógico'),(42,'si se quita en colon como se podria vivir',78,4,'2013-03-05 23:28:20','2013-03-05 23:28:20',1,-1,'Razonamiento Analógico'),(43,'se puede comer boqui arriba?',78,4,'2013-03-06 01:25:13','2013-03-06 01:25:13',1,-1,'Razonamiento Hipotético'),(44,'i a es b b es a',63,2,'2013-03-06 01:26:44','2013-03-06 01:26:44',1,-1,'Razonamiento Hipotético'),(45,'en que se convierte el alimento luego de estar en el estomago',58,1,'2013-03-06 01:28:20','2013-03-06 01:28:20',1,-1,'Razonamiento Transitivo'),(46,'cuano el quimo pasa al intestino delgado en que se transaforma',23,2,'2013-03-06 01:29:38','2013-03-06 01:29:38',1,-1,'Razonamiento Transitivo'),(47,'la luna es a noche como estomago a?',54,3,'2013-03-06 01:31:26','2013-03-06 01:31:26',1,-1,'Razonamiento Silogístico'),(48,'la capa que produce el acido es',51,2,'2013-03-06 01:33:02','2013-03-06 01:33:02',1,-1,'Razonamiento Silogístico'),(49,'la funcion del acido estomal es',58,4,'2013-03-06 01:34:15','2013-03-06 01:34:15',1,-1,'Pensamiento Divergente-Convergente'),(50,'el intestino delgado tiene un conducto que lleva los nutrientes a la sangre',37,4,'2013-03-06 01:35:42','2013-03-06 01:35:42',1,-1,'Pensamiento Divergente-Convergente'),(51,'el higado es',56,2,'2013-03-06 01:36:41','2013-03-06 01:36:41',1,-1,'Conceptualización'),(52,'las hemorroides son',73,2,'2013-03-06 01:38:02','2013-03-06 01:38:02',1,-1,'Conceptualización'),(53,'Prueba.',2,1,'2013-03-11 15:24:50','2013-03-11 15:24:50',1,-1,'Identificación'),(54,'Pregunta Prueba',21,1,'2013-03-11 15:38:47','2013-03-11 15:38:47',1,-1,'Síntesis'),(55,'asdsad',123123,1,'2013-03-11 16:06:09','2013-03-11 16:06:09',1,26,'dientes');

/*Table structure for table `principal` */

DROP TABLE IF EXISTS `principal`;

CREATE TABLE `principal` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de la tabla principal',
  `nombre` varchar(100) collate utf8_spanish_ci default 'No Asigando',
  `fechacreacion` datetime default NULL,
  `fechaactualizacion` datetime default NULL,
  `usuario_id` int(11) default NULL,
  `orden_id` int(11) default NULL COMMENT 'Orden para el test, comic, y video',
  PRIMARY KEY  (`id`),
  KEY `FK_principal` (`orden_id`),
  CONSTRAINT `FK_principal` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `principal` */

/*Table structure for table `respuestas` */

DROP TABLE IF EXISTS `respuestas`;

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de respuesta',
  `pregunta_id` int(11) NOT NULL COMMENT 'Identificador de la pregunta a la que pertenece',
  `texto` varchar(255) collate utf8_bin default NULL COMMENT 'Texto de la respuesta',
  `fechacreacion` datetime default NULL COMMENT 'Fecha de creacion',
  `fechaactualizacion` datetime default NULL COMMENT 'Fecha de actualizacion',
  `usuario_id` int(11) default NULL COMMENT 'Identificador de usuario',
  PRIMARY KEY  (`id`),
  KEY `FK_respuestas` (`pregunta_id`),
  CONSTRAINT `FK_respuestas` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `respuestas` */

insert  into `respuestas`(`id`,`pregunta_id`,`texto`,`fechacreacion`,`fechaactualizacion`,`usuario_id`) values (30,13,'jufvv','2012-11-28 20:54:29','2013-03-06 01:39:18',1),(31,13,'yu','2012-11-28 20:54:29','2013-03-06 01:39:18',1),(32,13,'lk','2012-11-28 20:54:29','2013-03-06 01:39:18',1),(33,13,'po','2012-11-28 20:54:29','2013-03-06 01:39:18',1),(34,14,'higado.','2013-01-23 15:15:26','2013-03-11 15:38:25',1),(35,14,'pancreas','2013-01-23 15:15:26','2013-03-11 15:38:25',1),(36,14,'polimorfes','2013-01-23 15:15:26','2013-03-11 15:38:25',1),(37,14,'direcionalismo','2013-01-23 15:15:26','2013-03-11 15:38:25',1),(38,16,'corona','2013-01-29 19:05:20','2013-01-29 19:05:20',1),(39,16,'esmalte','2013-01-29 19:05:20','2013-01-29 19:05:20',1),(40,16,'dentina','2013-01-29 19:05:20','2013-01-29 19:05:20',1),(41,16,'raiz','2013-01-29 19:05:20','2013-01-29 19:05:20',1),(42,16,'corona','2013-01-29 19:06:22','2013-01-29 19:06:22',1),(43,16,'esmalte','2013-01-29 19:06:22','2013-01-29 19:06:22',1),(44,16,'dentina','2013-01-29 19:06:22','2013-01-29 19:06:22',1),(45,16,'raiz','2013-01-29 19:06:22','2013-01-29 19:06:22',1),(46,17,'falsiformes','2013-01-29 19:08:52','2013-01-29 19:48:50',1),(47,17,'diploides','2013-01-29 19:08:52','2013-01-29 19:48:50',1),(48,17,'fungiformes','2013-01-29 19:08:52','2013-01-29 19:48:50',1),(49,17,'estadiformes','2013-01-29 19:08:52','2013-01-29 19:48:50',1),(50,17,'','2013-01-29 19:08:57','2013-01-29 19:48:50',1),(51,17,'','2013-01-29 19:08:57','2013-01-29 19:48:50',1),(52,17,'','2013-01-29 19:08:57','2013-01-29 19:48:50',1),(53,17,'','2013-01-29 19:08:57','2013-01-29 19:48:50',1),(54,17,'','2013-01-29 19:08:59','2013-01-29 19:48:50',1),(55,17,'','2013-01-29 19:08:59','2013-01-29 19:48:50',1),(56,17,'','2013-01-29 19:08:59','2013-01-29 19:48:50',1),(57,17,'','2013-01-29 19:08:59','2013-01-29 19:48:50',1),(58,18,'estelizidas','2013-01-29 19:10:45','2013-01-29 19:10:45',1),(59,18,'submaxilares','2013-01-29 19:10:45','2013-01-29 19:10:45',1),(60,18,'sublinguales','2013-01-29 19:10:45','2013-01-29 19:10:45',1),(61,18,'diploides','2013-01-29 19:10:45','2013-01-29 19:10:45',1),(62,18,'estelizidas','2013-01-29 19:10:48','2013-01-29 19:10:48',1),(63,18,'submaxilares','2013-01-29 19:10:48','2013-01-29 19:10:48',1),(64,18,'sublinguales','2013-01-29 19:10:48','2013-01-29 19:10:48',1),(65,18,'diploides','2013-01-29 19:10:48','2013-01-29 19:10:48',1),(66,19,'asdf','2013-02-19 21:06:10','2013-02-19 21:06:10',1),(67,19,'ghj','2013-02-19 21:06:10','2013-02-19 21:06:10',1),(68,19,'rty','2013-02-19 21:06:10','2013-02-19 21:06:10',1),(69,19,'qwer','2013-02-19 21:06:10','2013-02-19 21:06:10',1),(70,21,'amilasa','2013-03-05 20:28:41','2013-03-05 20:28:41',1),(71,21,'lipasa','2013-03-05 20:28:41','2013-03-05 20:28:41',1),(72,21,'melasa','2013-03-05 20:28:41','2013-03-05 20:28:41',1),(73,21,'aidasa','2013-03-05 20:28:41','2013-03-05 20:28:41',1),(74,23,'a','2013-03-05 20:33:11','2013-03-05 20:33:11',1),(75,23,'s','2013-03-05 20:33:12','2013-03-05 20:33:12',1),(76,23,'d','2013-03-05 20:33:12','2013-03-05 20:33:12',1),(77,23,'e','2013-03-05 20:33:12','2013-03-05 20:33:12',1),(78,22,'pacreasa','2013-03-05 20:33:40','2013-03-05 20:33:40',1),(79,22,'asontasa','2013-03-05 20:33:41','2013-03-05 20:33:41',1),(80,22,'lepilasa','2013-03-05 20:33:41','2013-03-05 20:33:41',1),(81,22,'asorasa','2013-03-05 20:33:41','2013-03-05 20:33:41',1),(82,22,'pacreasa','2013-03-05 20:36:00','2013-03-05 20:36:00',1),(83,22,'asontasa','2013-03-05 20:36:01','2013-03-05 20:36:01',1),(84,22,'lepilasa','2013-03-05 20:36:01','2013-03-05 20:36:01',1),(85,22,'asorasa','2013-03-05 20:36:01','2013-03-05 20:36:01',1),(86,24,'cancer','2013-03-05 20:38:12','2013-03-05 20:38:12',1),(87,24,'tumor','2013-03-05 20:38:13','2013-03-05 20:38:13',1),(88,24,'melanoma','2013-03-05 20:38:13','2013-03-05 20:38:13',1),(89,24,'carcinoma','2013-03-05 20:38:13','2013-03-05 20:38:13',1),(90,15,'no es el encargado de segregarlogbsbhs','2013-03-05 20:41:39','2013-03-05 20:41:39',1),(91,15,'es el encargadod e comprimirlo','2013-03-05 20:41:40','2013-03-05 20:41:40',1),(92,15,'es el encargado de disolverlo','2013-03-05 20:41:40','2013-03-05 20:41:40',1),(93,15,'es una bolsa no mas','2013-03-05 20:41:40','2013-03-05 20:41:40',1),(94,25,'acido','2013-03-05 20:45:22','2013-03-05 20:45:38',1),(95,25,'salidificacion','2013-03-05 20:45:23','2013-03-05 20:45:38',1),(96,25,'AGUA','2013-03-05 20:45:23','2013-03-05 20:45:39',1),(97,25,'bicarbonato','2013-03-05 20:45:23','2013-03-05 20:45:39',1),(98,27,'HIGADO','2013-03-05 20:52:56','2013-03-05 20:52:56',1),(99,27,'PANCREAS','2013-03-05 20:52:56','2013-03-05 20:52:56',1),(100,27,'ESTOMAGO','2013-03-05 20:52:56','2013-03-05 20:52:56',1),(101,27,'INTESTINO','2013-03-05 20:52:56','2013-03-05 20:52:56',1),(102,26,'AGUS','2013-03-05 20:53:18','2013-03-05 20:53:18',1),(103,26,'VERDURAS','2013-03-05 20:53:18','2013-03-05 20:53:18',1),(104,26,'VEGETALES','2013-03-05 20:53:18','2013-03-05 20:53:18',1),(105,26,'GASEOSA','2013-03-05 20:53:18','2013-03-05 20:53:18',1),(106,29,'intestino','2013-03-05 20:58:30','2013-03-05 20:58:30',1),(107,29,'sofago','2013-03-05 20:58:30','2013-03-05 20:58:30',1),(108,29,'higado','2013-03-05 20:58:31','2013-03-05 20:58:31',1),(109,29,'pancreas','2013-03-05 20:58:31','2013-03-05 20:58:31',1),(110,30,'intesttino','2013-03-05 20:59:59','2013-03-05 20:59:59',1),(111,30,'pncreas','2013-03-05 20:59:59','2013-03-05 20:59:59',1),(112,30,'estomago','2013-03-05 20:59:59','2013-03-05 20:59:59',1),(113,30,'colon','2013-03-05 20:59:59','2013-03-05 20:59:59',1),(114,31,'estomago','2013-03-05 21:04:40','2013-03-05 21:04:40',1),(115,31,'amilasa','2013-03-05 21:04:40','2013-03-05 21:04:40',1),(116,31,'lipas','2013-03-05 21:04:40','2013-03-05 21:04:40',1),(117,31,'peptasa','2013-03-05 21:04:40','2013-03-05 21:04:40',1),(118,32,'azucar','2013-03-05 21:05:51','2013-03-05 21:05:51',1),(119,32,'miel','2013-03-05 21:05:51','2013-03-05 21:05:51',1),(120,32,'sal','2013-03-05 21:05:51','2013-03-05 21:05:51',1),(121,32,'gaseosa','2013-03-05 21:05:51','2013-03-05 21:05:51',1),(122,33,'agua','2013-03-05 21:08:25','2013-03-05 21:08:25',1),(123,33,'arroz','2013-03-05 21:08:25','2013-03-05 21:08:25',1),(124,33,'carne','2013-03-05 21:08:25','2013-03-05 21:08:25',1),(125,33,'sopa','2013-03-05 21:08:25','2013-03-05 21:08:25',1),(126,34,'higado','2013-03-05 21:10:22','2013-03-05 21:10:22',1),(127,34,'intestino delgado','2013-03-05 21:10:22','2013-03-05 21:10:22',1),(128,34,'pancreas','2013-03-05 21:10:22','2013-03-05 21:10:22',1),(129,34,' lengua','2013-03-05 21:10:22','2013-03-05 21:10:22',1),(130,35,'asei','2013-03-05 21:54:16','2013-03-05 22:32:03',1),(131,35,'gvgvaggv','2013-03-05 21:54:16','2013-03-05 22:32:03',1),(132,35,'vgvgvgv%7C','2013-03-05 21:54:16','2013-03-05 22:32:03',1),(133,35,'jgvgvgv','2013-03-05 21:54:16','2013-03-05 22:32:03',1),(134,36,'pepsina','2013-03-05 22:54:27','2013-03-05 22:54:27',1),(135,36,'vellosidades','2013-03-05 22:54:27','2013-03-05 22:54:27',1),(136,36,'amilasa','2013-03-05 22:54:27','2013-03-05 22:54:27',1),(137,36,'peptidasa','2013-03-05 22:54:27','2013-03-05 22:54:27',1),(138,37,'celulosa','2013-03-05 22:57:36','2013-03-05 22:57:36',1),(139,37,'cerosa','2013-03-05 22:57:36','2013-03-05 22:57:36',1),(140,37,'maltosa','2013-03-05 22:57:36','2013-03-05 22:57:36',1),(141,37,'peptidasa','2013-03-05 22:57:36','2013-03-05 22:57:36',1),(142,38,'se moriria si higado no se puede vivir','2013-03-05 23:01:07','2013-03-05 23:01:07',1),(143,38,'no podria comer azucar','2013-03-05 23:01:07','2013-03-05 23:01:07',1),(144,38,' no podria comer sal','2013-03-05 23:01:07','2013-03-05 23:01:07',1),(145,38,'la sangre se continaminaria','2013-03-05 23:01:07','2013-03-05 23:01:07',1),(146,40,'estomago','2013-03-05 23:13:48','2013-03-05 23:13:48',1),(147,40,'pancreas','2013-03-05 23:13:48','2013-03-05 23:13:48',1),(148,40,'higado','2013-03-05 23:13:48','2013-03-05 23:13:48',1),(149,40,'esofago','2013-03-05 23:13:48','2013-03-05 23:13:48',1),(150,39,'si sin comer solidos','2013-03-05 23:15:14','2013-03-05 23:15:14',1),(151,39,'si comiendo de todo menos carne','2013-03-05 23:15:14','2013-03-05 23:15:14',1),(152,39,'no es imposible','2013-03-05 23:15:14','2013-03-05 23:15:14',1),(153,39,'no la sangre no tiene antioxidantes','2013-03-05 23:15:14','2013-03-05 23:15:14',1),(154,41,'si','2013-03-05 23:27:26','2013-03-05 23:27:26',1),(155,41,'no','2013-03-05 23:27:26','2013-03-05 23:27:26',1),(156,41,'talves','2013-03-05 23:27:26','2013-03-05 23:27:26',1),(157,41,'depronto','2013-03-05 23:27:26','2013-03-05 23:27:26',1),(158,43,'si por el peristaltismo','2013-03-06 01:25:47','2013-03-06 01:25:47',1),(159,43,'no','2013-03-06 01:25:47','2013-03-06 01:25:47',1),(160,43,'si pero si luego nos paramos','2013-03-06 01:25:47','2013-03-06 01:25:47',1),(161,43,'talves','2013-03-06 01:25:47','2013-03-06 01:25:47',1),(162,42,'estariamos jniuasiuhiuhisuahduhasiudhasiudhdiuashaisudhd','2013-03-06 01:26:14','2013-03-06 01:26:14',1),(163,42,'adiuosahdiuahsd','2013-03-06 01:26:14','2013-03-06 01:26:14',1),(164,42,'sadasdsdsd','2013-03-06 01:26:14','2013-03-06 01:26:14',1),(165,42,'dsdsd','2013-03-06 01:26:14','2013-03-06 01:26:14',1),(166,44,'hbhah','2013-03-06 01:27:00','2013-03-06 01:27:00',1),(167,44,'sa','2013-03-06 01:27:00','2013-03-06 01:27:00',1),(168,44,'da','2013-03-06 01:27:00','2013-03-06 01:27:00',1),(169,44,'sas','2013-03-06 01:27:00','2013-03-06 01:27:00',1),(170,45,'quimo','2013-03-06 01:28:36','2013-03-06 01:28:36',1),(171,45,'lipasa','2013-03-06 01:28:36','2013-03-06 01:28:36',1),(172,45,'melasa','2013-03-06 01:28:36','2013-03-06 01:28:36',1),(173,45,'peptasa','2013-03-06 01:28:36','2013-03-06 01:28:36',1),(174,46,'quimo','2013-03-06 01:29:59','2013-03-06 01:29:59',1),(175,46,'quilo','2013-03-06 01:29:59','2013-03-06 01:29:59',1),(176,46,'petdasa','2013-03-06 01:29:59','2013-03-06 01:29:59',1),(177,46,'amilasa','2013-03-06 01:29:59','2013-03-06 01:29:59',1),(178,46,'quimo','2013-03-06 01:30:13','2013-03-06 01:30:13',1),(179,46,'quilo','2013-03-06 01:30:13','2013-03-06 01:30:13',1),(180,46,'petdasa','2013-03-06 01:30:13','2013-03-06 01:30:13',1),(181,46,'amilasa','2013-03-06 01:30:13','2013-03-06 01:30:13',1),(182,46,'quimo','2013-03-06 01:30:34','2013-03-06 01:30:34',1),(183,46,'quilo','2013-03-06 01:30:34','2013-03-06 01:30:34',1),(184,46,'petdasa','2013-03-06 01:30:34','2013-03-06 01:30:34',1),(185,46,'amilasa','2013-03-06 01:30:34','2013-03-06 01:30:34',1),(186,47,'caja','2013-03-06 01:31:48','2013-03-06 01:31:48',1),(187,47,'zapato','2013-03-06 01:31:48','2013-03-06 01:31:48',1),(188,47,'bolsa','2013-03-06 01:31:49','2013-03-06 01:31:49',1),(189,47,'recolector','2013-03-06 01:31:49','2013-03-06 01:31:49',1),(190,47,'caja','2013-03-06 01:32:00','2013-03-06 01:32:00',1),(191,47,'zapato','2013-03-06 01:32:00','2013-03-06 01:32:00',1),(192,47,'bolsa','2013-03-06 01:32:00','2013-03-06 01:32:00',1),(193,47,'recolector','2013-03-06 01:32:00','2013-03-06 01:32:00',1),(194,48,'cerosa','2013-03-06 01:33:25','2013-03-06 01:33:25',1),(195,48,'mucosa','2013-03-06 01:33:25','2013-03-06 01:33:25',1),(196,48,'muscular','2013-03-06 01:33:25','2013-03-06 01:33:25',1),(197,48,'tangencia','2013-03-06 01:33:25','2013-03-06 01:33:25',1),(198,49,'absorver nutrientes','2013-03-06 01:34:51','2013-03-06 01:34:51',1),(199,49,'eliminar bacterias','2013-03-06 01:34:51','2013-03-06 01:34:51',1),(200,49,'agrupar','2013-03-06 01:34:51','2013-03-06 01:34:51',1),(201,49,'descomponer','2013-03-06 01:34:51','2013-03-06 01:34:51',1),(202,50,'peptidasa','2013-03-06 01:36:08','2013-03-06 01:36:08',1),(203,50,'mucosa','2013-03-06 01:36:08','2013-03-06 01:36:08',1),(204,50,'celulosa','2013-03-06 01:36:08','2013-03-06 01:36:08',1),(205,50,'vellosidades','2013-03-06 01:36:08','2013-03-06 01:36:08',1),(206,51,'fabrica de quimicos','2013-03-06 01:37:26','2013-03-06 01:37:26',1),(207,51,'descompensor de grasas','2013-03-06 01:37:26','2013-03-06 01:37:26',1),(208,51,'anulador de toxinas','2013-03-06 01:37:26','2013-03-06 01:37:26',1),(209,51,'mejora el metabolismo','2013-03-06 01:37:26','2013-03-06 01:37:26',1),(210,52,'dilatasion de la mucosa gastrica','2013-03-06 01:38:47','2013-03-06 01:38:47',1),(211,52,'dilatacion de la mucosa del colon','2013-03-06 01:38:47','2013-03-06 01:38:47',1),(212,52,'dilatacion de la serosa gastrica','2013-03-06 01:38:47','2013-03-06 01:38:47',1),(213,52,'dilatanicon del esfinter pilorico','2013-03-06 01:38:47','2013-03-06 01:38:47',1),(214,53,'Prueba. ','2013-03-11 15:23:35','2013-03-11 15:38:08',1),(215,53,'Prueba. ','2013-03-11 15:23:35','2013-03-11 15:38:08',1),(216,53,'Prueb. ','2013-03-11 15:23:35','2013-03-11 15:38:08',1),(217,53,'pRUEBA. ','2013-03-11 15:23:35','2013-03-11 15:38:08',1),(218,54,'asd','2013-03-11 15:39:07','2013-03-11 15:39:07',1),(219,54,'asd','2013-03-11 15:39:07','2013-03-11 15:39:07',1),(220,54,'asd...','2013-03-11 15:39:07','2013-03-11 15:39:07',1),(221,54,'asd','2013-03-11 15:39:07','2013-03-11 15:39:07',1);

/*Table structure for table `resultados_examen_final` */

DROP TABLE IF EXISTS `resultados_examen_final`;

CREATE TABLE `resultados_examen_final` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador propio de la tabla',
  `username` varchar(255) collate utf8_spanish_ci NOT NULL default 'NO ASIGNADO' COMMENT 'Nombre del usuario de moodle',
  `subcategoria` varchar(255) collate utf8_spanish_ci NOT NULL default 'NO ASIGNADO' COMMENT 'Subcategoria a la que pertenece',
  `resultado` varchar(100) collate utf8_spanish_ci default 'NO ASIGNADO' COMMENT 'Resultado Obtenido',
  `fechaactualizacion` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'Fecha Actualizacion Registro',
  `fechacreacion` datetime default NULL COMMENT 'Fecha en la que se realizo el examen final',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=288422 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `resultados_examen_final` */

insert  into `resultados_examen_final`(`id`,`username`,`subcategoria`,`resultado`,`fechaactualizacion`,`fechacreacion`) values (288368,'admin','Identificación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288369,'admin','Diferenciación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288370,'admin','Representación Mental','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288371,'admin','Transformación Mental','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288372,'admin','Comparación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288373,'admin','Clasificación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288374,'admin','Codificación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288375,'admin','Descodificación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288376,'admin','Proyección','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288377,'admin','Análisis','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288378,'admin','Síntesis','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288379,'admin','Inferencia Lógica','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288380,'admin','Razonamiento Analógico','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288381,'admin','Razonamiento Hipotético','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288382,'admin','Razonamiento Transitivo','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288383,'admin','Razonamiento Silogístico','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288384,'admin','Pensamiento Divergente-Convergente','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288385,'admin','Conceptualización','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288386,'admin','Identificación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288387,'admin','Diferenciación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288388,'admin','Representación Mental','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288389,'admin','Transformación Mental','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288390,'admin','Comparación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288391,'admin','Clasificación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288392,'admin','Codificación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288393,'admin','Descodificación','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288394,'admin','Proyección','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288395,'admin','Análisis','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288396,'admin','Síntesis','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288397,'admin','Inferencia Lógica','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288398,'admin','Razonamiento Analógico','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288399,'admin','Razonamiento Hipotético','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288400,'admin','Razonamiento Transitivo','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288401,'admin','Razonamiento Silogístico','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288402,'admin','Pensamiento Divergente-Convergente','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288403,'admin','Conceptualización','Malo','2013-03-07 17:23:24','2007-03-13 17:03:24'),(288404,'estudiante1','Identificación','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288405,'estudiante1','Diferenciación','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288406,'estudiante1','Representación Mental','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288407,'estudiante1','Transformación Mental','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288408,'estudiante1','Comparación','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288409,'estudiante1','Clasificación','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288410,'estudiante1','Codificación','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288411,'estudiante1','Descodificación','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288412,'estudiante1','Proyección','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288413,'estudiante1','Análisis','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288414,'estudiante1','Síntesis','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288415,'estudiante1','Inferencia Lógica','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288416,'estudiante1','Razonamiento Analógico','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288417,'estudiante1','Razonamiento Hipotético','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288418,'estudiante1','Razonamiento Transitivo','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288419,'estudiante1','Razonamiento Silogístico','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288420,'estudiante1','Pensamiento Divergente-Convergente','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44'),(288421,'estudiante1','Conceptualización','Malo','2013-03-11 16:38:44','2011-03-13 17:03:44');

/*Table structure for table `resultados_test` */

DROP TABLE IF EXISTS `resultados_test`;

CREATE TABLE `resultados_test` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de la tabla',
  `username` varchar(255) collate utf8_spanish_ci NOT NULL COMMENT 'Identificador de usuario para moodle',
  `idtest` int(11) default NULL COMMENT 'Identificador de test realizado',
  `intentosfallidos` int(11) default '0' COMMENT 'Numero de intentos fallidos antes de aprobar el test',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `resultados_test` */

/*Table structure for table `rutaaprendizaje` */

DROP TABLE IF EXISTS `rutaaprendizaje`;

CREATE TABLE `rutaaprendizaje` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL default 'NO ASIGNADO',
  `data` varchar(255) collate utf8_spanish_ci NOT NULL default '{}',
  `usuario_id` int(11) default NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `rutaaprendizaje` */

insert  into `rutaaprendizaje`(`id`,`nombre`,`data`,`usuario_id`,`fecha_creacion`) values (1,'primera','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,27,2,1,0,3,4',1,'0000-00-00'),(2,'sistema alto','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,27,2,1,0,3,4',1,'0000-00-00'),(3,'tercero',',,,,,2,1,0,3,4',1,'0000-00-00'),(4,'asdasdasdasd','medio.flv,comic_medio.swf,act_medio.jclic.zip,presmedio.swf,26,2,1,0,3,4',1,'0000-00-00'),(5,'asdasdasd','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,27,2,1,0,3,4',1,'0000-00-00');

/*Table structure for table `sf_config` */

DROP TABLE IF EXISTS `sf_config`;

CREATE TABLE `sf_config` (
  `sf_id` int(5) unsigned NOT NULL auto_increment,
  `sf_table` varchar(64) NOT NULL default '',
  `sf_field` varchar(64) NOT NULL default '',
  `sf_type` varchar(16) default 'default',
  `sf_related` varchar(100) default '',
  `sf_label` varchar(64) default '',
  `sf_desc` tinytext,
  `sf_order` int(3) default NULL,
  `sf_hidden` int(1) default '0',
  PRIMARY KEY  (`sf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `sf_config` */

insert  into `sf_config`(`sf_id`,`sf_table`,`sf_field`,`sf_type`,`sf_related`,`sf_label`,`sf_desc`,`sf_order`,`sf_hidden`) values (1,'orden','id','default','','',NULL,NULL,0),(2,'orden','test_id','default','','',NULL,NULL,0),(3,'orden','orden_test','default','','',NULL,NULL,0),(4,'preguntas','id','default','','',NULL,NULL,0),(5,'preguntas','pregunta','default','','',NULL,NULL,0),(6,'preguntas','valor','default','','',NULL,NULL,0),(7,'preguntas','respuestacorrecta','default','','',NULL,NULL,0),(8,'preguntas','fechacreacion','default','','',NULL,NULL,0),(9,'preguntas','fechaactualizacion','default','','',NULL,NULL,0),(10,'preguntas','usuario_id','default','','',NULL,NULL,0),(11,'principal','id','default','','',NULL,NULL,0),(12,'principal','nombre','default','','',NULL,NULL,0),(13,'principal','fechacreacion','default','','',NULL,NULL,0),(14,'principal','fechaactualizacion','default','','',NULL,NULL,0),(15,'principal','usuario_id','default','','',NULL,NULL,0),(16,'principal','orden_id','default','','',NULL,NULL,0),(17,'respuestas','id','default','','',NULL,NULL,0),(18,'respuestas','pregunta_id','default','','',NULL,NULL,0),(19,'respuestas','texto','default','','',NULL,NULL,0),(20,'respuestas','fechacreacion','default','','',NULL,NULL,0),(21,'respuestas','fechaactualizacion','default','','',NULL,NULL,0),(22,'respuestas','usuario_id','default','','',NULL,NULL,0),(23,'test','id','default','','',NULL,NULL,0),(24,'test','nombre','default','','',NULL,NULL,0),(25,'test','fechacreacion','default','','',NULL,NULL,0),(26,'test','fechaactualizacion','default','','',NULL,NULL,0),(27,'test','usuario_id','default','','',NULL,NULL,0),(28,'test_preguntas','id','default','','',NULL,NULL,0),(29,'test_preguntas','test_id','default','','',NULL,NULL,0),(30,'test_preguntas','pregunta_id','default','','',NULL,NULL,0),(31,'test_preguntas','fechacreacion','default','','',NULL,NULL,0),(32,'test_preguntas','fechaactualizacion','default','','',NULL,NULL,0),(33,'test_preguntas','usuario_id','default','','',NULL,NULL,0);

/*Table structure for table `subcategorias` */

DROP TABLE IF EXISTS `subcategorias`;

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de subcategoria',
  `sistema_digestivo` varchar(255) collate utf8_spanish_ci default 'No Asignado' COMMENT 'Sistema digestivo al que pertenece la subcategoria',
  `subcategoria` varchar(255) collate utf8_spanish_ci default 'No Asignado',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `subcategorias` */

insert  into `subcategorias`(`id`,`sistema_digestivo`,`subcategoria`) values (1,'alto','dientes'),(2,'alto','lengua'),(3,'alto','glandulas salivales'),(4,'alto','esofago'),(5,'medio','estomago'),(6,'medio','No Asignado'),(7,'medio','No Asignado'),(8,'bajo','intestino delgado'),(9,'bajo','intestino grueso'),(10,'final','Identificación'),(11,'final','Diferenciación'),(12,'final','Representación Mental'),(13,'final','Transformación Mental'),(14,'final','Comparación'),(15,'final','Clasificación'),(16,'final','Codificación'),(17,'final','Descodificación'),(18,'final','Proyección'),(19,'final','Análisis'),(20,'final','Síntesis'),(21,'final','Inferencia Lógica'),(22,'final','Razonamiento Analógico'),(23,'final','Razonamiento Hipotético'),(24,'final','Razonamiento Transitivo'),(25,'final','Razonamiento Silogístico'),(26,'final','Pensamiento Divergente-Convergente'),(27,'final','Conceptualización');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de tabla',
  `nombre` varchar(255) collate utf8_spanish_ci default NULL COMMENT 'Nombre de test o descripcion',
  `valor` int(11) default NULL COMMENT 'Valor con el cual puede aprobar el test',
  `fechacreacion` datetime default NULL COMMENT 'Fecha creacion',
  `fechaactualizacion` datetime default NULL COMMENT 'Fecha actualizacion',
  `usuario_id` int(11) default NULL COMMENT 'Identificador del usuario',
  `tipo` varchar(255) collate utf8_spanish_ci default NULL COMMENT 'Tipo de test Alto Medio Bajo',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `test` */

insert  into `test`(`id`,`nombre`,`valor`,`fechacreacion`,`fechaactualizacion`,`usuario_id`,`tipo`) values (26,'lk',30,'2012-11-28 20:51:07','2013-03-06 01:38:59',1,'alto'),(27,'primero',5,'2013-01-29 19:02:57','2013-02-11 18:06:40',1,'alto'),(28,'segundo',6,'2013-02-19 20:59:41','2013-02-19 20:59:41',1,'medio');

/*Table structure for table `test_preguntas` */

DROP TABLE IF EXISTS `test_preguntas`;

CREATE TABLE `test_preguntas` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de tabla',
  `test_id` int(11) default NULL COMMENT 'Identificador de test al que pertenece',
  `pregunta_id` int(11) default NULL COMMENT 'Identificador de pregunta a la que pertenece',
  `fechacreacion` datetime default NULL COMMENT 'fecha de creacion',
  `fechaactualizacion` datetime default NULL COMMENT 'fecha de actualizacion',
  `usuario_id` int(11) default NULL COMMENT 'identificador de usuario',
  PRIMARY KEY  (`id`),
  KEY `FK_test_preguntas` (`test_id`),
  KEY `FK_test_preguntas_many` (`pregunta_id`),
  CONSTRAINT `FK_test_preguntas` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_test_preguntas_many` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `test_preguntas` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
