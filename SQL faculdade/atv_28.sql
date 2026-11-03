create database atv_28;
use atv_28;

CREATE TABLE categoria (
  cod_cat int NOT NULL,
  descricao varchar(50) DEFAULT NULL,
  PRIMARY KEY (cod_cat)
);

CREATE TABLE cliente (
  cod_cli int NOT NULL,
  nome varchar(150) DEFAULT NULL,
  endereco varchar(150) DEFAULT NULL,
  cidade varchar(100) DEFAULT NULL,
  telefone varchar(20) DEFAULT NULL,
  data_nasc date DEFAULT NULL,
  PRIMARY KEY (cod_cli)
);

CREATE TABLE departamento (
  cod_depto int NOT NULL,
  nome varchar(30) DEFAULT NULL,
  ramal varchar(10) DEFAULT NULL,
  PRIMARY KEY (cod_depto)
);

CREATE TABLE funcionario (
  cod_func int NOT NULL,
  cod_depto int DEFAULT NULL,
  nome varchar(40) DEFAULT NULL,
  salario decimal(8,2) DEFAULT NULL,
  cargo varchar(50) DEFAULT NULL,
  data_admissao date DEFAULT NULL,
  PRIMARY KEY (cod_func),
  KEY cod_depto (cod_depto),
  CONSTRAINT funcionario_ibfk_1 FOREIGN KEY (cod_depto) REFERENCES departamento (cod_depto)
);

CREATE TABLE itens (
  cod_venda int NOT NULL,
  cod_prod int NOT NULL,
  qtde int DEFAULT NULL,
  PRIMARY KEY (cod_venda, cod_prod),
  KEY cod_prod (cod_prod),
  CONSTRAINT itens_ibfk_1 FOREIGN KEY (cod_venda) REFERENCES venda (cod_venda),
  CONSTRAINT itens_ibfk_2 FOREIGN KEY (cod_prod) REFERENCES produto (cod_prod)
);

CREATE TABLE produto (
  cod_prod int NOT NULL,
  descricao varchar(200) NOT NULL,
  preco decimal(8,2) DEFAULT NULL,
  cod_cat int DEFAULT NULL,
  PRIMARY KEY (cod_prod),
  KEY cod_cat (cod_cat),
  CONSTRAINT produto_ibfk_1 FOREIGN KEY (cod_cat) REFERENCES categoria (cod_cat)
);

CREATE TABLE venda (
  cod_venda int NOT NULL,
  data date DEFAULT NULL,
  cod_func int DEFAULT NULL,
  cod_cli int DEFAULT NULL,
  PRIMARY KEY (cod_venda),
  KEY cod_func (cod_func),
  KEY cod_cli (cod_cli),
  CONSTRAINT venda_ibfk_1 FOREIGN KEY (cod_func) REFERENCES funcionario (cod_func),
  CONSTRAINT venda_ibfk_2 FOREIGN KEY (cod_cli) REFERENCES cliente (cod_cli)
);

INSERT INTO categoria VALUES 
(1,'Informática'),
(2,'Material de Escritório'),
(3,'Eletroeletrônico'),
(4,'Rede'),
(5,'Embalagens'),
(6,'Alimentos');

INSERT INTO cliente VALUES 
(1,'Giovana Calsavari','Rua 1','Lins','14985631245','1990-05-12'),
(2,'Francisco Silva','Rua 2','Guaiçara','(14) 3533-3298','1990-01-10'),
(3,'Paulo Pereira','Rua 3','Promissão','149215469874','2000-04-25'),
(4,'Daniella Dantas','Rua 5','Cafelândia','14984521458','2000-11-19'),
(5,'Sergio Nogueira','Rua 7','São Paulo','11945213654','2012-03-11'),
(6,'Claudia Nóbrega','Rua Floriano Peixoto','Lins','14987459874','1996-07-30'),
(7,'José Raimundo','Rua Pedro de Toledo','Lins','14997451478','2003-08-14'),
(8,'João Paulo Duarte','Rua Antonio Buzinaro','Guaiçara','14999874587','1985-12-03'),
(9,'Ana Maria Dutra','Rua José do Parocínio','Guaiçara','149123568977','2006-02-28'),
(10,'Pietra Silveira','Rua 3','Promissão','14991249852','2015-06-06');

