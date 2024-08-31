-- CREATE
CREATE DATABASE db_ex7;

CREATE TABLE tipos_produto(
 	codigo SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
);

CREATE TABLE produtos(
	codigo SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL,
	preco MONEY NOT NULL,
	codigo_tipo INT REFERENCES tipos_produto(codigo) NOT NULL
);

-- INSERT
INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', 1200, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', 1800, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr Laser', 500, 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato de Tinta', 300, 2);

-- SELECT
SELECT * FROM tipos_produto WHERE codigo = 1;

SELECT * FROM tipos_produto WHERE codigo = 2;

SELECT * FROM produtos WHERE descricao = 'Laptop';

SELECT * FROM produtos;

SELECT * FROM tipos_produto;

SELECT * from produtos WHERE preco <= '$500';

SELECT p.codigo, p.descricao, p.preco, tp.descricao AS Tipo
	FROM produtos AS p, tipos_produto AS tp
    WHERE p.codigo_tipo = tp.codigo;
