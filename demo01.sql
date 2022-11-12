-- MySQL dump 10.13  Distrib 8.0.30, for macos12.4 (arm64)
--
-- Host: localhost    Database: demo01
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `app01_animation`
--

DROP TABLE IF EXISTS `app01_animation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_animation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `abstract` varchar(256) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `cover` varchar(256) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_animation`
--

LOCK TABLES `app01_animation` WRITE;
/*!40000 ALTER TABLE `app01_animation` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_animation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_avatar`
--

DROP TABLE IF EXISTS `app01_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_avatar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_avatar`
--

LOCK TABLES `app01_avatar` WRITE;
/*!40000 ALTER TABLE `app01_avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_chacategory`
--

DROP TABLE IF EXISTS `app01_chacategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_chacategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_chacategory`
--

LOCK TABLES `app01_chacategory` WRITE;
/*!40000 ALTER TABLE `app01_chacategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_chacategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_chapter`
--

DROP TABLE IF EXISTS `app01_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_chapter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `character` json DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_chapter_category_id_9fb74171_fk_app01_chacategory_id` (`category_id`),
  CONSTRAINT `app01_chapter_category_id_9fb74171_fk_app01_chacategory_id` FOREIGN KEY (`category_id`) REFERENCES `app01_chacategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_chapter`
--

LOCK TABLES `app01_chapter` WRITE;
/*!40000 ALTER TABLE `app01_chapter` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_user`
--

DROP TABLE IF EXISTS `app01_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) NOT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `mail` varchar(254) DEFAULT NULL,
  `max_score` int NOT NULL,
  `chapter` int NOT NULL,
  `avatar_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `app01_user_avatar_id_13d0d197_fk_app01_avatar_id` (`avatar_id`),
  CONSTRAINT `app01_user_avatar_id_13d0d197_fk_app01_avatar_id` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_user`
--

LOCK TABLES `app01_user` WRITE;
/*!40000 ALTER TABLE `app01_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_user_animation`
--

DROP TABLE IF EXISTS `app01_user_animation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_user_animation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `animation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_user_animation_user_id_animation_id_b63df855_uniq` (`user_id`,`animation_id`),
  KEY `app01_user_animation_animation_id_ad168083_fk_app01_animation_id` (`animation_id`),
  CONSTRAINT `app01_user_animation_animation_id_ad168083_fk_app01_animation_id` FOREIGN KEY (`animation_id`) REFERENCES `app01_animation` (`id`),
  CONSTRAINT `app01_user_animation_user_id_a3acae8c_fk_app01_user_id` FOREIGN KEY (`user_id`) REFERENCES `app01_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_user_animation`
--

LOCK TABLES `app01_user_animation` WRITE;
/*!40000 ALTER TABLE `app01_user_animation` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_user_animation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_user_groups`
--

DROP TABLE IF EXISTS `app01_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_user_groups_user_id_group_id_7cd1d9cb_uniq` (`user_id`,`group_id`),
  KEY `app01_user_groups_group_id_25800035_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app01_user_groups_group_id_25800035_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app01_user_groups_user_id_e69307ff_fk_app01_user_id` FOREIGN KEY (`user_id`) REFERENCES `app01_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_user_groups`
--

LOCK TABLES `app01_user_groups` WRITE;
/*!40000 ALTER TABLE `app01_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_user_user_permissions`
--

DROP TABLE IF EXISTS `app01_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_user_user_permissions_user_id_permission_id_93ed9964_uniq` (`user_id`,`permission_id`),
  KEY `app01_user_user_perm_permission_id_ad7e2dda_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app01_user_user_perm_permission_id_ad7e2dda_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app01_user_user_permissions_user_id_a15941fb_fk_app01_user_id` FOREIGN KEY (`user_id`) REFERENCES `app01_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_user_user_permissions`
--

LOCK TABLES `app01_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `app01_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add animation',6,'add_animation'),(22,'Can change animation',6,'change_animation'),(23,'Can delete animation',6,'delete_animation'),(24,'Can view animation',6,'view_animation'),(25,'Can add avatar',7,'add_avatar'),(26,'Can change avatar',7,'change_avatar'),(27,'Can delete avatar',7,'delete_avatar'),(28,'Can view avatar',7,'view_avatar'),(29,'Can add cha category',8,'add_chacategory'),(30,'Can change cha category',8,'change_chacategory'),(31,'Can delete cha category',8,'delete_chacategory'),(32,'Can view cha category',8,'view_chacategory'),(33,'Can add chapter',9,'add_chapter'),(34,'Can change chapter',9,'change_chapter'),(35,'Can delete chapter',9,'delete_chapter'),(36,'Can view chapter',9,'view_chapter'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app01_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app01_user_id` FOREIGN KEY (`user_id`) REFERENCES `app01_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(6,'app01','animation'),(7,'app01','avatar'),(8,'app01','chacategory'),(9,'app01','chapter'),(10,'app01','user'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-11 09:27:45.170657'),(2,'contenttypes','0002_remove_content_type_name','2022-11-11 09:27:45.212473'),(3,'auth','0001_initial','2022-11-11 09:27:45.297141'),(4,'auth','0002_alter_permission_name_max_length','2022-11-11 09:27:45.318096'),(5,'auth','0003_alter_user_email_max_length','2022-11-11 09:27:45.323051'),(6,'auth','0004_alter_user_username_opts','2022-11-11 09:27:45.327861'),(7,'auth','0005_alter_user_last_login_null','2022-11-11 09:27:45.332497'),(8,'auth','0006_require_contenttypes_0002','2022-11-11 09:27:45.334294'),(9,'auth','0007_alter_validators_add_error_messages','2022-11-11 09:27:45.338580'),(10,'auth','0008_alter_user_username_max_length','2022-11-11 09:27:45.342919'),(11,'auth','0009_alter_user_last_name_max_length','2022-11-11 09:27:45.348234'),(12,'auth','0010_alter_group_name_max_length','2022-11-11 09:27:45.358850'),(13,'auth','0011_update_proxy_permissions','2022-11-11 09:27:45.363872'),(14,'auth','0012_alter_user_first_name_max_length','2022-11-11 09:27:45.371544'),(15,'app01','0001_initial','2022-11-11 09:27:45.543654'),(16,'admin','0001_initial','2022-11-11 09:27:45.593567'),(17,'admin','0002_logentry_remove_auto_add','2022-11-11 09:27:45.603610'),(18,'admin','0003_logentry_add_action_flag_choices','2022-11-11 09:27:45.610327'),(19,'sessions','0001_initial','2022-11-11 09:27:45.619498');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-12  8:56:48
