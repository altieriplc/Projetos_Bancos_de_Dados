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
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
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

---------------------------------------INSERÇÃO DE DADOS--------------------------------------

INSERT INTO authors(name,bio) 
    VALUES
        ("Eiichiro Oda", "Eiichiro Oda em um mangaká conhecido pela criação do mangá One Piece."),
        ("Osvaldo Silva", "Autor e compositor brasileiro."),
        ("J.K. Rowling", "J.K. Rowling é a autora de sucesso mundial de Harry Potter, uma série de sete livros que conta a história de um jovem bruxo chamado Harry Potter e seus amigos Hermione Granger e Ron Weasley, que enfrentam desafios para destruir o poderoso e malévolo bruxo Voldemort."),
        ("George R.R. Martin", "George R.R. Martin é o autor de A Song of Ice and Fire, uma série de livros que conta a história de um mundo de fantasia onde reinam guerras constantes entre famílias reais e sobrenaturais."),
        ("Agatha Christie", "Agatha Christie é uma das escritoras de mistério mais populares de todos os tempos, conhecida por suas histórias envolventes e personagens complexos."),
        ("Stephenie Meyer", "Stephenie Meyer é a autora de Twilight, uma série de livros que conta a história de uma jovem que se apaixona por um vampiro."),
        ("Dan Brown", "Dan Brown é o autor de Dan Brown, uma série de livros que conta a história de um simbologista que investiga uma conspiração global."),
        ("J.R.R. Tolkien", "J.R.R. Tolkien é o autor de O Senhor dos Anéis, uma série de livros que conta a história de um mundo de fantasia onde reinam guerras constantes entre humanos e elfos.");


insert into books(name, pages, author_id)
    values
        ("One Piece", 100, 1),
        ("Osvaldo e a magia de Oz", 100, 2),
        ("Harry Potter e a pedra filosofal", 100, 3),
        ("Jogos Vorazes", 100, null),
        ("A Sociedade do Anel", 100, 6),
        ("A Cidade dos Anéis", 100, 6),
        ("A Cidade dos Anéis", 100, 6);


insert into categories(name)
    values
        ("Ação"),
        ("Aventura"),
        ("Fantasia"),
        ("Romance"),
        ("Terror"),
        ("Suspense"),
        ("Ficção Científica");
        

set @categoria_aventura_id = (SELECT id from categories where name = "Aventura");

insert ignore into books_categories(book_id, category_id)
    values
        ((select id from books where name = "One Piece"), @categoria_aventura_id),
        ((select id from books where name = "Osvaldo e a magia de Oz"), @categoria_aventura_id),
        ((select id from books where name = "Harry Potter e a pedra filosofal"), @categoria_aventura_id),
        ((select id from books where name = "Jogos Vorazes"), @categoria_aventura_id),
        ((select id from books where name = "A Sociedade do Anel"), @categoria_aventura_id),
        ((select id from books where name = "A Cidade dos Anéis"), @categoria_aventura_id);



set @categoria_fantasia_id = (SELECT id from categories where name = "Fantasia");
insert ignore into books_categories(book_id, category_id)
    values
        ((select id from books where name = "A Cidade dos Anéis"), @categoria_fantasia_id);


set @categoria_manga_id = (SELECT id from categories where name = "Manga");
insert ignore into books_categories(book_id, category_id)
    values
        ((select id from books where name = "One Piece"), @categoria_manga_id);


insert into contact_infos(phone, email, author_id)
    values
        ("1234567890", "osvaldo@gmail.com", 2);
