-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema newsdatabase
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `newsdatabase` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `newsdatabase` DEFAULT CHARACTER SET utf8 ;
USE `newsdatabase` ;

-- -----------------------------------------------------
-- Table `CategoryTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CategoryTable` ;

CREATE TABLE IF NOT EXISTS `CategoryTable` (
  `CatID` INT NOT NULL AUTO_INCREMENT,
  `CategoryName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CatID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AuthorTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AuthorTable` ;

CREATE TABLE IF NOT EXISTS `AuthorTable` (
  `AuthorID` INT NOT NULL AUTO_INCREMENT,
  `AuthorName` VARCHAR(100) NOT NULL,
  `AuthorSurname` VARCHAR(100) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(16) NOT NULL,
  `EMail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AuthorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemberTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MemberTable` ;

CREATE TABLE IF NOT EXISTS `MemberTable` (
  `MemberID` INT NOT NULL AUTO_INCREMENT,
  `MemberName` VARCHAR(100) NOT NULL,
  `MemberSurname` VARCHAR(100) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(16) NOT NULL,
  `EMail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MemberID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NewsTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NewsTable` ;

CREATE TABLE IF NOT EXISTS `NewsTable` (
  `NewsID` INT NOT NULL AUTO_INCREMENT,
  `NewsTitle` VARCHAR(100) NOT NULL,
  `NewsDetail` LONGTEXT NOT NULL,
  `NewsPhoto` VARCHAR(200) NOT NULL,
  `Date` DATETIME NULL,
  `AuthorTable_AuthorID` INT NOT NULL,
  `CategoryTable_CatID` INT NOT NULL,
  PRIMARY KEY (`NewsID`),
  INDEX `fk_NewsTable_AuthorTable1_idx` (`AuthorTable_AuthorID` ASC) VISIBLE,
  INDEX `fk_NewsTable_CategoryTable1_idx` (`CategoryTable_CatID` ASC) VISIBLE,
  CONSTRAINT `fk_NewsTable_AuthorTable1`
    FOREIGN KEY (`AuthorTable_AuthorID`)
    REFERENCES `AuthorTable` (`AuthorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NewsTable_CategoryTable1`
    FOREIGN KEY (`CategoryTable_CatID`)
    REFERENCES `CategoryTable` (`CatID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CommentTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CommentTable` ;

CREATE TABLE IF NOT EXISTS `CommentTable` (
  `CommentID` INT NOT NULL AUTO_INCREMENT,
  `Comment` VARCHAR(200) NOT NULL,
  `Date` DATETIME NULL,
  `ApprovalStatus` BIT NULL,
  `NewsTable_NewsID` INT NOT NULL,
  `MemberTable_MemberID` INT NOT NULL,
  `AuthorTable_AuthorID` INT NOT NULL,
  PRIMARY KEY (`CommentID`),
  INDEX `fk_CommentTable_NewsTable1_idx` (`NewsTable_NewsID` ASC) VISIBLE,
  INDEX `fk_CommentTable_MemberTable1_idx` (`MemberTable_MemberID` ASC) VISIBLE,
  INDEX `fk_CommentTable_AuthorTable1_idx` (`AuthorTable_AuthorID` ASC) VISIBLE,
  CONSTRAINT `fk_CommentTable_NewsTable1`
    FOREIGN KEY (`NewsTable_NewsID`)
    REFERENCES `NewsTable` (`NewsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CommentTable_MemberTable1`
    FOREIGN KEY (`MemberTable_MemberID`)
    REFERENCES `MemberTable` (`MemberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CommentTable_AuthorTable1`
    FOREIGN KEY (`AuthorTable_AuthorID`)
    REFERENCES `AuthorTable` (`AuthorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
