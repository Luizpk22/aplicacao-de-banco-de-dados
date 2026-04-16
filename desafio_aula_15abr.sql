-- Respondendo ao desafio da aula
USE `DB_04017C_LUIZHENRIQUE`;

-- ESTRUTURA PARA RESPONDER AS PERGUNTAS DO DESAFIO.
-- Tabela de Produtos
DROP TABLE IF EXISTS produtos;
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela de Vendas
DROP TABLE IF EXISTS vendas;
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    quantidade INT NOT NULL,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Tabela faixa de preço
DROP TABLE IF EXISTS faixa_preco;
CREATE TABLE faixa_preco (
    id_faixa INT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    preco_min DECIMAL(10,2) NOT NULL,
    preco_max DECIMAL(10,2)
);

-- DADOS DO EXERCÍCIO
-- Inserindo Produtos
INSERT INTO produtos (id_produto, nome, preco) VALUES
(1, 'Caderno', 10.00),
(2, 'Caneta', 2.50),
(3, 'Mochila', 120.00),
(4, 'Notebook', 3500.00),
(5, 'Mouse', 80.00),
(6, 'Teclado', 150.00),
(7, 'Garrafa', 25.00),
(8, 'Livro', 60.00),
(9, 'Fone de Ouvido', 250.00),
(10, 'Calculadora', 90.00);

-- Inserindo Vendas
INSERT INTO vendas (id_venda, id_produto, quantidade, data_venda) VALUES
(1, 1, 3, '2025-08-01'),
(2, 2, 10, '2025-08-02'),
(3, 3, 1, '2025-08-02'),
(4, 5, 2, '2025-08-03'),
(5, 1, 1, '2025-08-04'),
(6, 9, 4, '2025-08-04'),
(7, 10, 1, '2025-08-05'),
(8, 2, 5, '2025-08-05'),
(9, 5, 1, '2025-08-06'),
(10, 8, 2, '2025-08-07');

-- Tabela faixa de preço
INSERT INTO faixa_preco (id_faixa, descricao, preco_min, preco_max) VALUES
(1, 'Barato', 0.00, 50.00),
(2, 'Intermediário', 50.01, 500.00),
(3, 'Caro', 500.01, 5000.00);

-- RESPOSTAS DOS DESAFIOS
-- DESAFIO 01 - Listas todos os produtos disponíveis, mostrando quantas vezes cada um foi vendido - mesmo que nunca tenha sido vendido.
SELECT * FROM produtos P
LEFT JOIN vendas V
ON P.id_produto = V.id_produto;

-- DESAFIO 02 - Classificar os produtos em categorias de preço.
SELECT P.id_produto,
	   P.nome AS Produto,
       P.preco,
       F.descricao AS Categoria
FROM produtos P
JOIN faixa_preco F
ON P.preco BETWEEN F.preco_min AND F.preco_max;