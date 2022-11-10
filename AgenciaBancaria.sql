DROP SCHEMA IF EXISTS AgenciaBancaria ;

CREATE SCHEMA IF NOT EXISTS AgenciaBancaria ;
USE AgenciaBancaria ;

DROP TABLE IF EXISTS Cliente;

CREATE TABLE IF NOT EXISTS Cliente (
  cpf CHAR(14) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  PRIMARY KEY (cpf));

DROP TABLE IF EXISTS Endereco;

CREATE TABLE IF NOT EXISTS Endereco (
  idEndereco INT NOT NULL AUTO_INCREMENT,
  cidade VARCHAR(50) NOT NULL,
  bairro VARCHAR(30) NOT NULL,
  rua VARCHAR(60) NOT NULL,
  numero INT NOT NULL,
  CEP CHAR(9) NOT NULL,
  Cliente_cpf CHAR(14) NOT NULL,
  PRIMARY KEY (idEndereco),
  INDEX fk_Endereco_Cliente_idx (Cliente_cpf ASC) VISIBLE,
  CONSTRAINT fk_Endereco_Cliente
    FOREIGN KEY (Cliente_cpf)
    REFERENCES Cliente (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


DROP TABLE IF EXISTS Agencia ;

CREATE TABLE IF NOT EXISTS Agencia(
  nome VARCHAR(40) NOT NULL,
  cidade VARCHAR(45) NOT NULL,
  numero VARCHAR(45) NOT NULL,
  PRIMARY KEY (numero));

DROP TABLE IF EXISTS Emprestimo;

CREATE TABLE IF NOT EXISTS Emprestimo(
  numero INT NOT NULL AUTO_INCREMENT,
  valor FLOAT NOT NULL,
  Agencia_numero VARCHAR(45) NOT NULL,
  PRIMARY KEY (numero),
  INDEX fk_Emprestimo_Agencia1_idx (Agencia_numero ASC) VISIBLE,
  CONSTRAINT fk_Emprestimo_Agencia1
    FOREIGN KEY (Agencia_numero)
    REFERENCES Agencia (numero)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


DROP TABLE IF EXISTS Conta_Poupanca ;

CREATE TABLE IF NOT EXISTS Conta_Poupanca (
  numero INT NOT NULL,
  saldo FLOAT NOT NULL,
  rendimento FLOAT NOT NULL,
  Cliente_cpf CHAR(14),
  Agencia_numero VARCHAR(45) NOT NULL,
  PRIMARY KEY (numero),
  INDEX fk_Conta_Poupanca_Cliente1_idx (Cliente_cpf ASC) VISIBLE,
  INDEX fk_Conta_Poupanca_Agencia1_idx (Agencia_numero ASC) VISIBLE,
  CONSTRAINT fk_Conta_Poupanca_Cliente1
    FOREIGN KEY (Cliente_cpf)
    REFERENCES Cliente (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Conta_Poupanca_Agencia1
    FOREIGN KEY (Agencia_numero)
    REFERENCES Agencia (numero)
	ON DELETE CASCADE
    ON UPDATE CASCADE);

DROP TABLE IF EXISTS Conta_Movimento ;

CREATE TABLE IF NOT EXISTS Conta_Movimento (
  numero INT NOT NULL,
  saldo FLOAT NULL,
  limite FLOAT NULL,
  Cliente_cpf CHAR(14),
  Agencia_numero VARCHAR(45) NOT NULL,
  PRIMARY KEY (numero),
  INDEX fk_Conta_Movimento_Cliente1_idx (Cliente_cpf ASC) VISIBLE,
  INDEX fk_Conta_Movimento_Agencia1_idx (Agencia_numero ASC) VISIBLE,
  CONSTRAINT fk_Conta_Movimento_Cliente1
    FOREIGN KEY (Cliente_cpf)
    REFERENCES Cliente (cpf)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Conta_Movimento_Agencia1
    FOREIGN KEY (Agencia_numero)
    REFERENCES Agencia (numero)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


DROP TABLE IF EXISTS Cliente_has_Emprestimo;

CREATE TABLE IF NOT EXISTS Cliente_has_Emprestimo (
  Cliente_cpf CHAR(14) NOT NULL,
  Emprestimo_numero INT NOT NULL,
  PRIMARY KEY (Cliente_cpf, Emprestimo_numero),
  INDEX fk_Cliente_has_Emprestimo_Emprestimo1_idx (Emprestimo_numero ASC) VISIBLE,
  INDEX fk_Cliente_has_Emprestimo_Cliente1_idx (Cliente_cpf ASC) VISIBLE,
  CONSTRAINT fk_Cliente_has_Emprestimo_Cliente1
    FOREIGN KEY (Cliente_cpf)
    REFERENCES Cliente (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Cliente_has_Emprestimo_Emprestimo1
    FOREIGN KEY (Emprestimo_numero)
    REFERENCES Emprestimo (numero)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
SELECT * FROM Conta_Movimento;
SELECT * FROM Conta_Poupanca;
SELECT * FROM Cliente;

INSERT INTO Agencia (nome,cidade,numero) VALUES 
("Agencia Top","Itajubá",8922); 
