USE DB_04017C_LUIZHENRIQUE;

DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Fornecedores;

CREATE TABLE Fornecedores (
	ID_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Produtos (
	ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Compra DATE NOT NULL,
    Quantidade_Comprada INT NOT NULL,
    Valor_Total_Compra DECIMAL(10,2) NOT NULL,
    Estoque_Atual INT NOT NULL,
    ID_Fornecedor INT,
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedores (ID_Fornecedor)
);

INSERT INTO Fornecedores (Nome)
VALUES
	('Fornecedor 1'),
    ('Fornecedor 2'),
    ('Fornecedor 3'),
    ('Fornecedor 4'),
    ('Fornecedor 5'),
    ('Fornecedor 6'),
    ('Fornecedor 7'),
    ('Fornecedor 8');

INSERT INTO Fornecedores (Nome)
VALUE ('Fornecedor 9');
    
INSERT INTO Produtos (Nome, Data_Compra, Quantidade_Comprada, Valor_Total_Compra, Estoque_Atual, ID_Fornecedor)
VALUES
	('Produto 1', '2026-05-03', 100, 1200.00, 200, 1),
    ('Produto 2', '2026-06-03', 50, 200.00, 300, 2),
    ('Produto 3', '2026-01-03', 20, 100.00, 200, 3),
    ('Produto 4', '2026-05-05', 30, 150.00, 200, 3),
    ('Produto 5', '2026-05-03', 400, 2200.00, 600, 5),
    ('Produto 6', '2026-02-07', 6, 270.00, 20, 4),
    ('Produto 7', '2026-05-03', 89, 200.00, 100, 6),
    ('Produto 7', '2026-03-07', 214, 5670.00, 560, 7),
    ('Produto 3', '2026-05-03', 2, 1250.00, 202, 8),
    ('Produto 8', '2026-06-02', 53, 870.00, 200, 1),
    ('Produto 9', '2026-03-01', 631, 6720.00, 200, 2);

-- Exercício 01: Exibir o nome dos produtos e o nome do fornecedor de cada um
SELECT A.Nome AS Produto,
	   B.Nome AS Fornecedor
FROM Produtos AS A
INNER JOIN Fornecedores AS B
ON A.ID_Fornecedor = B.ID_Fornecedor;
-- Exercício 02: Listar os produtos vendidos com suas quantidades e data da venda
SELECT Nome,
	   Data_Compra,
       Quantidade_Comprada
FROM Produtos;
-- Exercício 03: Ver o nome do produto, valor total da venda e nome do fornecedor	
SELECT A.Nome AS Produto,
	   A.Valor_Total_Compra AS Valor_Total,
       B.Nome AS Fornecedor
FROM Produtos A
INNER JOIN Fornecedores B
ON A.ID_Fornecedor = B.ID_Fornecedor;
-- Exercício 04: Exibir produtos com estoque abaixo de 30 unidades e seus fornecedores
SELECT A.Nome AS Produto,
	   A.Estoque_Atual AS Estoque,
       B.Nome AS Fornecedor
FROM Produtos A
INNER JOIN Fornecedores B
ON A.ID_Fornecedor = B.ID_Fornecedor
WHERE A.Estoque_Atual < 30;