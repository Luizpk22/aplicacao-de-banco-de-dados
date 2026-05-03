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

-- Exercício 01: Adicionar coluna de validade do produto
ALTER TABLE ProdutosPadaria ADD COLUMN validade DATE DEFAULT NULL;
-- Exercício 02: Aumentar o tamanho do nome do produto
ALTER TABLE ProdutosPadaria MODIFY COLUMN nome_produto VARCHAR(150) NOT NULL;
-- Exercício 03: Remover a coluna de validade
ALTER TABLE ProdutosPadaria DROP COLUMN validade;
-- Exercício 04: Adicionar uma coluna para categoria (ex: "Pães", "Bolos", etc.)
ALTER TABLE ProdutosPadaria ADD COLUMN categoria VARCHAR(50) DEFAULT NULL;
-- Exercício 05: Alterar o tipo da coluna Preco para aumentar precisão
ALTER TABLE ProdutosPadaria MODIFY COLUMN preco DECIMAL(10,3) NOT NULL;
-- Exercício 06: Excluir completamente a tabela Produtos
DROP TABLE ProdutosPadaria;