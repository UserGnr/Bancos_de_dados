CREATE DATABASE db_ex4;

CREATE TABLE tipos_produto(
 	codigo SERIAL PRIMARY KEY,
	descricao VARCHAR(30) NOT NULL
);

CREATE TABLE produtos(
	codigo SERIAL PRIMARY KEY, 
	descricao VARCHAR(30) NOT NULL,
 	preco MONEY NOT NULL,
	codigo_tipo INT REFERENCES tipos_produto(codigo) NOT NULL
);

INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', '300', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', '500', 2);

-- ALTER
ALTER TABLE tipos_produto ADD peso DECIMAL(8,2);

-- Verificar se o novo campo foi realmente adicionado
SELECT * FROM tipos_produto;


-- DROP (Não irá permitir deletar a tabela por conter um relacionamento com produdos)
DROP TABLE tipos_produto;
-- Mas podemos deletar todo o banco de dados
DROP DATABASE db_ex4;
