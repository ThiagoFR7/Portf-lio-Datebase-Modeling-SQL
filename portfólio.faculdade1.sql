-- Criação do Banco de Dados
CREATE DATABASE faculdade;
USE faculdade;

-- Criação da tabela tbl_aluno
CREATE TABLE tbl_aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    rg VARCHAR(12),
    data_nascimento DATE,
    id_curso INT,  -- Chave estrangeira para tbl_curso
    FOREIGN KEY (id_curso) REFERENCES tbl_curso(id_curso)
);

-- Criação da tabela tbl_endereco (Relacionada ao aluno)
CREATE TABLE tbl_endereco (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(150),
    bairro VARCHAR(50),
    cep VARCHAR(10),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    pais VARCHAR(50),
    id_aluno INT,  -- Chave estrangeira para tbl_aluno
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id_aluno)
);

-- Criação da tabela tbl_email (Relacionada ao aluno)
CREATE TABLE tbl_email (
    id_email INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100),
    id_aluno INT,  -- Chave estrangeira para tbl_aluno
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id_aluno)
);

-- Criação da tabela tbl_telefone (Relacionada ao aluno)
CREATE TABLE tbl_telefone (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(15),
    id_aluno INT,  -- Chave estrangeira para tbl_aluno
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id_aluno)
);

-- Criação da tabela tbl_curso
CREATE TABLE tbl_curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    duracao INT NOT NULL  -- Duração em semestres
);

-- Criação da tabela tbl_professor
CREATE TABLE tbl_professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    rg VARCHAR(12),
    especializacao VARCHAR(100),
    data_nascimento DATE
);

-- Criação da tabela tbl_email_professor (Relacionada ao professor)
CREATE TABLE tbl_email_professor (
    id_email INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100),
    id_professor INT,  -- Chave estrangeira para tbl_professor
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id_professor)
);

-- Criação da tabela tbl_telefone_professor (Relacionada ao professor)
CREATE TABLE tbl_telefone_professor (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(15),
    id_professor INT,  -- Chave estrangeira para tbl_professor
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id_professor)
);

-- Criação da tabela tbl_turma
CREATE TABLE tbl_turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    codigo_turma VARCHAR(10) NOT NULL,
    horario VARCHAR(50),
    id_professor INT,   -- Chave estrangeira para tbl_professor
    id_disciplina INT,  -- Chave estrangeira para tbl_disciplina
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES tbl_disciplina(id_disciplina)
);

-- Criação da tabela tbl_disciplina
CREATE TABLE tbl_disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    carga_horaria INT NOT NULL
);

-- Criação da tabela tbl_nota
CREATE TABLE tbl_nota (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    nota DECIMAL(5,2),
    id_aluno INT,        -- Chave estrangeira para tbl_aluno
    id_disciplina INT,   -- Chave estrangeira para tbl_disciplina
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES tbl_disciplina(id_disciplina)
);

SHOW TABLES;

