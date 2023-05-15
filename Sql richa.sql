create database senac;

use senac;

-- 1 --
create table gestor(
id_Gestor int auto_increment primary key,
nome varchar(255) not null,
sobrenome varchar(255) not null,
cpf char(15) not null unique,
rg char(10) not null unique,
dataNascimento date,
area_formacao varchar(100) not null,
especializacao char(70) not null, 
titulacao varchar(100) not null,
email_insti varchar(200) not null,
senha varchar(100) not null,
telefone char(20) not null,
cep char(10)
);

-- 2 --
create table matriculaGestor(
id_matriculaGestor int auto_increment primary key,
id_Gestor int,
matricula char(20) not null,
dataMaricula date,
FOREIGN KEY (id_Gestor) REFERENCES Gestor(id_Gestor)
);

-- 3 --
create table coordenador(
id_coordenador int auto_increment primary key,
nome varchar(255) not null,
sobrenome varchar(255) not null,
cpf char(15) not null unique,
rg char(10) not null unique,
dataNascimento date,
area_formacao varchar(100) not null,
especializacao char(70) not null, 
titulacao varchar(100) not null,
email_insti varchar(200) not null,
senha varchar(100) not null,
telefone char(20) not null,
cep char(10)
);

-- 4 --
create table matriculacoordenador(
id_matriculacoordenador int auto_increment primary key,
id_coordenador int,
matricula char(20) not null,
dataMaricula date,
FOREIGN KEY (id_coordenador) REFERENCES coordenador(id_coordenador)
);


-- 5 --
create table professor(
id_Professor int auto_increment primary key,
email_insti varchar(200) not null,
nome varchar(255) not null,
sobrenome varchar(255) not null,
cpf char(15) not null unique,
rg char(10) not null unique,
dataNascimento date,
area_formacao varchar(100) not null,
especializacao char(70) not null, 
titulacao varchar(100) not null,
senha varchar(100) not null,
telefone char(20) not null,
cep char(10)
);

-- 6 --
create table matriculaProfessor(
id_matriculaProfessor int auto_increment primary key,
id_Professor int,
matricula char(20) not null,
dataMaricula date,
FOREIGN KEY (id_Professor ) REFERENCES Professor(id_Professor )
);

-- 7 --
create table turma(
id_turma int auto_increment primary key,
id_coordenador int,
id_supervisor int,
id_Aluno int,
ano char(10) not null,
turno varchar(50) not null,
quantidadeAlunos int not null,
FOREIGN KEY (id_coordenador) REFERENCES coordenador(id_coordenador)
);

-- 8 --
create table aluno(
id_Aluno int auto_increment primary key,
id_turma int,
nome varchar(255) not null,
sobrenome varchar(255) not null,
cpf char(15) not null unique,
dataNascimento date,
email_insti varchar(200) not null,
senha varchar(100) not null,
telefone char(20) not null,
cep char(10),
FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

-- 9 --
create table matriculasAlunos(
id_matriculasAlunos int auto_increment primary key,
id_Aluno int,
matricula char(50) not null,
dataMaricula date,
FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno )
);

-- 10 --
create table Responsavel(
id_resp int auto_increment primary key,
id_Aluno int,
nome varchar(255) not null,
sobrenome varchar(255) not null,
cpf char(15) not null unique,
rg char(10) not null unique,
dataNascimento date,
email varchar(200) not null,
telefone char(20) not null,
cep char(10),
FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno)
);

-- 11 --
create table materias(
id_materias int auto_increment primary key,
id_Professor int,
id_prova  int,
id_Aluno int,
materias char(70) not null,
FOREIGN KEY (id_Professor ) REFERENCES Professor(id_Professor ),
FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno )
); 

-- 12 --
create table questoes(
id_questoes int auto_increment primary key,
id_Professor int,
id_materias int,
nivel char(50) not null,
numeroQuetoes varchar(200) not null,
FOREIGN KEY (id_Professor ) REFERENCES Professor(id_Professor ),
FOREIGN KEY (id_materias ) REFERENCES materias(id_materias )
);

-- 13 --
create table nota(
id_nota int auto_increment primary key,
id_Aluno int,
id_materias int,
nota char(10) not null,
materia char(50) not null,
FOREIGN KEY (id_materias) REFERENCES materias(id_materias ),
FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno )
);

-- 14 --
create table prova(
id_prova int auto_increment primary key,
id_materias int,
id_turma int,
id_Aluno int,
dataprova date,
horarioProva time, 
materia char(50) not null,
FOREIGN KEY (id_materias) REFERENCES materias(id_materias ),
FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno )
);

-- 15 --
create table frequencia(
id_frequencia int auto_increment primary key,
id_Aluno int,
id_turma int,
dataFrequencia date,
presenca char(1) not null,
FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno ),
FOREIGN KEY (id_turma) REFERENCES turma(id_turma )
);

-- opcao de usar presenca CHAR(1) CHECK (presenca IN ('P',  'F')) --