INSERT INTO departamento VALUES (1,'Marketing','111'),(2,'Produção','222'),(3,'Informática','333'),(4,'Vendas','444'),(5,'Financeiro','555');

INSERT INTO funcionario VALUES (1,1,'Luiz Oliveira',4500.00,'Gerente','2023-08-15'),(2,4,'Paulo Correia',2386.99,'Representante comercial','2022-01-22'),(3,2,'Luiza Souza',1284.30,'Auxiliar de produção','2025-01-21'),(4,2,'Laura Andrade',1142.90,'Operador de Máquina','2024-08-05'),(5,2,'Adalberto Rodrigues',2169.82,'Supervisor de Linha','2023-07-09'),(6,2,'Maria Beatriz Ferreira',1387.85,'Abastecedor de linha de produção','2022-09-28'),(8,1,'Julio Ribeiro',2987.41,'Administrador de marketing','2023-04-16'),(9,1,'Rafael Santana',2143.74,'Analista de marketing','2025-05-03'),(10,1,'Bianca Araújo',1623.40,'Atendente de telemarketing','2024-10-30'),(11,3,'Augusto Viana',5789.40,'Engenheiro de software','2024-11-16'),(12,3,'Barbara Lima',3841.50,'Consultor de tecnologia da informação','2023-12-17'),(13,3,'Durval Rossi',3268.40,'Analista de sistemas','2018-02-25'),(14,3,'Camila Machado',3312.80,'Analista de sistemas para internet','2017-12-04'),(15,4,'Artur Lopes',1841.20,'Consultor de vendas','2021-10-18'),(16,4,'Daniela Camargo',1547.60,'Promotor de vendas','2020-03-27'),(17,4,'Elaine Batista',1347.20,'Técnico de vendas','2025-01-16'),(18,2,'Mário Barbosa',5123.60,'Diretor','2018-01-25'),(19,NULL,'Daniel Mendes',6125.50,'Gerente de TI','2024-06-21');

INSERT INTO itens VALUES (1,2,10),(1,10,2),(1,15,5),(2,8,2),(2,14,3),(2,19,1);

INSERT INTO produto VALUES (1,'caneta',200.00,NULL),
(2,'lápis',200.00,NULL),
(3,'Fone de ouvido',200.00,2),
(4,'Grampeador',18.38,2),
(5,'Planner semanal 60 fls',10.92,2),
(6,'Cola em bastão 40g',12.18,2),
(7,'Fragmentadora de papel',229.43,3),
(8,'Nobreak Senoidal Atrium 3000va',6647.39,1),
(9,'HD externo 2tb usb portátil',629.37,1),
(10,'Câmera webcam USB 1080p',418.43,1),
(11,'Kit wireless (teclado/mouse)',314.37,1),
(12,'Cadeira Gamer',1983.03,2),
(13,'Monitor Gamer LED 29 Ultrawide',1678.98,1),
(14,'Mouse Gamer usb 3200 Dpi',NULL,1),
(15,'Impressora Multifuncional Tanque de Tinta',1321.53,1),
(16,'Impressora laser Monocromática',896.28,1),
(17,'Notebook Core i5, 8GB de Memória, 256GB SSD de Armazenamento, Tela de 15\"',4287.73,1),
(18,'Smartphone com Android 10, 64GB de Armazenamento, Câmera de 8MP, Tela de 6,4\"',1133.38,3),
(19,'Suporte veicular p/ Smartphone com ventosa',62.48,2),
(20,'Impressora térmica não fiscal USB / Serial',NULL,1),
(21,'Leitor de código de barras CCD preto',179.03,1),
(22,'Mesa digitalizadora pequena',357.58,1),
(23,'Cartão de memória micro SD 32gb',151.10,1),
(24,'Drone',712.01,3),
(25,'Lápis de Cor 12 cores sextavado',18.48,2),
(26,'Pincel marca texto pastel 6 cores',22.89,2),
(27,'Marcador Quadro Branco 3 Cores',16.17,2),
(28,'Caneta Hidrográfica, 12 cores',NULL,2),
(29,'Corretivo líquido 18ml',5.04,2),
(30,'Pen Drive 16gb USB 2.0',26.67,1),
(31,'Roteador wireless 4 portas Dual Band',398.37,4),
(32,'Switch 24 portas 10/100/1000 não gerenciável',786.87,4),
(34,'Grampeador grande 23/8 até 240fl',189.90,2);

