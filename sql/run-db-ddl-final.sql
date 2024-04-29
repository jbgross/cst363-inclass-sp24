-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema rundb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS rundb ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS rundb DEFAULT CHARACTER SET utf8 ;
USE rundb ;

-- -----------------------------------------------------
-- Table team
-- -----------------------------------------------------
DROP TABLE IF EXISTS team ;

CREATE TABLE IF NOT EXISTS team (
  teamid INT NOT NULL AUTO_INCREMENT,
  teamname VARCHAR(32) NOT NULL,
  PRIMARY KEY (teamid))
;


-- -----------------------------------------------------
-- Table runner
-- -----------------------------------------------------
DROP TABLE IF EXISTS runner;

CREATE TABLE IF NOT EXISTS runner (
  runnerid INT NOT NULL AUTO_INCREMENT,
  runnername VARCHAR(45) NULL,
  height INT,
  dateOfBirth DATE,
  teamid INT NOT NULL,
  PRIMARY KEY (runnerid),
  CONSTRAINT fk_runner_team2
    FOREIGN KEY (teamid)
    REFERENCES team (teamid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table race
-- -----------------------------------------------------
DROP TABLE IF EXISTS race ;

CREATE TABLE IF NOT EXISTS race (
  raceid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  race_name VARCHAR(45) NOT NULL, 
  distance INT NOT NULL)
;

-- -----------------------------------------------------
-- Table shoe
-- -----------------------------------------------------
DROP TABLE IF EXISTS shoe ;

CREATE TABLE IF NOT EXISTS shoe (
  shoeid INT NOT NULL AUTO_INCREMENT,
  make VARCHAR(45) NOT NULL,
  model VARCHAR(45) NOT NULL,
  PRIMARY KEY (shoeid))
;

-- -----------------------------------------------------
-- Table race
-- -----------------------------------------------------
DROP TABLE IF EXISTS run;

CREATE TABLE IF NOT EXISTS run (
  runnerid INT NOT NULL,
  raceid INT NOT NULL,
  rundate DATE NOT NULL,
  run_number INT NOT NULL,
  run_time DECIMAL(10,2),
  shoeid INT NOT NULL,
  PRIMARY KEY (runnerid, raceid, rundate, run_number),

  CONSTRAINT fk_run_runner1
    FOREIGN KEY (runnerid)
    REFERENCES runner (runnerid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_run_race1
    FOREIGN KEY (raceid)
    REFERENCES race (raceid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_race_shoe1
    FOREIGN KEY (shoeid)
    REFERENCES shoe (shoeid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;




