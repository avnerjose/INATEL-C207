drop database if exists exercicio12;
create database exercicio12;

use exercicio12;

create table filme(
	id int primary key,
    titulo varchar(50) not null,
    genero varchar(50) not null,
    tempo int not null
);

create table ator(
	id int primary key,
    nome varchar(50) not null,
    dataNasc varchar(50) not null,
    sexo varchar(10),
    idFilme int,
    constraint fk1
		foreign key(idFilme)
		references filme(id)
		on update set null
		on delete set null
);
#1
ALTER TABLE ator ADD pais varchar(50), ADD idioma varchar(50);
#2
ALTER TABLE ator CHANGE COLUMN dataNasc idade INT NOT NULL;
#3
ALTER TABLE ator DROP COLUMN sexo;
#4
INSERT INTO filme VALUES 
(1,"Jogos Vorazes","ação",143),
(2,"O destinho de Júpiter","ficção científica",127);

INSERT INTO ator VALUES
(1,"Jennifer Lawrence",30,1,"EUA","ingles"),
(2,"Josh Hutcherson",28,1,"EUA","ingles"),
(3,"Bae Doona",41,2,"Coréia do Sul","coreano"),
(4,"Mila Kunis",35,2,"Ucrânia","ucraniano"),
(5,"Eddie Redmayne",38,2,"Reino Unido","ingles");
#5
UPDATE ator SET idade = 37 WHERE id='4';
#6
DELETE FROM ator WHERE id='5';
#7
UPDATE filme SET id='43' WHERE id='1';
#8
DELETE FROM filme WHERE id='2'; 
#9
ALTER TABLE ator CHANGE pais paisDeOrigem VARCHAR(50) NOT NULL;
#10
ALTER TABLE ator DROP COLUMN idade;
