DROP DATABASE IF EXISTS locadora;
CREATE DATABASE locadora; 

USE locadora;

CREATE TABLE IF NOT EXISTS Filme(
	id int AUTO_INCREMENT,
    nome varchar(60),
    diretor varchar(60),
    genero varchar(30),
    preco float, 
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Cliente(
	id int AUTO_INCREMENT, 
    nome varchar(60), 
    idade int, 
    telefone varchar(14), 
    PRIMARY KEY(id)
); 

CREATE TABLE IF NOT EXISTS Cliente_has_Filme(
	id_Cliente_has_Filme int AUTO_INCREMENT,
	id_Cliente int, 
    id_Filme int,
    CONSTRAINT fk_cliente FOREIGN KEY (id_Cliente) REFERENCES Cliente(id),
    CONSTRAINT fk_filme FOREIGN KEY (id_Filme) REFERENCES Filme(id), 
    PRIMARY KEY(id_Cliente_has_Filme)
);

SELECT * FROM Cliente_has_Filme; 
SELECT *  FROM Filme; 
SELECT * FROM Cliente; 
