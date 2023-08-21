select * from filmes

-- Quest�o 1: OK
select *
from filmes
where dsc_link_foto is null

-- Quest�o 2: OK
select dsc_filme, dat_lancamento
from filmes
where dsc_filme like '%bela%'

-- Quest�o 3: OK
select distinct dsc_filme
from filmes
where dsc_filme like '%bela%'

-- Quest�o 4: OK
select dsc_filme, qtd_votos
from filmes
where qtd_votos<1000
order by qtd_votos desc

-- Quest�o 5: OK
select *
from filmes
where dsc_filme like '%007%' and (qtd_votos>3000 or num_nota_media>65)

--Quest�o 6: OK
select top 5 dsc_filme, num_popularidade
from filmes
where dsc_filme like '%007%'
order by num_popularidade desc




























