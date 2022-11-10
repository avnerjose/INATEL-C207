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
#Criando usuarios
CREATE USER "hermione" IDENTIFIED BY "bichento";
CREATE USER "ministro" IDENTIFIED BY "sopadeervilha";
CREATE USER "dumbledore" IDENTIFIED BY "acidinhas";
CREATE USER "hagrid" IDENTIFIED BY "fofo"; 
CREATE USER "mcgonagall" IDENTIFIED BY "gatolistrado123";
CREATE USER "snape" IDENTIFIED BY "lilian"; 
CREATE USER "doloresumbridge" IDENTIFIED BY "rosarosado";
CREATE USER "harrypotter" IDENTIFIED BY "pomodeouro";
#1  
GRANT USAGE ON *.* TO "hermione";
#2
REVOKE CREATE ON hogwarts.* FROM "ministro";
#3
GRANT ALL ON hogwarts.* TO "dumbledore";
#4
GRANT INSERT,UPDATE ON hogwarts.animal TO "hagrid";  
GRANT GRANT OPTION ON hogwarts.* TO "hagrid";
#5 
GRANT UPDATE(nome,sobrenome) ON hogwarts.bruxo TO "mcgonagall","snape";
GRANT SELECT ON hogwarts.* TO "mcgonagall","snape";
#6
REVOKE ALL,GRANT OPTION FROM "doloresumbridge";  
#7
REVOKE INSERT,DELETE ON hogwarts.jogadorDeQuadribol FROM "harrypotter";
SHOW GRANTS FOR "harrypotter"; 

 
 


  
