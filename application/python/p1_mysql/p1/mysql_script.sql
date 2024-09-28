CREATE DATABASE pymysql;

USE pymysql;

CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    estoque INT NOT NULL
)