CREATE DATABASE  IF NOT EXISTS `alumni` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `alumni`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: alumni
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `alumni`
--

DROP TABLE IF EXISTS `alumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumni` (
  `id` varchar(50) NOT NULL,
  `alumni_name` varchar(100) NOT NULL,
  `year_of_grad` year NOT NULL,
  `gender` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alumni_name` (`alumni_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumni`
--

LOCK TABLES `alumni` WRITE;
/*!40000 ALTER TABLE `alumni` DISABLE KEYS */;
INSERT INTO `alumni` VALUES ('PES2UG13CS051','Ellie Goulding',2025,'F'),('PES2UG14CS035','Olivia Davis',2025,'F'),('PES2UG14CS055','Ava Taylor',2025,'F'),('PES2UG14CS057','Ethan Harris',2025,'M'),('PES2UG15CS021','John Doe',2025,'M'),('PES2UG15CS031','Sophia Miller',2025,'F'),('PES2UG15CS037','Ethan Anderson',2025,'M'),('PES2UG15CS045','Daniel White',2025,'M'),('PES2UG15CS053','William Anderson',2025,'M'),('PES2UG16CS023','Jane Smith',2025,'F'),('PES2UG16CS033','William Brown',2025,'M'),('PES2UG16CS039','Ava Johnson',2025,'F'),('PES2UG16CS043','Emma Johnson',2025,'F'),('PES2UG16CS059','Grace Martinez',2025,'F'),('PES2UG17CS025','Robert Johnson',2025,'M'),('PES2UG17CS041','Liam Smith',2025,'M'),('PES2UG17CS047','Olivia Brown',2025,'F'),('PES2UG18CS027','Emily Davis',2025,'F'),('PES2UG18CS029','Michael Wilson',2025,'M'),('PES2UG18CS049','Alexander Davis',2025,'M');
/*!40000 ALTER TABLE `alumni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belongs`
--

DROP TABLE IF EXISTS `belongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongs` (
  `srn` varchar(50) NOT NULL,
  `dept_id` varchar(50) NOT NULL,
  PRIMARY KEY (`srn`,`dept_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `belongs_ibfk_1` FOREIGN KEY (`srn`) REFERENCES `student` (`srn`) ON DELETE CASCADE,
  CONSTRAINT `belongs_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`deptid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongs`
--

LOCK TABLES `belongs` WRITE;
/*!40000 ALTER TABLE `belongs` DISABLE KEYS */;
INSERT INTO `belongs` VALUES ('PES2UG21CS106','BTY601'),('PES2UG21CS109','CHE701'),('PES2UG21CS091','CSE101'),('PES2UG21CS118','CSE101'),('PES2UG21CS103','CVE501'),('PES2UG21CS112','DSC001'),('PES2UG21CS115','DSC001'),('PES2UG21CS100','ECE401'),('PES2UG21CS094','EEE201'),('PES2UG21CS097','MES301');
/*!40000 ALTER TABLE `belongs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `club_name` varchar(100) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`club_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('Adventurers Guild','Miscellaneous'),('Apostrophe','Public Speaking'),('ByteBusters','Programming'),('CanvasCraft','Fine Arts'),('Cliff Hangers','Music'),('CodeChef','Programming'),('ColorPalette','Visual Arts'),('Dsgnr','Fine Arts'),('Eloquent Voices','Public Speaking'),('Innovation Labs','Science and Technology'),('Pixelloid','Visual Arts'),('QQC','Miscellaneous'),('Rhythmic Beats','Music'),('Speedy Soles','Athletics'),('Tech Explorers','Science and Technology'),('Tuskers','Athletics');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_name` varchar(100) NOT NULL,
  `tier` int DEFAULT NULL,
  PRIMARY KEY (`company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('Cognizant',1),('HCL Technologies',2),('Infosys',2),('Qualcom',3),('TCS',1),('Tech Mahindra',3),('Wipro',1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(50) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('UEAI534A','Artificial Intelligence'),('UEAU460A','Aerospace Engineering'),('UEBT401A','Biotechnology'),('UEBT600A','Bioinformatics'),('UECH415A','Chemical Engineering'),('UECH615A','Chemical Process Engineering'),('UECS341A','Computer Science'),('UECS519A','Cybersecurity'),('UECV389A','Civil Engineering'),('UECV504A','Environmental Engineering'),('UEDA489A','Data Analytics'),('UEEC378A','Electronics and Communication'),('UEEC585A','VLSI Design'),('UEEE352A','Electrical Engineering'),('UEEE550A','Power Systems'),('UEIT445A','Information Technology'),('UEME367A','Mechanical Engineering'),('UEML475A','Machine Learning'),('UEMT430A','Material Science'),('UERO570A','Robotics');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `deptid` varchar(50) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('BTY601','Biotech'),('CHE701','Chemical'),('CSE101','Computer Science'),('CVE501','Civil'),('DSC001','Data Science'),('ECE401','Electronics'),('EEE201','Electrical'),('MES301','Mechanical');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrols`
--

DROP TABLE IF EXISTS `enrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrols` (
  `course_id` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`,`id`),
  KEY `id` (`id`),
  CONSTRAINT `enrols_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `enrols_ibfk_2` FOREIGN KEY (`id`) REFERENCES `alumni` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrols`
--

LOCK TABLES `enrols` WRITE;
/*!40000 ALTER TABLE `enrols` DISABLE KEYS */;
INSERT INTO `enrols` VALUES ('UECS341A','PES2UG13CS051'),('UECS519A','PES2UG13CS051'),('UEBT401A','PES2UG14CS035'),('UECV389A','PES2UG14CS055'),('UEBT401A','PES2UG14CS057'),('UECS341A','PES2UG15CS021'),('UEIT445A','PES2UG15CS021'),('UEAU460A','PES2UG15CS031'),('UEML475A','PES2UG15CS037'),('UECS341A','PES2UG15CS045'),('UECS519A','PES2UG15CS053'),('UEIT445A','PES2UG15CS053'),('UEME367A','PES2UG16CS023'),('UECH415A','PES2UG16CS033'),('UECH615A','PES2UG16CS033'),('UEEE352A','PES2UG16CS039'),('UEEE550A','PES2UG16CS039'),('UEAI534A','PES2UG16CS043'),('UERO570A','PES2UG16CS043'),('UECS341A','PES2UG16CS059'),('UEIT445A','PES2UG16CS059'),('UEEC378A','PES2UG17CS025'),('UEEC585A','PES2UG17CS025'),('UEBT600A','PES2UG17CS041'),('UECH415A','PES2UG17CS047'),('UECH615A','PES2UG17CS047'),('UEDA489A','PES2UG18CS027'),('UECV389A','PES2UG18CS029'),('UEMT430A','PES2UG18CS029'),('UEMT430A','PES2UG18CS049');
/*!40000 ALTER TABLE `enrols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internship` (
  `id` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `pay` decimal(10,2) DEFAULT NULL,
  `intern_year` year DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`company_name`),
  KEY `company_name` (`company_name`),
  CONSTRAINT `internship_ibfk_1` FOREIGN KEY (`id`) REFERENCES `alumni` (`id`) ON DELETE CASCADE,
  CONSTRAINT `internship_ibfk_2` FOREIGN KEY (`company_name`) REFERENCES `company` (`company_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internship`
--

LOCK TABLES `internship` WRITE;
/*!40000 ALTER TABLE `internship` DISABLE KEYS */;
INSERT INTO `internship` VALUES ('PES2UG13CS051','Infosys',31000.25,2016,'2 months'),('PES2UG14CS035','TCS',36000.75,2017,'4 months'),('PES2UG14CS055','HCL Technologies',29000.50,2017,'3 months'),('PES2UG14CS057','Tech Mahindra',32000.25,2017,'2 months'),('PES2UG15CS021','TCS',30000.00,2018,'3 months'),('PES2UG15CS031','Cognizant',34000.50,2018,'3 months'),('PES2UG15CS037','Infosys',29000.25,2018,'3 months'),('PES2UG15CS045','Cognizant',32000.00,2018,'2 months'),('PES2UG15CS053','Wipro',38000.00,2018,'4 months'),('PES2UG16CS023','Infosys',25000.00,2019,'2 months'),('PES2UG16CS033','Qualcom',31000.00,2019,'2 months'),('PES2UG16CS039','Wipro',33000.50,2019,'2 months'),('PES2UG16CS043','Tech Mahindra',35000.25,2019,'3 months'),('PES2UG16CS059','Cognizant',36000.50,2019,'3 months'),('PES2UG17CS025','Wipro',28000.75,2020,'4 months'),('PES2UG17CS041','HCL Technologies',30000.00,2020,'4 months'),('PES2UG17CS047','Qualcom',37000.50,2020,'4 months'),('PES2UG18CS027','HCL Technologies',32000.25,2021,'3 months'),('PES2UG18CS029','Tech Mahindra',30000.00,2021,'2 months'),('PES2UG18CS049','TCS',34000.75,2021,'3 months');
/*!40000 ALTER TABLE `internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joined`
--

DROP TABLE IF EXISTS `joined`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joined` (
  `id` varchar(50) NOT NULL,
  `club_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`,`club_name`),
  KEY `club_name` (`club_name`),
  CONSTRAINT `joined_ibfk_1` FOREIGN KEY (`id`) REFERENCES `alumni` (`id`) ON DELETE CASCADE,
  CONSTRAINT `joined_ibfk_2` FOREIGN KEY (`club_name`) REFERENCES `club` (`club_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joined`
--

LOCK TABLES `joined` WRITE;
/*!40000 ALTER TABLE `joined` DISABLE KEYS */;
INSERT INTO `joined` VALUES ('PES2UG13CS051','Adventurers Guild'),('PES2UG18CS029','Apostrophe'),('PES2UG15CS037','ByteBusters'),('PES2UG16CS039','CanvasCraft'),('PES2UG14CS057','Cliff Hangers'),('PES2UG17CS025','Cliff Hangers'),('PES2UG15CS021','CodeChef'),('PES2UG15CS053','CodeChef'),('PES2UG18CS049','ColorPalette'),('PES2UG14CS055','Dsgnr'),('PES2UG16CS023','Dsgnr'),('PES2UG15CS045','Eloquent Voices'),('PES2UG15CS031','Innovation Labs'),('PES2UG16CS033','Pixelloid'),('PES2UG14CS035','QQC'),('PES2UG17CS041','Rhythmic Beats'),('PES2UG16CS043','Speedy Soles'),('PES2UG17CS047','Tech Explorers'),('PES2UG16CS059','Tuskers'),('PES2UG18CS027','Tuskers');
/*!40000 ALTER TABLE `joined` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majored`
--

DROP TABLE IF EXISTS `majored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `majored` (
  `deptid` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  PRIMARY KEY (`deptid`,`id`),
  KEY `id` (`id`),
  CONSTRAINT `majored_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `department` (`deptid`) ON DELETE CASCADE,
  CONSTRAINT `majored_ibfk_2` FOREIGN KEY (`id`) REFERENCES `alumni` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majored`
--

LOCK TABLES `majored` WRITE;
/*!40000 ALTER TABLE `majored` DISABLE KEYS */;
INSERT INTO `majored` VALUES ('CSE101','PES2UG13CS051'),('BTY601','PES2UG14CS035'),('CVE501','PES2UG14CS055'),('BTY601','PES2UG14CS057'),('CSE101','PES2UG15CS021'),('MES301','PES2UG15CS031'),('DSC001','PES2UG15CS037'),('CSE101','PES2UG15CS045'),('CSE101','PES2UG15CS053'),('MES301','PES2UG16CS023'),('CHE701','PES2UG16CS033'),('EEE201','PES2UG16CS039'),('CSE101','PES2UG16CS043'),('CSE101','PES2UG16CS059'),('EEE201','PES2UG17CS025'),('BTY601','PES2UG17CS041'),('CHE701','PES2UG17CS047'),('DSC001','PES2UG18CS027'),('CVE501','PES2UG18CS029'),('MES301','PES2UG18CS049');
/*!40000 ALTER TABLE `majored` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stay`
--

DROP TABLE IF EXISTS `stay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stay` (
  `id` varchar(50) NOT NULL,
  `stype` varchar(50) DEFAULT NULL,
  `expenditure` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `stay_ibfk_1` FOREIGN KEY (`id`) REFERENCES `alumni` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stay`
--

LOCK TABLES `stay` WRITE;
/*!40000 ALTER TABLE `stay` DISABLE KEYS */;
INSERT INTO `stay` VALUES ('PES2UG13CS051','Day-Scholar',1000.00),('PES2UG14CS035','Hostel',1000.50),('PES2UG14CS055','PG',800.50),('PES2UG14CS057','Day-Scholar',900.25),('PES2UG15CS021','Day-Scholar',1500.00),('PES2UG15CS031','PG',1200.75),('PES2UG15CS037','PG',1100.25),('PES2UG15CS045','Day-Scholar',1100.25),('PES2UG15CS053','Hostel',700.75),('PES2UG16CS023','Hostel',1200.75),('PES2UG16CS033','Day-Scholar',1300.00),('PES2UG16CS039','Day-Scholar',1200.00),('PES2UG16CS043','PG',1000.50),('PES2UG16CS059','Hostel',600.50),('PES2UG17CS025','PG',1300.20),('PES2UG17CS041','Hostel',900.75),('PES2UG17CS047','Hostel',800.50),('PES2UG18CS027','Day-Scholar',1400.50),('PES2UG18CS029','Hostel',1100.25),('PES2UG18CS049','PG',900.25);
/*!40000 ALTER TABLE `stay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `srn` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`srn`),
  UNIQUE KEY `sname` (`sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('PES2UG21CS091','Alice Johnson','2002-05-15','F'),('PES2UG21CS094','Bob Smith','2003-09-22','M'),('PES2UG21CS097','Charlie Davis','2002-07-10','M'),('PES2UG21CS100','Diana Brown','2003-01-18','F'),('PES2UG21CS103','Ethan Wilson','2002-12-05','M'),('PES2UG21CS106','Fiona Miller','2003-03-29','F'),('PES2UG21CS109','George Taylor','2002-08-14','M'),('PES2UG21CS112','Hannah Anderson','2003-06-07','F'),('PES2UG21CS115','Ian Harris','2002-04-25','M'),('PES2UG21CS118','Jessica Martinez','2003-11-11','F');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 23:40:57
