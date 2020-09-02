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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceo`
--

LOCK TABLES `ceo` WRITE;
/*!40000 ALTER TABLE `ceo` DISABLE KEYS */;
INSERT INTO `ceo` VALUES (3,'m6ydz642@naver.com','1234','테스트3','01012345678','F'),(4,'test4@hanmail.net','1234','테스트4','01012345678','F'),(5,'kim@naver.com','1234','관리자','01012345678','F'),(100,'test@test.com','1234','테스트','01012345678','T'),(101,'ernie2030@naver.com','test','차스용','01096924300','F'),(113,'test2@google.com','1234','테스트1','01012345678','F'),(114,'mi@naver.com','1234','미미사장','01012345678','F'),(115,'ceosuwon@naver.com','1234','조수원','01044173371','F'),(116,'cha@naver.com','1234','차승요','0101234123','F'),(118,'jinjin@google.com','123','김진진','01012345678','F'),(119,'taewoo@naver.com','1234','이태우','01012345668','F');
/*!40000 ALTER TABLE `ceo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `couponNo` int(10) NOT NULL AUTO_INCREMENT,
  `customerNo` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `discount` int(10) NOT NULL,
  `expDate` timestamp NULL DEFAULT NULL,
  `used` varchar(45) DEFAULT 'F',
  PRIMARY KEY (`couponNo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (6,22,'10%할인쿠폰',10,'2020-09-01 15:00:00','F'),(7,22,'5%할인쿠폰',5,'2020-09-01 15:00:00','F'),(8,22,'20%할인쿠폰',20,'2020-09-02 15:00:00','F'),(9,22,'10%할인쿠폰',10,'2020-09-02 15:00:00','F'),(10,22,'30%할인쿠폰',30,'2020-09-03 15:00:00','F'),(11,22,'20%할인쿠폰',20,'2020-09-04 15:00:00','F'),(12,22,'10%할인쿠폰',10,'2020-09-05 15:00:00','F');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (22,'test@123','123','이태우집23','부산 부산진구 동천로 109','132','부전동','01012341234',5,'T','부산'),(24,'a@naver.com','123','시도수정','서울 은평구 가좌로 269','123','신사동','01012341234',5,'F','서울'),(25,'jmin@google.com','1234','123','부산 금정구 금강로 165','5층 503호','장전동','01012345678',5,'F','부산'),(26,'test1234@google.com','1234','123','충북 청주시 상당구 1순환로 1202-1','1','방서동','01012345678',5,'F','충북'),(27,'test12345@google.com','1234','123','경북 상주시 청리면 삼괴1길 21-2','1','학하리','01012345678',5,'F','경북'),(28,'test@google.com','1234','123','부산 금정구 금강로 165','1','장전동','01012345678',5,'F','부산'),(33,'suwon@naver.com','1234','수원','부산 부산진구 동천로 109','7층 6강의실','부전동','01044173371',5,'T','부산'),(34,'m6ydz642@naver.com','1234','독산동 총잡이','서울 금천구 가산로 3','1동 103호','독산동','0101234',5,'F','부산'),(35,'babo@naver.com','123','이태우','충남 보령시 가막재1길 2-13','1','동대동','010123',5,'F','충남'),(37,'m6ydz64234@naver.com','1234','m6ydz642','부산 강서구 가달1로 7','산업단지 1층','생곡동','01012341234',5,'F','부산'),(38,'dkzld159@naver.com','1234','mimi','서울 강남구 강남대로 708','7층 6강의실','압구정동','01012345678',5,'T','서울'),(39,'test@naver.com','1234','test','서울 강서구 강서로 375','123','마곡동','010123213213',5,'F','서울'),(40,'devsin@naver.com','1234','신상국','부산 부산진구 동성로 2','m6ydz642@naver.com','전포동','01039382934',5,'F','부산'),(41,'dkzld@naver.com','1234','mimimi','부산 부산진구 동천로 109','456','부전동','010123456789',5,'T','부산');
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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,100,'food1',10000,'food1.jpg','주 메뉴'),(2,100,'food2',12000,'fodd2.jpg','주 메뉴'),(3,100,'desert1',7000,'desert1.jpg','사이드 메뉴'),(4,100,'desert2',5000,'desert2.jpg','사이드 메뉴'),(5,100,'drink1',2000,'drinkg1.jpg','음료/주류'),(6,100,'drink2',1000,'drinkg2.jpg','음료/주류'),(22,113,'짬뽕',6500,'짬뽕.png','주 메뉴'),(25,116,'짜장면',13000,'국빱10.jpg','세트 메뉴'),(26,116,'미미짱',1000,'짜장면1.png','주 메뉴'),(27,113,'국밥2',100,'국밥.jpg','주 메뉴'),(32,119,'1인분 정식갈비 세트',900000,'돼지갈비.jpg','세트 메뉴'),(33,119,'소금구이',14000,'소금구이.jpg','사이드 메뉴'),(35,113,'미미',100,'짜장면.png','주 메뉴'),(38,125,'순살 찜닭',25000,'순살찜닭.jpg','주 메뉴'),(39,125,'뼈있는 찜닭',22000,'뼈찜닭.jpg','주 메뉴'),(40,126,'충무김밥',6000,'충무김밥.jpg','주 메뉴'),(41,126,'돈까스정식',8000,'돈까스정식.jpg','세트 메뉴'),(42,126,'공기밥',1000,'공기밥.jpg','사이드 메뉴'),(43,126,'계란후라이',500,'계란후라이.jpg','사이드 메뉴'),(44,126,'콜라 500ml',1500,'콜라.jpg','음료/주류'),(45,127,'짜장면',5000,'주메뉴-짜장면.jpg','주 메뉴'),(46,127,'세트1(탕수육,짜장면)',15000,'세트메뉴 -탕짜.jpg','세트 메뉴'),(47,127,'사이다',1500,'음료 - 사이다.jpg','음료/주류'),(48,128,'곱창전골',10000,'곱창전골.jpg','주 메뉴'),(49,128,'새우볶음밥',12000,'햄야채볶음밥.jpg','주 메뉴'),(50,129,'음료',1500,'음료.JPG','음료/주류'),(51,129,'군만두',5000,'사이드- 군만두.JPG','사이드 메뉴'),(52,129,'공기밥',1000,'사이드-공기밥.JPG','사이드 메뉴'),(53,129,'꿔바로우',10000,'주메뉴-꿔바로우.JPG','주 메뉴'),(54,129,'짬뽕',7000,'짬뽕명가-짬뽕.JPG','주 메뉴'),(55,129,'탕수육',10000,'짬뽕명가-탕수육.JPG','주 메뉴'),(56,130,'세트 1(떡1 + 튀오뎅1 + 튀만두1)',11000,NULL,'세트 메뉴'),(57,130,'치즈 떡볶이',4000,'치즈떡볶이.JPG','주 메뉴'),(58,130,'모듬 튀김',6500,'모듬튀김.JPG','사이드 메뉴'),(59,130,'쿨피스',2000,NULL,'음료/주류'),(60,131,'아메리카노',200,'아메리카노jpg.PNG','주 메뉴'),(61,131,'카푸치노',500,NULL,'주 메뉴'),(62,132,'모듬 초밥세트',15000,'모듬초밥1.jpg','세트 메뉴'),(63,132,'1인 초밥세트',10000,'1인 초밥.jpg','세트 메뉴'),(64,132,'연어 초밥 12ps',9000,'연어초밥.jpg','주 메뉴'),(65,132,'새우 튀김 3ps',4000,'새우튀김.jpg','사이드 메뉴'),(66,132,'생새우 초밥 12ps',9000,'생새우.jpg','주 메뉴'),(67,132,'콜라 500ml',1500,'콜라.jpg','음료/주류'),(68,134,'훠궈세트',24000,'신흥원훠거1.jpg','세트 메뉴'),(69,134,'마라탕',7000,'마라탕.jpg','주 메뉴'),(70,134,'꿔바로우',12000,'꿔바로우.jpg','주 메뉴'),(71,134,'양꼬치 10개',11000,'양꼬치10.jpg','사이드 메뉴'),(72,134,'콜라',1500,'콜라1.jpg','음료/주류'),(73,134,'사이다',1500,'사이다.jpg','음료/주류'),(74,134,'환타',1500,'환타.jpg','음료/주류'),(75,136,'물만두',5000,'사이드-물만두2.JPG','사이드 메뉴'),(76,136,'코카콜라',1000,'코카콜라.JPG','음료/주류'),(77,137,'한마리 찜닭',20800,'한마리찜닭.JPG','주 메뉴'),(78,137,'로제 찜닭 세트',33800,'로제찜닭세트.JPG','세트 메뉴'),(79,137,'반마리 찜닭',18000,'반마리찜닭.JPG','주 메뉴'),(80,139,'소유라멘',8000,'소유라멘.jpg','세트 메뉴'),(81,141,'탕수육+군만두+짜장면2',24000,'탕수육군만두짜장면2.jpg','세트 메뉴'),(82,141,'짜장면',5000,'짜장면.jpg','주 메뉴'),(83,141,'삼선짬뽕',6500,'삼선짬뽕.jpg','주 메뉴'),(84,141,'새우볶음밥',7000,'새우볶음밥.jpg','주 메뉴'),(85,141,'공기밥',1000,'공기밥1.jpg','사이드 메뉴'),(86,142,'군만두',5000,'사이드-군만두.JPG','사이드 메뉴'),(87,142,'사천짜장',7000,'주메뉴-사천짜장.JPG','주 메뉴'),(88,142,'짬뽕',5000,'주메뉴-짬뽕.JPG','주 메뉴'),(89,142,'해물쟁반짜장',7000,'주메뉴-해물쟁반짜장.JPG','주 메뉴'),(90,142,'사이다',1500,'음료 - 사이다1.jpg','음료/주류'),(91,143,'유부 초밥',2000,'유부.PNG','주 메뉴'),(92,143,'새우튀김',5000,'새우.PNG','사이드 메뉴'),(93,144,'연어초밥',12000,'연어초밥.jpg','주 메뉴'),(94,144,'상무초밥',15000,'상무초밥.jpg','사이드 메뉴'),(95,145,'삼겹살구이정식',9000,'삼겹살구이정식.jpg','주 메뉴'),(96,145,'우삼겹구이정식',9000,'우삼겹구이정식.jpg','주 메뉴'),(97,145,'우삼겹된장찌개',5000,'우삼겹된장찌개.jpg','사이드 메뉴'),(98,145,'콜라',1000,'콜라.jpg','음료/주류'),(99,145,'환타(파인애플)',1000,'환타(파인애플).jpg','음료/주류'),(100,146,'시카고짬뽕',8000,'시카고짬뽕.jpg','주 메뉴'),(101,146,'크림짬뽕',9000,'크림짬뽕.jpg','주 메뉴'),(102,146,'로제짬뽕',9000,'로제짬뽕.jpg','주 메뉴'),(103,146,'소이치킨5p',5000,'소이치킨5p.jpg','사이드 메뉴'),(104,146,'군만두6p',3500,'군만두6p.jpg','사이드 메뉴'),(105,147,'세트1',20000,'세트1-탕수육+짜장2+콜라.JPG','세트 메뉴'),(106,147,'세트2',21000,'세트2- 탕수육.짬뽕.짜장.콜라.JPG','세트 메뉴'),(107,147,'환타',1500,'음료-환타.JPG','음료/주류'),(108,147,'볶음밥',7000,'주메뉴-볶음밥.JPG','주 메뉴'),(109,147,'불짜장',7000,'주메뉴-불짜장.JPG','주 메뉴'),(110,148,'안동찜닭',200000,'안동.png','주 메뉴'),(111,148,'닭도리 ',52000,'닭도리.png','주 메뉴'),(112,149,'까르보나라 떡볶이',6000,'까르보나라떡볶이.jpg','사이드 메뉴'),(113,149,'모듬튀김 7P',6000,'모듬튀김.jpg','세트 메뉴'),(114,151,'치킨 버거 ',10000,'치킨.PNG','주 메뉴'),(115,151,'뚱버거세트',15000,'뚱버거.PNG','세트 메뉴'),(116,152,'최상급 대게 1kg',79900,'까르보나라떡볶이1.jpg','세트 메뉴'),(117,153,'국내산 족발',19000,'국내산족발1.JPG','주 메뉴'),(118,153,'보쌈세트(보쌈 4종반찬 + 음료 2 + 모밀국수)',40000,'보쌈세트1.JPG','세트 메뉴'),(119,153,'냉모밀국수',5000,'냉모밀국수1.JPG','사이드 메뉴'),(120,153,'콜라',1000,'콜라1.JPG','음료/주류'),(121,153,'사이다',1000,'사이다.JPG','세트 메뉴'),(122,154,'마라두부덮밥',6000,'사이드-마라두부덮밥.JPG','사이드 메뉴'),(123,154,'콜라',1500,'음료-콜라.JPG','음료/주류'),(124,154,'양꼬치',10000,'주메뉴 양꼬치.JPG','주 메뉴'),(125,154,'마라탕',8000,'주메뉴-마라탕.JPG','주 메뉴'),(126,155,'탕수육+짜장 1인세트',14000,'탕수육짜장.jpg','세트 메뉴'),(127,155,'차돌박이짬뽕',9000,'차돌박이짬뽕.jpg','주 메뉴'),(128,155,'중화비빔밥',9000,'중화비빔밥.jpg','주 메뉴'),(129,155,'고추군만두',5000,'고추군만두.jpg','사이드 메뉴'),(130,155,'스프라이트',1500,'스프라이트.jpg','음료/주류'),(131,156,'참치모듬회',55000,'참치모듬회.jpg','세트 메뉴'),(132,156,'생연어회 1인분',20000,'생연어회.jpg','세트 메뉴'),(133,157,'찹살 탕수육',12000,'찹살탕수육.jpg','주 메뉴'),(134,157,'매콤간장 탕수육',12000,'매콤간장탕수육.jpg','주 메뉴'),(135,157,'햄야채볶음밥',4000,'햄야채볶음밥.jpg','사이드 메뉴'),(136,157,'새우볶음밥',5000,'새우볶음밥1.jpg','사이드 메뉴'),(137,158,'모듬회(광어+연어+생와사비+매운탕)',23000,'모듬회(광어+연어+초장+간장+생와사비).JPG','세트 메뉴'),(138,158,'유부초밥',15000,'유부초밥.JPG','주 메뉴'),(139,158,'새우튀김',8000,'새우튀김.JPG','사이드 메뉴'),(140,158,'콜라',1000,'콜라2.jpg','음료/주류'),(141,158,'사이다',1000,'사이다1.jpg','음료/주류'),(142,158,'초밥세트(그날그날달라요)',25000,'잉잉초밥1.JPG','세트 메뉴'),(143,158,'광어초밥12p',18000,'잉잉초밥2.JPG','주 메뉴'),(144,158,'새우튀김 3pcs',3000,'새우튀김1.JPG','사이드 메뉴');
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
  `couponNo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`orderNo`),
  KEY `fk_customerNo_idx` (`customerNo`),
  KEY `fk_orderList_storeNo_idx` (`storeNo`),
  CONSTRAINT `fk_orderList_customerNo` FOREIGN KEY (`customerNo`) REFERENCES `customer` (`customerNo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderList_storeNo` FOREIGN KEY (`storeNo`) REFERENCES `store` (`storeNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderList`
--

LOCK TABLES `orderList` WRITE;
/*!40000 ALTER TABLE `orderList` DISABLE KEYS */;
INSERT INTO `orderList` VALUES (1,22,125,'부산 부산진구 동천로 109','132','01012341234','47000','없음','2020-09-02 08:19:30','F',NULL,'F',NULL),(2,22,125,'부산 부산진구 동천로 109','132','01012341234','47000','없음','2020-09-02 08:28:22','F',NULL,'F',NULL),(3,22,130,'부산 부산진구 동천로 109','132','01012341234','23000','없음','2020-09-02 08:32:34','F',NULL,'F',NULL),(4,22,125,'부산 부산진구 동천로 109','132','01012341234','47000','없음','2020-09-02 08:41:26','F',NULL,'F',NULL),(5,22,125,'부산 부산진구 동천로 109','132','01012341234','47000','없음','2020-09-02 08:43:52','F',NULL,'F',NULL),(6,22,125,'부산 부산진구 동천로 109','132','01012341234','47000','없음','2020-09-02 08:44:20','F',NULL,'F',NULL),(7,22,125,'부산 부산진구 동천로 109','132','01012341234','42300','없음','2020-09-02 08:47:32','F',NULL,'F',NULL),(8,22,125,'부산 부산진구 동천로 109','132','01012341234','42300','없음','2020-09-02 08:47:35','F',NULL,'F',NULL),(9,22,125,'부산 부산진구 동천로 109','132','01012341234','42300','없음','2020-09-02 08:47:37','F',NULL,'F',NULL),(10,22,125,'부산 부산진구 동천로 109','132','01012341234','42300','없음','2020-09-02 08:47:45','F',NULL,'F',NULL),(11,22,125,'부산 부산진구 동천로 109','132','01012341234','44650','없음','2020-09-02 08:49:24','F',NULL,'F',NULL),(12,22,125,'부산 부산진구 동천로 109','132','01012341234','42300','없음','2020-09-02 08:51:31','F',NULL,'F',NULL),(13,22,125,'부산 부산진구 동천로 109','132','01012341234','47000','없음','2020-09-02 08:56:56','F',NULL,'F',NULL),(14,22,125,'부산 부산진구 동천로 109','132','01012341234','47000','없음','2020-09-02 08:57:00','F',NULL,'F',NULL),(15,22,125,'부산 부산진구 동천로 109','132','01012341234','47000','없음','2020-09-02 08:58:00','F',NULL,'F',NULL),(16,22,134,'부산 부산진구 동천로 109','132','01012341234','24000','없음','2020-09-02 12:42:07','F',NULL,'F',NULL);
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
INSERT INTO `orderMenu` VALUES (1,'순살 찜닭',25000,1,25000),(1,'뼈있는 찜닭',22000,1,22000),(6,'순살 찜닭',25000,1,25000),(6,'뼈있는 찜닭',22000,1,22000),(7,'순살 찜닭',25000,1,25000),(7,'뼈있는 찜닭',22000,1,22000),(8,'순살 찜닭',25000,1,25000),(8,'뼈있는 찜닭',22000,1,22000),(9,'순살 찜닭',25000,1,25000),(9,'뼈있는 찜닭',22000,1,22000),(10,'순살 찜닭',25000,1,25000),(10,'뼈있는 찜닭',22000,1,22000),(11,'순살 찜닭',25000,1,25000),(11,'뼈있는 찜닭',22000,1,22000),(12,'순살 찜닭',25000,1,25000),(12,'뼈있는 찜닭',22000,1,22000),(13,'순살 찜닭',25000,1,25000),(13,'뼈있는 찜닭',22000,1,22000),(14,'순살 찜닭',25000,1,25000),(14,'뼈있는 찜닭',22000,1,22000),(15,'순살 찜닭',25000,1,25000),(15,'뼈있는 찜닭',22000,1,22000),(3,'무슨 메뉴야',25000,1,25000),(16,'훠궈세트',24000,1,24000);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (2,2,22,100,'정말맛이.......',2,'salmon.jpg','2020-08-25 15:00:00',NULL),(3,3,24,100,'난 별로',5,'salmon.jpg','2020-08-25 15:00:00',NULL),(4,4,24,100,'굿굿',4,'salmon.jpg','2020-08-26 15:00:00',NULL),(5,5,22,100,'오늘은 별로',2,'salmon.jpg','2020-08-24 15:00:00',NULL),(6,6,26,100,'오늘은 별로',1,'salmon.jpg','2020-08-24 15:00:00',NULL),(7,6,22,100,'사진없음',3,NULL,'2020-08-28 15:00:00',NULL),(8,9,22,100,'사진테스트',4,NULL,'2020-08-23 15:00:00',NULL),(9,10,22,113,'다 식어서 왔음',2,NULL,'2020-08-31 15:00:00',NULL),(10,11,22,100,'페이징',3,NULL,'2020-09-01 15:00:00',NULL),(11,12,22,100,'페이징',2,NULL,'2020-09-01 15:00:00',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (100,100,'바토스','서울특별시 용산구 이태원1동 ','이태원로15길 1','한식','0101234578','12시~18시','백대표님의 솔루션을 받은 가게입니다','drink2.jpg',1,9,'전포동/부전동','123-12-12345','서울'),(113,5,'자금성','서울특별시 중구 을지로3가','315-18','중식','05112341234','00시~17시','자금성입니다.\r\n많이시켜주세요.','자금성.png',2,9,'전포동/부전동/','1234567890','서울'),(116,114,'미미중국집','부산 부산진구 동천로 109','1층','중식','12341234','23시~03시','짜장면 맛집이야','짜장면4.png',4,NULL,'부전동/전포동','123-12-12345','서울'),(119,100,'마포갈비','서울 마포구 마포대로 112-4','1층','한식','027199292','11시~23시 ','진짜 원조 최대포 달달한 갈비','원조마포갈비.jpg',5,NULL,'','1102039402','서울'),(120,100,'마포갈비','서울 마포구 마포대로 112-4','1층','한식','027199292','11시~23시 ','진짜 원조 최대포 달달한 갈비','원조마포갈비.jpg',1,NULL,'','1102039402','서울'),(123,100,'마포갈비','서울 마포구 마포대로 112-4','1층','한식','027199292','11시~23시 ','진짜 원조 최대포 달달한 갈비','원조마포갈비.jpg',1,NULL,'','1102039402','서울'),(124,100,'마포갈비','서울 마포구 마포대로 112-4','1층','한식','027199292','11시~23시 ','진짜 원조 최대포 달달한 갈비','원조마포갈비.jpg',1,NULL,'','1102039402','서울'),(125,115,'안동찜닭','부산 부산진구 동천로 109','1층 안동찜닭','한식','05112343734','00시~00시','안녕하세요. 안동찜닭 전문점입니다.\r\n많이 시켜주세요.','안동찜닭.jpg',0,NULL,'전포동/부전동','1234567890','부산'),(126,115,'김밥마을','부산 부산진구 동천로 109','2층 김밥마을','한식','0511234567','12시~18시','김밥마을입니다.\r\n돈까스 맛있어요.','김밥마을.jpg',0,NULL,'부전동/전포동','0987654321','부산'),(127,116,'미각','부산 부산진구 동천로 109','1층','중식','0511234123','09시 ~21시 ','중식집 미각입니다.','미각.jpg',0,NULL,'전포동/부전동','405-05-98965','부산'),(128,114,'미미곱창','부산 부산진구 동천로 109','1층','일식','0511231233','10시~02시','미미 곱창... 입니다....안녕....하...세....효......\r\n','미미곱창1.jpg',0,NULL,'부전동/전포동','1234567890','부산'),(129,116,'짬뽕명가','부산 부산진구 동천로 109','1층','중식','05124613241','00시~09시','짬뽕명가 입니다.','짬뽕명가.JPG',0,NULL,'부전동/전포동','560-36-00739','부산'),(130,118,'신전떡볶이 ','부산 부산진구 동천로 109','1층','한식','0511234567','10시 ~16시 ','최선을 다하겠습니다.','신전떡볶이.JPG',0,NULL,'부전동/전포동','1001010000','부산'),(131,114,'미미카페','부산 부산진구 동천로 109','1층','한식','051123456','10시~19시','안녕하세요~~~ 미미카페입니다\r\n코로나 이벤트 중이에요 \r\n아메리카노 200원','미미디져트.PNG',0,NULL,'부전동/전포동','1234567891','부산'),(132,119,'내공초밥','부산 부산진구 동천로 109','1층','일식','0513222223','10시 ~00시 ','일식의 명가','내공초밥.jpg',0,NULL,'부전동/전포동/당감동','1234123412','부산'),(134,115,'신흥원훠궈','부산 부산진구 동천로 109','1층','중식','0517777777','10시~22시','많이 시켜주세요. 맛있어요.','신흥원훠거.jpg',0,NULL,'부전동/전포동','1234567890','부산'),(136,116,'아리원','부산 부산진구 동천로 109','1층','중식','05153261341','07시 ~17시 ','아리원 입니다.','아리원메인2.JPG',0,NULL,'','371-32-00335',''),(137,118,'두마리찜닭','부산 부산진구 동천로 109','1층','한식','0541234','17시 ~22시 ','','두마리찜닭.JPG',0,NULL,'부전동/전포동','100-1000-10000','부산'),(139,3,'카라돈','부산 부산진구 동천로 109','1층','일식','0512342351','23시 ~03시 ','카드 사절입니다\r\n','카라돈1.jpg',0,NULL,'/전포동/부전동','1369781234',''),(141,115,'양첸반점','부산 부산진구 동천로 109','1층','중식','0511231234','00시~00시','양첸반점입니다.\r\n많이 시켜주세요.\r\n사랑합니다.','양첸반점.jpg',0,NULL,'부전동/전포동','1234567890','부산'),(142,116,'가빈','부산 부산진구 동천로 109','1층','중식','05186542111','13시 ~21시 ','가빈입니다.','가빈-메인1.JPG',0,NULL,'부전동/전포동','	605-21-86322','부산'),(143,114,'미미초밥','부산 부산진구 동천로 109','1층','한식','02123456','03시~18시','미미 초밥 ','초밥.jpg',0,NULL,'부전동/전포동','1234554444',''),(144,3,'마끼마끼','부산 부산진구 동천로 109','1층','한식','051234423','20시 ~06시 ','그날 그날 잡은 신선한 재료를 사용합니다\r\n','마끼마끼.jpg',0,NULL,'전포동/부전동','1322121231','부산'),(145,118,'브라더집밥','부산 부산진구 동천로 109','1층','한식','051123456','03시 ~05시 ','','브라더집밥.JPG',0,NULL,'/부전동/전포동','100-10-10000','부산'),(146,115,'더시카고짬뽕','부산 부산진구 동천로 109','1층 더시카고짬뽕','중식','0511231234','08시~20시','더시카고짬뽕입니다.\r\n많이 사랑해주세요.\r\n현금 결제 사랑합니다.','더시카고짬뽕.jpg',0,NULL,'부전동/전포동','1234567890','부산'),(147,116,'경회루','부산 부산진구 동천로 109','1층','중식','05155512521','07시 ~19시 ','경회루 입니다.','경회루-메인.JPG',0,NULL,'부전동/전포동','	389-22-00069','부산'),(148,114,'미미닭','부산 부산진구 동천로 109','1층','한식','051456134','11시~19시','미미닭 핫핫','닭.png',0,NULL,'부전동/전포동','1234567890',''),(149,3,'압구정마녀떡볶이','부산 부산진구 동천로 109','1층','일식','0516239784','12시 ~23시 ','떡볶이의 인싸가 되겠습니다 ','압구정마녀떡볶이.jpg',0,NULL,'전포동/부전동','2342359784','부산'),(151,114,'미미햄버거','부산 부산진구 동천로 109','1층','일식','05112345678','01시~21시','야식만 해요 미미햄버거','버거.PNG',0,NULL,'부전동/전포동','1234550000','부산'),(152,3,'랍스터 매니아','부산 부산진구 동천로 109','1층','일식','0519861658','01시 ~23시 ','저희 게 매니아는 중간마진없이 가장 저렴한 가격으로 제공 합니다','랍스터매니아.jpg',0,NULL,'부전동/전포동','2342359784',''),(153,118,'족발삶는마을-본점','부산 부산진구 동천로 109','1층','한식','0511234567','13시 ~20시 ','','족살마1.JPG',0,NULL,'전포동/부전동','100-10-10000',''),(154,116,'신흥원훠궈','부산 부산진구 동천로 109','1층','중식','05164385654','19시 ~07시 ','신흥원 훠궈입니다.','신흥원훠궈 메인.JPG',0,NULL,'부전동/전포동','251-33-00789','부산'),(155,115,'갈매기짬뽕','부산 부산진구 동천로 109','1층 갈매기짬뽕','중식','0511234123','10시~23시','갈매기짬뽕입니다.','갈매기짬뽕.jpg',0,NULL,'전포동/부전동','1234567890','부산'),(156,3,'경성 25시미도참치','부산 부산진구 동천로 109','1층','일식','051745434','01시 ~23시 ','저희 게 매니아는 중간마진없이 가장 저렴한 가격으로 제공 합니다','경성25시미도참치.jpg',0,NULL,'부전동/전포동','234623523',''),(157,115,'엄청맛있는탕수육','부산 부산진구 동천로 109','1층 엄청맛있는탕수육','중식','0511231234','12시~22시','탕수육 엄청 맛있습니다.','엄청맛있는탕수육.jpg',0,NULL,'전포동/부전동','1234567890','부산'),(158,118,'삼한초밥','부산 부산진구 동천로 109','1층','일식','0511234567','10시 ~20시 ','','잉잉초밥.JPG',0,NULL,'부전동/전포동','100-10-10000','부산'),(159,5,'서버테스트','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(160,5,'서버테스트1','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(161,5,'서버테스트2','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(162,5,'서버테스트3','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(163,5,'서버테스트4','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(164,5,'서버테스트5','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(165,5,'서버테스트6','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(166,5,'서버테스트7','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(167,5,'서버테스트8','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(168,5,'서버테스트9','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(169,5,'서버테스트10','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(170,5,'서버테스트11','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(171,5,'서버테스트12','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(172,5,'서버테스트13','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(173,5,'서버테스트14','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산'),(174,5,'서버테스트15','부산 부산진구 부전로 109','','한식','0631235123','00시~00시','','공기밥11.jpg',0,NULL,'부전동/서면','2342342323','부산');
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

-- Dump completed on 2020-09-02 23:15:56
