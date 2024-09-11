-- Consulta em multiplas tabelas

-- CREATE
CREATE TABLE tipos_produto(
	codigo INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL
);

CREATE TABLE produtos(
	codigo INTEGER PRIMARY KEY AUTOINCREMENT, 
	descricao TEXT NOT NULL,
	preco REAL NOT NULL,
	codigo_tipo INTEGER REFERENCES tipos_produto(codigo) NOT NULL
);

-- INSERT
INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', 1200, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', 1800, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', 300, 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', 500, 2);

-- SELECT
SELECT * FROM tipos_produto;
SELECT * FROM produtos;

-- Consulta em multiplas tabelas
SELECT p.codigo AS 'Codigo', p.descricao AS 'Descricao', p.preco AS 'Preco', tp.descricao AS 'Tipo Produto' 
	FROM produtos AS p, tipos_produto AS tp
    WHERE p.codigo_tipo = tp.codigo;
	