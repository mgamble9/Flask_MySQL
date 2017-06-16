CREATE DATABASE  IF NOT EXISTS `the_wall` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `the_wall`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: the_wall
-- ------------------------------------------------------
-- Server version	5.6.35

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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`users_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'\'junk\'',NULL,NULL,1),(2,'garbage','2017-06-15 17:02:06','2017-06-15 17:02:06',1),(3,'garbage','2017-06-15 17:05:39','2017-06-15 17:05:39',1),(4,'garbage','2017-06-15 17:09:29','2017-06-15 17:09:29',1),(5,'dump','2017-06-15 17:09:35','2017-06-15 17:09:35',1),(6,'junk','2017-06-15 17:25:49','2017-06-15 17:25:49',1),(7,'ddffffff','2017-06-15 18:13:13','2017-06-15 18:13:13',1),(8,'uuuuuuu','2017-06-15 18:14:15','2017-06-15 18:14:15',1),(9,'alkjlkjflksdf','2017-06-15 18:42:09','2017-06-15 18:42:09',2),(10,'What I\'m typing now is a long post that Bob is going to input into the DB because he is a noob.','2017-06-15 19:22:59','2017-06-15 19:22:59',2),(11,'dwedwdwdwdwedwed','2017-06-15 19:24:34','2017-06-15 19:24:34',2),(12,'dsdwqdwdqdw','2017-06-15 19:53:43','2017-06-15 19:53:43',1),(13,'Davelkdjdlkwjdlkqdjlqwkdjqwldkjqwdl;kwqhd;kjwhdjkwhdfklajsfdhaslkjdfdsflkjhdsaf;djkshfkjdshkjdsahfkljdsafhlkdsajhflkasjdfhlskdajfhsdalkjfhsdalkfjhasdflkjsdahflkjdsafhdskjla','2017-06-15 19:55:20','2017-06-15 19:55:20',3);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-15 19:56:44
