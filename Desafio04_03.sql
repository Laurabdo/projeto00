select * from empregado
select * from alocacao

-- Questão 1:
/* Listar o nome do empregado e o nome do respectivo departamento para todos os empregados que não estão alocados em projetos, 
resolver com:

a) NOT EXISTS

b) NOT IN

c) LEFT JOIN */

-- LETRA A NOT EXISTS

/*select
	E.nom_empregado as [Nome do empregado],
	D.nom_depto as [Nome do departamento],
	A.cod_projeto as [Projeto]
from empregado as E
join departamento D
on E.cod_depto = D.cod_depto
full join alocacao A
on A.num_matricula = E.num_matricula
where A.cod_projeto is null*/

--MINHA RESPOSTA LETRA A:
select
	E.nom_empregado as [Nome do empregado],
	D.nom_depto as [Nome do departamento]
from empregado E
join departamento D
on E.cod_depto = D.cod_depto
where not exists (
select
	A.num_matricula
from alocacao A
where A.num_matricula = E.num_matricula
)

-- Resposta: 

SELECT nom_empregado, 
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
WHERE NOT EXISTS (SELECT 1 
FROM alocacao a 
WHERE a.num_matricula = e.num_matricula)

-- LETRA B NOT IN

select
	E.nom_empregado as [Nome do empregado],
	D.nom_depto as [Nome do departamento]
from empregado E
join departamento D
on E.cod_depto = D.cod_depto
where E.num_matricula not in (
select
	A.num_matricula
from alocacao A
)

-- Resposta:
SELECT nom_empregado, 
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
WHERE e.num_matricula NOT IN 
                    (SELECT num_matricula FROM alocacao a)

-- LETRA C LEFT JOIN
select
	E.nom_empregado as [Nome do empregado],
	D.nom_depto as [Nome do departamento]
	
from empregado as E
join departamento D
on E.cod_depto = D.cod_depto
left join alocacao A
on A.num_matricula = E.num_matricula
where A.cod_projeto is null


-- Resposta:
SELECT nom_empregado, 
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
LEFT JOIN alocacao a on a.num_matricula = e.num_matricula 
WHERE a.num_matricula is null


-- Questão 2:
/* Listar o empregado, o número de horas e o projeto cuja alocação de horas no projeto é maior do que a média de alocação do
referido projeto. */

select 
	P.nom_projeto as [Projeto],
	AVG(A.num_horas) as [Média da hora]
from empregado E
join alocacao A
on A.num_matricula = E.num_matricula
join projeto P
on A.cod_projeto = P.cod_projeto
group by P.nom_projeto

select 
	E.nom_empregado as [Empregado],
	A.num_horas as [Horas no projeto],
	P.nom_projeto as [Projeto]
from empregado E
join alocacao A
on A.num_matricula = E.num_matricula
join projeto P
on A.cod_projeto = P.cod_projeto
join (
select 
	cod_projeto,
	AVG(A.num_horas) as media
from alocacao A
group by cod_projeto
) as M
on P.cod_projeto = M.cod_projeto
where A.num_horas > media


-- Status:
-- Resposta: 
SELECT a.cod_projeto,
       nom_empregado,  
       nom_projeto, 
       media, 
       SUM(num_horas) AS qtd_horas
FROM empregado e
JOIN alocacao a 
on a.num_matricula = e.num_matricula
JOIN projeto p 
on p.cod_projeto = a.cod_projeto
JOIN (
SELECT 
	cod_projeto, 
	AVG (num_horas) media
FROM alocacao a 
GROUP BY cod_projeto
) a_media 
ON a.cod_projeto = a_media.cod_projeto
GROUP BY a.cod_projeto, nom_empregado, nom_projeto, media
HAVING SUM(num_horas) > media
