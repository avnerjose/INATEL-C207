create database hogwarts;

use hogwarts;

create table animal(
	id int auto_increment,
    nome varchar(40),
    especie varchar(20),
    primary key(id)
);

create table bruxo(
	id int auto_increment,
    nome varchar(30),
    sobrenome varchar(30),
    idade int,
    nacionalidade varchar(30),
    primary key(id)
);

create table jogadorDeQuadribol(
	id int auto_increment,
    posicao varchar(40),
    casa varchar(15),
    primary key(id)
);