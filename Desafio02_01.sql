select * from filmes

select dsc_filme, qtd_votos, num_nota_media
from filmes
where dsc_filme = 'Matrix'

select *
from filmes
where qtd_votos<1000 and num_nota_media>80 and num_nota_media<90