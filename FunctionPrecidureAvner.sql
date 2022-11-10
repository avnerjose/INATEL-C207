USE bancoFunctions;
#Procedures
DELIMITER $$ 
CREATE PROCEDURE deleteAluno(IN matricula INT,IN cusro VARCHAR(3))
BEGIN
	DELETE FROM aluno AS a WHERE a.matricula = matricula AND a.curso = curso;
END $$

CREATE PROCEDURE updateAluno(IN matricula INT,IN curso VARCHAR(3), IN nome VARCHAR(100)) 
BEGIN 
	UPDATE aluno AS a SET a.nome = nome,a.email = concat(nome, "@", curso, ".inatel.br") 
    WHERE a.curso = curso AND a.matricula = matricula;   
END $$
#Function
CREATE FUNCTION calculaTroco(preco FLOAT, pagamento FLOAT) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN 
	DECLARE troco FLOAT;
    DECLARE res VARCHAR(50);
    SET troco = pagamento - preco;
    
    IF (troco < 0.05) THEN 
		SET res = "Sem troco";
		ELSEIF (troco <= 1) THEN 
			SET res = "Balinhas de café";
		ELSE 
			SET res = "Em dinheiro";
    END IF;
    
    RETURN res;
END $$
DELIMITER ;

SELECT id, preco, pagamento, calculaTroco(preco, pagamento) AS troco FROM compra;


