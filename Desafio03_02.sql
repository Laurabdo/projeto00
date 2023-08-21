-- Unidade 3 - Desafio 2
use bd_empresa
select * from alocacao
select * from dependente
select * from empregado
select * from departamento
select * from departamento_local
select * from projeto

-- Quest�o 1: Liste o n�mero de matr�cula e nome do empregados e nome e parentesco de todos os dependentes
-- Staus:FEITO
-- Reposta: Correta ou errada? CORRETA
select 
	E.num_matricula, 
	E.nom_empregado, 
	D.nom_dependente, 
	D.dsc_parentesco
from empregado E
join dependente D 
on E.num_matricula = D.num_matricula

-- Quest�o 2: 
/*Liste nome dos departamentos com n�mero de matr�cula e nome de todos os funcion�rio. 
Ordene o resultado por departamento e nome do empregado */
-- Staus: FEITO
-- Reposta: Correta ou errada? Parcial
select DP.nom_depto, E.num_matricula, E.nom_empregado
from empregado E
join departamento DP
on E.cod_depto = DP.cod_depto
order by nom_depto, nom_empregado


-- Quest�o 3:
/* Para cada departamento um dos funcion�rios tem a fun��o de ger�ncia. 
Liste nome dos departamentos com n�mero de matr�cula e nome do gerente respons�vel.*/
-- Staus: FEITO
-- Reposta: Correta ou errada? 

select 
	D.nom_depto, 
	D.num_matricula_gerente,
	E.nom_empregado
from departamento D
join empregado E
on D.num_matricula_gerente = E.num_matricula

-- Quest�o 4:
/* Liste o n�mero de matr�cula e nome dos supervisores e n�mero de matr�cula e nome dos funcion�rios sob sua supervis�o
Ordene os supervisores e empregados em ordem alfab�tica */
-- Staus: OK
-- Reposta: Correta ou errada? PARCIAL
select * from empregado

select  
	E1.num_matricula as matricula_sup, 
	E1.nom_empregado as supervisor,
	E2.num_matricula as matricula_emp,
	E2.nom_empregado as empregado
from empregado E1
join empregado E2
on E1.num_matricula = E2.num_matricula_supervisor

/* OUTRAS TENTATIVAS
select distinct E1.num_matricula, E1.nom_empregado
from empregado E1
join empregado E2
on E1.num_matricula = E2.num_matricula_supervisor
join empregado E3
on E1.num_matricula = E3.num_matricula_supervisor

select distinct E1.num_matricula, E1.nom_empregado
from empregado E1
join empregado E2
on E1.num_matricula != E2.num_matricula_supervisor

select  
	E.num_matricula, 
	E.nom_empregado
from empregado E
join empregado S
on E.num_matricula = S.num_matricula_supervisor

SELECT sup.num_matricula as matricula_supervisor, 
       sup.nom_empregado as nome_supervisor, 
       e.num_matricula as matricula_empregado, 
       e.nom_empregado as nome_empregado
FROM empregado e
JOIN empregado sup ON e.num_matricula_supervisor = sup.num_matricula*/


-- Quest�o 5:
/* Liste os funcion�rios dos projetos de BH com o total de horas alocado.
Exibir nome e local do projeto, n�mero de matr�cula e nome do empregado e o total de horas alocado.
*/
-- Staus: OK
-- Reposta: Correta ou errada? CORRETA

select * from alocacao
select * from empregado
select * from projeto

select 
	P.nom_projeto,
	P.nom_local,
	E.num_matricula,
	E.nom_empregado, 
	A.num_horas
from alocacao A
join empregado E
on E.num_matricula = A.num_matricula
join projeto P
on A.cod_projeto = P.cod_projeto 
where nom_local = 'BH'





