/*
SQLyog Ultimate v9.63 
MySQL - 5.0.51b-community-nt-log : Database - moodle
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`moodle` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `moodle`;

/*Table structure for table `mdl_user` */

DROP TABLE IF EXISTS `mdl_user`;

CREATE TABLE `mdl_user` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `auth` varchar(20) collate utf8_unicode_ci NOT NULL default 'manual',
  `confirmed` tinyint(1) NOT NULL default '0',
  `policyagreed` tinyint(1) NOT NULL default '0',
  `deleted` tinyint(1) NOT NULL default '0',
  `suspended` tinyint(1) NOT NULL default '0',
  `mnethostid` bigint(10) unsigned NOT NULL default '0',
  `username` varchar(100) collate utf8_unicode_ci NOT NULL default '',
  `password` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  `idnumber` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `firstname` varchar(100) collate utf8_unicode_ci NOT NULL default '',
  `lastname` varchar(100) collate utf8_unicode_ci NOT NULL default '',
  `email` varchar(100) collate utf8_unicode_ci NOT NULL default '',
  `emailstop` tinyint(1) unsigned NOT NULL default '0',
  `icq` varchar(15) collate utf8_unicode_ci NOT NULL default '',
  `skype` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `yahoo` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `aim` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `msn` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `phone1` varchar(20) collate utf8_unicode_ci NOT NULL default '',
  `phone2` varchar(20) collate utf8_unicode_ci NOT NULL default '',
  `institution` varchar(40) collate utf8_unicode_ci NOT NULL default '',
  `department` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `address` varchar(70) collate utf8_unicode_ci NOT NULL default '',
  `city` varchar(120) collate utf8_unicode_ci NOT NULL default '',
  `country` varchar(2) collate utf8_unicode_ci NOT NULL default '',
  `lang` varchar(30) collate utf8_unicode_ci NOT NULL default 'en',
  `theme` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `timezone` varchar(100) collate utf8_unicode_ci NOT NULL default '99',
  `firstaccess` bigint(10) unsigned NOT NULL default '0',
  `lastaccess` bigint(10) unsigned NOT NULL default '0',
  `lastlogin` bigint(10) unsigned NOT NULL default '0',
  `currentlogin` bigint(10) unsigned NOT NULL default '0',
  `lastip` varchar(45) collate utf8_unicode_ci NOT NULL default '',
  `secret` varchar(15) collate utf8_unicode_ci NOT NULL default '',
  `picture` tinyint(1) NOT NULL default '0',
  `url` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `description` longtext collate utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL default '0',
  `mailformat` tinyint(1) unsigned NOT NULL default '1',
  `maildigest` tinyint(1) unsigned NOT NULL default '0',
  `maildisplay` tinyint(2) unsigned NOT NULL default '2',
  `htmleditor` tinyint(1) unsigned NOT NULL default '1',
  `ajax` tinyint(1) unsigned NOT NULL default '1',
  `autosubscribe` tinyint(1) unsigned NOT NULL default '1',
  `trackforums` tinyint(1) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `trustbitmask` bigint(10) unsigned NOT NULL default '0',
  `imagealt` varchar(255) collate utf8_unicode_ci default NULL,
  `screenreader` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person';

/*Data for the table `mdl_user` */

