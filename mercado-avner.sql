DROP DATABASE IF EXISTS mercado;
CREATE DATABASE mercado;

USE mercado;

CREATE TABLE produto(
	codigo int,
    nome varchar(50),
    preco float,
    fornecedor varchar(50),
    primary key(codigo)
);

#INSERINDO DADOS NA TABELA
INSERT INTO produto() VALUES('1234','Óleo','8','Soya');
INSERT INTO produto() VALUES('1357','Arroz','28','BeansHouse');
INSERT INTO produto() VALUES('3698','Feijão','7.5','BeansHouse');
INSERT INTO produto() VALUES('2370','Batata Baroa','3','Legumes - To Go');
INSERT INTO produto() VALUES('564','Batata Doce','3.5','Legumes - To Go');
INSERT INTO produto() VALUES('2141','Miojo','0.9','Nissin');

#MUDA O NOME DO FORNECEDOR PARA O CÓDIGO 1234
UPDATE produto SET fornecedor='Lisa' WHERE codigo='1234';
#DELETA O PRODUTO DE CÓDIGO 2141
DELETE FROM produto WHERE codigo='2141';
#SELECIONA TODOS OS NOMES DE FORNECEDOR DISTINTOS
SELECT DISTINCT fornecedor FROM produto; 
#SELECIONA TODAS AS INFORMAÇÕES DOS PRODUTOS COM BATATA NO NOME
SELECT * FROM produto WHERE nome LIKE "Batata%"; 
#SELECIONA NOME E FORNECEDOR DOS PRODUTOS COM PREÇO MAIOR QUE 5
SELECT nome,fornecedor FROM produto WHERE preco>5;
#MOSTRA O MENOR PREÇO DOS PRODUTOS NA TABELA
SELECT min(preco) FROM produto;
#MOSTRA A MEDIA DOS PREÇOS DOS PRODUTOS NA TABELA 
SELECT avg(preco) FROM produto; 
#MOTRA A QUANTIDA DE PRODUTOS NA TABELA
SELECT count(codigo) FROM produto; 

