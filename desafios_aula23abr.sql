USE DB_04017C_LUIZHENRIQUE;

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100),
    produto VARCHAR(100),
    valor DECIMAL(10,2),
    desconto DECIMAL(10,2),
    forma_pagamento VARCHAR(50)
);

INSERT INTO Pedidos (nome_cliente, produto, valor, desconto, forma_pagamento) VALUES
('Ana Silva', 'Notebook', 3500.00, 200.00, 'Cartão'),
('Bruno Lima', 'Mouse', 80.00, NULL, 'Pix'),
('Carlos Souza', 'Teclado', 150.00, 0.00, 'Boleto'),
('Daniela Rocha', 'Monitor', 1200.00, 100.00, 'Cartão'),
('Eduardo Mendes', 'Headset', 300.00, NULL, 'Pix'),
('Fernanda Alves', 'Cadeira Gamer', 900.00, 50.00, 'Boleto'),
('Gabriel Costa', 'Webcam', 250.00, 0.00, 'Cartão'),
('Helena Martins', 'Notebook', 4000.00, NULL, 'Cartão'),
('Igor Santos', 'Mouse Pad', 40.00, 5.00, 'Pix');

-- Exercício 1
SELECT nome_cliente AS CLIENTE,
	   valor as VALOR,
       IF(valor > 1000, 'Alto', 'Baixo') AS CLASSIFICACAO_VALOR
FROM Pedidos
ORDER BY 2;

-- Exercício 2
SELECT nome_cliente AS CLIENTE,
	   forma_pagamento AS MODALIDADE_PAGAMENTO,
       IF(forma_pagamento = 'Pix', 'À Vista', 'Parcelado') AS FORMA_PAGAMENTO
FROM Pedidos
ORDER BY 1;

-- Exercício 3
SELECT *,
	CASE
		WHEN valor < 100 THEN 'Muito barato'
		WHEN valor <= 500 THEN 'Médio'
		WHEN valor <= 2000 THEN 'Caro'
		ELSE 'Muito caro'
	END AS CLASSIFICACAO_PEDIDO
FROM Pedidos
ORDER BY 4;

-- Exercício 4
SELECT *,
	CASE
		WHEN produto IN ('Notebook', 'Mouse', 'Teclado', 'Webcam') THEN 'Informática'
        WHEN produto IN ('Cadeira Gamer') THEN 'Móveis'
        ELSE 'Outros'
	END AS categoria_produto
FROM Pedidos;

-- Exercício 5
SELECT nome_cliente AS CLIENTE,
	   IFNULL(desconto, 0) AS DESCONTO
FROM Pedidos;