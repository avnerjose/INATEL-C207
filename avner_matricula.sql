drop database if exists bancoav4;
create database bancoav4;

use bancoav4;

set @numPedidos = 0;

create table if not exists pessoa(
	id int auto_increment primary key,
    nome varchar(40),
    idade int,
    totalPedidos float,
    taxaEntrega float
);

create table if not exists acai(
	id int auto_increment primary key,
    tamanho int,
    precoTamanho float,
    recheio1 varchar(30),
    precoRecheio1 float,
    recheio2 varchar(30),
    precoRecheio2 float,
    totalAcai float,
	idPessoa int,
    constraint fk1
		foreign key(idPessoa)
        references pessoa(id)
        on update cascade
        on delete cascade
);

INSERT INTO pessoa(nome, idade) VALUES 
('Avner José', 21);


DELIMITER $$
DROP PROCEDURE IF EXISTS adicionaAcai $$
CREATE PROCEDURE adicionaAcai
(IN tamanho INT,IN precoTamanho FLOAT ,IN recheio1 VARCHAR(30),IN precoRecheio1 FLOAT,
IN recheio2 VARCHAR(30),IN precoRecheio2 FLOAT,IN idPessoa INT)
BEGIN
	DECLARE precoTotal FLOAT;
    
    SET precoTotal = precoTamanho + precoRecheio1 + precoRecheio2;
    
    INSERT INTO acai (tamanho, precoTamanho, recheio1, precoRecheio1,
    recheio2, precoRecheio2, totalAcai, idPessoa) VALUES 
    (tamanho,precoTamanho,recheio1,precoRecheio1, recheio2, precoRecheio2, precoTotal, idPessoa);
END$$ 

DROP FUNCTION IF EXISTS calcTaxaEntrega;
CREATE FUNCTION calcTaxaEntrega(totalPedidos FLOAT) RETURNS FLOAT DETERMINISTIC 
BEGIN 
	DECLARE taxaEntrega FLOAT;
    
    #Se o total de pedidos for menor que 30 a taxa é 3 reais senão, 5% do total do pedido
    IF totalPedido < 30 THEN
		SET taxaEntrega = 3.0;
	ELSE
		SET taxaEntrega = totalPedidos * 0.05; 
    END IF;
    
    RETURN taxaEntrega;
END$$ 

DELIMITER ;

CALL adicionaAcai(550,5.59,'Space Ball',3.4,
'Leite em Pó',4.5,1);

SELECT * FROM pessoa;
SELECT * FROM acai;