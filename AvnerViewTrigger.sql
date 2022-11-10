USE bancoAtividade;

DELIMITER $$

DROP TRIGGER IF EXISTS adicionar$$
CREATE TRIGGER adicionar AFTER INSERT ON itens_venda
FOR EACH ROW 
BEGIN 
		UPDATE produtos SET estoque = estoque - NEW.quantidade
        WHERE id = NEW.id_produto; 
END$$

DROP TRIGGER IF EXISTS deletar$$
CREATE TRIGGER deletar AFTER DELETE ON itens_venda
FOR EACH ROW 
BEGIN
	UPDATE produtos SET estoque = estoque + OLD.quantidade
    WHERE id = OLD.id_produto;
END$$

DELIMITER ;

#Insere na tabela itens_venda acionando o Trigger "adicionar"
INSERT INTO itens_venda VALUES (1,1,2);
#Deleta da tabela itens_venda acionando o Trigger "deletar"
DELETE FROM itens_venda WHERE id_venda = 1;

#Criando View proposta
DROP VIEW IF EXISTS EquipeRH;

CREATE VIEW EquipeRH AS(
	SELECT f.nome,idade,altura FROM funcionario
    AS f JOIN departamento AS d 
    ON f.idDepartamento = d.id
    AND d.nome LIKE "RH" 
);

#Inserindo Departamentos
INSERT INTO departamento (nome) VALUES
("Financeiro"),
("RH"),
("Administrativo"),
("Comercial"); 

#Inserindo Funcionarios
INSERT INTO funcionario (nome, idade,altura, idDepartamento) VALUES 
('Avner',20,'1.89',2),
('Frederico Sanches',45,1.52,2),
('Barbara Amaral',34,1.5,1),
('Pedro Paulo',43,1.75,2),
('Joana Almeida',23,1.65,3),
('Maria Paula',27,1.62,2);

#Selecioando a média das idades através da View
SELECT AVG(idade) AS MediaIdades FROM EquipeRH;
