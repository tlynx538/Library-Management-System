-- MySQL dump 10.13  Distrib 9.0.1, for macos15.1 (arm64)
--
-- Host: localhost    Database: spheredb
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `spheredb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `spheredb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `spheredb`;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (101,'Avery Quinn'),(102,'Jordan Lee'),(103,'Morgan Price'),(104,'Riley West'),(105,'Taylor Smith'),(106,'Skylar Brown'),(107,'Harper James'),(108,'Casey Lane'),(109,'Dakota Green'),(110,'Phoenix Carter'),(111,'Rowan Taylor'),(112,'Sage White'),(113,'Parker Blue'),(114,'Cameron Hill'),(115,'Jamie Fox');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Biblio`
--

DROP TABLE IF EXISTS `Biblio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Biblio` (
  `biblio_id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `itemtype_id` int NOT NULL,
  `biblio_name` varchar(100) NOT NULL,
  `biblio_desc` text NOT NULL,
  `timestamp` timestamp NOT NULL,
  `publisher_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`biblio_id`),
  KEY `Biblio_author_FK` (`author_id`),
  KEY `Biblio_ItemType_FK` (`itemtype_id`),
  KEY `Biblio_PublisherDetails_FK` (`publisher_id`),
  KEY `Biblio_ItemGenre_FK` (`genre_id`),
  CONSTRAINT `Biblio_author_FK` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `Biblio_ItemGenre_FK` FOREIGN KEY (`genre_id`) REFERENCES `ItemGenre` (`genre_id`),
  CONSTRAINT `Biblio_ItemType_FK` FOREIGN KEY (`itemtype_id`) REFERENCES `ItemType` (`itemtype_id`),
  CONSTRAINT `Biblio_PublisherDetails_FK` FOREIGN KEY (`publisher_id`) REFERENCES `PublisherDetails` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Biblio`
--

