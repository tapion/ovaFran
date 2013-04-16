-- 08/04/2013
CREATE  TABLE `cuestionario`.`sistemas_digestivos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) );
ALTER TABLE `cuestionario`.`sistemas_digestivos` ADD COLUMN `codigo` VARCHAR(45) NOT NULL  AFTER `nombre` ;
INSERT INTO `cuestionario`.`sistemas_digestivos` (`nombre`) VALUES ('Sistema digestivo Alto');
INSERT INTO `cuestionario`.`sistemas_digestivos` (`nombre`) VALUES ('Sistema digestivo Medio');
INSERT INTO `cuestionario`.`sistemas_digestivos` (`nombre`) VALUES ('Sistema digestivo Bajo')
UPDATE `cuestionario`.`sistemas_digestivos` SET `codigo`='alto' WHERE `id`='1';
UPDATE `cuestionario`.`sistemas_digestivos` SET `codigo`='medio' WHERE `id`='2';
UPDATE `cuestionario`.`sistemas_digestivos` SET `codigo`='bajo' WHERE `id`='3';
ALTER TABLE `cuestionario`.`rutaaprendizaje` ADD COLUMN `sistema_digestivo_id` INT NOT NULL  AFTER `fecha_creacion` ;
UPDATE `cuestionario`.`rutaaprendizaje` SET `sistema_digestivo_id`='1' WHERE `id`='22';
UPDATE `cuestionario`.`rutaaprendizaje` SET `sistema_digestivo_id`='2' WHERE `id`='23';
UPDATE `cuestionario`.`rutaaprendizaje` SET `sistema_digestivo_id`='2' WHERE `id`='24';
ALTER TABLE `cuestionario`.`rutaaprendizaje` 
  ADD CONSTRAINT `fk_rutaaprendizaje_sistema`
  FOREIGN KEY (`sistema_digestivo_id` )
  REFERENCES `cuestionario`.`sistemas_digestivos` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `sistemas_ruta` (`sistema_digestivo_id` ASC) ;
DELETE FROM `cuestionario`.`rutaaprendizaje` WHERE `id`='24';
ALTER TABLE `cuestionario`.`rutaaprendizaje` 
ADD UNIQUE INDEX `ruta_unica` (`sistema_digestivo_id` ASC) ;

ALTER TABLE `cuestionario`.`rutaaprendizaje` DROP FOREIGN KEY `fk_rutaaprendizaje_sistema` ;
ALTER TABLE `cuestionario`.`rutaaprendizaje` DROP COLUMN `sistema_digestivo_id` 
, DROP INDEX `ruta_unica` ;
ALTER TABLE `cuestionario`.`sistemas_digestivos` 
ADD INDEX `codsistema` (`codigo` ASC) ;
ALTER TABLE `cuestionario`.`sistemas_digestivos` DROP COLUMN `id` 
, DROP PRIMARY KEY 
, ADD PRIMARY KEY (`codigo`) ;
ALTER TABLE `cuestionario`.`rutaaprendizaje` ADD COLUMN `sistema_digestivo_codigo` VARCHAR(45) NULL  AFTER `fecha_creacion` 
, ADD INDEX `sistemaruta` (`sistema_digestivo_codigo` ASC) ;
ALTER TABLE `cuestionario`.`rutaaprendizaje` CHANGE COLUMN `sistema_digestivo_codigo` `sistema_digestivo_codigo` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL  ;


ALTER TABLE `cuestionario`.`rutaaprendizaje` CHANGE COLUMN `sistema_digestivo_codigo` `sistema_digestivo_codigo` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL  ;
UPDATE `cuestionario`.`rutaaprendizaje` SET `sistema_digestivo_codigo`='alto' WHERE `id`='22';
ALTER TABLE `cuestionario`.`rutaaprendizaje` 
DROP INDEX `sistemaruta` 
, ADD UNIQUE INDEX `sistemaruta` (`sistema_digestivo_codigo` ASC) ;

UPDATE `cuestionario`.`rutaaprendizaje` SET `sistema_digestivo_codigo`='medio' WHERE `id`='23';
ALTER TABLE `cuestionario`.`rutaaprendizaje` 
  ADD CONSTRAINT `fk_rutaaprendizaje_unico`
  FOREIGN KEY (`sistema_digestivo_codigo` )
  REFERENCES `cuestionario`.`sistemas_digestivos` (`codigo` )
  ON DELETE CASCADE
  ON UPDATE CASCADE;
ALTER TABLE `cuestionario`.`rutaaprendizaje` DROP FOREIGN KEY `fk_rutaaprendizaje_unico` ;
ALTER TABLE `cuestionario`.`rutaaprendizaje` CHANGE COLUMN `sistema_digestivo_codigo` `sistema_digestivo_codigo` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL  , 
  ADD CONSTRAINT `fk_rutaaprendizaje_unico`
  FOREIGN KEY (`sistema_digestivo_codigo` )
  REFERENCES `cuestionario`.`sistemas_digestivos` (`codigo` )
  ON DELETE CASCADE
  ON UPDATE CASCADE;

