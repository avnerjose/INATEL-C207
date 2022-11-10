drop database if exists bancoAtividade;
create database bancoAtividade;
use bancoAtividade;

#EXERCICIO TRIGGERS (tabelas produtos e itens_venda)================================================================== 
CREATE TABLE produtos (
	id INT PRIMARY KEY,
	descricao VARCHAR(50),
	estoque INT NOT NULL
);

INSERT INTO produtos VALUES ('1', 'Lasanha', '10');
INSERT INTO produtos VALUES ('2', 'Morango', '5');
INSERT INTO produtos VALUES ('3', 'Farinha', '15');
INSERT INTO produtos VALUES ('4', 'Arroz', '25');
INSERT INTO produtos VALUES ('5', 'Vodka', '17');

CREATE TABLE itens_venda (
	id_venda INT PRIMARY KEY,
	id_produto INT,
	quantidade INT
);

#EXERCICIO VIEWS (tabelas departamento e investimento)================================================================
create table if not exists departamento(
	id int not null auto_increment,
    nome varchar(100) not null,
    primary key(id)
);

create table if not exists funcionario(
	id int not null auto_increment,
    nome varchar(50),
    idade int,
    altura float,
	idDepartamento int not null,
    primary key(id),
    constraint fk1
		foreign key(idDepartamento)
		references departamento (id)
        on update cascade
        on delete cascade
);
