drop database if exists masterchef;
create database masterchef;

use masterchef;
#RELACIONAMENTO N:M ENTRE JURADO E COMPETIDOR
#JULGAR É A TABELA INTERMEDIARIA
#RELACIONAMENTO 1:N ENTRE COMPETIDOR E PRATO
create table Competidor(
	id int not null auto_increment,
    nome varchar(100) not null,
    idade int not null,
    profissao varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    primary key(id)
);

create table Jurado(
	id int not null auto_increment,
    nome varchar(100) not null,
    paisOrigem varchar(100) not null,
    primary key(id)
);

create table Julgar(
	idCompetidor int not null,
    idJurado int not null,
	CONSTRAINT fk1
    foreign key (idCompetidor) 
    references Competidor (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT fk2
    foreign key (idJurado) 
    references Jurado (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    PRIMARY KEY(idCompetidor, idJurado)
);

create table Prato(
	id int not null auto_increment,
    tipoCulinaria varchar(50) not null,
    idCompetidor int not null,
    nota float not null,
    primary key(id),
    CONSTRAINT fk3
    foreign key (idCompetidor) 
    references Competidor (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

insert into Competidor(nome, idade, profissao, cidade, estado) values
('Janaina Caetano', '38', 'Taróloga', 'Diadema', 'SP'),
('Rodrigo Massoni', '33', 'Engenheiro Ambiental', 'Osasco', 'SP'),
('Lorena Dayse', '35', 'Enfermeira', 'Teresina', 'PI'),
('Helton Oliveira', '19', 'Estudante', 'Jacutinga', 'MG'),
('Haila Santuá', '25', 'Publicitária', 'Chapadão do Céu', 'GO'),
('Uttoni','20', 'Estudante', 'Borda da Mata', 'MG');

insert into Jurado(nome, paisOrigem) values
('Paola Carosella', 'Argentina'),
('Érick Jacquin', 'França'),
('Henrique Fogaça', 'Brasil');

insert into Julgar(idJurado, idCompetidor) values
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '3'),
('2', '5'),
('3', '1'),
('3', '2'),
('3', '4');

insert into Prato(tipoCulinaria, nota, idCompetidor) values
('Japonesa', '9.5', '1'),
('Italiana', '8.7', '1'),
('Francesa', '9.2', '2'),
('Brasileira', '4.6', '3'),
('Francesa', '2.7', '4'),
('Francesa', '8.0', '4'),
('Chinesa', '7.5', '4'),
('Japonesa', '3.0', '5');


select * from prato;
select nome, idade, profissao from competidor;
select nome from competidor as c where c.idade > 30;

#JOIN
# busca relacionando competidor e pratos
select nome, profissao, estado, tipoCulinaria from Competidor as c
inner join Prato as p
on idCompetidor = c.id;

select nome, profissao, estado, tipoCulinaria 
from Competidor, Prato
where idCompetidor = competidor.id;

# nota maior que 5 e idade maior que 20
select nome, idade, tipoCulinaria, nota from competidor as c
inner join Prato as p
on p.idCompetidor = c.id and nota>5 and idade>20;

select nome, idade, tipoCulinaria, nota 
from competidor as c, prato as p
where p.idCompetidor = c.id and nota>5 and idade>20;


# relacionamento n:m
select j.nome, paisOrigem, c.nome, idade, profissao from Jurado as j
inner join Julgar on Julgar.idJurado = j.id
inner join Competidor as c on Julgar.idCompetidor = c.id and idade>20;

select j.nome, paisOrigem, c.nome, idade, profissao 
from jurado as j, competidor as c, julgar
where julgar.idJurado = j.id and julgar.idCompetidor = c.id and idade >20;

SELECT nota,nome, idade, cidade FROM Prato JOIN Competidor 
AS c ON idCompetidor = c.id AND c.estado LIKE "SP";

SELECT nome, idade, profissao FROM Competidor 
AS c JOIN Julgar AS j ON j.idCompetidor = c.id AND j.idJurado = 1; 

SELECT AVG(p.nota) FROM Prato AS p JOIN Competidor AS c ON p.idCompetidor = c.id AND 
c.profissao LIKE 'E%';

SELECT MAX(nota) FROM Prato AS p JOIN Competidor AS c ON p.idCompetidor = c.id AND
c.idade < 28;

SELECT j.nome, j.paisOrigem, c.nome, idade, cidade FROM Jurado AS j JOIN Julgar 
ON Julgar.idJurado = j.id JOIN Competidor AS c ON  Julgar.idCompetidor = c.id
AND c.estado != 'SP';

SELECT DISTINCT tipoCulinaria FROM Prato AS p JOIN Competidor AS c ON p.idCompetidor = c.id
AND c.estado != 'SP';

SELECT DISTINCT paisOrigem FROM Jurado AS j JOIN Julgar ON Julgar.idJurado = j.id
JOIN Competidor AS c ON Julgar.idCompetidor = c.id AND c.idade > 30;

SELECT DISTINCT p.tipoCulinaria, c.nome FROM Prato AS p JOIN Competidor AS c ON p.idCompetidor = c.id
JOIN Jurado AS j JOIN Julgar ON Julgar.idCompetidor = c.id AND Julgar.idJurado = 2;
