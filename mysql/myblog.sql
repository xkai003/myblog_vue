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
INSERT INTO `notes` VALUES ('1774778061191','https://baidu.com','笔记测试一','2026-03-29 17:54:21','5','笔记测试一'),('1774778079590','https://baidu.com','笔记测试二','2026-03-29 17:54:39','5','笔记测试二'),('1774778096573','https://baidu.com','笔记测试三','2026-03-29 17:54:56','5','笔记测试三'),('1774798405437','2','2','2026-03-29 23:33:25','5','2'),('1774798746512','2','2','2026-03-29 23:39:06','5','2'),('1775288310952','1','1','2026-04-04 15:38:30','5','1'),('1775288316681','1','1','2026-04-04 15:38:36','5','1');
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
INSERT INTO `travel` VALUES ('1764728598269','圣心大教堂','广州','2025-12-03 10:23:18','https://www.yuexiu.gov.cn/img/0/764/764782/8665100.png','交通：一德路B口一直往巷子下走'),('1764730687143','越秀公园','广州','2025-12-03 10:58:07','https://www.yuexiu.gov.cn/img/0/764/764154/8664487.png','交通：越秀公园站B1口'),('1764732890339','流花湖公园','广州','2025-12-03 11:34:50','https://qcloud.dpfile.com/pc/3-OQtk0bF79ipbLQK8D-kLy-9nqkpZZc4oPBSUFgLAF0dyciPvbAlEFZ_qaWpz84.jpg','广州流花湖公园'),('1764761804305','广州动物园','广州','2025-12-03 19:36:44','https://www.gz.gov.cn/img/0/148/148091/6533885.jpg','交通：地铁5号线动物园站、地铁6号线黄花岗站A出口'),('1764762107250','粤海关','广州','2025-12-03 19:41:47','https://aos-comment.amap.com/B0FFMEK0R5/comment/e9ede5b444706eec53044ca4c14cd049_2048_2048_80.jpg','交通：8号线文化公园A口'),('1772272076528','a','a','2026-02-28 17:47:56','a','a'),('1774778305431','旅游测试一','北京','2026-03-29 17:58:25','https://www.yuexiu.gov.cn/img/0/764/764782/8665100.png','北京旅游测试'),('1774798410402','2','2','2026-03-29 23:33:30','2','2'),('1774798754231','2','2','2026-03-29 23:39:14','2','2'),('2','永庆坊','广州','2025-10-10','https://ak-d.tripcdn.com/images/1mi5612000d62kwvdBE59_W_640_0_R5_Q80.jpg?proc=source/trip','交通：黄沙站（1号线或6号线）B出口');
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `id` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('1775359539106','tmk','ttt','2026-04-05 11:25:39'),('1775359714149','test','test','2026-04-05 11:28:34');
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
  `label` varchar(100) NOT NULL,
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
INSERT INTO `works` VALUES ('1774777829579','https://baidu.com','作品测试一','2026-03-29 17:50:29','5','vue+mysql0'),('1774777865535','https://baidu.com','作品测试二','2026-03-29 17:51:05','5','vue+mysql二'),('1774777896790','https://baidu.com','作品测试三','2026-03-29 17:51:36','5','vue+mysql三'),('1774792538967','https://baidu.com','添加测试','2026-03-29 21:55:38','5','添加测试'),('1774797820665','1','1','2026-03-29 23:23:40','5','1'),('1774798735509','2','2','2026-03-29 23:38:55','5','2'),('1775227736096','1','1','2026-04-03 22:48:56','5','1'),('1775289998384','d','d','2026-04-04 16:06:38','5','d');
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

-- Dump completed on 2026-04-05 11:41:50
