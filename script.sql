-- MySQL Workbench Forward Engineering

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
-- Table `mydb`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionario` (
  `idfuncionario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `nomeSocial` VARCHAR(60) NULL,
  `dataNasc` DATE NOT NULL,
  `genero` VARCHAR(5) NULL,
  `email` VARCHAR(45) NOT NULL,
  `dataAdm` DATETIME NOT NULL,
  `dataDemi` DATETIME NULL,
  PRIMARY KEY (`idfuncionario`),
  UNIQUE INDEX `e-mail_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enderecoFunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enderecoFunc` (
  `uf` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `cep` INT(9) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `comp` VARCHAR(45) NULL,
  `funcionario_idfuncionario` INT UNSIGNED NOT NULL,
  INDEX `fk_enderecoFunc_funcionario1_idx` (`funcionario_idfuncionario` ASC) VISIBLE,
  PRIMARY KEY (`funcionario_idfuncionario`),
  CONSTRAINT `fk_enderecoFunc_funcionario1`
    FOREIGN KEY (`funcionario_idfuncionario`)
    REFERENCES `mydb`.`funcionario` (`idfuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `genero` VARCHAR(5) NULL,
  `nomeSocial` VARCHAR(45) NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enderecoCli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enderecoCli` (
  `uf` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `cep` INT(9) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `comp` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  INDEX `fk_enderecoCli_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  PRIMARY KEY (`Cliente_idCliente`),
  CONSTRAINT `fk_enderecoCli_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `tam` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `qntd` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE INDEX `idProduto_UNIQUE` (`idProduto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCateogoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(70) NOT NULL,
  `Produto_idProduto` INT NULL,
  PRIMARY KEY (`idCateogoria`),
  UNIQUE INDEX `idCateogoria_UNIQUE` (`idCateogoria` ASC) VISIBLE,
  INDEX `fk_Cateogoria_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Cateogoria_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATETIME NOT NULL,
  `statusEntrega` VARCHAR(45) NOT NULL,
  `qntd` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(6,2) ZEROFILL NOT NULL,
  `funcionario_idfuncionario` INT UNSIGNED NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
  UNIQUE INDEX `idVenda_UNIQUE` (`idVenda` ASC) VISIBLE,
  INDEX `fk_Venda_funcionario1_idx` (`funcionario_idfuncionario` ASC) VISIBLE,
  INDEX `fk_Venda_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_funcionario1`
    FOREIGN KEY (`funcionario_idfuncionario`)
    REFERENCES `mydb`.`funcionario` (`idfuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`formaPag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`formaPag` (
  `idformaPag` INT NOT NULL AUTO_INCREMENT,
  `qntdParcelas` INT NULL,
  `tipoPag` VARCHAR(45) NOT NULL,
  `Venda_idVenda` INT NOT NULL,
  `valorTotal` DECIMAL(6,2) ZEROFILL NOT NULL,
  PRIMARY KEY (`idformaPag`),
  UNIQUE INDEX `idformaPag_UNIQUE` (`idformaPag` ASC) VISIBLE,
  INDEX `fk_formaPag_Venda1_idx` (`Venda_idVenda` ASC) VISIBLE,
  CONSTRAINT `fk_formaPag_Venda1`
    FOREIGN KEY (`Venda_idVenda`)
    REFERENCES `mydb`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItensVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItensVenda` (
  `Venda_idVenda` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `desconto` DECIMAL(4,2) ZEROFILL NULL,
  `valorVenda` DECIMAL(6,2) ZEROFILL NOT NULL,
  PRIMARY KEY (`Venda_idVenda`, `Produto_idProduto`),
  INDEX `fk_Venda_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Venda_has_Produto_Venda1_idx` (`Venda_idVenda` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_has_Produto_Venda1`
    FOREIGN KEY (`Venda_idVenda`)
    REFERENCES `mydb`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Promocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Promocao` (
  `idPromocao` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `percDesconto` INT NOT NULL,
  `dataInicio` DATETIME NOT NULL,
  `dataFim` DATETIME NOT NULL,
  `ItensVenda_Venda_idVenda` INT NULL,
  `ItensVenda_Produto_idProduto` INT NULL,
  PRIMARY KEY (`idPromocao`),
  UNIQUE INDEX `idPromocao_UNIQUE` (`idPromocao` ASC) VISIBLE,
  INDEX `fk_Promocao_ItensVenda1_idx` (`ItensVenda_Venda_idVenda` ASC, `ItensVenda_Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Promocao_ItensVenda1`
    FOREIGN KEY (`ItensVenda_Venda_idVenda` , `ItensVenda_Produto_idProduto`)
    REFERENCES `mydb`.`ItensVenda` (`Venda_idVenda` , `Produto_idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `CNPJ` VARCHAR(17) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `idFornecedor_UNIQUE` (`idFornecedor` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enderecoFornec`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enderecoFornec` (
  `uf` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `cep` INT(9) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `comp` VARCHAR(45) NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_enderecoFornec_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compra` (
  `idcompra` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(6,2) ZEROFILL NOT NULL,
  `dataCompra` DATETIME NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idcompra`),
  UNIQUE INDEX `idcompra_UNIQUE` (`idcompra` ASC) VISIBLE,
  INDEX `fk_compra_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_compra_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItensCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItensCompra` (
  `compra_idcompra` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `valorCompra` DECIMAL(6,2) ZEROFILL NOT NULL,
  `qntd` INT NOT NULL,
  `dataEntrada` DATETIME NOT NULL,
  PRIMARY KEY (`compra_idcompra`, `Produto_idProduto`),
  INDEX `fk_compra_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_compra_has_Produto_compra1_idx` (`compra_idcompra` ASC) VISIBLE,
  CONSTRAINT `fk_compra_has_Produto_compra1`
    FOREIGN KEY (`compra_idcompra`)
    REFERENCES `mydb`.`compra` (`idcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefone` (
  `idtelefone` INT(11) NOT NULL,
  `numero` VARCHAR(15) NOT NULL,
  `Fornecedor_idFornecedor` INT NULL,
  `funcionario_idfuncionario` INT UNSIGNED NULL,
  PRIMARY KEY (`idtelefone`),
  UNIQUE INDEX `idtelefone_UNIQUE` (`idtelefone` ASC) VISIBLE,
  INDEX `fk_telefone_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  INDEX `fk_telefone_funcionario1_idx` (`funcionario_idfuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_telefone_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefone_funcionario1`
    FOREIGN KEY (`funcionario_idfuncionario`)
    REFERENCES `mydb`.`funcionario` (`idfuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
