-- MySQL dump 10.16  Distrib 10.1.40-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: lucky_base
-- ------------------------------------------------------
-- Server version	10.1.40-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2019-01-21 18:25:55','2019-01-21 18:25:55'),(2,'browse_bread',NULL,'2019-01-21 18:25:55','2019-01-21 18:25:55'),(3,'browse_database',NULL,'2019-01-21 18:25:55','2019-01-21 18:25:55'),(4,'browse_media',NULL,'2019-01-21 18:25:55','2019-01-21 18:25:55'),(5,'browse_compass',NULL,'2019-01-21 18:25:55','2019-01-21 18:25:55'),(6,'browse_menus','menus','2019-01-21 18:25:55','2019-01-21 18:25:55'),(7,'read_menus','menus','2019-01-21 18:25:55','2019-01-21 18:25:55'),(8,'edit_menus','menus','2019-01-21 18:25:55','2019-01-21 18:25:55'),(9,'add_menus','menus','2019-01-21 18:25:55','2019-01-21 18:25:55'),(10,'delete_menus','menus','2019-01-21 18:25:55','2019-01-21 18:25:55'),(11,'browse_roles','roles','2019-01-21 18:25:55','2019-01-21 18:25:55'),(12,'read_roles','roles','2019-01-21 18:25:55','2019-01-21 18:25:55'),(13,'edit_roles','roles','2019-01-21 18:25:55','2019-01-21 18:25:55'),(14,'add_roles','roles','2019-01-21 18:25:55','2019-01-21 18:25:55'),(15,'delete_roles','roles','2019-01-21 18:25:55','2019-01-21 18:25:55'),(16,'browse_users','users','2019-01-21 18:25:55','2019-01-21 18:25:55'),(17,'read_users','users','2019-01-21 18:25:55','2019-01-21 18:25:55'),(18,'edit_users','users','2019-01-21 18:25:55','2019-01-21 18:25:55'),(19,'add_users','users','2019-01-21 18:25:55','2019-01-21 18:25:55'),(20,'delete_users','users','2019-01-21 18:25:55','2019-01-21 18:25:55'),(21,'browse_settings','settings','2019-01-21 18:25:55','2019-01-21 18:25:55'),(22,'read_settings','settings','2019-01-21 18:25:55','2019-01-21 18:25:55'),(23,'edit_settings','settings','2019-01-21 18:25:55','2019-01-21 18:25:55'),(24,'add_settings','settings','2019-01-21 18:25:55','2019-01-21 18:25:55'),(25,'delete_settings','settings','2019-01-21 18:25:55','2019-01-21 18:25:55'),(26,'browse_hooks',NULL,'2019-01-21 18:25:56','2019-01-21 18:25:56'),(32,'browse_events','events','2019-01-21 21:18:38','2019-01-21 21:18:38'),(33,'read_events','events','2019-01-21 21:18:38','2019-01-21 21:18:38'),(34,'edit_events','events','2019-01-21 21:18:38','2019-01-21 21:18:38'),(35,'add_events','events','2019-01-21 21:18:38','2019-01-21 21:18:38'),(36,'delete_events','events','2019-01-21 21:18:38','2019-01-21 21:18:38'),(37,'browse_participants','participants','2019-01-21 21:51:07','2019-01-21 21:51:07'),(38,'read_participants','participants','2019-01-21 21:51:07','2019-01-21 21:51:07'),(39,'edit_participants','participants','2019-01-21 21:51:07','2019-01-21 21:51:07'),(40,'add_participants','participants','2019-01-21 21:51:07','2019-01-21 21:51:07'),(41,'delete_participants','participants','2019-01-21 21:51:07','2019-01-21 21:51:07'),(42,'browse_offer_prizing','offer_prizing','2019-01-21 22:12:02','2019-01-21 22:12:02'),(43,'read_offer_prizing','offer_prizing','2019-01-21 22:12:02','2019-01-21 22:12:02'),(44,'edit_offer_prizing','offer_prizing','2019-01-21 22:12:02','2019-01-21 22:12:02'),(45,'add_offer_prizing','offer_prizing','2019-01-21 22:12:02','2019-01-21 22:12:02'),(46,'delete_offer_prizing','offer_prizing','2019-01-21 22:12:02','2019-01-21 22:12:02'),(47,'browse_offer_prizings','offer_prizings','2019-01-22 20:22:36','2019-01-22 20:22:36'),(48,'read_offer_prizings','offer_prizings','2019-01-22 20:22:36','2019-01-22 20:22:36'),(49,'edit_offer_prizings','offer_prizings','2019-01-22 20:22:36','2019-01-22 20:22:36'),(50,'add_offer_prizings','offer_prizings','2019-01-22 20:22:36','2019-01-22 20:22:36'),(51,'delete_offer_prizings','offer_prizings','2019-01-22 20:22:36','2019-01-22 20:22:36'),(57,'browse_luckies','luckies','2019-01-23 02:42:14','2019-01-23 02:42:14'),(58,'read_luckies','luckies','2019-01-23 02:42:14','2019-01-23 02:42:14'),(59,'edit_luckies','luckies','2019-01-23 02:42:14','2019-01-23 02:42:14'),(60,'add_luckies','luckies','2019-01-23 02:42:14','2019-01-23 02:42:14'),(61,'delete_luckies','luckies','2019-01-23 02:42:14','2019-01-23 02:42:14'),(62,'browse_winners','winners','2019-01-24 19:53:21','2019-01-24 19:53:21'),(63,'read_winners','winners','2019-01-24 19:53:21','2019-01-24 19:53:21'),(64,'edit_winners','winners','2019-01-24 19:53:21','2019-01-24 19:53:21'),(65,'add_winners','winners','2019-01-24 19:53:21','2019-01-24 19:53:21'),(66,'delete_winners','winners','2019-01-24 19:53:21','2019-01-24 19:53:21');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-09  9:24:54
