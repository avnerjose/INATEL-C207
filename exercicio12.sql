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