INSERT INTO venda VALUES (1,'2025-09-10',11,2),(2,'2025-09-06',11,9);

#1 Apresentar o ramal telefônico do departamento de 'produção'.
select ramal
from departamento
where cod_depto = 2;

#2 Apresentar o nome dos funcionários que ocupem o cargo de 'gerente'.
select nome
from funcionario
where cargo = 'Gerente';

#3. Apresentar os funcionários que tenham sido admitidos até a data de '25/10/2004'.
select nome, cargo
from funcionario
where data_admissao <= '2004-10-25';

#4. Apresentar os funcionários que tenham sido admitidos entre '01/01/2019' e '31/12/2022'.
select nome, cargo, data_admissao
from funcionario
where year(data_admissao) between 2019 and 2022;

#5. Apresentar os clientes da cidade de 'Lins'.
select nome, cidade
from cliente
where cidade = 'Lins';

#6. Apresentar os produtos cuja descrição inicie com 'di'.
select descricao
from produto 
where lower(descricao) like 'di%';

#7. Apresentar o preço e o estoque atual do produto 'pen drive'.
select cod_prod, descricao, preco
from produto
where lower(descricao) like '%pen drive%';

#8. Apresentar os produtos com estoque abaixo de 5 unidades.
select p.cod_prod, p.descricao, coalesce(sum(i.qtde), 0) as total_vendido
from produto p
left join itens i on p.cod_prod = i.cod_prod
group by p.cod_prod, p.descricao
having coalesce(sum(i.qtde), 0) < 5;

#9. Apresentar o número das vendas realizadas no dia '27/09/2023'.
select count(cod_venda) as total_vendas
from venda
where data = '2023-09-27';

#10. Apresentar o número das vendas realizadas no mês de 'agosto de 2022'.
select cod_venda, data
from venda
where month(data) = 8 and year(data) = 2022;

#11. Apresentar os dias em que a cliente 'Paula' teve registros na tabela de vendas.
select distinct c.nome, v.data
from cliente c
inner join venda v on c.cod_cli = v.cod_cli
where lower(c.nome) like '%paula%';

#12. Apresentar o nome dos clientes que tiveram registros na tabela de vendas no dia '17/02/2021'.
select c.nome, v.data
from cliente c
inner join venda v on c.cod_cli = v.cod_cli
where v.data = '2021-02-17';

#13. Apresentar o nome dos clientes residentes em 'Lins' que realizaram pedidos no dia de hoje.
select c.nome, c.cidade
from cliente c
inner join venda v on c.cod_cli = v.cod_cli
where c.cidade like '%Lins%' and v.data = current_date();

#14. Apresentar o nome e telefone dos clientes que tenham realizado pedidos no ano de '2023'.
select distinct c.nome, c.telefone
from cliente c
inner join venda v on c.cod_cli = v.cod_cli
where year(v.data)= 2023;

#15. Apresentar o nome dos funcionários que realizaram vendas no dia de hoje.
select distinct f.nome
from funcionario f
inner join venda v on f.cod_func = v.cod_func
where v.data= current_date();

#16. Apresentar o nome, cargo e salário dos funcionários que trabalham no departamento de 'contabilidade'.
select f.nome, f.cargo, f.salario, d.nome
from funcionario f 
inner join departamento d on f.cod_depto = d.cod_depto
where d.nome like '%contabilidade%';

#17. Apresentar os funcionários do departamento de 'informática' admitidos no mês de 'janeiro de 2023'.
select f.nome, d.nome as nome_depto
from funcionario f 
inner join departamento d on f.cod_depto = d.cod_depto
where lower(d.nome) like '%informática%' and month(f.data_admissao)= 1 and year(f.data_admissao)=2023;

#18. Apresentar o nome do departamento e o ramal telefônico no qual trabalha o funcionário 'Carlos'.
select f.nome, d.nome as nome_depto, d.ramal
from funcionario f 
inner join departamento d on f.cod_depto = d.cod_depto
where lower(f.nome) like '%carlos%';

