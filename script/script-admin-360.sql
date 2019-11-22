-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: admin_360
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `MENUS`
--

DROP TABLE IF EXISTS `MENUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MENUS` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `icono` varchar(45) DEFAULT NULL,
  `clase` varchar(60) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `id_menu_padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `id_menu_UNIQUE` (`id_menu`),
  KEY `id_menu_padre_idx` (`id_menu_padre`),
  CONSTRAINT `id_menu_padre` FOREIGN KEY (`id_menu_padre`) REFERENCES `menus` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENUS`
--

LOCK TABLES `MENUS` WRITE;
/*!40000 ALTER TABLE `MENUS` DISABLE KEYS */;
INSERT INTO `MENUS` VALUES (1,'Puesto','/puesto',NULL,NULL,1,3),(2,'Cliente','/cliente',NULL,NULL,1,3),(3,'Catalogos',NULL,NULL,NULL,1,NULL),(4,'Vacantes',NULL,NULL,NULL,1,NULL),(5,'Candidatos',NULL,NULL,NULL,1,NULL),(6,'Empleo',NULL,NULL,NULL,1,NULL),(7,'Mi Perfil',NULL,NULL,NULL,1,NULL),(8,'Agregar vacantes','/vacante',NULL,NULL,1,4),(9,'Buscar Candidatos','/candidato',NULL,NULL,1,5),(13,'Buscar Empleo','/empleo',NULL,NULL,1,6),(14,'Mi cv ','/perfil',NULL,NULL,1,7);
/*!40000 ALTER TABLE `MENUS` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ROLES`
--

DROP TABLE IF EXISTS `ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLES` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `id_rol_UNIQUE` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLES`
--

LOCK TABLES `ROLES` WRITE;
/*!40000 ALTER TABLE `ROLES` DISABLE KEYS */;
INSERT INTO `ROLES` VALUES (1,'ROLE_ADMIN','rol de administrador',1),(2,'ROLE_USER','Rol de usuario candidato',1);
/*!40000 ALTER TABLE `ROLES` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `MENUS_ROLES`
--

DROP TABLE IF EXISTS `MENUS_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MENUS_ROLES` (
  `id_menu_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id_menu_rol`),
  KEY `id_rol_fk_idx` (`id_rol`),
  KEY `id_rol_fkm_idx` (`id_rol`),
  KEY `id_menu_fkm_idx` (`id_menu`),
  CONSTRAINT `id:menu_fkm` FOREIGN KEY (`id_menu`) REFERENCES `menus` (`id_menu`),
  CONSTRAINT `id_rol_fkm` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENUS_ROLES`
--

LOCK TABLES `MENUS_ROLES` WRITE;
/*!40000 ALTER TABLE `MENUS_ROLES` DISABLE KEYS */;
INSERT INTO `MENUS_ROLES` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,2,6,1),(7,2,7,1),(8,1,8,1),(9,1,9,1),(10,2,13,1),(11,2,14,1);
/*!40000 ALTER TABLE `MENUS_ROLES` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIOS` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  UNIQUE KEY `idUsuario_UNIQUE` (`id_usuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIOS`
--

LOCK TABLES `USUARIOS` WRITE;
/*!40000 ALTER TABLE `USUARIOS` DISABLE KEYS */;
INSERT INTO `USUARIOS` VALUES (1,'admin','$2a$10$C3Uln5uqnzx/GswADURJGOIdBqYrly9731fnwKDaUdBkt/M3qvtLq','miguel@gmail.com',NULL,1),(2,'user','$2a$10$BolW6uT8XpDXc5ClTzoPrODVNPReTCrB2dPeLMfBRm2cxDfrMkiRK','miguel@gmail.com',NULL,1);
/*!40000 ALTER TABLE `USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14  1:15:17

--
-- Table structure for table `USERS_ROLES`
--

DROP TABLE IF EXISTS `USERS_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS_ROLES` (
  `id_usuario_role` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_role`),
  KEY `id_user_fk_idx` (`id_usuario`),
  KEY `id_rol_fk_idx` (`id_rol`),
  CONSTRAINT `id_rol_fk` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `id_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS_ROLES`
--

LOCK TABLES `USERS_ROLES` WRITE;
/*!40000 ALTER TABLE `USERS_ROLES` DISABLE KEYS */;
INSERT INTO `USERS_ROLES` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `USERS_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIOS`
--

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearUsuario`(IN paUsuario varchar(100),IN paContrasenia varchar(200),IN paCorreo varchar(100),
IN paTelefono varchar(50),OUT paCodigoError INT,OUT paMensaje varchar(100),OUT paIdUsuario INT)
BEGIN
    DECLARE sqlEstado int;
    DECLARE codigoError int;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 
        sqlEstado = RETURNED_SQLSTATE,codigoError = MYSQL_ERRNO, paMensaje = MESSAGE_TEXT;
        IF sqlEstado IS NOT NULL THEN 
      SET paCodigoError = -1;
            SET paMensaje = CONCAT(sqlEstado,' - ',codigoError,' - ',paMensaje);
    end if;
      
    ROLLBACK;
  END;
  START TRANSACTION;
    INSERT INTO 
    `admin_360`.`USUARIOS` (`usuario`, `password`, `correo`, `telefono`, `active`,`recover`) 
    VALUES 
      (paUsuario, paContrasenia, paCorreo, paTelefono, 1, 0);
            
    SET paIdUsuario = last_insert_id(); 
    INSERT INTO `admin_360`.`USERS_ROLES` (`id_usuario`, `id_rol`) VALUES (paIdUsuario, '2');

    
  COMMIT WORK;

END
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPasswordTmp`(IN paIdUsuario INT ,IN paIdContraseniaTemporal varchar(200),
OUT paCodigoError INT,OUT paMensaje varchar(100))
BEGIN
    DECLARE sqlEstado int;
    DECLARE codigoError int;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 
        sqlEstado = RETURNED_SQLSTATE,codigoError = MYSQL_ERRNO, paMensaje = MESSAGE_TEXT;
        IF sqlEstado IS NOT NULL THEN 
      SET paCodigoError = -1;
            SET paMensaje = CONCAT(sqlEstado,' - ',codigoError,' - ',paMensaje);
    end if;
      
    ROLLBACK;
  END;
  START TRANSACTION;
    UPDATE `admin_360`.`USUARIOS` 
        SET  password = paIdContraseniaTemporal, recover = 1
        WHERE id_usuario  = paIdUsuario; 
  COMMIT WORK;

END
END
DELIMITER ;



DELIMITER ;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPassword`(IN paIdUsuario INT ,IN paIdContrasenia varchar(200),
OUT paCodigoError INT,OUT paMensaje varchar(100))
BEGIN
    DECLARE sqlEstado int;
    DECLARE codigoError int;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 
        sqlEstado = RETURNED_SQLSTATE,codigoError = MYSQL_ERRNO, paMensaje = MESSAGE_TEXT;
        IF sqlEstado IS NOT NULL THEN 
      SET paCodigoError = -1;
            SET paMensaje = CONCAT(sqlEstado,' - ',codigoError,' - ',paMensaje);
    end if;
      
    ROLLBACK;
  END;
  START TRANSACTION;
    UPDATE `admin_360`.`USUARIOS` 
        SET  password = paIdContrasenia, recover = 0
        WHERE id_usuario  = paIdUsuario; 
  COMMIT WORK;

END

DELIMITER ;