LOCK TABLES `Biblio` WRITE;
/*!40000 ALTER TABLE `Biblio` DISABLE KEYS */;
INSERT INTO `Biblio` VALUES (1,101,1,'The Mystic Sword','A young hero embarks on a quest to reclaim a legendary sword.','2024-10-10 15:00:00',1,1),(2,101,1,'The Lost Kingdom','A princess must unite warring factions to save her kingdom.','2024-10-10 15:05:00',2,1),(3,102,2,'Galactic Chronicles Issue 12','A collection of short stories about future interstellar wars.','2024-10-10 15:10:00',3,2),(4,102,2,'Stellar Insights Vol. 5','Exploring the latest in space exploration technology.','2024-10-10 15:15:00',4,2),(5,103,1,'Silent Whispers','A detective uncovers dark secrets in a quiet suburban neighborhood.','2024-10-10 15:20:00',5,6),(6,103,1,'The Case of the Vanished Heiress','A famous heiress disappears under suspicious circumstances.','2024-10-10 15:25:00',6,6),(7,104,3,'Dragon Slayer Chronicles Vol. 1','A warrior battles mythical beasts in a world of magic.','2024-10-10 15:30:00',7,1),(8,104,3,'The Explorer’s Journey Vol. 1','A crew of adventurers travel the world in search of lost treasures.','2024-10-10 15:35:00',8,3),(9,105,4,'The Art of Culinary Magic','A collection of magical recipes from fantasy worlds.','2024-10-10 15:40:00',9,4),(10,105,4,'Cooking with Spices','Explore the world of spices with recipes from different cultures.','2024-10-10 15:45:00',10,4),(11,106,5,'Echoes in the Mind','A man struggles to differentiate reality from his hallucinations.','2024-10-10 15:50:00',11,5),(12,106,5,'The Unseen Enemy','A psychiatrist unravels a chilling case involving mind control.','2024-10-10 15:55:00',12,5),(13,107,1,'Night of Shadows','A group of friends is hunted by supernatural creatures in the woods.','2024-10-10 16:00:00',13,6),(14,107,1,'The Darkening','A cursed village slowly falls into chaos as darkness descends.','2024-10-10 16:05:00',14,6),(15,108,3,'Dreamers Vol. 3','A group of teens discovers they have the power to change the world.','2024-10-10 16:10:00',15,7),(16,108,3,'Elemental Warriors Vol. 2','Heroes control the elements to battle evil forces.','2024-10-10 16:15:00',16,1),(17,109,2,'Hearts of Passion Issue 8','Romantic tales set in both contemporary and historical settings.','2024-10-10 16:20:00',17,8),(18,109,2,'Eternal Love Vol. 4','Stories about everlasting love that transcends time.','2024-10-10 16:25:00',18,8),(19,110,1,'The Battle for Valor','A knight’s journey through war-torn medieval Europe.','2024-10-10 16:30:00',19,9),(20,110,1,'Empire of the Sun','The rise and fall of a powerful dynasty in ancient China.','2024-10-10 16:35:00',20,9),(21,111,5,'The Collapse','In a future dystopia, one woman fights for survival against an oppressive regime.','2024-10-10 16:40:00',21,10),(22,111,5,'The Ashen City','A city crumbles under the weight of political corruption and rebellion.','2024-10-10 16:45:00',22,10),(23,112,1,'The Lost Expedition','A team of explorers searches for a lost civilization in the jungle.','2024-10-10 16:50:00',23,3),(24,112,1,'The Ocean’s Secrets','A sailor embarks on a perilous journey to uncover the mysteries of the deep.','2024-10-10 16:55:00',24,3),(25,113,2,'World Wonders Issue 10','Featuring articles on the seven wonders of the modern world.','2024-10-10 17:00:00',25,4),(26,113,2,'Exploring History Vol. 7','A deep dive into ancient civilizations and their impact on modern culture.','2024-10-10 17:05:00',26,4),(27,114,5,'The Stars We Seek','A group of teenagers searches for purpose while navigating high school life.','2024-10-10 17:10:00',27,7),(28,114,5,'Beneath the Surface','A coming-of-age story about a young girl discovering her true identity.','2024-10-10 17:15:00',28,7),(29,115,4,'Healthy Eats','Delicious and nutritious recipes for a balanced lifestyle.','2024-10-10 17:20:00',29,4),(30,115,4,'Comfort Food Classics','Classic comfort food recipes from around the world.','2024-10-10 17:25:00',30,4);
/*!40000 ALTER TABLE `Biblio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BiblioItems`
--

DROP TABLE IF EXISTS `BiblioItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BiblioItems` (
  `biblioitems_id` int NOT NULL,
  `itemtype_id` int NOT NULL,
  `pages` int NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `issn` varchar(10) DEFAULT NULL,
  `ean` varchar(20) NOT NULL,
  `biblio_id` int DEFAULT NULL,
  `published_date` date NOT NULL,
  `rating_id` int NOT NULL,
  `replacement_cost` float DEFAULT NULL,
  PRIMARY KEY (`biblioitems_id`),
  KEY `BiblioItems_ItemType_FK` (`itemtype_id`),
  KEY `BiblioItems_Ratings_FK` (`rating_id`),
  KEY `BiblioItems_Biblio_FK` (`biblio_id`),
  CONSTRAINT `BiblioItems_Biblio_FK` FOREIGN KEY (`biblio_id`) REFERENCES `Biblio` (`biblio_id`),
  CONSTRAINT `BiblioItems_ItemType_FK` FOREIGN KEY (`itemtype_id`) REFERENCES `ItemType` (`itemtype_id`),
  CONSTRAINT `BiblioItems_Ratings_FK` FOREIGN KEY (`rating_id`) REFERENCES `Ratings` (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BiblioItems`
--

LOCK TABLES `BiblioItems` WRITE;
/*!40000 ALTER TABLE `BiblioItems` DISABLE KEYS */;
INSERT INTO `BiblioItems` VALUES (1,1,350,'978-0-12345-678-9','1234-5678','1234567890123',1,'2024-01-01',1,12.5),(2,1,380,'978-0-98765-432-1','2345-6789','1234567890124',2,'2024-01-10',2,12.5),(3,2,120,'978-0-54321-098-7','3456-7890','1234567890125',3,'2024-02-01',3,14.5),(4,2,140,'978-0-87654-321-0','4567-8901','1234567890126',4,'2024-02-05',4,14.5),(5,1,420,'978-0-13579-246-8','5678-9012','1234567890127',5,'2024-03-01',5,12.5),(6,1,390,'978-0-97531-642-0','6789-0123','1234567890128',6,'2024-03-10',6,12.5),(7,3,150,'978-0-12312-567-8','7890-1234','1234567890129',7,'2024-04-01',7,9),(8,3,170,'978-0-12313-567-8','8901-2345','1234567890130',8,'2024-04-10',8,9),(9,4,200,'978-0-87654-321-0','9012-3456','1234567890131',9,'2024-05-01',9,15),(10,4,220,'978-0-09876-543-2','0123-4567','1234567890132',10,'2024-05-10',10,15),(11,1,340,'978-0-56473-654-1','5678-0123','1234567890133',11,'2024-06-01',11,12.5),(12,2,380,'978-0-87654-543-2','6789-1234','1234567890134',12,'2024-06-15',12,14.5),(13,3,160,'978-0-76543-987-3','7890-2345','1234567890135',13,'2024-07-01',13,9),(14,4,200,'978-0-19876-543-4','8901-3456','1234567890136',14,'2024-07-10',14,15),(15,1,320,'978-0-65432-987-5','9012-4567','1234567890137',15,'2024-08-01',15,12.5),(16,2,370,'978-0-87654-765-6','0123-5678','1234567890138',16,'2024-08-15',16,14.5),(17,3,180,'978-0-09876-432-1','1234-6789','1234567890139',17,'2024-09-01',17,9),(18,4,250,'978-0-54321-123-4','2345-7890','1234567890140',18,'2024-09-10',18,15),(19,1,360,'978-0-09876-987-6','3456-8901','1234567890141',19,'2024-10-01',19,12.5),(20,2,220,'978-0-54321-654-7','4567-9012','1234567890142',20,'2024-10-10',20,14.5);
/*!40000 ALTER TABLE `BiblioItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookingRooms`
--

DROP TABLE IF EXISTS `BookingRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BookingRooms` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `RoomType` enum('Study Room','Conference Room','Other') NOT NULL,
  `BookedBy` int NOT NULL,
  `BookingDate` datetime NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `StaffID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `BookedBy` (`BookedBy`),
  KEY `BookingRooms_Staff_FK` (`StaffID`),
  CONSTRAINT `bookingrooms_ibfk_1` FOREIGN KEY (`BookedBy`) REFERENCES `Borrowers` (`borrower_id`) ON DELETE CASCADE,
  CONSTRAINT `BookingRooms_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookingRooms`
--

LOCK TABLES `BookingRooms` WRITE;
/*!40000 ALTER TABLE `BookingRooms` DISABLE KEYS */;
INSERT INTO `BookingRooms` VALUES (1,'Study Room',1,'2024-11-01 00:00:00','09:00:00','11:00:00',NULL),(2,'Conference Room',2,'2024-11-02 00:00:00','10:00:00','12:00:00',NULL),(3,'Study Room',3,'2024-11-03 00:00:00','11:00:00','13:00:00',NULL),(4,'Conference Room',4,'2024-11-04 00:00:00','12:00:00','14:00:00',NULL),(5,'Study Room',5,'2024-11-05 00:00:00','13:00:00','15:00:00',NULL),(6,'Conference Room',6,'2024-11-06 00:00:00','14:00:00','16:00:00',NULL),(7,'Study Room',7,'2024-11-07 00:00:00','15:00:00','17:00:00',NULL),(8,'Conference Room',8,'2024-11-08 00:00:00','16:00:00','18:00:00',NULL),(9,'Study Room',9,'2024-11-09 00:00:00','17:00:00','19:00:00',NULL),(10,'Conference Room',10,'2024-11-10 00:00:00','18:00:00','20:00:00',NULL),(11,'Study Room',11,'2024-11-11 00:00:00','19:00:00','21:00:00',NULL),(12,'Conference Room',12,'2024-11-12 00:00:00','20:00:00','22:00:00',NULL),(13,'Study Room',13,'2024-11-13 00:00:00','09:30:00','11:30:00',NULL),(14,'Conference Room',14,'2024-11-14 00:00:00','10:30:00','12:30:00',NULL),(15,'Study Room',15,'2024-11-15 00:00:00','11:30:00','13:30:00',NULL),(16,'Conference Room',16,'2024-11-16 00:00:00','12:30:00','14:30:00',NULL),(17,'Study Room',17,'2024-11-17 00:00:00','13:30:00','15:30:00',NULL),(18,'Conference Room',18,'2024-11-18 00:00:00','14:30:00','16:30:00',NULL),(19,'Study Room',19,'2024-11-19 00:00:00','15:30:00','17:30:00',NULL),(20,'Conference Room',20,'2024-11-20 00:00:00','16:30:00','18:30:00',NULL);
/*!40000 ALTER TABLE `BookingRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrowers`
--

DROP TABLE IF EXISTS `Borrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrowers` (
  `borrower_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `home_addr` text,
  `addr2` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `borrower_status` int DEFAULT NULL,
  PRIMARY KEY (`borrower_id`),
  KEY `Borrowers_BorrowerStatus_FK` (`borrower_status`),
  CONSTRAINT `Borrowers_BorrowerStatus_FK` FOREIGN KEY (`borrower_status`) REFERENCES `BorrowerStatus` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrowers`
--

LOCK TABLES `Borrowers` WRITE;
/*!40000 ALTER TABLE `Borrowers` DISABLE KEYS */;
INSERT INTO `Borrowers` VALUES (1,'John Doe','555-1234','123 Elm St','Apt 1A','Springfield','62701',NULL),(2,'Jane Smith','555-5678','456 Oak St',NULL,'Lincoln','68502',NULL),(3,'Alice Johnson','555-8765','789 Pine St','Suite 200','Champaign','61820',NULL),(4,'Bob Brown','555-4321','321 Maple St',NULL,'Peoria','61602',NULL),(5,'Charlie White','555-0000','654 Cedar St','Floor 3','Rockford','61107',NULL),(6,'David Green','555-9999','987 Birch St',NULL,'Naperville','60540',NULL),(7,'Emily Black','555-8888','159 Willow St','Unit 5','Aurora','60505',NULL),(8,'Frank Harris','555-7777','753 Walnut St',NULL,'Joliet','60431',NULL),(9,'Grace Lee','555-6666','246 Ash St','Apt 12','Elgin','60120',NULL),(10,'Henry King','555-5555','369 Pine St',NULL,'Schaumburg','60173',NULL),(11,'Irene Adams','555-4444','852 Chestnut St','Floor 1','Bolingbrook','60440',NULL),(12,'Jack White','555-3333','147 Spruce St',NULL,'Waukegan','60085',NULL),(13,'Kathy Scott','555-2222','258 Maple St','Apt 4','Des Plaines','60016',NULL),(14,'Leo Martinez','555-1111','369 Oak St',NULL,'Skokie','60076',NULL),(15,'Mia Thompson','555-0001','123 Birch St','Unit 6','Evanston','60201',NULL),(16,'Nate Young','555-0002','456 Pine St',NULL,'Plainfield','60544',NULL),(17,'Olivia Hall','555-0003','789 Cedar St','Suite 300','Arlington Heights','60004',NULL),(18,'Paul King','555-0004','321 Walnut St',NULL,'Tinley Park','60487',NULL),(19,'Quinn Wright','555-0005','654 Elm St','Floor 2','Orland Park','60462',NULL),(20,'Rita Green','555-0006','987 Oak St',NULL,'Mundelein','60060',NULL),(21,'Steve Lewis','555-0007','159 Maple St','Apt 10','Lake Forest','60045',NULL);
/*!40000 ALTER TABLE `Borrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BorrowerStatus`
--

DROP TABLE IF EXISTS `BorrowerStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BorrowerStatus` (
  `status_id` int NOT NULL,
  `status_name` varchar(100) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `BorrowerStatus_UNIQUE` (`status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BorrowerStatus`
--

LOCK TABLES `BorrowerStatus` WRITE;
/*!40000 ALTER TABLE `BorrowerStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `BorrowerStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConditionStatus`
--

DROP TABLE IF EXISTS `ConditionStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConditionStatus` (
  `ConditionID` int NOT NULL AUTO_INCREMENT,
  `ConditionName` varchar(100) NOT NULL,
  `Description` text,
  PRIMARY KEY (`ConditionID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConditionStatus`
--

LOCK TABLES `ConditionStatus` WRITE;
/*!40000 ALTER TABLE `ConditionStatus` DISABLE KEYS */;
INSERT INTO `ConditionStatus` VALUES (1,'New','Brand new item'),(2,'Good','Slightly used but in excellent condition'),(3,'Fair','Visible signs of wear but functional'),(4,'Poor','Damaged but still usable'),(5,'Damaged','Significant damage, requires repair'),(6,'Lost','Item is reported lost'),(7,'Repaired','Previously damaged but repaired'),(8,'Archived','Archived and not in circulation'),(9,'On Loan','Currently loaned out'),(10,'Reserved','Reserved for a user'),(11,'Processing','Awaiting processing'),(12,'Discarded','No longer part of the library collection'),(13,'Donated','Received as a donation'),(14,'Unavailable','Temporarily not available'),(15,'Quarantine','In quarantine for cleaning'),(16,'Relocated','Moved to another branch'),(17,'Restored','Restored to original condition'),(18,'Replaced','Replaced with a new item'),(19,'Overdue','Overdue for return'),(20,'Pending','Pending further action');
/*!40000 ALTER TABLE `ConditionStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeRoles`
--

DROP TABLE IF EXISTS `EmployeeRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmployeeRoles` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(100) NOT NULL,
  `Description` text,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeRoles`
--

LOCK TABLES `EmployeeRoles` WRITE;
/*!40000 ALTER TABLE `EmployeeRoles` DISABLE KEYS */;
INSERT INTO `EmployeeRoles` VALUES (1,'Librarian','Responsible for managing library resources'),(2,'Assistant Librarian','Supports the librarian in daily tasks'),(3,'IT Specialist','Maintains library technology and systems'),(4,'Archivist','Manages historical records and archives'),(5,'Cataloguer','Organizes and catalogues library items'),(6,'Research Assistant','Assists in research and reference queries'),(7,'Children’s Librarian','Focuses on children’s programming and activities'),(8,'Teen Librarian','Focuses on teen programming and activities'),(9,'Community Coordinator','Engages with community programs'),(10,'Facilities Manager','Oversees the physical library facilities'),(11,'Acquisitions Manager','Handles purchasing and procurement of materials'),(12,'Events Coordinator','Plans and executes library events'),(13,'Digital Librarian','Manages digital collections'),(14,'Outreach Specialist','Promotes library services to the community'),(15,'Volunteer Coordinator','Manages library volunteers'),(16,'Security Officer','Ensures safety and order in the library'),(17,'Library Technician','Provides technical support for library systems'),(18,'Marketing Specialist','Handles library marketing and communications'),(19,'Program Manager','Oversees library programs and initiatives'),(20,'Administrative Assistant','Provides administrative support');
/*!40000 ALTER TABLE `EmployeeRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(100) DEFAULT NULL,
  `EventDescription` text,
  `EventDate` datetime NOT NULL,
  `EventType` enum('Reading Event','Book Promotion','Other') DEFAULT NULL,
  `OrganizerID` int DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `Events_Staff_FK` (`OrganizerID`),
  CONSTRAINT `Events_Staff_FK` FOREIGN KEY (`OrganizerID`) REFERENCES `Staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fines`
--

DROP TABLE IF EXISTS `Fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fines` (
  `fine_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `borrower_id` int DEFAULT NULL,
  `fine_amount` float DEFAULT NULL,
  `fine_date` date DEFAULT NULL,
  `loan_id` int DEFAULT NULL,
  PRIMARY KEY (`fine_id`),
  KEY `Fines_Borrowers_FK` (`borrower_id`),
  KEY `Fines_Items_FK` (`item_id`),
  KEY `Fines_Loan_FK` (`loan_id`),
  CONSTRAINT `Fines_Borrowers_FK` FOREIGN KEY (`borrower_id`) REFERENCES `Borrowers` (`borrower_id`),
  CONSTRAINT `Fines_Items_FK` FOREIGN KEY (`item_id`) REFERENCES `Items` (`item_id`),
  CONSTRAINT `Fines_Loan_FK` FOREIGN KEY (`loan_id`) REFERENCES `Loan` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fines`
--

LOCK TABLES `Fines` WRITE;
/*!40000 ALTER TABLE `Fines` DISABLE KEYS */;
INSERT INTO `Fines` VALUES (4,1,1,768,'2024-11-02',1);
/*!40000 ALTER TABLE `Fines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemGenre`
--

DROP TABLE IF EXISTS `ItemGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItemGenre` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(100) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `ItemGenre_UNIQUE` (`genre_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemGenre`
--

LOCK TABLES `ItemGenre` WRITE;
/*!40000 ALTER TABLE `ItemGenre` DISABLE KEYS */;
INSERT INTO `ItemGenre` VALUES (3,'Adventure'),(10,'Dystopian'),(1,'Fantasy'),(9,'Historical Fiction'),(6,'Horror'),(4,'Non-Fiction'),(5,'Psychological Thriller'),(8,'Romance'),(2,'Science Fiction'),(7,'Young Adult');
/*!40000 ALTER TABLE `ItemGenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items` (
  `item_id` int NOT NULL,
  `biblioitems_id` int NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `item_location` varchar(25) DEFAULT NULL,
  `condition_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `Items_BiblioItems_FK` (`biblioitems_id`),
  KEY `Items_ConditionStatus_FK` (`condition_id`),
  CONSTRAINT `Items_BiblioItems_FK` FOREIGN KEY (`biblioitems_id`) REFERENCES `BiblioItems` (`biblioitems_id`),
  CONSTRAINT `Items_ConditionStatus_FK` FOREIGN KEY (`condition_id`) REFERENCES `ConditionStatus` (`ConditionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
INSERT INTO `Items` VALUES (1,1,'1234567890123','Aisle 1, Shelf 1',NULL),(2,1,'1234567890124','Aisle 1, Shelf 2',NULL),(3,2,'1234567890125','Aisle 2, Shelf 1',NULL),(4,2,'1234567890126','Aisle 2, Shelf 2',NULL),(5,1,'1234567890127','Aisle 3, Shelf 1',NULL),(6,1,'1234567890128','Aisle 3, Shelf 2',NULL),(7,3,'1234567890129','Aisle 4, Shelf 1',NULL),(8,3,'1234567890130','Aisle 4, Shelf 2',NULL),(9,4,'1234567890131','Aisle 5, Shelf 1',NULL),(10,4,'1234567890132','Aisle 5, Shelf 2',NULL),(11,1,'1234567890133','Aisle 6, Shelf 1',NULL),(12,2,'1234567890134','Aisle 6, Shelf 2',NULL),(13,3,'1234567890135','Aisle 7, Shelf 1',NULL),(14,4,'1234567890136','Aisle 7, Shelf 2',NULL),(15,1,'1234567890137','Aisle 8, Shelf 1',NULL),(16,2,'1234567890138','Aisle 8, Shelf 2',NULL),(17,3,'1234567890139','Aisle 9, Shelf 1',NULL),(18,4,'1234567890140','Aisle 9, Shelf 2',NULL),(19,1,'1234567890141','Aisle 10, Shelf 1',NULL),(20,2,'1234567890142','Aisle 10, Shelf 2',NULL);
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemType`
--

DROP TABLE IF EXISTS `ItemType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItemType` (
  `itemtype_id` int NOT NULL AUTO_INCREMENT,
  `itemtype_name` varchar(20) NOT NULL,
  `item_borrow_duration_days` int DEFAULT NULL,
  PRIMARY KEY (`itemtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemType`
--

LOCK TABLES `ItemType` WRITE;
/*!40000 ALTER TABLE `ItemType` DISABLE KEYS */;
INSERT INTO `ItemType` VALUES (1,'Novel',21),(2,'Magazine',7),(3,'Manga',21),(4,'Cookbook',45),(5,'Audiobook',21);
/*!40000 ALTER TABLE `ItemType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loan`
--

DROP TABLE IF EXISTS `Loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loan` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `borrower_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `loaned_on` date DEFAULT NULL,
  `returned_on` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `loan_status_id` int DEFAULT NULL,
  `renewal_count` int DEFAULT '0',
  PRIMARY KEY (`loan_id`),
  KEY `Loan_Borrowers_FK` (`borrower_id`),
  KEY `Loan_Items_FK` (`item_id`),
  KEY `Loan_LoanStatus_FK` (`loan_status_id`),
  CONSTRAINT `Loan_Borrowers_FK` FOREIGN KEY (`borrower_id`) REFERENCES `Borrowers` (`borrower_id`),
  CONSTRAINT `Loan_Items_FK` FOREIGN KEY (`item_id`) REFERENCES `Items` (`item_id`),
  CONSTRAINT `Loan_LoanStatus_FK` FOREIGN KEY (`loan_status_id`) REFERENCES `LoanStatus` (`loan_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loan`
--

LOCK TABLES `Loan` WRITE;
/*!40000 ALTER TABLE `Loan` DISABLE KEYS */;
INSERT INTO `Loan` VALUES (1,1,1,'2024-01-10',NULL,'2024-03-12',0,1),(2,2,2,'2024-01-12','2024-01-15','2024-01-19',1,0),(3,3,3,'2024-01-14',NULL,'2024-01-21',0,0),(4,4,4,'2024-01-15',NULL,'2024-01-22',0,0),(5,5,5,'2024-01-16','2024-01-18','2024-01-24',1,0),(6,6,6,'2024-01-18',NULL,'2024-01-25',0,0),(7,7,7,'2024-01-19','2024-01-20','2024-01-26',1,0),(8,8,8,'2024-01-20',NULL,'2024-01-27',0,0),(9,9,9,'2024-01-21','2024-01-23','2024-01-29',1,0),(10,10,10,'2024-01-22',NULL,'2024-01-30',0,0),(11,11,11,'2024-01-23','2024-01-24','2024-01-31',1,0),(12,12,12,'2024-01-24',NULL,'2024-02-01',0,0),(13,13,13,'2024-01-25',NULL,'2024-02-02',0,0),(14,14,14,'2024-01-26','2024-01-28','2024-02-03',1,0),(15,15,15,'2024-01-27',NULL,'2024-02-04',0,0),(16,16,16,'2024-01-28','2024-01-30','2024-02-05',1,0),(17,17,17,'2024-01-29',NULL,'2024-11-30',0,3),(44,1,3,'2024-11-05',NULL,'2024-11-12',0,1);
/*!40000 ALTER TABLE `Loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_loan_renewal` BEFORE INSERT ON `loan` FOR EACH ROW BEGIN
    -- Check if the item is on reserve (hold) by another borrower
    IF EXISTS (
        SELECT 1
        FROM reserves
        WHERE item_id = NEW.item_id
          AND expiration_date > CURRENT_DATE
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Item is on hold and cannot be renewed.';
    END IF;

    -- Check if the borrower has already renewed the item 3 times
    IF NEW.renewal_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Maximum renewal limit of 3 reached for this item.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loan_rules`
--

DROP TABLE IF EXISTS `loan_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_rules` (
  `rule_id` int NOT NULL AUTO_INCREMENT,
  `itemtype_id` int NOT NULL,
  `loan_period` int NOT NULL,
  `daily_fine` decimal(10,2) NOT NULL,
  `max_renewals` int NOT NULL DEFAULT '3',
  PRIMARY KEY (`rule_id`),
  KEY `itemtype_id` (`itemtype_id`),
  CONSTRAINT `loan_rules_ibfk_1` FOREIGN KEY (`itemtype_id`) REFERENCES `itemtype` (`itemtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_rules`
--

LOCK TABLES `loan_rules` WRITE;
/*!40000 ALTER TABLE `loan_rules` DISABLE KEYS */;
INSERT INTO `loan_rules` VALUES (1,1,21,3.00,3),(2,3,21,3.00,3),(3,5,21,3.00,3),(4,2,7,1.50,3),(5,4,45,0.50,3);
/*!40000 ALTER TABLE `loan_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanStatus`
--

DROP TABLE IF EXISTS `LoanStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoanStatus` (
  `loan_status_id` int NOT NULL,
  `loan_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`loan_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanStatus`
--

LOCK TABLES `LoanStatus` WRITE;
/*!40000 ALTER TABLE `LoanStatus` DISABLE KEYS */;
INSERT INTO `LoanStatus` VALUES (0,'Item Loaned'),(1,'Item Returned');
/*!40000 ALTER TABLE `LoanStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notifications`
--

DROP TABLE IF EXISTS `Notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notifications` (
  `NotificationID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `NotificationText` text NOT NULL,
  `NotificationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsRead` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`NotificationID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Borrowers` (`borrower_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
INSERT INTO `Notifications` VALUES (1,1,'Your reserved book is now available.','2024-11-01 09:00:00',0),(2,2,'You have overdue items. Please return them.','2024-11-02 10:00:00',0),(3,3,'Reminder: Library event on Saturday.','2024-11-03 11:00:00',1),(4,4,'Your room booking has been confirmed.','2024-11-04 12:00:00',0),(5,5,'System maintenance completed.','2024-11-05 13:00:00',1),(6,6,'Thank you for attending the book promotion.','2024-11-06 14:00:00',1),(7,7,'New arrivals in your favorite genre!','2024-11-07 15:00:00',0),(8,8,'Membership renewal due soon.','2024-11-08 16:00:00',0),(9,9,'Your loaned item is due tomorrow.','2024-11-09 17:00:00',0),(10,10,'Reserve confirmation for \"Book Title\".','2024-11-10 18:00:00',1),(11,11,'Library hours updated for the holiday.','2024-11-11 19:00:00',0),(12,12,'Event: Author reading next week.','2024-11-12 20:00:00',1),(13,13,'Fines cleared for your account.','2024-11-13 21:00:00',1),(14,14,'Reminder: Upcoming community event.','2024-11-14 22:00:00',0),(15,15,'System update completed successfully.','2024-11-15 23:00:00',1),(16,16,'Reserved book ready for pickup.','2024-11-16 09:30:00',0),(17,17,'Your feedback is appreciated.','2024-11-17 10:30:00',1),(18,18,'Reminder: Return books on time.','2024-11-18 11:30:00',0),(19,19,'New study materials added.','2024-11-19 12:30:00',0),(20,20,'Thank you for your donation.','2024-11-20 13:30:00',1);
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PublisherDetails`
--

DROP TABLE IF EXISTS `PublisherDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PublisherDetails` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) NOT NULL,
  `publisher_phone` varchar(100) NOT NULL,
  `publisher_addr` text NOT NULL,
  `publisher_city` varchar(15) NOT NULL,
  `publisher_country` varchar(15) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PublisherDetails`
--

LOCK TABLES `PublisherDetails` WRITE;
/*!40000 ALTER TABLE `PublisherDetails` DISABLE KEYS */;
INSERT INTO `PublisherDetails` VALUES (1,'Fantasy Publishing Co.','123-456-7890','123 Fantasy Lane','Fabletown','Imaginaryland'),(2,'Kingdom Press','234-567-8901','456 Royal Rd','Castle City','Fairyland'),(3,'Star Publications','345-678-9012','789 Galaxy Blvd','Starport','Cosmos'),(4,'Galaxy Media','456-789-0123','101 Universe St','Milky Way','Galaxyland'),(5,'Mystery Press','567-890-1234','202 Mystery Ave','Cloak City','Enigma'),(6,'Noir Books','678-901-2345','303 Shadow St','Gloomtown','Darkland'),(7,'Mythic Manga','789-012-3456','404 Legend Dr','Mythos','Fictionland'),(8,'Adventure Comics','890-123-4567','505 Quest Blvd','Hero City','Adventureland'),(9,'Culinary Creations','901-234-5678','606 Recipe Rd','Culinary City','Gastronomy'),(10,'Flavorful Books','012-345-6789','707 Spice St','Tasteville','Flavorland'),(11,'Thrill Audio','123-456-7891','808 Audio Way','Soundtown','AudioLand'),(12,'Mindscape Audiobooks','234-567-8902','909 Mind Ave','Dreamland','Thoughtopia'),(13,'Horror Tales Publishing','345-678-9013','101 Horror St','Fear City','Nightmareland'),(14,'Darkwood Press','456-789-0124','202 Dark Rd','Gloomy Hollow','Shadowland'),(15,'Young Adult Graphics','567-890-1235','303 Youth Ave','Teen Town','Youthland'),(16,'Fantasy Manga','678-901-2346','404 Fantasy Blvd','Magic City','Dreamland'),(17,'Romance Magazine Co.','789-012-3457','505 Love Ln','Passionville','Romanceland'),(18,'Timeless Tales Publishing','890-123-4568','606 Eternal Way','Forever City','Timeland'),(19,'Historical Fiction House','901-234-5679','707 History St','Past Town','Heritage'),(20,'Ancient Dynasties Press','012-345-6780','808 Dynasty Dr','Legacy City','Antiquity'),(21,'Dystopian Audio','123-456-7892','909 Dystopia Ave','Futuristic City','Tomorrowland'),(22,'Future Audiobooks','234-567-8903','101 Future St','Next City','Futurity'),(23,'Explorer’s Press','345-678-9014','202 Expedition Rd','Discovery City','Explorerland'),(24,'Nautical Publications','456-789-0125','303 Ocean Blvd','Seashell City','Aquaticland'),(25,'Global Insights Media','567-890-1236','404 World Way','Global City','Earthland'),(26,'History Today Press','678-901-2347','505 History Ave','Timeline City','Historia'),(27,'Young Adult Audiobooks','789-012-3458','606 Teen Way','Youthville','Fictionland'),(28,'Identity Publishing','890-123-4569','707 Identity Rd','Selftown','Innerland'),(29,'Wellness Books','901-234-5670','808 Health Blvd','Wellness City','Vitality'),(30,'Culinary Classics Press','012-345-6781','909 Classic St','Gourmet Town','Culinaryland');
/*!40000 ALTER TABLE `PublisherDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ratings`
--

DROP TABLE IF EXISTS `Ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `biblio_id` int NOT NULL,
  `rating` int NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `Ratings_Biblio_FK` (`biblio_id`),
  CONSTRAINT `Ratings_Biblio_FK` FOREIGN KEY (`biblio_id`) REFERENCES `Biblio` (`biblio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ratings`
--

LOCK TABLES `Ratings` WRITE;
/*!40000 ALTER TABLE `Ratings` DISABLE KEYS */;
INSERT INTO `Ratings` VALUES (1,1,5,'2024-10-10'),(2,2,4,'2024-10-11'),(3,3,3,'2024-10-12'),(4,4,4,'2024-10-13'),(5,5,5,'2024-10-14'),(6,6,4,'2024-10-15'),(7,7,3,'2024-10-16'),(8,8,4,'2024-10-17'),(9,9,5,'2024-10-18'),(10,10,4,'2024-10-19'),(11,11,5,'2024-10-20'),(12,12,4,'2024-10-21'),(13,13,3,'2024-10-22'),(14,14,5,'2024-10-23'),(15,15,4,'2024-10-24'),(16,16,3,'2024-10-25'),(17,17,4,'2024-10-26'),(18,18,5,'2024-10-27'),(19,19,4,'2024-10-28'),(20,20,3,'2024-10-29');
/*!40000 ALTER TABLE `Ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserves`
--

DROP TABLE IF EXISTS `Reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserves` (
  `reserve_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `borrower_id` int DEFAULT NULL,
  `date_reserved` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`reserve_id`),
  KEY `Reserves_Items_FK` (`item_id`),
  KEY `Reserves_Borrowers_FK` (`borrower_id`),
  CONSTRAINT `Reserves_Borrowers_FK` FOREIGN KEY (`borrower_id`) REFERENCES `Borrowers` (`borrower_id`),
  CONSTRAINT `Reserves_Items_FK` FOREIGN KEY (`item_id`) REFERENCES `Items` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserves`
--

LOCK TABLES `Reserves` WRITE;
/*!40000 ALTER TABLE `Reserves` DISABLE KEYS */;
INSERT INTO `Reserves` VALUES (2,10,2,'2024-11-01','2024-11-15'),(3,1,12,'2024-11-01','2024-11-15'),(4,8,1,'2024-11-01','2024-11-15'),(5,4,20,'2024-11-01','2024-11-15'),(6,7,3,'2024-11-02','2024-11-16'),(7,2,15,'2024-11-02','2024-11-16'),(8,5,10,'2024-11-02','2024-11-16'),(9,9,4,'2024-11-02','2024-11-16'),(10,12,18,'2024-11-02','2024-11-16'),(11,6,6,'2024-11-02','2024-11-16'),(12,11,14,'2024-11-02','2024-11-16'),(14,16,11,'2024-11-02','2024-11-16'),(15,15,8,'2024-11-02','2024-11-16'),(24,3,6,'2024-12-26','2025-02-22'),(25,4,6,'2024-12-26','2025-02-22'),(31,6,1,'2024-12-26','2025-02-22'),(32,5,1,'2024-12-26','2025-02-22'),(33,3,1,'2024-12-26','2025-02-22'),(35,18,1,'2024-12-26','2025-02-22');
/*!40000 ALTER TABLE `Reserves` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_reserve` BEFORE INSERT ON `reserves` FOR EACH ROW BEGIN
    -- Check if the borrower already has 5 active holds
    DECLARE hold_count INT;

    -- Count active holds for the borrower (those with expiration_date in the future)
    SELECT COUNT(*)
    INTO hold_count
    FROM reserves
    WHERE borrower_id = NEW.borrower_id
      AND expiration_date > CURRENT_DATE;

    -- If the borrower already has 5 active holds, raise an error
    IF hold_count >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A borrower can only have a maximum of 5 active holds at once.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_hold_expiration` AFTER INSERT ON `reserves` FOR EACH ROW BEGIN
    -- Automatically set the expiration_date to 7 days after the reservation date if not provided
    IF NEW.expiration_date IS NULL THEN
        UPDATE reserves
        SET expiration_date = DATE_ADD(NEW.date_reserved, INTERVAL 7 DAY)
        WHERE reserve_id = NEW.reserve_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_expired_holds` AFTER UPDATE ON `reserves` FOR EACH ROW BEGIN
    -- Check if the expiration_date is in the past and the hold is not yet expired
    IF OLD.expiration_date < CURRENT_DATE THEN
        DELETE FROM reserves WHERE reserve_id = OLD.reserve_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `RoleID` int NOT NULL,
  `HireDate` date NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `EmployeeRoles` (`RoleID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Alice','Smith',1,'2020-01-01'),(2,'Bob','Johnson',2,'2020-02-01'),(3,'Cathy','Williams',3,'2020-03-01'),(4,'David','Brown',4,'2020-04-01'),(5,'Eve','Jones',5,'2020-05-01'),(6,'Frank','Garcia',6,'2020-06-01'),(7,'Grace','Martinez',7,'2020-07-01'),(8,'Hank','Rodriguez',8,'2020-08-01'),(9,'Ivy','Lopez',9,'2020-09-01'),(10,'Jack','Harris',10,'2020-10-01'),(11,'Karen','Clark',11,'2020-11-01'),(12,'Leo','Lewis',12,'2020-12-01'),(13,'Mia','Walker',13,'2021-01-01'),(14,'Nina','Hall',14,'2021-02-01'),(15,'Oscar','Allen',15,'2021-03-01'),(16,'Paula','Young',16,'2021-04-01'),(17,'Quinn','Hernandez',17,'2021-05-01'),(18,'Ruth','King',18,'2021-06-01'),(19,'Steve','Wright',19,'2021-07-01'),(20,'Tina','Scott',20,'2021-08-01');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'spheredb'
--

--
-- Dumping routines for database 'spheredb'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_fine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_fine`(loan_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    -- Declare variables for fine amount, days overdue, and daily fine rate
    DECLARE fine_amount DECIMAL(10, 2) DEFAULT 0;
    DECLARE days_overdue INT DEFAULT 0;
    DECLARE daily_fine DECIMAL(10, 2);

    -- Calculate the number of overdue days; only consider if the item has not been returned
    SELECT DATEDIFF(CURRENT_DATE, due_date) INTO days_overdue
    FROM Loan 
    WHERE loan_id = loan_id AND returned_on IS NULL;

    -- If there are overdue days, calculate the fine based on daily rate from loan_rules
    IF days_overdue > 0 THEN
        SELECT lr.daily_fine INTO daily_fine
        FROM loan_rules lr
        JOIN Items i ON i.itemtype_id = lr.itemtype_id
        JOIN Loan l ON l.item_id = i.item_id
        WHERE l.loan_id = loan_id;

        -- Calculate fine amount as days overdue multiplied by daily rate
        SET fine_amount = days_overdue * daily_fine;
    END IF;

    RETURN fine_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculate_outstanding_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_outstanding_balance`(customer_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    -- Declare a variable to store the total outstanding balance
    DECLARE total_balance DECIMAL(10, 2) DEFAULT 0;

    -- Calculate the total outstanding balance by summing unpaid order amounts for the given customer
    SELECT SUM(od.quantityOrdered * od.priceEach) INTO total_balance
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    WHERE o.customer_id = customer_id 
      AND o.status <> 'Shipped';

    RETURN total_balance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `count_items_by_genre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_items_by_genre`(genre_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    -- Declare a variable to store the count of items
    DECLARE item_count INT DEFAULT 0;

    -- Count the items by genre by joining Items and Biblio tables
    SELECT COUNT(*) INTO item_count
    FROM Items i
    JOIN Biblio b ON i.biblioitems_id = b.biblio_id
    WHERE b.genre_id = genre_id;

    RETURN item_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_borrower_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_borrower_status`(borrower_id INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    -- Declare a variable to store the borrower's status
    DECLARE status VARCHAR(50) DEFAULT 'Unknown';

    -- Retrieve the borrower's status by joining with BorrowerStatus table
    SELECT bs.status_name INTO status
    FROM Borrowers b
    JOIN BorrowerStatus bs ON b.borrower_status = bs.status_id
    WHERE b.borrower_id = borrower_id
    LIMIT 1;

    RETURN status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_item_available` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_item_available`(item_id INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    -- Declare a variable to indicate availability status, default to TRUE
    DECLARE available BOOLEAN DEFAULT TRUE;

    -- Check if the item is currently on loan by finding active loans with "on loan" status
    SET available = NOT EXISTS (
        SELECT 1 
        FROM Loan 
        WHERE item_id = item_id 
        AND loan_status_id IN (SELECT loan_status_id FROM LoanStatus WHERE loan_status = 'on loan')
    );

    RETURN available;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateFine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateFine`(IN borrowerId INT, IN loanId INT, OUT fineAmount DECIMAL(10, 2))
BEGIN
    DECLARE overdueDays INT;
    DECLARE dailyFine DECIMAL(10, 2);
    DECLARE maxFine DECIMAL(10, 2);
    DECLARE fineAmount DECIMAL(10, 2);
    DECLARE isFirstOffense BOOLEAN;

    -- Get the overdue days and fine rules
    SELECT DATEDIFF(CURDATE(), due_date) INTO overdueDays
    FROM Loan
    WHERE loan_id = loanId AND borrower_id = borrowerId AND returned_on IS NULL;

    -- Default values if the item is not overdue
    IF overdueDays IS NULL OR overdueDays <= 0 THEN
        SET fineAmount = 0;
    ELSE
        -- Get fine rules based on the loaned item
        SELECT lr.daily_fine, lr.max_renewals
        INTO dailyFine, maxFine
        FROM Loan_rules lr
        JOIN Items i ON lr.itemtype_id = i.item_id
        JOIN Loan l ON i.item_id = l.item_id
        WHERE l.loan_id = loanId;

        -- Calculate fine (after 2-week grace period)
        IF overdueDays > 14 THEN
            SET fineAmount = LEAST((overdueDays - 14) * dailyFine, maxFine);
        ELSE
            SET fineAmount = 0;
        END IF;
    END IF;

    -- Check if the borrower is a first-time offender
    SET isFirstOffense = NOT EXISTS (
        SELECT 1 FROM Fines WHERE borrower_id = borrowerId
    );

    -- Waive fine for first-time offenders
    IF isFirstOffense THEN
        SET fineAmount = 0;
    END IF;

    -- Record the fine
    IF fineAmount > 0 THEN
        INSERT INTO Fines (borrower_id, item_id, fine_amount, fine_date, loan_id)
        SELECT borrower_id, item_id, fineAmount, CURDATE(), loan_id
        FROM Loan
        WHERE loan_id = loanId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_loan_or_hold` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_loan_or_hold`(
    IN borrower_id INT,
    IN item_id INT,
    IN loaned_on DATE,
    IN due_date DATE
)
BEGIN
    DECLARE item_on_loan INT;

    -- Step 1: Check if the item is already on loan (i.e., no returned_on value)
    SELECT COUNT(*) INTO item_on_loan
    FROM loan
    WHERE item_id = item_id
      AND returned_on IS NULL;

    -- Step 2: If the item is on loan, create a hold
    IF item_on_loan > 0 THEN
        -- Create a new hold in the reserves table
        INSERT INTO reserves (item_id, borrower_id, date_reserved, expiration_date)
        VALUES (item_id, borrower_id, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY));  -- Example: expiration 14 days from today

        SELECT 'Hold created' AS status;
    ELSE
        -- Step 3: If the item is not on loan, create a loan
        INSERT INTO loan (borrower_id, item_id, loaned_on, due_date, loan_status_id, renewal_count)
        VALUES (borrower_id, item_id, loaned_on, due_date, 0, 0);  -- Initial loan with status 0 and renewal count 0

        SELECT 'Loan created' AS status;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `extend_loan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `extend_loan`(
    IN borrower_id INT,
    IN item_id INT,
    IN new_due_date DATE
)
BEGIN
    DECLARE loan_exists INT;

    -- Step 1: Check if the loan exists and has not been returned
    SELECT COUNT(*) INTO loan_exists

    FROM loan
    WHERE borrower_id = borrower_id
      AND item_id = item_id
      AND returned_on IS NULL;

    -- Step 2: If the loan exists, update the due date and increment the renewal count

    IF loan_exists > 0 THEN
        UPDATE loan
        SET due_date = new_due_date,
            renewal_count = renewal_count + 1
        WHERE borrower_id = borrower_id
          AND item_id = item_id
          AND returned_on IS NULL;

        SELECT 'Loan extended successfully' AS status;
    ELSE

        -- Step 3: If no active loan exists, return an error message
        SELECT 'No active loan found to extend' AS status;
    END IF;
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
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-26 15:25:21
