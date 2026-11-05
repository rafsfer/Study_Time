-- 1. Apresentar a quantidade de clientes da empresa.
SELECT COUNT(*) AS qtde_clientes FROM cliente;

-- 2. Apresentar a quantidade de produtos.
SELECT COUNT(*) AS qtde_produtos FROM produto;

-- 3. Apresentar a quantidade de vendas realizadas.
SELECT COUNT(*) AS qtde_vendas FROM venda;

-- 4. Apresentar a quantidade de clientes residentes em 'Lins'.
SELECT COUNT(*) AS qtde_clientes_lins FROM cliente
WHERE cidade = 'Lins';

-- 5. Apresentar a quantidade de funcionários com salário entre R$ 350,00 e R$ 500,00.
SELECT COUNT(*) AS qtde_funcionarios FROM funcionario
WHERE salario BETWEEN 350.00 AND 500.00;

-- 6. Apresentar a quantidade de produtos em falta (sem estoque).
SELECT COUNT(*) AS qtde_produtos_sem_estoque FROM produto
WHERE estoque = 0;

-- 7. Apresentar a quantidade de vendas realizadas pelo funcionário 'Alexandre'.
SELECT COUNT(*) AS qtde_vendas_alexandre
FROM venda v
INNER JOIN funcionario f ON v.cod_func = f.cod_func
WHERE f.nome LIKE 'Alexandre%';

-- 8. Apresentar o nome do funcionário e a quantidade de vendas realizadas por cada um.
SELECT f.nome, COUNT(v.cod_venda) AS qtde_vendas
FROM funcionario f
LEFT JOIN venda v ON f.cod_func = v.cod_func
GROUP BY f.nome
ORDER BY qtde_vendas DESC;

-- 9. Apresentar a quantidade de vendas realizadas para o cliente 'Diego'.
SELECT COUNT(*) AS qtde_vendas_diego
FROM venda v
INNER JOIN cliente c ON v.cod_cli = c.cod_cli
WHERE c.nome LIKE 'Diego%';

-- 10. Apresentar o nome do departamento e a quantidade de funcionários apenas dos departamentos que tenham pelo menos 3 funcionários.
SELECT d.nome, COUNT(*) AS qtde_funcionarios
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
GROUP BY d.nome
HAVING COUNT(*) >= 3;

-- 11. Apresentar o montante gasto com folha de pagamento.
SELECT SUM(salario) AS total_folha_pagamento
FROM funcionario;

-- 12. Apresentar a soma dos salários de todos os funcionários com cargo de 'gerente'.
SELECT SUM(salario) AS total_salarios_gerentes
FROM funcionario
WHERE cargo = 'Gerente';

-- 13. Apresentar o total gasto com salários pelo departamento de 'informática'.
SELECT SUM(f.salario) AS total_salarios_informatica
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
WHERE d.nome = 'Informática';

-- 14. Apresentar o faturamento bruto com a venda de 'notebook'.
SELECT SUM(i.qtde * p.preco) AS faturamento_notebook
FROM itens i
INNER JOIN produto p ON i.cod_prod = p.cod_prod
WHERE p.descricao LIKE 'notebook%';

-- 15. Apresentar cada produto e o respectivo faturamento bruto.
SELECT p.descricao, SUM(i.qtde * p.preco) AS faturamento_bruto
FROM produto p
INNER JOIN itens i ON p.cod_prod = i.cod_prod
GROUP BY p.descricao;

-- 16. Apresentar o nome de cada departamento e o respectivo valor gasto com folha de pagamento por setor.
SELECT d.nome AS departamento, SUM(f.salario) AS total_folha
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
GROUP BY d.nome;

-- 17. Apresentar o valor total da venda de número 1.
SELECT SUM(i.qtde * p.preco) AS total_venda_1
FROM itens i
INNER JOIN produto p ON i.cod_prod = p.cod_prod
WHERE i.cod_venda = 1;

