/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - clinica
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clinica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `clinica`;

/*Table structure for table `administrador` */

DROP TABLE IF EXISTS `administrador`;

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `nom_administrador` varchar(20) NOT NULL,
  `ape_administrador` varchar(20) NOT NULL,
  `dni_administrador` varchar(8) NOT NULL,
  `usu_administrador` varchar(30) NOT NULL,
  `contra_administrador` varchar(30) NOT NULL,
  PRIMARY KEY (`id_administrador`),
  UNIQUE KEY `dni_administrador` (`dni_administrador`),
  UNIQUE KEY `usu_administrador` (`usu_administrador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `administrador` */

insert  into `administrador`(`id_administrador`,`nom_administrador`,`ape_administrador`,`dni_administrador`,`usu_administrador`,`contra_administrador`) values 
(1,'MELANY','LUCIO','72031048','MELANY','@MELANY'),
(2,'CAMILA','CABELLO','12052565','CAMILA','@CAMILA');

/*Table structure for table `administrador_doctor` */

DROP TABLE IF EXISTS `administrador_doctor`;

CREATE TABLE `administrador_doctor` (
  `administrador_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`administrador_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `administrador_doctor_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id_administrador`),
  CONSTRAINT `administrador_doctor_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id_doctor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `administrador_doctor` */

insert  into `administrador_doctor`(`administrador_id`,`doctor_id`) values 
(1,2);

/*Table structure for table `administrador_paciente` */

DROP TABLE IF EXISTS `administrador_paciente`;

CREATE TABLE `administrador_paciente` (
  `administrador_id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  PRIMARY KEY (`administrador_id`,`paciente_id`),
  KEY `paciente_id` (`paciente_id`),
  CONSTRAINT `administrador_paciente_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id_administrador`),
  CONSTRAINT `administrador_paciente_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `administrador_paciente` */

insert  into `administrador_paciente`(`administrador_id`,`paciente_id`) values 
(1,1);

/*Table structure for table `administrador_secretaria` */

DROP TABLE IF EXISTS `administrador_secretaria`;

CREATE TABLE `administrador_secretaria` (
  `administrador_id` int(11) NOT NULL,
  `secretaria_id` int(11) NOT NULL,
  PRIMARY KEY (`administrador_id`,`secretaria_id`),
  KEY `secretaria_id` (`secretaria_id`),
  CONSTRAINT `administrador_secretaria_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id_administrador`),
  CONSTRAINT `administrador_secretaria_ibfk_2` FOREIGN KEY (`secretaria_id`) REFERENCES `secretaria` (`id_secretaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `administrador_secretaria` */

insert  into `administrador_secretaria`(`administrador_id`,`secretaria_id`) values 
(1,1);

/*Table structure for table `citas` */

DROP TABLE IF EXISTS `citas`;

CREATE TABLE `citas` (
  `id_citas` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_citas` date NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_estados` int(11) DEFAULT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  PRIMARY KEY (`id_citas`),
  KEY `id_paciente` (`id_paciente`),
  KEY `citas_ibfk_2` (`id_doctor`),
  KEY `citas_ibfk_3` (`id_horario`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id_doctor`),
  CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `citas` */

insert  into `citas`(`id_citas`,`fecha_citas`,`id_paciente`,`id_estados`,`id_doctor`,`id_horario`) values 
(1,'2023-05-02',1,2,3,3),
(2,'2023-06-06',2,1,2,20),
(3,'2023-06-08',3,1,1,18),
(5,'2023-06-06',3,1,1,9),
(6,'3023-06-09',2,1,3,9),
(7,'2023-07-01',3,1,1,17),
(8,'2023-06-21',1,1,1,12);

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id_doctor` int(11) NOT NULL AUTO_INCREMENT,
  `nom_doctor` varchar(20) NOT NULL,
  `ape_doctor` varchar(20) NOT NULL,
  `dni_doctor` varchar(8) NOT NULL,
  `tel_doctor` varchar(10) NOT NULL,
  `usu_doctor` varchar(30) NOT NULL,
  `contra_doctor` varchar(30) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  PRIMARY KEY (`id_doctor`),
  UNIQUE KEY `dni_doctor` (`dni_doctor`),
  UNIQUE KEY `usu_doctor` (`usu_doctor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `doctor` */

insert  into `doctor`(`id_doctor`,`nom_doctor`,`ape_doctor`,`dni_doctor`,`tel_doctor`,`usu_doctor`,`contra_doctor`,`id_especialidad`) values 
(1,'CARLOS','ROSALES','15264856','952025585','CARLOS','123',7),
(2,'LAURA','DANIELA','12456591','948526301','LAURA','158',7),
(3,'KARA','DANVERS','12457865','915258254','COMETELA','23',8),
(5,'MARIA','RODRIGUEZ','3254610','958746588','MARIA','478956',9),
(6,'RAUL','LOPEZ','7458165','985426487','RAUL','1265468',2),
(7,'DOCTOR','JIMENEZ','12345678','123456789','DOC','1234',8);

/*Table structure for table `doctor_paciente` */

DROP TABLE IF EXISTS `doctor_paciente`;

CREATE TABLE `doctor_paciente` (
  `doctor_id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  PRIMARY KEY (`doctor_id`,`paciente_id`),
  KEY `paciente_id` (`paciente_id`),
  CONSTRAINT `doctor_paciente_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id_doctor`),
  CONSTRAINT `doctor_paciente_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `doctor_paciente` */

insert  into `doctor_paciente`(`doctor_id`,`paciente_id`) values 
(3,1);

/*Table structure for table `especialidad` */

DROP TABLE IF EXISTS `especialidad`;

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL AUTO_INCREMENT,
  `nom_especialidad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `especialidad` */

insert  into `especialidad`(`id_especialidad`,`nom_especialidad`) values 
(7,'ENDOCRINOLOGIA'),
(8,'PEDIATRIA'),
(9,'CARDIOLOGIA');

/*Table structure for table `estados` */

DROP TABLE IF EXISTS `estados`;

CREATE TABLE `estados` (
  `id_estados` int(11) NOT NULL AUTO_INCREMENT,
  `nom_estados` varchar(30) NOT NULL,
  PRIMARY KEY (`id_estados`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `estados` */

insert  into `estados`(`id_estados`,`nom_estados`) values 
(1,'ACTIVADO'),
(2,'DESACTIVADO');

/*Table structure for table `genero` */

DROP TABLE IF EXISTS `genero`;

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `nom_genero` varchar(30) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `genero` */

insert  into `genero`(`id_genero`,`nom_genero`) values 
(1,'FEMENINO'),
(2,'MASCULINO'),
(3,'OTRO');

/*Table structure for table `horario` */

DROP TABLE IF EXISTS `horario`;

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `hora` text DEFAULT NULL,
  PRIMARY KEY (`id_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `horario` */

insert  into `horario`(`id_horario`,`hora`) values 
(1,'08:00'),
(2,'08:30'),
(3,'09:00'),
(4,'09:30'),
(5,'10:00'),
(6,'10:30'),
(7,'11:00'),
(8,'11:30'),
(9,'12:00'),
(10,'12:30'),
(11,'13:00'),
(12,'13:30'),
(13,'14:00'),
(14,'14:30'),
(15,'15:00'),
(16,'15:30'),
(17,'16:00'),
(18,'16:30'),
(19,'17:00'),
(20,'17:30'),
(21,'18:00'),
(22,'18:30'),
(23,'19:00'),
(24,'19:30');

/*Table structure for table `paciente` */

DROP TABLE IF EXISTS `paciente`;

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `nom_paciente` varchar(20) NOT NULL,
  `ape_paciente` varchar(20) NOT NULL,
  `dni_paciente` varchar(8) NOT NULL,
  `tel_paciente` varchar(10) NOT NULL,
  `usu_paciente` varchar(30) NOT NULL,
  `contra_paciente` varchar(30) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `dni_paciente` (`dni_paciente`),
  UNIQUE KEY `usu_paciente` (`usu_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paciente` */

insert  into `paciente`(`id_paciente`,`nom_paciente`,`ape_paciente`,`dni_paciente`,`tel_paciente`,`usu_paciente`,`contra_paciente`) values 
(1,'MERLINA','ADAMS','15256258','951205153','MERLI','@MANO'),
(2,'PLS','PLS','12345678','123456789','PLS','1234'),
(3,'ANS','MITM','12345671','123456782','ANELIS','1234'),
(4,'JUAN','PEREZ','1568794','958746448','JUAN','1547'),
(5,'ANA','MARTINEZ','11345278','123426789','ANA','1234'),
(6,'SOFIA','HERRERA','09876543','098765421','SOFIA','1234');

/*Table structure for table `secretaria` */

DROP TABLE IF EXISTS `secretaria`;

CREATE TABLE `secretaria` (
  `id_secretaria` int(11) NOT NULL AUTO_INCREMENT,
  `nom_secretaria` varchar(20) NOT NULL,
  `ape_secretaria` varchar(20) NOT NULL,
  `dni_secretaria` varchar(8) NOT NULL,
  `tel_secretaria` varchar(10) NOT NULL,
  `usu_secretaria` varchar(30) NOT NULL,
  `contra_secretaria` varchar(30) NOT NULL,
  PRIMARY KEY (`id_secretaria`),
  UNIQUE KEY `dni_secretaria` (`dni_secretaria`),
  UNIQUE KEY `usu_secretaria` (`usu_secretaria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `secretaria` */

insert  into `secretaria`(`id_secretaria`,`nom_secretaria`,`ape_secretaria`,`dni_secretaria`,`tel_secretaria`,`usu_secretaria`,`contra_secretaria`) values 
(1,'CARLA','RODRIGUEZ','15235215','952585201','KARLA','GHIJ'),
(2,'ANELIS','MITMA','12345678','123456789','ANE','GHIJ'),
(3,'MELANY','LUCIO','12345672','123456783','MELANY','GHIJ'),
(4,'CAMILA','CABELLO','12345673','123456782','USU','GHIJ'),
(5,'RIKI','NISHIMURA','1234561','123456780','NK','GHIJ'),
(7,'RICKY','YIXIANG','12345618','123456178','RICKY','GHIJ'),
(8,'DANIEL','ROJAS','7587216','948725614','DANIEL','GKJNL'),
(9,'ANDREA','JIMENEZ','12341678','123406789','ANDREA','GHIJ'),
(10,'ALEJANDRO','RODRIGUEZ','98765333','987654321','ALE','GHIJ');

/*Table structure for table `secretaria_doctor` */

DROP TABLE IF EXISTS `secretaria_doctor`;

CREATE TABLE `secretaria_doctor` (
  `secretaria_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`secretaria_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `secretaria_doctor_ibfk_1` FOREIGN KEY (`secretaria_id`) REFERENCES `secretaria` (`id_secretaria`),
  CONSTRAINT `secretaria_doctor_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id_doctor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `secretaria_doctor` */

insert  into `secretaria_doctor`(`secretaria_id`,`doctor_id`) values 
(1,1),
(1,2);

/*Table structure for table `secretaria_paciente` */

DROP TABLE IF EXISTS `secretaria_paciente`;

CREATE TABLE `secretaria_paciente` (
  `secretaria_id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  PRIMARY KEY (`secretaria_id`,`paciente_id`),
  KEY `paciente_id` (`paciente_id`),
  CONSTRAINT `secretaria_paciente_ibfk_1` FOREIGN KEY (`secretaria_id`) REFERENCES `secretaria` (`id_secretaria`),
  CONSTRAINT `secretaria_paciente_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `secretaria_paciente` */

insert  into `secretaria_paciente`(`secretaria_id`,`paciente_id`) values 
(1,1);

/* Procedure structure for procedure `GetTableRowCount` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetTableRowCount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTableRowCount`(IN secretaria VARCHAR(255), IN clinica VARCHAR(255))
BEGIN
    SET @query = CONCAT('SELECT COUNT(*) AS row_count 
                        FROM ', clinica, '.', secretaria, ';');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertarEspecialidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertarEspecialidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEspecialidad`(
    IN NombreEspecialidad VARCHAR(50)
)
BEGIN
    INSERT INTO especialidad (nom_especialidad)
    VALUES (NombreEspecialidad);
END */$$
DELIMITER ;

/* Procedure structure for procedure `ObtenerDoctoresConEspecialidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `ObtenerDoctoresConEspecialidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDoctoresConEspecialidad`()
BEGIN
    SELECT d.id_doctor, d.nom_doctor, d.ape_doctor, e.nom_especialidad
    FROM doctor d
    INNER JOIN especialidad e ON d.id_especialidad = e.id_especialidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SearchUserByA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SearchUserByA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserByA`(IN searchUsername VARCHAR(255), IN searchPassword VARCHAR(255))
BEGIN
    SELECT * FROM administrador WHERE usu_administrador = searchUsername AND contra_administrador=searchPassword;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SearchUserByD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SearchUserByD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserByD`(IN searchUsername VARCHAR(255), IN searchPassword VARCHAR(255))
BEGIN
    SELECT * FROM doctor WHERE usu_doctor = searchUsername AND contra_doctor=searchPassword;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SearchUserByP` */

/*!50003 DROP PROCEDURE IF EXISTS  `SearchUserByP` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserByP`(IN searchUsername VARCHAR(255), IN searchPassword VARCHAR(255))
BEGIN
    SELECT * FROM paciente WHERE usu_paciente = searchUsername AND contra_paciente=searchPassword;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SearchUserByUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `SearchUserByUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserByUser`(IN searchUsername VARCHAR(255), IN searchPassword VARCHAR(255))
BEGIN
    SELECT * FROM secretaria WHERE usu_secretaria = searchUsername AND contra_secretaria=searchPassword;
END */$$
DELIMITER ;

/* Procedure structure for procedure `UspEliminarA` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspEliminarA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspEliminarA`(IN ids INT(11))
DELETE FROM administrador WHERE id_administrador = ids */$$
DELIMITER ;

/* Procedure structure for procedure `UspEliminarD` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspEliminarD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspEliminarD`(IN ids INT(11))
DELETE FROM doctor WHERE id_doctor = ids */$$
DELIMITER ;

/* Procedure structure for procedure `UspEliminarP` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspEliminarP` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspEliminarP`(IN ids INT(11))
DELETE FROM paciente WHERE id_paciente = ids */$$
DELIMITER ;

/* Procedure structure for procedure `UspEliminarS` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspEliminarS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspEliminarS`(IN ids INT(11))
DELETE FROM secretaria WHERE id_secretaria = ids */$$
DELIMITER ;

/* Procedure structure for procedure `UspInsertarA` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspInsertarA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspInsertarA`(IN ids INT (11),IN nombre VARCHAR(20), IN ape VARCHAR(20), IN dni VARCHAR(8), IN usuario VARCHAR(30), IN contra VARCHAR(30))
INSERT INTO administrador VALUES(ids,nombre,ape,dni,usuario,contra) */$$
DELIMITER ;

/* Procedure structure for procedure `UspInsertarC` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspInsertarC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspInsertarC`(in fechaCitas Text, idPaciente Int, idDoctor INT, idHorario int)
BEGIN
	insert into citas (fecha_citas, id_paciente, id_estados, id_doctor, id_horario) values(cast(fechaCitas as date), idPaciente, 1, idDoctor, idHorario);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `UspInsertarD` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspInsertarD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspInsertarD`(IN id INT, nombre VARCHAR(20), ape VARCHAR(20), dni VARCHAR(8), telefono varchar(9), usuario VARCHAR(30), contra VARCHAR(30), especia int(11))
INSERT INTO doctor (id_doctor, nom_doctor, ape_doctor, dni_doctor, tel_doctor, usu_doctor, contra_doctor, id_especialidad) VALUES(id,nombre,ape,dni,telefono,usuario,contra,especia) */$$
DELIMITER ;

/* Procedure structure for procedure `UspInsertarP` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspInsertarP` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspInsertarP`(IN ids INT (11),IN nombre VARCHAR(20), IN ape VARCHAR(20), IN dni VARCHAR(8), IN telefono VARCHAR(10), IN usuario VARCHAR(30), IN contra VARCHAR(30))
INSERT INTO paciente VALUES(ids,nombre,ape,dni,telefono,usuario,contra) */$$
DELIMITER ;

/* Procedure structure for procedure `UspInsertarS` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspInsertarS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspInsertarS`(IN id int, nombre VARCHAR(20), ape VARCHAR(20), dni VARCHAR(8), telefono VARCHAR(10), usuario VARCHAR(30), contra VARCHAR(30))
INSERT INTO secretaria (id_secretaria, nom_secretaria, ape_secretaria, dni_secretaria, tel_secretaria, usu_secretaria, contra_secretaria) VALUES(id,nombre,ape,dni,telefono,usuario,contra) */$$
DELIMITER ;

/* Procedure structure for procedure `UspListarAdmin` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspListarAdmin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspListarAdmin`()
SELECT id_administrador, nom_administrador, ape_administrador, dni_administrador, usu_administrador, contra_administrador
	FROM administrador */$$
DELIMITER ;

/* Procedure structure for procedure `UspListarCitas` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspListarCitas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspListarCitas`(in idDoctor int(11))
BEGIN
select c.id_citas, 
	(select concat(p.nom_paciente, " ", p.ape_paciente) from paciente p where p.id_paciente = c.id_paciente) as nomApePacC,
	c.fecha_citas,
	(select h.hora from horario h where c.id_horario = h.id_horario) as hora
From citas c
where c.id_doctor = idDoctor;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarDoctorCb` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarDoctorCb` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarDoctorCb`()
SELECT Id_Doctor,CONCAT(nom_doctor,' ',ape_doctor,' ') AS
apellidosNombres, concat(id_especialidad) as especialidad
FROM doctor */$$
DELIMITER ;

/* Procedure structure for procedure `UspListarDoctores` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspListarDoctores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspListarDoctores`()
SELECT id_doctor, nom_doctor, ape_doctor, dni_doctor, tel_doctor, usu_doctor, contra_doctor, id_especialidad
	FROM doctor */$$
DELIMITER ;

/* Procedure structure for procedure `UspListarEspecialidades` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspListarEspecialidades` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspListarEspecialidades`()
SELECT id_especialidad, nom_especialidad
	FROM especialidad */$$
DELIMITER ;

/* Procedure structure for procedure `UspListarHorariosDisponibles` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspListarHorariosDisponibles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspListarHorariosDisponibles`(in fecha text, idDoctor int(11))
BEGIN
	SELECT * FROM horario h WHERE h.id_horario NOT IN (SELECT c.id_horario FROM citas c WHERE c.id_doctor = idDoctor AND c.fecha_citas = cast(fecha as date) and h.id_horario = c.id_horario);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `UspListarPacientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspListarPacientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspListarPacientes`()
SELECT id_paciente, nom_paciente, ape_paciente, dni_paciente, tel_paciente, usu_paciente, contra_paciente
	FROM paciente */$$
DELIMITER ;

/* Procedure structure for procedure `UspListarSecretarias` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspListarSecretarias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspListarSecretarias`()
SELECT id_secretaria, nom_secretaria, ape_secretaria, dni_secretaria, tel_secretaria, usu_secretaria, contra_secretaria
	FROM secretaria */$$
DELIMITER ;

/* Procedure structure for procedure `UspSearchA` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspSearchA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspSearchA`(IN nombre VARCHAR(255))
BEGIN
    SELECT * FROM administrador WHERE nom_administrador = nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `UspSearchD` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspSearchD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspSearchD`(IN nombre VARCHAR(255))
BEGIN
    SELECT * FROM doctor WHERE nom_doctor = nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `UspSearchP` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspSearchP` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspSearchP`(IN nombre VARCHAR(255))
BEGIN
    SELECT * FROM paciente WHERE nom_paciente = nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `UspSearchS` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspSearchS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspSearchS`(IN nombre VARCHAR(255))
BEGIN
    SELECT * FROM secretaria WHERE nom_secretaria = nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `UspUpdateA` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspUpdateA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspUpdateA`(IN ids INT(11), IN nombre VARCHAR(20), IN ape VARCHAR(20), IN dni VARCHAR(8), IN usuario VARCHAR(30), IN contra VARCHAR(30))
UPDATE administrador SET nom_administrador=nombre,ape_administrador=ape,dni_administrador=dni,usu_administrador=usuario,contra_administrador=contra WHERE id_administrador = ids */$$
DELIMITER ;

/* Procedure structure for procedure `UspUpdateD` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspUpdateD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspUpdateD`(IN ids INT(11), IN nombre VARCHAR(20), IN ape VARCHAR(20), IN dni VARCHAR(8), in telefono varchar(9), IN usuario VARCHAR(30), IN contra VARCHAR(30), in especia int(11))
UPDATE doctor SET nom_doctor=nombre,ape_doctor=ape,dni_doctor=dni, tel_doctor=telefono,usu_doctor=usuario,contra_doctor=contra, id_especialidad=especialidad WHERE id_doctor = ids */$$
DELIMITER ;

/* Procedure structure for procedure `UspUpdateP` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspUpdateP` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspUpdateP`(IN ids INT(11), IN nombre VARCHAR(20), IN ape VARCHAR(20), IN dni VARCHAR(8), IN telefono VARCHAR(10), IN usuario VARCHAR(30), IN contra VARCHAR(30))
UPDATE paciente SET nom_paciente=nombre,ape_paciente=ape,dni_paciente=dni,tel_paciente=telefono,usu_paciente=usuario,contra_paciente=contra WHERE id_paciente = ids */$$
DELIMITER ;

/* Procedure structure for procedure `UspUpdateS` */

/*!50003 DROP PROCEDURE IF EXISTS  `UspUpdateS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UspUpdateS`(IN ids INT(11), IN nombre VARCHAR(20), IN ape VARCHAR(20), IN dni VARCHAR(8), IN telefono VARCHAR(10), IN usuario VARCHAR(30), IN contra VARCHAR(30))
UPDATE secretaria SET nom_secretaria=nombre,ape_secretaria=ape,dni_secretaria=dni,tel_secretaria=telefono,usu_secretaria=usuario,contra_secretaria=contra WHERE id_secretaria = ids */$$
DELIMITER ;

/* Procedure structure for procedure `VaciarTablaEspecialidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `VaciarTablaEspecialidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `VaciarTablaEspecialidad`()
BEGIN
    DELETE FROM especialidad;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
