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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `adId` varchar(20) NOT NULL,
  `adPwd` varchar(20) NOT NULL,
  `adName` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`adId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','1234','관리자','admin123@naver.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

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
  `mt20id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`perfId`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES (1,'제28회 중구여성합창단 정기연주회','울산중구문화의전당','2025-07-08','2025-07-08','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269019_250709_114318.jpg','2025-07-10 07:19:12','서양음악(클래식)','PF269019'),(2,'제12회 KMC빅밴드 정기연주회','고양아람누리','2025-07-10','2025-07-10','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269014_250709_113550.jpg','2025-07-10 07:19:12','서양음악(클래식)','PF269014'),(3,'봉오동의 영웅: 대한독립군총사령관, 장군 홍범도','고양아람누리','2025-07-09','2025-07-09','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268888_250707_142843.jpg','2025-07-10 07:19:12','서양음악(클래식)','PF268888'),(4,'제3회 코리아 비올라 소사이어티 정기연주회','성남아트센터','2025-07-08','2025-07-08','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268885_250707_141855.png','2025-07-10 07:19:12','서양음악(클래식)','PF268885'),(5,'제1회 보훈연극제, 포대령','후암스테이지','2025-07-09','2025-07-13','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268868_250707_134144.gif','2025-07-10 07:19:12','연극','PF268868'),(6,'루체 스트링 콰르텟 리사이틀 [인천]','엘림아트센터','2025-07-06','2025-07-06','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268853_250707_130158.gif','2025-07-10 07:19:12','서양음악(클래식)','PF268853'),(7,'베이스 이창훈 독창회','영산아트홀','2025-07-10','2025-07-10','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268808_250707_104727.gif','2025-07-10 07:19:12','서양음악(클래식)','PF268808'),(8,'제1회 박시현 피리독주회 : 경계에서','국립국악원','2025-07-10','2025-07-10','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268804_250707_104329.jpg','2025-07-10 07:19:12','한국음악(국악)','PF268804'),(9,'해운대 페스타, 워터붐즈업 & DJ 파티','해운대해수욕장','2025-07-05','2025-08-31','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268787_250707_100955.gif','2025-07-10 07:19:12','대중음악','PF268787'),(10,'정정희 피아노 독주회','금호아트홀 연세','2025-07-06','2025-07-06','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268763_250704_195355.gif','2025-07-10 07:19:12','서양음악(클래식)','PF268763'),(11,'박은영 피아노 독주회 [대구]','수성아트피아','2025-07-02','2025-07-02','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269175_250710_151945.png','2025-07-11 06:49:06','서양음악(클래식)','PF269175'),(12,'비원뮤직홀 레지던시 시리즈: 여름밤, 노래에 물들다 [대구]','비원뮤직홀','2025-07-11','2025-07-11','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269076_250709_142144.jpg','2025-07-11 06:49:06','서양음악(클래식)','PF269076'),(13,'불새 [대구]','꿈꾸는씨어터','2025-07-11','2025-07-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF268898_250707_153446.jpg','2025-07-11 06:49:06','연극','PF268898'),(14,'YELLOW TAXI 고품격 재즈 스페셜, 한국 재즈의 역사를 만들어 온 필윤 그룹! [대전]','옐로우택시','2025-07-12','2025-07-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269216_250711_112026.jpg','2025-07-14 05:46:24','대중음악','PF269216'),(15,'월간연주자 듀오시리즈, 한지원 & 강소연','갤러리 디 아르테 청담','2025-07-12','2025-07-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269194_250711_102403.gif','2025-07-14 05:46:24','서양음악(클래식)','PF269194'),(16,'부평문화사랑방 참여형 포럼연극, 마음 편의점 (13: 00)','부평문화사랑방','2025-07-14','2025-07-14','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269144_250710_104045.gif','2025-07-14 05:46:24','연극','PF269144'),(17,'부평문화사랑방 참여형 포럼연극, 마음 편의점 (09: 30)','부평문화사랑방','2025-07-14','2025-07-14','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269143_250710_103712.gif','2025-07-14 05:46:24','연극','PF269143'),(18,'제2회 봄내트리니티챔버콰이어 정기연주회: Always something sing','춘천문화예술회관','2025-07-12','2025-07-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269139_250710_102747.png','2025-07-14 05:46:24','서양음악(클래식)','PF269139'),(19,'점프 JUMP [대구]','대구서구문화회관','2025-07-12','2025-07-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269089_250709_145558.jpg','2025-07-14 05:46:24','뮤지컬','PF269089'),(20,'제7회 나눔소리합창단 정기연주회 X 송송합창단 창단 연주회: 나누면 사랑이 송송','꿈의숲아트센터','2025-07-12','2025-07-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269034_250709_125655.jpg','2025-07-14 05:46:24','서양음악(클래식)','PF269034'),(21,'제367회 창원시립교향악단 정기연주회: 거장과의 조우 Ⅱ [창원]','성산아트홀','2025-06-12','2025-06-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269385_250714_144642.jpg','2025-07-14 06:27:05','서양음악(클래식)','PF269385'),(22,'ONLY FOR YOU, 이지은 & 한예진 피아노 듀오 [대구]','에이치아츠 (H-Art)','2025-07-12','2025-07-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269295_250714_104148.gif','2025-07-14 06:27:05','서양음악(클래식)','PF269295'),(23,'나는 코다입니다 [성남]','성남아트센터','2025-07-19','2025-07-19','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269825_250718_132203.png','2025-07-20 07:07:35','연극','PF269825'),(24,'토요재즈살롱 LIVE IN 인천 송도, 정우연 트리오','카페와안','2025-07-19','2025-07-19','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269753_250718_094743.png','2025-07-20 07:07:35','대중음악','PF269753'),(25,'테너 김세일 리사이틀 [대구]','비원뮤직홀','2025-07-19','2025-07-19','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269747_250717_144753.jpg','2025-07-20 07:07:35','서양음악(클래식)','PF269747'),(26,'문을 열어주세요','보광극장','2025-07-19','2025-07-27','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269716_250717_125429.gif','2025-07-20 07:07:35','연극','PF269716'),(27,'제1회 현대 단편 연극제: 시선','성음아트센터','2025-07-19','2025-07-19','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269663_250717_101000.gif','2025-07-20 07:07:35','연극','PF269663'),(28,'국립남도국악원 토요상설, 국악이 좋다: 그라데이션-G','국립남도국악원','2025-07-19','2025-07-19','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269525_250716_111319.jpg','2025-07-20 07:07:35','한국음악(국악)','PF269525'),(29,'아버지 제르몽','꿈의숲아트센터','2025-07-19','2025-07-19','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269471_250715_131736.png','2025-07-20 07:07:35','서양음악(클래식)','PF269471'),(30,'플루스 앙상블 정기연주회 [대구]','수성아트피아','2025-07-16','2025-07-16','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269441_250715_111854.jpg','2025-07-20 07:07:35','서양음악(클래식)','PF269441'),(31,'쌀롱드무지끄, 도시의 초상','쌀롱드무지끄','2025-07-20','2025-07-20','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269428_250715_105446.jpg','2025-07-20 07:07:35','서양음악(클래식)','PF269428'),(32,'정의주 미스틱쿼텟: 뉴욕 갬성, 한국의 여름밤을 물들이다! [대전]','옐로우택시','2025-07-19','2025-07-19','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269421_250715_104328.jpg','2025-07-20 07:07:35','대중음악','PF269421'),(33,'제43회 대한민국연극제 인천, 고딩 무사','신포아트홀','2025-07-20','2025-07-20','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269889_250721_124733.jpg','2025-07-21 06:22:46','연극','PF269889'),(34,'연극열전10, 웨이스티드 콘서트','스케치홀 (구.소극장 선물 1관)','2025-07-21','2025-07-21','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269550_250716_130059.png','2025-07-21 06:22:46','뮤지컬','PF269550'),(35,'집들이 콘서트 #44. 혜화동, 거리에서','동덕여대공연예술센터','2025-07-21','2025-07-21','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269479_250715_133354.gif','2025-07-21 06:22:46','뮤지컬','PF269479'),(36,'대구동요음악협회 & 보아즈 오케스트라가 함께하는 Summer Dream Concert','수성아트피아','2025-07-20','2025-07-20','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270011_250721_170319.jpg','2025-07-22 08:22:35','서양음악(클래식)','PF270011'),(37,'위클리 클래식 페스티벌, 이야기가 있는 클래식 콘서트: 바람의 이야기','브라움홀','2025-07-22','2025-07-22','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269953_250721_150827.gif','2025-07-22 08:22:35','서양음악(클래식)','PF269953'),(38,'위클리 클래식 페스티벌, 듀오 슈벙: Love, Friends, Time [제주 서귀포]','끌로드아트홀','2025-07-22','2025-07-22','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269896_250721_130352.gif','2025-07-22 08:22:35','서양음악(클래식)','PF269896'),(39,'한국춤더함 & 제5회 렉처퍼포먼스: 한국춤 전통의 의미를 열다 [대구]','대구문화예술회관','2025-07-19','2025-07-19','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269649_250716_160940.jpg','2025-07-22 08:22:35','무용(서양/한국무용)','PF269649'),(40,'제79회 시티필하모니오케스트라 정기연주회: Summer Concerto Festa','영산아트홀','2025-07-23','2025-07-23','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270071_250722_112818.gif','2025-07-23 12:24:08','서양음악(클래식)','PF270071'),(41,'빛: 깔 [성남]','성남아트리움 (구. 성남시민회관)','2025-07-23','2025-07-24','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270017_250721_172349.png','2025-07-23 12:24:08','무용(서양/한국무용)','PF270017'),(42,'국제연합프로젝트 공연, TUKO! TUKO!','드림시어터 [대학로]','2025-07-23','2025-07-27','http://www.kopis.or.kr/upload/pfmPoster/PF_PF269785_250718_105933.gif','2025-07-23 12:24:08','연극','PF269785'),(43,'Dear.','디너씨어터','2025-07-12','2025-09-14','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270250_250724_125811.jpg','2025-07-24 07:23:32','뮤지컬','PF270250'),(44,'매직라이브펍 (MAGIC LIVE PUB)','매직라이브펍','2025-07-18','2025-12-28','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270234_250724_110834.jpg','2025-07-24 07:23:32','서커스/마술','PF270234'),(45,'피노키오 [대전]','조이마루아트홀','2025-07-24','2025-08-24','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270104_250723_155758.jpg','2025-07-24 07:23:32','뮤지컬','PF270104'),(46,'Special GIG, 위스퍼링 플라워 시즌','entry55 [성수]','2025-06-25','2025-08-31','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270331_250725_120824.png','2025-07-25 10:15:27','대중음악','PF270331'),(47,'Special GIG, 위스퍼링 플라워 시즌','entry55 [사당]','2025-06-25','2025-08-31','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270330_250725_120151.png','2025-07-25 10:15:27','대중음악','PF270330'),(48,'르벨 클라리넷퀄텟, 감성콘서트: 발라드 명곡 시리즈 Ⅰ [부산]','센텀아트홀','2025-07-24','2025-07-24','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270302_250725_100736.jpg','2025-07-25 10:15:27','서양음악(클래식)','PF270302'),(49,'스쿨클래식, 해설이 있는 발레: 볼레로 [천안]','천안예술의전당','2025-07-10','2025-07-11','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270295_250724_161829.jpg','2025-07-25 10:15:27','복합','PF270295'),(50,'문턱, 팔방미악이로구나 [광주]','보헤미안 소극장','2025-07-25','2025-07-25','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270204_250724_100201.png','2025-07-25 10:15:27','한국음악(국악)','PF270204'),(51,'비원뮤직홀 클래식 시리즈, 김도현 & 최송하 듀오 리사이틀','비원뮤직홀','2025-07-25','2025-07-25','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270137_250723_105520.jpg','2025-07-25 10:15:27','서양음악(클래식)','PF270137'),(52,'무용여행: 舞游韩国 [대구]','봉산문화회관','2025-07-25','2025-07-26','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270065_250722_111513.jpg','2025-07-25 10:15:27','무용(서양/한국무용)','PF270065'),(53,'매직프렌즈 마술쇼 시즌3: 어린 왕자 [전주]','드림팩토리','2025-07-26','2025-08-31','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270317_250725_110010.png','2025-07-26 03:57:15','서커스/마술','PF270317'),(54,'NOL FESTIVAL: SBS GAYODAEJEON Summer','킨텍스','2025-07-26','2025-07-27','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270273_250724_135827.gif','2025-07-26 03:57:15','대중음악','PF270273'),(55,'토요재즈살롱 LIVE IN 인천 송도, 용투더썬 밴드','카페와안','2025-07-26','2025-07-26','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270206_250724_101057.png','2025-07-26 03:57:15','대중음악','PF270206'),(56,'라푼젤 [서울 금천]','레미어린이극장 [금천]','2025-07-26','2025-08-23','http://www.kopis.or.kr/upload/pfmPoster/PF_PF270142_250723_110507.jpg','2025-07-26 03:57:15','뮤지컬','PF270142'),(57,'판소리로 듣는 단원 김홍도 [안산]','안산문화예술의전당','2025-09-03','2025-09-03','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273280_250903_152603.jpg','2025-09-03 09:57:56','한국음악(국악)','PF273280'),(58,'믹스커피 [대학로]','대학로 마로니에소극장(플레이더씨어터)','2025-08-29','2025-10-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273241_250903_130624.jpg','2025-09-03 09:57:56','연극','PF273241'),(59,'장군님을 사랑한 거북이','뜻밖의 극장(구. 해우소소극장)','2025-09-03','2025-09-07','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273180_250902_113922.jpg','2025-09-03 09:57:56','연극','PF273180'),(60,'아모르파티 (단체) [대전]','상상아트홀 [대전]','2025-09-01','2025-09-26','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273173_250902_111156.jpg','2025-09-03 09:57:56','연극','PF273173'),(61,'손예인 귀국 비올라 독주회','금호아트홀 연세','2025-09-03','2025-09-03','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273160_250902_105055.gif','2025-09-03 09:57:56','서양음악(클래식)','PF273160'),(62,'독립의 꽃, 옥파 이종일 [태안]','태안군문화예술회관','2025-09-01','2025-09-01','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273159_250902_104523.png','2025-09-03 09:57:56','뮤지컬','PF273159'),(63,'Ensemble ONE+1 X 씨날창작음악연구소, 무형의 건축: 소멸과 탄생의 소리 [대구]','아트스페이스 루모스','2025-09-01','2025-09-01','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273151_250902_103229.jpg','2025-09-03 09:57:56','한국음악(국악)','PF273151'),(64,'온: 리스닝, 말러교향곡 1번','온쉼표','2025-08-31','2025-08-31','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273113_250901_151050.png','2025-09-03 09:57:56','서양음악(클래식)','PF273113'),(65,'이디오마 델라 무지카 정기연주회: 핸델의 리코더 소나타 전곡 연주 [대구]','공간울림연주홀','2025-09-02','2025-09-02','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273086_250901_140854.png','2025-09-03 09:57:56','서양음악(클래식)','PF273086'),(66,'라라라온 [순천 아트홀 아고고]','소극장 아고고','2025-08-31','2025-08-31','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273080_250901_135420.jpg','2025-09-03 09:57:56','대중음악','PF273080'),(67,'현륭원의 약속 [과천]','과천시민회관','2025-09-06','2025-09-06','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273571_250908_144853.jpg','2025-09-08 11:40:39','무용(서양/한국무용)','PF273571'),(68,'엄마의 얼굴을 훔친 왕 [대전]','소극장 고도','2025-09-03','2025-09-21','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273569_250908_143755.jpg','2025-09-08 11:40:39','연극','PF273569'),(69,'월간연주자 트리오시리즈, Trio Pioneero (9월)','갤러리 디 아르테 청담','2025-09-06','2025-09-06','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273503_250908_103552.gif','2025-09-08 11:40:39','서양음악(클래식)','PF273503'),(70,'함께 지켜온 평화, 함께 만드는 미래: 대한적십자사 120년 & 광복 80년 기념 음악회','롯데콘서트홀','2025-07-10','2025-07-10','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273450_250905_124744.png','2025-09-08 11:40:39','서양음악(클래식)','PF273450'),(71,'현대무용과 미디어아트의 만남: 다이어리 [대구]','대구서구문화회관','2025-09-05','2025-09-05','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273394_250904_142753.png','2025-09-08 11:40:39','복합','PF273394'),(72,'제14회 구로구립청소년오케스트라 정기연주회','구로아트밸리','2025-09-06','2025-09-06','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273378_250904_132617.jpg','2025-09-08 11:40:39','서양음악(클래식)','PF273378'),(73,'관현맹인 x 세종대왕: 그리고 잇다','모두예술극장','2025-09-03','2025-09-03','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273333_250904_104058.png','2025-09-08 11:40:39','한국음악(국악)','PF273333'),(74,'성균소극장 수요상설무대, 장민하의 춤','성균소극장','2025-09-03','2025-09-24','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273325_250904_102751.gif','2025-09-08 11:40:39','무용(서양/한국무용)','PF273325'),(75,'미운 오리의 꿈 [서울 송파]','송파어린이문화회관','2025-09-02','2025-10-30','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273317_250904_101602.jpg','2025-09-08 11:40:39','연극','PF273317'),(76,'리플 콘서트: 멘토가 너에게 보내는 답장 1. 오페라 아리아와 함께 예술가로 성장기 [대전]','대전예술의전당','2025-09-10','2025-09-10','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273737_250910_111151.jpg','2025-09-10 11:36:38','서양음악(클래식)','PF273737'),(77,'제32회 덕원예술고등학교 정기연주회','롯데콘서트홀','2025-09-08','2025-09-08','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273697_250909_155532.jpg','2025-09-10 11:36:38','서양음악(클래식)','PF273697'),(78,'제8회 극장동국 연출가전: 신부님. 신부님? 신부님!','극장 동국','2025-09-10','2025-09-21','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273693_250909_153501.gif','2025-09-10 11:36:38','연극','PF273693'),(79,'아기돼지삼형제 [대전]','복합문화공간 플랜에이','2025-09-08','2025-09-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273660_250909_134045.gif','2025-09-10 11:36:38','서양음악(클래식)','PF273660'),(80,'SC Bright September Series: Common Harmony, 우리들의 음악','롯데콘서트홀','2025-09-08','2025-09-08','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273654_250909_131548.jpg','2025-09-10 11:36:38','서양음악(클래식)','PF273654'),(81,'YELLOW TAXI 고품격 재즈 스페셜, 모달밴드 [대전]','옐로우택시','2025-09-06','2025-09-06','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273576_250908_151433.jpg','2025-09-10 11:36:38','대중음악','PF273576'),(82,'제2회 경남합창그랜드페스티벌 [거제]','거제문화예술회관','2025-09-05','2025-09-05','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273560_250908_140818.jpg','2025-09-10 11:36:38','서양음악(클래식)','PF273560'),(83,'김태영의 고수풍류','국립국악원','2025-09-10','2025-09-10','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273530_250908_124305.jpg','2025-09-10 11:36:38','한국음악(국악)','PF273530'),(84,'YELLOW TAXI 고품격 재즈 스페셜, 프랑스의 낭만과 자유로운 집시의 꿈: 레브 드 집시 (Reve De Gypsy)','옐로우택시','2025-09-13','2025-09-13','http://www.kopis.or.kr/upload/pfmPoster/PF_PF274157_250915_164057.jpg','2025-09-16 11:58:10','대중음악','PF274157'),(85,'제32회 고양시남성합창단 정기연주회','고양아람누리','2025-09-14','2025-09-14','http://www.kopis.or.kr/upload/pfmPoster/PF_PF274145_250915_154850.png','2025-09-16 11:58:11','서양음악(클래식)','PF274145'),(86,'토요재즈살롱 LIVE IN 인천 송도, 류수완 QUARTET','카페와안','2025-09-13','2025-09-13','http://www.kopis.or.kr/upload/pfmPoster/PF_PF274142_250915_153914.png','2025-09-16 11:58:11','대중음악','PF274142'),(87,'오늘부터 맑음 [전주]','김영오 아트센터','2025-09-13','2025-10-25','http://www.kopis.or.kr/upload/pfmPoster/PF_PF274118_250915_150313.gif','2025-09-16 11:58:11','연극','PF274118'),(88,'TIMF아카데미 콘서트 Ⅰ [통영]','통영국제음악당','2025-09-12','2025-09-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF274098_250915_141836.jpg','2025-09-16 11:58:11','서양음악(클래식)','PF274098'),(89,'경기팝스앙상블과 함께하는 팝스콘서트 [김포]','김포아트빌리지','2025-09-13','2025-09-13','http://www.kopis.or.kr/upload/pfmPoster/PF_PF274066_250915_131935.jpg','2025-09-16 11:58:11','대중음악','PF274066'),(90,'명랑육전 [함안]','함안문화예술회관','2025-09-12','2025-09-12','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273979_250912_135711.jpg','2025-09-16 11:58:11','연극','PF273979'),(91,'소리로 읽는 책장 Ⅱ: 책 속에서 흐르는 선율 [대구]','수성아트피아','2025-09-11','2025-09-11','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273951_250912_124925.jpg','2025-09-16 11:58:11','서양음악(클래식)','PF273951'),(92,'매직프렌즈 마술쇼: 마술사의 일기장 [전주]','드림팩토리','2025-09-13','2025-10-28','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273947_250912_124132.png','2025-09-16 11:58:11','서커스/마술','PF273947'),(93,'청춘의 향연, 영아티스트 시리즈: 박한나, 김채미, 박재은','콘서트홀 나누','2025-09-14','2025-09-14','http://www.kopis.or.kr/upload/pfmPoster/PF_PF273925_250912_105913.png','2025-09-16 11:58:11','서양음악(클래식)','PF273925');
