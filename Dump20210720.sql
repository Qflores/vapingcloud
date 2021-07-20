CREATE DATABASE  IF NOT EXISTS `dbvapinc` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbvapinc`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: dbvapinc
-- ------------------------------------------------------
-- Server version	5.7.31

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'Otros');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canty` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detail_header` (`id_order`),
  KEY `fk_detail_product` (`id_product`),
  CONSTRAINT `fk_detail_header` FOREIGN KEY (`id_order`) REFERENCES `orderheader` (`id`),
  CONSTRAINT `fk_detail_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderheader`
--

DROP TABLE IF EXISTS `orderheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderheader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount` decimal(10,3) DEFAULT NULL,
  `f_sales` datetime NOT NULL,
  `subtotal` decimal(10,3) NOT NULL,
  `state` char(1) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_province` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`id`),
  KEY `fk_order_person` (`id_user`),
  KEY `fk_order_province` (`id_province`),
  CONSTRAINT `fk_order_person` FOREIGN KEY (`id_user`) REFERENCES `persona` (`id`),
  CONSTRAINT `fk_order_province` FOREIGN KEY (`id_province`) REFERENCES `province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderheader`
--

LOCK TABLES `orderheader` WRITE;
/*!40000 ALTER TABLE `orderheader` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderheader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(200) DEFAULT NULL,
  `user` varchar(25) DEFAULT NULL,
  `email` varchar(85) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `document` varchar(20) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `type` enum('cliente','worker') NOT NULL,
  `state` enum('activo','inactivo') NOT NULL,
  `role` enum('cliente','admin') DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'soporte cloud','soporte99','soporte99@gmail.com','32189564','45','one','worker','activo','admin','$2y$12$yC2MwtP7Y89ROUSj7t4.eONRhI4zB/M7ZUHQXdAiqhAh/ryA9hHxm');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(250) NOT NULL,
  `title` varchar(45) DEFAULT '',
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_picture_product_idx` (`id_product`),
  CONSTRAINT `fk_picture_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(30) DEFAULT NULL,
  `name` text,
  `description` text,
  `detalle` text,
  `price` decimal(10,3) NOT NULL,
  `state` char(1) DEFAULT '1',
  `quantity` decimal(10,2) DEFAULT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`id_category`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'gjghj','Lorem Ipsum','it amet, consectetur adipiscing elit. Donec sed elit magna. Cras pulvinar volutpat vestibulum. Pellentesque libero diam, finibus in hendrerit ac, sollicitudin at dolor. Interdum et malesuada fame','Curabitur at quam quis nunc sodales laoreet. Aenean placerat diam nisi, at molestie nisl molestie vel. Etiam in consectetur nulla. Suspendisse potenti. Aliquam dignissim faucibus mi, et mattis elit sollicitudin a. Nulla posuere, turpis id sagittis porta, purus felis rutrum sem, vitae viverra metus libero at lacus. Nullam aliquet tincidunt porttitor. Proin pretium nisl mi, nec laoreet dui varius in. Donec commodo lectus quis ante hendrerit volutpat. Pellentesque accumsan tristique eros ut mollis.',563.200,'1',26.00,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProvincia` varchar(4) CHARACTER SET utf8 NOT NULL,
  `Provincia` varchar(45) CHARACTER SET utf8 NOT NULL,
  `IdDepartamento` varchar(2) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'0101','Chachapoyas','01'),(2,'0102','Bagua','01'),(3,'0103','Bongará','01'),(4,'0104','Condorcanqui','01'),(5,'0105','Luya','01'),(6,'0106','Rodríguez de Mendoza','01'),(7,'0107','Utcubamba','01'),(8,'0201','Huaraz','02'),(9,'0202','Aija','02'),(10,'0203','Antonio Raymondi','02'),(11,'0204','Asunción','02'),(12,'0205','Bolognesi','02'),(13,'0206','Carhuaz','02'),(14,'0207','Carlos Fermín Fitzcarrald','02'),(15,'0208','Casma','02'),(16,'0209','Corongo','02'),(17,'0210','Huari','02'),(18,'0211','Huarmey','02'),(19,'0212','Huaylas','02'),(20,'0213','Mariscal Luzuriaga','02'),(21,'0214','Ocros','02'),(22,'0215','Pallasca','02'),(23,'0216','Pomabamba','02'),(24,'0217','Recuay','02'),(25,'0218','Santa','02'),(26,'0219','Sihuas','02'),(27,'0220','Yungay','02'),(28,'0301','Abancay','03'),(29,'0302','Andahuaylas','03'),(30,'0303','Antabamba','03'),(31,'0304','Aymaraes','03'),(32,'0305','Cotabambas','03'),(33,'0306','Chincheros','03'),(34,'0307','Grau','03'),(35,'0401','Arequipa','04'),(36,'0402','Camaná','04'),(37,'0403','Caravelí','04'),(38,'0404','Castilla','04'),(39,'0405','Caylloma','04'),(40,'0406','Condesuyos','04'),(41,'0407','Islay','04'),(42,'0408','La Uniòn','04'),(43,'0501','Huamanga','05'),(44,'0502','Cangallo','05'),(45,'0503','Huanca Sancos','05'),(46,'0504','Huanta','05'),(47,'0505','La Mar','05'),(48,'0506','Lucanas','05'),(49,'0507','Parinacochas','05'),(50,'0508','Pàucar del Sara Sara','05'),(51,'0509','Sucre','05'),(52,'0510','Víctor Fajardo','05'),(53,'0511','Vilcas Huamán','05'),(54,'0601','Cajamarca','06'),(55,'0602','Cajabamba','06'),(56,'0603','Celendín','06'),(57,'0604','Chota','06'),(58,'0605','Contumazá','06'),(59,'0606','Cutervo','06'),(60,'0607','Hualgayoc','06'),(61,'0608','Jaén','06'),(62,'0609','San Ignacio','06'),(63,'0610','San Marcos','06'),(64,'0611','San Miguel','06'),(65,'0612','San Pablo','06'),(66,'0613','Santa Cruz','06'),(67,'0701','Callao','07'),(68,'0801','Cusco','08'),(69,'0802','Acomayo','08'),(70,'0803','Anta','08'),(71,'0804','Calca','08'),(72,'0805','Canas','08'),(73,'0806','Canchis','08'),(74,'0807','Chumbivilcas','08'),(75,'0808','Espinar','08'),(76,'0809','La Convención','08'),(77,'0810','Paruro','08'),(78,'0811','Paucartambo','08'),(79,'0812','Quispicanchi','08'),(80,'0813','Urubamba','08'),(81,'0901','Huancavelica','09'),(82,'0902','Acobamba','09'),(83,'0903','Angaraes','09'),(84,'0904','Castrovirreyna','09'),(85,'0905','Churcampa','09'),(86,'0906','Huaytará','09'),(87,'0907','Tayacaja','09'),(88,'1001','Huánuco','10'),(89,'1002','Ambo','10'),(90,'1003','Dos de Mayo','10'),(91,'1004','Huacaybamba','10'),(92,'1005','Huamalíes','10'),(93,'1006','Leoncio Prado','10'),(94,'1007','Marañón','10'),(95,'1008','Pachitea','10'),(96,'1009','Puerto Inca','10'),(97,'1010','Lauricocha ','10'),(98,'1011','Yarowilca ','10'),(99,'1101','Ica ','11'),(100,'1102','Chincha ','11'),(101,'1103','Nasca ','11'),(102,'1104','Palpa ','11'),(103,'1105','Pisco ','11'),(104,'1201','Huancayo ','12'),(105,'1202','Concepción ','12'),(106,'1203','Chanchamayo ','12'),(107,'1204','Jauja ','12'),(108,'1205','Junín ','12'),(109,'1206','Satipo ','12'),(110,'1207','Tarma ','12'),(111,'1208','Yauli ','12'),(112,'1209','Chupaca ','12'),(113,'1301','Trujillo ','13'),(114,'1302','Ascope ','13'),(115,'1303','Bolívar ','13'),(116,'1304','Chepén ','13'),(117,'1305','Julcán ','13'),(118,'1306','Otuzco ','13'),(119,'1307','Pacasmayo ','13'),(120,'1308','Pataz ','13'),(121,'1309','Sánchez Carrión ','13'),(122,'1310','Santiago de Chuco ','13'),(123,'1311','Gran Chimú ','13'),(124,'1312','Virú ','13'),(125,'1401','Chiclayo ','14'),(126,'1402','Ferreñafe ','14'),(127,'1403','Lambayeque ','14'),(128,'1501','Lima ','15'),(129,'1502','Barranca ','15'),(130,'1503','Cajatambo ','15'),(131,'1504','Canta ','15'),(132,'1505','Cañete ','15'),(133,'1506','Huaral ','15'),(134,'1507','Huarochirí ','15'),(135,'1508','Huaura ','15'),(136,'1509','Oyón ','15'),(137,'1510','Yauyos ','15'),(138,'1601','Maynas ','16'),(139,'1602','Alto Amazonas ','16'),(140,'1603','Loreto ','16'),(141,'1604','Mariscal Ramón Castilla ','16'),(142,'1605','Requena ','16'),(143,'1606','Ucayali ','16'),(144,'1607','Datem del Marañón ','16'),(145,'1608','Putumayo','16'),(146,'1701','Tambopata ','17'),(147,'1702','Manu ','17'),(148,'1703','Tahuamanu ','17'),(149,'1801','Mariscal Nieto ','18'),(150,'1802','General Sánchez Cerro ','18'),(151,'1803','Ilo ','18'),(152,'1901','Pasco ','19'),(153,'1902','Daniel Alcides Carrión ','19'),(154,'1903','Oxapampa ','19'),(155,'2001','Piura ','20'),(156,'2002','Ayabaca ','20'),(157,'2003','Huancabamba ','20'),(158,'2004','Morropón ','20'),(159,'2005','Paita ','20'),(160,'2006','Sullana ','20'),(161,'2007','Talara ','20'),(162,'2008','Sechura ','20'),(163,'2101','Puno ','21'),(164,'2102','Azángaro ','21'),(165,'2103','Carabaya ','21'),(166,'2104','Chucuito ','21'),(167,'2105','El Collao ','21'),(168,'2106','Huancané ','21'),(169,'2107','Lampa ','21'),(170,'2108','Melgar ','21'),(171,'2109','Moho ','21'),(172,'2110','San Antonio de Putina ','21'),(173,'2111','San Román ','21'),(174,'2112','Sandia ','21'),(175,'2113','Yunguyo ','21'),(176,'2201','Moyobamba ','22'),(177,'2202','Bellavista ','22'),(178,'2203','El Dorado ','22'),(179,'2204','Huallaga ','22'),(180,'2205','Lamas ','22'),(181,'2206','Mariscal Cáceres ','22'),(182,'2207','Picota ','22'),(183,'2208','Rioja ','22'),(184,'2209','San Martín ','22'),(185,'2210','Tocache ','22'),(186,'2301','Tacna ','23'),(187,'2302','Candarave ','23'),(188,'2303','Jorge Basadre ','23'),(189,'2304','Tarata ','23'),(190,'2401','Tumbes ','24'),(191,'2402','Contralmirante Villar ','24'),(192,'2403','Zarumilla ','24'),(193,'2501','Coronel Portillo ','25'),(194,'2502','Atalaya ','25'),(195,'2503','Padre Abad ','25'),(196,'2504','Purús','25');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbvapinc'
--

--
-- Dumping routines for database 'dbvapinc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-20 11:51:22
