USE `DB_04017C_LUIZHENRIQUE`;

DROP TABLE IF EXISTS departamentos;
DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS faixa_salarial;

CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

CREATE TABLE faixa_salarial (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);

-- Departamentos
INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Vendas'),
(5, 'Inovação');

-- Funcionários
INSERT INTO funcionarios (id_funcionario, nome_funcionario, salario, id_departamento) VALUES
(1, 'Ana', 1800.00, 1),
(2, 'Bruno', 2500.00, 4), -- Vendas (Pleno)
(3, 'Carlos', 3200.00, 2),
(4, 'Daniela', 4500.00, 4), -- Vendas (Pleno)
(5, 'Eduardo', 5200.00, 3),
(6, 'Fernanda', 7000.00, 4);

-- Faixas salariais
INSERT INTO faixa_salarial (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999);

-- QUESTÃO 03:
-- Problema: Para finalizar, o RH pediu uma lista específica: eles querem o nome de todos os funcionários do nível 'Pleno' que trabalham no departamento de 'Vendas'.
-- Tarefa: Escreva a consulta SQL para este filtro.
-- RESPOSTA:
SELECT F.nome_funcionario AS Funcionário,
	   F.salario AS Salário,
       D.nome_departamento AS Departamento,
       FS.nivel AS Nível
FROM funcionarios F
INNER JOIN departamentos D
ON F.id_departamento = D.id_departamento
JOIN faixa_salarial FS
ON F.salario BETWEEN FS.salario_min AND FS.salario_max
WHERE FS.nivel = 'Pleno' AND D.nome_departamento = 'Vendas';