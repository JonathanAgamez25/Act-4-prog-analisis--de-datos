-- ============================================================
-- Dump completo: Base de datos PyPI Catalog
-- Proyecto CRISP-DM AE3 — Jonatan Ávila & Estiven Trujillo
-- Generado: 2026-05-29  |  MySQL 8.0
-- ============================================================

CREATE DATABASE IF NOT EXISTS pypi_catalog
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE pypi_catalog;

CREATE USER IF NOT EXISTS 'pypi_user'@'localhost' IDENTIFIED BY 'PyPI2026!';
GRANT ALL PRIVILEGES ON pypi_catalog.* TO 'pypi_user'@'localhost';
FLUSH PRIVILEGES;

-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: pypi_catalog
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `creado_en` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Data Science','Paquetes para análisis de datos, ML y estadística','2026-05-29 19:41:08'),(2,'Web Scraping','Herramientas de extracción de datos web','2026-05-29 19:41:08'),(3,'Web Framework','Frameworks para desarrollo web','2026-05-29 19:41:08'),(4,'Security','Herramientas de ciberseguridad y criptografía','2026-05-29 19:41:08'),(5,'Testing','Frameworks y herramientas de pruebas','2026-05-29 19:41:08'),(6,'Database','ORMs, conectores y herramientas de base de datos','2026-05-29 19:41:08'),(7,'Utilities','Utilidades generales y herramientas de productividad','2026-05-29 19:41:08'),(8,'Networking','Librerías de redes, HTTP y protocolos','2026-05-29 19:41:08');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquetes`
--