-- 18. Apresentar o total de vendas (em reais) realizado pelo funcionário 'Marcelo'.
SELECT SUM(i.qtde * p.preco) AS total_vendas_marcelo
FROM venda v
INNER JOIN funcionario f ON v.cod_func = f.cod_func
INNER JOIN itens i ON v.cod_venda = i.cod_venda
INNER JOIN produto p ON i.cod_prod = p.cod_prod
WHERE f.nome LIKE 'Marcelo%';

-- 19. Apresentar o total de vendas (em reais) realizadas para a cliente 'Gabi'.
SELECT SUM(i.qtde * p.preco) AS total_vendas_gabi
FROM venda v
INNER JOIN cliente c ON v.cod_cli = c.cod_cli
INNER JOIN itens i ON v.cod_venda = i.cod_venda
INNER JOIN produto p ON i.cod_prod = p.cod_prod
WHERE c.nome LIKE 'Gabi%';

-- 20. Apresentar os produtos que tenham tido faturamento bruto superior a R$ 50.000,00.
SELECT p.descricao, SUM(i.qtde * p.preco) AS faturamento_bruto
FROM produto p
INNER JOIN itens i ON p.cod_prod = i.cod_prod
GROUP BY p.descricao
HAVING SUM(i.qtde * p.preco) > 50000.00;

-- 21. Apresentar o preço do produto mais caro.
SELECT MAX(preco) AS preco_mais_caro
FROM produto;

-- 22. Apresentar o valor do maior salário da empresa.
SELECT MAX(salario) AS maior_salario
FROM funcionario;

-- 23. Apresentar o valor do maior salário entre os funcionários do departamento de 'Marketing'.
SELECT MAX(f.salario) AS maior_salario_marketing
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
WHERE d.nome = 'Marketing';

-- 24. Apresentar o nome e o salário do funcionário mais bem remunerado da empresa.
SELECT nome, salario
FROM funcionario
WHERE salario = (SELECT MAX(salario) FROM funcionario);

-- 25. Apresentar o nome do último funcionário admitido pela empresa.
SELECT nome, data_admissao
FROM funcionario
WHERE data_admissao = (SELECT MAX(data_admissao) FROM funcionario);

-- 26. Apresentar a descrição e o preço do produto mais caro.
SELECT descricao, preco
FROM produto
WHERE preco = (SELECT MAX(preco) FROM produto);

-- 27. Apresentar o produto com maior estoque disponível.
SELECT descricao, estoque
FROM produto
WHERE estoque = (SELECT MAX(estoque) FROM produto);

-- 28. Apresentar o nome de cada departamento e o valor do maior salário de cada um.
SELECT d.nome AS departamento, MAX(f.salario) AS maior_salario
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
GROUP BY d.nome;

-- 29. Apresentar o nome e o salário do funcionário mais bem remunerado entre aqueles que trabalhem no departamento de 'Informática'.
SELECT f.nome, f.salario
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
WHERE d.nome = 'Informática'
  AND f.salario = (
      SELECT MAX(f2.salario)
      FROM funcionario f2
      INNER JOIN departamento d2 ON f2.cod_depto = d2.cod_depto
      WHERE d2.nome = 'Informática'
  );

-- 30. Apresentar o produto com o maior faturamento bruto.
SELECT p.descricao, SUM(i.qtde * p.preco) AS faturamento_bruto
FROM produto p
INNER JOIN itens i ON p.cod_prod = i.cod_prod
GROUP BY p.descricao
ORDER BY faturamento_bruto DESC
LIMIT 1;

-- 31. Apresentar o preço do produto mais barato.
SELECT MIN(preco) AS preco_mais_barato
FROM produto;

-- 32. Apresentar o valor do menor salário da empresa.
SELECT MIN(salario) AS menor_salario
FROM funcionario;

-- 33. Apresentar o valor do menor salário entre os funcionários do departamento de 'Marketing'.
SELECT MIN(f.salario) AS menor_salario_marketing
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
WHERE d.nome = 'Marketing';

-- 34. Apresentar o nome e o salário do funcionário mais mal remunerado da empresa.
SELECT nome, salario
FROM funcionario
WHERE salario = (SELECT MIN(salario) FROM funcionario);

