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
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2019-01-21 18:25:55','2019-01-21 18:25:55','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,4,'2019-01-21 18:25:55','2019-01-22 23:26:02','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2019-01-21 18:25:55','2019-01-21 18:25:55','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2019-01-21 18:25:55','2019-01-21 18:25:55','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,10,'2019-01-21 18:25:55','2019-01-24 19:58:47',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2019-01-21 18:25:55','2019-01-22 23:26:02','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2019-01-21 18:25:55','2019-01-22 23:26:02','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2019-01-21 18:25:55','2019-01-23 02:52:54','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2019-01-21 18:25:55','2019-01-23 02:52:54','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,11,'2019-01-21 18:25:55','2019-01-24 19:58:47','voyager.settings.index',NULL),(11,1,'Hooks','','_self','voyager-hook',NULL,5,5,'2019-01-21 18:25:56','2019-01-23 02:52:54','voyager.hooks',NULL),(13,1,'Events','','_self','voyager-documentation','#000000',NULL,5,'2019-01-21 21:18:38','2019-01-24 19:58:18','voyager.events.index','null'),(14,1,'Participants','','_self','voyager-people','#000000',NULL,6,'2019-01-21 21:51:07','2019-01-24 19:42:57','voyager.participants.index','null'),(16,1,'Offer Prizings','','_self','voyager-diamond','#000000',NULL,7,'2019-01-22 20:22:36','2019-01-24 19:58:47','voyager.offer-prizings.index','null'),(18,1,'Luckies','','_self','voyager-gift','#000000',NULL,8,'2019-01-23 02:42:14','2019-01-24 19:58:47','voyager.luckies.index','null'),(19,1,'Winners','','_self','voyager-trophy',NULL,NULL,9,'2019-01-24 19:53:21','2019-01-24 19:58:47','voyager.winners.index',NULL),(20,1,'Spin Times','','_self',NULL,NULL,NULL,12,'2019-04-03 21:42:42','2019-04-03 21:42:42','voyager.spin-times.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
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
