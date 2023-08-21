-- Quest�o 1: Gerar a lista de aniversariantes da empresa com m�s, dia e nome do empregado ordem cronol�gica
select 
	MONTH(dat_nascimento) as [Mes],
	DAY(dat_nascimento) as [Dia],
	--YEAR(dat_nascimento) as [Ano],
	nom_empregado as [Nome]
from empregado
order by MONTH(dat_nascimento)

-- Status: OK 
-- Resposta: PARCIAL

-- Quest�o 2: Listar os departamentos e seus gerentes com tempo de ger�ncia em anos ordenando pelo mais antigo.
select * from empregado
select * from departamento

select 
	D.nom_depto as [Departamento],
	E.nom_empregado [Gerente],
	D.dat_inicio_gerente as [Data in�cio do gerente],
	--GETDATE() - YEAR(dat_inicio_gerente) as [Anos de gerencia],
	DATEDIFF(YEAR,dat_inicio_gerente,GETDATE()) as [Anos de gerencia]
from departamento D
join empregado E
on E.num_matricula = D.num_matricula_gerente
order by dat_inicio_gerente


-- Status: ok
-- Resposta: CORRETO

-- Quest�o 3: Listar os funcion�rios  que ter�o mais que 65 a partir de 2021
select * from empregado

select
	nom_empregado,
	YEAR(dat_nascimento) as [Ano de nascimento],
	--DATEDIFF(YEAR,2021,dat_nascimento) as [Idade],
	2021 - YEAR(dat_nascimento) as [Idade]
from empregado
where 2021 - YEAR(dat_nascimento) >= 61


-- Status:
-- Resposta: 