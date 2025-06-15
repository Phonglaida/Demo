-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mubaohiem
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FKt9tj2hob3b2lb8y24lpl53sm4` (`department_id`),
  CONSTRAINT `FKt9tj2hob3b2lb8y24lpl53sm4` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Nữ','Mũ cho nữ',1),(2,'Trẻ em','Mũ dành cho trẻ em',2),(3,'Nam','Mũ dành cho nam',3);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` bigint NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Một'),(2,'Hai'),(3,'Ba');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `settle_type` varchar(255) DEFAULT NULL,
  `total_order_value` decimal(38,2) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK14n2jkmoyhpimhracvcdy7sst` (`customer_id`),
  CONSTRAINT `FK14n2jkmoyhpimhracvcdy7sst` FOREIGN KEY (`customer_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `method` varchar(255) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `UKmf7n8wo2rwrxsd6f3t9ub2mep` (`order_id`),
  CONSTRAINT `FKlouu98csyullos9k25tbpk4va` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img1path` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `stock_quantity` int DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,'Mũ bảo hiểm 3/4 màu xanh dương thời trang, thiết kế chắc chắn, an toàn khi di chuyển.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238833/4nfPGXIMG_4779_x0q3o6.jpg',550000,'Mũ 3/4 màu xanh dương',80,1,NULL),(2,NULL,'Mũ bảo hiểm 3/4 màu kem thanh lịch, thiết kế thời trang, lớp sơn bền màu, mang lại sự an toàn và thoải mái khi di chuyển.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238785/GaiA-G01-30-510x510.jpg_gpli11.webp',350000,'Mũ 3/4 màu Kem',120,1,NULL),(3,NULL,'Mũ bảo hiểm 3/4 màu đen sần cá tính, lớp sơn nhám chống trầy, kiểu dáng thể thao, phù hợp đi phố lẫn đường trường.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238784/M139-Van-Carbon_jh83m4.webp',420000,'Mũ 3/4 màu đen sần',90,1,NULL),(4,NULL,'Mũ bảo hiểm trẻ em in hình Doraemon đáng yêu, đạt tiêu chuẩn an toàn.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238837/doremon_pwmcli.jpg',290000,'Mũ trẻ em Doraemon màu đỏ',60,2,NULL),(5,NULL,'Mũ trẻ em thiết kế hình cá heo ngộ nghĩnh, siêu nhẹ, an toàn cho bé.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238839/asia-730x500_xtl4bf.jpg',300000,'Mũ trẻ em hình cá heo',70,2,NULL),(6,NULL,'Mũ bảo hiểm trẻ em khủng long dễ thương, màu sắc bắt mắt, chất liệu bền đẹp.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238840/huong-dan-chon-mu-bao-hiem-tre-em-dat-chuan-6-730x420_ncgcum.jpg',320000,'Mũ trẻ em hình khủng long',50,2,NULL),(7,NULL,'Mũ bảo hiểm Fullface vỏ carbon siêu nhẹ, kiểu dáng thể thao, bảo vệ tối đa.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238841/ls2-mx701-black-300x300_jy6om3.jpg',1500000,'Mũ Fullface carbon',40,3,NULL),(8,NULL,'Mũ Fullface màu đen bóng sang trọng, lót kháng khuẩn, kính chắn gió chống tia UV.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238841/mu-fullface-avrar_lzpd86.webp',1350000,'Mũ Fullface đen bóng',35,3,NULL),(9,NULL,'Mũ Fullface họa tiết độc đáo, chất liệu cao cấp, phù hợp cho phượt thủ chuyên nghiệp.','https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238842/kiotviet_c069638371b3f86f3f2ce7584a735470_kj1d2a.jpg',1600000,'Mũ Fullface hình thù đẹp mắt',25,3,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_content` text,
  `customer_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `FKrrkqlt8co52qjdj34nqv97xn4` (`customer_id`),
  KEY `FKiyof1sindb9qiqr9o8npj8klt` (`product_id`),
  CONSTRAINT `FKiyof1sindb9qiqr9o8npj8klt` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKrrkqlt8co52qjdj34nqv97xn4` FOREIGN KEY (`customer_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKlqjrcobrh9jc8wpcar64q1bfh` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'https://res.cloudinary.com/dkxnkqvrp/image/upload/v1747238840/huong-dan-chon-mu-bao-hiem-tre-em-dat-chuan-6-730x420_ncgcum.jpg','2025-06-13 16:43:44.808653','khongcamxuc1234567890@gmail.com','test123','$2a$10$memCMJiuBD9leENnUd.0DeNMg3cCZDKNq/7Q4HHIHSTGul3u8AnNO','0937762231','ACTIVE','2025-06-13 16:43:44.808653','test');
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

-- Dump completed on 2025-06-14  3:45:52
