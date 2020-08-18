-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 59.20.215.149    Database: jspmodel2
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.16.04.1

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
-- Table structure for table `ceo`
--

DROP TABLE IF EXISTS `ceo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ceo` (
  `ceoNo` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `permission` varchar(10) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`ceoNo`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceo`
--

LOCK TABLES `ceo` WRITE;
/*!40000 ALTER TABLE `ceo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ceo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerNo` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `bname` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `grade` int(10) NOT NULL DEFAULT '5',
  `agreeAD` varchar(10) DEFAULT 'F',
  PRIMARY KEY (`customerNo`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'gil123@gmail.com','CAE7BDDDD9372BCA4DD009F1D9F7ECE1445BC9C69C7E302F8129AAC70BF0E6FC','길','부산 부산진구 시민공원로 7 ','범천동','01012345690',5,'T'),(3,'gil@gmail.com','FA1A9AB98AD4ACBB1829CE4CEC9D87BA','길','부산 부산진구 동천로 109 7층','부전동','01012345678',5,'T'),(5,'test@1234','364205615BEEC068E555AB0F5626B998','닉네임','부산','범전동','101234',5,'T'),(6,'test123@naver.com','ED0743715B6951C671DBCBF38CC4D1C150F8D8C9E9EAA1D5DF47309EF1F0A999','닉네임2','서울','상암동','1012457987',5,'T'),(8,'test12@naver.com','600D99DF4F02D3568CA0C2598F0E0E6B445BC9C69C7E302F8129AAC70BF0E6FC','닉네임3','서울','상암동','1028017891',5,'T'),(17,'신상국3@naver.com','67102B667E3C9E31F554EE2F68388E7859F25ADD46E439E5FD31FEEFC84AA424','힝','경기 성남시 분당구 대왕판교로606번길 45 무슨주소였지','삼평동','01097787248',5,'F'),(18,'신상국2@naver.com','DBF2197A2CF772C8E4F9A91BF662D2AEEB6A2A2262D5721F17D9C994EFBE87D8','힝','제주특별자치도 서귀포시 가가로 14 무슨주소였지','상예동','01097787248',5,'F'),(19,'12345@12345123','D95C88BA02D4D7AEC84BC9EA9686C0AE','1234','서울 마포구 가양대로 1 흠흠흠흠','상암동','01012341231',5,'F'),(20,'joonyoung@1234','1E9874F8512E757EF9BF0069B2CB77C1','joon','부산 남구 동명로 66 흠흠흐흠','용호동','01002807872',5,'F');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `storeNo` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  KEY `fk_menu_storeNo_idx` (`storeNo`),
  CONSTRAINT `fk_menu_storeNo` FOREIGN KEY (`storeNo`) REFERENCES `store` (`storeNo`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderList`
--

DROP TABLE IF EXISTS `orderList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderList` (
  `orderNo` int(10) NOT NULL AUTO_INCREMENT,
  `customerNo` int(10) DEFAULT NULL,
  `ceoNo` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `payment` varchar(20) NOT NULL,
  `request` varchar(200) NOT NULL DEFAULT '요청사항 없음',
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderCheck` varchar(10) NOT NULL DEFAULT 'F',
  `prepareTime` varchar(10) DEFAULT NULL,
  `deliveryCheck` varchar(10) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`orderNo`),
  KEY `ceoNo_idx` (`ceoNo`),
  KEY `fk_customerNo_idx` (`customerNo`),
  CONSTRAINT `fk_orderList_ceoNo` FOREIGN KEY (`ceoNo`) REFERENCES `ceo` (`ceoNo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderList_customerNo` FOREIGN KEY (`customerNo`) REFERENCES `customer` (`customerNo`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderList`
--

LOCK TABLES `orderList` WRITE;
/*!40000 ALTER TABLE `orderList` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderMenu`
--

DROP TABLE IF EXISTS `orderMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderMenu` (
  `orderNo` int(10) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  KEY `fk_orderMenu_orderNo_idx` (`orderNo`),
  CONSTRAINT `fk_orderMenu_orderNo` FOREIGN KEY (`orderNo`) REFERENCES `orderList` (`orderNo`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderMenu`
--

LOCK TABLES `orderMenu` WRITE;
/*!40000 ALTER TABLE `orderMenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderMenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewNo` int(10) NOT NULL AUTO_INCREMENT,
  `customerNo` int(10) NOT NULL,
  `storeNo` int(10) NOT NULL,
  `contents` varchar(1000) NOT NULL,
  `points` int(2) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`reviewNo`),
  KEY `fk_review_customerNo_idx` (`customerNo`),
  KEY `fk_review_storeNo_idx` (`storeNo`),
  CONSTRAINT `fk_review_customerNo` FOREIGN KEY (`customerNo`) REFERENCES `customer` (`customerNo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_storeNo` FOREIGN KEY (`storeNo`) REFERENCES `store` (`storeNo`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `storeNo` int(10) NOT NULL AUTO_INCREMENT,
  `ceoNo` int(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `storeHours` varchar(100) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `image` varchar(200) DEFAULT 'store_basic_img.jpg',
  `points` int(10) DEFAULT '0',
  `orderCount` int(10) DEFAULT NULL,
  `deliveryArea` varchar(300) DEFAULT NULL,
  `regNo` varchar(50) NOT NULL,
  PRIMARY KEY (`storeNo`),
  KEY `ceoNo_idx` (`ceoNo`),
  CONSTRAINT `fk_store_ceoNo` FOREIGN KEY (`ceoNo`) REFERENCES `ceo` (`ceoNo`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-18 17:40:54
