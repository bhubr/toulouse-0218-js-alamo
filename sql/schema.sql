-- MySQL Script generated by MySQL Workbench
-- mar. 19 juin 2018 10:04:33 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema alamo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema alamo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `alamo` DEFAULT CHARACTER SET utf8 ;
USE `alamo` ;

-- -----------------------------------------------------
-- Table `alamo`.`sport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alamo`.`sport` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alamo`.`booker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alamo`.`booker` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `familyName` VARCHAR(50) NULL DEFAULT NULL,
  `firstName` VARCHAR(50) NULL DEFAULT NULL,
  `pseudo` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `address` VARCHAR(250) NULL DEFAULT NULL,
  `phone` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `favSport` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`favSport` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`favSport`)
    REFERENCES `alamo`.`sport` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alamo`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alamo`.`manager` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clubName` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `address` VARCHAR(250) NULL DEFAULT NULL,
  `postalCode` INT UNSIGNED NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `lat` FLOAT NULL DEFAULT NULL,
  `lng` FLOAT NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alamo`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alamo`.`admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alamo`.`calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alamo`.`calendar` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `managerId` INT UNSIGNED NULL,
  `sportId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`sportId` ASC),
  INDEX `id_idx1` (`managerId` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`sportId`)
    REFERENCES `alamo`.`sport` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id`
    FOREIGN KEY (`managerId`)
    REFERENCES `alamo`.`manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alamo`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alamo`.`reservation` (
  `id` INT UNSIGNED NOT NULL,
  `calendarId` INT UNSIGNED NULL DEFAULT NULL,
  `bookerId` INT UNSIGNED NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`calendarId` ASC),
  INDEX `id_idx1` (`bookerId` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`calendarId`)
    REFERENCES `alamo`.`calendar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id`
    FOREIGN KEY (`bookerId`)
    REFERENCES `alamo`.`booker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alamo`.`timeSlot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alamo`.`timeSlot` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `calendarId` INT NULL,
  `startHour` TIME NULL,
  `endHour` TIME NULL,
  `dayOfWeek` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`calendarId` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`calendarId`)
    REFERENCES `alamo`.`calendar` (`sportId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
