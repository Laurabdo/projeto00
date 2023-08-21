Select * from filmes
select * from generos
select * from filmes_genero



-- Questão 1:Crie uma view com o nome vw_filmes para listar todos os filmes com descrição, gênero e quantidade de votos 

create view vw_filmes 
as
select
	F.dsc_filme,
	G.dsc_genero,
	F.qtd_votos
from filmes F
join filmes_genero FG
on FG.id_filme = F.id_filme
join generos G
on G.id_genero = FG.id_genero

select *
from vw_filmes


-- Status: CORRETO
-- Resposta:

CREATE VIEW vw_filmes
AS 
  SELECT dsc_filme, 
         dsc_genero, 
         qtd_votos
  FROM filmes f
  JOIN filmes_genero fg ON fg.id_filme = f.id_filme
  JOIN generos g ON g.id_genero = fg.id_genero


-- Questão 2: Utilize a view criada para listar:
/* 
a) 3 gêneros mais votados
b) 3 gêneros mais votados entre aqueles com menos de 600 mil votos
*/

-- a)
select top 3
	dsc_genero,
	SUM(qtd_votos) as [votos]
from vw_filmes
group by dsc_genero
order by [votos] desc

-- b)

select top 3
	dsc_genero,
	SUM(qtd_votos) as [votos]
from vw_filmes
group by dsc_genero
having SUM(qtd_votos) < 600000
order by [votos] desc

-- Status: PARCIAL
-- Resposta:
-- a):
SELECT dsc_genero, 
       sum(qtd_votos) AS qtd_votos
FROM vw_filmes
GROUP BY dsc_genero
ORDER BY 2 DESC

--b):
SELECT dsc_genero, 
       sum(qtd_votos) AS qtd_votos
FROM vw_filmes
GROUP BY dsc_genero
HAVING sum(qtd_votos) < 600000
ORDER BY 2 DESC