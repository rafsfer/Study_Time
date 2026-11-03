create database atividade1;
use atividade1;

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

-- Missão 01: ARMADURA E INTELIGÊNCIA
-- Encontre um integrante dos Vingadores
-- Inteligência maior ou igual a 95
-- Poder entre 80 e 90
-- Apresente nome do herói, equipe, poder, inteligência, resistência e Energia de Combate.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    h.poder,
    h.inteligencia,
    h.resistencia,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
Where e.nome = 'Vingadores'
  AND h.inteligencia >= 95
  AND h.poder BETWEEN 80 AND 90;    


-- Missão 02: O LÍDER
-- Encontre um integrante dos Vingadores
-- Inteligência igual a 80
-- Resistência maior ou igual a 85
-- Apresente também o nome da equipe e a Energia de Combate.


SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
Where e.nome = 'Vingadores'
    AND h.inteligencia = 80
    AND h.resistencia >= 85;

-- Missão 03: HERÓI SEM EQUIPE
-- Encontre um personagem que atualmente não possua equipe cadastrada
-- Velocidade entre 90 e 96
-- Inteligência menor que 80
-- A consulta deve mostrar o personagem e também a equipe, mesmo que ela não exista.
-- Dica: pense se o INNER JOIN é suficiente para trazer heróis sem equipe.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
LEFT JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE h.cod_equipe IS NULL
    AND h.velocidade BETWEEN 90 AND 96
    AND h.inteligencia < 80;

-- Missão 04: ASGARD
-- Encontre um personagem pertencente à equipe cuja base seja Asgard
-- Poder igual a 100
-- Apresente personagem, equipe, atributos e Energia de Combate.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    h.poder,
    h.inteligencia,
    h.resistencia,
    h.velocidade,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE e.base = "Asgard"
    AND h.poder = 100;

-- Missão 05: ESPIONAGEM
-- Encontre um integrante dos Vingadores
-- Poder menor que 70
-- Velocidade maior ou igual a 90
-- Apresente a Energia de Combate.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE e.nome = 'Vingadores'
    AND h.poder < 70
    AND h.velocidade >= 90;

-- Missão 06: DEFESA DE WAKANDA
-- Encontre um integrante de Wakanda
-- Poder maior ou igual a 85
-- Resistência igual a 80
-- Apresente a Energia de Combate.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE e.nome = 'Wakanda'
    AND h.poder >= 85
    AND h.resistencia = 80;


-- Missão 07: FORÇA BRUTA
-- Entre os Vingadores, encontre quem tenha poder maior ou igual a 95
-- Inteligência menor que 70
-- Resistência maior ou igual a 80
-- Apresente a Energia de Combate.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE e.nome = 'Vingadores'
    AND h.poder >= 95
    AND h.inteligencia < 70
    AND resistencia >= 80;

-- Missão 08: CONHECIMENTO MÍSTICO
-- Encontre um personagem sem equipe cadastrada
-- Inteligência maior ou igual a 95
-- Poder entre 90 e 99
-- A consulta deve utilizar as duas tabelas e mostrar também a equipe.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
LEFT JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE h.cod_equipe IS NULL
    AND h.inteligencia >= 95
    AND h.poder BETWEEN 90 AND 99;

-- Missão 09: PRECISÃO
-- Entre os integrantes dos Vingadores, encontre quem tenha poder entre 70 e 80
-- Velocidade maior ou igual a 85
-- Apresente a Energia de Combate.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE e.nome = 'Vingadores'
    AND h.poder BETWEEN 70 AND 80
    AND h.velocidade >= 85;

-- Missão 10: GÊNIO DE WAKANDA
-- Encontre um integrante de Wakanda
-- Inteligência maior ou igual a 95
-- Poder menor que 70
-- Apresente a Energia de Combate.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE e.nome = 'Wakanda'
    AND h.inteligencia >= 95
    AND h.poder < 70;

-- Missão 11: GUARDIÕES DA GALÁXIA
-- Procure entre os Guardiões da Galáxia um personagem que não tenha origem na Terra
-- Velocidade maior ou igual a 90
-- Poder maior ou igual a 80
-- Apresente a Energia de Combate.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
INNER JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE e.nome = 'Guardiões da Galáxia' 
    AND h.origem != 'Terra'
    AND h.velocidade >= 90
    AND h.poder >= 80;

-- Missão 12: PODER CÓSMICO
-- Encontre um personagem sem equipe cadastrada e de origem terrestre
-- Poder igual a 100
-- Velocidade igual a 100
-- A consulta deve apresentar também o nome da equipe, mesmo que não exista.

SELECT 
    h.nome AS heroi,
    e.nome AS equipe,
    (h.poder + h.inteligencia + h.resistencia) AS energia
FROM heroi h
LEFT JOIN equipe e ON h.cod_equipe = e.cod_equipe
WHERE h.cod_equipe IS NULL 
    AND h.origem = 'Terra'
    AND h.poder = 100
    AND h.velocidade = 100;
    
