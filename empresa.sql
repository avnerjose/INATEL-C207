drop database if exists empresaaula3;
create database empresaaula3;

use empresaaula3;

create table funcionario(
	matricula int,
    nome varchar(60),
    cpf varchar(20),
    cargo varchar(30),
    numProjetos int,
    primary key(matricula)
);

INSERT INTO funcionario VALUES(1,"Alexandre","111.111.111-11","GP",2),
(2,"Natanael","222.222.222-22","Desenvolvedor",4),
(3,"Rochelle","333.333.333-33","Tester",3),
(4,"Jhon","444.444.444-44","Desenvolvedor",5),
(5,"Ana Maria","555.000.000-00","RH",0),
(6,"Luciano","123.456.789-66","Tester",2);

UPDATE funcionario SET cpf="555.777.999-11" WHERE matricula=5; 
SELECT avg(numProjetos) FROM funcionario WHERE cargo!="Tester"; 
SELECT nome,cargo,numProjetos FROM funcionario WHERE numProjetos=(SELECT max(numProjetos) FROM funcionario);
SELECT count(*) FROM funcionario WHERE numProjetos>=3; 
SELECT DISTINCT cargo FROM funcionario; 
SELECT nome,cpf,numProjetos FROM funcionario WHERE nome LIKE "%an%" AND cargo="Desenvolvedor"; 
SELECT matricula,nome,cargo FROM funcionario LIMIT 3;
SELECT nome,cargo,numProjetos FROM funcionario WHERE ((cargo="Tester" OR cargo="Desenvolvedor") AND numProjetos>3);   
DELETE FROM funcionario WHERE matricula=6; 
SELECT * FROM funcionario; 