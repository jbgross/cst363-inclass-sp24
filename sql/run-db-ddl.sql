-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `team` ;

CREATE TABLE IF NOT EXISTS `team` (
  `teamname` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`teamname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `runner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `runner` ;

CREATE TABLE IF NOT EXISTS `runner` (
  `runnerid` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `team_teamname` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`runnerid`, `team_teamname`),
  INDEX `fk_runner_team2_idx` (`team_teamname` ASC) VISIBLE,
  CONSTRAINT `fk_runner_team2`
    FOREIGN KEY (`team_teamname`)
    REFERENCES `team` (`teamname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `race`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `race` ;

CREATE TABLE IF NOT EXISTS `race` (
  `raceid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `distance` INT NOT NULL,
  `time` VARCHAR(45) NOT NULL,
  `runner_runnerid` INT NOT NULL,
  `shoe_shoename` INT NOT NULL,
  PRIMARY KEY (`raceid`, `runner_runnerid`, `shoe_shoename`),
  INDEX `fk_race_runner1_idx` (`runner_runnerid` ASC) VISIBLE,
  INDEX `fk_race_shoe1_idx` (`shoe_shoename` ASC) VISIBLE,
  CONSTRAINT `fk_race_runner1`
    FOREIGN KEY (`runner_runnerid`)
    REFERENCES `runner` (`runnerid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_race_shoe1`
    FOREIGN KEY (`shoe_shoename`)
    REFERENCES `shoe` (`shoename`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoe` ;

CREATE TABLE IF NOT EXISTS `shoe` (
  `shoename` INT NOT NULL,
  PRIMARY KEY (`shoename`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `run` ;

CREATE TABLE IF NOT EXISTS `run` (
  `runnerid` INT NOT NULL,
  `raceid` INT NOT NULL,
  `date` DATE NOT NULL,
  `run_number` INT GENERATED ALWAYS AS () VIRTUAL,
  `run_time` DECIMAL(10,2) NULL,
  `shoeid` INT NOT NULL,
  PRIMARY KEY (`runnerid`, `raceid`, `date`, `run_number`),
  INDEX `fk_runner_has_race_race1_idx` (`raceid` ASC) VISIBLE,
  INDEX `fk_runner_has_race_runner_idx` (`runnerid` ASC) VISIBLE,
  INDEX `fk_run_shoe1_idx` (`shoeid` ASC) VISIBLE,
  CONSTRAINT `fk_runner_has_race_runner`
    FOREIGN KEY (`runnerid`)
    REFERENCES `runner` (`runnerid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_runner_has_race_race1`
    FOREIGN KEY (`raceid`)
    REFERENCES `race` (`raceid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_shoe1`
    FOREIGN KEY (`shoeid`)
    REFERENCES `shoe` (`shoeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `team` ;

CREATE TABLE IF NOT EXISTS `team` (
  `teamname` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`teamname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `runner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `runner` ;

CREATE TABLE IF NOT EXISTS `runner` (
  `runnerid` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `team_teamname` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`runnerid`, `team_teamname`),
  INDEX `fk_runner_team2_idx` (`team_teamname` ASC) VISIBLE,
  CONSTRAINT `fk_runner_team2`
    FOREIGN KEY (`team_teamname`)
    REFERENCES `team` (`teamname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoe` ;

CREATE TABLE IF NOT EXISTS `shoe` (
  `shoename` INT NOT NULL,
  PRIMARY KEY (`shoename`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `race`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `race` ;

CREATE TABLE IF NOT EXISTS `race` (
  `raceid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `distance` INT NOT NULL,
  `time` VARCHAR(45) NOT NULL,
  `runner_runnerid` INT NOT NULL,
  `shoe_shoename` INT NOT NULL,
  PRIMARY KEY (`raceid`, `runner_runnerid`, `shoe_shoename`),
  INDEX `fk_race_runner1_idx` (`runner_runnerid` ASC) VISIBLE,
  INDEX `fk_race_shoe1_idx` (`shoe_shoename` ASC) VISIBLE,
  CONSTRAINT `fk_race_runner1`
    FOREIGN KEY (`runner_runnerid`)
    REFERENCES `runner` (`runnerid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_race_shoe1`
    FOREIGN KEY (`shoe_shoename`)
    REFERENCES `shoe` (`shoename`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
