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
-- Table structure for table `offer_prizings`
--

DROP TABLE IF EXISTS `offer_prizings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_prizings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` tinytext COLLATE utf8mb4_unicode_ci,
  `event_id` int(11) DEFAULT NULL,
  `numbers` smallint(6) DEFAULT NULL,
  `times` smallint(6) DEFAULT NULL,
  `include_winner` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_prizings`
--

LOCK TABLES `offer_prizings` WRITE;
/*!40000 ALTER TABLE `offer_prizings` DISABLE KEYS */;
INSERT INTO `offer_prizings` VALUES (7,'ម៉ូតូ',NULL,2,1,1,0,'2019-05-01 04:58:24','2019-05-08 01:37:16','offer-prizings/May2019/roIsBpnvO8XHhsnc8lvf.png'),(8,'ទូរស័ព្ទដៃ',NULL,2,2,1,0,'2019-05-01 04:59:24','2019-05-08 01:36:53','offer-prizings/May2019/nutUg9iUReDYlJoubONv.png'),(9,'កង្ហារ',NULL,2,5,1,1,'2019-05-01 04:59:50','2019-05-08 01:36:32','offer-prizings/May2019/PbQfW3buYAWKDEB3fpLJ.png'),(10,'ឆ្នាំងដាំបាយ',NULL,2,10,2,1,'2019-05-01 05:00:19','2019-05-08 01:36:18','offer-prizings/May2019/VwCFVcwXkcHx6oNDhls6.png'),(12,'ទឹកប្រាក់ $10',NULL,2,50,5,1,'2019-05-01 05:00:48','2019-05-08 01:35:57','offer-prizings/May2019/IPj2Psxnxncu2H6NfriV.png'),(13,'ទឹកប្រាក់ ដប់ ដុល្លារ',NULL,3,50,5,1,'2019-07-08 02:30:49','2019-07-08 02:31:16','offer-prizings/July2019/T8IjEttcxNqpvoSU9v8i.png'),(14,'ឆ្នាំងដាំបាយអគ្គិសនី',NULL,3,10,2,1,'2019-07-08 02:32:09','2019-07-08 02:32:09','offer-prizings/July2019/g1Dumo6KcZP8siAxAcTX.png'),(15,'កង្ហារបញ្ឃរ',NULL,3,5,1,1,'2019-07-08 02:33:19','2019-07-08 02:33:19','offer-prizings/July2019/3UDJCLIKdFZvSeQKpvJZ.png'),(16,'ទូរស័ព្ទ Smart Phone',NULL,3,2,1,0,'2019-07-08 02:35:02','2019-07-08 02:35:02','offer-prizings/July2019/kKLwOQbulKUt93omyGdM.png'),(17,'ម៉ូតូ Zusuki Smash',NULL,3,1,1,0,'2019-07-08 02:36:50','2019-07-08 02:36:50','offer-prizings/July2019/LgmXFhrlBC6YTL9jfaDL.png');
/*!40000 ALTER TABLE `offer_prizings` ENABLE KEYS */;
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
