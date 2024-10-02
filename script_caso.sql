-- MySQL Workbench Synchronization
-- Generated: 2024-10-02 11:44
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Ambiente

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `caso` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `caso`.`usuario` (
  `idusuario` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(105) NOT NULL,
  `contraseña` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `caso`.`donaciones` (
  `iddonaciones` INT(11) NOT NULL,
  `tipo_donacion` VARCHAR(45) NOT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  `formu_dona_obj_id_donante` INT(11) NOT NULL,
  PRIMARY KEY (`iddonaciones`, `usuario_idusuario`, `formu_dona_obj_id_donante`),
  INDEX `fk_donaciones_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  INDEX `fk_donaciones_formu_dona_obj1_idx` (`formu_dona_obj_id_donante` ASC) VISIBLE,
  CONSTRAINT `fk_donaciones_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `caso`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donaciones_formu_dona_obj1`
    FOREIGN KEY (`formu_dona_obj_id_donante`)
    REFERENCES `caso`.`formu_dona_obj` (`id_donante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `caso`.`comentarios` (
  `id_comentarios` INT(11) NOT NULL,
  `comentario` VARCHAR(500) NOT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_comentarios`, `usuario_idusuario`),
  INDEX `fk_comentarios_usuario_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_usuario`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `caso`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `caso`.`formu_dona_obj` (
  `id_donante` INT(11) NOT NULL,
  `nom_donante` VARCHAR(45) NOT NULL,
  `apellido_donante` VARCHAR(45) NOT NULL,
  `donacion` VARCHAR(400) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `celular` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_donante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
