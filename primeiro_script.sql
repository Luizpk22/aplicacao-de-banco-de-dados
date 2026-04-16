-- AULA DE NO EQUI JOIN
-- Selecionando o banco de dados
USE `DB_04017C_LUIZHENRIQUE`;

-- DROPANDO TABELEAS CASO JA EXISTAM
DROP TABLE IF EXISTS tb_clientes_score;

-- CRIANDO A TABELA DE CLIENTES
CREATE TABLE tb_clientes_score (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    score_credito INT
);

-- CRIANDO A TABELA DE FIAX DE SCORE
CREATE TABLE tb_faixa_score (
    faixa_id INT PRIMARY KEY,
    score_min INT,
    score_max INT,
    risco VARCHAR(20)
);

-- INSERINDO DADOS NA TABELA DE CLIENTES
INSERT INTO tb_clientes_score (cliente_id, nome, score_credito) VALUES
(1, 'João', 750),
(2, 'Maria', 520),
(3, 'Pedro', 890),
(4, 'Ana', 610);

-- INSERINDO DADOS NA TABELA DE SCORE
INSERT INTO tb_faixa_score (faixa_id, score_min, score_max, risco) VALUES
(1, 0, 599, 'Baixo'),
(2, 600, 799, 'Médio'),
(3, 800, 999, 'Alto');

-- CONSULTANDO AS TABELAS
SELECT * FROM tb_clientes_score;
SELECT * FROM tb_faixa_score;

-- CONSULTA COM NO EQUI JOIN
SELECT C.nome AS Cliente,
	   C.score_credito,
       F.risco
FROM tb_clientes_score AS C
JOIN tb_faixa_score AS F
ON C.score_credito BETWEEN F.score_min AND F.score_max;