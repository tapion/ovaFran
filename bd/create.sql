SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `cuestionario` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `cuestionario` ;

-- -----------------------------------------------------
-- Table `cuestionario`.`ci_sessions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`ci_sessions` (
  `session_id` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT '0' ,
  `ip_address` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT '0' ,
  `user_agent` VARCHAR(120) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `last_activity` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_data` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`session_id`) ,
  INDEX `last_activity_idx` (`last_activity` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`preguntas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`preguntas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Idetificador de la tabla' ,
  `pregunta` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'Texto para la pregunta planteada' ,
  `valor` INT(11) NULL DEFAULT NULL COMMENT 'Valor asignado a la pregunta' ,
  `respuestacorrecta` INT(11) NULL DEFAULT NULL COMMENT 'Id de respuesta correcta para la pregunta' ,
  `fechacreacion` DATETIME NULL DEFAULT NULL COMMENT 'Fecha de creacion' ,
  `fechaactualizacion` DATETIME NULL DEFAULT NULL COMMENT 'Fecha de actualizacion' ,
  `usuario_id` INT(11) NULL DEFAULT NULL COMMENT 'Usuario que modifico o actualizo la pregunta' ,
  `idtest` INT(11) NULL DEFAULT NULL COMMENT 'Identificador de test al que pertenece' ,
  `subcategoria` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'Identificador para la subcategoria asignada' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 75
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`imagenes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`imagenes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla imagenes' ,
  `ruta` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Rutas para las imagenes a asignar en las preguntas del test' ,
  `pregunta_id` INT(11) NOT NULL COMMENT 'Identificador de pregunta a la que pertenece' ,
  `orden` INT(1) NULL DEFAULT '0' COMMENT 'Orden en que se mostraran las imagenes' ,
  `nombre` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT 'NO ASIGNADO' COMMENT 'Nombre de la imagen a buscar en el texto cuando se va a reemplazar' ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_imagenes` (`pregunta_id` ASC) ,
  CONSTRAINT `FK_imagenes`
    FOREIGN KEY (`pregunta_id` )
    REFERENCES `cuestionario`.`preguntas` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci
COMMENT = 'Almacena la ruta de las imagenes que pertenecen a las pregun';


-- -----------------------------------------------------
-- Table `cuestionario`.`test`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`test` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla' ,
  `nombre` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'Nombre de test o descripcion' ,
  `valor` INT(11) NULL DEFAULT NULL COMMENT 'Valor con el cual puede aprobar el test' ,
  `fechacreacion` DATETIME NULL DEFAULT NULL COMMENT 'Fecha creacion' ,
  `fechaactualizacion` DATETIME NULL DEFAULT NULL COMMENT 'Fecha actualizacion' ,
  `usuario_id` INT(11) NULL DEFAULT NULL COMMENT 'Identificador del usuario' ,
  `tipo` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'Tipo de test Alto Medio Bajo' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`orden`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`orden` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla' ,
  `test_id` INT(11) NULL DEFAULT NULL COMMENT 'Identificador para test' ,
  `orden_test` INT(11) NULL DEFAULT NULL COMMENT 'Orden para la presentacion el test' ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_orden` (`test_id` ASC) ,
  CONSTRAINT `FK_orden`
    FOREIGN KEY (`test_id` )
    REFERENCES `cuestionario`.`test` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci
COMMENT = 'Almacena el orden de las tareas para principal';


-- -----------------------------------------------------
-- Table `cuestionario`.`principal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`principal` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla principal' ,
  `nombre` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT 'No Asigando' ,
  `fechacreacion` DATETIME NULL DEFAULT NULL ,
  `fechaactualizacion` DATETIME NULL DEFAULT NULL ,
  `usuario_id` INT(11) NULL DEFAULT NULL ,
  `orden_id` INT(11) NULL DEFAULT NULL COMMENT 'Orden para el test, comic, y video' ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_principal` (`orden_id` ASC) ,
  CONSTRAINT `FK_principal`
    FOREIGN KEY (`orden_id` )
    REFERENCES `cuestionario`.`orden` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`respuestas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`respuestas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de respuesta' ,
  `pregunta_id` INT(11) NOT NULL COMMENT 'Identificador de la pregunta a la que pertenece' ,
  `texto` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'Texto de la respuesta' ,
  `fechacreacion` DATETIME NULL DEFAULT NULL COMMENT 'Fecha de creacion' ,
  `fechaactualizacion` DATETIME NULL DEFAULT NULL COMMENT 'Fecha de actualizacion' ,
  `usuario_id` INT(11) NULL DEFAULT NULL COMMENT 'Identificador de usuario' ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_respuestas` (`pregunta_id` ASC) ,
  CONSTRAINT `FK_respuestas`
    FOREIGN KEY (`pregunta_id` )
    REFERENCES `cuestionario`.`preguntas` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 278
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `cuestionario`.`resultados_examen_final`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`resultados_examen_final` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador propio de la tabla' ,
  `username` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT 'NO ASIGNADO' COMMENT 'Nombre del usuario de moodle' ,
  `subcategoria` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT 'NO ASIGNADO' COMMENT 'Subcategoria a la que pertenece' ,
  `resultado` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT 'NO ASIGNADO' COMMENT 'Resultado Obtenido' ,
  `fechaactualizacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha Actualizacion Registro' ,
  `fechacreacion` DATETIME NULL DEFAULT NULL COMMENT 'Fecha en la que se realizo el examen final' ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 288836
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`resultados_test`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`resultados_test` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla' ,
  `username` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Identificador de usuario para moodle' ,
  `idtest` INT(11) NOT NULL COMMENT 'Identificador de test realizado' ,
  `intentosfallidos` INT(11) NULL DEFAULT '0' COMMENT 'Numero de intentos fallidos antes de aprobar el test' ,
  `ultimo_orden_valido` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`sistemas_digestivos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`sistemas_digestivos` (
  `nombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `codigo` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`codigo`) ,
  INDEX `codsistema` (`codigo` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`rutaaprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`rutaaprendizaje` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT 'NO ASIGNADO' ,
  `data` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT '{}' ,
  `usuario_id` INT(11) NULL DEFAULT NULL ,
  `fecha_creacion` DATE NULL DEFAULT NULL ,
  `sistema_digestivo_codigo` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `sistemaruta` (`sistema_digestivo_codigo` ASC) ,
  CONSTRAINT `fk_rutaaprendizaje_unico`
    FOREIGN KEY (`sistema_digestivo_codigo` )
    REFERENCES `cuestionario`.`sistemas_digestivos` (`codigo` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`sf_config`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`sf_config` (
  `sf_id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `sf_table` VARCHAR(64) NOT NULL DEFAULT '' ,
  `sf_field` VARCHAR(64) NOT NULL DEFAULT '' ,
  `sf_type` VARCHAR(16) NULL DEFAULT 'default' ,
  `sf_related` VARCHAR(100) NULL DEFAULT '' ,
  `sf_label` VARCHAR(64) NULL DEFAULT '' ,
  `sf_desc` TINYTEXT NULL DEFAULT NULL ,
  `sf_order` INT(3) NULL DEFAULT NULL ,
  `sf_hidden` INT(1) NULL DEFAULT '0' ,
  PRIMARY KEY (`sf_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cuestionario`.`subcategorias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`subcategorias` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de subcategoria' ,
  `sistema_digestivo` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT 'No Asignado' COMMENT 'Sistema digestivo al que pertenece la subcategoria' ,
  `subcategoria` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT 'No Asignado' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `cuestionario`.`test_preguntas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cuestionario`.`test_preguntas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla' ,
  `test_id` INT(11) NULL DEFAULT NULL COMMENT 'Identificador de test al que pertenece' ,
  `pregunta_id` INT(11) NULL DEFAULT NULL COMMENT 'Identificador de pregunta a la que pertenece' ,
  `fechacreacion` DATETIME NULL DEFAULT NULL COMMENT 'fecha de creacion' ,
  `fechaactualizacion` DATETIME NULL DEFAULT NULL COMMENT 'fecha de actualizacion' ,
  `usuario_id` INT(11) NULL DEFAULT NULL COMMENT 'identificador de usuario' ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_test_preguntas` (`test_id` ASC) ,
  INDEX `FK_test_preguntas_many` (`pregunta_id` ASC) ,
  CONSTRAINT `FK_test_preguntas`
    FOREIGN KEY (`test_id` )
    REFERENCES `cuestionario`.`test` (`id` )
    ON UPDATE CASCADE,
  CONSTRAINT `FK_test_preguntas_many`
    FOREIGN KEY (`pregunta_id` )
    REFERENCES `cuestionario`.`preguntas` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

USE `cuestionario` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
