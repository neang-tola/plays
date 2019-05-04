-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: lucky_base
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'locale','text','Locale',0,1,1,1,1,0,NULL,12),(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(13,2,'id','number','ID',1,0,0,0,0,0,'{}',1),(14,2,'name','text','Name',1,1,1,1,1,1,'{}',2),(15,2,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',3),(16,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(18,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(19,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(20,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(21,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(22,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(31,12,'id','text','Id',1,0,0,0,0,0,'{}',1),(32,12,'title','text','Title',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:225\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"max\":\"This :attribute field maximum :max.\"}}}',2),(33,12,'description','text_area','Description',0,1,1,1,1,1,'{}',3),(34,12,'start_date','date','Start Date',0,1,1,1,1,1,'{}',4),(35,12,'end_date','date','End Date',0,1,1,1,1,1,'{}',5),(36,12,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',6),(37,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(38,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(39,13,'name','text','Name',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:100\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"max\":\"This :attribute field maximum :max.\"}}}',2),(40,13,'id_card','text','Id Card',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:10\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"max\":\"This :attribute field maximum :max.\"}}}',3),(41,13,'image','image','Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"300\",\"height\":\"null\"}}',4),(42,13,'phone','text','Phone',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:100\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"max\":\"This :attribute field maximum :max.\"}}}',5),(43,13,'email','text','Email',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"max:100\",\"messages\":{\"max\":\"This :attribute field maximum :max.\"}}}',6),(44,13,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',7),(45,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(46,15,'id','checkbox','Id',1,0,0,0,0,0,'{}',1),(47,15,'title','text','Title',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"This :attribute field is a must.\"}}}',2),(48,15,'description','text_area','Description',0,1,1,1,1,1,'{}',3),(49,15,'event_id','text','Event',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"This :attribute field is a must.\"}}}',4),(50,15,'numbers','number','Number of gifts',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric|min:1\",\"messages\":{\"numeric\":\"This :attribute file is number only\",\"required\":\"This :attribute field is a must.\"}}}',5),(51,15,'times','number','Spin per time',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric|min:1\",\"messages\":{\"numeric\":\"This :attribute file is number only\",\"required\":\"This :attribute field is a must.\"}}}',6),(52,15,'include_winner','checkbox','Include Winner',0,1,1,1,1,1,'{\"on\":\"Yes\",\"off\":\"No\",\"checked\":\"false\"}',7),(53,15,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',8),(54,15,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(55,15,'offer_prizing_belongsto_event_relationship','relationship','Event',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(64,18,'id','checkbox','Id',1,0,0,0,0,0,'{}',1),(65,18,'participant_id','text','Participant Id',0,1,1,1,1,1,'{}',2),(66,18,'event_id','text','Event Id',0,1,1,1,1,1,'{}',3),(67,18,'num_chances','text','Number of Chances',0,1,1,1,1,1,'{}',4),(68,18,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',5),(69,18,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(70,18,'lucky_belongsto_event_relationship','relationship','Event',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(71,18,'lucky_belongsto_participant_relationship','relationship','Participant',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Participant\",\"table\":\"participants\",\"type\":\"belongsTo\",\"column\":\"participant_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(72,20,'id','text','Id',1,0,0,0,0,0,'{}',1),(73,20,'event_id','text','Event Id',0,1,1,1,1,1,'{}',2),(74,20,'participant_id','text','Participant Id',0,1,1,1,1,1,'{}',3),(75,20,'created_at','timestamp','Win Date',0,1,1,0,0,0,'{}',4),(76,20,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(77,20,'prize_id','text','Prize Id',0,1,1,1,1,1,'{}',6),(78,20,'winner_belongsto_event_relationship','relationship','Event',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(79,20,'winner_belongsto_participant_relationship','relationship','Participant',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Participant\",\"table\":\"participants\",\"type\":\"belongsTo\",\"column\":\"participant_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(80,20,'winner_belongsto_offer_prizing_relationship','relationship','Offer Prizing',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\OfferPrizing\",\"table\":\"offer_prizings\",\"type\":\"belongsTo\",\"column\":\"prize_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(81,22,'id','checkbox','Id',1,0,0,0,0,0,'{}',1),(82,22,'prize_id','text','Prize Id',0,1,1,1,1,1,'{}',2),(83,22,'times','text','Times',0,1,1,1,1,1,'{}',3),(84,22,'ready','text','Ready',0,1,1,1,1,1,'{}',4),(85,22,'spin_time_belongsto_offer_prizing_relationship','relationship','offer_prizings',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\OfferPrizing\",\"table\":\"offer_prizings\",\"type\":\"belongsTo\",\"column\":\"prize_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":null}',5);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,NULL,'2019-01-21 18:25:55','2019-01-21 18:25:55'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}','2019-01-21 18:25:55','2019-01-21 20:23:29'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2019-01-21 18:25:55','2019-01-21 18:25:55'),(12,'events','events','Event','Events','voyager-documentation','App\\Models\\Event',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-21 21:18:38','2019-01-24 20:09:13'),(13,'participants','participants','Participant','Participants','voyager-people','App\\Models\\Participant',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-21 21:51:07','2019-04-08 07:56:25'),(14,'offer_prizing','offer-prizing','Offer Prizing','Offer Prizings','voyager-diamond','App\\Models\\OfferPrizing',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-21 22:12:02','2019-01-21 22:12:02'),(15,'offer_prizings','offer-prizings','Offer Prizing','Offer Prizings','voyager-diamond','App\\Models\\OfferPrizing',NULL,'Backend\\OfferPrizingController',NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-22 20:22:36','2019-04-04 01:59:21'),(18,'luckies','luckies','Lucky','Luckies','voyager-gift','App\\Models\\Lucky',NULL,'Backend\\LuckiesController',NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-23 02:42:14','2019-01-23 02:55:21'),(20,'winners','winners','Winner','Winners','voyager-trophy','App\\Models\\Winner',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-24 19:53:21','2019-01-24 20:11:09'),(22,'spin_times','spin-times','Spin Time','Spin Times',NULL,'App\\Models\\SpinTime',NULL,'Backend\\SpinTimesController',NULL,0,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-04-03 21:42:42','2019-04-03 21:42:42');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` tinytext COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Chinese New Year','Here is Chinese event','2019-02-05','2019-02-06','2019-01-21 21:23:51','2019-01-21 21:23:51');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckies`
--

