drop database if exists mercado;
create database mercado;

use mercado;

create table produto(
	codigo int,
    nome varchar(50),
    preco float,
    fornecedor varchar(50),
    primary key(codigo)
);