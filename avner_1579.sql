drop database if exists AV1L1;
create database AV1L1;

use AV1L1;

create table oculos(
	id int,
    marca varchar(50),
    lente varchar(50),
    grauEsquerdo float,
    grauDireito float,
    doenca varchar(50),
    primary key(id)
);

#1- A chave primária serve para identificar de forma única um registro do banco de dados. Ela é uma informação única 
# que nunca se repete para mais de um registro. 

#2 - Inserindo dados na tabela
INSERT INTO oculos VALUES(1,"Calvin Klein","vidro",3.5,2,"astigmatismo"),
(2,"Coca Cola","policarbonato",1.25,0.75,"miopia"),
(3,"Vogue","trivex",0.25,0.5,"hipermetropia"),
(4,"Coca Cola","resina",2.75,1.75,"hipermetropia"),
(5,"Vogue","trivex",1.5,3,"miopia"),
(6,"Carrera","vidro",2.5,1,"miopia");

#3 - Letra C -> UPDATE oculos SET marca = "Ray-Ban" where id = 5;

#4 
DELETE FROM oculos WHERE id=5;

#5 
#a
SELECT DISTINCT doenca FROM oculos; 
#b
SELECT avg(grauEsquerdo) FROM oculos WHERE doenca="miopia";
#c
SELECT * FROM oculos WHERE (doenca!="miopia" AND  grauDireito>1);
#d
SELECT marca,grauEsquerdo,grauDireito FROM oculos WHERE (marca LIKE "C%a" AND grauEsquerdo>2); 

