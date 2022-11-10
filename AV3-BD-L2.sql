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
        references Medico(id)
        on update cascade
);