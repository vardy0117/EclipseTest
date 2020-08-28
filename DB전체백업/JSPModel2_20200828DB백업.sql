-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
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
  `name` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `permission` varchar(10) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`ceoNo`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceo`
--

LOCK TABLES `ceo` WRITE;
/*!40000 ALTER TABLE `ceo` DISABLE KEYS */;
INSERT INTO `ceo` VALUES (3,'test3@naver.com','1234','테스트3','01012345678','F'),(4,'test4@hanmail.net','1234','테스트4','01012345678','F'),(5,'kim@naver.com','1234','관리자','01012345678','F'),(100,'test@test.com','1234','테스트','01012345678','T'),(101,'ernie2030@naver.com','test','차스용','01096924300','F'),(113,'test2@google.com','1234','테스트1','01012345678','F'),(114,'mi@naver.com','1234','미미사장','01012345678','F');
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
  `roadAddress` varchar(100) NOT NULL,
  `detailAddress` varchar(100) NOT NULL,
  `bname` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `grade` int(10) NOT NULL DEFAULT '5',
  `agreeAD` varchar(10) NOT NULL DEFAULT 'F',
  `sido` varchar(45) NOT NULL,
  PRIMARY KEY (`customerNo`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (22,'test@123','123','이태우집23','서울 마포구 가양대로 1','132','상암동','01012341234',5,'T','서울'),(24,'a@naver.com','123','시도수정','서울 은평구 가좌로 269','123','신사동','01012341234',5,'F','서울'),(25,'jmin@google.com','1234','123','부산 금정구 금강로 165','5층 503호','장전동','01012345678',5,'F','부산'),(26,'test1234@google.com','1234','123','충북 청주시 상당구 1순환로 1202-1','1','방서동','01012345678',5,'F','충북'),(27,'test12345@google.com','1234','123','경북 상주시 청리면 삼괴1길 21-2','1','학하리','01012345678',5,'F','경북'),(28,'test@google.com','1234','123','부산 금정구 금강로 165','1','장전동','01012345678',5,'F','부산'),(33,'suwon@naver.com','1234','수원','부산 부산진구 동천로 109','7층 6강의실','부전동','01044173371',5,'T','부산'),(34,'m6ydz642@naver.com','1234','독산동 총잡이','서울 금천구 가산로 3','1동 103호','독산동','0101234',5,'F','서울'),(35,'babo@naver.com','123','이태우','충남 보령시 가막재1길 2-13','1','동대동','010123',5,'F','충남'),(37,'m6ydz64234@naver.com','1234','m6ydz642','부산 강서구 가달1로 7','산업단지 1층','생곡동','01012341234',5,'F','부산'),(38,'dkzld159@naver.com','1234','mimi','서울 강남구 강남대로 708','7층 6강의실','압구정동','01012345678',5,'T','서울'),(39,'test@naver.com','1234','test','서울 강서구 강서로 375','123','마곡동','010123213213',5,'F','서울');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuNo` int(11) NOT NULL AUTO_INCREMENT,
  `storeNo` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`menuNo`),
  KEY `fk_menu_storeNo_idx` (`storeNo`),
  CONSTRAINT `fk_menu_storeNo` FOREIGN KEY (`storeNo`) REFERENCES `store` (`storeNo`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,100,'food1',10000,'food1.jpg','주 메뉴'),(2,100,'food2',12000,'fodd2.jpg','주 메뉴'),(3,100,'desert1',7000,'desert1.jpg','사이드 메뉴'),(4,100,'desert2',5000,'desert2.jpg','사이드 메뉴'),(5,100,'drink1',2000,'drinkg1.jpg','음료/주류'),(6,100,'drink2',1000,'drinkg2.jpg','음료/주류'),(21,113,'짜장면',5000,'짜장면.png','주 메뉴'),(22,113,'짬뽕',6000,'짬뽕.png','주 메뉴'),(23,114,'미미국밥',1000,'국빱3.jpg','주 메뉴'),(24,114,'미미짬뽕',1000,'짬뽕1.png','주 메뉴'),(25,116,'짜장면',13000,'국빱10.jpg','세트 메뉴'),(26,116,'미미짱',1000,'짜장면1.png','주 메뉴'),(27,113,'국밥',100,'국밥.jpg','세트 메뉴'),(28,113,'국밥22',100,'국밥1.jpg','음료/주류'),(29,113,'국밥22',100,'국밥2.jpg','음료/주류'),(30,113,'국밥22',100,'국밥3.jpg','음료/주류');
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
  `storeNo` int(10) NOT NULL,
  `roadAddress` varchar(45) NOT NULL,
  `detailAddress` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `payment` varchar(20) NOT NULL DEFAULT 'F',
  `request` varchar(200) NOT NULL DEFAULT '요청사항 없음',
  `orderTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `orderCheck` varchar(10) NOT NULL DEFAULT 'F',
  `prepareTime` varchar(10) DEFAULT NULL,
  `deliveryCheck` varchar(10) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`orderNo`),
  KEY `fk_customerNo_idx` (`customerNo`),
  KEY `fk_orderList_storeNo_idx` (`storeNo`),
  CONSTRAINT `fk_orderList_customerNo` FOREIGN KEY (`customerNo`) REFERENCES `customer` (`customerNo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderList_storeNo` FOREIGN KEY (`storeNo`) REFERENCES `store` (`storeNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderList`
--

LOCK TABLES `orderList` WRITE;
/*!40000 ALTER TABLE `orderList` DISABLE KEYS */;
INSERT INTO `orderList` VALUES (1,22,100,'dfssd','sdfsdfs','12341234','F','요청사항 없음','2020-08-25 08:40:16','F','1234123','F'),(35,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 05:31:28','F',NULL,'F'),(36,34,100,'서울 금천구 가산로 3','1동 103호','0101234','F','요청사항 없음','2020-08-28 06:01:29','F',NULL,'F'),(37,34,113,'서울 금천구 가산로 3','1동 103호','0101234','F','요청사항 없음','2020-08-28 06:23:13','F',NULL,'F'),(38,22,116,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 06:56:29','F',NULL,'F'),(39,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:01:50','F',NULL,'F'),(40,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:26:16','F',NULL,'F'),(41,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:27:28','F',NULL,'F'),(42,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:27:56','F',NULL,'F'),(43,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:29:37','F',NULL,'F'),(44,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:32:56','F',NULL,'F'),(45,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:33:36','F',NULL,'F'),(46,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:34:09','F',NULL,'F'),(47,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:34:34','F',NULL,'F'),(48,22,100,'서울 마포구 가양대로 1','132','01012341234','F','요청사항 없음','2020-08-28 07:35:39','F',NULL,'F');
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
  `name` varchar(50) NOT NULL,
  `basePrice` int(10) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderMenu`
