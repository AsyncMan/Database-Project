/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: test_BCNF
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES
(1,'Mathematics'),
(2,'Physics'),
(3,'Chemistry'),
(4,'Biology'),
(5,'Computer Science');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeptRoom`
--

DROP TABLE IF EXISTS `DeptRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeptRoom` (
  `RoomNo` int(11) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dept` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Dept` (`Dept`),
  CONSTRAINT `DeptRoom_ibfk_1` FOREIGN KEY (`Dept`) REFERENCES `Department` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeptRoom`
--

LOCK TABLES `DeptRoom` WRITE;
/*!40000 ALTER TABLE `DeptRoom` DISABLE KEYS */;
INSERT INTO `DeptRoom` VALUES
(526,1,5),
(202,2,2),
(303,3,3),
(404,4,4),
(505,5,5),
(601,6,1);
/*!40000 ALTER TABLE `DeptRoom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fund`
--

DROP TABLE IF EXISTS `Fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fund` (
  `Id` int(11) NOT NULL,
  `Allocated` int(11) NOT NULL,
  `Used` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fund`
--

LOCK TABLES `Fund` WRITE;
/*!40000 ALTER TABLE `Fund` DISABLE KEYS */;
INSERT INTO `Fund` VALUES
(1,100000,50000),
(2,200000,150000),
(3,50000,30000),
(4,150000,120000),
(5,300000,200000);
/*!40000 ALTER TABLE `Fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Journal`
--

DROP TABLE IF EXISTS `Journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Journal` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Field` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Journal`
--

LOCK TABLES `Journal` WRITE;
/*!40000 ALTER TABLE `Journal` DISABLE KEYS */;
INSERT INTO `Journal` VALUES
(1,'Journal of Applied Mathematics','Mathematics'),
(2,'Physics Review Letters','Physics'),
(3,'Chemical Engineering Journal','Chemistry'),
(4,'Biology Today','Biology'),
(5,'Computer Science Advances','Computer Science'),
(6,'Journal of Computer Vision','Computer Science');
/*!40000 ALTER TABLE `Journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publication`
--

DROP TABLE IF EXISTS `Publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication` (
  `Id` int(11) NOT NULL,
  `ReleaseId` int(11) NOT NULL,
  `ProjectProgress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ReleaseId` (`ReleaseId`),
  CONSTRAINT `Publication_ibfk_1` FOREIGN KEY (`ReleaseId`) REFERENCES `ReleaseDetail` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publication`
--

LOCK TABLES `Publication` WRITE;
/*!40000 ALTER TABLE `Publication` DISABLE KEYS */;
INSERT INTO `Publication` VALUES
(1,1,'In Progress'),
(2,2,'Completed'),
(3,3,'In Review'),
(4,4,'Not Started'),
(5,5,'In Progress');
/*!40000 ALTER TABLE `Publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReleaseDetail`
--

DROP TABLE IF EXISTS `ReleaseDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReleaseDetail` (
  `Id` int(11) NOT NULL,
  `JournalId` int(11) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `JournalId` (`JournalId`),
  CONSTRAINT `ReleaseDetail_ibfk_1` FOREIGN KEY (`JournalId`) REFERENCES `Journal` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReleaseDetail`
--

LOCK TABLES `ReleaseDetail` WRITE;
/*!40000 ALTER TABLE `ReleaseDetail` DISABLE KEYS */;
INSERT INTO `ReleaseDetail` VALUES
(1,2,'2024-01-10'),
(2,NULL,NULL),
(3,1,NULL),
(4,NULL,NULL),
(5,NULL,NULL);
/*!40000 ALTER TABLE `ReleaseDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Research`
--

DROP TABLE IF EXISTS `Research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Research` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `WorkingGroup` int(11) DEFAULT NULL,
  `Publication` int(11) DEFAULT NULL,
  `Fund` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Publication` (`Publication`),
  KEY `WorkingGroup` (`WorkingGroup`),
  KEY `Fund` (`Fund`),
  CONSTRAINT `Research_ibfk_1` FOREIGN KEY (`Publication`) REFERENCES `Publication` (`Id`),
  CONSTRAINT `Research_ibfk_2` FOREIGN KEY (`WorkingGroup`) REFERENCES `WorkingGroup` (`Id`),
  CONSTRAINT `Research_ibfk_3` FOREIGN KEY (`Fund`) REFERENCES `Fund` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Research`
--

LOCK TABLES `Research` WRITE;
/*!40000 ALTER TABLE `Research` DISABLE KEYS */;
INSERT INTO `Research` VALUES
(1,'Quantum Computing Research',1,1,1),
(2,'Nanotechnology in Medicine',2,2,2),
(3,'Bioinformatics and AI',3,3,3),
(4,'Sustainable Energy Solutions',4,4,4),
(5,'Data Security in Cloud Computing',5,5,5);
/*!40000 ALTER TABLE `Research` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Researcher`
--

DROP TABLE IF EXISTS `Researcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Researcher` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `DeptRoom` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `DeptRoom` (`DeptRoom`),
  CONSTRAINT `Researcher_ibfk_1` FOREIGN KEY (`DeptRoom`) REFERENCES `DeptRoom` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Researcher`
--

LOCK TABLES `Researcher` WRITE;
/*!40000 ALTER TABLE `Researcher` DISABLE KEYS */;
INSERT INTO `Researcher` VALUES
(1,'Alice Johnson','123-456-7890',1),
(2,'Bob Smith','234-567-8901',2),
(3,'Carol White','345-678-9012',3),
(4,'David Black','456-789-0123',4),
(5,'Eva Green','567-890-1234',5),
(6,'Bob Smith','981231231',6);
/*!40000 ALTER TABLE `Researcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkingGroup`
--

DROP TABLE IF EXISTS `WorkingGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkingGroup` (
  `Id` int(11) NOT NULL,
  `Dept` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkingGroup`
--

LOCK TABLES `WorkingGroup` WRITE;
/*!40000 ALTER TABLE `WorkingGroup` DISABLE KEYS */;
INSERT INTO `WorkingGroup` VALUES
(1,'Quantum Computing'),
(2,'Nanotechnology'),
(3,'AI & Bioinformatics'),
(4,'Sustainable Energy'),
(5,'Cybersecurity');
/*!40000 ALTER TABLE `WorkingGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkingGroupMember`
--

DROP TABLE IF EXISTS `WorkingGroupMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkingGroupMember` (
  `Id` int(11) NOT NULL,
  `WorkingGroup` int(11) NOT NULL,
  `Researcher` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `WorkingGroup` (`WorkingGroup`),
  KEY `Researcher` (`Researcher`),
  CONSTRAINT `WorkingGroupMember_ibfk_1` FOREIGN KEY (`WorkingGroup`) REFERENCES `WorkingGroup` (`Id`),
  CONSTRAINT `WorkingGroupMember_ibfk_2` FOREIGN KEY (`Researcher`) REFERENCES `Researcher` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkingGroupMember`
--

LOCK TABLES `WorkingGroupMember` WRITE;
/*!40000 ALTER TABLE `WorkingGroupMember` DISABLE KEYS */;
INSERT INTO `WorkingGroupMember` VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);
/*!40000 ALTER TABLE `WorkingGroupMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test_BCNF'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ChangeResearcherDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`specialist`@`localhost` PROCEDURE `ChangeResearcherDepartment`(IN researcher_id INT, IN new_room INT, IN new_dept_id INT)
BEGIN

DECLARE deptroom_id INT;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN

ROLLBACK;
SHOW ERRORS;
END;

DECLARE EXIT HANDLER FOR NOT FOUND
BEGIN
ROLLBACK;
SHOW ERRORS;
END;

DECLARE EXIT HANDLER FOR SQLSTATE '23000'
BEGIN

SELECT 'Error: No room assigned to the Researcher' AS Message;
END;

START TRANSACTION;

SELECT new_room As Room;
SELECT new_dept_id As Dept;
SELECT researcher_id As Researcher;

SELECT DeptRoom INTO deptroom_id FROM Researcher WHERE Id = researcher_id;

SELECT deptroom_id As message;

IF (deptroom_id IS NULL) THEN
SELECT "NULL deptRoom ID" AS MESSAGE;
SIGNAL SQLSTATE '23000';
END IF;

UPDATE DeptRoom SET RoomNo = new_room where Id = deptroom_id;
UPDATE DeptRoom SET Dept = new_dept_id where Id = deptroom_id;

COMMIT;

SELECT 'Researcher department updated successfully.' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-12-31 21:32:09
