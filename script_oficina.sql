-- Script SQL - Oficina Mecânica
-- Autor: Karin Araujo
-- Banco de Dados: MySQL

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NULL,
  `endereco` VARCHAR(200) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculo` (
  `id_veiculo` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `placa` VARCHAR(10) NULL,
  `modelo` VARCHAR(50) NULL,
  `ano` INT NULL,
  PRIMARY KEY (`id_veiculo`),
  INDEX `fk_veiculo_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`cliente` (`id_cliente`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipe` (
  `id_equipe` INT NOT NULL AUTO_INCREMENT,
  `nome_equipe` VARCHAR(50) NULL,
  PRIMARY KEY (`id_equipe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ordem_servico` (
  `id_os` INT NOT NULL AUTO_INCREMENT,
  `id_veiculo` INT NOT NULL,
  `id_equipe` INT NOT NULL,
  `data_emissao` DATE NULL,
  `data_conclusao` DATE NULL,
  `status` VARCHAR(20) NULL,
  `valor_total` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_os`),
  INDEX `fk_os_veiculo_idx` (`id_veiculo` ASC) VISIBLE,
  INDEX `id_os_equipe_idx` (`id_equipe` ASC) VISIBLE,
  CONSTRAINT `fk_os_veiculo`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `mydb`.`veiculo` (`id_veiculo`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `id_os_equipe`
    FOREIGN KEY (`id_equipe`)
    REFERENCES `mydb`.`equipe` (`id_equipe`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mecanico` (
  `id_mecanico` INT NOT NULL AUTO_INCREMENT,
  `id_equipe` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `endereco` VARCHAR(200) NULL,
  `especialidade` VARCHAR(50) NULL,
  PRIMARY KEY (`id_mecanico`),
  INDEX `fk_mecanico_equipe_idx` (`id_equipe` ASC) VISIBLE,
  CONSTRAINT `fk_mecanico_equipe`
    FOREIGN KEY (`id_equipe`)
    REFERENCES `mydb`.`equipe` (`id_equipe`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servico` (
  `id_servico` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NULL,
  `valor_mao_obra` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`peca` (
  `id_peca` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NULL,
  `valor_unitario` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_peca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`os_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`os_servico` (
  `id_os` INT NOT NULL,
  `id_servico` INT NOT NULL,
  `quantidade` INT NULL,
  `valor_unitario` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_os`, `id_servico`),
  INDEX `fk_os_servico_servico_idx` (`id_servico` ASC) VISIBLE,
  CONSTRAINT `fk_os_servico_os`
    FOREIGN KEY (`id_os`)
    REFERENCES `mydb`.`ordem_servico` (`id_os`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_servico_servico`
    FOREIGN KEY (`id_servico`)
    REFERENCES `mydb`.`servico` (`id_servico`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`os_peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`os_peca` (
  `id_os` INT NOT NULL,
  `id_peca` INT NOT NULL,
  `quantidade` INT NULL,
  `valor_unitario` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_os`, `id_peca`),
  INDEX `fk_os_peca_peca_idx` (`id_peca` ASC) VISIBLE,
  CONSTRAINT `fk_os_peca_os`
    FOREIGN KEY (`id_os`)
    REFERENCES `mydb`.`ordem_servico` (`id_os`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_peca_peca`
    FOREIGN KEY (`id_peca`)
    REFERENCES `mydb`.`peca` (`id_peca`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
