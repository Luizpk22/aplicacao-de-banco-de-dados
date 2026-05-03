USE DB_04017C_LUIZHENRIQUE;

CREATE TABLE TB_CONTATOS (
  id_contato int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome varchar(100) NOT NULL,
  telefone varchar(11) NOT NULL UNIQUE KEY,
  email varchar(50) NOT NULL UNIQUE KEY
);

CREATE TABLE TB_GRUPO_CONTATOS (
  id_grupo int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  grupo varchar(100) DEFAULT NULL,
  integrantes text
);

CREATE TABLE TB_TELEFONES (
  telefone varchar(11) NOT NULL UNIQUE KEY,
  id_contato int DEFAULT NULL,
  FOREIGN KEY (id_contato) REFERENCES TB_CONTATOS (id_contato)
);

INSERT INTO TB_CONTATOS (nome, telefone, email)
VALUES
	('João', '11912345678', 'adcd@gmail.com'),
	('Maria', '11998765432', 'efgh@gmail.com'),
	('Pedro', '11925871236', 'pedro@gmail.com');
    
INSERT INTO TB_GRUPO_CONTATOS (grupo, integrantes)
VALUES
	('Família', 'João, Maria');

INSERT INTO TB_TELEFONES (telefone, id_contato)
VALUES
	('11912345678', 1),
	('11998765432', 2),
	('11925871236', 3);

SELECT * FROM TB_CONTATOS;
SELECT * FROM TB_GRUPO_CONTATOS;
SELECT * FROM TB_TELEFONES;