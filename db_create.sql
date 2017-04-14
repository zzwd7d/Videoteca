-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema peliculas_prod
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema peliculas_prod
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peliculas_prod` DEFAULT CHARACTER SET utf8 ;
USE `peliculas_prod` ;

-- -----------------------------------------------------
-- Table `peliculas_prod`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`peliculas` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `titulo_original` VARCHAR(100) NULL DEFAULT NULL,
  `anio` VARCHAR(15) NOT NULL,
  `imdb_code` VARCHAR(15) NULL DEFAULT NULL,
  `formato` VARCHAR(15) NULL DEFAULT NULL,
  `media` VARCHAR(15) NULL DEFAULT NULL,
  `comment` VARCHAR(1000) NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IND_TITULO_ANIO` (`titulo_original` ASC, `anio` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 242
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_prod`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`colors` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `pelicula_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `pelicula_id`),
  UNIQUE INDEX `unique_colors_key` (`id` ASC),
  INDEX `index_colors_pelicula` (`pelicula_id` ASC),
  CONSTRAINT `colors_pelicula_fk`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `peliculas_prod`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 248
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_prod`.`directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`directors` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `pelicula_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `pelicula_id`),
  UNIQUE INDEX `unique_directors_key` (`id` ASC),
  INDEX `index_directors_pelicula` (`pelicula_id` ASC),
  CONSTRAINT `directors_pelicula_fk`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `peliculas_prod`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 232
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_prod`.`elencos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`elencos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `personaje` VARCHAR(50) NULL DEFAULT NULL,
  `orden` INT(11) NULL DEFAULT NULL,
  `pelicula_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `pelicula_id`),
  UNIQUE INDEX `unique_elencos_key` (`id` ASC),
  INDEX `index_elencos_pelicula` (`pelicula_id` ASC),
  CONSTRAINT `elencos_pelicula_fk`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `peliculas_prod`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3216
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_prod`.`generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`generos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `pelicula_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `pelicula_id`),
  UNIQUE INDEX `unique_generos_key` (`id` ASC),
  INDEX `index_generos_pelicula` (`pelicula_id` ASC),
  CONSTRAINT `generos_pelicula_fk`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `peliculas_prod`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 648
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_prod`.`idiomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`idiomas` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `pelicula_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `pelicula_id`),
  UNIQUE INDEX `unique_idiomas_key` (`id` ASC),
  INDEX `index_idiomas_pelicula` (`pelicula_id` ASC),
  CONSTRAINT `idiomas_pelicula_fk`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `peliculas_prod`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 447
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_prod`.`nacions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`nacions` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `pelicula_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `pelicula_id`),
  UNIQUE INDEX `unique_nacions_key` (`id` ASC),
  INDEX `index_nacions_pelicula` (`pelicula_id` ASC),
  CONSTRAINT `nacions_pelicula_fk`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `peliculas_prod`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 367
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_prod`.`sonidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`sonidos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `pelicula_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `pelicula_id`),
  UNIQUE INDEX `unique_sonidos_key` (`id` ASC),
  INDEX `index_sonidos_pelicula` (`pelicula_id` ASC),
  CONSTRAINT `sonidos_pelicula_fk`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `peliculas_prod`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 364
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_prod`.`writers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_prod`.`writers` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `pelicula_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `pelicula_id`),
  UNIQUE INDEX `unique_writers_key` (`id` ASC),
  INDEX `index_writers_pelicula` (`pelicula_id` ASC),
  CONSTRAINT `writers_pelicula_fk`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `peliculas_prod`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 371
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
