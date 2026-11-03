create database atv_heroi;
use atv_heroi;

DROP TABLE IF EXISTS heroi;
DROP TABLE IF EXISTS equipe;


CREATE TABLE equipe (
cod_equipe INTEGER NOT NULL,
nome VARCHAR(50) NOT NULL,
base VARCHAR(50),
PRIMARY KEY (cod_equipe)
);


CREATE TABLE heroi (
cod_heroi INTEGER NOT NULL,
cod_equipe INTEGER,
nome VARCHAR(50) NOT NULL,
origem VARCHAR(40),
poder INTEGER,
inteligencia INTEGER,
velocidade INTEGER,
resistencia INTEGER,
PRIMARY KEY (cod_heroi),
FOREIGN KEY (cod_equipe) REFERENCES equipe(cod_equipe)
);

INSERT INTO equipe VALUES (1, 'Vingadores', 'Torre dos Vingadores');
INSERT INTO equipe VALUES (2, 'Guardiões da Galáxia', 'Benatar');
INSERT INTO equipe VALUES (3, 'Wakanda', 'Wakanda');
INSERT INTO equipe VALUES (4, 'Asgard', 'Asgard');
INSERT INTO equipe VALUES (5, 'Defensores', 'Nova York');
INSERT INTO equipe VALUES (6, 'X-Men', 'Instituto Xavier');

INSERT INTO heroi VALUES (1, 1, 'Homem de Ferro', 'Terra', 85, 100, 75, 75);
INSERT INTO heroi VALUES (2, 1, 'Capitão América', 'Terra', 75, 80, 70, 85);
INSERT INTO heroi VALUES (3, 1, 'Viúva Negra', 'Terra', 65, 90, 90, 75);
INSERT INTO heroi VALUES (4, 1, 'Hulk', 'Terra', 100, 65, 45, 80);
INSERT INTO heroi VALUES (5, 1, 'Gavião Arqueiro', 'Terra', 75, 80, 88, 80);
INSERT INTO heroi VALUES (6, 4, 'Thor', 'Asgard', 100, 75, 80, 95);
INSERT INTO heroi VALUES (7, 3, 'Pantera Negra', 'Terra', 90, 85, 85, 80);
INSERT INTO heroi VALUES (8, 3, 'Shuri', 'Terra', 65, 100, 75, 85);
INSERT INTO heroi VALUES (9, 2, 'Senhor das Estrelas', 'Terra', 70, 75, 80, 65);
INSERT INTO heroi VALUES (10, 2, 'Gamora', 'Zen-Whoberi', 85, 80, 90, 80);
INSERT INTO heroi VALUES (11, 2, 'Rocket', 'Halfworld', 60, 95, 88, 55);
INSERT INTO heroi VALUES (12, 2, 'Groot', 'Planeta X', 90, 55, 40, 100);
INSERT INTO heroi VALUES (13, NULL, 'Homem-Aranha', 'Terra', 85, 75, 95, 90);
INSERT INTO heroi VALUES (14, NULL, 'Doutor Estranho', 'Terra', 95, 100, 65, 70);
INSERT INTO heroi VALUES (15, NULL, 'Capitã Marvel', 'Terra', 100, 75, 100, 80);
INSERT INTO heroi VALUES (16, 1, 'Homem-Formiga', 'Terra', 70, 85, 65, 70);
INSERT INTO heroi VALUES (17, NULL, 'Vespa', 'Terra', 72, 88, 95, 75);
INSERT INTO heroi VALUES (18, 5, 'Demolidor', 'Terra', 60, 85, 88, 75);
INSERT INTO heroi VALUES (19, 4, 'Loki', 'Asgard', 88, 90, 75, 70);


#1. Apresente todos os dados dos heróis cadastrados.
select *
from heroi;

#2. Apresente apenas o nome, poder e inteligência de todos os heróis.
select nome,poder,inteligencia
from heroi;

#3. Apresente os heróis em ordem alfabética pelo nome.
select *
from heroi
order by nome ASC;

#4. Apresente os heróis ordenados do maior para o menor valor de poder.
select *
from heroi 
order by poder DESC;

