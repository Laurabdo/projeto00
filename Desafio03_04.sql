
-- Quest�o 1:
/*Liste o n�mero de matr�cula e nome dos empregados e seus dependentes, 
exibindo a coluna 'dependentes' com nome do dependente e o parentesco entre par�ntesis.Exemplo: Zezinho (filho)
*/
-- Status:OK
-- Resposta: CORRETO

select 
	E.num_matricula as matricula,
	E.nom_empregado as nome_empregado,
	D.nom_dependente + ' (' + RTRIM (D.dsc_parentesco)+')' as dependente
from empregado E
join dependente D
on E.num_matricula = D.num_matricula

-- Quest�o 2: Liste os departamentos, com seu respectivos gerentes e a data de in�cio da ger�ncia no formato dia-m�s-ano
-- Status: OK
-- Resposta: CORRETA
select * from departamento
select * from empregado

select
	D.nom_depto as Departamentos,
	E.nom_empregado as Gerentes,
	convert(varchar(10), D.dat_inicio_gerente, 103) as data_inicio_gerente
from departamento D
join empregado E
on E.num_matricula = D.num_matricula_gerente

-- Quest�o 3:
/* Liste os empregados e horas de aloca��o em cada projeto no formato abaixo:
   Nome: Rodrigo Moreira Projeto: Migra��o para SQL 2005 - 10 horas
   Considere todos os funcion�rios, incluindo os que n�o tem projeto
*/
-- Status: ok 
-- Resposta: CORRETA
select * from empregado
select * from alocacao
select * from departamento
select * from projeto

select
	'Nome: ' + E.nom_empregado + ' Projeto: ' + isnull(P.nom_projeto,'sem projetos') + ' - ' + isnull(CONVERT(varchar(10), A.num_horas),'0') + ' horas' as inf
from alocacao A
join projeto P
on P.cod_projeto = A.cod_projeto
full join empregado E
on A.num_matricula = E.num_matricula






