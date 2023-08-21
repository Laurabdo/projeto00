select * from filmes

-- Questão 1: OK
select *
from filmes
where dsc_link_foto is null

-- Questão 2: OK
select dsc_filme, dat_lancamento
from filmes
where dsc_filme like '%bela%'

-- Questão 3: OK
select distinct dsc_filme
from filmes
where dsc_filme like '%bela%'

-- Questão 4: OK
select dsc_filme, qtd_votos
from filmes
where qtd_votos<1000
order by qtd_votos desc

-- Questão 5: OK
select *
from filmes
where dsc_filme like '%007%' and (qtd_votos>3000 or num_nota_media>65)

--Questão 6: OK
select top 5 dsc_filme, num_popularidade
from filmes
where dsc_filme like '%007%'
order by num_popularidade desc




























