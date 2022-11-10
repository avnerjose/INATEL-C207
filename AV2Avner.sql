DROP DATABASE IF EXISTS DBLinguagens;
CREATE DATABASE DBLinguagens;

USE DBLinguagens;

DROP TABLE IF EXISTS Linguagem;
CREATE TABLE Linguagem(
	idLing INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    ano INT(4) NOT NULL,
    idealizador VARCHAR(100) NOT NULL,
    PRIMARY KEY(idLing)
);

DROP TABLE IF EXISTS Area;
CREATE TABLE Area(
	idArea INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(idArea) 
);

DROP TABLE IF EXISTS Empresa;
CREATE TABLE Empresa(
	idEmp INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    idLing_Linguagem INT,
	valorAcao INT NOT NULL,
    PRIMARY KEY(idEmp),
    CONSTRAINT fk1
    FOREIGN KEY (idLing_Linguagem) REFERENCES Linguagem(idLing)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Usada;
CREATE TABLE Usada(
	idLA INT AUTO_INCREMENT NOT NULL,
    idLing_Linguagem INT,
    idArea_Area INT,
    PRIMARY KEY(idLA),
    CONSTRAINT fk2 
    FOREIGN KEY(idLing_Linguagem) REFERENCES Linguagem(idLing)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT fk3
    FOREIGN KEY(idArea_Area) REFERENCES Area(idArea)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

INSERT INTO Linguagem (nome,ano,idealizador) VALUES 
('Ruby','1995','Yukihiro Matsumoto'),
('JavaScript','1995','Brendan Eich'),
('Java','1995','James Gosling'),
('Python','1990','Guido Van Rossum'),
('C#','2000','Microsoft');

INSERT INTO Area (nome) VALUES 
('Web Front-end'),
('Web Back-End'),
('Mobile'),
('Desktop');

INSERT INTO Empresa (nome,idLing_Linguagem,valorAcao) VALUES 
('Netflix',2,2147),
('Amazon',4,6544),
('Microsoft',5,973),
('Uber',3,175),
('AirnBnB',1,95),
('eBay',3,121),
('Instagram',4,450);

INSERT INTO Usada (idLing_Linguagem,idArea_Area) VALUES
(1,2),
(2,1),
(2,3),
(3,2),
(3,3),
(2,2),
(3,4),
(4,2),
(5,2),
(5,3),
(2,4),
(5,4);

#2-A
ALTER TABLE Empresa ADD tipoEmpresa VARCHAR(100);
#2-B
UPDATE Empresa SET tipoEmpresa = 'privada';
#2-c 
SELECT * FROM Linguagem WHERE ano < 2000
AND nome LIKE "J%";
#2-D
SELECT DISTINCT ano FROM Linguagem
ORDER BY ano DESC;
#2-E
SELECT Emp.nome AS Empresa, Ling.nome AS Linguagem FROM Empresa AS Emp,
Linguagem AS Ling 
WHERE Emp.idLing_Linguagem = Ling.idLing;
#2-F
SELECT Emp.nome AS Empresa,valorAcao AS Original,0.83*valorAcao AS PosQueda FROM Empresa
AS Emp, Linguagem AS Ling WHERE Emp.idLing_Linguagem = Ling.idLing
AND Ling.nome = 'Ruby';
#2-G
SELECT MIN(valorAcao), MAX(valorAcao) FROM Empresa
WHERE valorAcao < 1000;
#2-H
SELECT Ling.nome AS Linguagem,Area.nome FROM Linguagem AS Ling,
Area, Usada WHERE Usada.idLing_Linguagem = Ling.idLing
AND Usada.idArea_Area = Area.idArea ORDER BY Ling.nome DESC;
#2-I
SELECT idealizador FROM Linguagem AS Ling,
Area, Usada WHERE Usada.idLing_Linguagem = Ling.idLing
AND Usada.idArea_Area = Area.idArea AND Area.nome = 'Mobile';
#2-J
INSERT INTO Linguagem (nome,ano,idealizador) VALUES
('C++','1979','Bjarne Stroustrup');
