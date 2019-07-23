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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'locale','text','Locale',0,1,1,1,1,0,NULL,12),(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(13,2,'id','number','ID',1,0,0,0,0,0,'{}',1),(14,2,'name','text','Name',1,1,1,1,1,1,'{}',2),(15,2,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',3),(16,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(18,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(19,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(20,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(21,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(22,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(31,12,'id','text','Id',1,0,0,0,0,0,'{}',1),(32,12,'title','text','Title',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:225\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"max\":\"This :attribute field maximum :max.\"}}}',2),(33,12,'description','text_area','Description',0,1,1,1,1,1,'{}',3),(34,12,'start_date','date','Start Date',0,1,1,1,1,1,'{}',4),(35,12,'end_date','date','End Date',0,1,1,1,1,1,'{}',5),(36,12,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',6),(37,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(38,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(39,13,'name','text','Name',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:100\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"max\":\"This :attribute field maximum :max.\"}}}',2),(40,13,'id_card','text','Id Card',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:10\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"max\":\"This :attribute field maximum :max.\"}}}',3),(41,13,'image','image','Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"300\",\"height\":\"null\"}}',4),(42,13,'phone','text','Phone',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:100\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"max\":\"This :attribute field maximum :max.\"}}}',5),(43,13,'email','text','Email',0,0,0,0,0,0,'{\"validation\":{\"rule\":\"max:100\",\"messages\":{\"max\":\"This :attribute field maximum :max.\"}}}',6),(44,13,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',8),(45,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(46,15,'id','checkbox','Id',1,0,0,0,0,0,'{}',1),(47,15,'title','text','Title',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"This :attribute field is a must.\"}}}',2),(48,15,'description','text_area','Description',0,1,1,1,1,1,'{}',3),(49,15,'event_id','text','Event',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"This :attribute field is a must.\"}}}',4),(50,15,'numbers','number','Number of gifts',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric|min:1\",\"messages\":{\"numeric\":\"This :attribute file is number only\",\"required\":\"This :attribute field is a must.\"}}}',5),(51,15,'times','number','Spin per time',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric|min:1\",\"messages\":{\"numeric\":\"This :attribute file is number only\",\"required\":\"This :attribute field is a must.\"}}}',6),(52,15,'include_winner','checkbox','Include Winner',0,1,1,1,1,1,'{\"on\":\"Yes\",\"off\":\"No\",\"checked\":\"false\"}',7),(53,15,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',8),(54,15,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(55,15,'offer_prizing_belongsto_event_relationship','relationship','Event',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',11),(64,18,'id','checkbox','Id',1,0,0,0,0,0,'{}',1),(65,18,'participant_id','text','Participant Id',0,1,1,1,1,1,'{}',2),(66,18,'event_id','text','Event Id',0,1,1,1,1,1,'{}',3),(67,18,'num_chances','text','Number of Chances',0,1,1,1,1,1,'{}',4),(68,18,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',5),(69,18,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(70,18,'lucky_belongsto_event_relationship','relationship','Event',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(71,18,'lucky_belongsto_participant_relationship','relationship','Participant',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Participant\",\"table\":\"participants\",\"type\":\"belongsTo\",\"column\":\"participant_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(72,20,'id','text','Id',1,0,0,0,0,0,'{}',1),(73,20,'event_id','text','Event Id',0,1,1,1,1,1,'{}',2),(74,20,'participant_id','text','Participant Id',0,1,1,1,1,1,'{}',3),(75,20,'created_at','timestamp','Win Date',0,1,1,0,0,0,'{}',4),(76,20,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(77,20,'prize_id','text','Prize Id',0,1,1,1,1,1,'{}',6),(78,20,'winner_belongsto_event_relationship','relationship','Event',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(79,20,'winner_belongsto_participant_relationship','relationship','Participant',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Participant\",\"table\":\"participants\",\"type\":\"belongsTo\",\"column\":\"participant_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(80,20,'winner_belongsto_offer_prizing_relationship','relationship','Offer Prizing',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\OfferPrizing\",\"table\":\"offer_prizings\",\"type\":\"belongsTo\",\"column\":\"prize_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(81,22,'id','checkbox','Id',1,0,0,0,0,0,'{}',1),(82,22,'prize_id','text','Prize Id',0,1,1,1,1,1,'{}',2),(83,22,'times','text','Times',0,1,1,1,1,1,'{}',3),(84,22,'ready','text','Ready',0,1,1,1,1,1,'{}',4),(85,22,'spin_time_belongsto_offer_prizing_relationship','relationship','offer_prizings',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\OfferPrizing\",\"table\":\"offer_prizings\",\"type\":\"belongsTo\",\"column\":\"prize_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":null}',5),(86,15,'image','image','Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"300\",\"height\":\"null\"}}',10),(87,13,'location','text','Location',0,1,1,1,1,1,'{}',7);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
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
