-- ENCONTRO 18
USE `DB_04017C_LUIZHENRIQUE`;
-- DESAFIO - 01
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

-- Departamentos
INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Marketing'),
(5, 'Inovação'); -- sem funcionários

-- Funcionários
INSERT INTO funcionarios (id_funcionario, nome_funcionario, id_departamento) VALUES
(1, 'Ana', 1),
(2, 'Bruno', 1),
(3, 'Carlos', 2),
(4, 'Daniela', 3),
(5, 'Eduardo', 3),
(6, 'Fernanda', 4);

-- QUESTÃO:
-- Problema: O RH precisa de relatório que liste TODOS os departamentos e quem trabalha em cada um. Lembre-se que o departamento 'Inovação' ainda não tem funcionários!
-- Tarefa: Escreva a consulta SQL que gera este relatório. O nome do funcionário deve aparecer como NULL para o departamento sem funcionários.
-- RESPOSTA:
SELECT D.nome_departamento AS Departamento,
	   F.nome_funcionario AS Funcionario
FROM departamentos D
LEFT JOIN funcionarios F
ON F.id_departamento = D.id_departamento;