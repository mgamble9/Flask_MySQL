CREATE DATABASE  IF NOT EXISTS `login_registration` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `login_registration`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: login_registration
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mike','Gamble','mgamble9@yahoo.com','$2b$12$3tTmstT/q0OYe73hKZe11etBdb6BeJAbyitWyqT7ADaWB..Dqy8.S','2017-06-14 22:23:02','2017-06-14 22:23:02'),(2,'Fudge','Fudgepants','f@dumb.com','$2b$12$B8g4P7ttDNaiJhh5EEKMJu4D.yFwzpP88T1aLH13.PkFoI8F93IDu','2017-06-14 23:05:15','2017-06-14 23:05:15'),(3,'Dope','Dopey','dope@doper.com','$2b$12$iOidQBTPV1uagzvgNNOeRegFaz5QfalzCJqHmIMH3Vtz3omFJ/U8q','2017-06-14 23:18:41','2017-06-14 23:18:41'),(4,'Park','Parker','park@parker.com','$2b$12$GYKWVUYfBWg55RyGLcEcHuvLHK61F8sKVIBQlb8h6Qc.pLsKoGoXu','2017-06-15 00:03:50','2017-06-15 00:03:50'),(5,'Darnell','Jackson','kh@sskjas.com','$2b$12$IjN1h3UZ.aNu3.WQJel8OO3Ww5zEYaqgESZgOu2CcRHidzqvvHXqK','2017-06-15 10:49:04','2017-06-15 10:49:04'),(6,'Darnell','Jackson','duncan@duncan.com','$2b$12$0WWIt8p3kFHRRUJP5v8Wo.qd8y/SiqQzF0lbqUhinlClw6I0XqLge','2017-06-15 10:52:56','2017-06-15 10:52:56'),(7,'John','Johnson','john@john.com','$2b$12$YdZYP9lkpZWqEMAoa.2bg.mZzUW9f6rX6f7gU1uLKi3l3jYAcVF6S','2017-06-15 10:54:37','2017-06-15 10:54:37'),(8,'bark','barkson','bark@john.com','$2b$12$tu0wx4nbNE9v1EdOPj0iMOltwbU49roqds1DgcqdA7/7gqTAZCNKy','2017-06-15 10:55:39','2017-06-15 10:55:39'),(9,'donk','barkson','donk@john.com','$2b$12$1g8ad5DvD7Cog3itFe3lKOXbdZWen4qwSIjtDo3x6JfwE53VH8aw.','2017-06-15 10:57:21','2017-06-15 10:57:21'),(10,'dave','barkson','dave@john.com','$2b$12$JACUPHkC/pRa1mA683PCG.QmbpIeJ5UmuYfEFTQK2GPrG7rX.WRaC','2017-06-15 10:59:25','2017-06-15 10:59:25'),(11,'junk','barkson','junk@john.com','$2b$12$JG1bmGj41iIezjfxX3X3GOuh2CGie.i8MWy8s0my6jIZoK3hOvzvO','2017-06-15 11:01:10','2017-06-15 11:01:10'),(12,'goof','Gamble','goof@yahoo.com','$2b$12$07EryE8whUrNzvgJ4prtuuj1zauhF5wZQkaYHkoX5MN.apDmbGaOa','2017-06-15 11:12:00','2017-06-15 11:12:00'),(13,'Junk','Gamble','Junk@yahoo.com','$2b$12$oaTBwYO/SMifAjK5jaNT1u.V.hw3RHl0hf3IJHIOxtGPL2nvCOlEm','2017-06-15 11:13:39','2017-06-15 11:13:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-15 11:15:24
