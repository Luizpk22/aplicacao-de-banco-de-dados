USE `DB_04017C_LUIZHENRIQUE`;

DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS faixa_salarial;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2)
);

CREATE TABLE faixa_salarial (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);

-- Funcionários
INSERT INTO funcionarios (id_funcionario, nome_funcionario, salario) VALUES
(1, 'Ana', 1800.00),
(2, 'Bruno', 2500.00),
(3, 'Carlos', 3200.00),
(4, 'Daniela', 4500.00),
(5, 'Eduardo', 5200.00),
(6, 'Fernanda', 7000.00);

-- Faixas salariais
INSERT INTO faixa_salarial (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999);

-- QUESTÃO:
-- Problema: Agora, o RH quer um relatório que mostre o nome de cada funcionário e o seu nível salário (Júnior, Pleno ou Sênior), de acordo com o salário de cada um.
-- Tarefa: Escreva a consulta SQL que classifica cada funcionário usando BETWEEN.
-- RESPOSTA:
SELECT F.nome_funcionario AS Funcionário,
	   F.salario,
	   FS.nivel AS Nível_Salarial
FROM funcionarios F
JOIN faixa_salarial FS
ON F.salario BETWEEN FS.salario_min AND FS.salario_max;