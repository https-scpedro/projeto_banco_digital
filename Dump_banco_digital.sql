CREATE DATABASE  IF NOT EXISTS `banco_digital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco_digital`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: banco_digital
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta` (
  `codConta` int NOT NULL AUTO_INCREMENT,
  `saldo` decimal(8,2) DEFAULT NULL,
  `codUser` int DEFAULT NULL,
  PRIMARY KEY (`codConta`),
  KEY `codUser` (`codUser`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,1500.75,1),(2,8520.00,2),(3,3250.50,3),(4,12800.00,4),(5,730.25,5),(6,25000.00,6),(7,980.90,7),(8,4750.00,8),(9,1800.40,9),(10,12300.60,10),(11,6400.00,11),(12,2100.80,12),(13,33000.00,13),(14,500.55,14),(15,1980.00,15),(16,7600.30,16),(17,15000.00,17),(18,2200.20,18),(19,890.70,19),(20,4100.00,20),(21,1100.00,21),(22,650.45,22),(23,5300.00,23),(24,1600.10,24),(25,27500.00,25);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investimento`
--

DROP TABLE IF EXISTS `investimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investimento` (
  `codInvest` int NOT NULL AUTO_INCREMENT,
  `dataAplicacao` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `codUser` int DEFAULT NULL,
  `codProduto` int DEFAULT NULL,
  `valorAplicado` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codInvest`),
  KEY `codUser` (`codUser`),
  KEY `codProduto` (`codProduto`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investimento`
--

LOCK TABLES `investimento` WRITE;
/*!40000 ALTER TABLE `investimento` DISABLE KEYS */;
INSERT INTO `investimento` VALUES (1,'2024-01-10',1,1,1,5000.00),(2,'2024-01-15',1,2,5,12000.00),(3,'2024-01-20',1,3,9,7500.00),(4,'2024-01-25',1,4,14,1500.75),(5,'2024-02-01',1,5,2,3200.50),(6,'2024-02-05',1,6,18,25000.00),(7,'2024-02-10',0,7,3,800.00),(8,'2024-02-15',1,8,11,4500.00),(9,'2024-02-20',1,9,21,10000.00),(10,'2024-02-25',1,10,6,18000.00),(11,'2024-03-01',1,11,25,2200.75),(12,'2024-03-05',0,12,7,500.00),(13,'2024-03-10',1,13,10,30000.00),(14,'2024-03-15',1,14,4,950.25),(15,'2024-03-20',1,15,12,6800.00),(16,'2024-03-25',1,16,15,13500.00),(17,'2024-04-01',1,17,19,17000.00),(18,'2024-04-05',0,18,8,2500.00),(19,'2024-04-10',1,19,13,5500.00),(20,'2024-04-15',1,20,22,8200.00),(21,'2024-04-20',1,21,16,400.00),(22,'2024-04-25',1,22,20,9800.00),(23,'2024-05-01',1,23,24,11000.00),(24,'2024-05-05',1,24,17,1650.90),(25,'2024-05-10',1,25,23,7000.00),(26,'2025-01-20',1,10,1,8000.00),(27,'2025-02-10',1,15,1,12500.00),(28,'2025-03-05',1,8,5,2000.00),(29,'2025-04-15',1,19,5,7500.00),(30,'2025-05-22',1,22,5,3000.00),(31,'2025-01-25',1,1,9,6000.00),(32,'2025-02-18',1,20,9,9500.00),(33,'2025-03-11',1,5,11,1500.00),(34,'2025-03-20',1,14,2,4500.00),(35,'2025-04-01',1,21,2,3000.00),(36,'2025-01-15',1,3,10,15000.00),(37,'2025-02-25',1,24,10,5500.00),(38,'2025-05-10',1,6,15,22000.00),(39,'2025-05-12',1,11,15,8000.00),(40,'2025-06-03',1,9,15,6200.00),(41,'2025-04-28',1,4,20,18000.00),(42,'2025-05-30',1,18,20,1300.00),(43,'2025-06-01',1,7,1,9900.00),(44,'2025-04-05',1,2,12,1800.00),(45,'2025-03-18',1,17,22,4800.00),(46,'2025-01-10',1,2,13,9000.00),(47,'2025-01-12',1,12,13,11000.00),(48,'2025-01-18',1,16,14,4500.00),(49,'2025-01-22',1,23,14,5200.00),(50,'2025-02-05',1,4,16,12000.00),(51,'2025-02-08',1,10,16,8500.00),(52,'2025-02-15',1,1,17,10000.00),(53,'2025-02-20',1,13,17,25000.00),(54,'2025-03-01',1,18,18,7800.00),(55,'2025-03-03',1,25,18,14000.00),(56,'2025-03-10',1,3,19,20000.00),(57,'2025-03-12',1,20,19,5000.00),(58,'2025-04-02',1,11,21,3300.00),(59,'2025-04-07',1,14,21,4800.00),(60,'2025-04-15',1,5,23,11500.00),(61,'2025-04-18',1,15,23,9200.00),(62,'2025-05-05',1,8,24,6000.00),(63,'2025-05-09',1,17,24,8800.00),(64,'2025-05-20',1,2,25,19000.00),(65,'2025-05-21',1,19,25,4000.00),(66,'2025-02-11',1,3,5,11000.00),(67,'2025-03-14',1,7,5,9500.00),(68,'2025-01-30',1,21,1,14000.00),(69,'2025-02-28',1,23,1,7200.00),(70,'2025-03-25',1,25,1,18000.00),(71,'2025-04-10',1,5,10,6800.00),(72,'2025-05-15',1,12,10,8100.00),(73,'2025-02-02',1,6,9,13000.00),(74,'2025-03-09',1,14,9,8800.00),(75,'2025-04-04',1,10,24,10500.00),(76,'2025-06-02',1,4,13,8500.00),(77,'2025-06-03',1,8,13,12000.00),(78,'2025-06-05',1,5,18,9500.00),(79,'2025-06-06',1,22,18,4000.00),(80,'2025-06-01',1,1,14,3000.00),(81,'2025-06-04',1,15,16,7000.00),(82,'2025-06-07',1,24,20,6000.00),(83,'2025-06-08',1,2,23,11000.00);
/*!40000 ALTER TABLE `investimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_financeiro`
--

DROP TABLE IF EXISTS `produto_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_financeiro` (
  `codProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `rentabilidadeAnual` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`codProduto`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_financeiro`
--

LOCK TABLES `produto_financeiro` WRITE;
/*!40000 ALTER TABLE `produto_financeiro` DISABLE KEYS */;
INSERT INTO `produto_financeiro` VALUES (1,'Tesouro Selic 2027','Tesouro Direto',11),(2,'CDB Banco Real 2026','CDB',11),(3,'LCI Agro Bank 2025','LCI',10),(4,'LCA Pecuária Forte','LCA',10),(5,'Fundo de Ações Tech Giants','Fundo de Investimento',16),(6,'Fundo Imobiliário Shopping Center','FII',12),(7,'CRI Logística Total','CRI',12),(8,'CRA Safra Top','CRA',11),(9,'Ações MegaCorp S.A.','Ações',18),(10,'Tesouro IPCA+ 2035','Tesouro Direto',7),(11,'CDB Liquidez Diária Capital','CDB',10),(12,'LCI Imobiliária Invest','LCI',10),(13,'LCA Grão Mestre','LCA',10),(14,'Fundo Multimercado Global','Fundo de Investimento',13),(15,'FII Galpões Logísticos','FII',12),(16,'CRI Residencial Seguro','CRI',11),(17,'CRA Agro forte','CRA',11),(18,'Ações Blue Chip Valor','Ações',17),(19,'Tesouro Prefixado 2031','Tesouro Direto',12),(20,'CDB Banco Forte Pós-fixado','CDB',11),(21,'LCI Construção Civil','LCI',10),(22,'LCA Açúcar e Álcool','LCA',10),(23,'Fundo de Renda Fixa High Grade','Fundo de Investimento',10),(24,'FII Lajes Corporativas','FII',13),(25,'Ações Small Caps Potencial','Ações',22);
/*!40000 ALTER TABLE `produto_financeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rendimento`
--

DROP TABLE IF EXISTS `rendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rendimento` (
  `codRendimento` int NOT NULL AUTO_INCREMENT,
  `dataRendimento` date DEFAULT NULL,
  `valorRendimento` decimal(5,2) DEFAULT NULL,
  `codInvest` int DEFAULT NULL,
  PRIMARY KEY (`codRendimento`),
  KEY `codInvest` (`codInvest`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rendimento`
--

LOCK TABLES `rendimento` WRITE;
/*!40000 ALTER TABLE `rendimento` DISABLE KEYS */;
INSERT INTO `rendimento` VALUES (1,'2024-06-01',12.50,1),(2,'2024-06-01',55.20,2),(3,'2024-06-01',80.00,3),(4,'2024-06-01',45.10,4),(5,'2024-06-01',18.75,5),(6,'2024-06-01',92.30,6),(7,'2024-03-10',22.40,7),(8,'2024-06-01',33.00,8),(9,'2024-06-01',29.80,9),(10,'2024-06-01',67.50,10),(11,'2024-06-01',112.00,11),(12,'2024-04-05',25.15,12),(13,'2024-06-01',41.50,13),(14,'2024-06-01',9.80,14),(15,'2024-06-01',28.40,15),(16,'2024-06-01',49.90,16),(17,'2024-06-01',75.00,17),(18,'2024-05-05',15.60,18),(19,'2024-06-01',40.20,19),(20,'2024-06-01',31.70,20),(21,'2024-06-01',51.00,21),(22,'2024-06-01',66.80,22),(23,'2024-06-01',99.50,23),(24,'2024-06-01',58.60,24),(25,'2024-06-01',88.25,25);
/*!40000 ALTER TABLE `rendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_transacao`
--

DROP TABLE IF EXISTS `tipo_transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_transacao` (
  `codTipoTransacao` int NOT NULL AUTO_INCREMENT,
  `descricao` text,
  PRIMARY KEY (`codTipoTransacao`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_transacao`
--

LOCK TABLES `tipo_transacao` WRITE;
/*!40000 ALTER TABLE `tipo_transacao` DISABLE KEYS */;
INSERT INTO `tipo_transacao` VALUES (1,'Depósito'),(2,'Saque'),(3,'Transferência'),(4,'Pagamento de Conta');
/*!40000 ALTER TABLE `tipo_transacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacao`
--

DROP TABLE IF EXISTS `transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacao` (
  `codTransac` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(8,2) DEFAULT NULL,
  `dataTransac` date DEFAULT NULL,
  `codConta` int DEFAULT NULL,
  `codTipoTransacao` int DEFAULT NULL,
  PRIMARY KEY (`codTransac`),
  KEY `codConta` (`codConta`),
  KEY `codTipoTransacao` (`codTipoTransacao`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacao`
--

LOCK TABLES `transacao` WRITE;
/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
INSERT INTO `transacao` VALUES (1,500.00,'2024-05-01',1,1),(2,150.00,'2024-05-03',1,2),(3,200.50,'2024-05-02',2,4),(4,1000.00,'2024-05-04',3,3),(5,80.20,'2024-05-05',4,2),(6,1200.00,'2024-05-05',5,1),(7,75.00,'2024-05-06',6,4),(8,350.00,'2024-05-07',7,2),(9,900.00,'2024-05-08',8,3),(10,2500.00,'2024-05-08',9,1),(11,45.60,'2024-05-09',10,4),(12,300.00,'2024-05-10',11,2),(13,1500.00,'2024-05-11',12,1),(14,500.00,'2024-05-12',13,3),(15,99.90,'2024-05-12',14,4),(16,100.00,'2024-05-13',15,2),(17,200.00,'2024-05-14',16,3),(18,600.00,'2024-05-15',17,1),(19,180.75,'2024-05-16',18,4),(20,250.00,'2024-05-17',19,2),(21,700.00,'2024-05-18',20,1),(22,120.00,'2024-05-19',21,4),(23,550.00,'2024-05-20',22,3),(24,50.00,'2024-05-21',23,2),(25,3000.00,'2024-05-22',24,1);
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `codUser` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codUser`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ana Clara Souza','2023-01-15','111.222.333-44','1990-05-20','ana.souza@email.com'),(2,'Bruno Costa','2023-01-20','222.333.444-55','1985-08-12','bruno.costa@email.com'),(3,'Carla Dias','2023-02-01','333.444.555-66','1992-03-30','carla.dias@email.com'),(4,'Daniel Martins','2023-02-10','444.555.666-77','2000-01-15','daniel.martins@email.com'),(5,'Eduarda Ferreira','2023-02-18','555.666.777-88','1998-11-25','eduarda.ferreira@email.com'),(6,'Fábio Gomes','2023-03-05','666.777.888-99','1980-07-07','fabio.gomes@email.com'),(7,'Gabriela Lima','2023-03-12','777.888.999-00','1995-09-18','gabriela.lima@email.com'),(8,'Heitor Pereira','2023-03-25','888.999.000-11','1993-02-28','heitor.pereira@email.com'),(9,'Isabela Ribeiro','2023-04-02','999.000.111-22','2001-04-10','isabela.ribeiro@email.com'),(10,'João Santos','2023-04-15','000.111.222-33','1988-12-01','joao.santos@email.com'),(11,'Larissa Alves','2023-04-28','123.456.789-10','1999-06-22','larissa.alves@email.com'),(12,'Marcos Oliveira','2023-05-10','234.567.891-11','1975-10-14','marcos.oliveira@email.com'),(13,'Natália Barbosa','2023-05-21','345.678.912-12','1994-08-03','natalia.barbosa@email.com'),(14,'Otávio Rodrigues','2023-06-01','456.789.123-13','2002-07-19','otavio.rodrigues@email.com'),(15,'Patrícia Fernandes','2023-06-11','567.891.234-14','1987-03-09','patricia.fernandes@email.com'),(16,'Rafael Azevedo','2023-06-25','678.912.345-15','1991-01-21','rafael.azevedo@email.com'),(17,'Sofia Carvalho','2023-07-03','789.123.456-16','1996-05-24','sofia.carvalho@email.com'),(18,'Thiago Mendes','2023-07-18','891.234.567-17','1983-09-05','thiago.mendes@email.com'),(19,'Úrsula Nogueira','2023-07-29','912.345.678-18','1997-02-13','ursula.nogueira@email.com'),(20,'Victor Barros','2023-08-05','132.435.567-19','2003-10-31','victor.barros@email.com'),(21,'Yasmin Correia','2023-08-14','243.546.678-20','1989-11-08','yasmin.correia@email.com'),(22,'Xavier Pinto','2023-08-22','354.657.789-21','1982-04-17','xavier.pinto@email.com'),(23,'Wagner Teixeira','2023-09-01','465.768.890-22','1990-08-23','wagner.teixeira@email.com'),(24,'Vanessa Moreira','2023-09-10','576.879.901-23','1998-12-26','vanessa.moreira@email.com'),(25,'Zeca Almeida','2023-09-19','687.980.012-24','1979-02-04','zeca.almeida@email.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-05 21:01:31
