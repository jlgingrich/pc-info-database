-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: pc_information
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS `laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptop` (
  `model` varchar(4) NOT NULL,
  `speed` decimal(5,2) DEFAULT NULL,
  `ram` int DEFAULT NULL,
  `hd` int DEFAULT NULL,
  `screen` decimal(5,2) DEFAULT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`model`),
  UNIQUE KEY `Laptop_by_price` (`model`,`price`),
  CONSTRAINT `laptop_ibfk_1` FOREIGN KEY (`model`) REFERENCES `product` (`model`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `laptop_chk_1` CHECK ((`speed` > 0)),
  CONSTRAINT `laptop_chk_2` CHECK ((`ram` > 0)),
  CONSTRAINT `laptop_chk_3` CHECK ((`hd` > 0)),
  CONSTRAINT `laptop_chk_4` CHECK ((`screen` > 0)),
  CONSTRAINT `laptop_chk_5` CHECK ((`price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

LOCK TABLES `laptop` WRITE;
/*!40000 ALTER TABLE `laptop` DISABLE KEYS */;
INSERT INTO `laptop` VALUES ('2001',2.00,2048,240,20.10,3673),('2002',1.73,1024,80,17.00,949),('2003',1.80,512,60,15.40,549),('2004',2.00,512,60,13.30,1150),('2005',2.16,1024,120,17.00,2500),('2006',2.00,2048,80,15.40,1700),('2007',1.83,1024,120,13.30,1429),('2008',1.60,1024,100,15.40,900),('2009',1.60,512,80,14.10,680),('2010',2.00,2048,160,15.40,2300);
/*!40000 ALTER TABLE `laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `laptop_extended_info`
--

DROP TABLE IF EXISTS `laptop_extended_info`;
/*!50001 DROP VIEW IF EXISTS `laptop_extended_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `laptop_extended_info` AS SELECT 
 1 AS `model`,
 1 AS `speed`,
 1 AS `ram`,
 1 AS `hd`,
 1 AS `price`,
 1 AS `maker`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pc`
--

DROP TABLE IF EXISTS `pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc` (
  `model` varchar(4) NOT NULL,
  `speed` decimal(5,2) DEFAULT NULL,
  `ram` int DEFAULT NULL,
  `hd` int DEFAULT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`model`),
  UNIQUE KEY `PC_by_price` (`model`,`price`),
  UNIQUE KEY `Printer_by_price` (`model`,`price`),
  CONSTRAINT `pc_ibfk_1` FOREIGN KEY (`model`) REFERENCES `product` (`model`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pc_chk_1` CHECK ((`speed` > 0)),
  CONSTRAINT `pc_chk_2` CHECK ((`ram` > 0)),
  CONSTRAINT `pc_chk_3` CHECK ((`hd` > 0)),
  CONSTRAINT `pc_chk_4` CHECK ((`price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc`
--

LOCK TABLES `pc` WRITE;
/*!40000 ALTER TABLE `pc` DISABLE KEYS */;
INSERT INTO `pc` VALUES ('1001',2.66,1024,250,2114),('1002',2.10,512,250,995),('1003',1.42,512,80,478),('1004',2.80,1024,250,649),('1005',3.20,512,250,630),('1006',3.20,1024,320,1049),('1007',2.20,1024,200,510),('1008',2.20,2048,250,770),('1009',2.00,1024,250,650),('1010',2.80,2048,300,770),('1011',1.86,2048,160,959),('1012',2.80,1024,160,649),('1013',3.06,512,80,529);
/*!40000 ALTER TABLE `pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pc_extended_info`
--

DROP TABLE IF EXISTS `pc_extended_info`;
/*!50001 DROP VIEW IF EXISTS `pc_extended_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pc_extended_info` AS SELECT 
 1 AS `model`,
 1 AS `speed`,
 1 AS `ram`,
 1 AS `hd`,
 1 AS `price`,
 1 AS `maker`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `price_table`
--

DROP TABLE IF EXISTS `price_table`;
/*!50001 DROP VIEW IF EXISTS `price_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `price_table` AS SELECT 
 1 AS `model`,
 1 AS `price`,
 1 AS `maker`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `printer`
--

DROP TABLE IF EXISTS `printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printer` (
  `model` varchar(4) NOT NULL,
  `color` tinyint(1) NOT NULL,
  `type` varchar(8) DEFAULT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`model`),
  CONSTRAINT `printer_ibfk_1` FOREIGN KEY (`model`) REFERENCES `product` (`model`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `printer_chk_1` CHECK ((`price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer`
--

LOCK TABLES `printer` WRITE;
/*!40000 ALTER TABLE `printer` DISABLE KEYS */;
INSERT INTO `printer` VALUES ('3001',1,'ink-jet',99),('3002',0,'laser',239),('3003',1,'laser',899),('3004',1,'ink-jet',120),('3005',0,'laser',120),('3006',1,'ink-jet',100),('3007',1,'laser',200);
/*!40000 ALTER TABLE `printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `printer_extended_info`
--

DROP TABLE IF EXISTS `printer_extended_info`;
/*!50001 DROP VIEW IF EXISTS `printer_extended_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `printer_extended_info` AS SELECT 
 1 AS `model`,
 1 AS `color`,
 1 AS `type`,
 1 AS `price`,
 1 AS `maker`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `maker` char(1) NOT NULL,
  `model` varchar(4) NOT NULL,
  `type` varchar(8) NOT NULL,
  PRIMARY KEY (`model`),
  UNIQUE KEY `Product_by_maker` (`model`,`maker`),
  UNIQUE KEY `Product_by_type` (`model`,`type`),
  CONSTRAINT `product_chk_1` CHECK ((`model` >= 1000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('A','1001','pc'),('A','1002','pc'),('A','1003','pc'),('B','1004','pc'),('B','1005','pc'),('B','1006','pc'),('C','1007','pc'),('D','1008','pc'),('D','1009','pc'),('D','1010','pc'),('E','1011','pc'),('E','1012','pc'),('E','1013','pc'),('E','2001','laptop'),('E','2002','laptop'),('E','2003','laptop'),('A','2004','laptop'),('A','2005','laptop'),('A','2006','laptop'),('B','2007','laptop'),('F','2008','laptop'),('F','2009','laptop'),('G','2010','laptop'),('E','3001','printer'),('E','3002','printer'),('E','3003','printer'),('D','3004','printer'),('D','3005','printer'),('H','3006','printer'),('H','3007','printer');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `laptop_extended_info`
--

/*!50001 DROP VIEW IF EXISTS `laptop_extended_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `laptop_extended_info` AS select `product`.`model` AS `model`,`laptop`.`speed` AS `speed`,`laptop`.`ram` AS `ram`,`laptop`.`hd` AS `hd`,`laptop`.`price` AS `price`,`product`.`maker` AS `maker` from (`product` join `laptop` on((`product`.`model` = `laptop`.`model`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pc_extended_info`
--

/*!50001 DROP VIEW IF EXISTS `pc_extended_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pc_extended_info` AS select `product`.`model` AS `model`,`pc`.`speed` AS `speed`,`pc`.`ram` AS `ram`,`pc`.`hd` AS `hd`,`pc`.`price` AS `price`,`product`.`maker` AS `maker` from (`product` join `pc` on((`product`.`model` = `pc`.`model`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `price_table`
--

/*!50001 DROP VIEW IF EXISTS `price_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `price_table` AS select `pc_extended_info`.`model` AS `model`,`pc_extended_info`.`price` AS `price`,`pc_extended_info`.`maker` AS `maker` from `pc_extended_info` union select `laptop_extended_info`.`model` AS `model`,`laptop_extended_info`.`price` AS `price`,`laptop_extended_info`.`maker` AS `maker` from `laptop_extended_info` union select `printer_extended_info`.`model` AS `model`,`printer_extended_info`.`price` AS `price`,`printer_extended_info`.`maker` AS `maker` from `printer_extended_info` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `printer_extended_info`
--

/*!50001 DROP VIEW IF EXISTS `printer_extended_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `printer_extended_info` AS select `printer`.`model` AS `model`,`printer`.`color` AS `color`,`printer`.`type` AS `type`,`printer`.`price` AS `price`,`product`.`maker` AS `maker` from (`product` join `printer` on((`product`.`model` = `printer`.`model`))) */;
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

-- Dump completed on 2021-03-09 14:10:36
