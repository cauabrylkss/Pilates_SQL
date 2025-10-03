-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: pilates1
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `cpf` char(11) NOT NULL,
  `idMatricula` char(5) DEFAULT NULL,
  `dadosSaude` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idMatricula` (`idMatricula`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`),
  CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`idMatricula`) REFERENCES `matricula` (`idMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `cep` char(8) NOT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `rua` varchar(45) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cep`),
  UNIQUE KEY `cep` (`cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `cpf` char(11) NOT NULL,
  `idFuncionario` char(1) NOT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `idPagamento` char(5) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `idFuncionario` (`idFuncionario`),
  KEY `idPagamento` (`idPagamento`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`),
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`idPagamento`) REFERENCES `salario` (`idPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `idMatricula` char(5) NOT NULL,
  `statusMatricula` varchar(45) DEFAULT NULL,
  `idMensalidade` varchar(5) DEFAULT NULL,
  `idPlano` int DEFAULT NULL,
  PRIMARY KEY (`idMatricula`),
  UNIQUE KEY `idMatricula` (`idMatricula`),
  KEY `idMensalidade` (`idMensalidade`),
  KEY `idPlano` (`idPlano`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`idMensalidade`) REFERENCES `mensalidade` (`idMensalidade`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`idPlano`) REFERENCES `plano` (`idPlano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensalidade`
--

DROP TABLE IF EXISTS `mensalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensalidade` (
  `idMensalidade` varchar(5) NOT NULL,
  `dataRecorrencia` int DEFAULT NULL,
  `statusMensalidade` varchar(45) DEFAULT NULL,
  `formaPagamento` varchar(45) DEFAULT NULL,
  `mensalidade` int DEFAULT NULL,
  PRIMARY KEY (`idMensalidade`),
  UNIQUE KEY `idMensalidade` (`idMensalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidade`
--

LOCK TABLES `mensalidade` WRITE;
/*!40000 ALTER TABLE `mensalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` char(11) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `cep` (`cep`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`cep`) REFERENCES `endereco` (`cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano`
--

DROP TABLE IF EXISTS `plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano` (
  `idPlano` int NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `valor` int DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `regrasCancelameto` varchar(100) DEFAULT NULL,
  `beneficios` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPlano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano`
--

LOCK TABLES `plano` WRITE;
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `idProfessor` char(3) NOT NULL,
  `especializacao` varchar(45) DEFAULT NULL,
  `idPagamento` char(5) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `idProfessor` (`idProfessor`),
  KEY `idPagamento` (`idPagamento`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`),
  CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`idPagamento`) REFERENCES `salario` (`idPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario` (
  `idPagamento` char(5) NOT NULL,
  `dataDeposito` int DEFAULT NULL,
  `statusSalario` varchar(45) DEFAULT NULL,
  `formaDeposito` varchar(45) DEFAULT NULL,
  `pagamento` int DEFAULT NULL,
  PRIMARY KEY (`idPagamento`),
  UNIQUE KEY `idPagamento` (`idPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario`
--

LOCK TABLES `salario` WRITE;
/*!40000 ALTER TABLE `salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `idTurma` char(5) NOT NULL,
  `horario` time NOT NULL,
  `idProfessor` char(3) DEFAULT NULL,
  `nivel` varchar(45) DEFAULT NULL,
  `capacidadeMax` int NOT NULL,
  PRIMARY KEY (`idTurma`),
  UNIQUE KEY `idTurma` (`idTurma`),
  KEY `idProfessor` (`idProfessor`),
  CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmaaluno`
--

DROP TABLE IF EXISTS `turmaaluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turmaaluno` (
  `idTurma` char(5) NOT NULL,
  `idMatricula` char(5) NOT NULL,
  PRIMARY KEY (`idTurma`,`idMatricula`),
  KEY `idMatricula` (`idMatricula`),
  CONSTRAINT `turmaaluno_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`),
  CONSTRAINT `turmaaluno_ibfk_2` FOREIGN KEY (`idMatricula`) REFERENCES `matricula` (`idMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmaaluno`
--

LOCK TABLES `turmaaluno` WRITE;
/*!40000 ALTER TABLE `turmaaluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `turmaaluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-26 11:49:54