/*!40000 ALTER TABLE `performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_seat`
--

DROP TABLE IF EXISTS `performance_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_seat` (
  `seatId` int(11) NOT NULL AUTO_INCREMENT,
  `timeId` int(11) NOT NULL,
  `seatRow` char(1) NOT NULL,
  `seatCol` int(11) NOT NULL,
  `reserved` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`seatId`),
  KEY `timeId` (`timeId`),
  CONSTRAINT `performance_seat_ibfk_1` FOREIGN KEY (`timeId`) REFERENCES `performance_time` (`timeId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_seat`
--

LOCK TABLES `performance_seat` WRITE;
/*!40000 ALTER TABLE `performance_seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_time`
--

DROP TABLE IF EXISTS `performance_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_time` (
  `timeId` int(11) NOT NULL AUTO_INCREMENT,
  `perfId` int(11) NOT NULL,
  `rDate` date NOT NULL,
  `rTime` time NOT NULL,
  PRIMARY KEY (`timeId`),
  KEY `perfId` (`perfId`),
  CONSTRAINT `performance_time_ibfk_1` FOREIGN KEY (`perfId`) REFERENCES `performance` (`perfId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_time`
--

LOCK TABLES `performance_time` WRITE;
/*!40000 ALTER TABLE `performance_time` DISABLE KEYS */;
INSERT INTO `performance_time` VALUES (1,46,'2025-09-18','19:00:00');
/*!40000 ALTER TABLE `performance_time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-17 22:47:08
