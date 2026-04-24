USE DB_04017C_LUIZHENRIQUE;

-- ESTRUTURA DE CREATE TABLE
CREATE TABLE ProdutosPadaria (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    preco DECIMAL(10,2),
    data_cadastro DATE
);
 
-- ESTRUTURA DE INSERT
INSERT INTO ProdutosPadaria (nome_produto, preco, data_cadastro) VALUES
('Pão Francês', 0.85, '2026-04-20'),
('Bolo de Chocolate', 25.90, '2026-04-18'),
('Coxinha', 6.50, '2026-04-19'),
('Sonho', 7.25, '2026-04-21'),
('Pão de Queijo', 1.50, '2026-04-22'),
('Croissant', 8.75, '2026-04-20');

-- Exercícios: Uso de Funções
SELECT UPPER(nome_produto) AS PRODUTO_MAIUSCULAS,
	   LOWER(nome_produto) AS PRODUTO_MINUSCULAS,
       LENGTH(nome_produto) AS QTDE_LETRAS_NOME,
       LEFT(nome_produto, 3) AS TRES_PRIMEIRAS_LETRAS,
       CEIL(preco) AS PRECO_ARRENDONDADO,
       CONCAT(nome_produto, ' - ', CURRENT_TIMESTAMP()) AS PRODUTO_E_DATA
FROM ProdutosPadaria;