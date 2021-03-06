-- MySQL Script generated by MySQL Workbench
-- Thu Nov 12 19:34:29 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema VIVEROS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema VIVEROS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `VIVEROS` DEFAULT CHARACTER SET utf8 ;
USE `VIVEROS` ;

-- -----------------------------------------------------
-- Table `VIVEROS`.`CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VIVEROS`.`CLIENTE` ;

CREATE TABLE IF NOT EXISTS `VIVEROS`.`CLIENTE` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `FechaNac` DATE NOT NULL,
  `VolumenCompra` INT NOT NULL,
  `Bonificacion` INT NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VIVEROS`.`EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VIVEROS`.`EMPLEADO` ;

CREATE TABLE IF NOT EXISTS `VIVEROS`.`EMPLEADO` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` INT NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VIVEROS`.`PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VIVEROS`.`PEDIDO` ;

CREATE TABLE IF NOT EXISTS `VIVEROS`.`PEDIDO` (
  `CodPedido` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Importe` INT NOT NULL,
  `DNIEmpleado` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`CodPedido`),
  INDEX `DNIEmpleado_idx` (`DNIEmpleado` ASC) VISIBLE,
  CONSTRAINT `DNIEmpleado`
    FOREIGN KEY (`DNIEmpleado`)
    REFERENCES `VIVEROS`.`EMPLEADO` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VIVEROS`.`PEDIDO_PRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VIVEROS`.`PEDIDO_PRODUCTO` ;

CREATE TABLE IF NOT EXISTS `VIVEROS`.`PEDIDO_PRODUCTO` (
  `CodigoPedido` INT NOT NULL,
  `CodigoBarras` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`CodigoPedido`, `CodigoBarras`),
  INDEX `CodigoBarras_idx` (`CodigoBarras` ASC) VISIBLE,
  CONSTRAINT `CodigoPedido`
    FOREIGN KEY (`CodigoPedido`)
    REFERENCES `VIVEROS`.`PEDIDO` (`CodPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CodigoBarras`
    FOREIGN KEY (`CodigoBarras`)
    REFERENCES `VIVEROS`.`PRODUCTO` (`CodigoBarras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VIVEROS`.`PRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VIVEROS`.`PRODUCTO` ;

CREATE TABLE IF NOT EXISTS `VIVEROS`.`PRODUCTO` (
  `CodigoBarras` INT NOT NULL,
  `PVP` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Stock` INT NOT NULL,
  `ZonaAsingada` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodigoBarras`),
  INDEX `ZonaAsignada_idx` (`ZonaAsingada` ASC) VISIBLE,
  CONSTRAINT `ZonaAsignada`
    FOREIGN KEY (`ZonaAsingada`)
    REFERENCES `VIVEROS`.`ZONA` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VIVEROS`.`VIVERO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VIVEROS`.`VIVERO` ;

CREATE TABLE IF NOT EXISTS `VIVEROS`.`VIVERO` (
  `Localizacion` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Superficie` INT NOT NULL,
  `CoordX` INT NOT NULL,
  `CoordY` INT NOT NULL,
  PRIMARY KEY (`Localizacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VIVEROS`.`ZONA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VIVEROS`.`ZONA` ;

CREATE TABLE IF NOT EXISTS `VIVEROS`.`ZONA` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Localizacion` VARCHAR(45) NOT NULL,
  `CodigoZona` INT NOT NULL,
  PRIMARY KEY (`Nombre`, `Localizacion`),
  INDEX `Localizacion_idx` (`Localizacion` ASC) VISIBLE,
  CONSTRAINT `Localizacion`
    FOREIGN KEY (`Localizacion`)
    REFERENCES `VIVEROS`.`VIVERO` (`Localizacion`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VIVEROS`.`ZONA_EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VIVEROS`.`ZONA_EMPLEADO` ;

CREATE TABLE IF NOT EXISTS `VIVEROS`.`ZONA_EMPLEADO` (
  `DNI` VARCHAR(9) NOT NULL,
  `NombreZona` VARCHAR(45) NOT NULL,
  `FechaInicio` DATE NOT NULL,
  `FechaFin` DATE NOT NULL,
  PRIMARY KEY (`DNI`, `NombreZona`),
  INDEX `NombreZona_idx` (`NombreZona` ASC) VISIBLE,
  CONSTRAINT `DNI`
    FOREIGN KEY (`DNI`)
    REFERENCES `VIVEROS`.`EMPLEADO` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NombreZona`
    FOREIGN KEY (`NombreZona`)
    REFERENCES `VIVEROS`.`ZONA` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
