-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: coursesurvey
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

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
-- Table structure for table `tblResponses`
--

DROP TABLE IF EXISTS `tblResponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblResponses` (
  `Identifier` varchar(255) NOT NULL DEFAULT '',
  `Major` varchar(255) DEFAULT NULL,
  `Origin` varchar(255) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `Food` varchar(255) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblResponses`
--

LOCK TABLES `tblResponses` WRITE;
/*!40000 ALTER TABLE `tblResponses` DISABLE KEYS */;
INSERT INTO `tblResponses` VALUES ('lie3u','Journalism','Cary','Indigo','Chocolate',9,'2017-07-25 18:44:53');
/*!40000 ALTER TABLE `tblResponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSurveyResponses`
--

DROP TABLE IF EXISTS `tblSurveyResponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblSurveyResponses` (
  `Identifier` varchar(255) NOT NULL DEFAULT '',
  `Major` varchar(255) DEFAULT NULL,
  `Origin` varchar(255) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `Food` varchar(255) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`Identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSurveyResponses`
--

LOCK TABLES `tblSurveyResponses` WRITE;
/*!40000 ALTER TABLE `tblSurveyResponses` DISABLE KEYS */;
INSERT INTO `tblSurveyResponses` VALUES ('aez5p','Economics','Cary','Blue','Pasta',5,2017),('he5me','Chemistry','Burlington','Leafy Green','Cabbage',4,2017),('ohd7u','Biology','Helsinki','Turtle Green','Chips',3,2017),('yook1','Psychology','Apex','Indigo','Collard Greens',4,2017);
/*!40000 ALTER TABLE `tblSurveyResponses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-25 14:44:53
