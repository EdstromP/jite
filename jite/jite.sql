-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jite
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.10.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_a7792de1` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add Grupp',4,'add_grupper'),(11,'Can change Grupp',4,'change_grupper'),(12,'Can delete Grupp',4,'delete_grupper'),(13,'Can add Kund',5,'add_kunder'),(14,'Can change Kund',5,'change_kunder'),(15,'Can delete Kund',5,'delete_kunder'),(16,'Can add Tjänst',6,'add_tjanster'),(17,'Can change Tjänst',6,'change_tjanster'),(18,'Can delete Tjänst',6,'delete_tjanster'),(19,'Can add Anställda',7,'add_anstallda'),(20,'Can change Anställda',7,'change_anstallda'),(21,'Can delete Anställda',7,'delete_anstallda'),(22,'Can add Avtal',8,'add_avtal'),(23,'Can change Avtal',8,'change_avtal'),(24,'Can delete Avtal',8,'delete_avtal'),(25,'Can add Arbetsorder',9,'add_arbetsordrar'),(26,'Can change Arbetsorder',9,'change_arbetsordrar'),(27,'Can delete Arbetsorder',9,'delete_arbetsordrar'),(28,'Can add Användarprofil',10,'add_userprofile'),(29,'Can change Användarprofil',10,'change_userprofile'),(30,'Can delete Användarprofil',10,'delete_userprofile'),(31,'Can add content type',11,'add_contenttype'),(32,'Can change content type',11,'change_contenttype'),(33,'Can delete content type',11,'delete_contenttype'),(34,'Can add session',12,'add_session'),(35,'Can change session',12,'change_session'),(36,'Can delete session',12,'delete_session'),(37,'Can add site',13,'add_site'),(38,'Can change site',13,'change_site'),(39,'Can delete site',13,'delete_site'),(40,'Can add migration history',14,'add_migrationhistory'),(41,'Can change migration history',14,'change_migrationhistory'),(42,'Can delete migration history',14,'delete_migrationhistory'),(43,'Can add log entry',15,'add_logentry'),(44,'Can change log entry',15,'change_logentry'),(45,'Can delete log entry',15,'delete_logentry'),(46,'Can add Innehåll',16,'add_innehall'),(47,'Can change Innehåll',16,'change_innehall'),(48,'Can delete Innehåll',16,'delete_innehall');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'peter','Peter','Edström','peter@peteredstrom.se','pbkdf2_sha256$10000$52r3fRui5Xh4$pD/zweY1rilWep7IZi6SyXaXPuQOMKcbmTA4a3DcjDY=',1,1,1,'2012-11-27 02:30:14','2012-11-27 02:01:41'),(7,'Carina','','','','pbkdf2_sha256$10000$Z5plQ6HCCph7$oW51+Ux8fepuNmaqAzTKOmMMlLaOhPolIQdHN6vrse8=',1,1,1,'2012-11-27 06:01:59','2012-11-27 05:54:38');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f0ee9890` (`group_id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_type_id_refs_id_288599e6` (`content_type_id`),
  KEY `user_id_refs_id_c8665aa` (`user_id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-11-27 02:51:32',1,4,'1','Städerska',1,''),(2,'2012-11-27 02:51:40',1,4,'2','Trädgårdsmästare',1,''),(3,'2012-11-27 02:51:42',1,7,'1','Carina Ferm',1,''),(4,'2012-11-27 02:51:53',1,7,'2','Elefantmannen',1,''),(5,'2012-11-27 02:52:04',1,7,'3','Citrongumman',1,''),(6,'2012-11-27 03:08:50',1,5,'1','Ture Sventon',1,''),(7,'2012-11-27 03:09:06',1,6,'1','Dammsugning',1,''),(8,'2012-11-27 03:09:19',1,8,'1','Ture Sventon: Dammsugning',1,''),(9,'2012-11-27 03:23:56',1,4,'2','Trädgårdsmästare',2,'Ändrade anstallda på anstallda-grupper relationship \"Anstallda_grupp object\".'),(10,'2012-11-27 03:26:11',1,9,'1','Dammsugning två våningar 156m2: Elefantmannen',1,''),(11,'2012-11-27 03:26:45',1,9,'2','Moppning övervåningen: Carina Ferm',1,''),(12,'2012-11-27 05:54:39',1,3,'7','Carina',1,''),(13,'2012-11-27 05:56:37',1,7,'4','Apan',1,''),(14,'2012-11-27 06:08:27',7,5,'2','Kund Jakobsson',1,''),(15,'2012-11-27 06:08:39',7,6,'2','Moppning',1,''),(16,'2012-11-27 06:08:51',7,8,'2','Kund Jakobsson: Moppning',1,''),(17,'2012-11-27 06:09:09',7,9,'3','Moppning lite varstans: Carina Ferm',1,''),(18,'2012-11-27 06:13:53',7,8,'3','Kund Jakobsson: Dammsugning',1,''),(19,'2012-11-27 06:14:02',7,8,'1','Ture Sventon: Dammsugning',2,'Ändrade delegerad.'),(20,'2012-11-27 06:14:10',7,8,'2','Kund Jakobsson: Moppning',2,'Ändrade delegerad.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'Grupp','portal','grupper'),(5,'Kund','portal','kunder'),(6,'Tjänst','portal','tjanster'),(7,'Anställda','portal','anstallda'),(8,'Avtal','portal','avtal'),(9,'Arbetsorder','portal','arbetsordrar'),(10,'Användarprofil','portal','userprofile'),(11,'content type','contenttypes','contenttype'),(12,'session','sessions','session'),(13,'site','sites','site'),(14,'migration history','south','migrationhistory'),(15,'log entry','admin','logentry'),(16,'Innehåll','hemsida','innehall'),(17,'anstallda-grupper relationship','portal','anstallda_grupp');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('d57ba03d9959ea64e6c07081da7c5c43','M2IyNDc1YmVkZTJiNWU3MTQ2Yjg1ZWUwODIxMzZjODFkNDU2N2UwZDqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kVQ1fYXV0aF91c2VyX2lkigEHdS4=\n','2012-12-11 06:05:56');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'localhost','localhost');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hemsida_innehall`
--

DROP TABLE IF EXISTS `hemsida_innehall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hemsida_innehall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titel` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `rubrik` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hemsida_innehall`
--

LOCK TABLES `hemsida_innehall` WRITE;
/*!40000 ALTER TABLE `hemsida_innehall` DISABLE KEYS */;
/*!40000 ALTER TABLE `hemsida_innehall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_anstallda`
--

DROP TABLE IF EXISTS `portal_anstallda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_anstallda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namn` varchar(50) NOT NULL,
  `personnummer` varchar(15) DEFAULT NULL,
  `adress` varchar(50) DEFAULT NULL,
  `regdatum` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_anstallda`
--

LOCK TABLES `portal_anstallda` WRITE;
/*!40000 ALTER TABLE `portal_anstallda` DISABLE KEYS */;
INSERT INTO `portal_anstallda` VALUES (1,'Carina Ferm','591531-1501','','2012-11-27'),(2,'Elefantmannen','','','2012-11-27'),(3,'Citrongumman','','','2012-11-27'),(4,'Apan','','','2012-11-27');
/*!40000 ALTER TABLE `portal_anstallda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_anstallda_grupp`
--

DROP TABLE IF EXISTS `portal_anstallda_grupp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_anstallda_grupp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anstallda_id` int(11) NOT NULL,
  `grupper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_anstallda_grupp_anstallda_id_2bc6f3287cd277d7_uniq` (`anstallda_id`,`grupper_id`),
  KEY `portal_anstallda_grupp_232ed5bd` (`anstallda_id`),
  KEY `portal_anstallda_grupp_9d61314a` (`grupper_id`),
  CONSTRAINT `grupper_id_refs_id_59146a75dbcf15` FOREIGN KEY (`grupper_id`) REFERENCES `portal_grupper` (`id`),
  CONSTRAINT `anstallda_id_refs_id_4ec93bb6ff9c49a6` FOREIGN KEY (`anstallda_id`) REFERENCES `portal_anstallda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_anstallda_grupp`
--

LOCK TABLES `portal_anstallda_grupp` WRITE;
/*!40000 ALTER TABLE `portal_anstallda_grupp` DISABLE KEYS */;
INSERT INTO `portal_anstallda_grupp` VALUES (1,1,1),(2,1,2),(4,3,1),(3,3,2),(5,4,1);
/*!40000 ALTER TABLE `portal_anstallda_grupp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_arbetsordrar`
--

DROP TABLE IF EXISTS `portal_arbetsordrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_arbetsordrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arbetsbeskrivning` varchar(50) NOT NULL,
  `avtal_id` int(11) DEFAULT NULL,
  `anstalld_id` int(11) NOT NULL,
  `regdatum` date NOT NULL,
  `klardatum` date DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `rapporterad_tid` double DEFAULT NULL,
  `kommentar_utforare` varchar(300) DEFAULT NULL,
  `kommentar` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_arbetsordrar_739a0391` (`avtal_id`),
  KEY `portal_arbetsordrar_e663a107` (`anstalld_id`),
  CONSTRAINT `anstalld_id_refs_id_382e7d02266ca969` FOREIGN KEY (`anstalld_id`) REFERENCES `portal_anstallda` (`id`),
  CONSTRAINT `avtal_id_refs_id_19d425c9014533f3` FOREIGN KEY (`avtal_id`) REFERENCES `portal_avtal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_arbetsordrar`
--

LOCK TABLES `portal_arbetsordrar` WRITE;
/*!40000 ALTER TABLE `portal_arbetsordrar` DISABLE KEYS */;
INSERT INTO `portal_arbetsordrar` VALUES (1,'Dammsugning två våningar 156m2',1,2,'2012-11-27',NULL,'AR',NULL,'',''),(2,'Moppning övervåningen',1,1,'2012-11-27',NULL,'AR',NULL,'',''),(3,'Moppning lite varstans',2,1,'2012-11-27',NULL,'AR',NULL,'','');
/*!40000 ALTER TABLE `portal_arbetsordrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_avtal`
--

DROP TABLE IF EXISTS `portal_avtal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_avtal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kund_id` int(11) NOT NULL,
  `tjanst_id` int(11) NOT NULL,
  `periodicitet` varchar(50) NOT NULL,
  `grupp_id` int(11) NOT NULL,
  `regdatum` date NOT NULL,
  `pris` double DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `veckodag` varchar(10) DEFAULT NULL,
  `kommentar` varchar(300) DEFAULT NULL,
  `delegerad` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_avtal_e362fd9e` (`kund_id`),
  KEY `portal_avtal_ace86e28` (`tjanst_id`),
  KEY `portal_avtal_d321aad3` (`grupp_id`),
  CONSTRAINT `grupp_id_refs_id_3bfd72fc84cb4118` FOREIGN KEY (`grupp_id`) REFERENCES `portal_grupper` (`id`),
  CONSTRAINT `kund_id_refs_id_5f2f6666fe5eda8d` FOREIGN KEY (`kund_id`) REFERENCES `portal_kunder` (`id`),
  CONSTRAINT `tjanst_id_refs_id_532e7965a5015d5f` FOREIGN KEY (`tjanst_id`) REFERENCES `portal_tjanster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_avtal`
--

LOCK TABLES `portal_avtal` WRITE;
/*!40000 ALTER TABLE `portal_avtal` DISABLE KEYS */;
INSERT INTO `portal_avtal` VALUES (1,1,1,'Dagligen',1,'2012-11-27',NULL,'Aktiv','','',1),(2,2,2,'Dagligen',1,'2012-11-27',NULL,'Aktiv','','',1),(3,2,1,'Veckovis',1,'2012-11-27',NULL,'Aktiv','','',0);
/*!40000 ALTER TABLE `portal_avtal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_grupper`
--

DROP TABLE IF EXISTS `portal_grupper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_grupper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupp` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_grupper`
--

LOCK TABLES `portal_grupper` WRITE;
/*!40000 ALTER TABLE `portal_grupper` DISABLE KEYS */;
INSERT INTO `portal_grupper` VALUES (1,'Städerska'),(2,'Trädgårdsmästare');
/*!40000 ALTER TABLE `portal_grupper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_kunder`
--

DROP TABLE IF EXISTS `portal_kunder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_kunder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namn` varchar(50) NOT NULL,
  `personnummer` varchar(15) DEFAULT NULL,
  `adress` varchar(50) NOT NULL,
  `regdatum` date NOT NULL,
  `komptid` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_kunder`
--

LOCK TABLES `portal_kunder` WRITE;
/*!40000 ALTER TABLE `portal_kunder` DISABLE KEYS */;
INSERT INTO `portal_kunder` VALUES (1,'Ture Sventon','','Bögvägen 1','2012-11-27',0),(2,'Kund Jakobsson','','Härliga gatan 3','2012-11-27',0);
/*!40000 ALTER TABLE `portal_kunder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_tjanster`
--

DROP TABLE IF EXISTS `portal_tjanster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_tjanster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tjanst` varchar(50) NOT NULL,
  `placering` varchar(50) NOT NULL,
  `riktpris` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_tjanster`
--

LOCK TABLES `portal_tjanster` WRITE;
/*!40000 ALTER TABLE `portal_tjanster` DISABLE KEYS */;
INSERT INTO `portal_tjanster` VALUES (1,'Dammsugning','Inomhus',NULL),(2,'Moppning','Inomhus',NULL);
/*!40000 ALTER TABLE `portal_tjanster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_userprofile`
--

DROP TABLE IF EXISTS `portal_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `anstalld_id` int(11),
  `testfalt` varchar(50),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `portal_userprofile_anstalld_id_6f7fb3bae41831f4_uniq` (`anstalld_id`),
  KEY `portal_userprofile_e663a107` (`anstalld_id`),
  CONSTRAINT `anstalld_id_refs_id_4e5ded0bfcc48ed9` FOREIGN KEY (`anstalld_id`) REFERENCES `portal_anstallda` (`id`),
  CONSTRAINT `user_id_refs_id_26301977790578c9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_userprofile`
--

LOCK TABLES `portal_userprofile` WRITE;
/*!40000 ALTER TABLE `portal_userprofile` DISABLE KEYS */;
INSERT INTO `portal_userprofile` VALUES (9,7,1,'');
/*!40000 ALTER TABLE `portal_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'portal','0001_initial','2012-11-27 02:03:33'),(2,'portal','0002_auto__add_tjanster__add_avtal__add_grupper__add_kunder__add_anstallda_','2012-11-27 02:03:34'),(3,'portal','0003_auto__add_field_userprofile_testfalt__chg_field_userprofile_anstalld__','2012-11-27 02:03:34'),(4,'hemsida','0001_initial','2012-11-27 02:04:01'),(5,'hemsida','0002_auto__add_innehall','2012-11-27 02:04:01'),(6,'portal','0004_auto__del_field_anstallda_grupp','2012-11-27 02:44:29'),(7,'portal','0005_auto__add_field_kunder_komptid','2012-11-27 05:46:10'),(8,'portal','0006_auto__add_field_avtal_delegerad','2012-11-27 06:10:58');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-27  7:58:09