DROP TABLE IF EXISTS `luckies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luckies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` bigint(20) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `num_chances` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckies`
--

LOCK TABLES `luckies` WRITE;
/*!40000 ALTER TABLE `luckies` DISABLE KEYS */;
INSERT INTO `luckies` VALUES (22,1,1,10,'2019-01-24 20:49:53','2019-01-24 20:49:53'),(24,3,1,32,'2019-02-13 02:23:03','2019-02-13 02:23:03'),(25,2,1,10,'2019-04-08 07:59:45','2019-04-08 07:59:45'),(26,7,1,13,'2019-04-08 08:00:09','2019-04-08 08:00:09'),(27,4,1,28,'2019-04-08 08:00:27','2019-04-08 08:00:27'),(28,5,1,15,'2019-04-08 08:00:48','2019-04-08 08:00:48'),(29,6,1,12,'2019-04-08 08:01:09','2019-04-08 08:01:09');
/*!40000 ALTER TABLE `luckies` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2019-01-21 18:25:55','2019-01-21 18:25:55');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_prizings`
--

LOCK TABLES `offer_prizings` WRITE;
/*!40000 ALTER TABLE `offer_prizings` DISABLE KEYS */;
INSERT INTO `offer_prizings` VALUES (1,'(Car) Hilux Vigo 2019','sample descriptions',1,1,1,0,'2019-01-21 23:40:14','2019-01-22 21:55:03'),(2,'Honda Dream 2019','dasdfasdf',1,3,1,0,'2019-02-11 03:00:13','2019-04-04 01:58:19'),(3,'Fan 2019','d dafads',1,9,3,0,'2019-04-04 01:37:18','2019-04-08 09:13:53');
/*!40000 ALTER TABLE `offer_prizings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_card` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,'Seng Chan','010523342','participants/January2019/DTAr6K4mVqwEoh21jVxY.jpg','093 665 790','neang.tola@gmail.com',NULL,'2019-01-22 23:41:15'),(2,'Sour Chanthy','011366773','participants/January2019/oiNwFng3zQrYyaRo6o6t.jpg','015 556 888','admin@admin.com','2019-01-22 23:50:25','2019-01-22 23:50:25'),(3,'Da Da','09876543ww',NULL,'098 777666','admins@admin.com','2019-02-11 02:55:32','2019-02-11 02:55:32'),(4,'Tola Neang','0103344551',NULL,'091919293','neang.tola@gmail.com','2019-04-08 07:54:39','2019-04-08 07:54:39'),(5,'Ching Long','0198255555',NULL,'011233223',NULL,'2019-04-08 07:57:09','2019-04-08 07:57:09'),(6,'Nob Sopheakithya','0988177123',NULL,'098765432',NULL,'2019-04-08 07:58:17','2019-04-08 07:58:17'),(7,'Raksa Thivong','094123876',NULL,'011987654',NULL,'2019-04-08 07:59:03','2019-04-08 07:59:03');
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `plays`
--

DROP TABLE IF EXISTS `plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lucky_id` bigint(20) DEFAULT NULL,
  `participant_id` bigint(20) DEFAULT NULL,
  `is_picked` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2063 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plays`
--

LOCK TABLES `plays` WRITE;
/*!40000 ALTER TABLE `plays` DISABLE KEYS */;
INSERT INTO `plays` VALUES (1943,22,1,0),(1944,22,1,0),(1945,22,1,0),(1946,22,1,0),(1947,22,1,0),(1948,22,1,0),(1949,22,1,0),(1950,22,1,0),(1951,22,1,0),(1952,22,1,0),(1953,24,3,0),(1954,24,3,0),(1955,24,3,0),(1956,24,3,0),(1957,24,3,0),(1958,24,3,0),(1959,24,3,0),(1960,24,3,0),(1961,24,3,0),(1962,24,3,0),(1963,24,3,0),(1964,24,3,0),(1965,24,3,0),(1966,24,3,0),(1967,24,3,0),(1968,24,3,0),(1969,24,3,0),(1970,24,3,0),(1971,24,3,0),(1972,24,3,0),(1973,24,3,0),(1974,24,3,0),(1975,24,3,0),(1976,24,3,0),(1977,24,3,0),(1978,24,3,0),(1979,24,3,0),(1980,24,3,0),(1981,24,3,0),(1982,24,3,0),(1983,24,3,0),(1984,24,3,0),(1985,25,2,0),(1986,25,2,0),(1987,25,2,0),(1988,25,2,0),(1989,25,2,0),(1990,25,2,0),(1991,25,2,0),(1992,25,2,0),(1993,25,2,0),(1994,25,2,0),(1995,26,7,0),(1996,26,7,0),(1997,26,7,0),(1998,26,7,0),(1999,26,7,0),(2000,26,7,0),(2001,26,7,0),(2002,26,7,0),(2003,26,7,0),(2004,26,7,0),(2005,26,7,0),(2006,26,7,0),(2007,26,7,0),(2008,27,4,0),(2009,27,4,0),(2010,27,4,0),(2011,27,4,0),(2012,27,4,0),(2013,27,4,0),(2014,27,4,0),(2015,27,4,0),(2016,27,4,0),(2017,27,4,0),(2018,27,4,0),(2019,27,4,0),(2020,27,4,0),(2021,27,4,0),(2022,27,4,0),(2023,27,4,0),(2024,27,4,0),(2025,27,4,0),(2026,27,4,0),(2027,27,4,0),(2028,27,4,0),(2029,27,4,0),(2030,27,4,0),(2031,27,4,0),(2032,27,4,0),(2033,27,4,0),(2034,27,4,0),(2035,27,4,0),(2036,28,5,0),(2037,28,5,0),(2038,28,5,0),(2039,28,5,0),(2040,28,5,0),(2041,28,5,0),(2042,28,5,0),(2043,28,5,0),(2044,28,5,0),(2045,28,5,0),(2046,28,5,0),(2047,28,5,0),(2048,28,5,0),(2049,28,5,0),(2050,28,5,0),(2051,29,6,0),(2052,29,6,0),(2053,29,6,0),(2054,29,6,0),(2055,29,6,0),(2056,29,6,0),(2057,29,6,0),(2058,29,6,0),(2059,29,6,0),(2060,29,6,0),(2061,29,6,0),(2062,29,6,0);
/*!40000 ALTER TABLE `plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2019-01-21 18:25:55','2019-01-21 18:25:55'),(2,'user','Normal User','2019-01-21 18:25:55','2019-01-21 18:25:55');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Lucky Draw App','','text',1,'Site'),(2,'site.description','Site Description','Application in house','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings/February2019/iuQXzoyTScSNa0C6G5gq.jpg','','image',5,'Admin'),(6,'admin.title','Admin Title','Lucky Draw Application','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Lucky Draw App. For Home Improvement Product of Cambodia','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spin_times`
--

DROP TABLE IF EXISTS `spin_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spin_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prize_id` int(11) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `ready` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spin_times`
--

LOCK TABLES `spin_times` WRITE;
/*!40000 ALTER TABLE `spin_times` DISABLE KEYS */;
INSERT INTO `spin_times` VALUES (17,2,1,0),(18,2,1,0),(19,2,1,0),(20,1,1,0),(23,3,1,0),(24,3,2,0),(25,3,3,0);
/*!40000 ALTER TABLE `spin_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_setting`
--

DROP TABLE IF EXISTS `system_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_prefix` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_suffix` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_length` smallint(6) DEFAULT NULL,
  `setting_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_setting`
--

LOCK TABLES `system_setting` WRITE;
/*!40000 ALTER TABLE `system_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Mr.Admin','admin@system.com','users/default.png',NULL,'$2y$10$iWW2knBbyB8CxMgWXNicr.FCfMY1G1no0lbEPmxL2ykIPOT6qIRb6','XYPNo9D74SeeH4QGYRJ6IpKrMDq4kqdZJpUbjxCUY0wSTbo1ddxKtlILGu3c',NULL,'2019-01-21 18:32:49','2019-01-21 18:32:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winners`
--

DROP TABLE IF EXISTS `winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `winners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `participant_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prize_id` int(11) DEFAULT NULL,
  `win_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winners`
--

LOCK TABLES `winners` WRITE;
/*!40000 ALTER TABLE `winners` DISABLE KEYS */;
/*!40000 ALTER TABLE `winners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-09 17:04:50
