CREATE DATABASE  IF NOT EXISTS `FEEDBACK` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `FEEDBACK`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: FEEDBACK
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `COURSE`
--

DROP TABLE IF EXISTS `COURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COURSE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COURSE`
--

LOCK TABLES `COURSE` WRITE;
/*!40000 ALTER TABLE `COURSE` DISABLE KEYS */;
INSERT INTO `COURSE` VALUES (1,'MCA'),(2,'BCA');
/*!40000 ALTER TABLE `COURSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEEDBACK`
--

DROP TABLE IF EXISTS `FEEDBACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEEDBACK` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVALUATION` int(11) DEFAULT NULL,
  `FEEDBACK_CONFIG_ID` int(11) NOT NULL,
  `STUDENT_ID` int(11) NOT NULL,
  `SEM_SUB_FAC_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_FEEDBACK_1_idx` (`FEEDBACK_CONFIG_ID`),
  KEY `fk_FEEDBACK_2_idx` (`STUDENT_ID`),
  KEY `fk_FEEDBACK_3_idx` (`SEM_SUB_FAC_ID`),
  CONSTRAINT `fk_FEEDBACK_1` FOREIGN KEY (`FEEDBACK_CONFIG_ID`) REFERENCES `FEEDBACK_CONFIG` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FEEDBACK_2` FOREIGN KEY (`STUDENT_ID`) REFERENCES `USER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FEEDBACK_3` FOREIGN KEY (`SEM_SUB_FAC_ID`) REFERENCES `SEMESTER_SUBJECT_FACULTY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEEDBACK`
--

LOCK TABLES `FEEDBACK` WRITE;
/*!40000 ALTER TABLE `FEEDBACK` DISABLE KEYS */;
INSERT INTO `FEEDBACK` VALUES (1,1,1,1218726001,6),(2,1,2,1218726001,6),(3,1,3,1218726001,6),(4,1,4,1218726001,6),(5,1,5,1218726001,6),(6,1,6,1218726001,6),(7,1,7,1218726001,6),(8,1,8,1218726001,6),(9,1,9,1218726001,6),(10,1,1,1218726001,6),(11,1,2,1218726001,6),(12,1,3,1218726001,6),(13,1,4,1218726001,6),(14,1,5,1218726001,6),(15,1,6,1218726001,6),(16,1,7,1218726001,6),(17,1,8,1218726001,6),(18,1,9,1218726001,6),(19,2,1,1218726002,6),(20,2,2,1218726002,6),(21,6,3,1218726002,6),(22,2,4,1218726002,6),(23,4,5,1218726002,6),(24,2,6,1218726002,6),(25,2,7,1218726002,6),(26,2,8,1218726002,6),(27,3,9,1218726002,6),(28,3,1,1218726002,7),(29,1,2,1218726002,7),(30,4,3,1218726002,7),(31,1,4,1218726002,7),(32,9,5,1218726002,7),(33,1,6,1218726002,7),(34,3,7,1218726002,7),(35,1,8,1218726002,7),(36,3,9,1218726002,7);
/*!40000 ALTER TABLE `FEEDBACK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEEDBACK_CONFIG`
--

DROP TABLE IF EXISTS `FEEDBACK_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEEDBACK_CONFIG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ATTRIBUTE` varchar(45) DEFAULT NULL,
  `ATTRIBUTE_DESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEEDBACK_CONFIG`
--

LOCK TABLES `FEEDBACK_CONFIG` WRITE;
/*!40000 ALTER TABLE `FEEDBACK_CONFIG` DISABLE KEYS */;
INSERT INTO `FEEDBACK_CONFIG` VALUES (1,'DEPTH','DEPTH_IN_SUBJECT'),(2,'COMM_SKILL','COMMUNICATION_SKILL'),(3,'RELATION','RELATIONSHIP_WITH_STUDENT'),(4,'CONFIDENCE','CONFIDENCE_IN_TEACHING'),(5,'PATIENCE','PATIENCE'),(6,'COMFORT','HOW FREE YOU FEEL TO ASK A QUESTION?'),(7,'PUNCTUALITY','HOW PUNCTUAL THE TEACHER IS'),(8,'INTEREST','HOW INTERSTING THE CLASS IS'),(9,'NOTES','HOW RELEVANT IS THAT NOTES TO STUDY');
/*!40000 ALTER TABLE `FEEDBACK_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEMESTER`
--

DROP TABLE IF EXISTS `SEMESTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEMESTER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `COURSE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `COURSE_ID_idx` (`COURSE_ID`),
  CONSTRAINT `fk_SEMESTER_1` FOREIGN KEY (`COURSE_ID`) REFERENCES `COURSE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEMESTER`
--

LOCK TABLES `SEMESTER` WRITE;
/*!40000 ALTER TABLE `SEMESTER` DISABLE KEYS */;
INSERT INTO `SEMESTER` VALUES (1,'Mca Semester 1',1),(2,'Mca Semester 2',1),(3,'Mca Semester 3',1),(4,'Mca Semester 4',1),(5,'Mca Semester 5',1),(6,'Mca Semester 6',1),(7,'Bca Semester 1',2),(8,'Bca Semester 2',2),(9,'Bca Semester 3',2),(10,'Bca Semester 4',2),(11,'Bca Semester 5',2),(12,'Bca Semester 6',2);
/*!40000 ALTER TABLE `SEMESTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEMESTER_SUBJECT_FACULTY`
--

DROP TABLE IF EXISTS `SEMESTER_SUBJECT_FACULTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEMESTER_SUBJECT_FACULTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEMESTER_ID` int(11) NOT NULL,
  `SUBJECT_ID` int(11) NOT NULL,
  `FACULTY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SEMESTER_SUBJECT_SEMID_idx` (`SEMESTER_ID`),
  KEY `SEMESTER_SUBJECT_SUBJECTID_idx` (`SUBJECT_ID`),
  KEY `fk_SEMESTER_SUBJECTS_1_idx` (`FACULTY_ID`),
  CONSTRAINT `fk_SEMESTER_SUBJECTS_1` FOREIGN KEY (`FACULTY_ID`) REFERENCES `USER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SEMESTER_SUBJECT_SEMID` FOREIGN KEY (`SEMESTER_ID`) REFERENCES `SEMESTER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SEMESTER_SUBJECT_SUBJECTID` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `SUBJECT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEMESTER_SUBJECT_FACULTY`
--

LOCK TABLES `SEMESTER_SUBJECT_FACULTY` WRITE;
/*!40000 ALTER TABLE `SEMESTER_SUBJECT_FACULTY` DISABLE KEYS */;
INSERT INTO `SEMESTER_SUBJECT_FACULTY` VALUES (5,6,1,804),(6,6,2,802),(7,6,3,803),(8,6,4,804),(9,6,5,805),(10,2,1,806),(12,2,2,802),(13,2,3,802),(14,2,4,803),(15,2,5,804);
/*!40000 ALTER TABLE `SEMESTER_SUBJECT_FACULTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STUDENT_SEM_ENROLL`
--

DROP TABLE IF EXISTS `STUDENT_SEM_ENROLL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STUDENT_SEM_ENROLL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STUDENT_ID` int(11) NOT NULL,
  `SEMESTER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `STUDENT_ID_idx` (`STUDENT_ID`),
  KEY `SEMESTER_ID_idx` (`SEMESTER_ID`),
  CONSTRAINT `SEMESTER_ID` FOREIGN KEY (`SEMESTER_ID`) REFERENCES `SEMESTER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `STUDENT_ID` FOREIGN KEY (`STUDENT_ID`) REFERENCES `USER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDENT_SEM_ENROLL`
--

LOCK TABLES `STUDENT_SEM_ENROLL` WRITE;
/*!40000 ALTER TABLE `STUDENT_SEM_ENROLL` DISABLE KEYS */;
INSERT INTO `STUDENT_SEM_ENROLL` VALUES (5,1218726001,6),(6,1218726019,6),(7,1218726036,6),(8,1218726018,6),(9,1218726022,6),(10,1218726046,6),(11,1218726003,6),(12,1218726012,6),(13,1218726028,6),(14,1218726052,6),(15,1218726041,6),(16,1218726043,6),(17,1218726009,6),(18,1218726023,6),(19,1218726016,6),(20,1218726006,6),(21,1218726032,6),(22,1218726051,6),(23,1218726044,6),(24,1218726040,6),(25,1218726021,6),(26,1218726007,6),(27,1218726053,6),(28,1218726004,6),(29,1218726031,6),(30,1218726025,6),(31,1218726005,6),(32,1218726047,6),(33,1218726055,6),(34,1218726035,6),(35,1218726027,6),(36,1218726030,6),(37,1218726014,6),(38,1218726011,6),(39,1218726010,6),(40,1218726017,6),(41,1218726002,6),(42,1218726045,6),(43,1218726034,6),(44,1218726029,6),(45,1218726039,6),(46,1218726026,6),(47,1218726015,6),(48,1218726024,6),(49,1218726033,6),(50,1218726008,6),(51,1218726042,6),(52,1218726038,6);
/*!40000 ALTER TABLE `STUDENT_SEM_ENROLL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUBJECT`
--

DROP TABLE IF EXISTS `SUBJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUBJECT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUBJECT`
--

LOCK TABLES `SUBJECT` WRITE;
/*!40000 ALTER TABLE `SUBJECT` DISABLE KEYS */;
INSERT INTO `SUBJECT` VALUES (1,'JAVA'),(2,'C'),(3,'ISAD'),(4,'UNIX'),(5,'C++'),(6,'Maths'),(7,'DBMS');
/*!40000 ALTER TABLE `SUBJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UNAME` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT 'PASSWORD',
  `FNAME` varchar(45) DEFAULT NULL,
  `LNAME` varchar(45) DEFAULT NULL,
  `UTYPE` varchar(45) NOT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `CASTE` varchar(45) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `NATIONALITY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNAME_UNIQUE` (`UNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1218726056 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'admin','PASSWORD','admin','admin','ADMIN',NULL,NULL,NULL,NULL,NULL),(802,'SOUMEN','PASSWORD','SOUMEN','SANTRA','FACULTY',NULL,NULL,NULL,NULL,NULL),(803,'HEMANTA','PASSWORD','HEMANTA','DEY','FACULTY',NULL,NULL,NULL,NULL,NULL),(804,'SUBHODIP','PASSWORD','SUBHODIP','MUKHERJEE','FACULTY',NULL,NULL,NULL,NULL,NULL),(805,'SORBANI','PASSWORD','SARBANI','GHOSH','FACULTY',NULL,NULL,NULL,NULL,NULL),(806,'ELIAS','PASSWORD','ELIAS','BISAS','FACULTY',NULL,NULL,NULL,NULL,NULL),(1218726001,'1218726001','PASSWORD','ADITYA','SAHA','STUDENT','rahul48roy@gmail.com','1990-09-16','GENERAL','M','INDIAN'),(1218726002,'1218726002','PASSWORD','SRIJIB','ROY','STUDENT','roysrijib@gmail.com','1990-06-01','GENERAL','M','INDIAN'),(1218726003,'1218726003','PASSWORD','ARNAB','KUMARPAL','STUDENT','arnabkumar89@gmail.com','1989-08-12','GENERAL','M','INDIAN'),(1218726004,'1218726004','PASSWORD','PC','PRADEEP','STUDENT','pc.pradeep6@gmail.com','1991-01-24','GENERAL','M','INDIAN'),(1218726005,'1218726005','PASSWORD','RAJARSHI','RAY','STUDENT','rajarshi.myself@gmail.com','1990-09-11','GENERAL','M','INDIAN'),(1218726006,'1218726006','PASSWORD','MOUSUMI','DAS','STUDENT','mousumi.das_1990@yahoo.co.in','1990-02-15','GENERAL','F','INDIAN'),(1218726007,'1218726007','PASSWORD','PARAG','KUMARACHARYYA','STUDENT','parag.acharyya@gmail.com','1992-02-21','GENERAL','M','INDIAN'),(1218726008,'1218726008','PASSWORD','SYED','SAHNAWAZKAIZER','STUDENT','sahnawazkaizer@gmail.com','1987-05-01','GENERAL','M','INDIAN'),(1218726009,'1218726009','PASSWORD','KAUSTAV','DAS','STUDENT','recordofkaustav@gmail.com','1989-12-28','GENERAL','M','INDIAN'),(1218726010,'1218726010','PASSWORD','SOUVIK','PAUL','STUDENT','souvikpaul5@gmail.com','1990-04-28','GENERAL','M','INDIAN'),(1218726011,'1218726011','PASSWORD','SOUVICK','DAS','STUDENT','dassouvick@ymail.com','1990-03-22','GENERAL','M','INDIAN'),(1218726012,'1218726012','PASSWORD','ARUN','KUMARSINGH','STUDENT','singh.arun721@gmail.com','1990-07-24','GENERAL','M','INDIAN'),(1218726014,'1218726014','PASSWORD','SOMERITA','DHARA','STUDENT','somerita13.dear@gmail.com','1991-04-03','GENERAL','F','INDIAN'),(1218726015,'1218726015','PASSWORD','SUDIPTA','SEN','STUDENT','sudipta.sen62@yahoo.com','1991-03-25','GENERAL','M','INDIAN'),(1218726016,'1218726016','PASSWORD','MANNYA','SARKAR','STUDENT','mannyasarkar.89@gmail.com','1989-04-09','GENERAL','M','INDIAN'),(1218726017,'1218726017','PASSWORD','SOUVIK','SARKAR','STUDENT','souviksarkar52@hotmail.com','1991-06-05','GENERAL','M','INDIAN'),(1218726018,'1218726018','PASSWORD','ANASUYA','CHANDA','STUDENT','pritha22rocks@gmail.com','1990-12-22','GENERAL','F','INDIAN'),(1218726019,'1218726019','PASSWORD','AJIT','TRIPATHI','STUDENT','ajit.tripathi01@gmail.com','1991-01-15','GENERAL','M','INDIAN'),(1218726021,'1218726021','PASSWORD','PALLABI','ROY','STUDENT','pallabi.roy6@gmail.com','1990-12-11','GENERAL','F','INDIAN'),(1218726022,'1218726022','PASSWORD','ANKITA','GANGULY','STUDENT','ankitaganguly.04@gmail.com','1991-04-05','GENERAL','F','INDIAN'),(1218726023,'1218726023','PASSWORD','MAITRAYEE','SARKAR','STUDENT','ms.sarkarr@gmail.com','1991-11-12','GENERAL','F','INDIAN'),(1218726024,'1218726024','PASSWORD','SUKHDEEP','KAUR','STUDENT','sukhdeep.forever@gmail.com','1989-07-10','GENERAL','F','INDIAN'),(1218726025,'1218726025','PASSWORD','RAHUL','KUMARMISHRA','STUDENT','love2program20@hotmail.com','1991-02-15','GENERAL','M','INDIAN'),(1218726026,'1218726026','PASSWORD','SUBINOY','JOARDAR','STUDENT','subi.joardar@gmail.com','1989-03-07','SC','M','INDIAN'),(1218726027,'1218726027','PASSWORD','SHUBHAYAN','SAHA','STUDENT','musicalshub@gmail.com','1990-10-08','GENERAL','M','INDIAN'),(1218726028,'1218726028','PASSWORD','AVIJIT','SAHOO','STUDENT','avijit99c@gmail.com','1992-01-04','OBC','M','INDIAN'),(1218726029,'1218726029','PASSWORD','SUBHARANJAN','BASU','STUDENT','coolsubha1991@gmail.com','1992-11-02','GENERAL','M','INDIAN'),(1218726030,'1218726030','PASSWORD','SOMA','CHOWDHURY','STUDENT','coolsoma19991@yahoo.com','1992-04-16','GENERAL','F','INDIAN'),(1218726031,'1218726031','PASSWORD','PRATIK','RAY','STUDENT','luxrayguardian@gmail.com','1989-03-16','GENERAL','M','INDIAN'),(1218726032,'1218726032','PASSWORD','MOYUKH','LAHIRI','STUDENT','moyukh14@gmail.com','1990-08-14','GENERAL','M','INDIAN'),(1218726033,'1218726033','PASSWORD','SUMAN','BOSE','STUDENT','bosesuman13@gmail.com','1986-10-13','GENERAL','M','INDIAN'),(1218726034,'1218726034','PASSWORD','SUBHAJIT','MONDAL','STUDENT','subhajit991@gmail.com','1991-02-28','GENERAL','M','INDIAN'),(1218726035,'1218726035','PASSWORD','SHANKHA','CHOUDHURI','STUDENT','choudhuri.shankha@gmail.com','1991-05-04','GENERAL','M','INDIAN'),(1218726036,'1218726036','PASSWORD','ANANDA','JANA','STUDENT','janaananda100@gmail.com','1990-03-27','GENERAL','M','INDIAN'),(1218726038,'1218726038','PASSWORD','TARUN','KUMARGHOSH','STUDENT','sendemail2tarun@gmail.com','1988-06-10','GENERAL','M','INDIAN'),(1218726039,'1218726039','PASSWORD','SUBHASISH','DAS','STUDENT','tends2subhasish@gmail.com','1988-06-18','SC','M','INDIAN'),(1218726040,'1218726040','PASSWORD','NAREN','MONDAL','STUDENT','narenmondal55@gmail.com','1990-03-24','GENERAL','M','INDIAN'),(1218726041,'1218726041','PASSWORD','DEBASISH','SASMAL','STUDENT','deb.sasmal0000@gmail.com','1991-03-26','GENERAL','M','INDIAN'),(1218726042,'1218726042','PASSWORD','TAMALIKA','PATTANAYAK','STUDENT','tamalika.pattanayak0000@gmail.com','1991-07-30','GENERAL','F','INDIAN'),(1218726043,'1218726043','PASSWORD','GARGI','BANERJEE','STUDENT','gargib26@gmail.com','1991-06-10','GENERAL','F','INDIAN'),(1218726044,'1218726044','PASSWORD','NAIRITA','GHOSH','STUDENT','nairita.dear4u@gmail.com','1988-03-09','OBC','F','INDIAN'),(1218726045,'1218726045','PASSWORD','SUBHAJIT','GUPTA','STUDENT','subhojit17@gmail.com','1990-12-17','GENERAL','M','INDIAN'),(1218726046,'1218726046','PASSWORD','ARNAB','CHARAN','STUDENT','arnab1234.a@gmail.com','1991-05-09','GENERAL','M','INDIAN'),(1218726047,'1218726047','PASSWORD','RAKESH','KUMARSINGH','STUDENT','rsingh151990@gmail.com','1990-05-15','GENERAL','M','INDIAN'),(1218726051,'1218726051','PASSWORD','MUKUNDA','MONDAL','STUDENT','mukunda.25@gmail.com','1989-02-21','SC','M','INDIAN'),(1218726052,'1218726052','PASSWORD','BARSHA','MUKHERJEE','STUDENT','barshachess25@gmail.com','1991-06-25','GENERAL','F','INDIAN'),(1218726053,'1218726053','PASSWORD','PARTHA','DEY','STUDENT','parthadey1991@gmail.com','1991-01-28','GENERAL','M','INDIAN'),(1218726055,'1218726055','PASSWORD','SAPARNA','PALCHOWDHURY','STUDENT','suparnapal@gmail.com','1899-12-31','GENERAL','F','INDIAN');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-16 12:37:50
