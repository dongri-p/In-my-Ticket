-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: myticket
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB

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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` char(16) DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  `name` char(20) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `oldPwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (2,'superman','W@MM','superman123@daum.net','010-1234-2343',0,'슈퍼맨','2025-06-17','1234'),(3,'purinhi','1234','purin123@naver.com','010-1234-9584',0,'왕푸린','2025-06-22',NULL),(4,'batman','[iI%','batman123@korea.com','010-9384-5864',0,'배트맨','2025-06-22','oM$7');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance` (
  `perfId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL,
  `sDate` date NOT NULL,
  `eDate` date NOT NULL,
  `imageUrl` varchar(500) DEFAULT NULL,
  `rDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`perfId`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES (1,'Anthem 내한 공연','웨스트브릿지 라이브홀','2024-06-22','2024-06-22','http://www.kopis.or.kr/upload/pfmPoster/PF_PF257047_250110_150100.jpg','2025-06-27 05:17:38',NULL),(111,'한요한 First Love Concert','예스24 라이브홀 (구. 악스코리아)','2024-06-22','2024-06-22','http://www.kopis.or.kr/upload/pfmPoster/PF_PF257042_250110_143038.jpg','2025-07-09 05:42:52',NULL),(112,'BOF 부산원아시아페스티벌, BOF Big CONCERT','부산아시아드 경기장','2024-06-08','2024-06-08','http://www.kopis.or.kr/upload/pfmPoster/PF_PF256948_250109_183022.jpg','2025-07-09 05:42:52',NULL),(113,'ZUTOMAYO INTENSE IN SEOUL, KOREA','예스24 라이브홀 (구. 악스코리아)','2024-06-15','2024-06-16','http://www.kopis.or.kr/upload/pfmPoster/PF_PF256924_250109_173611.jpg','2025-07-09 05:42:52',NULL),(114,'박물관 속 밴드, 김뜻돌 & 크리스피 밴드 [부여]','국립부여박물관','2024-06-01','2024-06-01','http://www.kopis.or.kr/upload/pfmPoster/PF_PF256923_250109_173508.jpg','2025-07-09 05:42:52',NULL),(115,'국립심포니오케스트라 가족음악회: 시네마 클래식 [부여]','국립부여박물관','2024-06-29','2024-06-29','http://www.kopis.or.kr/upload/pfmPoster/PF_PF256922_250109_173218.jpg','2025-07-09 05:42:52',NULL),(116,'개똥이 [대학로]','극장 동국','2024-06-27','2024-06-30','http://www.kopis.or.kr/upload/pfmPoster/PF_PF256901_250109_163708.jpg','2025-07-09 05:42:52',NULL),(117,'쇄골에 천사가 잠들고 있다','대학로 자유극장 (자유문화발전소)','2024-05-17','2024-07-21','http://www.kopis.or.kr/upload/pfmPoster/PF_PF256890_250109_153609.jpg','2025-07-09 05:42:52',NULL),(118,'허회경 단독 콘서트: 그 무엇도 어떤 것도 None','이화여자대학교 삼성홀','2024-06-29','2024-06-29','http://www.kopis.or.kr/upload/pfmPoster/PF_PF253036_241106_145106.png','2025-07-09 05:42:52',NULL),(119,'짙은 여름 콘서트: 꿈꾸는 여름','이화여자대학교 삼성홀','2024-06-22','2024-06-23','http://www.kopis.or.kr/upload/pfmPoster/PF_PF253035_241106_144559.png','2025-07-09 05:42:52',NULL);
/*!40000 ALTER TABLE `performance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09 16:22:32
