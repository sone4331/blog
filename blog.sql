-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
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
-- Table structure for table `app01_advert`
--

DROP TABLE IF EXISTS `app01_advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_advert` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `href` varchar(200) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `img_list` longtext,
  `is_show` tinyint(1) NOT NULL,
  `author` varchar(32) DEFAULT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_advert`
--

LOCK TABLES `app01_advert` WRITE;
/*!40000 ALTER TABLE `app01_advert` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_articles`
--

DROP TABLE IF EXISTS `app01_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_articles` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  `content` longtext,
  `create_date` datetime(6) DEFAULT NULL,
  `change_date` datetime(6) DEFAULT NULL,
  `status` int NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `look_count` int NOT NULL,
  `comment_count` int NOT NULL,
  `digg_count` int NOT NULL,
  `collects_count` int NOT NULL,
  `category` int DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `author` varchar(16) DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `word` int NOT NULL,
  `cover_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_articles_cover_id_02b692b0_fk_app01_cover_nid` (`cover_id`),
  CONSTRAINT `app01_articles_cover_id_02b692b0_fk_app01_cover_nid` FOREIGN KEY (`cover_id`) REFERENCES `app01_cover` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_articles`
--

LOCK TABLES `app01_articles` WRITE;
/*!40000 ALTER TABLE `app01_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_articles_tag`
--

DROP TABLE IF EXISTS `app01_articles_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_articles_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `articles_id` int NOT NULL,
  `tags_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_articles_tag_articles_id_tags_id_f201463d_uniq` (`articles_id`,`tags_id`),
  KEY `app01_articles_tag_tags_id_e0760570_fk_app01_tags_nid` (`tags_id`),
  CONSTRAINT `app01_articles_tag_articles_id_c377df22_fk_app01_articles_nid` FOREIGN KEY (`articles_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_articles_tag_tags_id_e0760570_fk_app01_tags_nid` FOREIGN KEY (`tags_id`) REFERENCES `app01_tags` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_articles_tag`
--

LOCK TABLES `app01_articles_tag` WRITE;
/*!40000 ALTER TABLE `app01_articles_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_articles_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_avatars`
--

DROP TABLE IF EXISTS `app01_avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_avatars` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_avatars`
--

LOCK TABLES `app01_avatars` WRITE;
/*!40000 ALTER TABLE `app01_avatars` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_comment`
--

DROP TABLE IF EXISTS `app01_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_comment` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `digg_count` int NOT NULL,
  `content` longtext NOT NULL,
  `comment_count` int NOT NULL,
  `drawing` longtext,
  `create_time` datetime(6) NOT NULL,
  `article_id` int NOT NULL,
  `parent_comment_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_comment_article_id_2bf4f73b_fk_app01_articles_nid` (`article_id`),
  KEY `app01_comment_parent_comment_id_6a8024a5_fk_app01_comment_nid` (`parent_comment_id`),
  KEY `app01_comment_user_id_7f913f03_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `app01_comment_article_id_2bf4f73b_fk_app01_articles_nid` FOREIGN KEY (`article_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_comment_parent_comment_id_6a8024a5_fk_app01_comment_nid` FOREIGN KEY (`parent_comment_id`) REFERENCES `app01_comment` (`nid`),
  CONSTRAINT `app01_comment_user_id_7f913f03_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_comment`
--

LOCK TABLES `app01_comment` WRITE;
/*!40000 ALTER TABLE `app01_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_cover`
--

DROP TABLE IF EXISTS `app01_cover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_cover` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `dominant_hue` varchar(16) DEFAULT NULL,
  `is_dark` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_cover`
--

LOCK TABLES `app01_cover` WRITE;
/*!40000 ALTER TABLE `app01_cover` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_cover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_feedback`
--

DROP TABLE IF EXISTS `app01_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_feedback` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `content` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `processing_content` longtext,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_feedback`
--

LOCK TABLES `app01_feedback` WRITE;
/*!40000 ALTER TABLE `app01_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_history`
--

DROP TABLE IF EXISTS `app01_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_history` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` date DEFAULT NULL,
  `drawing` longtext,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_history`
--

LOCK TABLES `app01_history` WRITE;
/*!40000 ALTER TABLE `app01_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menu`
--

DROP TABLE IF EXISTS `app01_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_menu` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(16) DEFAULT NULL,
  `menu_title_en` varchar(32) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `abstract` longtext,
  `abstract_time` int NOT NULL,
  `rotation` tinyint(1) NOT NULL,
  `menu_rotation` tinyint(1) NOT NULL,
  `menu_time` int NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menu`
--

LOCK TABLES `app01_menu` WRITE;
/*!40000 ALTER TABLE `app01_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menu_menu_url`
--

DROP TABLE IF EXISTS `app01_menu_menu_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_menu_menu_url` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `menuimg_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_menu_menu_url_menu_id_menuimg_id_9b80b024_uniq` (`menu_id`,`menuimg_id`),
  KEY `app01_menu_menu_url_menuimg_id_c89e39bd_fk_app01_menuimg_nid` (`menuimg_id`),
  CONSTRAINT `app01_menu_menu_url_menu_id_fe74c303_fk_app01_menu_nid` FOREIGN KEY (`menu_id`) REFERENCES `app01_menu` (`nid`),
  CONSTRAINT `app01_menu_menu_url_menuimg_id_c89e39bd_fk_app01_menuimg_nid` FOREIGN KEY (`menuimg_id`) REFERENCES `app01_menuimg` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menu_menu_url`
--

LOCK TABLES `app01_menu_menu_url` WRITE;
/*!40000 ALTER TABLE `app01_menu_menu_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_menu_menu_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menuimg`
--

DROP TABLE IF EXISTS `app01_menuimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_menuimg` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `dominant_hue` varchar(16) DEFAULT NULL,
  `is_dark` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menuimg`
--

LOCK TABLES `app01_menuimg` WRITE;
/*!40000 ALTER TABLE `app01_menuimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_menuimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_moodcomment`
--

DROP TABLE IF EXISTS `app01_moodcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_moodcomment` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `content` longtext NOT NULL,
  `digg_count` int NOT NULL,
  `ip` char(39) NOT NULL,
  `addr` longtext,
  `create_date` datetime(6) NOT NULL,
  `avatar_id` int DEFAULT NULL,
  `mood_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_moodcomment_avatar_id_20ee4ce3_fk_app01_avatars_nid` (`avatar_id`),
  KEY `app01_moodcomment_mood_id_f0b5317e_fk_app01_moods_nid` (`mood_id`),
  CONSTRAINT `app01_moodcomment_avatar_id_20ee4ce3_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`),
  CONSTRAINT `app01_moodcomment_mood_id_f0b5317e_fk_app01_moods_nid` FOREIGN KEY (`mood_id`) REFERENCES `app01_moods` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_moodcomment`
--

LOCK TABLES `app01_moodcomment` WRITE;
/*!40000 ALTER TABLE `app01_moodcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_moodcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_moods`
--

DROP TABLE IF EXISTS `app01_moods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_moods` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `ip` char(39) NOT NULL,
  `addr` longtext,
  `create_date` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `drawing` longtext,
  `comment_count` int NOT NULL,
  `digg_count` int NOT NULL,
  `avatar_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_moods_avatar_id_f891277b_fk_app01_avatars_nid` (`avatar_id`),
  CONSTRAINT `app01_moods_avatar_id_f891277b_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_moods`
--

LOCK TABLES `app01_moods` WRITE;
/*!40000 ALTER TABLE `app01_moods` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_moods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_navs`
--

DROP TABLE IF EXISTS `app01_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_navs` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  `href` varchar(200) NOT NULL,
  `icon_href` varchar(200) DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `collects_count` int NOT NULL,
  `digg_count` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_navs`
--

LOCK TABLES `app01_navs` WRITE;
/*!40000 ALTER TABLE `app01_navs` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_navs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_navs_tag`
--

DROP TABLE IF EXISTS `app01_navs_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_navs_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `navs_id` int NOT NULL,
  `navtags_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_navs_tag_navs_id_navtags_id_39e10941_uniq` (`navs_id`,`navtags_id`),
  KEY `app01_navs_tag_navtags_id_e997acfd_fk_app01_navtags_nid` (`navtags_id`),
  CONSTRAINT `app01_navs_tag_navs_id_64df90b2_fk_app01_navs_nid` FOREIGN KEY (`navs_id`) REFERENCES `app01_navs` (`nid`),
  CONSTRAINT `app01_navs_tag_navtags_id_e997acfd_fk_app01_navtags_nid` FOREIGN KEY (`navtags_id`) REFERENCES `app01_navtags` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_navs_tag`
--

LOCK TABLES `app01_navs_tag` WRITE;
/*!40000 ALTER TABLE `app01_navs_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_navs_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_navtags`
--

DROP TABLE IF EXISTS `app01_navtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_navtags` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_navtags`
--

LOCK TABLES `app01_navtags` WRITE;
/*!40000 ALTER TABLE `app01_navtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_navtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_project`
--

DROP TABLE IF EXISTS `app01_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_project` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_project`
--

LOCK TABLES `app01_project` WRITE;
/*!40000 ALTER TABLE `app01_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_project_article`
--

DROP TABLE IF EXISTS `app01_project_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_project_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `articles_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_project_article_project_id_articles_id_b7f48fe3_uniq` (`project_id`,`articles_id`),
  KEY `app01_project_article_articles_id_baf31051_fk_app01_articles_nid` (`articles_id`),
  CONSTRAINT `app01_project_article_articles_id_baf31051_fk_app01_articles_nid` FOREIGN KEY (`articles_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_project_article_project_id_07730480_fk_app01_project_nid` FOREIGN KEY (`project_id`) REFERENCES `app01_project` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_project_article`
--

LOCK TABLES `app01_project_article` WRITE;
/*!40000 ALTER TABLE `app01_project_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_project_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_tags`
--

DROP TABLE IF EXISTS `app01_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_tags` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_tags`
--

LOCK TABLES `app01_tags` WRITE;
/*!40000 ALTER TABLE `app01_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo`
--

DROP TABLE IF EXISTS `app01_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo` (
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
  `nid` int NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(16) DEFAULT NULL,
  `avatar_url` varchar(200) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `integral` int NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `ip` char(39) NOT NULL,
  `addr` longtext,
  `sign_status` int NOT NULL,
  `account_status` int NOT NULL,
  `avatar_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `username` (`username`),
  KEY `app01_userinfo_avatar_id_4d8395aa_fk_app01_avatars_nid` (`avatar_id`),
  CONSTRAINT `app01_userinfo_avatar_id_4d8395aa_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo`
--

LOCK TABLES `app01_userinfo` WRITE;
/*!40000 ALTER TABLE `app01_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_collects`
--

DROP TABLE IF EXISTS `app01_userinfo_collects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_collects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `articles_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_collects_userinfo_id_articles_id_73774dcd_uniq` (`userinfo_id`,`articles_id`),
  KEY `app01_userinfo_colle_articles_id_c3773049_fk_app01_art` (`articles_id`),
  CONSTRAINT `app01_userinfo_colle_articles_id_c3773049_fk_app01_art` FOREIGN KEY (`articles_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_userinfo_colle_userinfo_id_eab70bce_fk_app01_use` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_collects`
--

LOCK TABLES `app01_userinfo_collects` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_collects` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_collects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_groups`
--

DROP TABLE IF EXISTS `app01_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_groups_userinfo_id_group_id_48ba2aa6_uniq` (`userinfo_id`,`group_id`),
  KEY `app01_userinfo_groups_group_id_30b9b2c4_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app01_userinfo_groups_group_id_30b9b2c4_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app01_userinfo_groups_userinfo_id_04be482a_fk_app01_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_groups`
--

LOCK TABLES `app01_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_navs`
--

DROP TABLE IF EXISTS `app01_userinfo_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_navs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `navs_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_navs_userinfo_id_navs_id_197774e8_uniq` (`userinfo_id`,`navs_id`),
  KEY `app01_userinfo_navs_navs_id_1ea72c9c_fk_app01_navs_nid` (`navs_id`),
  CONSTRAINT `app01_userinfo_navs_navs_id_1ea72c9c_fk_app01_navs_nid` FOREIGN KEY (`navs_id`) REFERENCES `app01_navs` (`nid`),
  CONSTRAINT `app01_userinfo_navs_userinfo_id_40eb4ed6_fk_app01_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_navs`
--

LOCK TABLES `app01_userinfo_navs` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_navs` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_navs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `app01_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_user_perm_userinfo_id_permission_i_8bd06903_uniq` (`userinfo_id`,`permission_id`),
  KEY `app01_userinfo_user__permission_id_826033c9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app01_userinfo_user__permission_id_826033c9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app01_userinfo_user__userinfo_id_3a67a872_fk_app01_use` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_user_permissions`
--

LOCK TABLES `app01_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_user_permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user info',6,'add_userinfo'),(22,'Can change user info',6,'change_userinfo'),(23,'Can delete user info',6,'delete_userinfo'),(24,'Can view user info',6,'view_userinfo'),(25,'Can add advert',7,'add_advert'),(26,'Can change advert',7,'change_advert'),(27,'Can delete advert',7,'delete_advert'),(28,'Can view advert',7,'view_advert'),(29,'Can add articles',8,'add_articles'),(30,'Can change articles',8,'change_articles'),(31,'Can delete articles',8,'delete_articles'),(32,'Can view articles',8,'view_articles'),(33,'Can add avatars',9,'add_avatars'),(34,'Can change avatars',9,'change_avatars'),(35,'Can delete avatars',9,'delete_avatars'),(36,'Can view avatars',9,'view_avatars'),(37,'Can add cover',10,'add_cover'),(38,'Can change cover',10,'change_cover'),(39,'Can delete cover',10,'delete_cover'),(40,'Can view cover',10,'view_cover'),(41,'Can add feedback',11,'add_feedback'),(42,'Can change feedback',11,'change_feedback'),(43,'Can delete feedback',11,'delete_feedback'),(44,'Can view feedback',11,'view_feedback'),(45,'Can add history',12,'add_history'),(46,'Can change history',12,'change_history'),(47,'Can delete history',12,'delete_history'),(48,'Can view history',12,'view_history'),(49,'Can add menu img',13,'add_menuimg'),(50,'Can change menu img',13,'change_menuimg'),(51,'Can delete menu img',13,'delete_menuimg'),(52,'Can view menu img',13,'view_menuimg'),(53,'Can add nav tags',14,'add_navtags'),(54,'Can change nav tags',14,'change_navtags'),(55,'Can delete nav tags',14,'delete_navtags'),(56,'Can view nav tags',14,'view_navtags'),(57,'Can add tags',15,'add_tags'),(58,'Can change tags',15,'change_tags'),(59,'Can delete tags',15,'delete_tags'),(60,'Can view tags',15,'view_tags'),(61,'Can add project',16,'add_project'),(62,'Can change project',16,'change_project'),(63,'Can delete project',16,'delete_project'),(64,'Can view project',16,'view_project'),(65,'Can add navs',17,'add_navs'),(66,'Can change navs',17,'change_navs'),(67,'Can delete navs',17,'delete_navs'),(68,'Can view navs',17,'view_navs'),(69,'Can add moods',18,'add_moods'),(70,'Can change moods',18,'change_moods'),(71,'Can delete moods',18,'delete_moods'),(72,'Can view moods',18,'view_moods'),(73,'Can add mood comment',19,'add_moodcomment'),(74,'Can change mood comment',19,'change_moodcomment'),(75,'Can delete mood comment',19,'delete_moodcomment'),(76,'Can view mood comment',19,'view_moodcomment'),(77,'Can add menu',20,'add_menu'),(78,'Can change menu',20,'change_menu'),(79,'Can delete menu',20,'delete_menu'),(80,'Can view menu',20,'view_menu'),(81,'Can add comment',21,'add_comment'),(82,'Can change comment',21,'change_comment'),(83,'Can delete comment',21,'delete_comment'),(84,'Can view comment',21,'view_comment');
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
  KEY `django_admin_log_user_id_c564eba6_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`),
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app01','advert'),(8,'app01','articles'),(9,'app01','avatars'),(21,'app01','comment'),(10,'app01','cover'),(11,'app01','feedback'),(12,'app01','history'),(20,'app01','menu'),(13,'app01','menuimg'),(19,'app01','moodcomment'),(18,'app01','moods'),(17,'app01','navs'),(14,'app01','navtags'),(16,'app01','project'),(15,'app01','tags'),(6,'app01','userinfo'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-09-05 04:15:05.736852'),(2,'contenttypes','0002_remove_content_type_name','2022-09-05 04:15:05.769853'),(3,'auth','0001_initial','2022-09-05 04:15:05.897073'),(4,'auth','0002_alter_permission_name_max_length','2022-09-05 04:15:05.925945'),(5,'auth','0003_alter_user_email_max_length','2022-09-05 04:15:05.931948'),(6,'auth','0004_alter_user_username_opts','2022-09-05 04:15:05.937866'),(7,'auth','0005_alter_user_last_login_null','2022-09-05 04:15:05.943868'),(8,'auth','0006_require_contenttypes_0002','2022-09-05 04:15:05.946865'),(9,'auth','0007_alter_validators_add_error_messages','2022-09-05 04:15:05.951866'),(10,'auth','0008_alter_user_username_max_length','2022-09-05 04:15:05.957869'),(11,'auth','0009_alter_user_last_name_max_length','2022-09-05 04:15:05.964874'),(12,'auth','0010_alter_group_name_max_length','2022-09-05 04:15:05.976663'),(13,'auth','0011_update_proxy_permissions','2022-09-05 04:15:05.982660'),(14,'auth','0012_alter_user_first_name_max_length','2022-09-05 04:15:05.987669'),(15,'app01','0001_initial','2022-09-05 04:15:07.029919'),(16,'admin','0001_initial','2022-09-05 04:15:07.109458'),(17,'admin','0002_logentry_remove_auto_add','2022-09-05 04:15:07.121461'),(18,'admin','0003_logentry_add_action_flag_choices','2022-09-05 04:15:07.132464'),(19,'sessions','0001_initial','2022-09-05 04:15:07.154654');
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

-- Dump completed on 2022-09-17 19:39:32
