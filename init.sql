/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.16-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mtg_db
-- ------------------------------------------------------
-- Server version	10.11.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Sequence structure for `deck_karte_seq`
--

DROP SEQUENCE IF EXISTS `deck_karte_seq`;
CREATE SEQUENCE `deck_karte_seq` start with 1 minvalue 1 maxvalue 9223372036854775806 increment by 50 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`deck_karte_seq`, 1, 0);

--
-- Sequence structure for `deck_seq`
--

DROP SEQUENCE IF EXISTS `deck_seq`;
CREATE SEQUENCE `deck_seq` start with 1 minvalue 1 maxvalue 9223372036854775806 increment by 50 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`deck_seq`, 151, 0);

--
-- Sequence structure for `karte_seq`
--

DROP SEQUENCE IF EXISTS `karte_seq`;
CREATE SEQUENCE `karte_seq` start with 1 minvalue 1 maxvalue 9223372036854775806 increment by 50 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`karte_seq`, 1, 0);

--
-- Sequence structure for `thema_seq`
--

DROP SEQUENCE IF EXISTS `thema_seq`;
CREATE SEQUENCE `thema_seq` start with 1 minvalue 1 maxvalue 9223372036854775806 increment by 50 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`thema_seq`, 1, 0);

--
-- Table structure for table `Deck`
--

DROP TABLE IF EXISTS `Deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deck` (
  `deck_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`deck_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deck`
--

LOCK TABLES `Deck` WRITE;
/*!40000 ALTER TABLE `Deck` DISABLE KEYS */;
INSERT INTO `Deck` VALUES
(1,'Timey-Wimey');
/*!40000 ALTER TABLE `Deck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deck_Karte`
--

DROP TABLE IF EXISTS `Deck_Karte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deck_Karte` (
  `deck_karte_id` int(11) NOT NULL AUTO_INCREMENT,
  `deck_id` int(11) DEFAULT NULL,
  `karten_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`deck_karte_id`),
  KEY `Deck_Karte_Deck_FK` (`deck_id`),
  KEY `Deck_Karte_Karte_FK` (`karten_id`),
  CONSTRAINT `Deck_Karte_Deck_FK` FOREIGN KEY (`deck_id`) REFERENCES `Deck` (`deck_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Deck_Karte_Karte_FK` FOREIGN KEY (`karten_id`) REFERENCES `Karte` (`karten_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deck_Karte`
--

LOCK TABLES `Deck_Karte` WRITE;
/*!40000 ALTER TABLE `Deck_Karte` DISABLE KEYS */;
INSERT INTO `Deck_Karte` VALUES
(1,1,1);
/*!40000 ALTER TABLE `Deck_Karte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Karte`
--

DROP TABLE IF EXISTS `Karte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Karte` (
  `karten_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `beschreibung` varchar(100) DEFAULT NULL,
  `themen_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`karten_id`),
  KEY `Karte_Thema_FK` (`themen_id`),
  CONSTRAINT `Karte_Thema_FK` FOREIGN KEY (`themen_id`) REFERENCES `Thema` (`themen_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Karte`
--

LOCK TABLES `Karte` WRITE;
/*!40000 ALTER TABLE `Karte` DISABLE KEYS */;
INSERT INTO `Karte` VALUES
(1,'Der zehnte Doktor','test123',1),
(2,'Rose Tyler','lol13',1);
/*!40000 ALTER TABLE `Karte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Thema`
--

DROP TABLE IF EXISTS `Thema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Thema` (
  `themen_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`themen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Thema`
--

LOCK TABLES `Thema` WRITE;
/*!40000 ALTER TABLE `Thema` DISABLE KEYS */;
INSERT INTO `Thema` VALUES
(1,'Doctor Who');
/*!40000 ALTER TABLE `Thema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deck`
--

DROP TABLE IF EXISTS `deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deck` (
  `deck_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deck_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck`
--

LOCK TABLES `deck` WRITE;
/*!40000 ALTER TABLE `deck` DISABLE KEYS */;
INSERT INTO `deck` VALUES
(1,'test'),
(2,'Doktor Who'),
(52,'testdeck');
/*!40000 ALTER TABLE `deck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deck_karte`
--

DROP TABLE IF EXISTS `deck_karte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deck_karte` (
  `deck_karte_id` int(11) NOT NULL,
  `deck_id` int(11) NOT NULL,
  `karte_id` int(11) NOT NULL,
  PRIMARY KEY (`deck_karte_id`),
  KEY `FKguvvtx7q90wh1c8rksgy0ydsa` (`deck_id`),
  KEY `FKrhm3m54vw80picpso20j10w0l` (`karte_id`),
  CONSTRAINT `FKguvvtx7q90wh1c8rksgy0ydsa` FOREIGN KEY (`deck_id`) REFERENCES `deck` (`deck_id`),
  CONSTRAINT `FKrhm3m54vw80picpso20j10w0l` FOREIGN KEY (`karte_id`) REFERENCES `karte` (`karten_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck_karte`
--

LOCK TABLES `deck_karte` WRITE;
/*!40000 ALTER TABLE `deck_karte` DISABLE KEYS */;
INSERT INTO `deck_karte` VALUES
(1,2,1),
(2,2,2);
/*!40000 ALTER TABLE `deck_karte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karte`
--

DROP TABLE IF EXISTS `karte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `karte` (
  `karten_id` int(11) NOT NULL,
  `beschreibung` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `themen_id` int(11) NOT NULL,
  PRIMARY KEY (`karten_id`),
  KEY `FK5ta1hle18nt4s8aqnn45fgub5` (`themen_id`),
  CONSTRAINT `FK5ta1hle18nt4s8aqnn45fgub5` FOREIGN KEY (`themen_id`) REFERENCES `thema` (`themen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karte`
--

LOCK TABLES `karte` WRITE;
/*!40000 ALTER TABLE `karte` DISABLE KEYS */;
INSERT INTO `karte` VALUES
(1,'Lol','Der zehnte Doktor',1),
(2,'1312lol67','Rose Tyler',1);
/*!40000 ALTER TABLE `karte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thema`
--

DROP TABLE IF EXISTS `thema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `thema` (
  `themen_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`themen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thema`
--

LOCK TABLES `thema` WRITE;
/*!40000 ALTER TABLE `thema` DISABLE KEYS */;
INSERT INTO `thema` VALUES
(1,'Doktor Who');
/*!40000 ALTER TABLE `thema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mtg_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-26 10:37:10
