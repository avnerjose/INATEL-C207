drop database if exists hospital;
create database hospital;
use hospital;

#RELACIONAMENTO 1:N
#1 MEDICO ATENDE VARIOS PACIENTES, MAS CADA PACIENTE É ATENDIDO POR 1 MEDICO APENAS

create table medico(
	id int auto_increment primary key,
    nome varchar(40),
    especialidade varchar(30),
    idade int
);	

create table paciente(
	id int auto_increment primary key,
    nome varchar(40) not null,
    idade int not null,
    peso float not null,
    altura float not null,
    email varchar(30),
    idMedico int,
    constraint fk1
		foreign key(idMedico)
        references medico(id)
        on update cascade
        on delete cascade 
);
#1 - Falta o ON DELETE CASCADE
#2-a
ALTER TABLE paciente ADD sintoma VARCHAR(50);
#2-b
ALTER TABLE paciente CHANGE email telefone VARCHAR(20) NOT NULL;
#2-c
ALTER TABLE medico DROP COLUMN idade;
#3
INSERT INTO medico(nome, especialidade) VALUES
('Tatiana Albuquerque', 'Dentista'),
('Fabiano Magalhães', 'Clínico Geral'),
('Lucas Medeiros', 'Clínico Geral');

INSERT INTO paciente(nome, idade, peso, altura, sintoma, telefone, idMedico) VALUES
('Pedro', '32', '90.6', '1.85', 'Dor de Garganta', '(35) 99988-7766', '3'),
('Hellen', '19', '58.2', '1.68', 'Dor de Cabeça', '(35) 95562-3434', '2'),
('Jonas', '26', '60', '1.72', 'Febre Alta', '(35) 99907-8283', '1'),
('Mariana', '38', '73.2', '1.77', 'Dor de Garganta', '(35) 99100-2324', '3'),
('Luana', '22', '53.9', '1.65', 'Dor de Cabeça', '(35) 99798-5625', '2');
#4-a
UPDATE paciente SET sintoma = 'Cárie', idade = 25 WHERE nome LIKE 'Jonas';
#4-b
UPDATE paciente SET altura = '1.8' WHERE id = 4;
#4-c
DELETE FROM paciente WHERE id = 3;
#5-a
SELECT DISTINCT especialidade FROM medico;
#5-b
SELECT DISTINCT m.nome FROM medico AS m JOIN paciente AS p ON p.idMedico = m.id 
AND p.idade < 30;
#5-c
SELECT AVG(altura) FROM paciente AS p JOIN medico AS m ON p.idMedico = m.id 
AND m.especialidade LIKE 'Clínico Geral';
#5-d
SELECT p.nome,idade,peso,altura,m.nome FROM paciente AS p JOIN medico AS m 
ON p.idMedico = m.id AND p.sintoma LIKE 'Dor%';
#6 
CREATE USER ChefeDeCirurgia IDENTIFIED BY 'senha123';
CREATE USER Anestesista IDENTIFIED BY 'anestisaehtop'; 
#6-a
GRANT INSERT,UPDATE,DELETE ON hospital.paciente TO ChefeDeCirurgia;
#6-b
REVOKE DELETE ON hospital.paciente FROM ChefeDeCirurgia;	
#6-c
GRANT SELECT(nome,idade,peso,altura) ON hospital.paciente TO Anestesista;

