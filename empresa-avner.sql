/*Perguntas teóricas: 
Nome: Avner José Guimarães Ribeiro
1 - Banco de dados relacionais são bancos de dados que relacionam os dados 
através da estrutura de tabelas 
2 - Dados são a matéria prima das informações, são conhecimentos sem relação ou tratamento
a partir do momento que relacionamos e tratamos os dados de forma eficiente e transformamos 
em algo relevante eles passam a ser informações. 
3 - Exemplos: 
 - Armazenamento de dados de sites
 - Armazenamento de dados de aplicativos de celular 
 - Armazenamento de dados de jogos 
 - Armazenamneto de dados de sistemas de hotelaria
4 - Chave primária é a informação que consegue identificar de forma única cada um dos registros
de um banco de dados. 
5 - Um registro é uma linha no banco de dados, é o conjunto de informações de um item específico
do banco de dados, que segue o modelo do banco. 
*/
DROP DATABASE IF EXISTS empresaaula3;
CREATE DATABASE empresaAula3;

USE empresaAula3;

CREATE TABLE funcionario(
	matricula int,
    nome varchar(60),
    cpf varchar(20),
    cargo varchar(30),
    numProjetos int,
    primary key(matricula)
);
#6
INSERT INTO funcionario() VALUES
(1,"Alexandre","111.111.111-11","GP",2),
(2,"Natanael","222.222.222-22","Desenvolvedor",4),
(3,"Rochelle","333.333.333-33","Tester",3),
(4,"Jhon","444.444.444-44","Desenvolvedor",5),
(5,"Ana Maria","555.000.000-00","RH",0),
(6,"Luciano","123.456.789-66","Tester",2);

#a
UPDATE funcionario SET cpf="555.777.999-11" WHERE matricula='5';
#b
SELECT avg(numProjetos) FROM funcionario WHERE cargo!="Tester"; 
#c
SELECT nome,cargo,numProjetos FROM funcionario WHERE numProjetos = (SELECT max(numProjetos) FROM funcionario);
#d
SELECT count(*) FROM funcionario WHERE numProjetos >= 3;  
#e
SELECT DISTINCT cargo FROM funcionario;
#f
SELECT nome,cpf,numProjetos FROM funcionario WHERE nome LIKE "%an%";
#g
SELECT matricula,nome,cargo FROM funcionario LIMIT 3;
#h
SELECT nome,cargo,numProjetos FROM funcionario WHERE ((cargo="Tester" OR cargo="Desenvolvedor") AND (numProjetos>3));
#i
DELETE FROM funcionario WHERE matricula='6'; 