insert  into `mdl_user`(`id`,`auth`,`confirmed`,`policyagreed`,`deleted`,`suspended`,`mnethostid`,`username`,`password`,`idnumber`,`firstname`,`lastname`,`email`,`emailstop`,`icq`,`skype`,`yahoo`,`aim`,`msn`,`phone1`,`phone2`,`institution`,`department`,`address`,`city`,`country`,`lang`,`theme`,`timezone`,`firstaccess`,`lastaccess`,`lastlogin`,`currentlogin`,`lastip`,`secret`,`picture`,`url`,`description`,`descriptionformat`,`mailformat`,`maildigest`,`maildisplay`,`htmleditor`,`ajax`,`autosubscribe`,`trackforums`,`timecreated`,`timemodified`,`trustbitmask`,`imagealt`,`screenreader`) values (1,'manual',1,0,0,0,1,'guest','6d221d021d3bb7c83a707946bdcc552e','','Invitado',' ','root@localhost',0,'','','','','','','','','','','','','es_es','','99',1342191871,1342612050,1342242297,1342611961,'181.51.32.168','',0,'','Este usuario sólo tiene acceso de lectura en ciertos cursos.',0,1,0,2,1,1,1,0,0,1342191871,0,NULL,0),(2,'manual',1,0,0,0,1,'admin','21232f297a57a5a743894a0e4a801fc3','','Admin','Usuario','michael.espinel@mggroup.com.co',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',1342192210,1343686268,1343586701,1343686267,'190.0.37.94','',0,'','',0,1,0,1,1,1,1,0,0,1342192210,0,NULL,0),(3,'manual',1,0,0,0,1,'pruebamg','284f0b7660f0d51d1c72b985ad9eee91','','asd','asd','miguel.vargas@mggroup.com.co',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342214630,1342214630,0,'',0),(4,'manual',1,0,1,0,1,'Tutor1@gmail.com.1342250327','cae388ec8bbbc3e845ffa4ca563efe52','','Tutor 1','Tutor 1','d3fd18651a3b3aa8a5642ce9f7eefad9',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',0,0,0,0,'','',0,'','<p>Hola:</p>\r\n<p>Soy el tutor 1</p>',1,1,0,2,1,0,1,0,1342215153,1342250327,0,'',0),(5,'manual',1,0,0,0,1,'estudiante1','1446ab1831a14147aaf9be9f658c7ee5','','Estudiante 1','Estudiante 1','estudiante1@gmail.com',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',1342243836,1342244758,1342244279,1342244686,'190.28.198.27','',0,'','',1,1,0,2,1,0,1,0,1342243836,1342243836,0,'',0),(6,'manual',1,0,0,0,1,'tutor01','fb65c1fcfd9add8cccc4bec915943c9f','','Tutor 1','Tutor 1','tutor@gmail.com',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',1342250308,1344874684,1342252525,1344874413,'186.114.253.90','',0,'','',1,1,0,2,1,0,1,0,1342250308,1342251984,0,'',0),(7,'manual',1,0,0,0,1,'tutor02','58d32e04b5cf8561ad669e99856b1e25','','Tutor 2','Tutor 2','tutor2@gmail.com',0,'','','','','','','','','','','Bogota','CO','es_es','','99',1342252124,1342631948,1342630348,1342631803,'181.51.32.168','',0,'','',1,1,0,2,1,0,1,0,1342252124,1342252124,0,'',0),(8,'manual',1,0,0,0,1,'tutor03','d6852d3675aab907dd9afd8fcdc48e18','','Tutor 3','Tutor 3','tutor3@gmail.com',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342252192,1342252192,0,'',0),(9,'manual',1,0,0,0,1,'tutor04','f41c274545a3ba4dd427feffc3993f7a','','Tutor 4','Tutor 4','tutor4@gmail.com',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342252270,1342252270,0,'',0),(10,'manual',1,0,0,0,1,'tutor05','c7c556efeda56ffb14af096aef6bb1e4','','Tutor 5','Tutor 5','tutor05@gmail.com',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',1342261424,1342283581,0,1342283440,'190.146.116.24','',0,'','',1,1,0,2,1,0,1,0,1342261328,1342261424,0,'',0),(11,'manual',1,0,0,0,1,'tutor06','c0ac4325aea60a949476c58a52b9af20','','Tutor 6','Tutor 6','tutor06@gmail.com',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261393,1342261393,0,'',0),(12,'manual',1,0,0,0,1,'tutor07','e85ac2d08b65920b1645277930666e3f','','Tutor 7','Tutor 7','tutor07@gmail.com',0,'','','','','','','','','','','Bogotá','CO','es_es','','99',1342261508,1344258972,0,1344258971,'186.80.126.28','',0,'','',1,1,0,2,1,0,1,0,1342261508,1342261508,0,'',0),(13,'manual',1,0,0,0,1,'tutor08','fee1c1ad05d432bf6ce8075c34ff5bd0','','Tutor 8','Tutor 8','Tutor08@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261564,1342261564,0,'',0),(14,'manual',1,0,0,0,1,'tutor09','41545d9e95f24dc8130d5773c72d80ce','','Tutor 9','Tutor 9','Tutor09@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261626,1342261626,0,'',0),(15,'manual',1,0,0,0,1,'tutor10','b8a3e8ba61d7b8696e14801f69fd6c21','','Tutor 10','Tutor 10','Tutor10@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261672,1342261672,0,'',0),(16,'manual',1,0,0,0,1,'tutor11','22f0b7f15bd93db82019a006cd464080','','Tutor 11','Tutor 11','Tutor11@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',1342261714,1342296703,0,1342295340,'190.146.116.24','',0,'','',1,1,0,2,1,0,1,0,1342261714,1342261714,0,'',0),(17,'manual',1,0,0,0,1,'tutor12','06cd0a78d8c534aad2f41513826afcfe','','Tutor 12','Tutor 12','Tutor12@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261760,1342261760,0,'',0),(18,'manual',1,0,0,0,1,'tutor13','dcffa2aac6495976f50b3143527035f2','','Tutor 13','Tutor 13','Tutor13@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',1342261800,1342295656,0,1342295655,'190.146.116.24','',0,'','',1,1,0,2,1,0,1,0,1342261800,1342261800,0,'',0),(19,'manual',1,0,0,0,1,'tutor14','7d289f8c9feef0f4c306d1e286d949b3','','Tutor 14','Tutor 14','Tutor14@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261838,1342261838,0,'',0),(20,'manual',1,0,0,0,1,'tutor15','ad2ae322c9517eda2bed375bd14f6e14','','Tutor 15','Tutor 15','Tutor15@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261895,1342261895,0,'',0),(21,'manual',1,0,0,0,1,'tutor16','d927e6c023fd68c939988e7341083028','','Tutor 16','Tutor 16','Tutor16@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261952,1342261952,0,'',0),(22,'manual',1,0,0,0,1,'tutor17','ebbb75532a87e56a6c4c6a7d93785b57','','Tutor 17','Tutor 17','Tutor17@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342261987,1342261987,0,'',0),(23,'manual',1,0,0,0,1,'tutor18','b39d5e7c75362233fb57cf790e23e3d2','','Tutor 18','Tutor 18','Tutor18@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342262032,1342262032,0,'',0),(24,'manual',1,0,0,0,1,'tutor19','f87ff239230b4d2d7157b8b370427139','','Tutor 19','Tutor 19','Tutor19@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342262066,1342262066,0,'',0),(25,'manual',1,0,0,0,1,'tutor20','a7f1bc3cd1ea9748c001cc11a9ae8c88','','Tutor 20','Tutor 20','Tutor20@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342262106,1342262106,0,'',0),(26,'manual',1,0,0,0,1,'tutor21','1998a86bbb8784f037ac6504544b4839','','Tutor 21','Tutor 21','Tutor21@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342262152,1342262152,0,'',0),(27,'manual',1,0,0,0,1,'tutor22','106fc1dcaa8c425b5367649799caa6e4','','Tutor 22','Tutor 22','Tutor22@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',1342262185,1342296185,0,1342295183,'190.146.116.24','',0,'','',1,1,0,2,1,0,1,0,1342262185,1342262185,0,'',0),(28,'manual',1,0,0,0,1,'tutor23','df91945fc1116ffdf69e63305dcf2793','','Tutor 23','Tutor 23','Tutor23@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342262253,1342262253,0,'',0),(29,'manual',1,0,0,0,1,'tutor24','8477a3b07d4bd6b2879617d804d71633','','Tutor 24','Tutor 24','Tutor24@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342262293,1342262293,0,'',0),(30,'manual',1,0,0,0,1,'tutor25','4f18ada43eca429bbba9fd87ff169041','','Tutor 25','Tutor 25','Tutor25@gmail.com',0,'','','','','','','','','','','Tutor','CO','es_es','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1342262389,1342262389,0,'',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
