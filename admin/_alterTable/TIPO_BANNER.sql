-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
--
-- Host: localhost    Database: fotoeventi4
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `tipo_banner`
--

DROP TABLE IF EXISTS `tipo_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_banner` (
  `id_tipoBanner` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(60) DEFAULT NULL,
  `larghezza` varchar(10) DEFAULT NULL,
  `altezza` varchar(10) DEFAULT NULL,
  `lastUpdTmst` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdId_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tipoBanner`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_banner`
--

LOCK TABLES `tipo_banner` WRITE;
/*!40000 ALTER TABLE `tipo_banner` DISABLE KEYS */;
INSERT INTO `tipo_banner` VALUES (1,'Rettangolo medio',320,250,'2011-03-04 11:40:11',1),(2,'Rettangolo Grandi',336,280,'2011-03-04 11:40:25',1),(3,'Leaderboard',720,90,'2011-03-04 11:40:45',1),(4,'Skyscraper largo',160,600,'2011-03-04 11:41:03',1),(5,'Banner',468,60,'2011-03-04 11:41:19',1),(6,'Mezzo Banner',234,60,'2012-03-26 11:42:17',3),(7,'Skyscraper',120,600,'2011-03-04 11:41:47',1),(8,'Banner Verticale',120,240,'2011-03-04 11:41:58',1),(9,'Quadrato',250,250,'2011-03-04 11:42:09',1),(10,'Quadrato Piccolo',200,200,'2011-03-04 11:42:34',1),(11,'Rettangolo Piccolo',180,150,'2011-03-04 11:42:49',1),(12,'Pulsante',125,125,'2011-03-04 11:43:06',1),(13,'Link grande',728,15,'2011-03-04 11:43:24',1),(14,'Link piccolo',468,15,'2011-03-04 11:43:48',1);
/*!40000 ALTER TABLE `tipo_banner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-27 18:20:35
