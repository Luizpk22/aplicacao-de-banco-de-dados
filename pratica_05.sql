USE DB_04017C_LUIZHENRIQUE;

CREATE TABLE ProdutosPadaria (
  id_produto int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome_produto varchar(100) DEFAULT NULL,
  preco decimal(10,2) DEFAULT NULL,
  data_cadastro date DEFAULT NULL,
  estoque INT
);

INSERT INTO ProdutosPadaria (nome_produto, preco, data_cadastro)
VALUES
	('Pão Francês', 0.85, '2026-04-20', 10),
	('Bolo de Chocolate', 25.90, '2026-04-18', 341),
	('Coxinha', 6.50, '2026-04-19', 52),
	('Sonho', 7.25, '2026-04-21', 541),
	('Pão de Queijo', 1.50, '2026-04-22', 612),
	('Croissant', 8.75, '2026-04-20', 6123);
    
-- Exercício 01: Mostrar Produtos com preço acima de R$5,00
SELECT *
FROM ProdutosPadaria
WHERE preco > 5.00;
-- Exercício 02: Mostrar Produtos com nome contendo “Bolo”
SELECT *
FROM ProdutosPadaria
WHERE nome_produto LIKE '%Bolo%';
-- Exercício 03: Mostrar Produtos com estoque abaixo de 20 unidades
SELECT *
FROM ProdutosPadaria
WHERE estoque < 20;
-- Exercício 04: Mostrar Produtos entre R$3,00 e R$10,00
SELECT *
FROM ProdutosPadaria
WHERE preco BETWEEN 3.00 AND 10.00;
-- Exercício 05: Mostrar Produtos que começam com "Pão"
SELECT *
FROM ProdutosPadaria
WHERE nome_produto LIKE 'Pão%';
-- Exercício 06: Mostrar Produtos com nome "Croissant" e estoque maior que 30
SELECT *
FROM ProdutosPadaria
WHERE nome_produto LIKE '%Croissant%' AND estoque > 30;