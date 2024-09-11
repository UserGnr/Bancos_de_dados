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
INSERT INTO tipos_produto (descricao) VALUES ('Notebook');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', 1200, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', 1800, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', 300, 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', 500, 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Notebook', 1200, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('IPad', '2600', 1);

-- UPDATE
UPDATE tipos_produto set descricao = 'Nobreak' WHERE codigo = 3;
UPDATE produtos set descricao = 'Notebook', preco = '2800' WHERE codigo = 2;

-- Cuidado com o UPDATE (sem o WHERE)
-- O MySQL Workbench não irá permitir, mas se fosse utilizando uma linguagem de programação, já era.
UPDATE produtos set descricao = 'Notebook', preco = '2800';

-- DELETE
DELETE FROM tipos_produto WHERE codigo = 3;
-- Cuidado com o  DELETE (sem o WHERE)
-- O MySQL Workbench não irá permitir, mas se fosse utilizando uma linguagem de programação, já era.
DELETE FROM produtos;