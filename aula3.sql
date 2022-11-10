drop database if exists aula3;
create database aula3;

use aula3;

create table pessoa(
	id int,
    nome varchar(100),
    idade int,
    altura float,
    primary key(id)
);

#Incerção 
insert into pessoa(id, nome, idade, altura) values('1','Avner','30','1.60');
insert into pessoa() values('2','Rita','19','1.80');

#Alteração

update pessoa set idade = 20 where id='2'; 
update pessoa set idade = 20, altura = 1.60 where id='1';
update pessoa set altura = 1.6 where id='2';

#Delete

delete from pessoa where id='2';

#Busca
select * from pessoa;
select nome,idade from pessoa;
SELECT nome,idade FROM pessoa WHERE idade=19; 
SELECT * FROM pessoa WHERE nome LIKE "R%";
SELECT * FROM pessoa WHERE idade=20 AND altura>1.5;
SELECT max(idade) FROM pessoa; 