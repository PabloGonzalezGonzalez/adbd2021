-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAIS` (
  `NombrePais` VARCHAR(30) NOT NULL,
  `PosicionRankingPaises` INT NOT NULL,
  `NClubs` INT NOT NULL,
  `NJugadores` INT NOT NULL,
  `NCompeticiones` INT NOT NULL,
  PRIMARY KEY (`NombrePais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COMPETICION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COMPETICION` (
  `NombreCompeticion` VARCHAR(30) NOT NULL,
  `NombrePais` VARCHAR(30) NOT NULL,
  `PremioMetalico` INT NOT NULL,
  `NClubs` INT NOT NULL,
  `PuntosFIFPro` INT NOT NULL,
  `Profesional` TINYINT NOT NULL,
  `NPartidos` INT NOT NULL,
  PRIMARY KEY (`NombreCompeticion`),
  INDEX `Pais_idx` (`NombrePais` ASC) VISIBLE,
  CONSTRAINT `Pais`
    FOREIGN KEY (`NombrePais`)
    REFERENCES `mydb`.`PAIS` (`NombrePais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLUB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLUB` (
  `CodigoClub` INT NOT NULL,
  `NombreClub` VARCHAR(30) NOT NULL,
  `ValorClub` FLOAT NOT NULL,
  `PosicionRankingClubs` INT NOT NULL,
  `NJugadores` INT NOT NULL,
  `NombrePais` VARCHAR(30) NOT NULL,
  `Presidente` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CodigoClub`),
  UNIQUE INDEX `Nombre_UNIQUE` (`NombreClub` ASC) VISIBLE,
  INDEX `Pais_idx` (`NombrePais` ASC) VISIBLE,
  CONSTRAINT `Pais2`
    FOREIGN KEY (`NombrePais`)
    REFERENCES `mydb`.`PAIS` (`NombrePais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`JUGADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`JUGADOR` (
  `DNIJugador` VARCHAR(9) NOT NULL,
  `NombreJugador` VARCHAR(30) NOT NULL,
  `Sueldo` FLOAT NULL,
  `Altura` FLOAT NOT NULL,
  `Posicion` VARCHAR(25) NOT NULL,
  `Nacionalidad` VARCHAR(30) NOT NULL,
  `NombreClub` VARCHAR(30) NULL,
  `Federado` TINYINT NOT NULL,
  `Seleccionado` TINYINT NOT NULL,
  PRIMARY KEY (`DNIJugador`),
  INDEX `Nacionalidad_idx` (`Nacionalidad` ASC) VISIBLE,
  INDEX `Club_idx` (`NombreClub` ASC) VISIBLE,
  CONSTRAINT `Nacionalidad`
    FOREIGN KEY (`Nacionalidad`)
    REFERENCES `mydb`.`PAIS` (`NombrePais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Club`
    FOREIGN KEY (`NombreClub`)
    REFERENCES `mydb`.`CLUB` (`NombreClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OFERTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OFERTA` (
  `CodigoOferta` INT NOT NULL,
  `DNIJugador` VARCHAR(9) NOT NULL,
  `NombreClub` VARCHAR(30) NOT NULL,
  `DuracionContrato` INT NOT NULL,
  `Sueldo` FLOAT NOT NULL,
  PRIMARY KEY (`CodigoOferta`),
  INDEX `Jugador_idx` (`DNIJugador` ASC) VISIBLE,
  INDEX `NombreClub_idx` (`NombreClub` ASC) VISIBLE,
  CONSTRAINT `Jugador`
    FOREIGN KEY (`DNIJugador`)
    REFERENCES `mydb`.`JUGADOR` (`DNIJugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NombreClub`
    FOREIGN KEY (`NombreClub`)
    REFERENCES `mydb`.`CLUB` (`NombreClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONTRATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONTRATO` (
  `DNIJugador` VARCHAR(9) NOT NULL,
  `CodigoClub` INT NOT NULL,
  `FechaIni` DATE NOT NULL,
  `FechaFin` DATE NOT NULL,
  PRIMARY KEY (`DNIJugador`),
  INDEX `Club_idx` (`CodigoClub` ASC) VISIBLE,
  CONSTRAINT `Jugador2`
    FOREIGN KEY (`DNIJugador`)
    REFERENCES `mydb`.`JUGADOR` (`DNIJugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Club2`
    FOREIGN KEY (`CodigoClub`)
    REFERENCES `mydb`.`CLUB` (`CodigoClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PARTIDOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PARTIDOS` (
  `CodigoPartido` INT NOT NULL,
  `NombreCompeticion` VARCHAR(30) NOT NULL,
  `ClubLocal` VARCHAR(30) NOT NULL,
  `ClubVisitante` VARCHAR(30) NOT NULL,
  `Resultado` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CodigoPartido`),
  INDEX `NombreCompeticion_idx` (`NombreCompeticion` ASC) VISIBLE,
  INDEX `ClubLocal_idx` (`ClubLocal` ASC) VISIBLE,
  INDEX `ClubVisitante_idx` (`ClubVisitante` ASC) VISIBLE,
  CONSTRAINT `NombreCompeticion`
    FOREIGN KEY (`NombreCompeticion`)
    REFERENCES `mydb`.`COMPETICION` (`NombreCompeticion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ClubLocal`
    FOREIGN KEY (`ClubLocal`)
    REFERENCES `mydb`.`CLUB` (`NombreClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ClubVisitante`
    FOREIGN KEY (`ClubVisitante`)
    REFERENCES `mydb`.`CLUB` (`NombreClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MINUTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MINUTOS` (
  `CodigoPartido` INT NOT NULL,
  `DNIJugador` VARCHAR(9) NOT NULL,
  `Minutos` INT NOT NULL,
  INDEX `DNIJugador_idx` (`DNIJugador` ASC) VISIBLE,
  CONSTRAINT `CodigoPartido`
    FOREIGN KEY (`CodigoPartido`)
    REFERENCES `mydb`.`PARTIDOS` (`CodigoPartido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DNIJugador`
    FOREIGN KEY (`DNIJugador`)
    REFERENCES `mydb`.`JUGADOR` (`DNIJugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