#19. Apresentar os produtos com preço entre R$ 1,50 e R$ 3,00 que tenham sido comercializados no dia 11/10/2023'.
select distinct p.cod_prod, p.descricao, p.preco
from produto p
inner join itens i on p.cod_prod = i.cod_prod
inner join venda v on i.cod_venda = v.cod_venda
where p.preco between 1.50 and 3.00 and v.data = '2023-10-11';

#20. Apresentar os clientes com sobrenome 'Silva' que tenham registros na tabela de vendas hoje.
select distinct c.nome, v.data
from cliente c
inner join venda v on c.cod_cli = v.cod_cli
where c.nome like '%Silva%' and v.data = current_date();

#21. Apresentar a descrição do produto, preço unitário e quantidade dos itens solicitados referentes à venda de número 1.
select p.descricao, p.preco, i.qtde as quantidade
from produto p
inner join itens i on p.cod_prod = i.cod_prod
where i.cod_venda = 1;

#22. Apresentar a descrição, preço, quantidade e subtotal dos itens da venda de número 1.
select p.descricao, p.preco, i.qtde as quantidade, (p.preco * i.qtde) as subtotal
from produto p
inner join itens i on p.cod_prod = i.cod_prod
where i.cod_venda = 1;

#23. Apresentar os clientes que tenham comprado 'notebook'.
select distinct c.cod_cli, c.nome
from cliente c
inner join venda v on v.cod_cli = c.cod_cli
inner join itens i on i.cod_venda = v.cod_venda
inner join produto p on p.cod_prod = i.cod_prod
where lower(p.descricao) like '%notebook%';

#24. Apresentar os clientes que tenham comprado 'caneta', 'caderno' ou 'lapiseira' no mês de 'fevereiro de 2022'.
select distinct c.cod_cli, c.nome
from cliente c
inner join venda v on v.cod_cli = c.cod_cli
inner join itens i on i.cod_venda = v.cod_venda
inner join produto p on p.cod_prod = i.cod_prod
where ( lower(p.descricao) like '%caneta%' or lower(p.descricao) like '%caderno%' or lower(p.descricao) like '%lapiseira%')
and month(v.data) = 2 and year(v.data) = 2022;

#25. Apresentar os produtos que já foram comprados pelo cliente ‘Guilherme'.
select distinct p.descricao
from produto p
inner join itens i on i.cod_prod = p.cod_prod
inner join venda v on v.cod_venda = i.cod_venda
inner join cliente c on c.cod_cli = v.cod_cli
where lower(c.nome) like '%guilherme%';

#26. Apresentar o nome de todos os clientes que já tenham comprado o produto ‘Impressora’.
select distinct c.nome
from cliente c 
inner join venda v on v.cod_cli = c.cod_cli
inner join itens i on i.cod_venda = v.cod_venda
inner join produto p on p.cod_prod = i.cod_prod
where lower(p.descricao) like '%impressora%';

#27. Apresentar os clientes que já foram atendidos pela funcionária 'Andrea'.
select distinct c.nome, f.nome as funcionario
from cliente c
inner join venda v on v.cod_cli = c.cod_cli
inner join funcionario f on f.cod_func = v.cod_func
where lower(f.nome) like '%andrea%';

#28. Apresentar o nome dos funcionários que já atenderam a cliente ‘Paola'.
select distinct f.nome
from funcionario f
inner join venda v on v.cod_func = f.cod_func
inner join cliente c on c.cod_cli = v.cod_cli
where lower(c.nome) like '%paola%';

#29. Apresentar os produtos vendidos pelo vendedor 'Ricardo'.
select distinct p.descricao
from produto p 
inner join itens i on i.cod_prod = p.cod_prod
inner join venda v on v.cod_venda = i.cod_venda
inner join funcionario f on f.cod_func = v.cod_func
where lower(f.nome) like '%ricardo%';

#30. Apresentar os clientes de 'Cafelândia' para os quais tenha sido vendido 'teclado' em ‘setembro de 2023'.
select distinct c.nome, c.cidade
from cliente c 
inner join venda v on v.cod_cli = c.cod_cli
inner join itens i on i.cod_venda = v.cod_venda
inner join produto p on p.cod_prod = i.cod_prod
where (lower(c.cidade) like '%cafelandia%') and (lower(p.descricao) like '%teclado%') and month(v.data)= 9 and year(v.data) = 2023;