-- 35. Apresentar o nome do primeiro funcionário admitido pela empresa.
SELECT nome, data_admissao
FROM funcionario
WHERE data_admissao = (SELECT MIN(data_admissao) FROM funcionario);

-- 36. Apresentar a descrição e o preço do produto mais barato.
SELECT descricao, preco
FROM produto
WHERE preco = (SELECT MIN(preco) FROM produto);

-- 37. Apresentar o nome de cada departamento e o valor do menor salário de cada um.
SELECT d.nome AS departamento, MIN(f.salario) AS menor_salario
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
GROUP BY d.nome;

-- 38. Apresentar o nome e o salário do funcionário mais mal remunerado entre aqueles que trabalhem no departamento de 'Informática'.
SELECT f.nome, f.salario
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
WHERE d.nome = 'Informática'
  AND f.salario = (
      SELECT MIN(f2.salario)
      FROM funcionario f2
      INNER JOIN departamento d2 ON f2.cod_depto = d2.cod_depto
      WHERE d2.nome = 'Informática'
  );

-- 39. Apresentar o produto com o menor faturamento bruto.
SELECT p.descricao, SUM(i.qtde * p.preco) AS faturamento_bruto
FROM produto p
INNER JOIN itens i ON p.cod_prod = i.cod_prod
GROUP BY p.descricao
ORDER BY faturamento_bruto ASC
LIMIT 1;

-- 40. Apresentar o departamento com a menor folha de pagamento.
SELECT d.nome AS departamento, SUM(f.salario) AS total_folha
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
GROUP BY d.nome
ORDER BY total_folha ASC
LIMIT 1;

-- 41. Apresentar o preço médio dos produtos.
SELECT AVG(preco) AS preco_medio
FROM produto;

-- 42. Apresentar o valor médio dos salários da empresa.
SELECT AVG(salario) AS media_salarial
FROM funcionario;

-- 43. Apresentar o valor médio dos salários dos gerentes.
SELECT AVG(salario) AS media_salario_gerentes
FROM funcionario
WHERE cargo = 'Gerente';

-- 44. Apresentar a média salarial dos funcionários, excluindo os gerentes.
SELECT AVG(salario) AS media_salarial_sem_gerentes
FROM funcionario
WHERE cargo != 'Gerente';

-- 45. Apresentar o valor médio de salário entre os funcionários do departamento de 'Marketing'.
SELECT AVG(f.salario) AS media_salario_marketing
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
WHERE d.nome = 'Marketing';

-- 46. Apresentar o nome e o salário dos funcionários acima da média salarial da empresa.
SELECT nome, salario
FROM funcionario
WHERE salario > (SELECT AVG(salario) FROM funcionario);

-- 47. Apresentar a descrição e o preço dos produtos abaixo da média de preços entre os produtos.
SELECT descricao, preco
FROM produto
WHERE preco < (SELECT AVG(preco) FROM produto);

-- 48. Apresentar o nome de cada departamento e o valor médio de salário de cada um.
SELECT d.nome AS departamento, AVG(f.salario) AS media_salarial
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
GROUP BY d.nome;

-- 49. Apresentar o nome e o salário dos funcionários que recebem abaixo da média entre aqueles que trabalhem no departamento de 'Informática'.
SELECT f.nome, f.salario
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.cod_depto
WHERE d.nome = 'Informática'
  AND f.salario < (
      SELECT AVG(f2.salario)
      FROM funcionario f2
      INNER JOIN departamento d2 ON f2.cod_depto = d2.cod_depto
      WHERE d2.nome = 'Informática'
  );

-- 50. Apresentar a média de faturamento bruto dos produtos.
SELECT AVG(sub.faturamento) AS media_faturamento_produtos
FROM (
    SELECT SUM(i.qtde * p.preco) AS faturamento
    FROM produto p
    INNER JOIN itens i ON p.cod_prod = i.cod_prod
    GROUP BY p.cod_prod
) sub;