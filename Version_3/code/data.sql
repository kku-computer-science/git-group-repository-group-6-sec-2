-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: new_schema
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `academicworks`
--

DROP TABLE IF EXISTS `academicworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academicworks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ac_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ac_sourcetitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ac_year` date DEFAULT NULL,
  `ac_refnumber` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ac_page` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academicworks`
--

LOCK TABLES `academicworks` WRITE;
/*!40000 ALTER TABLE `academicworks` DISABLE KEYS */;
INSERT INTO `academicworks` VALUES (14,'การศึกษาสภาพแวดล้อมเมืองด้วยข้อมูลภาพถ่ายดาวเทียม','book','ขอนแก่น: โรงพิมพ์คลังนานาวิทยา','2017-01-01',NULL,'159','2022-05-01 14:14:32','2022-05-01 14:14:32'),(15,'ภาษาโปรแกรม (Programming languages)','book','ขอนแก่น: คลังนานาธรรม','2017-01-02',NULL,NULL,'2022-05-01 14:16:51','2022-05-01 14:16:51'),(16,'Artificial Intelligence: Theory, Programs and Applications','book','-','2017-01-01',NULL,'266','2022-05-01 14:20:53','2022-05-01 14:20:53'),(17,'โครงข่ายประสาทเทียม Artificial Neural Networks','book','โรงพิมพ์คลังนานาวิทยา, ขอนแก่น','2018-01-01',NULL,NULL,'2022-05-01 14:23:39','2022-05-01 14:23:39'),(18,'เอกสารคำสอนรายวิชา การจัดการความรู้ Knowledge Management','book','-','2018-01-01',NULL,NULL,'2022-05-01 14:24:52','2022-05-01 14:24:52'),(19,'เอกสารประกอบการสอนวิชา สถาปัตยกรรมระบบคอมพิวเตอร์ (Computer Systems Architechture)','book',NULL,'2016-01-01',NULL,NULL,'2022-05-01 14:28:02','2022-05-01 16:22:34'),(20,'ความมั่นคงเครือข่ายคอมพิวเตอร์และการเจาะระบบ (Computer Network Security and Penetration Testing)','book','ศูนย์นวัตกรรมการเรียนการสอน มหาวิทยาลัยขอนแก่น','2020-01-01',NULL,NULL,'2022-05-01 14:31:03','2022-05-01 14:31:03'),(21,'เอกสารประกอบการสอนวิชาวิศวกรรมซอฟต์แวร์ Software Engineering','book',NULL,'2016-01-01',NULL,NULL,'2022-05-01 14:39:21','2022-05-01 14:39:34'),(22,'เอกสารประกอบการสอนวิชาความมั่นคงระบบเครือข่ายคอมพิวเตอร์ Computer Network Security','book',NULL,'2016-01-01',NULL,NULL,'2022-05-01 14:40:11','2022-05-01 14:40:31'),(23,'เอกสารประกอบการสอนรายวิชา 322254 Script Programming','book',NULL,'2016-01-01',NULL,NULL,'2022-05-01 15:00:22','2022-05-01 15:00:22'),(24,'เอกสารประกอบการสอนรายวิชา 322326 Computer Networks','book',NULL,'2016-01-01',NULL,NULL,'2022-05-01 15:00:41','2022-05-01 15:00:41'),(25,'เอกสารประกอบการสอนรายวิชา 322462 Internetworking','book',NULL,'2016-01-01',NULL,NULL,'2022-05-01 15:01:08','2022-05-01 15:01:08'),(26,'Introduction to Information and Communication Technology','book',NULL,'2010-01-01',NULL,NULL,'2022-05-01 15:09:43','2022-05-01 15:09:43'),(27,'Strategic Planning of Information Systems (Thai Edition)','book',NULL,'2011-01-01',NULL,NULL,'2022-05-01 15:10:09','2022-05-01 15:10:47'),(28,'Business Intelligence (Thai Edition)','book',NULL,'2016-01-01',NULL,NULL,'2022-05-01 15:10:35','2022-05-01 15:10:35'),(29,'เอกสารประกอบการสอนการเขียนโปรแกรมเบื้องต้น','book',NULL,'2009-01-01',NULL,NULL,'2022-05-01 15:15:19','2022-05-01 15:15:19'),(30,'ระบบจัดการฐานข้อมูล','book',NULL,'1993-01-01',NULL,NULL,'2022-05-01 15:16:06','2022-05-01 15:16:06'),(31,'เอกสารประกอบการสอนวิชา โปรแกรมประยุกต์กับระบบฐานข้อมูล (Database Application)','book',NULL,'2018-01-01',NULL,NULL,'2022-05-01 15:18:35','2022-05-01 15:18:35'),(32,'เอกสารประกอบการสอนวิชา 322 325 OPERATING SYSTEMS AND SYSTEM CALLS PROGRAMMING','book',NULL,'2014-01-01',NULL,NULL,'2022-05-01 15:32:23','2022-05-01 15:32:23'),(33,'เอกสารประกอบการสอนวิชา โครงสร้างข้อมูลและขั้นตอนวิธีสาขาวิชาวิทยาการคอมพิวเตอร์','book',NULL,'2020-01-01',NULL,'229','2022-05-01 15:45:56','2022-05-01 15:45:56'),(34,'เอกสารประกอบการสอน 342211 Algorithms and Data Structures','book',NULL,'2016-01-01',NULL,NULL,'2022-05-01 15:50:54','2022-05-01 15:50:54'),(35,'เอกสารประกอบการสอน 322113 วิทยาการคอมพิวเตอร์มูลฐาน เรื่องระบบปฏิบัติการ','book',NULL,'2015-01-01',NULL,NULL,'2022-05-01 15:51:15','2022-05-01 15:51:15'),(36,'การโต้ตอบระหว่างมนุษย์กับคอมพิวเตอร์. สำนักพิมพ์มหาวิทยาลัยขอนแก่น','book',NULL,'2017-01-01',NULL,'198','2022-05-01 16:19:32','2022-05-01 16:19:32'),(37,'เกมคณิตคิดเร็วสำหรับเด็ก','ลิขสิทธิ์',NULL,'2558-07-08','326096',NULL,'2022-05-04 13:44:55','2022-05-04 13:44:55'),(39,'ระบบคำนวณดัชนีสุขภาพ','ลิขสิทธิ์',NULL,'2562-03-05','376705',NULL,'2022-05-04 13:57:11','2022-05-04 13:57:11'),(40,'คู่มือโปรแกรมประมวลผลกึ่งอัตโนมัติสำหรับชุดอุปกรณ์เก็บข้อมูลพฤติกรรมด้านสุขภาพ','ลิขสิทธิ์',NULL,'2563-09-23','386361',NULL,'2022-05-04 14:03:58','2022-05-04 14:03:58'),(41,'โปรแกรมแนะนำหนังสืออิเล็กทรอนิกส์ด้านคอมพิวเตอร์','ลิขสิทธิ์',NULL,'2564-01-21','389600',NULL,'2022-05-04 14:06:48','2022-05-04 14:06:48'),(42,'โปรแกรมจำแนกลักษณะทางสัณฐานวิทยาของภาพเห็ดมีพิษและเห็ดไม่มีพิษ','ลิขสิทธิ์',NULL,'2564-01-21','389598',NULL,'2022-05-04 14:07:59','2022-05-04 14:07:59'),(43,'โปรแกรมสแกนแผ่นป้ายทะเบียนสำหรับการจัดการพื้นที่จอดรถ','ลิขสิทธิ์',NULL,'2564-01-21','389599',NULL,'2022-05-04 14:09:40','2022-05-04 14:09:40'),(44,'เกมสยองขวัญ : Stranger Mansion','ลิขสิทธิ์',NULL,'2563-10-27','387028',NULL,'2022-05-04 14:10:49','2022-05-04 14:10:49'),(45,'ระบบสอนการฟื้นคืนชีพด้วยหุ่นจำลอง','ลิขสิทธิ์',NULL,'2563-01-03','379905',NULL,'2022-05-04 14:12:41','2022-05-04 14:12:41'),(47,'เครื่องสีข้าวอัตโนมัติที่ควบคุมด้วยระบบทางไกลแบบไร้สาย','อนุสิทธิบัตร',NULL,'2562-06-11','15288',NULL,'2022-05-04 14:21:33','2022-05-04 14:21:33'),(49,'เครืองแยกมอด','อนุสิทธิบัตร',NULL,'2562-08-29','15506',NULL,'2022-05-04 14:53:05','2022-05-04 15:00:17'),(50,'แอปพลิเคชันจำกัด (วัดป่าธรรมอุทยาน)','ลิขสิทธิ์',NULL,'2562-02-06','373035',NULL,'2022-05-15 05:10:47','2022-05-15 05:10:47'),(51,'แอปพลิเคชัน AR นิทานก่อนนอนระบบปฏิบัติการแอนดรอยด์','ลิขสิทธิ์',NULL,'2562-08-21','377155',NULL,'2022-05-15 05:24:20','2022-05-15 05:24:20'),(52,'แอปพลิเคชันบริหารใบหน้าระบบปฏิบัติการแอนดรอยด์','ลิขสิทธิ์',NULL,'2562-08-21','377156',NULL,'2022-05-15 05:26:27','2022-05-15 05:26:27'),(53,'แอปพลิเคชันตามล่าส่องไดโนเสาร์โดยใช้เทคโนโลยีเสมือนจริง','ลิขสิทธิ์',NULL,'2562-06-17','375720',NULL,'2022-05-15 05:27:47','2022-05-15 05:27:47'),(54,'แอปพลิเคชันเกมผจญภัยสวนสัตว์','ลิขสิทธิ์',NULL,'2561-09-12','369009',NULL,'2022-05-15 05:42:45','2022-05-15 05:42:45'),(55,'ระบบจัดการเตียงหออภิบาลผู้ป่วยวิกฤติ ศัลยกรรมโรงพยาบาลศรีนครินทร์','ลิขสิทธิ์',NULL,'2562-07-24','376285',NULL,'2022-05-15 05:47:28','2022-05-15 05:47:28'),(56,'ระบบยืม-คืนห้องสมุด สาขาวิชาวิทยาการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น','ลิขสิทธิ์',NULL,'2563-04-07','381854',NULL,'2022-05-15 05:49:15','2022-05-15 05:49:15'),(57,'การแปลงข้อความภาษาไทยเป็นวีดีโอภาษามือไทย','ลิขสิทธิ์',NULL,'2562-08-07','376705',NULL,'2022-05-15 05:52:16','2022-05-15 05:52:16'),(58,'ระบบจัดเก็บโครงงานคอมพิวเตอร์ด้วยด็อกเกอร์','ลิขสิทธิ์',NULL,'2562-02-25','373754',NULL,'2022-05-15 05:55:26','2022-05-15 05:55:26'),(59,'แอปพลิเคชันอาสาฉุกเฉินชุมชน','ลิขสิทธิ์',NULL,'2561-08-14','368407',NULL,'2022-05-15 06:05:07','2022-05-15 06:05:07'),(60,'แอปพลิเคชันเกมคำศัพท์ไทยที่มักเขียนผิด','ลิขสิทธิ์',NULL,'2561-08-14','368406',NULL,'2022-05-15 06:07:12','2022-05-15 06:07:12'),(61,'อัลกอริทึมสำหรับจัดตารางการแข่งขันในงานกีฬาวิทยาศาสตร์สัมพันธ์แห่งประเทศไทย','ลิขสิทธิ์',NULL,'2561-08-14','368404',NULL,'2022-05-15 06:11:44','2022-05-15 06:11:44'),(62,'ระบบประมวลผลภาวะสุขภาพ','อนุสิทธิบัตร',NULL,'2561-07-17','-',NULL,'2022-05-15 06:19:46','2022-05-15 06:19:46'),(63,'แอปพลิเคชันเกมวิ่งไปเลยไอจุก','ลิขสิทธิ์',NULL,'2561-08-14','36839',NULL,'2022-05-15 06:21:22','2022-05-15 06:21:22'),(64,'แอปพลิเคชันเกมผจญภัยอัศวินคณิศาสตร์','ลิขสิทธิ์',NULL,'2561-08-14','368396',NULL,'2022-05-15 06:22:51','2022-05-15 06:22:51'),(65,'ระบบสอบย้อนกลับข้าวหอมมะลิอินทรีย์','ลิขสิทธิ์',NULL,'2561-02-22','363080',NULL,'2022-05-15 06:24:13','2022-05-15 06:24:13'),(66,'สื่ือการเรียนการสอนสำหรับเด็กที่มีความบกพร่องทางการได้ยินด้วยเทคโนโลยีเสมือนจริง','ลิขสิทธิ์',NULL,'2560-05-18','353990',NULL,'2022-05-15 06:25:33','2022-05-15 06:25:33'),(67,'การสังเคราะห์ภาษามือจากตัวอักษรภาษาไทย','ลิขสิทธิ์',NULL,'2560-07-26','356239',NULL,'2022-05-15 06:26:53','2022-05-15 06:26:53'),(68,'ผจญภัยแผ่นดินไหว','ลิขสิทธิ์',NULL,'2559-12-14','349039',NULL,'2022-05-15 06:29:26','2022-05-15 06:29:26'),(69,'โฮมฟอร์โฮมเรส : ระบบจัดการข้อมูลเพื่อคุ้มครองคนไร้ที่พึ่ง','ลิขสิทธิ์',NULL,'2559-12-14','349041',NULL,'2022-05-15 06:30:32','2022-05-15 06:30:32'),(70,'มิชชันซี:เกมปฏิบัติการพิทักษ์สวนสัตว์','ลิขสิทธิ์',NULL,'2559-12-02','349043',NULL,'2022-05-15 06:31:49','2022-05-15 06:31:49'),(71,'ชุมชนคนรักนก:แอปพลิเคชันเพื่อการศึกษาและอนุรักษ์นกผ่านโลกเสมือนจริง','ลิขสิทธิ์',NULL,'2559-12-02','349042',NULL,'2022-05-15 06:34:11','2022-05-15 06:34:11'),(72,'ภารกิจล่าสมบัติ (Scavenger Hunt)','ลิขสิทธิ์',NULL,'2559-12-02','349045',NULL,'2022-05-15 06:35:30','2022-05-15 06:35:30'),(73,'ผจญภัยในโลกนิทาน (Advance in the Fairytale World)','ลิขสิทธิ์',NULL,'2559-12-02','349046',NULL,'2022-05-15 06:37:09','2022-05-15 06:37:09'),(74,'เว็บแอปพลิเคชันเพื่อแนะนำการลงทะเบียนและตรวจสอบจบ','ลิขสิทธิ์',NULL,'2559-12-14','349040',NULL,'2022-05-15 06:38:25','2022-05-15 06:38:25'),(75,'โปรแกรมระบบสังเคราะห์เสียงพูดภาษาถิ่นอีสาน','ลิขสิทธิ์',NULL,'2558-05-18','323716',NULL,'2022-05-15 06:40:41','2022-05-15 06:40:41');
/*!40000 ALTER TABLE `academicworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_of_academicworks`
--

DROP TABLE IF EXISTS `author_of_academicworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_of_academicworks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_type` int DEFAULT NULL,
  `author_id` bigint unsigned NOT NULL,
  `academicwork_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_of_academicworks_author_id_foreign` (`author_id`),
  KEY `author_of_academicworks_academicwork_id_foreign` (`academicwork_id`),
  CONSTRAINT `author_of_academicworks_academicwork_id_foreign` FOREIGN KEY (`academicwork_id`) REFERENCES `academicworks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_of_academicworks_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_of_academicworks`
--

LOCK TABLES `author_of_academicworks` WRITE;
/*!40000 ALTER TABLE `author_of_academicworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_of_academicworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_of_papers`
--

DROP TABLE IF EXISTS `author_of_papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_of_papers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint unsigned NOT NULL,
  `paper_id` bigint unsigned NOT NULL,
  `author_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_of_papers_author_id_foreign` (`author_id`),
  KEY `author_of_papers_paper_id_foreign` (`paper_id`),
  CONSTRAINT `author_of_papers_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_of_papers_paper_id_foreign` FOREIGN KEY (`paper_id`) REFERENCES `papers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_of_papers`
--

LOCK TABLES `author_of_papers` WRITE;
/*!40000 ALTER TABLE `author_of_papers` DISABLE KEYS */;
INSERT INTO `author_of_papers` VALUES (4352,1564,2787,1),(4353,1619,2788,1),(4354,1620,2789,1),(4355,1564,2790,1),(4356,1621,2791,1),(4357,1619,2793,1),(4358,1622,2796,1),(4359,1623,2797,1),(4360,1624,2799,1),(4361,1625,2800,1),(4362,1625,2801,1),(4363,1626,2803,1),(4364,1627,2804,1),(4365,1628,2804,2),(4366,1629,2804,2),(4367,1619,2806,1),(4368,1626,2807,1),(4369,1630,2807,3),(4370,1631,2810,1),(4371,1631,2811,1),(4372,1609,2807,3),(4373,1632,2812,1),(4374,1633,2812,2),(4375,1634,2812,2),(4376,1635,2812,3),(4377,1619,2789,1);
/*!40000 ALTER TABLE `author_of_papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_fname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_lname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1666 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1562,'Raksmey','Phann','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1563,'Enny Dwi','Oktaviyani','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1564,'Teratam','Boonprapapan','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1565,'Nattawat','Khamphakdee','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1566,'Wachirakan','Sueabua','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1567,'Natthida','Vatanapakorn','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1568,'Sawetsit','Aim-Nang','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1569,'Pongsathorn','Wongpraomas','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1570,'Wanna','Sirisangtragul','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1571,'Thongpan','Pariwat','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1572,'Kittikan','Charoenrattana','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1573,'Worapat','Siriboonpipattana','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1574,'Sittichai','Somsap','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1575,'Dang Ngoc','Chuong','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1576,'Pranithan','Klangprapunt','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1577,'Paweena','Unlee','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1578,'Saowaluk','Thaiklang','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1579,'Pongsakorn','Saipech','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1580,'Kongvut','Sangkla','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1581,'Sasithron','Sangjamraschaikun','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1582,'Tung','Nguyen Ba Son','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1583,'Nongnud','Phaiboon','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1584,'Piyarat','Ponyared','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1585,'Jiradej','Ponsawat','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1586,'Sissades','Tongsima','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1587,'Chutipong','Akkasaeng','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1588,'Nathpapat','Tantisuwichwong','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1589,'Nicharat','Kuljaroenwirat','2025-02-25 09:40:06','2025-02-25 09:40:06'),(1590,'Kikhamsen','Singvongsa','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1591,'Arounyadeth','Srithirath','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1592,'Kasidit','Wijitsopon','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1593,'Chavalit','Panichayanubal','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1594,'Phoemporn','Lakkhanawannakun','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1595,'Orapan','Apirakkan','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1596,'Phoemporn','Lakkhawannakun','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1597,'Sukrita','Mahahing','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1598,'Chinnakorn','Netphakdee','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1599,'Tomio','Takara','2025-02-25 09:40:07','2025-02-25 09:40:07'),(1600,'','Tung Nguyen Ba Son','2025-02-25 09:40:09','2025-02-25 09:40:09'),(1601,'','Dang Ngoc Chuong','2025-02-25 09:40:09','2025-02-25 09:40:09'),(1602,'ณัฐธิดา','บุตรพรม','2025-02-25 09:40:11','2025-02-25 09:40:11'),(1603,'พุธษดี','ศิริแสงตระกูล','2025-02-25 09:40:11','2025-02-25 09:40:11'),(1604,'พยอม','เหล่าชุมพล','2025-02-25 09:40:11','2025-02-25 09:40:11'),(1605,'นิกร','ยาพรม','2025-02-25 09:40:11','2025-02-25 09:40:11'),(1606,'ฐาปนี','เฮงสนั่นกูล','2025-02-25 09:40:11','2025-02-25 09:40:11'),(1607,'บวรรัตน์','ศรีมาน','2025-02-25 09:40:11','2025-02-25 09:40:11'),(1608,'T','Wongkhamdi','2025-02-25 09:40:13','2025-02-25 09:40:13'),(1609,'...','','2025-02-25 09:40:13','2025-02-25 09:40:13'),(1610,'O','Bugate','2025-02-25 09:40:13','2025-02-25 09:40:13'),(1611,'N','Yaprom','2025-02-25 09:40:13','2025-02-25 09:40:13'),(1612,'A','Kunlerd','2025-02-25 09:40:14','2025-02-25 09:40:14'),(1613,'DN','Huy','2025-02-25 09:40:14','2025-02-25 09:40:14'),(1614,'TNB','Son','2025-02-25 09:40:14','2025-02-25 09:40:14'),(1615,'T','Tomio','2025-02-25 09:40:14','2025-02-25 09:40:14'),(1616,'S','Sangsawad','2025-02-25 09:40:14','2025-02-25 09:40:14'),(1617,'CC','Fung','2025-02-25 09:40:14','2025-02-25 09:40:14'),(1618,'T','Khamket','2025-02-25 09:40:14','2025-02-25 09:40:14'),(1619,'Suthasinee','Iamsa-At','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1620,'Suthasinee','Iamsa-A','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1621,'Panuwat','Keawbor','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1622,'Janebhop','Sawaengchob','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1623,'Songpon','Sastrawaha','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1624,'Khanittha','Phurattanaprapin','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1625,'Sarunyoo','Boriratrit','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1626,'Sarutte','Atsawaraungsuk','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1627,'Sumanta','Subhadhira','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1628,'Usarat','Juithonglang','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1629,'Paweena','Sakulkoo','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1630,'Pakarat','Musigawan','2025-02-25 15:42:56','2025-02-25 15:42:56'),(1631,'ปัญญาพล','หอระตะ','2025-02-25 15:43:00','2025-02-25 15:43:00'),(1632,'S','Iamsa-ata','2025-02-25 15:43:01','2025-02-25 15:43:01'),(1633,'P','Horataa','2025-02-25 15:43:01','2025-02-25 15:43:01'),(1634,'K','Sunata','2025-02-25 15:43:01','2025-02-25 15:43:01'),(1635,'N','Thipayanga','2025-02-25 15:43:01','2025-02-25 15:43:01');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degrees`
--

DROP TABLE IF EXISTS `degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degrees` (
  `id` bigint unsigned NOT NULL,
  `degree_name_th` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree_name_en` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_th` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
INSERT INTO `degrees` VALUES (1,'หลักสูตรวิทยาศาสตรบัณฑิต (วท.บ.)','Bachelor of Science','วท.บ.','B.Sc',NULL,NULL),(2,'หลักสูตรวิทยาศาสตรมหาบัณฑิต (วท.ม.) ','Master of Science','วท.ม.','M.Sc.',NULL,NULL),(3,'หลักสูตรปรัชญาดุษฎีบัณฑิต (ปร.ด.)','Doctor of Philosophy','ปร.ด.','Ph.D.',NULL,NULL);
/*!40000 ALTER TABLE `degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_name_th` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'สาขาวิชาวิทยาการคอมพิวเตอร์','Department of Computer Science','2022-02-26 06:33:17','2022-02-26 06:33:17');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qua_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `year` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `education_user_id_foreign` (`user_id`),
  CONSTRAINT `education_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'มหาวิทยาลัยเกษตรศาสตร์','วท.บ. (สถิติ)',1,2,'2531',NULL,NULL),(2,'สถาบันบัณฑิตพัฒนบริหารศาสตร์','พบ.ม (สถิติประยุกต์)',2,2,'2533',NULL,NULL),(3,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ด. (วิทยาการคอมพิวเตอร์)',3,2,'2546',NULL,NULL),(5,'มหาวิทยาลัยขอนแก่น','วท.บ. (คณิตศาสตร์)',1,6,'2528','2022-04-02 19:48:41','2022-05-01 14:16:03'),(6,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ม. (วิทยาศาสตร์คอมพิวเตอร์)',2,6,'2535','2022-04-02 19:48:41','2022-05-01 14:16:03'),(7,'มหาวิทยาลัยขอนแก่น','ปร.ด. (วิทยาการคอมพิวเตอร์)',3,6,'2555','2022-04-02 19:48:41','2022-05-01 14:16:03'),(8,'มหาวิทยาลัยขอนแก่น','วท.บ. (ฟิสิกส์)',1,16,'2529','2022-04-20 13:56:27','2022-04-20 13:56:27'),(9,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ม. (วิทยาการคอมพิวเตอร์)',2,16,'2535','2022-04-20 13:56:27','2022-04-20 13:56:27'),(10,'University of the Ryukyus, Japan','Ph.D. (Interdisciplinary Intelligent Systems Engineering)',3,16,'2548','2022-04-20 13:56:27','2022-04-20 13:56:27'),(11,'มหาวิทยาลัยขอนแก่น','วท.บ. (สถิติ)',1,4,'2526','2022-05-01 14:04:14','2022-05-01 14:04:14'),(12,'สถาบันบัณฑิตพัฒนบริหารศาสตร์','พบ.ม. (สถิติประยุกต์)',2,4,'2533','2022-05-01 14:04:14','2022-05-01 14:04:14'),(13,'Asian Institute of Technology,  Thailand','D.Tech.Sc. (Computer Science)',3,4,'2545','2022-05-01 14:04:14','2022-05-01 14:04:14'),(14,'จุฬาลงกรณ์มหาวิทยาลัย','สถ.บ. (สถาปัตยกรรม)',1,5,'2542','2022-05-01 14:05:56','2022-05-01 14:05:56'),(15,'มหาวิทยาลัยขอนแก่น','วท.ม.  (การรับรู้จากระยะไกลและระบบสารสนเ ทศภูมิศาสตร์)',2,5,'2549','2022-05-01 14:05:56','2022-05-01 14:05:56'),(16,'จุฬาลงกรณ์มหาวิทยาลัย','วศ.ด. (วิศวกรรมสำรวจ)',3,5,'2554','2022-05-01 14:05:56','2022-05-01 14:05:56'),(17,'มหาวิทยาลัยขอนแก่น','วท.บ. (คณิตศาสตร์)',1,7,'2526','2022-05-01 14:19:07','2022-05-01 14:19:07'),(18,'สถาบันบัณฑิตพัฒนบริหารศาสตร์','พบ.ม. (สถิติประยุกต์)',2,7,'2528','2022-05-01 14:19:07','2022-05-01 14:19:07'),(19,'Asian Institute of Technology,  Thailand','D.Tech.Sc. (Computer Science)',3,7,'2544','2022-05-01 14:19:07','2022-05-01 14:19:07'),(20,'มหาวิทยาลัยขอนแก่น','วท.บ. (สถิติ)',1,8,'2527','2022-05-01 14:22:54','2022-05-01 14:22:54'),(21,'สถาบันบัณฑิตพัฒนบริหารศาสตร์','พบ.ม. สถิติประยุกต์ (สาขาวิทยาการคอมพิวเตอร์)',2,8,'2536','2022-05-01 14:22:54','2022-05-01 14:22:54'),(22,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ด. (วิทยาการคอมพิวเตอร์)',3,8,'2549','2022-05-01 14:22:54','2022-05-01 14:22:54'),(23,'จุฬาลงกรณ์มหาวิทยาลัย','วท.บ. (เคมีเทคนิค/เคมีวิศวกรรม)',1,9,'2533','2022-05-01 14:27:19','2022-05-01 14:27:19'),(24,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ม. (วิทยาศาสตร์คอมพิวเตอร์)',2,9,'2542','2022-05-01 14:27:19','2022-05-01 14:27:19'),(25,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ด. (วิทยาการคอมพิวเตอร์)',3,9,'2547','2022-05-01 14:27:19','2022-05-01 14:27:19'),(26,'สถาบันเทคโนโลยีพระจอมเกล้า เจ้าคุณทหารลาดกระบัง','วศ.บ. (วิศวกรรมคอมพิวเตอร์)',1,10,'2547','2022-05-01 14:30:14','2022-05-01 14:30:14'),(27,'University of Regina, Canada','MA.Sc. (Electronic Systems  Engineering)',2,10,'2549','2022-05-01 14:30:14','2022-05-01 14:30:14'),(28,'University of Regina, Canada','Ph.D. (Electronic Systems Engineering)',3,10,'2556','2022-05-01 14:30:14','2022-05-01 14:30:14'),(29,'มหาวิทยาลัยนเรศวร','วท.บ. (ภูมิศาสตร์)',1,11,'2545','2022-05-01 14:55:01','2022-05-01 14:55:01'),(30,'มหาวิทยาลัยขอนแก่น','วท.ม.  (การรับรู้จากระยะไกลและระบบสารสนเ ทศภูมิศาสตร์)',2,11,'2551','2022-05-01 14:55:01','2022-05-01 14:55:01'),(31,'จุฬาลงกรณ์มหาวิทยาลัย','วศ.ด. (วิศวกรรมสำรวจ)',3,11,'2559','2022-05-01 14:55:01','2022-05-01 14:55:01'),(32,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาการคอมพิวเตอร์)',1,13,'2537','2022-05-01 14:59:25','2022-05-01 14:59:25'),(33,'University of Southern California, USA','M.Sc. (Computer Science)',2,13,'2541','2022-05-01 14:59:25','2022-05-01 14:59:25'),(34,'-','-',3,13,'-','2022-05-01 14:59:25','2022-05-01 14:59:25'),(35,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาการคอมพิวเตอร์)',1,14,'2544','2022-05-01 15:08:14','2022-05-01 15:08:14'),(36,'สถาบันบัณฑิตพัฒนบริหารศาสตร์','วท.ม.  (สถิติประยุกต์และเทคโนโลยีสารสนเทศ)',2,14,'2548','2022-05-01 15:08:14','2022-05-01 15:08:14'),(37,'Auckland University of Technology, New Zealand','Ph.D. (Business Information  Systems)',3,14,'2558','2022-05-01 15:08:14','2022-05-01 15:08:14'),(38,'มหาวิทยาลัยเทคโนโลยี พระจอมเกล้าพระนครเหนือ','อส.บ. (เทคโนโลยีไฟฟ้าอุตสาหกรรม)',1,15,'2537','2022-05-01 15:13:00','2022-05-01 15:13:00'),(39,'Iowa State University, Iowa,  USA','M.Sc. (Agricultural Engineering)',2,15,'2541','2022-05-01 15:13:00','2022-05-01 15:13:00'),(40,'Iowa State University, Iowa,  USA','Ph.D. (Agricultural Engineering)',3,15,'2550','2022-05-01 15:13:00','2022-05-01 15:13:00'),(41,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาการคอมพิวเตอร์)',1,17,'2546','2022-05-01 15:18:05','2022-05-01 15:18:05'),(42,'มหาวิทยาลัยขอนแก่น','วท.ม. (วิทยาการคอมพิวเตอร์)',2,17,'2549','2022-05-01 15:18:06','2022-05-01 15:18:06'),(43,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ด. (วิทยาการคอมพิวเตอร์)',3,17,'2555','2022-05-01 15:18:06','2022-05-01 15:18:06'),(44,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาการคอมพิวเตอร์)',1,18,'2544','2022-05-01 15:29:03','2022-05-01 15:29:03'),(45,'มหาวิทยาลัยขอนแก่น','วศ.ม. (วิศวกรรมคอมพิวเตอร์)',2,18,'2547','2022-05-01 15:29:03','2022-05-01 15:29:03'),(46,'จุฬาลงกรณ์มหาวิทยาลัย','วศ.ด. (วิศวกรรมคอมพิวเตอร์)',3,18,'2553','2022-05-01 15:29:03','2022-05-01 15:29:03'),(47,'มหาวิทยาลัยขอนแก่น','วท.บ. (ฟิสิกส์)',1,19,'2529','2022-05-01 15:31:14','2022-05-01 15:31:14'),(48,'สถาบันบัณฑิตพัฒนาบริหารศาสตร์','วท.ม. (สถิติประยุกต์)',2,19,'2536','2022-05-01 15:31:14','2022-05-01 15:31:14'),(49,'-','-',3,19,'-','2022-05-01 15:31:14','2022-05-01 15:31:14'),(50,'มหาวิทยาลัยมหาสารคาม','วท.บ. (วิทยาการคอมพิวเตอร์)',1,20,'2543','2022-05-01 15:37:35','2022-05-01 15:37:35'),(51,'สถาบันเทคโนโลยีพระจอมเกล้า เจ้าคุณทหารลาดกระบัง','วศ.ม. (วิศวกรรมคอมพิวเตอร์)',2,20,'2548','2022-05-01 15:37:35','2022-05-01 15:37:35'),(52,'สถาบันเทคโนโลยีพระจอมเกล้า เจ้าคุณทหารลาดกระบัง','วศ.ด. (วิศวกรรมไฟฟ้า)',3,20,'2554','2022-05-01 15:37:35','2022-05-01 15:37:35'),(53,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาการคอมพิวเตอร์)',1,22,'2537','2022-05-01 15:45:20','2022-05-01 15:45:20'),(54,'Asian Institute of Technology,  Thailand','M.Sc. (Computer Science)',2,22,'2539','2022-05-01 15:45:20','2022-05-01 15:45:20'),(55,'มหาวิทยาลัยอัสสัมชัญ','ปร.ด. (วิธีการเรียนรู้ทางอิเล็กทรอนิกส์)',3,22,'2559','2022-05-01 15:45:20','2022-05-01 15:45:20'),(56,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาศาสตร์สิ่งแวดล้อม)',1,23,'2542','2022-05-01 15:47:29','2022-05-01 15:47:29'),(57,'มหาวิทยาลัยขอนแก่น','วท.ม.  (การรับรู้จากระยะไกลและระบบสารสนเ ทศภูมิศาสตร์)',2,23,'2546','2022-05-01 15:47:29','2022-05-01 15:47:29'),(58,'มหาวิทยาลัยขอนแก่น','ปร.ด.  (การรับรู้จากระยะไกลและระบบสารสนเ ทศภูมิศาสตร์)',3,23,'2562','2022-05-01 15:47:29','2022-05-01 15:47:29'),(59,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาการคอมพิวเตอร์)',1,25,'2540','2022-05-01 15:49:47','2022-05-01 15:49:47'),(60,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ม. (วิทยาศาสตร์คอมพิวเตอร์)',2,25,'2543','2022-05-01 15:49:47','2022-05-01 15:49:47'),(61,'มหาวิทยาลัยขอนแก่น','ปร.ด. (วิทยาการคอมพิวเตอร์)',3,25,'2558','2022-05-01 15:49:47','2022-05-01 15:49:47'),(62,'มหาวิทยาลัยธรรมศาสตร์','วท.บ. (ศาสตร์คอมพิวเตอร์)',1,26,'2554','2022-05-01 15:52:47','2022-05-01 15:52:47'),(63,'มหาวิทยาลัยธรรมศาสตร์','M.Eng. (Information and Communication Technology for Embedded Systems)',2,26,'2556','2022-05-01 15:52:47','2022-05-01 15:52:47'),(64,'Hiroshima University, Japan','Ph.D. (Information Engineering)',3,26,'2561','2022-05-01 15:52:47','2022-05-01 15:52:47'),(65,'มหาวิทยาลัยขอนแก่น','วท.บ. (สถิติ)',1,27,'2526','2022-05-01 15:54:51','2022-05-01 15:54:51'),(66,'สถาบันบัณฑิตพัฒนบริหารศาสตร์','พบ.ม. (สถิติประยุกต์)',2,27,'2534','2022-05-01 15:54:51','2022-05-01 15:54:51'),(67,'มหาวิทยาลัยขอนแก่น','ปร.ด. (สารสนเทศศึกษา)',3,27,'2559','2022-05-01 15:54:51','2022-05-01 15:54:51'),(68,'สถาบันเทคโนโลยีพระจอมเกล้า เจ้าคุณทหารลาดกระบัง','วศ.บ. (วิศวกรรมคอมพิวเตอร์)',1,28,'2544','2022-05-01 15:56:29','2022-05-01 15:56:29'),(69,'จุฬาลงกรณ์มหาวิทยาลัย','วท.ม. (วิทยาการคอมพิวเตอร์)',2,28,'2547','2022-05-01 15:56:29','2022-05-01 15:56:29'),(70,'Asian Institute of Technology, Thailand','Ph.D. (Remote Sensing and Geographic Information Systems)',3,28,'2562','2022-05-01 15:56:29','2022-05-01 15:56:29'),(71,'University of Minnesota (Twin  Cities), USA','B.S. (Computer Science)',1,30,'2546','2022-05-01 15:59:14','2022-05-01 15:59:14'),(72,'University of Minnesota (Twin Cities), USA','MGIS (Geographic Information  Science)',2,30,'2549','2022-05-01 15:59:15','2022-05-01 15:59:15'),(73,'-','-',3,30,'-','2022-05-01 15:59:15','2022-05-01 15:59:15'),(74,'สถาบันเทคโนโลยีพระจอมเกล้า เจ้าคุณทหารลาดกระบัง','วศ.บ. (วิศวกรรมคอมพิวเตอร์)',1,29,'2548','2022-05-01 16:00:16','2022-05-01 16:00:16'),(75,'University of Southern California (USC), USA','M.Sc. (Computer Science)',2,29,'2552','2022-05-01 16:00:16','2022-05-01 16:00:16'),(76,'-','-',3,29,'-','2022-05-01 16:00:16','2022-05-01 16:00:16'),(77,'มหาวิทยาลัยเชียงใหม่','วท.บ. (ธรณีวิทยา)',1,31,'2523','2022-05-01 16:01:43','2022-05-01 16:01:43'),(78,'International Institute for Aerospace Survey and Earth Sciences (ITC)','M.Sc. (Rural and Land Ecology  Survey)',2,31,'2535','2022-05-01 16:01:43','2022-05-01 16:01:43'),(79,'มหาวิทยาลัยขอนแก่น','วท.ด. (ปฐพีศาสตร์)',3,31,'2550','2022-05-01 16:01:43','2022-05-01 16:01:43'),(80,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาการคอมพิวเตอร์)',1,21,'2546','2022-05-01 16:14:32','2022-05-01 16:14:32'),(81,'มหาวิทยาลัยขอนแก่น','วศ.ม (วิศวกรรมคอมพิวเตอร์)',2,21,'2548','2022-05-01 16:14:32','2022-05-01 16:14:32'),(82,'สถาบันเทคโนโลยีพระจอมเกล้า เจ้าคุณทหารลาดกระบัง','วศ.ด. (วิศวกรรมไฟฟ้า)',3,21,'2553','2022-05-01 16:14:32','2022-05-01 16:14:32'),(83,'มหาวิทยาลัยขอนแก่น','วท.บ. (วิทยาการคอมพิวเตอร์)',1,34,'2540','2022-05-01 16:17:37','2022-05-01 16:17:37'),(84,'สถาบันบัณฑิตพัฒนบริหารศาสตร์','วท.ม. (วิทยาการคอมพิวเตอร์)',2,34,'2543','2022-05-01 16:17:37','2022-05-01 16:17:37'),(85,'Claremont Graduate University, USA','Ph.D. (Information Systems and  Technology)',3,34,'2554','2022-05-01 16:17:37','2022-05-01 16:17:37');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expertises`
--

DROP TABLE IF EXISTS `expertises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expertises` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `expert_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expertises_user_id_foreign` (`user_id`),
  CONSTRAINT `expertises_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expertises`
--

LOCK TABLES `expertises` WRITE;
/*!40000 ALTER TABLE `expertises` DISABLE KEYS */;
INSERT INTO `expertises` VALUES (2,'Big Data Analytics',7,'2022-02-26 04:52:59','2022-02-26 04:52:59'),(3,'Computer Vision',7,'2022-02-26 04:53:07','2022-02-26 04:53:07'),(4,'Cellular Automata',7,'2022-02-26 04:53:15','2022-02-26 04:53:15'),(100,'Natural Language and Speech Processing',16,NULL,NULL),(101,'Machine Learning and Intelligent Systems',16,NULL,NULL),(102,'Database and Information Integration Systems',16,NULL,NULL),(103,'Data science and Artificial Intelligence',16,NULL,NULL),(104,'Computational Intelligence',8,NULL,NULL),(105,'Machine Learning and Intelligent Systems',8,NULL,NULL),(106,'Nature-Inspired Optimization Algorithm',8,NULL,NULL),(107,'Data science and Artificial Intelligence',8,NULL,NULL),(108,'Artificial Neural Network',8,NULL,NULL),(109,'Machine Learning and Intelligent Systems',6,NULL,NULL),(110,'Soft computing',6,NULL,NULL),(111,'Object-Oriented Programming Languages',6,NULL,NULL),(112,'Software Engineering',6,NULL,NULL),(113,'Computational Intelligence',9,NULL,NULL),(114,'Machine Learning and Intelligent Systems',9,NULL,NULL),(115,'Nature-Inspired Optimization Algorithm',9,NULL,NULL),(116,'Data science and Artificial Intelligence',9,NULL,NULL),(117,'Ubiquitous Learning, Blended Learning',22,NULL,NULL),(118,'Bioinformatics',22,NULL,NULL),(119,'User Experience Design',22,NULL,NULL),(120,'Mobile Computing',21,NULL,NULL),(121,'Cloud computing',21,NULL,NULL),(122,'Internet of Things and Smart Technology',21,NULL,NULL),(123,'Wireless Sensor Networks',21,NULL,NULL),(124,'Wireless and Cellular Networks',21,NULL,NULL),(125,'Computer and Network Security',21,NULL,NULL),(126,'Network, Protocol, Optimization, and Intelligent Systems',21,NULL,NULL),(127,'Routing Protocols and Internetworking',13,NULL,NULL),(128,'Mobile Ad Hoc Networks',13,NULL,NULL),(129,'Internet of Things and Smart Technologies',13,NULL,NULL),(130,'Evolutionary Algorithms',13,NULL,NULL),(131,'Software Engineering',10,NULL,NULL),(132,'Software Process ',10,NULL,NULL),(133,'Code Smells and Software Quality',10,NULL,NULL),(134,'Secure Software Engineering',10,NULL,NULL),(135,'Computer Network Security',10,NULL,NULL),(136,'Mobile Agent and Multi-Agent Systems',10,NULL,NULL),(137,'Information Extraction and Integration',25,NULL,NULL),(138,'Internet and Web Information Systems',25,NULL,NULL),(139,'Object Oriented Programming',25,NULL,NULL),(140,'Temporal Causality Analysis',29,NULL,NULL),(141,'Information Theory',29,NULL,NULL),(142,'Social Network Analysis',29,NULL,NULL),(143,'Machine Learning',29,NULL,NULL),(144,'Artificial Intelligence',29,NULL,NULL),(145,'Complex Adaptive System',29,NULL,NULL),(146,'Computer Vision',33,NULL,NULL),(147,'Deep Learning',33,NULL,NULL),(148,'Machine learning',33,NULL,NULL),(149,'Artificial Intelligence',33,NULL,NULL),(150,'Data science',33,NULL,NULL),(151,'Big Data Analytics',33,NULL,NULL),(152,'Semantic Web and Ontology Engineering',2,NULL,NULL),(153,'Ontology-based Data Integration',2,NULL,NULL),(154,'Semantic Sentiment Analysis',2,NULL,NULL),(155,'Mobile Computing',3,NULL,NULL),(156,'Internet of Things',3,NULL,NULL),(157,'Wireless Sensor Networks and Ad Hoc Networks',3,NULL,NULL),(158,'Computer Networks and Internet',3,NULL,NULL),(159,'Wireless and Cellular Networks',3,NULL,NULL),(160,'Parallel/Distributed Systems and Cloud Computing',3,NULL,NULL),(161,'Computer, System, Management, Modelling, and Security',3,NULL,NULL),(162,'Intelligent Systems',3,NULL,NULL),(163,'Smart X: Smart Farm, Home, Health-care, Car, Building, Device, etc.',3,NULL,NULL),(164,'Semantic Web',4,NULL,NULL),(165,'Information Integration',4,NULL,NULL),(166,'Logistics and Supply Chain',4,NULL,NULL),(167,'Data Mining',18,NULL,NULL),(168,'Machine Learning',18,NULL,NULL),(169,'Ensemble Learning Model',18,NULL,NULL),(170,'Applied Software Testing in Optimization Algorithms',18,NULL,NULL),(171,'Metaheuristic algorithms',18,NULL,NULL),(172,'Business Intelligence and Analytics ',14,NULL,NULL),(173,'Enterprise Systems, ERP systems',14,NULL,NULL),(174,'IT Strategy, IT Strategic Planning, IT Management',14,NULL,NULL),(175,'Enterprise Process Modeling',14,NULL,NULL),(176,'Data mining',14,NULL,NULL),(177,'Image Processing',17,NULL,NULL),(178,'Search Protocol',17,NULL,NULL),(179,'Ontology ',27,NULL,NULL),(180,'Database',27,NULL,NULL),(181,'Wireless Mobile Communications (OFDM Systems)  ',20,NULL,NULL),(182,'Wireless Sensor Networks',20,NULL,NULL),(183,'Digital Signal Processing (Image, Speech, Sound, Ultrasound)',20,NULL,NULL),(184,'3D Stereoscopic',20,NULL,NULL),(185,'Bioinformatics',20,NULL,NULL),(186,'Embedded and Intelligent Systems (iHOME, iFARM)',20,NULL,NULL),(187,'Intrusion Detection and Prevention Systems',20,NULL,NULL),(188,'Speech Analysis and Synthesis',20,NULL,NULL),(189,'Robotics',20,NULL,NULL),(190,'Cloud Computing',24,NULL,NULL),(191,'Wireless Network',24,NULL,NULL),(192,'Network Simulation',24,NULL,NULL),(193,'System Engineer',24,NULL,NULL),(194,'Text Mining',26,NULL,NULL),(195,'Opinion Mining',26,NULL,NULL),(196,'Learning Engineering',26,NULL,NULL),(197,'Formal Method',32,NULL,NULL),(198,'AI for Formal Verification',32,NULL,NULL),(199,'Software Engineering',32,NULL,NULL),(200,'Database Programming',32,NULL,NULL),(201,'Hydrologic modeling with GIS',15,NULL,NULL),(202,'Internet GIS , Health GIS',15,NULL,NULL),(203,'Remote Sensing and GIS in Geology',31,NULL,NULL),(204,'Hydrology',31,NULL,NULL),(205,'Landuse/Landcover and Natural Hazard',31,NULL,NULL),(206,'Urban Remote Sensing',5,NULL,NULL),(207,'Application in Remote Sensing',11,NULL,NULL),(208,'Remote Sensing for Vegatation study',11,NULL,NULL),(209,'Remote Sensing',23,NULL,NULL),(210,'Spatial analysis',23,NULL,NULL),(211,'Remote Sensing',30,NULL,NULL),(212,'Spatial database',30,NULL,NULL),(213,'Web Mapping',30,NULL,NULL),(214,'UAV',30,NULL,NULL),(215,'Satellite Image classification',30,NULL,NULL),(216,'Human Computer Interaction',34,NULL,NULL),(217,'Artificial Intelligence in Healthcare',34,NULL,NULL),(218,'Data Mining and Machine Learning for Health Informatics',34,NULL,NULL),(219,'Persuasive Technology ',34,NULL,NULL),(220,'Social Technologies',34,NULL,NULL),(221,'E-Commerce',34,NULL,NULL);
/*!40000 ALTER TABLE `expertises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funds`
--

DROP TABLE IF EXISTS `funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fund_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fund_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fund_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fund_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fund_agency` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_resource` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fund_user_id` (`user_id`),
  CONSTRAINT `fund_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funds`
--

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
INSERT INTO `funds` VALUES (2,'Statistical Thai – Isarn Dialect Machine Translation System using Parallel Corpus',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',16,'2022-05-04 12:28:09','2022-05-04 12:28:09'),(4,'นวัตกรรมดัชนีสุขภาพของประชากรไทยโดยวิทยาการข้อมูลเพื่อประโยชน์ในการปรับเปลี่ยนพฤติกรรม',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',34,'2022-05-04 13:23:28','2022-05-04 13:23:28'),(5,'Morphological analysis for edible mushrooms using artificial neural networks ANN Model',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:20:53','2022-05-08 06:20:53'),(6,'Ontology-based Learning data integration using ontology mapping and a rules based reasoning approach',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:22:26','2022-05-08 06:22:26'),(7,'การศึกษาแนวทางในการวิเคราะห์ประสิทธิภาพของระบบการวางแผนทรัพยากรองค์กร',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:24:13','2022-05-08 06:24:13'),(8,'การออกแบบและพัฒนาระบบการเรียนรู้การเขียนโปรแกรมแบบคู่ด้วยอาลิซ',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:26:20','2022-05-08 06:26:20'),(9,'การพัฒนาต้นแบบเพื่อการวิเคราะห์ประสิทธิภาพของระบบการวางแผนทรัพยากรองค์กร',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:31:05','2022-05-08 06:31:05'),(10,'วิธีการปรับโดเมนโดยใช้เซลลูลาร์ออโตมาตาสำหรับวิทัศน์คอมพิวเตอร์',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:32:00','2022-05-08 06:32:00'),(11,'การเพิ่มความทนทานให้ตัวแบบเอ็กซ์ทรีมออนไลน์ตามลำดับ',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:33:16','2022-05-08 06:33:16'),(12,'ระบบวัดดัชนีประสิทธิผลใน การจัดการเรียนรู้แบบผสมผสาน',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:34:31','2022-05-08 06:34:31'),(13,'โครงการการพัฒนาระบบฐานข้อมูลภูมิสารสนเทศยางนาใน จังหวัดขอนแก่น',NULL,'ทุนภายใน',NULL,NULL,'มหาวิทยาลัยขอนแก่น',1,'2022-05-08 06:36:04','2022-05-08 06:36:04'),(14,'โครงการ',NULL,'ทุนภายนอก',NULL,NULL,'สำนักงานคณะกรรมการนโยบายวิทยาศาสตร์ เทคโนโลยีและนวัตกรรมแห่งชาติ',1,'2022-05-15 05:02:53','2022-05-15 05:02:53'),(15,'การจัดอบรมหลักสูตรประกาศนียบัตร (Non-Degree) โครงการพัฒนาทักษะกำลังคนของประเทศ (Reskill/Upskill/Newskill) เพื่อการมีงานทำและเตรียมความพร้อมรองรับการทำงานในอนาคตหลังวิกฤตการระบาดของไวรัสโคโรนา 2019 (COVID-19)',NULL,'ทุนภายนอก',NULL,NULL,'สำนักงานปลัดกระทรวงอุดมศึกษา วิทยาศาสตร์ วิจัยและนวัตกรรม',1,'2022-05-15 05:37:19','2022-05-15 05:37:19'),(16,'ทุน สกว. ฝ่ายอุตสาหกรรม',NULL,'ทุนภายนอก',NULL,NULL,'-',1,'2022-05-15 06:10:05','2022-05-15 06:10:05'),(17,'ทุนอุดหนุนการวิจัย มข. ประเภทบูรณาการวิจัยและนวัตกรรม',NULL,'ทุนภายนอก',NULL,NULL,'สำนักงานคณะกรรมการวิจัยแห่งชาติ',1,'2022-05-15 06:16:38','2022-05-15 06:16:38'),(18,'ทุนวิจัย CEMB  (โครงการย่อยที่ 1)',NULL,'ทุนภายนอก',NULL,NULL,'-',1,'2022-05-15 06:21:33','2022-05-15 06:21:33'),(19,'ERASMUS+ : Curriculum Development in Data Science and Artificial Intelligence/DS&AI',NULL,'ทุนภายนอก',NULL,NULL,'-',1,'2022-05-15 06:25:30','2022-05-15 06:25:30'),(20,'“เครือข่ายวิจัยเทคโนโลยีทันสมัยของเครือข่ายอันชาญฉลาดที่แพร่หลาย” (Pervasive inteLligent and Network Emerging Technology (PLANET))',NULL,'ทุนภายนอก',NULL,NULL,'-',1,'2022-05-15 06:29:50','2022-05-15 06:29:50'),(21,'โครงการจัดการพลังงานที่มีประสิทธิภาพ ในเครือข่ายเซ็นเซอร์ไร้สายแบบเติมได้',NULL,'ทุนภายนอก',NULL,NULL,'-',1,'2022-05-15 06:31:07','2022-05-15 06:31:07'),(22,'ERASMUS+ : Innovation on Remote Sensing Education and Learning',NULL,'ทุนภายนอก',NULL,NULL,'OU, BOKU, JU, ITC, AIT, YNNU, FNU',1,'2022-05-15 06:33:43','2022-05-15 06:33:43'),(23,'การพัฒนาระบบเซนเซอร์อัตโนมัติสำหรับสภาวะแวดล้อมภายในโรงเรือนและปรับปรุงการชั่งน้ำหนักอัตโนมัติสำหรับฟาร์มไก่อัจฉริยะ',NULL,'ทุนภายนอก',NULL,NULL,'กระทรวงวิทยาศาสตร์และเทคโนโลยี',1,'2022-05-15 06:36:46','2022-05-15 06:36:46'),(24,'การพัฒนาระบบเซนเซอร์อัตโนมัติสำหรับสภาวะแวดล้อมภายในโรงเรือนและปรับปรุงการชั่งน้ำหนักอัตโนมัติสำหรับฟาร์มไก่อัจฉริยะ',NULL,'ทุนภายนอก',NULL,NULL,'กระทรวงวิทยาศาสตร์และเทคโนโลยี',1,'2022-05-15 06:37:30','2022-05-15 06:37:30'),(25,'โครงการระบบภูมิสารสนเทศโรคพยาธิใบไม้ตับและมะเร็งท่อน้ำดีภาคตะวันออกเฉียงเหนือ ประเทศไทย',NULL,'ทุนภายนอก',NULL,NULL,'ศูนย์ภูมิสารสนเทศเพื่อการพัฒนาภาคตะวันออกเฉียงเหนือ',1,'2022-05-15 06:38:53','2022-05-15 06:38:53'),(26,'ทุน สกว.',NULL,'ทุนภายนอก',NULL,NULL,'-',1,'2022-05-15 06:41:04','2022-05-15 06:41:04'),(27,'ทุน ทปอ.',NULL,'ทุนภายนอก',NULL,NULL,'-',1,'2022-05-15 06:42:47','2022-05-15 06:42:47'),(28,'ทุนเมธีวิจัย สกว.',NULL,'ทุนภายนอก',NULL,NULL,'-',1,'2022-05-15 06:44:29','2022-05-15 06:44:29'),(29,'ทุนสนับสนุนการวิจัยปีงบประมาณ 2564',NULL,'ทุนภายใน',NULL,NULL,'คณะวิทยาศาสตร์ มข.',22,'2022-05-16 07:21:18','2022-05-16 07:21:18'),(30,'ทุนส่งเสริมนักวิจัยระดับสูง',NULL,'ทุนภายใน','สูง',NULL,'วิทยาลัยการคอมพิวเตอร์',6,'2022-05-18 05:02:56','2022-05-18 05:02:56'),(31,'ทุนส่งเสริมนักวิจัยระดับสูง',NULL,'ทุนภายใน','สูง',NULL,'วิทยาลัยการคอมพิวเตอร์',6,'2022-05-18 05:03:05','2022-05-18 05:03:05');
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_01_19_060928_create_departments_table',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2021_11_02_091209_create_papers_table',1),(6,'2021_11_02_091502_teacher__paper',1),(7,'2021_11_07_093357_create_source_datas_table',1),(8,'2021_11_07_093614_list_of_published',1),(9,'2021_12_30_085642_create_funds_table',1),(10,'2021_12_30_131353_create_research_projects_table',1),(11,'2021_12_30_131609_create_work_of_research_projects_table',1),(12,'2022_01_05_075720_create_fund_of_research_table',1),(13,'2022_01_09_153100_create_authors_table',1),(14,'2022_01_09_180504_author_of__paper',1),(15,'2022_01_10_084125_create_permission_tables',1),(16,'2022_01_14_065903_create_research_group_table',1),(17,'2022_01_14_075140_create_work_of_research_groups_table',1),(18,'2022_01_17_123959_create_posts_table',1),(19,'2022_01_19_061454_create_work_of_department_table',1),(20,'2022_01_26_091510_create_files_table',1),(21,'2022_01_26_145335_create_products_table',1),(22,'2022_01_27_092357_create_books_table',1),(23,'2022_01_27_100103_create_customers_table',1),(24,'2022_02_17_085429_create_expertises_table',2),(25,'2022_02_22_075942_create_categories_table',3),(26,'2022_03_28_225334_create_education_table',4),(27,'2022_04_17_221919_create_academicworks_table',5),(28,'2022_04_17_222540_create_user_of_academicworks',6),(29,'2022_04_17_222553_create_author_of_academicworks',7),(30,'2022_04_29_143111_create_outsiders_table',8),(31,'2022_04_29_155014_create_outsiders_work_of_project_table',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2),(2,'App\\Models\\User',3),(2,'App\\Models\\User',4),(2,'App\\Models\\User',5),(2,'App\\Models\\User',6),(5,'App\\Models\\User',6),(2,'App\\Models\\User',7),(2,'App\\Models\\User',8),(2,'App\\Models\\User',9),(2,'App\\Models\\User',10),(2,'App\\Models\\User',11),(2,'App\\Models\\User',13),(2,'App\\Models\\User',14),(2,'App\\Models\\User',15),(2,'App\\Models\\User',16),(2,'App\\Models\\User',17),(2,'App\\Models\\User',18),(2,'App\\Models\\User',19),(2,'App\\Models\\User',20),(2,'App\\Models\\User',21),(2,'App\\Models\\User',22),(2,'App\\Models\\User',23),(2,'App\\Models\\User',24),(2,'App\\Models\\User',25),(2,'App\\Models\\User',26),(2,'App\\Models\\User',27),(2,'App\\Models\\User',28),(2,'App\\Models\\User',29),(2,'App\\Models\\User',30),(2,'App\\Models\\User',31),(2,'App\\Models\\User',32),(2,'App\\Models\\User',33),(2,'App\\Models\\User',34),(4,'App\\Models\\User',35),(3,'App\\Models\\User',36),(3,'App\\Models\\User',38),(3,'App\\Models\\User',39),(3,'App\\Models\\User',40),(3,'App\\Models\\User',41),(3,'App\\Models\\User',42),(3,'App\\Models\\User',43),(3,'App\\Models\\User',44),(3,'App\\Models\\User',45),(3,'App\\Models\\User',46),(1,'App\\Models\\User',47),(4,'App\\Models\\User',47),(4,'App\\Models\\User',49),(4,'App\\Models\\User',50),(3,'App\\Models\\User',51),(3,'App\\Models\\User',52),(3,'App\\Models\\User',53),(3,'App\\Models\\User',54),(3,'App\\Models\\User',55),(3,'App\\Models\\User',56),(3,'App\\Models\\User',57),(3,'App\\Models\\User',58),(3,'App\\Models\\User',59),(3,'App\\Models\\User',60),(3,'App\\Models\\User',61),(3,'App\\Models\\User',62),(3,'App\\Models\\User',63),(3,'App\\Models\\User',64),(3,'App\\Models\\User',65),(3,'App\\Models\\User',66),(3,'App\\Models\\User',67),(3,'App\\Models\\User',68),(3,'App\\Models\\User',69),(3,'App\\Models\\User',70),(3,'App\\Models\\User',71),(3,'App\\Models\\User',72),(3,'App\\Models\\User',73),(3,'App\\Models\\User',74),(3,'App\\Models\\User',75),(3,'App\\Models\\User',76),(3,'App\\Models\\User',77),(3,'App\\Models\\User',78),(3,'App\\Models\\User',79),(3,'App\\Models\\User',80),(3,'App\\Models\\User',81),(3,'App\\Models\\User',82),(3,'App\\Models\\User',83),(3,'App\\Models\\User',84),(3,'App\\Models\\User',85),(3,'App\\Models\\User',86),(3,'App\\Models\\User',87),(3,'App\\Models\\User',88),(3,'App\\Models\\User',89),(3,'App\\Models\\User',90),(3,'App\\Models\\User',91),(3,'App\\Models\\User',92),(3,'App\\Models\\User',93),(3,'App\\Models\\User',94),(3,'App\\Models\\User',95),(3,'App\\Models\\User',96),(3,'App\\Models\\User',97),(3,'App\\Models\\User',98),(3,'App\\Models\\User',99),(3,'App\\Models\\User',100),(3,'App\\Models\\User',101),(3,'App\\Models\\User',102),(3,'App\\Models\\User',103),(3,'App\\Models\\User',104),(3,'App\\Models\\User',105),(3,'App\\Models\\User',106),(3,'App\\Models\\User',107),(3,'App\\Models\\User',108),(3,'App\\Models\\User',109),(3,'App\\Models\\User',110),(3,'App\\Models\\User',111),(3,'App\\Models\\User',112),(3,'App\\Models\\User',113),(3,'App\\Models\\User',114),(3,'App\\Models\\User',115),(3,'App\\Models\\User',116),(3,'App\\Models\\User',117),(3,'App\\Models\\User',118),(3,'App\\Models\\User',119),(3,'App\\Models\\User',120),(3,'App\\Models\\User',121),(3,'App\\Models\\User',122),(3,'App\\Models\\User',123),(3,'App\\Models\\User',124),(3,'App\\Models\\User',125),(3,'App\\Models\\User',126),(3,'App\\Models\\User',127),(3,'App\\Models\\User',128),(3,'App\\Models\\User',129),(3,'App\\Models\\User',130),(3,'App\\Models\\User',131),(3,'App\\Models\\User',132),(3,'App\\Models\\User',133),(3,'App\\Models\\User',134),(3,'App\\Models\\User',135),(3,'App\\Models\\User',136),(3,'App\\Models\\User',137),(3,'App\\Models\\User',138),(3,'App\\Models\\User',139),(3,'App\\Models\\User',140),(3,'App\\Models\\User',141),(3,'App\\Models\\User',142),(3,'App\\Models\\User',143),(3,'App\\Models\\User',144),(3,'App\\Models\\User',145),(3,'App\\Models\\User',146),(3,'App\\Models\\User',147),(3,'App\\Models\\User',148),(3,'App\\Models\\User',149),(3,'App\\Models\\User',150),(2,'App\\Models\\User',151),(2,'App\\Models\\User',152);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outsiders`
--

DROP TABLE IF EXISTS `outsiders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outsiders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outsiders`
--

LOCK TABLES `outsiders` WRITE;
/*!40000 ALTER TABLE `outsiders` DISABLE KEYS */;
INSERT INTO `outsiders` VALUES (1,'geng','geng','dr.',NULL,NULL),(2,'gggg','gggg','dr.','2022-04-29 14:39:30','2022-04-29 14:39:30'),(3,'watchara','srtitonwong','dr.','2022-04-29 15:08:46','2022-04-29 15:08:46'),(4,'wat','geng','ass.','2022-04-29 15:25:00','2022-04-29 15:25:00'),(5,'นำโชค','ไม่มี','ศ. ดร.','2022-05-16 04:24:05','2022-05-16 04:24:05');
/*!40000 ALTER TABLE `outsiders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outsiders_work_of_project`
--

DROP TABLE IF EXISTS `outsiders_work_of_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outsiders_work_of_project` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `outsider_id` bigint unsigned NOT NULL,
  `research_project_id` bigint unsigned NOT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `outsiders_work_of_project_outsider_id_foreign` (`outsider_id`),
  KEY `outsiders_work_of_project_research_project_id_foreign` (`research_project_id`),
  CONSTRAINT `outsiders_work_of_project_outsider_id_foreign` FOREIGN KEY (`outsider_id`) REFERENCES `outsiders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outsiders_work_of_project_research_project_id_foreign` FOREIGN KEY (`research_project_id`) REFERENCES `research_projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outsiders_work_of_project`
--

LOCK TABLES `outsiders_work_of_project` WRITE;
/*!40000 ALTER TABLE `outsiders_work_of_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `outsiders_work_of_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `paper_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abstract` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paper_type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paper_subtype` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paper_sourcetitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `paper_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `publication` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paper_yearpub` year DEFAULT NULL,
  `paper_volume` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paper_issue` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paper_citation` int DEFAULT NULL,
  `paper_page` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paper_doi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paper_funder` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `index2` (`paper_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2814 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES (2787,'Service priority classification using machine learning','© 2024 Silpakorn University. All rights reserved.This article details a procedure for classifying service cases with various priority levels based on machine learning (ML). It accurately defines the priority level of each service case. The presence of imbalanced datasets in service cases poses a challenge for achieving reliable classification accuracy. To address this, the use of the synthetic minority over-sampling technique (SMOTE) was proposed as the method for balancing the datasets prior to applying the ML method. From these experimental results, an improvement in the precision of the learning process was observed, which led to better outcomes in the test sets. This improvement was measured using the efficiency metrics from the confusion matrix. The experiment involved 6,182 service cases, categorized into four levels: critical, serious, moderate, and low. These were based on test comparisons with other ML methods. The accuracy achieved in the test data was 94.37%. By employing a hybrid technique to address the imbalance in SMOTE and the support vector machine model, it was found to be more effective than the comparative term frequency-inverse document frequency model that was used in conjunction with cosine similarity, which achieved an evaluation score of 70.14%.','Journal','Article','Science, Engineering and Health Studies','\"[{\\\"$\\\":\\\"classification\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"imbalanced data\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"machine learning\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"SMOTE\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85207239454&origin=inward',NULL,2024,'18',NULL,0,NULL,'10.69598/sehs.18.24020002',NULL,NULL,'2025-03-08 15:46:16','2025-03-08 15:46:16'),(2788,'Bias-Boosted ELM for Knowledge Transfer in Brain Emotional Learning for Time Series Forecasting','© 2013 IEEE.This paper presents the Bias-Boosted Extreme Learning Machine guided Brain Emotional Learning (B2ELM-BEL) model, a significant advancement in chaotic time series prediction that effectively incorporates knowledge transfer learning. Integrating traditional Brain Emotional Learning (BEL) with the novel Biased-ELM method, the B2ELM-BEL introduces a bias term into the output weights of Extreme Learning Machines (ELM). This addition enhances the model\'s predictive accuracy, proving particularly beneficial in configurations with a minimal number of hidden nodes. Our evaluation of the B2ELM-BEL model across various datasets, including complex chaotic time-series benchmarks and real-world scenarios, demonstrates its superior performance over several BEL models. It achieves lower mean RMSE, MAE, and SMAPE values, and exhibits enhanced generalizability and efficiency. The findings indicate that while the single hidden node variant of B2ELM-BEL is suitable for simpler tasks, the multi-node version is more adept at handling challenging environments. This highlights the necessity of tailoring the model to the complexity of the specific dataset being analyzed.','Journal','Article','IEEE Access','\"[{\\\"$\\\":\\\"bias-boosted prediction models\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"brain emotional learning (BEL)\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"Chaotic time-series forecasting\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"extreme learning machine (ELM)\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"machine learning robustness\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"transfer learning\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85187010509&origin=inward',NULL,2024,'12',NULL,2,'35868-35898','10.1109/access.2024.3371259','\"This work was supported by the Graduate Education of Computer and Information Science Interdisciplinary Research Grant from the Department of Computer Science, College of Computing, Khon Kaen University, Thailand.\"',NULL,'2025-03-08 15:46:16','2025-03-08 17:42:16'),(2789,'Generalized stability of artificial emotional neural network in predicting domestic power peak demand','© 2022 Silpakorn UniversityPredicting an optimal domestic power peak demand is very important for long-term electricity construction planning as the electricity cannot be stored permanently. If the prediction can give a yield close to the actual demand, the electricity suppliers can save their construction costs and provide their customers with a lower cost of electricity. However, accurate predictions still require improvement. This work, therefore, presented the predicting problem using a modified artificial emotional neural network (AENN) based on an improved JAYA optimizer. This study also applied extreme learning machine (ELM) to compute the expanded feature in the AENN. A real case study of Thailand\'s power peak demand was considered, which was prepared using a rolling mechanism, to demonstrate the performance of a developed predicting model when contrasted with state-of-the-art of AENN models, artificial neural network with Levenberg-Marquardt, AENN methods based on winner-take-all approach, and improved brain emotional learning-based AENN model. Performance analyses demonstrated that the proposed model provided improvements in performance and generalized stability over the comparative models.','Journal','Article','Science, Engineering and Health Studies','\"[{\\\"$\\\":\\\"artificial emotional neural network\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"Domestic power peak demand\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"improved JAYA optimization algorithm\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85148299006&origin=inward',NULL,2022,'16',NULL,1,NULL,'10.14456/sehs.2022.30',NULL,NULL,'2025-03-08 15:46:16','2025-03-08 15:46:30'),(2790,'Incident Task Sequence for Service Priority using Cosine Similarity','© 2022 IEEE.The article herein details a procedure for classifying service cases by priority level based on the service level agreement (SLA) between an organization and the customer. The main factor in the article\'s publication was the accuracy of the classification of the importance of internal service work. However, many service evaluators remain confused about the tiering of service cases. Therefore, creating accurate service case classification models is imperative to simplify the classification process. The service cases consisted of four levels: series, critical, moderate, and low. We employed natural language processing (NLP) to develop a more efficient priority level of service for the organization. We implemented the weighting of the term frequency - inverse document frequency (TF-IDF) method and cosine Similarity with the measuring degree concept of similarity terms within each service case. The model consisted of four processes: data collection, preprocessing, TF-IDF calculation, and similarity and scoring calculation. The model presented here improved the accuracy of the classified process and produced better results in the test sets, measuring the efficiency from the cosine similarity. Lastly, our research contained 5,790 service cases with an accuracy of 70.14%, achieved through the combination of TF-IDF and cosine similarity.','Conference Proceeding','Conference Paper','Proceedings - 2022 1st International Conference on Technology Innovation and Its Applications, ICTIIA 2022','\"[{\\\"$\\\":\\\"corpus\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"cosine similarity\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"priority classification\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"TF-IDF\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"word embedding\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85143084524&origin=inward',NULL,2022,NULL,NULL,2,NULL,'10.1109/ictiia54654.2022.9935947','\"ACKNOWLEDGMENT All research-related operations were supported by the ComputerScienceDepartment,Collegeof Computing,Khon Kaen University, Khon Kaen, Thailand.\"',NULL,'2025-03-08 15:46:16','2025-03-08 15:46:28'),(2791,'Enhanced Local Receptive Fields based Extreme Learning Machine using Dominant Patterns Selection','© 2021 IEEE.The local receptive fields based ELM (ELM-LRF) is an extended version of ELM. Its hidden nodes are structure through the local connection approach, which demonstrated satisfactory performance in image classification problems. However, ELM-LRF still requires further improvement because extracting images features directly with random initial weights will generate redundancy features that may degrade its performance in some situations. This paper, therefore, presents a new method named the enhanced local receptive fields based ELM using dominant patterns selection (DP-ELM-LRF) to enhance ELM-LRF, which applies novel feature selection in vehicle detection through the selection of dominant patterns of HOGs (DPHOG) for selecting dominant features in the ELM feature space. DP-ELM-LRF evaluated classification performance on GTI and Concrete Crack datasets for binary classification and MNIST, Semeion, and small NORB datasets for multi-classification. Experiment results demonstrated that the DP-ELM-LRF was superior to the ELM-LRF and other comparative methods of multi-classification, whereas binary classification, DP-ELM-LRF, remains comparable with ELM-LRF.','Conference Proceeding','Conference Paper','ICSEC 2021 - 25th International Computer Science and Engineering Conference','\"[{\\\"$\\\":\\\"dominant patterns selection\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"feature selection\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"},{\\\"$\\\":\\\"local receptive fields\\\",\\\"@xml:lang\\\":\\\"eng\\\",\\\"@original\\\":\\\"y\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85125189779&origin=inward',NULL,2021,NULL,NULL,0,'161-166','10.1109/icsec53205.2021.9684636','\"This research has been partially supported by the Department of Computer Science, Faculty of Science, Khon Kaen University, Thailand.\"',NULL,'2025-03-08 15:46:16','2025-03-08 15:46:16'),(2792,'An Incremental Kernel Extreme Learning Machine for Multi-Label Learning with Emerging New Labels','© 2013 IEEE.Multi-label learning with emerging new labels is a practical problem that occurs in data streams and has become an important new research issue in the area of machine learning. However, existing models for dealing with this problem require high learning computational times, and there still exists a lack of research. Based on these issues, this paper presents an incremental kernel extreme learning machine for multi-label learning with emerging new labels, consisting of two parts: a novelty detector; and a multi-label classifier. The detector with free-user-setting threshold parameters was developed to identify instances with new labels. A new incremental multi-label classifier and its improved version were developed to predict a label set for each instance, which can add output units incrementally and update themselves in unlabeled instances. Comprehensive evaluations of the proposed method were carried out on the problems of multi-label classification with emerging new labels compared to comparative algorithms, which revealed the promising performance of the proposed method.','Journal','Article','IEEE Access','\"[{\\\"$\\\":\\\"class incremental learning\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"data stream classification\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Multi-label classification\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"multi-label learning with emerging new labels\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"novelty detection\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85082003806&origin=inward',NULL,2020,'8',NULL,13,'46055-46070','10.1109/access.2020.2978648','\"This work was supported by the Graduate Education of Computer and Information Science Research Grant from the Department of Computer Science, Faculty of Science, Khon Kaen University, under Grant 001\\/2558.\"',NULL,'2025-03-08 15:46:16','2025-03-08 15:46:24'),(2793,'Enhancement of artificial emotional neural network using Jaya algorithm and the investigation of expanded feature selected for wind power forecasting','© 2019 Association for Computing Machinery.The Brain Emotional Learning (BEL) is a novel bio-inspired machine learning approach mentioned as a new class of artificial neural network (ANN). The artificial emotional neural network (AENN) is one of the BEL methods which used the genetic algorithm (GA) to compute proper weights, weights of the amygdala (AMYG), orbitofrontal cortex (OFC) weights and a bias value. AENN trained by GA has been reported that it could produce low error rates. However, AENN still has more rooms to enhance its prediction of performance, especially generalization and the prediction of performance. Therefore, this paper aims to propose a new training method for AENN. The JAYA optimization algorithm optimized the weights and the biases of AENN. Two new proposed models are named as AENN-Max-JAYA and AENN-Mean-JAYA. Their names are according to the way of selecting the additional expanded feature which obtained through either the max or the average of input patterns, respectively. From the experimental results for wind power forecasting dataset, the proposed methods proved that the results are better in generalization performance and give lower error rates which compared to the comparative AENN models and traditional ANNs.','Conference Proceeding','Conference Paper','ACM International Conference Proceeding Series','\"[{\\\"$\\\":\\\"Artificial emotional neural network\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Brain Emotional Learning\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Forecasting\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"JAYA optimization algorithm\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Wind power\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85073213623&origin=inward',NULL,2019,NULL,NULL,1,'137-142','10.1145/3348445.3348448',NULL,NULL,'2025-03-08 15:46:16','2025-03-08 15:46:30'),(2794,'Kernel extreme learning machine based on fuzzy set theory for multi-label classification','© 2017, Springer-Verlag GmbH Germany, part of Springer Nature.Multi-label classification is a special kind of classification problem, where a single instance can be labeled to more than one class. Extreme learning machine (ELM) with kernel is an efficient method for solving both regression and multi-class classification problems. However, ELM with kernel has a limitation when it comes to multi-label classification tasks. To solve this problem, this paper proposes an enhanced ELM with kernel based on a fuzzy set theory for multi-label classification problems. The relationship between an instance and its corresponding class can be defined as the fuzzy membership. This fuzzy membership is used in output weights computation to weigh the training sample towards the corresponding classes. The experimental results demonstrate that the proposed method outperforms the ELM family of algorithms for multi-label problems, as well as the state-of-the-art multi-label classification algorithms.','Journal','Article','International Journal of Machine Learning and Cybernetics','\"[{\\\"$\\\":\\\"Extreme learning machine with kernel\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Fuzzy membership\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Fuzzy set theory\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Multi-label classification\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85064935473&origin=inward',NULL,2019,'10','5',32,'979-989','10.1007/s13042-017-0776-3','\"Acknowledgements This work was supported by the Graduate Education of Computer and Information Science Interdisciplinary Research Grant from Department of Computer Science, Khon Kaen University (Grant no. 001\\/2558).\"',NULL,'2025-03-08 15:46:16','2025-03-08 15:46:21'),(2795,'Parallelized Metaheuristic-Ensemble of Heterogeneous Feedforward Neural Networks for Regression Problems','© 2013 IEEE.A feedforward neural network ensemble trained through metaheuristic algorithms has been proposed by researchers to produce a group of optimal neural networks. This method, however, has proven to be very time-consuming during the optimization process. To overcome this limitation, we propose a metaheuristic-based learning algorithm for building an ensemble system, resulting in shorter training time. In our proposed method, a master-slave based metaheuristic algorithm is employed in the optimization process to produce a group of heterogeneous feedforward neural networks, in which the global search operations are executed on the master, and the tasks of objective evaluation are distributed to the slaves (workers). To reduce evaluation costs, the entire training dataset is randomly divided equally into several disjoint subsets. Each subset is randomly paired with another subset of the remainder and distributed to a worker for the objective evaluation. Following the optimization process, representative candidate solutions (individuals) from the entire population are selected to perform as the base components of the ensemble system. The performance of the proposed method has been compared with those of other state-of-the-art techniques in over 31 benchmark regression datasets taken from public repositories. The experimental results show that the proposed method not only reduces the computational time but also achieves significantly better prediction accuracy. Moreover, the proposed method achieved promising results in the application of a subset of the million song dataset, which identifies the release year of a song and predicts the buzz on Twitter.','Journal','Article','IEEE Access','\"[{\\\"$\\\":\\\"encoding scheme\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"ensemble learning\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"feedforward neural network\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"hybrid learning\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"master-slave model\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"metaheuristic optimization\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Neural network with random weights\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"parallel computing\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85062950887&origin=inward',NULL,2019,'7',NULL,18,'26909-26932','10.1109/access.2019.2900563','\"This work was supported by the Computer and Information Science Interdisciplinary Research Grant from the Department of Computer Science, Faculty of Science, Khon Kaen University, under Grant 002\\/2556.\"',NULL,'2025-03-08 15:46:16','2025-03-08 15:46:23'),(2796,'A Fast Convolutional Denoising Autoencoder Based Extreme Learning Machine','© 2017 IEEE.The convolutional autoencoder (CAE) was proposed on convolutional neural network (CNN) and denoising autoencoder (DAE). CAE can address the corrupted input samples and high dimensional problem. However, CAE has a shortcoming involving a large training timescale because the parameters of network are commonly tuned by gradient descent (GD) learning method. In order to alleviate this problem, this paper proposed a fast convolutional denoising autoencoder based extreme learning machine (ELM), called fast convolutional denoising autoencoder (FCDA). In FCDA, the random convolutional hidden nodes are used to reduce the dimension of input data. After that, the proposed denoising ELM autoencoder is used to reconstruct the cleaned data. The experimental results indicate that the proposed method not only speeds up the traditional CAE, but it also outperforms the CAE algorithm in terms of reconstruction error. Moreover, we applied the proposed method FCDA as the pre-processing method for ML-ELM classifier. The results illustrate the combination of the proposed FCDA, and ML-ELM achieves the classification performance better than the comparative methods.','Conference Proceeding','Conference Paper','ICSEC 2017 - 21st International Computer Science and Engineering Conference 2017, Proceeding','\"[{\\\"$\\\":\\\"Convolutional Autoencoder\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Denoising Autoencoder\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme Learning Machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85053439894&origin=inward',NULL,2018,NULL,NULL,2,'185-189','10.1109/icsec.2017.8443962','\"This research was partially supported by Advance Smart Computing Laboratory (ASCLab) Department of Computer Science, Faculty of Science, Khon Kaen University, Thailand.\"',NULL,'2025-03-08 15:46:16','2025-03-08 15:46:29'),(2797,'Ensemble extreme learning machine for multi-instance learning','© 2017 ACM.Multi-instance learning (MIL) is a classification approach for classifying on a collection of instances which each group is represented as a bag. The main task of MIL is to learn from labels and features of instances to produce a model to predict a label of a testing bag. Traditional MIL algorithms were proposed to address the MIL problem, but most of the algorithms take a large time scale for their training process since they have to computing the parameter tuning. To address the learning time problem, the multi-instance learning method based on extreme learning machine (ELM-MIL) was proposed. However, the randomly generated parameters of ELM-MIL may reduce its generalization performance. Therefore, we proposed a new method to improve the generalization performance of the ELM-MIL which the new method is based on the ensemble with majority voting approach named the ensemble extreme learning machine for multi-instance learning (E-ELM-MIL). To evaluate the new method, several benchmark datasets were studied in this paper. From experimental results show that E-ELM-MIL outperforms ELM-MIL and the other state of the art MIL algorithm.','Conference Proceeding','Conference Paper','ACM International Conference Proceeding Series','\"[{\\\"$\\\":\\\"Ensembles\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Majority voting\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Multi-instance learning\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85024390990&origin=inward',NULL,2017,'0',NULL,3,'56-60','10.1145/3055635.3056641',NULL,NULL,'2025-03-08 15:46:16','2025-03-08 15:46:28'),(2798,'Improved convex incremental extreme learning machine based on ridgelet and PSO algorithm','© 2016 IEEE.The most difficult problem with the extreme learning machine is the selection of the hidden nodes size. The proper number of hidden nodes is predefined through a trial and error approach. The convex incremental extreme learning machine (CI-ELM) has been proposed to tackle this problem. CI-ELM is an incremental constructive neural network with universal approximation abilities. However, we have found that some hidden nodes added into a hidden layer, may play a minor role in the network, which results in an increase in network complexity. In order to avoid this shortcoming, we propose here in an improved convex incremental extreme learning machine with optimal ridgelet hidden nodes (ICOR-ELM). The proposed method uses the ridgelet function as the activation function within the hidden layer. In each step of the learning process, the optimal hidden node parameters, which are optimized through particle swarm optimization (PSO), are added to the existing hidden layer. Experimental results prove that the proposed method can achieve greater generalization performance with more compact architecture than other methods, and demonstrates faster convergence than other incremental ELM methods.','Conference Proceeding','Conference Paper','2016 13th International Joint Conference on Computer Science and Software Engineering, JCSSE 2016','\"[{\\\"$\\\":\\\"Convex incremental extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"incremental constructive neural networks\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"particle swarm optimization\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"ridgelet function\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85006961450&origin=inward',NULL,2016,NULL,NULL,4,NULL,'10.1109/jcsse.2016.7748870','\"This work was supported by the Graduate Education of Computer and Information Science Research Grant from Department of Computer Science, Faculty of Science, Khon Kaen University (Grant no. 002\\/2556).\"',NULL,'2025-03-08 15:46:16','2025-03-08 15:46:27'),(2799,'Extended hierarchical extreme learning machine with multilayer perceptron','© 2016 IEEE.For learning in big datasets, the classification performance of ELM might be low due to input samples are not extracted features properly. To address this problem, the hierarchical extreme learning machine (H-ELM) framework was proposed based on the hierarchical learning architecture of multilayer perceptron. H-ELM composes of two parts; the first is the unsupervised multilayer encoding part and the second part is the supervised feature classification part. H-ELM can give higher accuracy rate than of the traditional ELM. However, it still has to enhance its classification performance. Therefore, this paper proposes a new method namely as the extending hierarchical extreme learning machine (EH-ELM). For the extended supervisor part of EH-ELM, we have got an idea from the two-layers extreme learning machine. To evaluate the performance of EH-ELM, three different image datasets; Semeion, MNIST, and NORB, were studied. The experimental results show that EH-ELM achieves better performance than of H-ELM and the other multi-layer framework.','Conference Proceeding','Conference Paper','2016 13th International Joint Conference on Computer Science and Software Engineering, JCSSE 2016','\"[{\\\"$\\\":\\\"Hierarchical Extreme Learning Machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Hierarchical learning\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Multilayer Perceptron\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85006954201&origin=inward',NULL,2016,NULL,NULL,12,NULL,'10.1109/jcsse.2016.7748874','\"This research was partially supported by the Department of Computer Science, Faculty of Science, Khon Kaen University, Thailand.\"',NULL,'2025-03-08 15:46:16','2025-03-08 15:46:24'),(2800,'Harmonic extreme learning machine for data clustering','© 2016 IEEE.Unsupervised Extreme Learning Machine (US-ELM) is the one type of neural network which modified from Extreme Learning Machine (ELM) for handle the clustering problem. Nevertheless, US-ELM has problem with nonfulfillment of solution due to K-Mean algorithm was used to cluster which made the accuracy of solution was unstable when training many times. In this paper, K-Harmonic mean algorithm was proposed to instead of K-Mean algorithm to improve the accuracy of solution and more stable gained called, Harmonic Extreme Learning Machine (Harm-ELM) likewise the experiment result compared with state-of-the-art show that Harm-ELM can overcome to 75% of all datasets that used to attempt.','Conference Proceeding','Conference Paper','2016 13th International Joint Conference on Computer Science and Software Engineering, JCSSE 2016','\"[{\\\"$\\\":\\\"Clustering Technique\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"K-Harmonic Mean\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Unsupervised Extreme Learning Machine (US-ELM)\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85006893186&origin=inward',NULL,2016,NULL,NULL,9,NULL,'10.1109/jcsse.2016.7748872',NULL,NULL,'2025-03-08 15:46:16','2025-03-08 15:46:25'),(2801,'Improvement flower pollination extreme learning machine based on meta-learning','© 2016 IEEE.Extreme Learning Machine (ELM) model which learn very faster than other neural networks model but the solution was not suitable as expected since the randomness of the input weights and biases may cause to the nonfulfillment of solution. Flower Pollination Extreme Learning Machine (FP-ELM) model that it was merged by ELM and Flower Pollination Algorithm (FPA) to adjust the input weight and biases for improve performance of output weight when the input weight and biases were calculated. Nonetheless, FP-ELM may cause overfitting and more number of hidden nodes were used. In this paper, Meta Learning of Flower Pollination Extreme Learning Machine (Meta-FPELM) was proposed that compart the input weight, calculate to hidden nodes as FP-ELM and combine to the last output weight. In addition, the result of real word regression problems experiment of Meta-FPELM compared with state-of-the-art show that Meta-FPELM can overcome five-eighth in testing phase for all datasets.','Conference Proceeding','Conference Paper','2016 13th International Joint Conference on Computer Science and Software Engineering, JCSSE 2016','\"[{\\\"$\\\":\\\"Extreme Learning Machine (ELM)\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Flower Pollination Algorithm (FPA)\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Flower Pollination Extreme Learning Machine (FP-ELM)\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Meta-Learning Extreme Learning Machine (Meta-ELM)\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=85006877782&origin=inward',NULL,2016,NULL,NULL,6,NULL,'10.1109/jcsse.2016.7748871',NULL,NULL,'2025-03-08 15:46:16','2025-03-08 15:46:27'),(2802,'Enhancement of online sequential extreme learning machine based on the householder block exact inverse QRD recursive least squares','© 2014 Elsevier B.V.The online sequential extreme learning machine (OS-ELM) has been used for training without retraining the ELM when a chunk of data is received. However, OS-ELM may be affected by an improper number of hidden nodes settings which reduces the generalization of OS-ELM. This paper addresses this problem in OS-ELM. A new structural tolerance OS-ELM (STOS-ELM), based on the Householder block exact inverse QRD recursive least squares algorithm having numerical robustness is proposed. Experimental results conducted on four regressions and five classification problems showed that STOS-ELM can handle the situation when the network is constructed with an improper number of hidden nodes. Accordingly, the proposed STOS-ELM can be easily applied; the size of the hidden layer of ELM can be roughly approximated. If a chunk of data is received, it can be updated in the existing network without having to worry about the proper number of given hidden nodes. Furthermore, the accuracy of the network trained by STOS-ELM is comparable to that of the batch ELM when the networks have the same configurations. STOS-ELM can also be applied in ensemble version (ESTOS-ELM). We found that the stability of STOS-ELM can be further improved using the ensemble technique. The results show that ESTOS-ELM is also more stable and accurate than both of the original OS-ELM and EOS-ELM, especially in the classification problems.','Journal','Article','Neurocomputing','\"[{\\\"$\\\":\\\"Ensemble\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Householder block exact inverse QR decomposition\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Online sequential extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Robustness\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Structural tolerance\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=84922016664&origin=inward',NULL,2015,'149','Part A',10,'239-252','10.1016/j.neucom.2013.10.047',NULL,NULL,'2025-03-08 15:46:17','2025-03-08 15:46:25'),(2803,'Evolutionary circular-ELM for the reduced-reference assessment of perceived image quality','© Springer-Verlag Berlin Heidelberg 2015.At present, the quality of the image is very important. The audience needs to get the undistorted image like the original image. Cause of the loss of image quality such as storage, transmission, compression and rendering. The mechanisms rely on systems that can assess the visual quality with human perception are required. Computational Intelligence (CI) paradigms represent a suitable technology to solve this challenging problem. In this paper present, the Evolutionary Extreme Learning Machine (EC-ELM) is derived into Circular-ELM (C-ELM) that is an extended Extreme Learning Machine (ELM) and the Differential Evolution (DE) to select appropriate weights and hidden biases, which can proves performance in addressing the visual quality assessment problem by embedded in the proposed framework. The experimental results, the EC-ELM can map the visual signals into quality score values that close to the real quality score than ELM, Evolutionary Extreme Learning (E-ELM) and the original C-ELM and also stable as well. Its can confirms that the EC-ELM is proved on recognized benchmarks and for four different types of distortions.','Book Series','Article','Lecture Notes in Electrical Engineering',NULL,'https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=84923135822&origin=inward',NULL,2015,'339',NULL,9,'657-664','10.1007/978-3-662-46578-3_77',NULL,NULL,'2025-03-08 15:46:17','2025-03-08 15:46:26'),(2804,'License plate recognition application using extreme learning machines','© 2014 IEEE.Recording a car license plate is an important task for police officers or security officers to check the car of interest. However, manually recording these plates comes with problems. It is easy to make a mistake, or it can be lost. The Extreme Learning Machine (ELM) can classify the plates faster and it is a more accurate system. Therefore, this paper proposes a new license plate recognition system using ELM. The proposed system is composed of two parts: the first is a mobile application to take a picture of the car license plate, and the second is the recognition system using ELM. The recognition system entails two parts: the first is to preprocess and extract features using the histogram of oriented gradients (HOG). The second part is to classify each number and each of the Thai alphabet letters that appear on the car license plates. Also, the system will classify provinces of each plate. The results of the experiment show that the testing recognition rate when trained with 200 hidden nodes is 89.05% while the rate of correctly recognized plates is 252 out of 283 plates.','Conference Proceeding','Conference Paper','Proceedings of the 2014 3rd ICT International Senior Project Conference, ICT-ISPC 2014','\"[{\\\"$\\\":\\\"ELM\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme Learning Machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"License Plate Recognition\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=84911366210&origin=inward',NULL,2014,NULL,NULL,29,'103-106','10.1109/ict-ispc.2014.6923228',NULL,NULL,'2025-03-08 15:46:17','2025-03-09 11:00:00'),(2805,'Multi-label classification with extreme learning machine','Extreme learning machine (ELM) is a well-known algorithm for single layer feedforward neural networks (SLFNs) and their learning speed is faster than traditional gradient-based neural networks. However, many of the tasks that ELM focuses on are single-label, where an instance of the input set is associated with one label. This paper proposes a new method for training ELM that will be capable of multi-label classification using the Canonical Correlation Analysis (CCA). The new method is named CCA-ELM. There are 4 steps in the training process: the first step is to compute any correlations between the input features and the set of labels using CCA, the second step maps the input space and label space to the new space, the third step uses ELM to classify and the last step is to map to the original input space. The experimental results show that CCA-ELM can improve ELM for classification on multi-label learning and its recognition performances are better than the other comparative algorithms that use the same standard CCA. © 2013 IEEE.','Conference Proceeding','Conference Paper','Proceedings of the 2014 6th International Conference on Knowledge and Smart Technology, KST 2014','\"[{\\\"$\\\":\\\"Canonical correlation analysis\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Multi-label classification\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=84902499857&origin=inward',NULL,2014,NULL,NULL,26,'81-86','10.1109/kst.2014.6775398',NULL,NULL,'2025-03-08 15:46:17','2025-03-08 15:46:23'),(2806,'Handwritten character recognition using histograms of oriented gradient features in deep learning of artificial neural network','Feature extraction plays an essential role in hand written character recognition because of its effect on the capability of classifiers. This paper presents a framework for investigating and comparing the recognition ability of two classifiers: Deep-Learning Feedforward-Backpropagation Neural Network (DFBNN) and Extreme Learning Machine (ELM). Three data sets: Thai handwritten characters, Bangla handwritten numerals, and Devanagari handwritten numerals were studied. Each data set was divided into two categories: non-extracted and extracted features by Histograms of Oriented Gradients (HOG). The experimental results showed that using HOG to extract features can improve recognition rates of both of DFBNN and ELM. Furthermore, DFBNN provides higher slightly recognition rates than those of ELM. © 2013 IEEE.','Conference Proceeding','Conference Paper','2013 International Conference on IT Convergence and Security, ICITCS 2013','\"[{\\\"$\\\":\\\"Deep learning neural network\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Feature extraction\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Handwritten character recognition\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Histograms of oriented gradients\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=84894186954&origin=inward',NULL,2013,NULL,NULL,61,NULL,'10.1109/icitcs.2013.6717840',NULL,NULL,'2025-03-08 15:46:17','2025-03-08 15:46:20'),(2807,'Evolutionary circular extreme learning machine','Circular Extreme Learning Machine (C-ELM) is an extension of Extreme Learning Machine. Its power is mapping both linear and circular separation boundaries. However, C-ELM uses the random determination of the input weights and hidden biases, which may lead to local optimal. This paper proposes a hybrid learning algorithms based on the C-ELM and the Differential Evolution (DE) to select appropriate weights and hidden biases. It called Evolutionary circular extreme learning machine (EC-ELM). From experimental results show EC-ELM can slightly improve C-ELM and also reduce the number of nodes network. © 2013 IEEE.','Conference Proceeding','Conference Paper','2013 International Computer Science and Engineering Conference, ICSEC 2013','\"[{\\\"$\\\":\\\"Circular Extreme Learning Machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Differential Evolution\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=84893543645&origin=inward',NULL,2013,NULL,NULL,7,'292-297','10.1109/icsec.2013.6694796',NULL,NULL,'2025-03-08 15:46:17','2025-03-08 15:46:26'),(2808,'Robust extreme learning machine','The output weights computing of extreme learning machine (ELM) encounters two problems, the computational and outlier robustness problems. The computational problem occurs when the hidden layer output matrix is a not full column rank matrix or an ill-conditioned matrix because of randomly generated input weights and biases. An existing solution to this problem is Singular Value Decomposition (SVD) method. However, the training speed is still affected by the large complexity of SVD when computing the Moore-Penrose (MP) pseudo inverse. The outlier robustness problem may occur when the training data set contaminated with outliers then the accuracy rate of ELM is extremely affected. This paper proposes the Extended Complete Orthogonal Decomposition (ECOD) method to solve the computational problem in ELM weights computing via ECODLS algorithm. And the paper also proposes the other three algorithms, i.e. the iteratively reweighted least squares (IRWLS-ELM), ELM based on the multivariate least-trimmed squares (MLTS-ELM), and ELM based on the one-step reweighted MLTS (RMLTS-ELM) to solve the outlier robustness problem. However, they also encounter the computational problem. Therefore, the ECOD via ECODLS algorithm is also used successfully in the three proposed algorithms. The experiments of regression problems were conducted on both toy and real-world data sets. The outlier types are one-sided and two-sided outliers. Each experiment was randomly contaminated with outliers, of one type only, with 10%, 20%, 30%, 40%, and 50% of the total training data size. Meta-metrics evaluation was used to measure the outlier robustness of the proposed algorithms compared to the existing algorithms, i.e. the minimax probability machine regression (MPMR) and the ordinary ELM. The experimental results showed that ECOD can effectively replace SVD. The ECOD is robust to the not full column rank or the ill-conditional problem. The speed of the ELM training using ECOD is also faster than the ordinary training algorithm. Moreover, the meta-metrics measure showed that the proposed algorithms are less affected by the increasing number of outliers than the existing algorithms. © 2012 Elsevier B.V.','Journal','Article','Neurocomputing','\"[{\\\"$\\\":\\\"Extended Complete Orthogonal Decomposition\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme learning machine\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Iteratively reweighted least squares\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Meta-metrics evaluation\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Minimax probability machine regression\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Moore-Penrose pseudo inverse\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Multivariate least-trimmed squares\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Outlier\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Robustness\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Singular Value Decomposition\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=84870248640&origin=inward',NULL,2013,'102',NULL,195,'31-44','10.1016/j.neucom.2011.12.045','\"This work was partially supported by the Higher Education Research Promotion and National Research University Project of Thailand , Office of the Higher Education Commission , through the Cluster of Research to Enhance the Quality of Basic Education and Department of Computer Science, Faculty of Science, Khon Kaen University . This research is a part of the Computational Science Research Group (COSRG), Faculty of Science, Khon Kaen University (COSRG-SCKKU). We would also thank Mr. James McCloskey for proofreading the manuscript of this paper. KSN would like to thank Prof. C. Lursinsap of AVIC for the discussion.\"',NULL,'2025-03-08 15:46:17','2025-03-08 15:46:20'),(2809,'A comparative study of pseudo-inverse computing for the extreme learning machine classifier','Most feed-forward artificial neural network training algorithms for classification problems are based on an iterative steepest descent technique. Their well-known drawback is slow convergence. A fast solution is an Extreme Learning Machine (ELM) computing the Moore-Penrose inverse using SVD. However, the most significant training time is pseudo-inverse computing. Thus, this paper proposes two fast solutions to pseudo-inverse computing based on QR with pivoting and Fast General Inverse algorithms. They are QR-ELM and GENINV-ELM, respectively. The benchmarks are conducted on 5 standard classification problems, i.e., diabetes, satellite images, image segmentation, forest cover type and sensit vehicle (combined) problems. The experimental results clearly showed that both QR-ELM and GENINV-ELM can speed up the training time of ELM and the quality of their solutions can be compared to that of the original ELM. They also show that QR-ELM is more robust than GENINV-ELM. © 2011 AICIT.','Conference Proceeding','Conference Paper','Proceedings - 3rd International Conference on Data Mining and Intelligent Information Technology Applications, ICMIA 2011','\"[{\\\"$\\\":\\\"Cholesky decomposition\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Extreme Learning Machine (ELM)\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Matrix decomposition\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Moore-Penrose generalized inverse\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"QR decomposition\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Single layer feed-forward neural network\\\",\\\"@xml:lang\\\":\\\"eng\\\"},{\\\"$\\\":\\\"Singular Value Decomposition (SVD)\\\",\\\"@xml:lang\\\":\\\"eng\\\"}]\"','https://www.scopus.com/inward/record.uri?partnerID=HzOxMe3b&scp=84855833197&origin=inward',NULL,2011,NULL,NULL,14,'40-45',NULL,NULL,NULL,'2025-03-08 15:46:17','2025-03-08 15:46:24'),(2810,'Class Diagrams in UML',NULL,'Journal',NULL,'KKU Science Journal',NULL,NULL,NULL,2006,'34',NULL,0,'171-182',NULL,NULL,NULL,'2025-03-08 15:46:19','2025-03-08 15:46:19'),(2811,'กระบวนทัศน์การเขียนโปรแกรมเชิงคำสั่งและเชิงวัตถุ',NULL,'Journal',NULL,'KKU Science Journal',NULL,NULL,NULL,2004,'32',NULL,0,'143-149',NULL,NULL,NULL,'2025-03-08 15:46:19','2025-03-08 15:46:19'),(2812,'Improving butterfly family classification using past separating features extraction in extreme learning machine',NULL,NULL,NULL,'Proceedings of the 2nd International Conference on Intelligent Systems and …, 2014',NULL,'https://scholar.google.com/citations?view_op=view_citation&hl=en&user=00JXDiUAAAAJ&pagesize=100&citation_for_view=00JXDiUAAAAJ:4JMBOYKVnBMC',NULL,2014,NULL,NULL,5,NULL,NULL,NULL,NULL,'2025-03-08 15:46:27','2025-03-08 15:46:27'),(2813,'Applying regularization least squares canonical correlation analysis in extreme learning machine for multi-label classification problems',NULL,NULL,NULL,'Proceedings of ELM-2014 Volume 1: Algorithms and Theories, 377-396, 2015',NULL,'https://scholar.google.com/citations?view_op=view_citation&hl=en&user=00JXDiUAAAAJ&pagesize=100&citation_for_view=00JXDiUAAAAJ:_Qo2XoVZTnwC',NULL,2015,NULL,NULL,4,NULL,NULL,NULL,NULL,'2025-03-08 15:46:28','2025-03-08 15:46:28');
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'user-list','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(2,'user-create','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(3,'user-edit','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(4,'user-delete','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(5,'role-list','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(6,'role-create','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(7,'role-edit','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(8,'role-delete','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(9,'permission-list','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(10,'permission-create','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(11,'permission-edit','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(12,'permission-delete','web','2022-01-31 03:06:41','2022-01-31 03:06:41'),(13,'post-list','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(14,'post-create','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(15,'post-edit','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(16,'post-delete','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(17,'funds-list','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(18,'funds-create','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(19,'funds-edit','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(20,'funds-delete','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(21,'projects-list','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(22,'projects-create','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(23,'projects-edit','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(24,'projects-delete','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(25,'papers-list','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(26,'papers-create','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(27,'papers-edit','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(28,'papers-delete','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(29,'groups-list','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(30,'groups-create','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(31,'groups-edit','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(32,'groups-delete','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(33,'departments-list','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(34,'departments-create','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(35,'departments-edit','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(36,'departments-delete','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(37,'readResearchProject','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(38,'addResearchProject','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(39,'editResearchProject','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(41,'deleteResearchProject','web','2022-02-01 02:34:29','2022-02-01 02:34:29'),(42,'programs-list','web','2022-03-31 15:56:11','2022-03-31 15:56:11'),(43,'programs-edit','web','2022-03-31 15:56:34','2022-03-31 15:56:34'),(44,'programs-create','web','2022-03-31 15:57:07','2022-03-31 15:57:07'),(45,'programs-delete','web','2022-03-31 15:57:20','2022-03-31 15:57:20'),(46,'expertises-create','web','2022-04-03 18:03:09','2022-04-03 18:03:09'),(47,'expertises-delete','web','2022-04-03 18:03:25','2022-04-03 18:03:25'),(48,'expertises-edit','web','2022-04-03 18:03:31','2022-04-03 18:03:31'),(50,'expertises-list','web','2022-04-03 18:29:05','2022-04-03 18:29:05');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `program_name_th` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programs_degree_id_foreign` (`degree_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `programs_degree_id_foreign` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'สาขาวิชาวิทยาการคอมพิวเตอร์','Computer Science',1,1,NULL,'2022-04-20 16:06:31'),(2,'สาขาวิชาเทคโนโลยีสารสนเทศ','Infomation Technology',1,1,NULL,NULL),(3,'สาขาวิชาภูมิสารสนเทศศาสตร์ ','Geo-Informatics',1,1,NULL,NULL),(4,'สาขาวิชาวิทยาการคอมพิวเตอร์และเทคโนโลยีสารสนเทศ','Computer Science and Infomation Technology',2,1,NULL,NULL),(5,'สาขาวิชาวิทยาการข้อมูลและปัญญาประดิษฐ์ หลักสูตรนานาชาติ','Data Science and Artificial Intelligence (International Program)',2,1,NULL,NULL),(6,'สาขาวิชาภูมิสารสนเทศศาสตร์ ','Geo-Informatics',2,1,NULL,NULL),(24,'สาขาวิชาวิทยาการคอมพิวเตอร์และเทคโนโลยีสารสนเทศ หลักสูตรนานาชาติ','Computer Science and Infomation Technology (International Program)',3,1,'2022-04-20 16:06:16','2022-04-20 16:06:16'),(25,'สาขาวิชาภูมิสารสนเทศศาสตร์','Geo-Informatics',3,1,'2022-04-20 16:07:18','2022-04-20 16:07:18');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_groups`
--

DROP TABLE IF EXISTS `research_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_name_th` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_detail_th` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `group_detail_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `group_desc_th` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `group_desc_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `group_image` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_groups`
--

LOCK TABLES `research_groups` WRITE;
/*!40000 ALTER TABLE `research_groups` DISABLE KEYS */;
INSERT INTO `research_groups` VALUES (3,'เทคโนโลยี GIS ขั้นสูง (AGT)','Advanced GIS Technology (AGT)','เพื่อดำเนินการวิจัยและให้บริการวิชาการในสาขาอินเทอร์เน็ต GIS สุขภาพ GIS และแบบจำลองทางอุทกวิทยาด้วย GIS','To conduct research and provide academic services in the fields of Internet, GIS, Health GIS, and Hydrologic modeling with GIS.','เพื่อดำเนินการวิจัยและให้บริการวิชาการในสาขาอินเทอร์เน็ต GIS สุขภาพ GIS และแบบจำลองทางอุทกวิทยาด้วย GIS','To conduct research and provide academic services in the fields of Internet, GIS, Health GIS, and Hydrologic modeling with GIS.','1651386391.jpg','2022-02-26 07:10:44','2022-05-15 07:10:10'),(5,'ห้องปฏิบัติการการคำนวณแบบฉลาดขั้นสูง (ASC)','Advanced Intelligent Computing Laboratory (ASC)','ห้องปฏิบัติการนี้มีจุดมุ่งหมายเพื่อศึกษาและวิจัยเกี่ยวกับเทคโนโลยีอัจฉริยะสำหรับการประมวลผลประสิทธิภาพสูงซึ่งเลียนแบบพฤติกรรมที่ได้รับแรงบันดาลใจจากธรรมชาติ','This laboratory aims to study and research on the smart technology for high performance computing which imitates the nature-inspired behaviors.','ห้องปฏิบัติการนี้มีจุดมุ่งหมายเพื่อศึกษาและวิจัยเกี่ยวกับเทคโนโลยีอัจฉริยะสำหรับการประมวลผลประสิทธิภาพสูงซึ่งเลียนแบบพฤติกรรมที่ได้รับแรงบันดาลใจจากธรรมชาติ','This laboratory aims to study and research on the smart technology for high performance computing which imitates the nature-inspired behaviors.','1651386384.jpg','2022-03-05 09:53:27','2022-05-15 07:08:25'),(8,'ห้องปฏิบัติการวิจัย ระบบอัจฉริยะและการเรียนรู้เครื่อง (MLIS)','Intelligent Systems and Machine Learning Research Laboratory (MLIS)','วัตถุประสงค์หลักของโครงการนี้คือการทำวิจัยและสร้างความรู้ใหม่เกี่ยวกับการเรียนรู้ของเครื่องและระบบอัจฉริยะตลอดจนการใช้งาน','The main purpose of this project is to conduct research and build new knowledge concerning machine learning and intelligent systems as well as their applications.','วัตถุประสงค์หลักของโครงการนี้คือการทำวิจัยและสร้างความรู้ใหม่เกี่ยวกับการเรียนรู้ของเครื่องและระบบอัจฉริยะตลอดจนการใช้งาน','The main purpose of this project is to conduct research and build new knowledge concerning machine learning and intelligent systems as well as their applications.','1651386369.jpg','2022-03-05 09:59:08','2022-05-15 07:08:01'),(9,'ห้องปฎิบัติการประมวลผลภาษาธรรมชาติและการประมวลผลด้านเสียง (NLSP)','Natural Language Processing and Sound Processing Laboratory (NLSP)','จุดมุ่งหมายหลักของโครงการนี้คือ การวิจัยเกี่ยวกับภาษาธรรมชาติและการประมวลผลเสียงพูดในระบบคอมพิวเตอร์ ระบบแทนสเลชันด้วยเครื่อง ระบบคอมพิวเตอร์สังเคราะห์เสียงพูดและการรู้จำเสียง การรู้จำอักขระและการค้นหาข้อมูล การสร้างและพัฒนาระบบการทำงานเพื่อบูรณาการทางธรรมชาติ การประมวลผลภาษาและคำพูดด้วยระบบงานทางธุรกิจและเพื่อสร้างผลงานทางวิชาการเกี่ยวกับการประมวลผลตามธรรมชาติ','The main aims of this project are to conduct research concerning natural language and speech processing in the computer system, Machine Tanslation system, Speech Synthesis and Speech Recognition computer system, Char- acter Recognition and information searching, construction and development of working system to integrate natural language and speech processing with business work system,and to create academic works on natural processing.','จุดมุ่งหมายหลักของโครงการนี้คือ การวิจัยเกี่ยวกับภาษาธรรมชาติและการประมวลผลเสียงพูดในระบบคอมพิวเตอร์ ระบบแทนสเลชันด้วยเครื่อง ระบบคอมพิวเตอร์สังเคราะห์เสียงพูดและการรู้จำเสียง การรู้จำอักขระและการค้นหาข้อมูล การสร้างและพัฒนาระบบการทำงานเพื่อบูรณาการทางธรรมชาติ การประมวลผลภาษาและคำพูดด้วยระบบงานทางธุรกิจและเพื่อสร้างผลงานทางวิชาการเกี่ยวกับการประมวลผลตามธรรมชาติ','The main aims of this project are to conduct research concerning natural language and speech processing in the computer system, Machine Tanslation system, Speech Synthesis and Speech Recognition computer system, Char- acter Recognition and information searching, construction and development of working system to integrate natural language and speech processing with business work system,and to create academic works on natural processing.','1651386363.jpg','2022-03-05 10:03:41','2022-05-15 07:07:51'),(10,'ปัญญาประยุกต์และการวิเคราะห์ข้อมูล (AIDA)','Applied Intelligence and Data Analytics (AIDA)','ห้องปฏิบัติการวิจัยนี้รวบรวมสาขาการวิจัยแบบสหวิทยาการ เช่น Data Science & Data Analytics, Data Mining, Text Mining, Opinion Mining, Business Intelligence, ERP System, IT Management, Semantic Web, Sentiment Analysis, Image Processing, Ubiquitous Learning, Blended Learning และ Bioinformatics.','This research lab brings together interdisciplinary research fields, such as, Data Science & Data Analytics, Data Mining, Text Mining, Opinion Mining, Business Intelligence, ERP System, IT Management, Semantic Web, Sentiment Analysis, Image Processing, Ubiquitous Learning, Blended Learning, and Bioinformatics.','ห้องปฏิบัติการวิจัยนี้รวบรวมสาขาการวิจัยแบบสหวิทยาการ เช่น Data Science & Data Analytics, Data Mining, Text Mining, Opinion Mining, Business Intelligence, ERP System, IT Management, Semantic Web, Sentiment Analysis, Image Processing, Ubiquitous Learning, Blended Learning และ Bioinformatics.','This research lab brings together interdisciplinary research fields, such as, Data Science & Data Analytics, Data Mining, Text Mining, Opinion Mining, Business Intelligence, ERP System, IT Management, Semantic Web, Sentiment Analysis, Image Processing, Ubiquitous Learning, Blended Learning, and Bioinformatics.','1651386357.jpg','2022-03-05 11:20:32','2022-05-15 07:07:40');
/*!40000 ALTER TABLE `research_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_projects`
--

DROP TABLE IF EXISTS `research_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_start` date DEFAULT NULL,
  `project_end` date DEFAULT NULL,
  `project_year` year DEFAULT NULL,
  `budget` int DEFAULT NULL,
  `responsible_department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL,
  `fund_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fund_id` (`fund_id`),
  CONSTRAINT `projects_fund_id_foreign` FOREIGN KEY (`fund_id`) REFERENCES `funds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_projects`
--

LOCK TABLES `research_projects` WRITE;
/*!40000 ALTER TABLE `research_projects` DISABLE KEYS */;
INSERT INTO `research_projects` VALUES (16,'Statistical Thai – Isarn Dialect Machine Translation System using Parallel Corpus',NULL,NULL,2019,80000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,2,'2022-05-04 12:29:48','2022-05-04 12:29:48'),(20,'นวัตกรรมดัชนีสุขภาพของประชากรไทยโดยวิทยาการข้อมูลเพื่อประโยชน์ในการปรับเปลี่ยนพฤติกรรมและติดตามสภาวะสุขภาพก่อนการเกิดโรค',NULL,NULL,2017,1000000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,4,'2022-05-04 13:24:16','2022-05-04 13:24:16'),(21,'Morphological analysis for edible mushrooms using artificial neural networks ANN Model',NULL,NULL,2019,100000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,5,'2022-05-08 06:21:44','2022-05-08 06:21:44'),(22,'Ontology-based Learning data integration using ontology mapping and a rules based reasoning approach',NULL,NULL,2019,100000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,6,'2022-05-08 06:23:11','2022-05-08 06:23:11'),(23,'การศึกษาแนวทางในการวิเคราะห์ประสิทธิภาพของระบบการวางแผนทรัพยากรองค์กร',NULL,NULL,2018,80000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,7,'2022-05-08 06:25:01','2022-05-08 06:25:01'),(24,'การออกแบบและพัฒนาระบบการเรียนรู้การเขียนโปรแกรมแบบคู่ด้วยอาลิซ',NULL,NULL,2018,60000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,8,'2022-05-08 06:28:00','2022-05-08 06:28:00'),(25,'การพัฒนาต้นแบบเพื่อการวิเคราะห์ประสิทธิภาพของระบบการวางแผนทรัพยากรองค์กร',NULL,NULL,2017,80000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,9,'2022-05-08 06:31:40','2022-05-08 06:31:40'),(26,'วิธีการปรับโดเมนโดยใช้เซลลูลาร์ออโตมาตาสำหรับวิทัศน์คอมพิวเตอร์',NULL,NULL,2016,100000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,10,'2022-05-08 06:32:47','2022-05-08 06:32:47'),(27,'การเพิ่มความทนทานให้ตัวแบบเอ็กซ์ทรีมออนไลน์ตามลำดับ',NULL,NULL,2016,100000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,11,'2022-05-08 06:33:52','2022-05-08 06:33:52'),(28,'ระบบวัดดัชนีประสิทธิผลใน การจัดการเรียนรู้แบบผสมผสานที่ใช้สื่อความเป็นจริงเสริมในการสอน โดยมีเว็บเป็นฐาน',NULL,NULL,2016,80000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,12,'2022-05-08 06:35:25','2022-05-08 06:35:25'),(29,'โครงการการพัฒนาระบบฐานข้อมูลภูมิสารสนเทศยางนาใน จังหวัดขอนแก่น','2016-06-01','2017-09-15',2016,300000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,13,'2022-05-08 06:37:40','2022-05-08 06:45:59'),(30,'โครงการ',NULL,NULL,2015,230484,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,14,'2022-05-15 05:04:51','2022-05-15 05:04:51'),(32,'การจัดอบรมหลักสูตรประกาศนียบัตร (Non-Degree) โครงการพัฒนาทักษะกำลังคนของประเทศ (Reskill/Upskill/Newskill) เพื่อการมีงานทำและเตรียมความพร้อมรองรับการทำงานในอนาคตหลังวิกฤตการระบาดของไวรัสโคโรนา 2019 (COVID-19)','2020-08-01','2020-08-19',2020,90000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,15,'2022-05-15 06:07:16','2022-05-15 06:07:16'),(33,'อุปกรณ์ประเมินความเครียดพร้อมปัญญาประดิษฐ์สำหรับการประเมินโรคซึมเศร้า (Stress assessment devices with artificial intelligence for depression disorder assessment)','2019-02-01','2021-07-31',2019,6633000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,16,'2022-05-15 06:14:56','2022-05-15 06:14:56'),(34,'รูปแบบเทคโนโลยีฉลาดสำหรับสังคมสูงวัยสุขภาพดี (Smart technology for healthy aging society)','2020-10-01','2020-08-31',2019,8000000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,17,'2022-05-15 06:19:40','2022-05-15 06:19:40'),(35,'ดัชนีความเยาว์วัยของร่างกายแบบองค์รวมจากปัญญาประดิษฐ์ข้อมูลสุขภาพ (Youth Index from Health Artificial Intelligence)',NULL,NULL,2018,5000000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,18,'2022-05-15 06:24:02','2022-05-15 06:24:02'),(36,'ERASMUS+ : Curriculum Development in Data Science and Artificial Intelligence/DS&AI',NULL,NULL,2018,2453555,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,19,'2022-05-15 06:29:08','2022-05-15 06:29:08'),(37,'“เครือข่ายวิจัยเทคโนโลยีทันสมัยของเครือข่ายอันชาญฉลาดที่แพร่หลาย” (Pervasive inteLligent and Network Emerging Technology (PLANET))',NULL,NULL,2018,10000000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,20,'2022-05-15 06:30:38','2022-05-15 06:30:38'),(38,'โครงการจัดการพลังงานที่มีประสิทธิภาพ ในเครือข่ายเซ็นเซอร์ไร้สายแบบเติมได้',NULL,NULL,2018,1500000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,21,'2022-05-15 06:32:14','2022-05-15 06:32:14'),(39,'ERASMUS+ : Innovation on Remote Sensing Education and Learning','2017-10-15','2020-09-30',2017,5234131,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,22,'2022-05-15 06:36:18','2022-05-15 06:36:18'),(40,'การพัฒนาระบบเซนเซอร์อัตโนมัติสำหรับสภาวะแวดล้อมภายในโรงเรือนและปรับปรุงการชั่งน้ำหนักอัตโนมัติสำหรับฟาร์มไก่อัจฉริยะ',NULL,NULL,2017,1617080,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,21,'2022-05-15 06:38:22','2022-05-15 06:38:22'),(41,'โครงการระบบภูมิสารสนเทศโรคพยาธิใบไม้ตับและมะเร็งท่อน้ำดีภาคตะวันออกเฉียงเหนือ ประเทศไทย','2016-11-01','2018-10-01',2017,5000000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,25,'2022-05-15 06:40:33','2022-05-15 06:40:33'),(42,'รูปแบบเทคโนโลยีฉลาดและระบบนิเวศชุมชนครบวงจรเพื่อสังคมสูงวัยสุขภาพดี (โครงการมณี) ระยะที่ 1 (Ma-Nee Smart Technology and Ecosystems for Healthy Aging Community, Phase I)',NULL,NULL,2017,10000000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,26,'2022-05-15 06:42:08','2022-05-15 06:42:08'),(43,'การพัฒนานวัตกรรมปัญญาประดิษฐ์อัจฉริยะเพื่อทำนายภาวะสุขภาพและภาวะที่ต้องได้รับการดูแลฉุกเฉินในผู้สูงอายุและผู้ป่วยโรคเรื้อรัง (Medical Artificial Intelligence System for Prediction of Health Status and Emergency Alert in Elderly and Patient with Chronic Diseases)',NULL,NULL,2017,1600000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,27,'2022-05-15 06:44:12','2022-05-15 06:44:12'),(44,'โครงการความฉลาดของเครื่องและการประยุกต์กับปัญหาที่เกิดใหม่ในกลุ่มทุกสิ่งเชื่อมต่อกับอินเทอร์เน็ตและการวิเคราะห์ด้านชีวการแพทย์',NULL,NULL,2017,1620000,'สาขาวิชาวิทยาการคอมพิวเตอร์',NULL,3,28,'2022-05-15 06:45:23','2022-05-15 06:45:23');
/*!40000 ALTER TABLE `research_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(50,1),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(25,3),(26,3),(27,3),(31,3),(17,4),(18,4),(19,4),(21,4),(22,4),(23,4),(25,4),(29,4),(30,4),(31,4),(33,4),(34,4),(35,4),(36,4),(37,4),(38,4),(39,4),(42,4),(43,4),(44,4),(45,4),(17,5),(18,5),(19,5),(20,5),(21,5),(22,5),(23,5),(24,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2022-01-31 03:06:42','2022-01-31 03:06:42'),(2,'teacher','web',NULL,NULL),(3,'student','web','2022-03-31 15:14:52','2022-03-31 15:14:52'),(4,'staff','web','2022-03-31 16:57:10','2022-03-31 16:57:10'),(5,'headproject','web','2022-04-29 05:52:46','2022-04-29 05:53:03');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_data`
--

DROP TABLE IF EXISTS `source_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `source_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_data`
--

LOCK TABLES `source_data` WRITE;
/*!40000 ALTER TABLE `source_data` DISABLE KEYS */;
INSERT INTO `source_data` VALUES (1,'Scopus','2022-01-31 03:06:42','2022-01-31 03:06:42'),(2,'Web Of Science','2022-01-31 03:06:42','2022-01-31 03:06:42'),(3,'TCI','2022-01-31 03:06:42','2022-01-31 03:06:42'),(4,'Google Scholar','2022-01-31 03:06:42','2022-01-31 03:06:42');
/*!40000 ALTER TABLE `source_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_papers`
--

DROP TABLE IF EXISTS `source_papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_papers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `source_data_id` bigint unsigned NOT NULL,
  `paper_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `source_papers_source_data_id_foreign` (`source_data_id`),
  KEY `source_papers_paper_id_foreign` (`paper_id`),
  CONSTRAINT `source_papers_paper_id_foreign` FOREIGN KEY (`paper_id`) REFERENCES `papers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `source_papers_source_data_id_foreign` FOREIGN KEY (`source_data_id`) REFERENCES `source_data` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_papers`
--

LOCK TABLES `source_papers` WRITE;
/*!40000 ALTER TABLE `source_papers` DISABLE KEYS */;
INSERT INTO `source_papers` VALUES (6093,1,2787),(6094,1,2788),(6095,1,2789),(6096,1,2790),(6097,1,2791),(6098,1,2792),(6099,1,2793),(6100,1,2794),(6101,1,2795),(6102,1,2796),(6103,1,2797),(6104,1,2798),(6105,1,2799),(6106,1,2800),(6107,1,2801),(6108,1,2802),(6109,1,2803),(6110,1,2804),(6111,1,2805),(6112,1,2806),(6113,1,2807),(6114,1,2808),(6115,1,2809),(6116,3,2810),(6117,3,2811),(6118,4,2812),(6119,4,2813);
/*!40000 ALTER TABLE `source_papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cited_year`
--

DROP TABLE IF EXISTS `user_cited_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cited_year` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `cited_year` int DEFAULT NULL,
  `cited_count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cited_user_id_idx` (`user_id`),
  CONSTRAINT `cited_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cited_year`
--

LOCK TABLES `user_cited_year` WRITE;
/*!40000 ALTER TABLE `user_cited_year` DISABLE KEYS */;
INSERT INTO `user_cited_year` VALUES (1,6,2013,7),(2,6,2014,20),(3,6,2015,39),(4,6,2016,34),(5,6,2017,38),(6,6,2018,43),(7,6,2019,56),(8,6,2020,43),(9,6,2021,47),(10,6,2022,47),(11,6,2023,45),(12,6,2024,35),(13,6,2025,5),(14,6,2013,7),(15,6,2014,20),(16,6,2015,39),(17,6,2016,34),(18,6,2017,38),(19,6,2018,43),(20,6,2019,56),(21,6,2020,43),(22,6,2021,47),(23,6,2022,47),(24,6,2023,45),(25,6,2024,35),(26,6,2025,5);
/*!40000 ALTER TABLE `user_cited_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_of_academicworks`
--

DROP TABLE IF EXISTS `user_of_academicworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_of_academicworks` (
  `user_id` bigint unsigned NOT NULL,
  `author_type` int DEFAULT NULL,
  `academicwork_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_of_academicworks_user_id_foreign` (`user_id`),
  KEY `user_of_academicworks_academicwork_id_foreign` (`academicwork_id`),
  CONSTRAINT `user_of_academicworks_academicwork_id_foreign` FOREIGN KEY (`academicwork_id`) REFERENCES `academicworks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_of_academicworks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_of_academicworks`
--

LOCK TABLES `user_of_academicworks` WRITE;
/*!40000 ALTER TABLE `user_of_academicworks` DISABLE KEYS */;
INSERT INTO `user_of_academicworks` VALUES (5,NULL,14,6),(6,NULL,15,7),(7,NULL,16,8),(8,NULL,17,9),(8,NULL,18,10),(9,NULL,19,11),(10,NULL,20,12),(10,NULL,21,13),(10,NULL,22,14),(13,NULL,23,15),(13,NULL,24,16),(13,NULL,25,17),(14,NULL,26,18),(14,NULL,27,19),(14,NULL,28,20),(16,NULL,29,21),(16,NULL,30,22),(17,NULL,31,23),(19,NULL,32,24),(22,NULL,33,25),(25,NULL,34,26),(25,NULL,35,27),(34,NULL,36,28),(16,1,37,29),(34,1,39,31),(34,1,40,34),(22,1,41,35),(22,1,42,36),(22,1,43,37),(21,1,44,38),(20,1,45,39),(3,1,47,41),(3,1,49,46),(3,1,50,47),(18,1,51,48),(18,1,52,49),(18,1,53,50),(16,1,54,51),(16,1,56,53),(16,1,55,54),(16,1,57,55),(10,1,58,56),(10,1,59,57),(10,1,60,58),(10,1,61,59),(34,1,62,60),(16,1,63,61),(16,1,64,62),(4,1,65,63),(8,1,66,64),(16,1,67,65),(16,1,68,66),(34,1,69,67),(10,1,70,68),(10,1,71,69),(10,1,72,70),(10,1,73,71),(21,1,74,72),(16,1,75,73);
/*!40000 ALTER TABLE `user_of_academicworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_papers`
--

DROP TABLE IF EXISTS `user_papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_papers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `paper_id` bigint unsigned NOT NULL,
  `author_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_papers_user_id_foreign` (`user_id`) USING BTREE,
  KEY `user_papers_paper_id_foreign` (`paper_id`) USING BTREE,
  CONSTRAINT `user_papers_paper_id_foreign` FOREIGN KEY (`paper_id`) REFERENCES `papers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_papers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4800 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_papers`
--

LOCK TABLES `user_papers` WRITE;
/*!40000 ALTER TABLE `user_papers` DISABLE KEYS */;
INSERT INTO `user_papers` VALUES (4736,16,2787,2),(4737,6,2787,3),(4738,6,2788,2),(4739,9,2788,3),(4740,6,2789,2),(4741,9,2789,3),(4742,6,2790,2),(4743,16,2790,3),(4744,6,2791,3),(4745,152,2792,1),(4746,6,2792,2),(4747,151,2792,3),(4748,6,2793,2),(4749,9,2793,3),(4750,152,2794,1),(4751,6,2794,2),(4752,151,2794,2),(4753,9,2794,3),(4754,151,2795,1),(4755,9,2795,2),(4756,152,2795,2),(4757,6,2795,2),(4758,8,2795,3),(4759,6,2796,2),(4760,151,2796,2),(4761,152,2796,3),(4762,6,2797,3),(4763,151,2798,1),(4764,9,2798,2),(4765,8,2798,2),(4766,6,2798,2),(4767,152,2798,3),(4768,6,2799,3),(4769,8,2800,2),(4770,9,2800,2),(4771,151,2800,2),(4772,6,2800,3),(4773,8,2801,2),(4774,9,2801,2),(4775,151,2801,2),(4776,6,2801,3),(4777,6,2802,1),(4778,8,2802,2),(4779,9,2802,3),(4780,6,2803,3),(4781,6,2804,3),(4782,152,2805,1),(4783,6,2805,3),(4784,6,2806,3),(4785,6,2807,2),(4786,9,2807,2),(4787,8,2807,2),(4788,6,2808,1),(4789,8,2808,2),(4790,9,2808,3),(4791,6,2809,1),(4792,8,2809,2),(4793,9,2809,3),(4794,6,2810,NULL),(4795,6,2811,NULL),(4796,6,2812,NULL),(4797,152,2813,1),(4798,6,2813,2),(4799,9,2813,3);
/*!40000 ALTER TABLE `user_papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname_th` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname_th` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctoral_degree` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_ranks_en` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_ranks_th` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_en` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_th` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_name_th` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_name_en` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `program_id` bigint unsigned DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_scholar_id` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `users_program_id_foreign` (`program_id`) USING BTREE,
  CONSTRAINT `users_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com',NULL,'$2y$10$nrI/W9tolkEdeA8N21TECOmr06MgEbr8q6lN2duMxn5PaHBsnt7Ci','admin','-','ผู้ดูแลระบบ','-',NULL,NULL,NULL,NULL,NULL,'นาย','Mr.','UIMG_202203296242bbe5c8689.jpg',0,NULL,1,NULL,'2022-01-31 03:06:42','2022-05-01 15:41:57',NULL),(2,'ngamnij@kku.ac.th',NULL,'$2y$10$3VzoHQXXQlsMNF0hxuY.JeemtM1EUpJC2YWTKlqV9dP3Tl3wcwhJq','Ngamnij','Arch-int','งามนิจ','อาจอินทร์','Ph.D.','Associate Professor','รองศาสตราจารย์','Assoc. Prof. Dr.','รศ.ดร.','นาง','Mrs.','UIMG_20220501626e51e056dd9.jpg',0,NULL,2,NULL,'2022-02-01 11:52:35','2022-05-01 16:24:48',NULL),(3,'chakso@kku.ac.th',NULL,'$2y$10$NY/HwFcQfL80AV7Lg2dVNew2YNY39ZWoP/DjbE0iZEZuO.X.Er55a','Chakchai','So-In','จักรชัย','โสอินทร์','Ph.D.','Associate Professor','รองศาสตราจารย์','Assoc. Prof. Dr.','รศ.ดร.','นาย','Mr.','UIMG_20220501626e2980847fa.jpg',0,NULL,2,NULL,'2022-02-01 11:52:36','2022-05-01 13:32:32',NULL),(4,'somjit@kku.ac.th',NULL,'$2y$10$VLo1ptYZiXRpwGSfPfLXwekJu/KDflul0P0Havd6jd9tsMg8DeRYC','Somjit','Arch-int','สมจิตร','อาจอินทร์','Ph.D.','Associate Professor','รองศาสตราจารย์','Assoc. Prof. Dr.','รศ.ดร.','นาย','Mr.','Somjit.jpg',0,NULL,2,NULL,'2022-02-01 11:52:36','2022-02-01 11:52:36',NULL),(5,'chaiyapon@kku.ac.th',NULL,'$2y$10$HBWg2AQIgFCE447R9eQnSOj22IbDbc1rCwgHjpDRXkxMjFTenF6GC','Chaiyapon','Keeratikasikorn','ชัยพล','กีรติกสิกร','Ph.D.','Associate Professor','รองศาสตราจารย์','Assoc. Prof. Dr.','รศ.ดร.','นาย','Mr.','UIMG_20220501626e31154570f.jpg',0,NULL,3,NULL,'2022-02-01 11:52:36','2022-05-01 14:04:53',NULL),(6,'punhor1@kku.ac.th',NULL,'$2y$10$apfvn7nchbetMKpiZvycQ.oHLnEEt/oh0/3godLz4T72AAqv/YYpm','Punyaphol','Horata','ปัญญาพล','หอระตะ','Ph.D.','Associate Professor','รองศาสตราจารย์','Assoc. Prof. Dr.','รศ.ดร.','นาย','Mr.','UIMG_20220407624e7e943c5cd.jpg',1,NULL,1,NULL,'2022-02-01 11:52:36','2025-02-22 08:41:54','00JXDiUAAAAJ'),(7,'wongsar@kku.ac.th',NULL,'$2y$10$/Ehw6gvhl5qdde/YrW1II.YMQ18LZZwUGVjdJ0NJexdlkAFYXH8fC','Sartra','Wongthanavasu','ศาสตรา','วงศ์ธนวสุ','Ph.D.','Professor','ศาสตราจารย์','Prof. Dr.','ศ.ดร.','นาย','Mr.','UIMG_20220501626e3428e04a5.jpg',0,NULL,1,NULL,'2022-02-01 11:52:36','2022-05-01 14:18:00',NULL),(8,'sunkra@kku.ac.th',NULL,'$2y$10$c05Ozs3UCjtrNFRtQoMVAu2ZwFopfehohFW4mw9NfhYOVfnddREXa','Sirapat','Chiewchanwattana','สิรภัทร','เชี่ยวชาญวัฒนา','Ph.D.','Associate Professor','รองศาสตราจารย์','Assoc. Prof. Dr.','รศ.ดร.','นาง','Mrs.','UIMG_20220501626e51a4f33be.jpg',0,NULL,1,NULL,'2022-02-01 11:52:36','2022-05-01 16:23:49',NULL),(9,'skhamron@kku.ac.th',NULL,'$2y$10$6CRhXm7BX53KWSlCLKriXei7qg7CFFIawhrKQPid9u5te9RvgpN/i','Khamron','Sunat','คำรณ','สุนัติ','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นาย','Mr.','UIMG_20220501626e5173a8e05.jpg',0,NULL,1,NULL,'2022-02-01 11:52:36','2022-05-01 16:22:59',NULL),(10,'chitsutha@kku.ac.th',NULL,'$2y$10$heItHIMc4rUYiH7LyvASXeJtXsDXkCe.0bVe3Qy8bKC1ug0JOcULa','Chitsutha','Soomlek','ชิตสุธา','สุ่มเล็ก','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นางสาว','Miss','UIMG_20220501626e36d5756d1.jpg',0,NULL,1,NULL,'2022-02-01 11:52:36','2022-05-01 14:29:25',NULL),(11,'nagon@kku.ac.th',NULL,'$2y$10$s3jKoRZR7aG8RAe2dUPffOm2bWq3l81SyCyP1qqq2YcWHj2lW.ki.','Nagon','Watanakij','ณกร','วัฒนกิจ','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นาย','Mr.','UIMG_20220501626e52e51a74a.jpg',0,NULL,3,NULL,'2022-02-01 11:52:36','2022-05-01 16:29:09',NULL),(13,'Boonsup@kku.ac.th',NULL,'$2y$10$fqEpfJHRBvHv8VJBvdPp5.mxIALGjJuxAKhBTbiLBghXMXlDPi9Tq','Boonsup','Waikham','บุญทรัพย์','ไวคำ',NULL,'Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof.','ผศ.','นาย','Mr.','Boonsup.jpg',0,NULL,1,NULL,'2022-02-01 11:55:56','2022-02-01 11:55:56',NULL),(14,'wpaweena@kku.ac.th',NULL,'$2y$10$pihLxY7LD3Q9yGzqAWVICe7xT8UO2.15zj6CnocLtxENnrj2YgS5G','Paweena','Wanchai','ปวีณา','วันชัย','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นางสาว','Miss','UIMG_20220501626e3ec5eea80.jpg',0,NULL,2,NULL,'2022-02-01 11:55:56','2022-05-01 15:03:18',NULL),(15,'reungsang@kku.ac.th',NULL,'$2y$10$4NxYLYLEc46EvJRNCFoSQeJDMSDBywWl3Doh5U.AeKAtvYZXGPyoO','Pipat','Reungsang','พิพัธน์','เรืองแสง','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นาย','Mr.','UIMG_20220501626e40af16b44.jpg',0,NULL,3,NULL,'2022-02-01 11:55:56','2022-05-01 15:11:27',NULL),(16,'pusadee@kku.ac.th',NULL,'$2y$10$DOZApM5RDiOU8Y6drhSFIORa5o0IBaxc7ErW6cfF5nnqRcdla/40W','Pusadee','Seresangtakul','พุธษดี','ศิริแสงตระกูล','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นางสาว','Miss','UIMG_202204206260102f34a52.jpg',0,NULL,1,NULL,'2022-02-01 11:55:56','2025-02-21 15:32:04','E01V5gUAAAAJ'),(17,'monlwa@kku.ac.th',NULL,'$2y$10$xNNcC57VbSoz7FvYADkcs.6IVSYFsz51FZsMcrGJ4jmCjH5LtOoPO','Monlica','Wattana','มัลลิกา','วัฒนะ','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นางสาว','Miss','UIMG_20220501626e420b6d56b.jpg',0,NULL,2,NULL,'2022-02-01 11:55:56','2022-05-01 15:17:15',NULL),(18,'wararat@kku.ac.th',NULL,'$2y$10$.Xqn0ho63PEmdAmya6erXe37inHcU/egirN9ODk47z3aJ0sWOffnS','Wararat','Songpan','วรารัตน์','สงฆ์แป้น','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นาง','Mrs.','UIMG_20220501626e43cb68e99.jpg',0,NULL,2,NULL,'2022-02-01 11:55:56','2022-05-01 15:24:43',NULL),(19,'sunti@kku.ac.th',NULL,'$2y$10$Sbme7QlIrU4mRFlcR8Q.1es3sGINNrk4W4yZ9AFsoxa9qh2FYfPtS','Sunti','Tintanai','สันติ','ทินตะนัย',NULL,'Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof.','ผศ.','นาย','Mr.','UIMG_20220501626e452810ce9.jpg',0,NULL,1,NULL,'2022-02-01 11:55:56','2022-05-01 15:30:32',NULL),(20,'saiyan@kku.ac.th',NULL,'$2y$10$Bun4OTYENC5haD1ItEcPQe6Fax8HSa6Kqv/qjovHGP/kVTglagwj.','Saiyan','Saiyod','สายยัญ','สายยศ','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นาย','Mr.','UIMG_20220501626e525e24ac0.jpg',0,NULL,2,NULL,'2022-02-01 11:55:56','2022-05-01 16:26:54',NULL),(21,'silain@kku.ac.th',NULL,'$2y$10$/OOD2/DSMVrZjxCV4Y/WZOYoO8ufUUVSAFHLe/8TkRsDxWvRtOZZa','Silada','Intarasothonchun','สิลดา','อินทรโสธรฉันท์','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นางสาว','Miss','UIMG_20220501626e4f3782280.jpg',1,NULL,1,NULL,'2022-02-01 11:55:56','2022-05-01 16:13:27',NULL),(22,'urachart@kku.ac.th',NULL,'$2y$10$FENhdLMPALl0q9MVECvM.e51SN3V6LlmWg13Zp7aNFX1GERoL3etS','Urachart','Kokaew','อุรฉัตร','โคแก้ว','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นาง','Mrs.','UIMG_20220501626e4864317aa.jpg',0,NULL,1,NULL,'2022-02-01 11:55:56','2022-05-01 15:44:20',NULL),(23,'curawa@kku.ac.th',NULL,'$2y$10$0h0gqoogCAcKvHSr5nu7ZuWnxnzsGTk5QUm3choBOCOtvqYK22iMm','Urawan','Chanket','อุราวรรณ','จันทร์เกษ','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นางสาว','Miss','UIMG_20220501626e48efa5ee0.jpg',0,NULL,3,NULL,'2022-02-01 11:55:56','2022-05-01 15:46:39',NULL),(24,'phetim@kku.ac.th',NULL,'$2y$10$eTdVCLnoPHvZFzvCzcJDnOjBjz1Fw.1XJScJKadwj.jCNYl6w8BIS','Phet','Aimtongkham','เพชร','อิ่มทองคำ','Ph.D.','Lecturer','อาจารย์','Lecturer','อ.ดร.','นาย','Mr.','UIMG_20220501626e493cb6200.jpg',0,NULL,2,NULL,'2022-02-01 11:55:56','2022-05-01 15:47:56',NULL),(25,'twachi@kku.ac.th',NULL,'$2y$10$E7rx0jbcpOgdbV8YdGfEuOKtujynoWtaUPpU3sZ12f8tHHPYdB1pO','Wachirawut','Thamviset','วชิราวุธ','ธรรมวิเศษ','Ph.D.','Lecturer','อาจารย์','Lecturer','อ.ดร.','นาย','Mr.','UIMG_20220501626e497c45cd1.jpg',0,NULL,1,NULL,'2022-02-01 11:55:56','2022-05-01 15:49:00',NULL),(26,'waruwu@kku.ac.th',NULL,'$2y$10$usNK/3pTwJceUEOc4KrFoO9MuOwdiD/887U2BxhJGs9lDwW6zHpP2','Warunya','Wunnasri','วรัญญา','วรรณศรี','Ph.D.','Lecturer','อาจารย์','Lecturer','อ.ดร.','นางสาว','Miss','UIMG_20220501626e4a3ada88e.jpg',0,NULL,2,NULL,'2022-02-01 11:55:56','2022-05-01 15:52:10',NULL),(27,'rapassit@kku.ac.th',NULL,'$2y$10$M89gMtkKu5YhD384R39GBuN4B5/d6sSbajbbWY7ovp7B5qDRSPgwW','Rapassit','Chinnapatjee','รภัสสิทธิ์','ชินภัทรจีรัสถ์','Ph.D.','Lecturer','อาจารย์','Lecturer','อ.ดร.','นาย','Mr.','Rapassit.jpg',0,NULL,2,NULL,'2022-02-01 11:55:56','2022-02-01 11:55:56',NULL),(28,'sakpod@kku.ac.th',NULL,'$2y$10$1zIzwxKbnj7YuOd4kA87T.h5UHSh0lAuW25E2tJT9trZlxy5RL1e2','Sakpod','Tongleamnak','ศักดิ์พจน์','ทองเลี่ยมนาค','Ph.D.','Lecturer','อาจารย์','Lecturer','อ.ดร.','นาย','Mr.','UIMG_20220501626e4efc9bc44.jpg',0,NULL,3,NULL,'2022-02-01 11:55:57','2022-05-01 16:12:28',NULL),(29,'thanaphon@kku.ac.th',NULL,'$2y$10$4Nsa5HgznCYlJfxaGCeR6umdWFIkdEZVMdI/deZ/XE6ioKBRyF/r2','Thanaphon','Tangchoopong','ธนพล','ตั้งชูพงศ์',NULL,'Lecturer','อาจารย์','Lecturer','อ.','นาย','Mr.','UIMG_20220501626e4c03d2e6a.jpg',0,NULL,1,NULL,'2022-02-01 11:55:57','2022-05-01 15:59:47',NULL),(30,'sarunap@kku.ac.th',NULL,'$2y$10$Tlr5glAocjeyWikzZ4wWT.edUAU4Mt0YwhHnD9luWKvj1WERrNAgi','Sarun','Apichontrakul','ศรัณย์','อภิชนตระกูล',NULL,'Lecturer','อาจารย์','Lecturer','อ.','นาย','Mr.','UIMG_20220501626e4ba7a1318.jpg',0,NULL,3,NULL,'2022-02-01 11:55:57','2022-05-01 15:58:15',NULL),(31,'rasamee@kku.ac.th',NULL,'$2y$10$jmcUK/k2S3rmbExHyWtPNu5vd3CG4Kuca/XgNeeY3eFxy1T38fdsO','Rasamee','Suwanwerakamtorn','รัศมี','สุวรรณวีระกำธร','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นาง','Mrs.','UIMG_20220501626e4c511a55e.jpg',0,NULL,3,NULL,'2022-02-01 11:55:57','2022-05-01 16:01:05',NULL),(32,'chanode@kku.ac.th',NULL,'$2y$10$d.0iFLezDCN4x4VyW5ooWeYPgp3G.yOv1dh6VCO3242Tjn.m4Gd/W','Chanon','Dechsupa','ชานนท์','เดชสุภา',NULL,'Lecturer','อาจารย์','Lecturer','อ.','นาย','Mr.','UIMG_20220501626e4cd51ce25.jpg',0,NULL,2,NULL,'2022-02-01 11:55:57','2022-05-01 16:03:17',NULL),(33,'praipa@kku.ac.th',NULL,'$2y$10$R1.ftjez0vfqniI.HxKOAuZ9YzIeNod27WLyvpIpCxac6p.XkP8Fq','Praisan','Padungweang','ไพรสันต์','ผดุงเวียง','Ph.D.','Lecturer','อาจารย์','Lecturer','อ.ดร.','นาย','Mr.','UIMG_20220501626e4ded3350b.jpg',1,NULL,1,NULL,'2022-02-01 11:55:57','2022-05-01 16:07:57',NULL),(34,'sumkas@kku.ac.th',NULL,'$2y$10$Es3pi9hL3kLahqdS5RgMIuBsDdC.dfexhATwtZmEbtMgDD7o7sCu.','Sumonta','Kasemvilas','สุมณฑา','เกษมวิลาศ','Ph.D.','Assistant Professor','ผู้ช่วยศาสตราจารย์','Asst. Prof. Dr.','ผศ.ดร.','นางสาว','Miss','UIMG_20220501626e5005ad9bb.jpg',0,NULL,2,NULL,'2022-03-05 03:21:14','2022-05-01 16:16:53',NULL),(35,'staff@gmail.com',NULL,'$2y$10$p7tQSwelkV1eNMaCdDj3Le16hvZSPs8zw08UJhZZNh4yPYuSvIuky','staff','-','เจ้าหน้าที่','-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,'2022-03-31 17:00:12','2022-05-18 08:21:35',NULL),(36,'test@gmail.com',NULL,'$2y$10$vXV8y5pjmtZxkBjW.mIN4u9Oli2MFejeZqNezY6go3u323o8g1aWq','watcharawatchara','sritionwong','วัชระวัชระ','ศรีต้นวงศ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,NULL,'2022-04-02 18:51:43','2022-04-03 17:44:13',NULL),(44,'watchara@kkumail.com',NULL,'$2y$10$xnOxC423ySUfvY7aYW2o0.U9sPDXyYZm1ZJVjwdf9MjqDiDt4H/w6','watchara','sritonwong','วัชระ ','ศรีต้นวงศ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,'2022-04-07 04:12:05','2022-04-07 04:12:05',NULL),(45,'adidorn@kkumail.com',NULL,'$2y$10$VsYrYwROk36fpr3Ez1bKEeUzoKyZIESUW64edxBUYJRY7S1LXspl6','adisorn','naruang','อดิศร','นาเรือง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,5,NULL,'2022-04-07 04:12:06','2022-04-10 21:07:58',NULL),(46,'pongsathon.janyoi@kkumail.com',NULL,'$2y$10$HR5eW530msHb97kVW5hQQuPoQMb4tixIaTvtKJkfGfWapxDMgWxKu','Pongsathon','Janyoi','พงษ์ศธร','จันทรย้อย',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-04-22 06:35:21','2022-04-22 06:35:21',NULL),(47,'rojanha@kku.ac.th',NULL,'$2y$10$nfveF1GM1NBnLwuFpYdRaea8Ah4UOg5wkv04.vP19eFRA68UGvWOi','Rojanawan','Hadi','โรจนวรรณ','หาดี',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,'2022-05-15 14:45:44','2022-05-20 07:35:22',NULL),(49,'Natech@kku.ac.th',NULL,'$2y$10$M6aM75XSoUXd6Ayc4k.zVOM.gX9O4BHiXcJ2FI1q1pnuuRVzDTl1C','-','-','เนตรนรินทร์','ชนะบัว',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2022-05-16 07:45:23','2022-05-16 07:45:23',NULL),(50,'noirattikorn@gmail.com',NULL,'$2y$10$d8qCaVCFtIRY6wV6qEFHnONc6FzYRXkE1iIFKOs56I1AkkqcdQb9W','-','-','รัตติกร','แทนเพชร',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UIMG_20220517628302565441d.jpg',NULL,NULL,1,NULL,'2022-05-16 07:46:42','2022-05-17 02:03:02',NULL),(51,NULL,'605020077-3','$2y$10$IbCovXEZtZKrVh1q2XjFzeNFCbJCeM6NgoSx69.Uzn68/dOmFu/HK',NULL,NULL,'พงศธร','วงศ์พราวมาศ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:42','2022-05-16 08:42:42',NULL),(52,NULL,'605020097-7','$2y$10$0Hc7u7ItcZ1iajnpHZfd8.3MgzhO/oj3OzgsYPRy4ud9rJWMDGK2G',NULL,NULL,'เศวตสิทธิ์','อิ่มนาง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:42','2022-05-16 08:42:42',NULL),(53,NULL,'605020039-1','$2y$10$/c9oHXzsIdQmETuhhqtU1udpa2EWNM56HhG4NU.dMubiaihfpSCzG',NULL,NULL,'ธีรธรรม','บุญประภาพันธุ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:42','2022-05-16 08:42:42',NULL),(54,NULL,'615020020-3','$2y$10$NkIcg4X3159SkmcsV7BnbeV6VmKFUIZlkMZeopq6P3Q5WI8Ygu.R6',NULL,NULL,'เดชฤทธิ์','แก้วประดับ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:42','2022-05-16 08:42:42',NULL),(55,NULL,'615020083-9','$2y$10$tcEQaEFGrUpYV54YQwi7Uu6oM9xEdIGjdfnE14pQulM7avsrujLPW',NULL,NULL,'ณัฐพงศ์','ฉิมวัย',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:42','2022-05-16 08:42:42',NULL),(56,NULL,'615020084-7','$2y$10$odxow9CX/AEDQ4b0DIkn9eWJsiQdU5nzg3kCvvXfZEGxvSK3Au2fy',NULL,NULL,'วชรพล','เกตวงษา',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:42','2022-05-16 08:42:42',NULL),(57,NULL,'615020094-4','$2y$10$A.gTTSho0yoKsnYuj9i.NOiQ.hhKFUBsLtVlTDVfT.BWii.8Rdfzi',NULL,NULL,'ชัยวิชิต','แก้วกลม',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:43','2022-05-16 08:42:43',NULL),(58,NULL,'615020053-8','$2y$10$XAsLVOyi7FgRnclrjl2YSeQvfQuNB0T9r1IgzeZ1s610WM4eV9gs2',NULL,NULL,'ปัทมวรรณ','สถิรพงค์กุล',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:43','2022-05-16 08:42:43',NULL),(59,NULL,'615020066-9 ','$2y$10$6y3TmOM6SPdb6fJgaKph2OSpDtrb9p4tFZN1FGIZy22wu6Z42KvsK',NULL,NULL,'ชนิตพล','สังข์สายศิริกุล',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:43','2022-05-16 08:42:43',NULL),(60,NULL,'625020074-1 ','$2y$10$8jUkeDifvsOfaj/V54mdOOLR9Me4hg4cSMMWAZpM2/BGyf4.03BV6',NULL,NULL,'ภควัต','กล้าหาญ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:44','2022-05-16 08:42:44',NULL),(61,NULL,'625020075-9','$2y$10$mKpQ8BMaqnpowcepEr2gfOrGFUaCcn7hP7WpBiOxOMiAd9VdlZ9b.',NULL,NULL,'ศิรินทร','อ่อนอยู่',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:44','2022-05-16 08:42:44',NULL),(62,NULL,'625020082-2 ','$2y$10$FQSfpDikD7px92DQEbFHS.sbiUvfkvrhZKDVRxYY5iJuCCajQECaS',NULL,NULL,'SOULIVANH','CHANTHAVISOUK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:44','2022-05-16 08:42:44',NULL),(63,NULL,'625020012-3','$2y$10$rgco/fQT837ZIhYxBjUs4.XpDS49sFaJZG0PY8ByHgIR20HtQcD1S',NULL,NULL,'ธนดล','รัศมีเพ็ญ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:44','2022-05-16 08:42:44',NULL),(64,NULL,'625020036-9','$2y$10$o0uhWxDSXFj6j83EuSUPuu1.piy.9OEY3e9OxrM4yZPp61ZWu0IBW',NULL,NULL,'กิตติกาญจน์','เจริญรัตน์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:45','2022-05-16 08:42:45',NULL),(65,NULL,'625020037-7','$2y$10$BJrDwR133mgxfSzr4oDRNOJfNc1WDOo.qKbxCtVoopcuJ3TMSn4M.',NULL,NULL,'ธนวันต์','แวทไธสง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:45','2022-05-16 08:42:45',NULL),(66,NULL,'625020038-5','$2y$10$UaWARp6Dloxm8nHwkHdUX.25AKFlEze23k/A60L6hB0D5pEX7oR4O',NULL,NULL,'ธนาธิป','แวทไธสง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:46','2022-05-16 08:42:46',NULL),(67,NULL,'625020061-0','$2y$10$PC9DoTIEmZiCDZZ9KDrASOaC2dyx981.cdh.70UYNmTWufDwMl2GS',NULL,NULL,'ณัฐธิดา','วรรธนะปกรณ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:46','2022-05-16 08:42:46',NULL),(68,NULL,'625020070-9','$2y$10$qZ1BuZJb/b2k.pmZi/xxrOwdsCd7GHv/PQd6VIQrgUeOjjlCBny8C',NULL,NULL,'กฤดิกร','วิชชาธรตระกูล',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:46','2022-05-16 08:42:46',NULL),(69,NULL,'625020071-7','$2y$10$OKXLIQ3pGQ6Tatm.5c.fUOSHs9ykvIqUeTVs/PS/QHZmOt6G8Nohm',NULL,NULL,'ภาณุวัฒน์','แก้วบ่อ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:46','2022-05-16 08:42:46',NULL),(70,NULL,'625020072-5','$2y$10$FBA7xQ4ZvmFvN7lPYWfYE.DKv7zTwoXv8b71ZU5VpLrXP9ERxDjTG',NULL,NULL,'วชิรกาญจน์','เสือบัว',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:47','2022-05-16 08:42:47',NULL),(71,NULL,'625020091-1','$2y$10$cJznrsWPhDDdUMx/cik6WuFrtG6rD5iGblp0ONp0oibYk.iz0s4tK',NULL,NULL,'พรรณศิริ','ศิริสมพงษ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:47','2022-05-16 08:42:47',NULL),(72,NULL,'625020046-6 ','$2y$10$hnJV5mwGXsnWxbhQORI3A.P/MZ3UaHWU5GpuJ2ZTdxOXBxz8mZsAy',NULL,NULL,'ธนโชติ','พลน้ำเที่ยง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:47','2022-05-16 08:42:47',NULL),(73,NULL,'635020002-7','$2y$10$rjHqTLiG6mUOoRYHOb5nEOluop.rAX8wDzr55lkNTcrTL4SfsWIzi',NULL,NULL,'ภูริณัฐ','นิลละออง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:47','2022-05-16 08:42:47',NULL),(74,NULL,'635020046-7','$2y$10$.x7bc.A94qzbJrPzkKHnLeFNXl7XS9O.qPK9UFmIpH6G0.QxiRJmy',NULL,NULL,'ฑิตยา','ศรีวุฒิทรัพย์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:47','2022-05-16 08:42:47',NULL),(75,NULL,'635020047-5','$2y$10$h/xio9W/3mp7r5vtcY0Aku/rNKLbWIBIq/WretUSx29Tsr/BWg7TS',NULL,NULL,'ธนาวุฒิ','นาบรรดิฐ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:48','2022-05-16 08:42:48',NULL),(76,NULL,'635020048-3','$2y$10$vHMcu.sZYX3yn2obHUCjJ.Kq3bERRLMe6k6RYcNQNnxTRkG4xViJG',NULL,NULL,'ธีรธัช','ถวิลหวัง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:48','2022-05-16 08:42:48',NULL),(77,NULL,'635020049-1','$2y$10$tauxHDqBBba29tkYwbXah.SMwKJlw0YJvBFX0oUKg9nhTubmlsGiq',NULL,NULL,'ภูมินทร์','ดวนขันธ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:48','2022-05-16 08:42:48',NULL),(78,NULL,'635020050-6','$2y$10$xT36tVHE6DMDBl8iSRWZF.WRzukgn6Os5EBLdh0lYSJPLDUdwJ3Z.',NULL,NULL,'สิริวัฒน์','หิรัญชัชวาลย์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:48','2022-05-16 08:42:48',NULL),(79,NULL,'635020015-8','$2y$10$02y8cdZ5RUWeBS2yTi3Y2OK4Ob24lWGVYsxVolGtWIhtPZiM0OW6q',NULL,NULL,'ชวรัชต์','ทองโยธี',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:49','2022-05-16 08:42:49',NULL),(80,NULL,'635020064-5','$2y$10$o4BBQsg4jgiWj1cd20S8C.jyYAlhTZgPZdYIMkZDH5qHfOYm0MLk2',NULL,NULL,'นพัทธ์','ศรีจันทพงศ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:49','2022-05-16 08:42:49',NULL),(81,NULL,'635020065-3','$2y$10$JJhm5r.Grp9dehP91sIJxepORR25XKa9WNI6.ofZhgcu6B3EZ4Tae',NULL,NULL,'ขวัญพิฌา','ปะกิระคัง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:49','2022-05-16 08:42:49',NULL),(82,NULL,'635020067-9','$2y$10$Lat.ckJcIA0BGUr5VS1PtO9pbipVCQe1Dvx8HC81vvPbWsm0tBOWC',NULL,NULL,'ณัฏฐ์สิทธิ์','แก้วสังหาร',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:49','2022-05-16 08:42:49',NULL),(83,NULL,'635020068-7','$2y$10$dTogSYK3Fkxy2OtDr9tfH.2iZeUOxSFTkglv3dKiYgCFljGmdlcK.',NULL,NULL,'ณัฐนนท์','พลอยหวังบุญ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:50','2022-05-16 08:42:50',NULL),(84,NULL,'635020086-5','$2y$10$ePj85AyGfX49t9yL0iCetuJJgs6yCnGtF70aICz95WGrNnI7YqoFC',NULL,NULL,'แทนเทพ','คำอ่อน',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:50','2022-05-16 08:42:50',NULL),(85,NULL,'635020087-3','$2y$10$oR8XtoZDX/bLI7rNOuPg0eREs4o.du0nEGquq8lVwuxqUA2sA9RZ.',NULL,NULL,'พศิน','ขอบุญส่งเสริม',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:50','2022-05-16 08:42:50',NULL),(86,NULL,'645020032-9','$2y$10$32cRqUexTpYRvW.AK9qs6u/F2//Ap5nGB9LuO.DHmXOtKupNm1uyW',NULL,NULL,'วสวัตติ์','บึงกาญจนา',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:50','2022-05-16 08:42:50',NULL),(87,NULL,'645020066-2','$2y$10$3YwvGACFk8IwVt7QFstBA.yO58EpJVQIb4Y8z/lRz8qlXfZV3hPbW',NULL,NULL,'ณัฐพงษ์','วณิชวรนันท์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:51','2022-05-16 08:42:51',NULL),(88,NULL,'645020081-6','$2y$10$z/Ao2dqRRnc7n/1qFtFAce8SFLz6PlRuHqilShAcUvpIzA/O5OgP6',NULL,NULL,'SOPHA','KHOEURT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:51','2022-05-16 08:42:51',NULL),(89,NULL,'645020082-4','$2y$10$eIqsw1xg8Zh6wz3wldt/3eKzlRoeygxo1iBoCPSIr5GnBw8.0kR4m',NULL,NULL,'CHEN','SET KIM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:51','2022-05-16 08:42:51',NULL),(90,NULL,'645020096-3','$2y$10$O0nL0ZLga5q5l5zhVSgV5O8L7bAvbuiiN7Vf9O3qRypNygA7uKzlu',NULL,NULL,'ปณต','ศรีนัครินทร์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:51','2022-05-16 08:42:51',NULL),(91,NULL,'645020041-8 ','$2y$10$v7zfmZw57hR6lGJ36ZHXvu1Tgw9LhDP5DMAyg6wyYTLzqWol9DAYy',NULL,NULL,'อภิชัย','ศรีคุณแสน',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:51','2022-05-16 08:42:51',NULL),(92,NULL,'	645020040-0 ','$2y$10$mAdY3Er4oZ1rfJavLupxW.9W5xGpAC8w3e5tfdDzRs9OFbgADcxe6',NULL,NULL,'ภพปภพ','อื้อจรรยา',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:52','2022-05-16 08:42:52',NULL),(93,NULL,'645020038-7 ','$2y$10$I7H6xCSKO7wtqlquuqG.MOnj1L54ejGKeK1P9goSgsuOD74k0jM9m',NULL,NULL,'กรวิชญ์','ฟุ้งเฟื่อง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:52','2022-05-16 08:42:52',NULL),(94,NULL,'645020072-7 ','$2y$10$s4UaI.JakBD06.7H5IfLM.seuH1qXPT5KwHaMSpMXhuVz1u7JI3Pe',NULL,NULL,'ยุทธพงศ์','มนัสทิพารมณ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:52','2022-05-16 08:42:52',NULL),(95,NULL,'645020073-5 ','$2y$10$YeJ43ZPF4rhLS5OwDWrUceNH9BrL8nnecMvNZgcv971aH9Wjnyzm.',NULL,NULL,'ยุพารัตน์','นพคุณโพธิ์สว่าง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:52','2022-05-16 08:42:52',NULL),(96,NULL,'645020074-3','$2y$10$F.JSKDf2WF/PluGy52AosOHxlN1.bmRy9v2ZcOeUF6zAK7KN58kB2',NULL,NULL,'ยุรฉัตร','เมธมุทา',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:53','2022-05-16 08:42:53',NULL),(97,NULL,'645020075-1','$2y$10$2dvGbSNCLB5v9I8fmc4vtOvgbFRXfbZpj7C1XVX05nHcn6gbckWli',NULL,NULL,'รัฐพล','สงวนตระกูล',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:53','2022-05-16 08:42:53',NULL),(98,NULL,'645020076-9','$2y$10$dp1g4LpYehKQIzlekE1Vd.NKkJ.jYckJAaygSZ/TYIjNh/JK2oy6G',NULL,NULL,'สุเมธ','ดวงมาลัย',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:53','2022-05-16 08:42:53',NULL),(99,NULL,'645020087-4','$2y$10$mVhyXUGz79C5vkD4o2nnVu5pB2kPjHubHJk20O5wkj/GXNxFUPoy2',NULL,NULL,'ภูริวัฒน์','ดาษดา',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:54','2022-05-16 08:42:54',NULL),(100,NULL,'645020100-8','$2y$10$jqEQY7kfExvP5v.xno9iwuiv6R2rWNk8LEUrbTVqhkErUHRa8C.JW',NULL,NULL,'พงษ์ศิลป์','จั่นแก้ว',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:54','2022-05-16 08:42:54',NULL),(101,NULL,'645020101-6','$2y$10$h2zF0/1CSP7zOjYjIrbTbuv87KYDlPU4eJLn1J64.oJBP1HCh4WLG',NULL,NULL,'หริภัทร','พงษ์สุวรรณ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2022-05-16 08:42:54','2022-05-16 08:42:54',NULL),(102,NULL,'587020033-5','$2y$10$BqT02ENSeLk/wF9IuF.RXOW49OeLtAaLhrWYlsXG0BLgTtdm79GWC',NULL,NULL,'ณัฐวัตร','คำภักดี',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:54','2022-05-16 08:42:54',NULL),(103,NULL,'587020034-3','$2y$10$v1ZJboPkAyQH5oP7m4ono.G/39RtaJgA3hORRNjW35CxY3qDbamn6',NULL,NULL,'สุธาสินี','เอี่ยมสอาด',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:54','2022-05-16 08:42:54',NULL),(104,NULL,'597020024-7','$2y$10$Z9RgcIoPXIfnMmT69QdQkuLimxzAsSVdckpKqVzTeGU2zlu1A.n/S',NULL,NULL,'คุณาวุฒิ','บุญกว้าง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:55','2022-05-16 08:42:55',NULL),(105,NULL,'597020026-3','$2y$10$/7gcCCfzQgh06BGFIqLi6uDDP6DyuYpvR2ky8lxnUEOjuWckXM0bm',NULL,NULL,'นงค์นุช','ไพบูลย์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:55','2022-05-16 08:42:55',NULL),(106,NULL,'597020027-1','$2y$10$/Tmz9elDFDmcB.kpmX/TI.Jc/15jNo7aMHuzMOTYvXQCBbTkojpXG',NULL,NULL,'วุฒิชัย','วิเชียรไชย',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:55','2022-05-16 08:42:55',NULL),(107,NULL,'597020063-7','$2y$10$QBo0u5km3UPiMANNU0RhDuv.xkbksXlZTyifGMpnlS6haJM9mEREK',NULL,NULL,'จักรกฤษณ์','แก้วโยธา',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:56','2022-05-16 08:42:56',NULL),(108,NULL,'597020066-1','$2y$10$9M4i1uHHu5T39bcltpWHYO65JfauGjzReRqDynQdLiaPiTQd4yeaS',NULL,NULL,'LOAN HO','THI THUY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:56','2022-05-16 08:42:56',NULL),(109,NULL,'597020067-9','$2y$10$YhkRNWYWZla4OgST8uf2FeYRODY.RskTJDfv.83aenHubgxtcZbwW',NULL,NULL,'SOVANNARITH','HENG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:56','2022-05-16 08:42:56',NULL),(110,NULL,'597020082-3','$2y$10$O6rVZYUmDSskDO4XY9ZqrOrqVWYJQ6EcMtQzSc9EYEK9mWReeMp3y',NULL,NULL,'ภัทรพล','วันนา',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:56','2022-05-16 08:42:56',NULL),(111,NULL,'607020023-0','$2y$10$0LdCq8Sm2fkD0cC1P2DuA.K2oZgXvPXpUT/gFe50ozbYDhLHUkioK',NULL,NULL,'เกวลี','ผาใต้',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:57','2022-05-16 08:42:57',NULL),(112,NULL,'607020024-8','$2y$10$5OdsDXTlE7sf359wLexv8OlNHBGVzN3CQ.hLf7ctIynaUMYqf7GRG','Tidarat ','Luangrungruang','ธิดารัตน์','เหลืองรุ่งเรือง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:57','2022-05-16 08:42:57',NULL),(113,NULL,'607020026-4','$2y$10$fe3QJSSZt7LibYqQ.UWIJOiCIhtwIGq.Uvj8eQv.YxVwVIdbv4ZDu',NULL,NULL,'อนัญญา','พรมโคตร',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:57','2022-05-16 08:42:57',NULL),(114,NULL,'607020029-8','$2y$10$rl5fJG70Zx3OgX.QFm/bduw2oPuphkD6pu/7YjQx4qVsLWr9OZH9S',NULL,NULL,'ชรินทร์ญา','หวังวัชรกุล',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:57','2022-05-16 08:42:57',NULL),(115,NULL,'607020031-1','$2y$10$9zgUY4BdwNoSkphtmNH8Be8K.EIhpfetm2yQcyJMaeNVDn3E5egr6',NULL,NULL,'สุรศักดิ์','ตั้งสกุล',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:58','2022-05-16 08:42:58',NULL),(116,NULL,'617020012-6','$2y$10$xK.t8jDqfQKKFM/pc3ZSv.ixksohejTSKMCS0rlLjag2qH6ccyPuK',NULL,NULL,'เสาวลักษณ์','ไทยกลาง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:58','2022-05-16 08:42:58',NULL),(117,NULL,'617020014-2','$2y$10$V6MP3e2IIEYOAwJwZ9KFEuV.aQQKX/Nqt3L/0KiLfHhoyABuaNqgS',NULL,NULL,'พัชรนิกานต์','พงษ์ธนู',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:58','2022-05-16 08:42:58',NULL),(118,NULL,'617020046-9','$2y$10$ZP5Kra.IAA0UYjKqFLdJmeSXr/iI2NqXkJHEX6Sv5mv/9EfVrO8li',NULL,NULL,'ปิยณัฐ','ศิริสวัสดิ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:58','2022-05-16 08:42:58',NULL),(119,NULL,'617020047-7','$2y$10$piw3l.bcwom24bclsFsT2OMkerkUigrnR5YK/chXln5hNFMbUSMIW',NULL,NULL,'วุฒิชัย','โนนสาคู',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:59','2022-05-16 08:42:59',NULL),(120,NULL,'617020049-3','$2y$10$iqVCnp8w9SOycFLzwukr3OHQ69M6f08AVaIk/YGk3056g5MPbJKm.',NULL,NULL,'NGUYEN','ANH NHAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:59','2022-05-16 08:42:59',NULL),(121,NULL,'627020033-9','$2y$10$d7AolD2xDTkyKSTy//npGeMVOiJ1Vh2Zi8LLpguxzRa3PKHQtJZdy',NULL,NULL,'FLORENTINA','YUNI ARINI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:42:59','2022-05-16 08:42:59',NULL),(122,NULL,'627020057-5','$2y$10$GZE8NoV/POVSyyWzss5opOyFwqAi/dwpXozZ3wOkzC2tgYmDBziLa',NULL,NULL,'ธนพล','ตั้งชูพงศ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:00','2022-05-16 08:43:00',NULL),(123,NULL,'627020002-0','$2y$10$czd5RBp24AlhDHnf/q.7Ye037bF81hVpcM57b2C7zJEoVTs3nEfs.',NULL,NULL,'วรพจน์','สุวรรณภิภพ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:00','2022-05-16 08:43:00',NULL),(124,NULL,'627020032-1','$2y$10$ROPSR6fDi/cTmlgPe0rf/OGj7764ieBWNu6zxcBwkwbw95e7hvkhW',NULL,NULL,'ชาติชาย','ปุณริบูรณ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:00','2022-05-16 08:43:00',NULL),(125,NULL,'627020061-4','$2y$10$KmiHdF1S3Tw4SP4voq0r2OZjXtGOiDgMyBgzVWpnhkoEqoiJDT.uW',NULL,NULL,'จตุรภรณ์','โชคภูเขียว',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:00','2022-05-16 08:43:00',NULL),(126,NULL,'627020062-2','$2y$10$ft5vu9OqO5y/qRbcohIUHOrTEtbTuX717/O5x.E9taw8kbZZhYrUa',NULL,NULL,'ปริวัฏฐ์','เหลืองสุวิมล',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:01','2022-05-16 08:43:01',NULL),(127,NULL,'637020013-6','$2y$10$TvqHObgWsCNdtKNMRN53Qe860VaJcTAy7JCbI2a9Qmcbx6zs9KZTe',NULL,NULL,'ชินาพัฒน์','สกุลราศรีสวย',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:01','2022-05-16 08:43:01',NULL),(128,NULL,'647020010-3','$2y$10$N9016WX4r7OVpJvP5QHiBuJLLwH.ZH83GulIk/DaCBMvEJqh6eBIC',NULL,NULL,'SALEUMSOUK','SISANAH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:02','2022-05-16 08:43:02',NULL),(129,NULL,'647020019-5','$2y$10$FKMTO1xK.Dd6IP2VlyzO6OpLPAggO8xryro1V9kjUE7kqxruKiHiW',NULL,NULL,'นิกร','กรรณิกากลาง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:02','2022-05-16 08:43:02',NULL),(130,NULL,'647020020-0','$2y$10$B5pDmxVXzJuTkLQSz8k0oO9Ctzl5tHh5YCjtKXNlan.qzRINr6Fi.',NULL,NULL,'ศราวุธ','ลิ้มประเสริฐ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:02','2022-05-16 08:43:02',NULL),(131,NULL,'647020016-1','$2y$10$pMc.kDzvRf/9wxV99hPDbubz9qjo0ppbDbfWBda59oeVb7XQVsuB6',NULL,NULL,'ยอดยศ','ลิ้มรสธรรม',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,'2022-05-16 08:43:02','2022-05-16 08:43:02',NULL),(132,NULL,'605020076-5','$2y$10$MdmlS7QD6/bVMTXBTK54xepCVGEl4kdM7XF46t1op4UMfT5QZVIJi',NULL,NULL,'อธิชา','รายณะสุข',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:03','2022-05-16 08:43:03',NULL),(133,NULL,'605020083-8','$2y$10$40v2GjNKtad6Hdijg2LsUOKJxYKDFs9Bx1WFIL9hp7zOmFRW6kqha',NULL,NULL,'อัศวโกวิท','พึ่งสุข',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:03','2022-05-16 08:43:03',NULL),(134,NULL,'615020003-3','$2y$10$yENnDg67ukXOKZcvKK65qu21rVSNNJ5nW9Uzpb.8zi0xTwxPGEoea',NULL,NULL,'ภาวิดา','กมลคุณากร',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:03','2022-05-16 08:43:03',NULL),(135,NULL,'615020004-1','$2y$10$5EtWK0OaMSun1SDoIzs6Zu804li1VZ/LNpVhVX9H.hZbSvK7n/EAe',NULL,NULL,'สุพัตรา','ภูมิแสน',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:03','2022-05-16 08:43:03',NULL),(136,NULL,'625020028-8','$2y$10$51xETSLc6Djc.IPIk1bN0.yMISC63PA1Xi7oli4O4HtJd85PPIc4u',NULL,NULL,'เชาว์วรรธน์','สิงห์ทอง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:04','2022-05-16 08:43:04',NULL),(137,NULL,'635020017-4','$2y$10$eGRxq8GlYCJ5JFjqdD8EveT9reMFScKnf5oQX5.ptj/VRBkXXpaPa',NULL,NULL,'วริษฐา','สิทธิไพบูลย์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:04','2022-05-16 08:43:04',NULL),(138,NULL,'635020029-7','$2y$10$0Ao9wBHzLzPPA2iInKoWu.4H2EZd11c5deR0zQiHw1AQK5mwgL0xq',NULL,NULL,'พันแสง','แพงวังทอง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:04','2022-05-16 08:43:04',NULL),(139,NULL,'635020025-5','$2y$10$hVKPQMPupT9fjN3lTdMIPuw9yNvAhoY5XiH73WozSO5.kC2Lq1phy',NULL,NULL,'ยุวเรศ','หลุดพา',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:04','2022-05-16 08:43:04',NULL),(140,NULL,'587020064-4','$2y$10$9njl9lkWtFzRNo2Sum5rS.z8Uklc/QnresDSkhx4WrS9M4Ie1rNvi',NULL,NULL,'ศรัณย์','อภิชนตระกูล',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:05','2022-05-16 08:43:05',NULL),(141,NULL,'637020001-3','$2y$10$DUM0OJy9b.GzbSxGOw8.3eh5ukYqobqlP0tt8p445PG1UtgKXxDjS',NULL,NULL,'ไชยฤทธิ์','เศวตวงษ์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:05','2022-05-16 08:43:05',NULL),(142,NULL,'637020007-1','$2y$10$z1vZWxcBL7BhU5.lIGY.d.4bSE2MWcGNX1ANB74if6PEfRxmEWyb6',NULL,NULL,'วุฒิพงษ์','แสงมณี',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2022-05-16 08:43:05','2022-05-16 08:43:05',NULL),(143,NULL,'635020083-1','$2y$10$PotxjF7EkiIJ8Ut97KEmeub8.R7PbFW/M4JGbYU1T7njwYgiTW7wq',NULL,NULL,'จุฑารัตน์','โคตรภูเวียง',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2022-05-16 08:43:05','2022-05-16 08:43:05',NULL),(144,NULL,'635020093-8','$2y$10$6HB0.Ga/Jp34OaM3yS..PuU8q4w61wkrzFn0bzeSU9Q9gtJj/rWC6',NULL,NULL,'SHERLY','VALENTINA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2022-05-16 08:43:06','2022-05-16 08:43:06',NULL),(145,NULL,'645020020-6','$2y$10$18vKHPGMpYPjvMAmJe9wTOoDUF0fBLq584lyj43kkmdOqYcuMoSKK',NULL,NULL,'พีรดนย์','สุขเกษม',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2022-05-16 08:43:06','2022-05-16 08:43:06',NULL),(146,NULL,'645020033-7','$2y$10$DJFvFZNjM0O8fw4hHOhHguTTg00BeT31A0oTqwkWXfgIVM/R3hDSO',NULL,NULL,'จิราวุฒิ','ผิวพันคำ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2022-05-16 08:43:06','2022-05-16 08:43:06',NULL),(147,NULL,'645020034-5','$2y$10$cIJXRqLuXc4GcemiEi.spuQ3gQGySARVFE.CIaUPCQC2cZGNv2AbC',NULL,NULL,'พิทยา','ศิริปการ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2022-05-16 08:43:06','2022-05-16 08:43:06',NULL),(148,NULL,'645020035-3','$2y$10$1Ruc0GHhaen7D0oYa/aoHegkGn.pUR.dHQalL1K5bXjrLEf.863ui',NULL,NULL,'วุฒิไกร','พิมพ์หล่อ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2022-05-16 08:43:07','2022-05-16 08:43:07',NULL),(149,NULL,'645020036-1','$2y$10$nDRg/Ri5x4H1Gu7DX00HOOWX2EslcgVvVDvZe8Qs0yoLG6DTAxk8O',NULL,NULL,'อัครวรรษ','หมั้นทรัพย์',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2022-05-16 08:43:07','2022-05-16 08:43:07',NULL),(150,NULL,'645020084-0','$2y$10$DlV9jdXE2nLkYORW9USOo.iltSOPGLt01FaBQxR0toZYHUkFbpETW',NULL,NULL,'RAKSMEY','PHANN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2022-05-16 08:43:07','2022-05-16 08:43:07',NULL),(151,'pakamu@kku.ac.th',NULL,'$2y$10$4cWIeXPDrzOdprHYUoi0FuhPVnilKFBQav3GfnAWOe9Os6s/5ogD2','Pakarat','Musikawan','ภัคราช','มุสิกะวัน','Ph.D.','Lecturer','อาจารย์','Lecturer','อ.ดร.','นาย','Mr.','UIMG_202205196286008d384de.jpg',NULL,NULL,1,NULL,'2022-05-19 07:01:45','2022-05-19 08:32:13',NULL),(152,'yaniko@kku.ac.th',NULL,'$2y$10$gDmFes/xMxi33DFFKtc8lOUbOmLFLDr9HjzXev1905cQVPxqoDiDm','Yanika','Kongsorot','-','-','Ph.D.','Lecturer','อาจารย์','Lecturer','อ.ดร.','นาย','Mr.','UIMG_2022051962860eccccde5.jpg',NULL,NULL,1,NULL,'2022-05-19 09:32:02','2025-02-22 08:43:33','zdBo3cwAAAAJ');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_of_research_groups`
--

DROP TABLE IF EXISTS `work_of_research_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_of_research_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `research_group_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `work_of_research_groups_user_id_foreign` (`user_id`),
  KEY `work_of_research_groups_research_group_id_foreign` (`research_group_id`),
  CONSTRAINT `work_of_research_groups_research_group_id_foreign` FOREIGN KEY (`research_group_id`) REFERENCES `research_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_of_research_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_of_research_groups`
--

LOCK TABLES `work_of_research_groups` WRITE;
/*!40000 ALTER TABLE `work_of_research_groups` DISABLE KEYS */;
INSERT INTO `work_of_research_groups` VALUES (95,1,2,10),(96,2,18,10),(97,2,22,10),(98,2,14,10),(99,2,17,10),(100,2,26,10),(101,1,16,9),(102,2,46,9),(103,1,7,8),(104,2,19,8),(105,2,25,8),(111,1,9,5),(112,2,8,5),(113,2,6,5),(114,1,15,3),(115,2,5,3),(116,2,11,3);
/*!40000 ALTER TABLE `work_of_research_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_of_research_projects`
--

DROP TABLE IF EXISTS `work_of_research_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_of_research_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `research_project_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `work_of_research_projects_user_id_foreign` (`user_id`),
  KEY `work_of_research_projects_research_project_id_foreign` (`research_project_id`),
  CONSTRAINT `work_of_research_projects_research_project_id_foreign` FOREIGN KEY (`research_project_id`) REFERENCES `research_projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_of_research_projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_of_research_projects`
--

LOCK TABLES `work_of_research_projects` WRITE;
/*!40000 ALTER TABLE `work_of_research_projects` DISABLE KEYS */;
INSERT INTO `work_of_research_projects` VALUES (64,1,16,16),(68,1,34,20),(69,1,22,21),(70,1,2,22),(71,1,14,23),(72,1,22,24),(73,1,14,25),(74,1,7,26),(75,1,6,27),(76,1,22,28),(80,1,31,29),(81,1,20,30),(83,1,29,32),(84,2,26,32),(85,1,34,33),(86,1,34,34),(87,1,34,35),(88,1,9,36),(89,2,10,36),(90,1,3,37),(91,1,3,38),(92,1,15,39),(93,1,20,40),(94,1,31,41),(95,1,34,42),(96,1,34,43),(97,1,7,44),(98,2,9,44);
/*!40000 ALTER TABLE `work_of_research_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'new_schema'
--

--
-- Dumping routines for database 'new_schema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-09 23:23:07