DROP TABLE IF EXISTS `paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquetes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `version_actual` varchar(50) DEFAULT NULL,
  `resumen` text,
  `autor` varchar(200) DEFAULT NULL,
  `licencia` varchar(300) DEFAULT NULL,
  `licencia_normalizada` varchar(50) DEFAULT NULL,
  `requiere_python` varchar(50) DEFAULT NULL,
  `url_repositorio` varchar(500) DEFAULT NULL,
  `total_releases` int DEFAULT '0',
  `n_dependencias` int DEFAULT '0',
  `fecha_primera_release` date DEFAULT NULL,
  `anios_desde_primera_version` int DEFAULT NULL,
  `nivel_madurez` varchar(20) DEFAULT NULL,
  `complejidad_dependencias` varchar(20) DEFAULT NULL,
  `tiene_github` tinyint(1) DEFAULT '0',
  `soporta_python3` tinyint(1) DEFAULT '1',
  `categoria` varchar(100) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `fecha_scraping` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `paquetes_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes`
--

LOCK TABLES `paquetes` WRITE;
/*!40000 ALTER TABLE `paquetes` DISABLE KEYS */;
INSERT INTO `paquetes` VALUES (1,'numpy','2.4.6','Fundamental package for array computing in Python','Travis E. Oliphant et al.','','Sin especificar','>=3.11','',146,0,'2006-12-02',20,'Maduro','Baja',1,1,'Data Science',1,'2026-05-29'),(2,'pandas','3.0.3','Powerful data structures for data analysis, time series, and statistics','','BSD 3-Clause License\n         \n         Copyright (c) 2008-2011, AQR Capital Management, LLC, Lambda Foundry, Inc. and PyData Development Team\n         All rights reserved.\n         \n         Copyright (c) 2011-2026, Open source contributors.\n         \n         Redistribution and use in source and b','MIT','>=3.11','',115,84,'2009-12-25',17,'Maduro','Alta',1,1,'Data Science',1,'2026-05-29'),(3,'scikit-learn','1.8.0','A set of python modules for machine learning and data mining','','','Sin especificar','>=3.11','',74,53,'2011-09-22',15,'Maduro','Alta',1,1,'Data Science',1,'2026-05-29'),(4,'matplotlib','3.10.9','Python plotting package','John D. Hunter, Michael Droettboom','License agreement for matplotlib versions 1.3.0 and later\n         =========================================================\n         \n         1. This LICENSE AGREEMENT is between the Matplotlib Development Team\n         (\"MDT\"), and the Individual or Organization (\"Licensee\") accessing and\n       ','MIT','>=3.10','',140,13,'2006-01-09',20,'Maduro','Media',1,1,'Data Science',1,'2026-05-29'),(5,'scipy','1.17.1','Fundamental algorithms for scientific computing in Python','','Copyright (c) 2001-2002 Enthought, Inc. 2003, SciPy Developers.\n         All rights reserved.\n         \n         Redistribution and use in source and binary forms, with or without\n         modification, are permitted provided that the following conditions\n         are met:\n         \n         1. Redi','MIT','>=3.11','',105,38,'2010-07-27',16,'Maduro','Alta',1,1,'Data Science',1,'2026-05-29'),(6,'seaborn','0.13.2','Statistical data visualization','','','Sin especificar','>=3.8','',36,22,'2013-10-28',13,'Estable','Alta',1,1,'Data Science',1,'2026-05-29'),(7,'statsmodels','0.14.6','Statistical computations and models for Python','statsmodels Developers','BSD License','BSD','>=3.9','https://www.statsmodels.org/',41,28,'2012-06-19',14,'Estable','Alta',1,1,'Data Science',1,'2026-05-29'),(8,'requests','2.34.2','Python HTTP for Humans.','','Apache-2.0','Apache-2.0','>=3.10','',163,6,'2011-02-14',15,'Maduro','Media',1,1,'Web Scraping',2,'2026-05-29'),(9,'beautifulsoup4','4.14.3','Screen-scraping library','','MIT License','MIT','>=3.7.0','',53,7,'2013-10-02',13,'Maduro','Media',0,1,'Web Scraping',2,'2026-05-29'),(10,'Scrapy','2.16.0','A high-level Web Crawling and Web Scraping framework','','','Sin especificar','>=3.10','',112,18,'2009-12-12',17,'Maduro','Alta',1,1,'Web Scraping',2,'2026-05-29'),(11,'selenium','4.44.0','Official Python bindings for Selenium WebDriver','','Apache-2.0','Apache-2.0','>=3.10','https://www.selenium.dev',229,6,'2008-04-25',18,'Maduro','Media',0,1,'Web Scraping',2,'2026-05-29'),(12,'playwright','1.60.0','A high-level API to automate web browsers','Microsoft Corporation License-Expression: Apache-2.0','','Sin especificar','>=3.9','',82,2,'2021-02-24',5,'Maduro','Baja',1,1,'Web Scraping',2,'2026-05-29'),(13,'httpx','0.28.1','The next generation HTTP client.','','BSD-3-Clause','BSD','>=3.8','',74,12,'2019-07-19',7,'Maduro','Media',1,1,'Web Scraping',2,'2026-05-29'),(14,'Flask','3.1.3','A simple framework for building complex web applications.','','','Sin especificar','>=3.9','',64,9,'2010-04-16',16,'Maduro','Media',1,1,'Web Framework',3,'2026-05-29'),(15,'Django','6.0.5','A high-level Python web framework that encourages rapid development and clean, pragmatic design.','','','Sin especificar','>=3.12','',432,5,'2010-05-17',16,'Maduro','Media',1,1,'Web Framework',3,'2026-05-29'),(16,'fastapi','0.136.3','FastAPI framework, high performance, easy to learn, fast to code, ready for production','','','Sin especificar','>=3.10','',292,32,'2018-12-08',8,'Maduro','Alta',1,1,'Web Framework',3,'2026-05-29'),(17,'starlette','1.2.0','The little ASGI library that shines.','','','Sin especificar','>=3.10','',194,7,'2018-06-25',8,'Maduro','Media',1,1,'Web Framework',3,'2026-05-29'),(18,'bottle','0.13.4','Fast and simple WSGI-framework for small web-applications.','Marcel Hellkamp','MIT','MIT','','http://bottlepy.org/',85,0,'2009-07-07',17,'Maduro','Baja',1,1,'Web Framework',3,'2026-05-29'),(19,'cryptography','48.0.0','cryptography is a package which provides cryptographic recipes and primitives to Python developers.','','','Sin especificar','!=3.9.0,!=3.9.1,>=3.9','',155,3,'2014-01-08',12,'Maduro','Baja',1,1,'Security',4,'2026-05-29'),(20,'paramiko','5.0.0','SSH2 protocol library','','','Sin especificar','>=3.9','',151,4,'2010-10-27',16,'Maduro','Baja',1,1,'Security',4,'2026-05-29'),(21,'pycryptodome','3.23.0','Cryptographic library for Python','Helder Eijs','BSD, Public Domain','BSD','!=3.0.*,!=3.1.*,!=3.2.*,!=3.3.*,!=3.4.*,!=3.5.*,!=','https://www.pycryptodome.org',58,0,'2014-06-14',12,'Maduro','Baja',1,1,'Security',4,'2026-05-29'),(22,'scapy','2.7.0','Scapy: interactive packet manipulation tool','Philippe BIONDI, Gabriel POTTER','GPL-2.0-only','GPL','<4,>=3.7','',32,9,'2013-10-12',13,'Estable','Media',1,1,'Security',4,'2026-05-29'),(23,'pyotp','2.9.0','Python One Time Password Library','PyOTP contributors','MIT License','MIT','>=3.7','https://github.com/pyotp/pyotp',24,4,'2011-09-26',15,'Estable','Baja',1,1,'Security',4,'2026-05-29'),(24,'pytest','9.0.3','pytest: simple powerful testing with Python','Holger Krekel, Bruno Oliveira, Ronny Pfannschmidt, Floris Bruynooghe, Brianna Laugher, Freya Bruhin, Others (See AUTHORS)','','Sin especificar','>=3.10','',190,14,'2010-11-25',16,'Maduro','Media',1,1,'Testing',5,'2026-05-29'),(25,'unittest2','1.1.0','The new features in unittest backported to Python 2.4+.','Robert Collins','UNKNOWN','Sin especificar','','http://pypi.python.org/pypi/unittest2',22,0,'2010-02-11',16,'Estable','Baja',0,1,'Testing',5,'2026-05-29'),(26,'hypothesis','6.155.0','The property-based testing library for Python','','','Sin especificar','>=3.10','',1516,37,'2013-03-10',13,'Maduro','Alta',1,1,'Testing',5,'2026-05-29'),(27,'Faker','40.19.1','Faker is a Python package that generates fake data for you.','joke2k','MIT License','MIT','>=3.10','https://github.com/joke2k/faker',481,2,'2010-12-23',16,'Maduro','Baja',1,1,'Testing',5,'2026-05-29'),(28,'factory-boy','3.3.3','A versatile test fixtures replacement based on thoughtbot\'s factory_bot for Ruby.','Mark Sandstrom','MIT','MIT','>=3.8','https://github.com/FactoryBoy/factory_boy',46,16,'2010-08-22',16,'Estable','Alta',1,1,'Testing',5,'2026-05-29'),(29,'SQLAlchemy','2.0.50','Database Abstraction Library','Mike Bayer','MIT','MIT','>=3.7','https://www.sqlalchemy.org',323,32,'2006-02-14',20,'Maduro','Alta',1,1,'Database',6,'2026-05-29'),(30,'alembic','1.18.4','A database migration tool for SQLAlchemy.','','','Sin especificar','>=3.10','',143,5,'2011-11-30',15,'Maduro','Media',1,1,'Database',6,'2026-05-29'),(31,'PyMySQL','1.2.0','Pure Python MySQL Driver','','','Sin especificar','>=3.9','',46,2,'2009-06-16',17,'Estable','Baja',1,1,'Database',6,'2026-05-29'),(32,'psycopg2-binary','2.9.12','psycopg2 - Python-PostgreSQL Database Adapter','Federico Di Gregorio','LGPL with exceptions','GPL','>=3.9','https://psycopg.org/',26,0,'2018-01-29',8,'Estable','Baja',1,1,'Database',6,'2026-05-29'),(33,'motor','3.7.1','Non-blocking MongoDB driver for Tornado or asyncio','','Apache License\n                                   Version 2.0, January 2004\n                                http://www.apache.org/licenses/\n        \n           TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION\n        \n           1. Definitions.\n        \n              \"License\" shall mean','MIT','>=3.9','',57,20,'2013-02-01',13,'Maduro','Alta',1,1,'Database',6,'2026-05-29'),(34,'click','8.4.1','Composable command line interface toolkit','','','Sin especificar','>=3.10','',63,1,'2014-04-28',12,'Maduro','Baja',1,1,'Utilities',7,'2026-05-29'),(35,'rich','15.0.0','Render rich text, tables, progress bars, syntax highlighting, markdown and more to the terminal','Will McGugan','MIT','MIT','>=3.9.0','',207,3,'2019-11-10',7,'Maduro','Baja',1,1,'Utilities',7,'2026-05-29'),(36,'pydantic','2.13.4','Data validation using Python type hints','','','Sin especificar','>=3.9','',203,6,'2017-05-03',9,'Maduro','Media',1,1,'Utilities',7,'2026-05-29'),(37,'celery','5.6.3','Distributed Task Queue.','Ask Solem','BSD-3-Clause','BSD','>=3.9','https://docs.celeryq.dev/',224,53,'2009-04-27',17,'Maduro','Alta',1,1,'Utilities',7,'2026-05-29'),(38,'pillow','12.2.0','Python Imaging Library (fork)','','','Sin especificar','>=3.10','',106,26,'2010-07-31',16,'Maduro','Alta',1,1,'Utilities',7,'2026-05-29'),(39,'aiohttp','3.13.5','Async http client/server framework (asyncio)','','Apache-2.0 AND MIT','MIT','>=3.9','',308,12,'2013-10-25',13,'Maduro','Media',1,1,'Networking',8,'2026-05-29'),(40,'urllib3','2.7.0','HTTP library with thread-safe connection pooling, file post, and more.','','','Sin especificar','>=3.10','',108,5,'2009-12-11',17,'Maduro','Media',1,1,'Networking',8,'2026-05-29'),(41,'websockets','16.0','An implementation of the WebSocket Protocol (RFC 6455 & 7692)','','','Sin especificar','>=3.10','',48,0,'2013-11-14',13,'Estable','Baja',1,1,'Networking',8,'2026-05-29'),(42,'Twisted','26.4.0','An asynchronous networking framework written in Python','','MIT License','MIT','>=3.9.12','',111,150,'2005-10-11',21,'Maduro','Alta',1,1,'Networking',8,'2026-05-29');
/*!40000 ALTER TABLE `paquetes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29 19:41:58
