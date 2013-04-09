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


