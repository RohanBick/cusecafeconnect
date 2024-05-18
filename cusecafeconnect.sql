-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: cusecafeconnect
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `cafe`
--

DROP TABLE IF EXISTS `cafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe` (
  `cafeID` int NOT NULL,
  `cafeName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cafeLat` double NOT NULL,
  `cafeLong` double NOT NULL,
  PRIMARY KEY (`cafeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe`
--

LOCK TABLES `cafe` WRITE;
/*!40000 ALTER TABLE `cafe` DISABLE KEYS */;
INSERT INTO `cafe` VALUES (0,'Student',0,0),(101,'Olstein',43.0421976,-76.1338462),(102,'Pages Cafe',43.0397533,-76.1350572),(103,'Halal Shack',42.6848168,-73.8242641),(104,'Dunkin\'',43.040012,-76.1340123),(105,'Slocum Cafe',43.0376723,-76.1343945),(106,'Pandas',40.7272402,-74.0379834),(107,'Eggers Café',43.0380258,-76.1376541),(113,'General',0,0);
/*!40000 ALTER TABLE `cafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Coordinator',0),(2,'Supervisor',0),(3,'Student',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `scheduleID` int NOT NULL AUTO_INCREMENT,
  `timeSlotID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `cafeID` int DEFAULT NULL,
  `isAccepted` tinyint DEFAULT NULL,
  `requestComments` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`scheduleID`),
  KEY `timeSlotID_idx` (`timeSlotID`),
  KEY `cafeID_idx` (`cafeID`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `cafeID` FOREIGN KEY (`cafeID`) REFERENCES `cafe` (`cafeID`),
  CONSTRAINT `timeSlotID` FOREIGN KEY (`timeSlotID`) REFERENCES `timeSlot` (`timeSlotID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,301,1234,101,1,NULL),(2,306,1234,101,1,'Shift Assigned'),(3,312,1234,101,1,NULL),(4,302,4567,101,1,NULL),(5,307,4567,101,1,NULL),(6,304,6348,101,1,NULL),(7,312,6348,101,2,'no'),(8,316,4567,101,1,'Shift Assigned'),(9,301,6348,102,1,NULL),(10,302,1234,102,2,'no'),(11,302,123456789,102,1,'approved'),(12,302,222222222,102,2,'not avaiable'),(13,307,222222222,102,1,'approved'),(14,303,270526533,101,1,'you can work from next monday'),(15,309,270526533,101,1,'you can work'),(16,324,270526533,101,2,'extra rejected'),(17,324,270526533,101,1,'request accepted'),(18,318,222999888,101,1,'accept');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_cafe_group`
--

DROP TABLE IF EXISTS `stu_cafe_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stu_cafe_group` (
  `stuCafeGrpID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `cafeID` int DEFAULT NULL,
  `isAccepted` tinyint NOT NULL,
  PRIMARY KEY (`stuCafeGrpID`),
  KEY `user_idx` (`userID`),
  KEY `cafe_idx` (`cafeID`),
  CONSTRAINT `cafe` FOREIGN KEY (`cafeID`) REFERENCES `cafe` (`cafeID`),
  CONSTRAINT `user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_cafe_group`
--

LOCK TABLES `stu_cafe_group` WRITE;
/*!40000 ALTER TABLE `stu_cafe_group` DISABLE KEYS */;
INSERT INTO `stu_cafe_group` VALUES (0,1234,101,1),(1,4567,101,1),(2,6348,101,1),(3,123456789,102,1),(4,222222222,102,1),(5,270526533,101,1),(6,222999888,101,1);
/*!40000 ALTER TABLE `stu_cafe_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subBook`
--

DROP TABLE IF EXISTS `subBook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subBook` (
  `subID` int NOT NULL AUTO_INCREMENT,
  `subTypeID` int DEFAULT NULL,
  `dropDate` date DEFAULT NULL,
  `dropUser` int DEFAULT NULL,
  `pickUpUser` int DEFAULT NULL,
  `acceptSub` tinyint DEFAULT NULL,
  `cafeID` int DEFAULT NULL,
  `scheduleID` int DEFAULT NULL,
  `comments` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`subID`),
  KEY `dropUser_idx` (`dropUser`),
  KEY `pickUpUser_idx` (`pickUpUser`),
  KEY `cafeID_idx` (`cafeID`),
  KEY `scID_idx` (`scheduleID`),
  CONSTRAINT `cID` FOREIGN KEY (`cafeID`) REFERENCES `cafe` (`cafeID`),
  CONSTRAINT `dUID` FOREIGN KEY (`dropUser`) REFERENCES `user` (`userID`),
  CONSTRAINT `pUID` FOREIGN KEY (`pickUpUser`) REFERENCES `user` (`userID`),
  CONSTRAINT `scID` FOREIGN KEY (`scheduleID`) REFERENCES `schedule` (`scheduleID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subBook`
--

LOCK TABLES `subBook` WRITE;
/*!40000 ALTER TABLE `subBook` DISABLE KEYS */;
INSERT INTO `subBook` VALUES (23,1,'2024-05-08',1234,4567,1,101,3,'\"\"'),(24,1,'2024-04-29',1234,222999888,1,101,1,'\"\"'),(25,1,'2024-05-14',222222222,1234,2,102,13,'\"you dont work here\"'),(26,1,'2024-05-14',222222222,123456789,1,102,13,'\"\"'),(27,1,'2024-05-01',1234,NULL,0,101,3,'sgfrtg'),(28,1,'2024-05-20',123456789,NULL,0,102,11,'i am sick'),(29,1,'2024-05-15',1234,270526533,1,101,3,'\"\"'),(30,1,'2024-05-06',270526533,1234,1,101,14,'\"\"'),(31,1,'2024-05-06',270526533,123456789,2,101,14,'\"not working in this cafe\"'),(32,1,'2024-04-29',1234,270526533,2,101,1,'\"already sub took\"');
/*!40000 ALTER TABLE `subBook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeSlot`
--

DROP TABLE IF EXISTS `timeSlot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeSlot` (
  `timeSlotID` int NOT NULL,
  `timeSlot` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeSlotDay` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`timeSlotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeSlot`
--

LOCK TABLES `timeSlot` WRITE;
/*!40000 ALTER TABLE `timeSlot` DISABLE KEYS */;
INSERT INTO `timeSlot` VALUES (301,'8:00am - 12:00am','Monday'),(302,'9:00am - 1:00pm','Monday'),(303,'10:00am - 2:00pm','Monday'),(304,'11:00am - 3:00pm','Monday'),(305,'12:00pm - 3:30pm','Monday'),(306,'8:00am - 12:00pm','Tuesday'),(307,'9:00am - 1:00pm','Tuesday'),(308,'10:00am - 2:00pm','Tuesday'),(309,'11:00am - 3:00pm','Tuesday'),(310,'12:00pm - 3:30pm','Tuesday'),(311,'8:00am - 12:00pm','Wednesday'),(312,'9:00am - 1:00pm','Wednesday'),(313,'10:00am - 2:00pm','Wednesday'),(314,'11:00am - 3:00pm','Wednesday'),(315,'12:00pm - 3:30pm','Wednesday'),(316,'8:00am - 12:00pm','Thursday'),(317,'9:00am - 1:00pm','Thursday'),(318,'10:00am - 2:00pm','Thursday'),(319,'11:00am - 3:00pm','Thursday'),(320,'12:00pm - 3:30pm','Thursday'),(321,'8:00am - 12:00pm','Friday'),(322,'9:00am - 1:00pm','Friday'),(323,'10:00am - 2:00pm','Friday'),(324,'11:00am - 3:00pm','Friday'),(325,'12:00pm - 3:30pm','Friday');
/*!40000 ALTER TABLE `timeSlot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL,
  `userEmail` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleID` int DEFAULT NULL,
  `cafeID` int DEFAULT NULL,
  `photoPath` blob,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`),
  UNIQUE KEY `phoneNo_UNIQUE` (`phoneNo`),
  KEY `roles_idx` (`roleID`),
  KEY `cafeID_idx` (`cafeID`),
  CONSTRAINT `cafeuserID` FOREIGN KEY (`cafeID`) REFERENCES `cafe` (`cafeID`),
  CONSTRAINT `roles` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1043,'dikshita@gmail.com,','diskhita','patel','823','3158865396',3,103,_binary 'dsfsdc'),(1234,'rohan@gmail.com','Rohan','Bhowmick','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','3158865393',3,101,NULL),(4567,'meeti@gmail.com','meeti','shah','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','3158865391',3,101,_binary 'dsfsdc'),(4903,'cafe@gmail.com','olstein','supervisor','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','3158865395',2,101,_binary 'dsfsdc'),(6348,'jaynam@gmail.com,','jaynam','sanghavi','975','3158865392',3,101,_binary 'dsfsdc'),(8011,'kavish@gmail.com,','kavish','shah','5620','3158865398',3,105,_binary 'dsfsdc'),(8765,'karen@gmail.com','Karen','Burray','34354635','123456789',2,101,NULL),(9023,'niddhi@gmail.com,','niddhi','chauhan','42378','3158865397',3,104,_binary 'dsfsdc'),(9345,'deena@gmail.com','deena','capria','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','3158865394',1,0,_binary 'dsfsdc'),(102102,'pages@gmail.com','pages','sup','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','1111111111',2,102,NULL),(123456789,'raj@gmail.com','Raj','Shah','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','1934820781',3,0,NULL),(222222222,'harsh@gmail.com','Harsh','M','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','33333',3,0,NULL),(222999888,'test@user.com','Test','User','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','222999888',3,0,NULL),(270526533,'jsanghav@syr.edu','jaynam','sanghavi','efc8fba9489b1d63fb2efe99f2695aa40a8e3ee9c00738145ddd632f8c4c39d2','5405433333',3,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 23:03:46
