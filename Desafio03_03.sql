
-- Quest�o 1:
/* Liste o n�mero de matr�cula e nome dos empregados e nome e parentesco dos seus dependentes.
Considere tamb�m os funcion�rios que n�o tem dependentes.
*/
--Status: feito
-- Reposta: CORRETA

select * from empregado
select * from dependente


select 
	E.num_matricula,
	E.nom_empregado,
	DP.nom_dependente,
	DP.dsc_parentesco
from empregado E
left join dependente DP
on E.num_matricula = DP.num_matricula

-- Quest�o 2: Liste o n�mero de matr�cula e nome dos empregados que n�o tem dependentes cadastrados.
--Status: feito
-- Reposta: CORRETA

select 
	E.num_matricula,
	E.nom_empregado,
	DP.nom_dependente,
	DP.dsc_parentesco
from empregado E
full join dependente DP
on E.num_matricula = DP.num_matricula
where DP.nom_dependente is null

-- Quest�o 3:
/* Listar os nomes dos projetos, os locais de execu��o, o departamento, e os gerentes respons�veis.
Considere tamb�m os departamentos sem projeto e sem gerente.*/
--Status:
-- Reposta:
select * from projeto
select * from departamento

select 
	P.nom_projeto,
	P.nom_local,
	D.cod_depto,
	D.nom_depto,
	E.nom_empregado
from projeto P
right join departamento D
on D.cod_depto = P.cod_depto
left join empregado E
on E.num_matricula = D.num_matricula_gerente

select 
	P.nom_projeto,
	P.nom_local,
	P.cod_depto
from projeto P
full join departamento D
on D.cod_depto = P.cod_depto