#5. Apresente nome, poder e resistência dos heróis que possuam poder maior que 85.
select nome,poder,resistencia
from heroi
where poder > 85;

#6. Apresente os personagens cuja inteligência esteja entre 80 e 90.
select *
from heroi
where inteligencia between 80 and 90;

#7. Apresente os personagens que tenham velocidade maior ou igual a 90 e resistência maior ou igual a 80.
select *
from heroi
where velocidade >= 90 and resistencia >=80;

#8. Apresente os personagens cuja origem seja Asgard, Halfworld ou Planeta X.
select *
from heroi 
where origem in('Asgard','Halfworld','Planeta X');

#9. Apresente todos os personagens que não tenham origem na Terra.
select *
from heroi 
where origem != 'Terra';

#10. Apresente os personagens cujo nome comece pela letra H.
select *
from heroi 
where nome like 'H%';

#11. Apresente os personagens cujo nome contenha a palavra Homem.
select *
from heroi 
where nome like '%Homem%';

#12. Apresente todos os personagens que estejam sem equipe cadastrada.
select *
from heroi
where cod_equipe IS NULL;

#13. Apresente os personagens que atendam a pelo menos uma das seguintes condições:
#poder maior ou igual a 95; ou
#inteligência maior ou igual a 95.
select *
from heroi
where poder >= 95 OR inteligencia >= 95;

#14. Apresente os personagens que tenham:
#poder entre 70 e 90;
#inteligência maior ou igual a 80;
#resistência maior que 70.
select *
from heroi
where (poder between 70 and 90) and (inteligencia >= 80) and resistencia > 70;

#15. Apresente nome, poder, inteligência e uma coluna chamada poder_mental, calculada por:
#poder + inteligencia
select nome, poder, inteligencia, (poder + inteligencia) as poder_mental
from heroi;

#16. Apresente nome e uma coluna chamada indice_combate, calculada por:
#poder + velocidade + resistencia
#Ordene do maior índice para o menor.
select nome, (poder+velocidade+resistencia) as indice_combate
from heroi
order by indice_combate DESC;

#17. Imagine que todos os personagens receberão um bônus de 10 pontos no poder. Apresente:
#nome;
#poder atual;
#poder após o bônus.
select nome, poder, (poder +10) as pos_bonus
from heroi;

#18.Apresente os heróis cujo resultado da expressão abaixo seja maior que 250:
#poder + inteligencia + resistencia
select nome, (poder+inteligencia+resistencia) as valor
from heroi
where (poder+inteligencia+resistencia) > 250;

#19. Apresente o nome de cada personagem e o nome de sua respectiva equipe.
select h.nome, e.nome as nome_equipe
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe;

#20. Apresente nome do personagem, nome da equipe e base da equipe apenas para personagens que
#pertençam aos Vingadores.
select h.nome, e.nome as nome_equipe, e.base 
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe
where e.nome in ('Vingadores');

#21. Apresente todos os personagens pertencentes aos Guardiões da Galáxia, mostrando:
#personagem;
#origem;
#equipe;
#poder.
select h.nome,h.origem, e.nome as nome_equipe, h.poder
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe
where e.nome in ('Guardiões da Galáxia');

#22. Apresente nome, equipe e inteligência dos integrantes de Wakanda.
#Ordene do mais inteligente para o menos inteligente.
select h.nome,h.origem, e.nome as nome_equipe, h.inteligencia
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe
order by h.inteligencia DESC;

#23. Apresente os personagens que pertençam a uma equipe cuja base seja Asgard
#Não utilize diretamente o nome da equipe no filtro.
select h.nome, e.base
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe
where e.cod_equipe = 4;

#24. Apresente os personagens pertencentes aos Vingadores que tenham poder maior que 80.
select h.nome, e.nome as equipe, h.poder
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe
where e.nome in('Vingadores') and h.poder > 80;

#25. Apresente os integrantes dos Vingadores que tenham:
#velocidade maior ou igual a 80;
#resistência maior ou igual a 75.
select h.nome, e.nome as equipe, h.velocidade, h.resistencia
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe
where (e.nome in('Vingadores')) and (h.velocidade >= 80) and h.resistencia >=75;

