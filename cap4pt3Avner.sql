USE empresa;

#1
SELECT DISTINCT parentesco FROM dependente;
#2
SELECT PNome, DataNasc FROM empregado 
WHERE Sexo=1 ORDER BY DataNasc ASC;
#3
SELECT Nome_Dependente, PNOME FROM dependente AS d,
empregado AS e WHERE SSN_Empregado = SSN;
#4
SELECT AVG(salario) FROM empregado, departamento
WHERE DNumero_Departamento= DNumero AND Endereco LIKE "%São Paulo%"
AND DNome LIKE "%Engenharia%";
#5
SELECT sup.PNome AS Supervisor, emp.PNome AS Empregado, 
(sup.Salario-emp.Salario) AS DifSalarial FROM empregado
AS sup, empregado AS emp 
WHERE emp.SSN_Supervisor = sup.SSN;
#6
SELECT emp.PNome AS Nome,proj.PNome AS Projeto, Horas FROM empregado AS emp, projeto AS proj,
trabalha_em AS trab WHERE trab.SSN_Empregado = emp.SSN AND 
trab.PNumero_Projeto = proj.PNome;