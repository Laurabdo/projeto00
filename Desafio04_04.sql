-- Questão 1: Listar os filmes que são do gênero Guerra ou do Gênero Ação
select * from filmes
select * from generos
select * from filmes_genero

select 
	F.dsc_filme as [Filme],
	G.dsc_genero as [Genero]
from filmes F
join filmes_genero FG
on F.id_filme = FG.id_filme
join generos G
on G.id_genero = FG.id_genero
where G.dsc_genero = 'Ação'

union

select 
	F.dsc_filme as [Filme],
	G.dsc_genero as [Genero]
from filmes F
join filmes_genero FG
on F.id_filme = FG.id_filme
join generos G
on G.id_genero = FG.id_genero
where G.dsc_genero = 'Guerra'




-- Status: CORRETO	
-- Resultado: 

-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
UNION
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'

-- Opção 2
SELECT DISTINCT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero IN ('Guerra', 'Ação')

-- Questão 2: Listar os filmes que são do gênero Guerra e também do Gênero Ação
select 
	F.dsc_filme as [Filme]
	--G.dsc_genero as [Genero]
from filmes F
join filmes_genero FG
on F.id_filme = FG.id_filme
join generos G
on G.id_genero = FG.id_genero
where G.dsc_genero = 'Ação'

intersect

select 
	F.dsc_filme as [Filme]
	--G.dsc_genero as [Genero]
from filmes F
join filmes_genero FG
on F.id_filme = FG.id_filme
join generos G
on G.id_genero = FG.id_genero
where G.dsc_genero = 'Guerra'


-- Status: CORRETO
-- Resultado: 
-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
INTERSECT
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'

-- Opção 2
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
AND dsc_filme IN 
     (SELECT dsc_filme
     FROM filmes f
     JOIN filmes_genero fg on fg.id_filme = f.id_filme
     JOIN generos g on g.id_genero = fg.id_genero
     WHERE g.dsc_genero = 'Ação')


-- Questão 3: Listar os filmes que são do gênero Guerra e não são do Gênero Ação

select 
	F.dsc_filme as [Filme]
	--G.dsc_genero as [Genero]
from filmes F
join filmes_genero FG
on F.id_filme = FG.id_filme
join generos G
on G.id_genero = FG.id_genero
where G.dsc_genero = 'Guerra'

except

select 
	F.dsc_filme as [Filme]
	--G.dsc_genero as [Genero]
from filmes F
join filmes_genero FG
on F.id_filme = FG.id_filme
join generos G
on G.id_genero = FG.id_genero
where G.dsc_genero = 'Ação'


-- Status: CORRETO
-- Resultado: 

-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
EXCEPT
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'

-- Opção 2
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
AND dsc_filme NOT IN 
     (SELECT dsc_filme
     FROM filmes f
     JOIN filmes_genero fg on fg.id_filme = f.id_filme
     JOIN generos g on g.id_genero = fg.id_genero
     WHERE g.dsc_genero = 'Ação')
