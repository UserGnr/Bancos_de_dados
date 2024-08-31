CREATE DATABASE db_ex3;

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


-- UPDATE
UPDATE tipos_produto SET descricao = 'Nobreak' WHERE codigo = 2;
UPDATE produtos set descricao = 'Notebook', preco = '2800' WHERE codigo = 2;
-- Cuidado com o UPDATE sem o uso do WHERE
-- O pgAdmin4 permite o uso do UPDATE sem o WHERE:
-- UPDATE produtos SET descricao = 'Notebook', preco = '2800';

-- DELETE
DELETE FROM tipos_produto WHERE codigo = 1;
DELETE FROM produtos WHERE codigo = 2;
-- Cuidado com o DELETE sem o uso do WHERE
-- O pgAdmin4 permite o uso do DELETE sem o WHERE:
-- DELETE FROM produtos;
