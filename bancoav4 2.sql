drop database if exists bancoav4;
create database bancoav4;

use bancoav4;

set @numPedidos = 0;

create table if not exists pessoa(
	id int auto_increment primary key,
    nome varchar(40),
    idade int,
    totalPedidos float,
    taxaEntrega float
);

create table if not exists acai(
	id int auto_increment primary key,
    tamanho int,
    precoTamanho float,
    recheio1 varchar(30),
    precoRecheio1 float,
    recheio2 varchar(30),
    precoRecheio2 float,
    totalAcai float,
	idPessoa int,
    constraint fk1
		foreign key(idPessoa)
        references Pessoa(id)
        on update cascade
        on delete cascade
);