#26. Apresente todos os heróis, inclusive aqueles que não estejam vinculados a nenhuma equipe.
#nome do herói;
#nome da equipe.
select h.nome, e.nome as equipe
from heroi h
left join equipe e on h.cod_equipe = e.cod_equipe;

#27. Utilizando a lógica da consulta anterior, apresente somente os personagens que estejam sem equipe.
select h.nome, e.cod_equipe as equipe
from heroi h
left join equipe e on h.cod_equipe = e.cod_equipe
where e.cod_equipe is NULL;

#28. Apresente todas as equipes cadastradas, mesmo aquelas que não possuem nenhum personagem
#vinculado.
#nome da equipe;
#nome do personagem.
select e.nome as equipe, h.nome
from equipe e 
left join heroi h on e.cod_equipe = h.cod_equipe;

#29. A equipe X-Men possui algum personagem cadastrado neste banco? Crie uma consulta SQL que permita
#responder à pergunta, sem simplesmente consultar a tabela equipe.
select h.nome, e.nome as equipe
from heroi h
right join equipe e on h.cod_equipe = e.cod_equipe
where e.nome = 'X-Men';

#30. Explique brevemente por que utilizar INNER JOIN na questão 26 faria alguns personagens desaparecerem
#do resultado.
#Resposta: O INNER JOIN retorna apenas os registros que possuem correspondência
#em ambas as tabelas. Como os personagens sem equipe têm o campo cod_equipe 
#como NULL, eles não encontram um par na tabela equipe e acabam sendo omitidos do resultado.

#31. Cadastre o personagem abaixo. Antes de escrever o INSERT, descubra qual é o código da equipe X-Men:
#descobrindo o codigo da equipe do X-men
select cod_equipe, nome
from equipe
where nome = 'X-Men';

INSERT INTO heroi VALUES (20, 6, 'Wolverine', 'X-Men', 88, 78, 82, 98);

#32. Após o cadastro, faça uma consulta mostrando:
#Wolverine;
#sua equipe;
#sua base.
select h.nome, e.nome as equipe, e.base
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe
where h.nome = 'Wolverine';

#33. O poder de Wolverine foi cadastrado incorretamente. Altere seu poder de 88 para 92.
update heroi 
set poder = 92
where cod_heroi = 20;

#34. A S.H.I.E.L.D. decidiu aumentar em 5 pontos a resistência de todos os integrantes dos Vingadores.
#Escreva o comando necessário.
update heroi
set resistencia = resistencia + 5
where cod_equipe = 1;

#35. Aumente o poder da Viúva Negra em 10%. Monte o UPDATE correspondente.
update heroi
set poder = poder * 1.10
where nome = 'Viúva Negra';

#36. Escreva o comando necessário para excluir Wolverine.
delete 
from heroi
where cod_heroi = 20;

#37. Adicione à tabela heroi um campo chamado ano_estreia, do tipo INTEGER.
alter table heroi 
add column ano_estreia INTEGER;

#38. Adicione à tabela equipe um campo chamado lider, com capacidade para armazenar até 50 caracteres.
alter table equipe 
add column lider varchar(50);

#39. Escreva o comando necessário para remover o campo ano_estreia da tabela heroi.
alter table heroi
drop column ano_estreia;

#40. Um aluno tentou executar o comando abaixo:
#Sabendo que não existe nenhuma equipe com código 99, o comando deverá funcionar? Explique o
#motivo.
#Resposta: Não. O comando falhará por violação de Chave Estrangeira (Foreign Key), pois o banco não
#permite inserir um herói associado a um código de equipe (99) que não existe na tabela equipe.

#41. A S.H.I.E.L.D. precisa escolher um novo integrante.
select h.nome, e.nome as equipe, h.poder, h.inteligencia, h.velocidade, h.resistencia, 
(h.poder + h.inteligencia + h.velocidade + h.resistencia) as energia_total
from heroi h
inner join equipe e on h.cod_equipe = e.cod_equipe
where (e.cod_equipe IS NOT NULL) and (e.nome != 'Vingadores') and (h.poder >=80) and (h.inteligencia >=80)
and h.resistencia >=80
order by energia_total DESC;

#Depois da consulta, responda: qual personagem seria o primeiro da lista?
#Resposta: Pantera Negra
