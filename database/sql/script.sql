-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema coavalieitor_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coavalieitor_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coavalieitor_db` DEFAULT CHARACTER SET utf8 ;
USE `coavalieitor_db` ;

-- -----------------------------------------------------
-- Table `coavalieitor_db`.`perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`perfil` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`perfil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`usuario` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(255) NULL,
  `telefone` VARCHAR(45) NULL,
  `nascimento` DATE NULL,
  `sexo` CHAR(1) NULL,
  `perfil_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_perfil1_idx` (`perfil_id` ASC),
  CONSTRAINT `fk_usuario_perfil1`
    FOREIGN KEY (`perfil_id`)
    REFERENCES `coavalieitor_db`.`perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`professor` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`professor` (
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `fk_professor_usuario_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_professor_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `coavalieitor_db`.`usuario` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`aluno` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`aluno` (
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `fk_aluno_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_aluno_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `coavalieitor_db`.`usuario` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`instituicao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`instituicao` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`instituicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`curso` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`curso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `instituicao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_curso_instituicao1_idx` (`instituicao_id` ASC),
  CONSTRAINT `fk_curso_instituicao1`
    FOREIGN KEY (`instituicao_id`)
    REFERENCES `coavalieitor_db`.`instituicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`disciplina` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`disciplina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `curso_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_disciplina_curso1_idx` (`curso_id` ASC),
  CONSTRAINT `fk_disciplina_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `coavalieitor_db`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`turma` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`turma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `palavra_chave` VARCHAR(45) NULL,
  `disciplina_id` INT NOT NULL,
  `professor_usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_turma_disciplina1_idx` (`disciplina_id` ASC),
  INDEX `fk_turma_professor1_idx` (`professor_usuario_id` ASC),
  CONSTRAINT `fk_turma_disciplina1`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `coavalieitor_db`.`disciplina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_professor1`
    FOREIGN KEY (`professor_usuario_id`)
    REFERENCES `coavalieitor_db`.`professor` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`matricula` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`matricula` (
  `aluno_usuario_id` INT NOT NULL,
  `turma_id` INT NOT NULL,
  INDEX `fk_matricula_aluno1_idx` (`aluno_usuario_id` ASC),
  INDEX `fk_matricula_turma1_idx` (`turma_id` ASC),
  CONSTRAINT `fk_matricula_aluno1`
    FOREIGN KEY (`aluno_usuario_id`)
    REFERENCES `coavalieitor_db`.`aluno` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_turma1`
    FOREIGN KEY (`turma_id`)
    REFERENCES `coavalieitor_db`.`turma` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`status` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`avaliacao` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`avaliacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `descricao` TEXT(500) NULL,
  `requisito_adicional` TEXT(500) NULL,
  `submissao_inicial` DATETIME NULL,
  `submissao_final` DATETIME NULL,
  `correcao_inicial` DATETIME NULL,
  `correcao_final` DATETIME NULL,
  `num_correcao_estudante` INT NULL,
  `nota_maxima` INT NULL,
  `criterio_correcao` TEXT(500) NULL,
  `turma_id` INT NOT NULL,
  `status_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_avaliacao_turma1_idx` (`turma_id` ASC),
  INDEX `fk_avaliacao_status1_idx` (`status_id` ASC),
  CONSTRAINT `fk_avaliacao_turma1`
    FOREIGN KEY (`turma_id`)
    REFERENCES `coavalieitor_db`.`turma` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_avaliacao_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `coavalieitor_db`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`solucao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`solucao` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`solucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `resposta` TEXT(500) NULL,
  `avaliacao_id` INT NOT NULL,
  `aluno_usuario_id` INT NOT NULL,
  `solucao_data` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_solucao_avaliacao1_idx` (`avaliacao_id` ASC),
  INDEX `fk_solucao_aluno1_idx` (`aluno_usuario_id` ASC),
  CONSTRAINT `fk_solucao_avaliacao1`
    FOREIGN KEY (`avaliacao_id`)
    REFERENCES `coavalieitor_db`.`avaliacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solucao_aluno1`
    FOREIGN KEY (`aluno_usuario_id`)
    REFERENCES `coavalieitor_db`.`aluno` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`correcao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`correcao` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`correcao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comentario` TEXT(500) NULL,
  `nota` INT NULL,
  `solucao_id` INT NOT NULL,
  `aluno_usuario_id` INT NOT NULL,
  `correcao_data` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_correcao_solucao1_idx` (`solucao_id` ASC),
  INDEX `fk_correcao_aluno1_idx` (`aluno_usuario_id` ASC),
  CONSTRAINT `fk_correcao_solucao1`
    FOREIGN KEY (`solucao_id`)
    REFERENCES `coavalieitor_db`.`solucao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_correcao_aluno1`
    FOREIGN KEY (`aluno_usuario_id`)
    REFERENCES `coavalieitor_db`.`aluno` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coavalieitor_db`.`correcao_final`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coavalieitor_db`.`correcao_final` ;

CREATE TABLE IF NOT EXISTS `coavalieitor_db`.`correcao_final` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `feedback` TEXT(500) NULL,
  `nota_final` INT NULL,
  `avaliacao_id` INT NOT NULL,
  `aluno_usuario_id` INT NOT NULL,
  `correcao_final_data` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_correcao_final_avaliacao1_idx` (`avaliacao_id` ASC),
  INDEX `fk_correcao_final_aluno1_idx` (`aluno_usuario_id` ASC),
  CONSTRAINT `fk_correcao_final_avaliacao1`
    FOREIGN KEY (`avaliacao_id`)
    REFERENCES `coavalieitor_db`.`avaliacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_correcao_final_aluno1`
    FOREIGN KEY (`aluno_usuario_id`)
    REFERENCES `coavalieitor_db`.`aluno` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