--

LOCK TABLES `orderMenu` WRITE;
/*!40000 ALTER TABLE `orderMenu` DISABLE KEYS */;
INSERT INTO `orderMenu` VALUES (39,'food2',NULL,23,276000),(40,'food1',NULL,1,10000),(41,'food1',NULL,3,30000),(42,'food1',NULL,3,30000),(43,'food1',NULL,4,40000),(44,'food1',NULL,2,20000),(45,'food1',NULL,4,40000),(46,'food1',NULL,4,40000),(47,'food1',NULL,7,70000),(48,'food1',NULL,10,100000);
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
  `orderNo` int(10) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,22,100,'맛있어요',2,'salmon.jpg','2020-08-25 15:00:00',NULL),(2,2,22,100,'정말맛이.......',2,'salmon.jpg','2020-08-25 15:00:00',NULL),(3,3,24,100,'난 별로',5,'salmon.jpg','2020-08-25 15:00:00',NULL),(4,4,24,100,'굿굿',4,'salmon.jpg','2020-08-26 15:00:00',NULL),(5,5,22,100,'오늘은 별로',2,'salmon.jpg','2020-08-24 15:00:00',NULL);
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
  `roadAddress` varchar(100) NOT NULL,
  `detailAddress` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `storeHours` varchar(100) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `image` varchar(200) DEFAULT 'store_basic_img.jpg',
  `points` int(10) DEFAULT '0',
  `orderCount` int(10) DEFAULT NULL,
  `deliveryArea` varchar(300) DEFAULT NULL,
  `regNo` varchar(50) NOT NULL,
  `sido` varchar(45) NOT NULL,
  PRIMARY KEY (`storeNo`),
  KEY `ceoNo_idx` (`ceoNo`),
  CONSTRAINT `fk_store_ceoNo` FOREIGN KEY (`ceoNo`) REFERENCES `ceo` (`ceoNo`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (100,100,'바토스','서울특별시 용산구 이태원1동 ','이태원로15길 1','한식','0101234578','12시~18시','백대표님의 솔루션을 받은 가게입니다','drink2.jpg',0,9,'전포동/부전동','123-12-12345','서울'),(113,5,'자금성','서울특별시 중구 을지로3가','315-18','중식','05112341234','00시 ~17시 ','자금성입니다.\r\n많이시켜주세요.','국빱2.jpg',0,9,'전포동/부전동','1234567890','서울'),(114,5,'미미국밥','부산시 ','7층 6강의실','한식','02123456','00시 ~17시 ','뜨근한 국밥','국빱2.jpg',0,9,'부전동//연산동','123-12-12345','서울'),(116,114,'미미디져트 ','서울 강북구 덕릉로 88','ㅇㄹ','한식','12341234','00시~null','안냥 곧 삭제 될거임','자금성5.png',0,NULL,'부전동','123-12-12345','서울');
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

-- Dump completed on 2020-08-28 22:09:50
