-- Active: 1726574148665@@127.0.0.1@3306
-- https://canvas.kenzie.com.br/courses/61/assignments/8281?module_item_id=33951
CREATE DATABASE livraria

-- ----------------------------------------------------------------------------------------------

use livraria;
CREATE TABLE livros(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    pages INTEGER not NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)

ALTER TABLE livros
    ADD COLUMN author_id INT NOT NULL, 
    ADD CONSTRAINT FOREIGN KEY (author_id) REFERENCES authors(id);

RENAME TABLE livros TO books;
    USE livraria;

SELECT * FROM livros;

-- ----------------------------------AUTHORS------------------------------------------------------------

CREATE TABLE authors(
    name VARCHAR(255) NOT NULL,
    bio TEXT NOT NULL
)

ALTER TABLE authors 
    ADD COLUMN id INT AUTO_INCREMENT NOT NULL PRIMARY KEY first;

ALTER TABLE books
MODIFY COLUMN author_id INT;

SELECT * FROM authors;

-- -----------------------------------CONTACT_INFOS-----------------------------------------------------------

CREATE TABLE contact_infos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    author_id INT unique not null,
    constraint FOREIGN KEY (author_id) REFERENCES authors(id)
)

ALTER TABLE contact_infos
    DROP FOREIGN KEY contact_infos_ibfk_1;

ALTER TABLE contact_infos
    ADD CONSTRAINT FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE;

SELECT * FROM contact_infos;

-- -----------------------------------BOOKS_CATEGORIES-----------------------------------------------------------

CREATE TABLE books_categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES books(id),
    CONSTRAINT FOREIGN KEY (category_id) REFERENCES categories(id)
)

ALTER TABLE books_categories
    ADD CONSTRAINT FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    ADD CONSTRAINT FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;

ALTER TABLE books
DROP FOREIGN KEY books_ibfk_1;

ALTER TABLE books
ADD CONSTRAINT fk_books_author
FOREIGN KEY (author_id) REFERENCES authors(id)
ON DELETE SET NULL;

SELECT * FROM books_categories;

-- -----------------------------------CATEGORIES-----------------------------------------------------------

CREATE TABLE categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)

SELECT * FROM categories;

------------------------------------------------------------------------------------------------
