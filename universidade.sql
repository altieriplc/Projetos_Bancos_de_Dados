-- Active: 1726573045685@@localhost@5432@universidade@public
SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;

-- CRIAÇÃO DAS TABELAS -------------------------------------------------------------

create table alunos(
    id_aluno int primary key,
    nome_aluno varchar(50) not null,
    idade_aluno int not null,
    email_aluno varchar(50) not null
);

create table cursos(
    id_curso int primary key,
    id_disciplina int not null,
    Foreign Key (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

CREATE TABLE disciplinas(
    id_disciplina int primary key,
    nome_disciplina varchar(50) not null,
    id_professor int not null
    );

CREATE TABLE professores(
    id_professor int primary key,
    nome_professor varchar(50) not null,
    email_professor varchar(50) not null
);

CREATE table matriculas(
    id_matricula int primary key,
    id_aluno int not null,
    id_curso int not null,
    Foreign Key (id_aluno) REFERENCES alunos(id_aluno),
    Foreign Key (id_curso) REFERENCES cursos(id_curso)
)

ALTER TABLE disciplinas add Foreign Key (id_professor) REFERENCES professores(id_professor);

-- INSERÇÃO DE DADOS -------------------------------------------------------------

INSERT INTO professores(id_professor, nome_professor, email_professor) 
    VALUES(1, 'João', 'joao@gmail.com'),
    (2, 'Maria', 'maria@gmail.com'),
    (3, 'José', 'jose@gmail.com'),
    (4, 'Ana', 'ana@gmail.com'),
    (5, 'Carla', 'carla@gmail.com');

INSERT INTO disciplinas(id_disciplina, nome_disciplina, id_professor) 
    VALUES(1, 'Matemática', 1),
    (2, 'Português', 2),
    (3, 'História', 3),
    (4, 'Geografia', 4),
    (5, 'Física', 5);

INSERT into cursos(id_curso, id_disciplina)
    VALUES(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO alunos(id_aluno, nome_aluno, idade_aluno, email_aluno)
    VALUES(001, 'João', 20, 'joao@gmail.com'),
    (002, 'Maria', 21, 'maria@gmail.com'),
    (003, 'José', 22, 'jose@gmail.com'),
    (004, 'Ana', 23, 'ana@gmail.com'),
    (005, 'Carla', 24, 'carla@gmail.com');

insert into matriculas(id_matricula, id_aluno, id_curso)
    VALUES(1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);


-- CONSULTAS ----------------------------------------------------------------------

SELECT * FROM alunos;

SELECT id_curso, d.nome_disciplina 
    FROM cursos c
    JOIN  disciplinas d 
    ON c.id_disciplina = d.id_disciplina;

SELECT nome_disciplina, nome_professor
    FROM disciplinas d
    JOIN professores p
    ON d.id_professor = p.id_professor;

SELECT nome_aluno, nome_disciplina
    from matriculas m
    join alunos a on m.id_aluno = a.id_aluno
    join disciplinas d on m.id_aluno = d.id_disciplina;
    
SELECT 
    a.nome_aluno, 
    d.nome_disciplina
FROM matriculas m
JOIN alunos a ON m.id_aluno = a.id_aluno -- traz o nome do aluno
JOIN cursos c ON m.id_curso = c.id_curso -- traz o nome do curso
JOIN disciplinas d ON c.id_disciplina = d.id_disciplina; -- traz o nome da disciplina

SELECT p.nome_professor, d.nome_disciplina, c.id_curso
from professores p
join disciplinas d on p.id_professor = d.id_professor
join cursos c on d.id_disciplina = c.id_disciplina;
