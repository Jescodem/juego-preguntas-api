-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema juego_educativo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema juego_educativo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `juego_educativo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `juego_educativo` ;

-- -----------------------------------------------------
-- Table `juego_educativo`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`auth_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`django_content_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`auth_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC) VISIBLE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `juego_educativo`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`auth_group_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `juego_educativo`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `juego_educativo`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`auth_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME(6) NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(150) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`auth_user_groups` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC) VISIBLE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `juego_educativo`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `juego_educativo`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`auth_user_user_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `juego_educativo`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `juego_educativo`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`django_admin_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC) VISIBLE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `juego_educativo`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `juego_educativo`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`django_migrations` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`juego_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`juego_usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(254) NOT NULL,
  `contraseña` VARCHAR(255) NOT NULL,
  `rol` VARCHAR(10) NOT NULL,
  `fecha_creacion` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `correo` (`correo` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1004
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`juego_sesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`juego_sesion` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` LONGTEXT NULL DEFAULT NULL,
  `fecha_creacion` DATETIME(6) NOT NULL,
  `maestro_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `juego_sesion_maestro_id_db26718c_fk_juego_usuario_id` (`maestro_id` ASC) VISIBLE,
  CONSTRAINT `juego_sesion_maestro_id_db26718c_fk_juego_usuario_id`
    FOREIGN KEY (`maestro_id`)
    REFERENCES `juego_educativo`.`juego_usuario` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`juego_pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`juego_pregunta` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `texto` LONGTEXT NOT NULL,
  `respuesta_correcta` VARCHAR(255) NOT NULL,
  `sesion_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `juego_pregunta_sesion_id_4df1a873_fk_juego_sesion_id` (`sesion_id` ASC) VISIBLE,
  CONSTRAINT `juego_pregunta_sesion_id_4df1a873_fk_juego_sesion_id`
    FOREIGN KEY (`sesion_id`)
    REFERENCES `juego_educativo`.`juego_sesion` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`juego_progresojugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`juego_progresojugador` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `preguntas_correctas` INT NOT NULL,
  `preguntas_totales` INT NOT NULL,
  `sesion_id` BIGINT NOT NULL,
  `jugador_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `juego_progresojugador_sesion_id_a0f50b82_fk_juego_sesion_id` (`sesion_id` ASC) VISIBLE,
  INDEX `juego_progresojugador_jugador_id_d7899ab3_fk_juego_usuario_id` (`jugador_id` ASC) VISIBLE,
  CONSTRAINT `juego_progresojugador_jugador_id_d7899ab3_fk_juego_usuario_id`
    FOREIGN KEY (`jugador_id`)
    REFERENCES `juego_educativo`.`juego_usuario` (`id`),
  CONSTRAINT `juego_progresojugador_sesion_id_a0f50b82_fk_juego_sesion_id`
    FOREIGN KEY (`sesion_id`)
    REFERENCES `juego_educativo`.`juego_sesion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`juego_respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`juego_respuesta` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `respuesta` VARCHAR(255) NOT NULL,
  `es_correcta` TINYINT(1) NOT NULL,
  `fecha_respuesta` DATETIME(6) NOT NULL,
  `pregunta_id` BIGINT NOT NULL,
  `jugador_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `juego_respuesta_pregunta_id_ac3c7527_fk_juego_pregunta_id` (`pregunta_id` ASC) VISIBLE,
  INDEX `juego_respuesta_jugador_id_ffc7bf54_fk_juego_usuario_id` (`jugador_id` ASC) VISIBLE,
  CONSTRAINT `juego_respuesta_jugador_id_ffc7bf54_fk_juego_usuario_id`
    FOREIGN KEY (`jugador_id`)
    REFERENCES `juego_educativo`.`juego_usuario` (`id`),
  CONSTRAINT `juego_respuesta_pregunta_id_ac3c7527_fk_juego_pregunta_id`
    FOREIGN KEY (`pregunta_id`)
    REFERENCES `juego_educativo`.`juego_pregunta` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contraseña` VARCHAR(255) NOT NULL,
  `rol` ENUM('jugador', 'maestro') NOT NULL,
  `fecha_creacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `correo` (`correo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`sesiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`sesiones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `fecha_creacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `maestro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `maestro_id` (`maestro_id` ASC) VISIBLE,
  CONSTRAINT `sesiones_ibfk_1`
    FOREIGN KEY (`maestro_id`)
    REFERENCES `juego_educativo`.`usuarios` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`preguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`preguntas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sesion_id` INT NOT NULL,
  `texto` TEXT NOT NULL,
  `respuesta_correcta` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `sesion_id` (`sesion_id` ASC) VISIBLE,
  CONSTRAINT `preguntas_ibfk_1`
    FOREIGN KEY (`sesion_id`)
    REFERENCES `juego_educativo`.`sesiones` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`progreso_jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`progreso_jugador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `jugador_id` INT NOT NULL,
  `sesion_id` INT NOT NULL,
  `preguntas_correctas` INT NULL DEFAULT '0',
  `preguntas_totales` INT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `jugador_id` (`jugador_id` ASC) VISIBLE,
  INDEX `sesion_id` (`sesion_id` ASC) VISIBLE,
  CONSTRAINT `progreso_jugador_ibfk_1`
    FOREIGN KEY (`jugador_id`)
    REFERENCES `juego_educativo`.`usuarios` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `progreso_jugador_ibfk_2`
    FOREIGN KEY (`sesion_id`)
    REFERENCES `juego_educativo`.`sesiones` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `juego_educativo`.`respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `juego_educativo`.`respuestas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pregunta_id` INT NOT NULL,
  `jugador_id` INT NOT NULL,
  `respuesta` VARCHAR(255) NOT NULL,
  `es_correcta` TINYINT(1) NULL DEFAULT NULL,
  `fecha_respuesta` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `pregunta_id` (`pregunta_id` ASC) VISIBLE,
  INDEX `jugador_id` (`jugador_id` ASC) VISIBLE,
  CONSTRAINT `respuestas_ibfk_1`
    FOREIGN KEY (`pregunta_id`)
    REFERENCES `juego_educativo`.`preguntas` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `respuestas_ibfk_2`
    FOREIGN KEY (`jugador_id`)
    REFERENCES `juego_educativo`.`usuarios` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `juego_educativo` ;

-- -----------------------------------------------------
-- procedure SP_InsertarJugador
-- -----------------------------------------------------

DELIMITER $$
USE `juego_educativo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_InsertarJugador`(
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(255),
    IN p_contraseña VARCHAR(255)
)
BEGIN
    DECLARE ultimo_id INT;

    -- Obtener el ID más alto entre todos los jugadores
    SELECT IFNULL(MAX(id), 0) + 1 INTO ultimo_id FROM juego_usuario WHERE rol = 'jugador';

    -- Insertar el nuevo jugador con el ID calculado
    INSERT INTO juego_usuario (id, nombre, correo, contraseña, rol, fecha_creacion)
    VALUES (ultimo_id, p_nombre, p_correo, p_contraseña, 'jugador', NOW());

    -- Retornar el nuevo ID asignado
    SELECT ultimo_id AS id_nuevo_jugador;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_InsertarMaestro
-- -----------------------------------------------------

DELIMITER $$
USE `juego_educativo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_InsertarMaestro`(
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(255),
    IN p_contraseña VARCHAR(255)
)
BEGIN
    DECLARE nuevo_id INT;

    -- Obtener el siguiente ID disponible para maestros (mínimo 1000)
    SELECT COALESCE(MAX(id), 999) + 1 INTO nuevo_id 
    FROM juego_usuario 
    WHERE id >= 1000;  -- Solo considera IDs de maestros

    -- Insertar el nuevo maestro con el ID calculado
    INSERT INTO juego_usuario (id, nombre, correo, contraseña, rol, fecha_creacion)
    VALUES (nuevo_id, p_nombre, p_correo, p_contraseña, 'maestro', NOW());

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_MostrarJugador
-- -----------------------------------------------------

DELIMITER $$
USE `juego_educativo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MostrarJugador`()
BEGIN
    SELECT * FROM juego_usuario WHERE rol = 'jugador';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_MostrarMaestro
-- -----------------------------------------------------

DELIMITER $$
USE `juego_educativo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MostrarMaestro`()
BEGIN
    SELECT * FROM juego_usuario WHERE rol = 'maestro';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_MostrarSesiones
-- -----------------------------------------------------

DELIMITER $$
USE `juego_educativo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MostrarSesiones`()
BEGIN
    SELECT 
        js.*,
        u.nombre AS nombre, 
        u.rol AS rol
    FROM juego_sesion js
    JOIN juego_usuario u ON js.maestro_id = u.id
    WHERE u.rol = 'maestro';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_MostrarSesionesPorMaestro
-- -----------------------------------------------------

DELIMITER $$
USE `juego_educativo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MostrarSesionesPorMaestro`(IN p_maestro_id INT)
BEGIN
    SELECT 
        s.id AS sesion_id,
        s.nombre AS nombre_sesion,
        s.descripcion,
        s.fecha_creacion,
        u.nombre AS maestro
    FROM juego_sesion s
    JOIN juego_usuario u ON s.maestro_id = u.id
    WHERE s.maestro_id = p_maestro_id AND u.rol = 'maestro';
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
