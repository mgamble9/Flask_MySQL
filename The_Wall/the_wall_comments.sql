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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `messages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users_idx` (`users_id`),
  KEY `fk_comments_messages1_idx` (`messages_id`),
  CONSTRAINT `fk_comments_messages1` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'\'junky comment\'',NULL,NULL,1,1),(2,'junky comment again','2017-06-15 18:11:05','2017-06-15 18:11:05',1,1),(3,'shutup','2017-06-15 18:11:21','2017-06-15 18:11:21',1,4),(4,'dumb','2017-06-15 18:11:58','2017-06-15 18:11:58',1,3),(5,'dumb','2017-06-15 18:12:09','2017-06-15 18:12:09',1,2),(6,'screw you','2017-06-15 18:12:17','2017-06-15 18:12:17',1,1),(7,'garbage in','2017-06-15 18:12:29','2017-06-15 18:12:29',1,6),(8,'lkjlkj','2017-06-15 18:14:08','2017-06-15 18:14:08',1,1),(9,'jhkjhkjhkjhk','2017-06-15 18:14:23','2017-06-15 18:14:23',1,8),(10,'lkjlkj','2017-06-15 18:42:25','2017-06-15 18:42:25',2,9),(11,'dwedewdwedw','2017-06-15 19:24:42','2017-06-15 19:24:42',2,11),(12,'ddededewddwedwdwdwdewdwedwedwedewdewdewdwedwedwedwedwedwedwedwedwdwdwdwdwdwdwdwdwdwdedwedwed','2017-06-15 19:25:02','2017-06-15 19:25:02',2,11),(13,'wdwddwdqwdqw','2017-06-15 19:53:56','2017-06-15 19:53:56',1,12),(14,'ddwdewdwkjdhwlfkjhwdflkjhsdflkjsadhflksadjfhwlkadjfhsalkfjhsadlkfjhsadfkljshdfkljsahdflksajdfhsklajdfhsdlkjfhsdlkfjhsdfkljhsadflkjashdfkljasdhfklsjdfhslakdjfhsdalkjfhasdlkjfh','2017-06-15 19:55:37','2017-06-15 19:55:37',3,13);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-15 19:56:45
