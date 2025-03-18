CREATE DATABASE  IF NOT EXISTS `library_v3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library_v3`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: library_group_3
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `AuthorID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'J.K.','Rowling'),(2,'Jane','Austen'),(3,'David','Nicholls'),(4,'William','Shakespeare'),(5,'Beatrix','Potter'),(6,'Harper','Lee');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_book`
--

DROP TABLE IF EXISTS `author_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_book` (
  `AuthorID` int NOT NULL,
  `BookID` int NOT NULL,
  KEY `AuthorID` (`AuthorID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `author_book_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`AuthorID`),
  CONSTRAINT `author_book_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_book`
--

LOCK TABLES `author_book` WRITE;
/*!40000 ALTER TABLE `author_book` DISABLE KEYS */;
INSERT INTO `author_book` VALUES (1,1),(1,2),(2,3),(3,4),(4,5),(5,6),(6,7);
/*!40000 ALTER TABLE `author_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `BookLanguageID` int NOT NULL,
  `GenreID` int NOT NULL,
  `ISBN` bigint NOT NULL,
  `Title` varchar(200) NOT NULL,
  `PublicationYear` int NOT NULL,
  PRIMARY KEY (`BookID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `BookLanguageID` (`BookLanguageID`),
  KEY `GenreID` (`GenreID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`BookLanguageID`) REFERENCES `booklanguage` (`BookLanguageID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`),
  CONSTRAINT `book_chk_1` CHECK (regexp_like(`ISBN`,_utf8mb4'^[0-9]{13}$')),
  CONSTRAINT `book_chk_2` CHECK ((`PublicationYear` between 1000 and 9999))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,1,1,9780747532699,'Harry Potter',1997),(2,2,1,9788498382662,'Harry Potter y la piedra filosofal',2010),(3,1,3,9780140434262,'Pride and Prejudice',1813),(4,1,3,9781405265204,'One Day',2009),(5,1,3,9781234566543,'Much Ado About Nothing',1993),(6,1,4,9780723247702,'The Tale of Peter Rabbit',1902),(7,1,6,9780061120084,'To Kill a Mockingbird',1960);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booklanguage`
--

DROP TABLE IF EXISTS `booklanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booklanguage` (
  `BookLanguageID` int NOT NULL AUTO_INCREMENT,
  `BookLanguage` varchar(100) NOT NULL,
  PRIMARY KEY (`BookLanguageID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booklanguage`
--

LOCK TABLES `booklanguage` WRITE;
/*!40000 ALTER TABLE `booklanguage` DISABLE KEYS */;
INSERT INTO `booklanguage` VALUES (1,'English'),(2,'Spanish'),(3,'Japanese'),(4,'German'),(5,'French'),(6,'Greek'),(7,'Polish');
/*!40000 ALTER TABLE `booklanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copy`
--

DROP TABLE IF EXISTS `copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copy` (
  `CopyID` int NOT NULL AUTO_INCREMENT,
  `BookID` int NOT NULL,
  `CopyStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CopyID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`),
  CONSTRAINT `copy_chk_1` CHECK ((`CopyStatus` in (_utf8mb4'Borrowed',_utf8mb4'Available')))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copy`
--

LOCK TABLES `copy` WRITE;
/*!40000 ALTER TABLE `copy` DISABLE KEYS */;
INSERT INTO `copy` VALUES (1,1,'Borrowed'),(2,1,'Borrowed'),(3,1,'Available'),(4,2,'Borrowed'),(5,2,'Available'),(6,3,'Available'),(7,3,'Borrowed'),(8,3,'Available'),(9,4,'Available'),(10,5,'Available'),(11,6,'Available'),(12,6,'Available'),(13,6,'Available'),(14,7,'Available'),(15,7,'Available');
/*!40000 ALTER TABLE `copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `GenreID` int NOT NULL AUTO_INCREMENT,
  `Genre` varchar(50) NOT NULL,
  `Location` varchar(2) NOT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Fantasy','F'),(2,'Sci-Fi','G'),(3,'Romance','A'),(4,'Children\'s Fiction','C'),(5,'Horror','B'),(6,'Thriller','T');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `LoanID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `CopyID` int NOT NULL,
  `BorrowDate` date NOT NULL DEFAULT (curdate()),
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`LoanID`),
  KEY `UserID` (`UserID`),
  KEY `CopyID` (`CopyID`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`CopyID`) REFERENCES `copy` (`CopyID`),
  CONSTRAINT `loan_chk_1` CHECK (((`ReturnDate` is null) or (`ReturnDate` >= `BorrowDate`)))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,1,2,'2025-03-03',NULL),(2,4,6,'2025-02-24','2025-03-08'),(3,4,3,'2025-02-24','2025-03-08'),(4,4,7,'2025-02-24','2025-03-08'),(5,6,3,'2025-02-15','2025-03-05'),(6,6,1,'2025-02-15','2025-03-05'),(7,5,1,'2025-03-07',NULL),(8,7,4,'2025-02-24',NULL),(9,8,7,'2025-02-28',NULL);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `UserType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserEmail` (`UserEmail`),
  CONSTRAINT `user_chk_1` CHECK ((`UserEmail` like _utf8mb4'%_@_%._%')),
  CONSTRAINT `user_chk_2` CHECK ((`UserType` in (_utf8mb4'member',_utf8mb4'librarian')))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Emily','K','we@sd.com','member'),(2,'Daphne','M','sde@sd.com','Librarian'),(3,'Malvina','F','dte@sd.com','Librarian'),(4,'Ivon','Martinez','dthe@sd.com','Librarian'),(5,'Anna','Koutsaki','lerc@sd.com','Member'),(6,'Leo','Jones','jgdte@sd.com','Member'),(7,'William','Davis','dlkjthe@sd.com','Member'),(8,'Tim','Brown','lerqwc@sd.com','Member'),(10,'John','K','qe@sd.com','member');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vborrowedbooks`
--

DROP TABLE IF EXISTS `vborrowedbooks`;
/*!50001 DROP VIEW IF EXISTS `vborrowedbooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vborrowedbooks` AS SELECT 
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Title`,
 1 AS `BorrowDate`,
 1 AS `CopyStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vshowallusers`
--

DROP TABLE IF EXISTS `vshowallusers`;
/*!50001 DROP VIEW IF EXISTS `vshowallusers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vshowallusers` AS SELECT 
 1 AS `UserID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `UserEmail`,
 1 AS `Title`,
 1 AS `BorrowDate`,
 1 AS `ReturnDate`,
 1 AS `LoanID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vshowloancount`
--

DROP TABLE IF EXISTS `vshowloancount`;
/*!50001 DROP VIEW IF EXISTS `vshowloancount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vshowloancount` AS SELECT 
 1 AS `UserID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `UserEmail`,
 1 AS `NumberOfLoans`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'library_group_3'
--
/*!50003 DROP PROCEDURE IF EXISTS `pReturnBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pReturnBook`(in FirstName VARCHAR(50), in LastName VARCHAR(100), in Email VARCHAR(100) )
BEGIN
	select FirstName,LastName, UserEmail,Title, ReturnDate from vShowAllUsers;
    UPDATE vShowAllUsers set ReturnDate=CURDATE()
    WHERE Email = UserEmail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(in FirstName  VARCHAR(50), in LastName VARCHAR(100), in UserEmail VARCHAR(100), in UserType VARCHAR(20))
BEGIN
	INSERT INTO User(FirstName, LastName, UserEmail, UserType)
	VALUES(FirstName, LastName, UserEmail, UserType);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vborrowedbooks`
--

/*!50001 DROP VIEW IF EXISTS `vborrowedbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vborrowedbooks` AS select `u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`b`.`Title` AS `Title`,`l`.`BorrowDate` AS `BorrowDate`,`c`.`CopyStatus` AS `CopyStatus` from (((`user` `u` join `loan` `l` on((`u`.`UserID` = `l`.`UserID`))) join `copy` `c` on((`l`.`CopyID` = `c`.`CopyID`))) join `book` `b` on((`c`.`BookID` = `b`.`BookID`))) where (`l`.`ReturnDate` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vshowallusers`
--

/*!50001 DROP VIEW IF EXISTS `vshowallusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vshowallusers` AS select `u`.`UserID` AS `UserID`,`u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`u`.`UserEmail` AS `UserEmail`,`b`.`Title` AS `Title`,`l`.`BorrowDate` AS `BorrowDate`,`l`.`ReturnDate` AS `ReturnDate`,`l`.`LoanID` AS `LoanID` from (((`user` `u` left join `loan` `l` on((`u`.`UserID` = `l`.`UserID`))) left join `copy` `c` on((`l`.`CopyID` = `c`.`CopyID`))) left join `book` `b` on((`c`.`BookID` = `b`.`BookID`))) order by `u`.`LastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vshowloancount`
--

/*!50001 DROP VIEW IF EXISTS `vshowloancount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vshowloancount` AS select `u`.`UserID` AS `UserID`,`u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`u`.`UserEmail` AS `UserEmail`,count(`l`.`LoanID`) AS `NumberOfLoans` from (`user` `u` left join `loan` `l` on((`u`.`UserID` = `l`.`UserID`))) group by `u`.`UserID`,`u`.`FirstName`,`u`.`LastName`,`u`.`UserEmail` order by `u`.`LastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-18 21:01:22
