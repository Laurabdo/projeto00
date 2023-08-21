-- Quest�o 1: Listar os filmes que s�o do g�nero Guerra ou do G�nero A��o
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
where G.dsc_genero = 'A��o'

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

-- Op��o 1
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
WHERE g.dsc_genero = 'A��o'

-- Op��o 2
SELECT DISTINCT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero IN ('Guerra', 'A��o')

-- Quest�o 2: Listar os filmes que s�o do g�nero Guerra e tamb�m do G�nero A��o
select 
	F.dsc_filme as [Filme]
	--G.dsc_genero as [Genero]
from filmes F
join filmes_genero FG
on F.id_filme = FG.id_filme
join generos G
on G.id_genero = FG.id_genero
where G.dsc_genero = 'A��o'

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
-- Op��o 1
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
WHERE g.dsc_genero = 'A��o'

-- Op��o 2
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
     WHERE g.dsc_genero = 'A��o')


-- Quest�o 3: Listar os filmes que s�o do g�nero Guerra e n�o s�o do G�nero A��o

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
where G.dsc_genero = 'A��o'


-- Status: CORRETO
-- Resultado: 

-- Op��o 1
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
WHERE g.dsc_genero = 'A��o'

-- Op��o 2
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
     WHERE g.dsc_genero = 'A��o')
