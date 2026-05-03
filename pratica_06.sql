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

-- Exercício 01: Mostrar Nome dos produtos em MAIÚSCULAS
SELECT UPPER(nome_produto),
	   preco,
       estoque
FROM ProdutosPadaria;
-- Exercício 02: Mostrar Nome dos produtos em minúsculas
SELECT LOWER(nome_produto) AS Nome_Minuscula,
	   preco AS Preço,
       estoque
FROM ProdutosPadaria;
-- Exercício 03: Mostrar Quantidade de letras no nome do produto
SELECT nome_produto AS Produto,
	   LENGTH(nome_produto) AS Qtde_Letras,
       preco AS Preço,
       estoque AS Estoque
FROM ProdutosPadaria;
-- Exercício 04: Mostrar as Três primeiras letras do nome do produto
SELECT nome_produto AS Produto,
	   LEFT(nome_produto, 3) AS Primeiras_Letras,
       preco AS Preço,
       estoque as Estoque
FROM ProdutosPadaria;
-- Exercício 05: Mostrar Preço arredondado para o inteiro mais próximo
SELECT nome_produto AS Produto,
	   ROUND(preco, 0) AS Preço_Arredondado,
       estoque AS Estoque
FROM ProdutosPadaria;
-- Exercício 06: Exibir data atual junto com os produtos
SELECT nome_produto AS Produto,
	   CURDATE() AS Data_Atual,
	   CURTIME() AS Hora_Atual
FROM ProdutosPadaria;