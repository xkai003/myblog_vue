-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` varchar(45) NOT NULL,
  `label` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `look` varchar(45) NOT NULL,
  `technology` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES ('1','http://47.79.40.65:8886/','使用PM2部署vue2 + JSON 密码管理系统','2025-11-16 13:56:53','5','vue2、vuex、Node.js、JSON、axios、PM2'),('1764733288647','(不超过45字)','(不超过45字)','2025-12-03 11:41:28','5','(不超过45字)'),('1764747821965','测试','测试','2025-12-03 15:43:41','5','测试'),('2','http://47.79.40.65:8886/','笔记测试2','2025-12-2','5','笔记测试2'),('3','http://47.79.40.65:8886/','笔记测试3','2025-12-2','5','笔记测试3');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES ('1764728598269','圣心大教堂','广州','2025-12-03 10:23:18','https://www.yuexiu.gov.cn/img/0/764/764782/8665100.png','广州圣心大教堂'),('1764730687143','越秀公园','广州','2025-12-03 10:58:07','https://www.yuexiu.gov.cn/img/0/764/764154/8664487.png','广州市越秀区越秀公园'),('1764732890339','流花湖公园','广州','2025-12-03 11:34:50','https://qcloud.dpfile.com/pc/3-OQtk0bF79ipbLQK8D-kLy-9nqkpZZc4oPBSUFgLAF0dyciPvbAlEFZ_qaWpz84.jpg','广州流花湖公园'),('2','上海','中国.上海','2025-10-10','https://myblog-vue-7ma.pages.dev/assets/avatar-9Zk-EnLI.jpg','第一次来上海');
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `id` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'xiaotang','47794065');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `id` varchar(45) NOT NULL,
  `label` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `look` varchar(45) NOT NULL,
  `technology` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES ('1764673905436','sdgfdsgfds','00000000','2025.08-2025.09','5','fsgfdsghfdsh'),('1764674052296','bbb','dafdda','2025.08-2025.09','5','dddddddd'),('1764674548785','444','444','2025.08-2025.09','5','4444'),('1764688033405','https://baidu.com','测试7','2025.08-2025.09','5','测试7'),('1764689984921','ddd','ddd','2025-12-02 23:39:44','5','ddd'),('1764694865707','000','000','2025-12-03 01:01:05','5','000'),('1764733250682','(不超过45字)','(不超过45字)','2025-12-03 11:40:50','5','(不超过45字)'),('1764747725715','测试1','测试1','2025-12-03 15:42:05','5','测试1'),('3','https://baidu.com','作品测试3','2025-12-2','5','作品测3'),('4','http://47.79.40.65:8886/','作品测试4','2025-12-3','5','作品测4'),('5','http://47.79.40.65:8886/','作品测试5','2025-12-12','5','作品测试5');
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'myblog'
--

--
-- Dumping routines for database 'myblog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03 16:21:18
