-- Questão 1: Listar a quantidade de empregados com idade média por supervisor
select * from empregado

select 
	E1.nom_empregado as [Supervisores],
	COUNT(E1.nom_empregado) as [Quant. empregados],
	AVG(YEAR(GETDATE()) - YEAR(E1.dat_nascimento)) as [idade]
from empregado E1
join empregado E2
on E1.num_matricula = E2.num_matricula_supervisor
group by E2.num_matricula_supervisor, E1.nom_empregado
order by 1


-- Satus: FEITO
-- Resposta: CORRETA

-- Questão 2: Listar nome dos departamentos com nomes dos empregados e a quantidade de dependentes, se houver.

select * from departamento
select * from dependente
select * from empregado
select
	D.nom_depto as [Departamento],
	E.nom_empregado as [Empregado],
	COUNT(De.num_matricula) as [Quantidade dependentes]
from departamento D
join empregado E
on E.cod_depto = D.cod_depto
full join dependente De
on E.num_matricula = De.num_matricula
group by D.nom_depto, E.nom_empregado--, De.nom_dependente
order by 1

-- Satus: FEITO
-- Resposta: PARCIAL

-- Questão 3: Listar somente os locais e a quantidade de projetos onde houver mais de 2 projetos alocados
select
	nom_local as [Locais],
	COUNT(nom_projeto) as [Quantidade projetos]
from projeto
group by nom_local
having COUNT(nom_projeto) > 2

-- Satus: FEITO
-- Resposta: CORRETO