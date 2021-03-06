CREATE TABLE Depto(
    CodDepto INTEGER NOT NULL, 
    NomeDepto VARCHAR(50) NOT NULL,
    PRIMARY KEY (CodDepto)
);
CREATE TABLE Disciplina (
    CodDepto INTEGER NOT NULL, 
    NumDisc INTEGER NOT NULL, 
    NomeDisc VARCHAR(50) NOT NULL, 
    CreditosDisc INTEGER NOT NULL,
    PRIMARY KEY (CodDepto, NumDisc),
    FOREIGN KEY (CodDepto) REFERENCES Depto(CodDepto)
); 
CREATE TABLE PreReq(
    CodDepto INTEGER NOT NULL, 
    NumDisc INTEGER NOT NULL, 
    CodDeptoPreReq INTEGER NOT NULL, 
    NumDiscPreReq INTEGER NOT NULL, 
    PRIMARY KEY (CodDepto, NumDisc, CodDeptoPreReq, NumDiscPreReq),
    FOREIGN KEY (CodDepto, NumDisc) REFERENCES Disciplina (CodDepto, NumDisc),
    FOREIGN KEY (CodDeptoPreReq, NumDiscPreReq) REFERENCES Disciplina(CodDepto, NumDisc)
);
CREATE TABLE Turma(
    AnoSem VARCHAR(50) NOT NULL,
    CodDepto INTEGER NOT NULL, 
    NumDisc INTEGER NOT NULL, 
    SiglaTur VARCHAR(50) NOT NULL, 
    CapacOfer INTEGER NOT NULL,
    PRIMARY KEY (AnoSem, SiglaTur, NumDisc, CodDepto),
    FOREIGN KEY (CodDepto, NumDisc) REFERENCES Disciplina(CodDepto, NumDisc)
);
CREATE TABLE Horario(
    AnoSem VARCHAR(50) NOT NULL,
    CodDepto INTEGER NOT NULL, 
    NumDisc INTEGER NOT NULL, 
    SiglaTur VARCHAR(50) NOT NULL, 
    DiaSem VARCHAR(50) NOT NULL,
    HoraInicio FLOAT NOT NULL,
    NumHoras INTEGER NOT NULL,
    CodPred INTEGER NOT NULL,
    NumSala INTEGER NOT NULL,
    PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur),
    FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma(AnoSem, CodDepto, NumDisc, SiglaTur),
    FOREIGN KEY (CodPred, NumSala) REFERENCES Sala(CodPred, NumSala)
);
CREATE TABLE Predio(
    CodPred INTEGER NOT NULL,
    NomePred VARCHAR(50) NOT NULL,
    PRIMARY KEY (CodPred)
);
CREATE TABLE Sala(
    CodPred INTEGER NOT NULL,
    NumSala INTEGER NOT NULL,
    CapacSala INTEGER NOT NULL,
    PRIMARY KEY (CodPred, NumSala),
    FOREIGN KEY (CodPred) REFERENCES Predio(CodPred)
);
CREATE TABLE Professor(
    CodProf INTEGER NOT NULL,
    NomeProf VARCHAR(50) NOT NULL,
    CodTit INTEGER NOT NULL,
    CodDepto INTEGER NOT NULL,
    PRIMARY KEY (CodProf),
    FOREIGN KEY (CodTit) REFERENCES Titulacao(CodTit), 
    FOREIGN KEY (CodDepto) REFERENCES Depto(CodDepto)
);
CREATE TABLE ProfTurma(
    AnoSem VARCHAR(50) NOT NULL,
    CodDepto INTEGER NOT NULL, 
    NumDisc INTEGER NOT NULL,
    SiglaTur VARCHAR(50) NOT NULL, 
    CodProf INTEGER NOT NULL, 
    PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf),
    FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma(AnoSem, CodDepto, NumDisc, SiglaTur),
    FOREIGN KEY (CodProf) REFERENCES Professor(CodProf)
);
CREATE TABLE Titulacao(
    CodTit INTEGER NOT NULL,
    NomeTit VARCHAR(50) NOT NULL,
    PRIMARY KEY (CodTit)
);
/*a) Inserir no m??nimo, 3 linhas e cada uma das tabelas acima. Apresentar os scripts de inser????o. */
INSERT INTO Depto(CodDepto, NomeDepto) 
VALUES (1, "Matheus"), (2, "JuJu"), (3, "Nico");
INSERT INTO Disciplina(CodDepto, NumDisc, NomeDisc, CreditosDisc)
VALUES (1, 1, "Programacao", 10), (2, 2, "Banco", 20), (3, 3, "Estrutura", 30); 
INSERT INTO PreReq(CodDepto, NumDisc, CodDeptoPreReq, NumDiscPreReq)
VALUES (1, 1, 1, 1), (2, 2, 2, 2), (3, 3, 3, 3);
INSERT INTO  Turma (AnoSem, CodDepto, NumDisc, SiglaTur, CapacOfer) 
VALUES ("1", 1, 1, "POO", 10), ("2", 2, 2, "BD", 20), ("1", 3, 3, "ED", 30);
INSERT INTO Horario(AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio, NumHoras, CodPred, NumSala)
VALUES ("1", 1, 1, "POO", 1, 7, 3, 1, 1), ("2", 2, 2, "BD", 2, 7, 3, 2, 2), ("1", 3, 3, "ED", 3, 7, 3, 1, 1);
INSERT INTO Predio(CodPred, NomePred)
VALUES (1, "Predio1"), (2, "Predio2"), (3, "Predio3");
INSERT INTO Sala (CodPred, NumSala, CapacSala)
VALUES (1, 1, 10), (2, 2, 20), (3, 3, 30);
INSERT INTO Professor (CodProf, NomeProf, CodTit, CodDepto)
VALUES (1, "Vitor", 1, 1), (2, "Aline", 2, 2), (3, "Adriana", 3, 3);
INSERT INTO ProfTurma (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf) 
VALUES ("1", 1, 1, "POO", 1), ("2", 2, 2, "BD", 2), ("1", 3, 3, "ED", 3);
INSERT INTO Titulacao (CodTit, NomeTit)
VALUES (1, "VNL"), (2, "ADC"), (3, "ADN");
/*b) Obtenha os nomes das disciplinas que possuem mais de tr??s cr??ditos.*/
SELECT * FROM Disciplina WHERE CreditosDisc > 3;
/*c) Obtenha os c??digos dos professores que ministraram aulas em 2002/2./	

/ou*/
SELECT CodProf FROM ProfTurma WHERE AnoSem = '2002/2';
/*d) Obtenha os nomes das disciplinas seguidas do nome de seu departamento. */
SELECT NomeDisc, CodDepto FROM Disciplina;
/*e) Obtenha os nomes dos professores que possuem titulacao de ???DOUTOR*/    
SELECT NomeProf FROM Professor where CodTit = '5';
/*f) Obtenha os nomes dos professores que ministraram aulas em 2002/2. */	
SELECT CodProf FROM ProfTurma WHERE AnoSem = '2002/2';
SELECT NomeProf FROM Professor WHERE CodProf in (1, 2);
/*g) Obtenha os numeros das salas do predio de nome ???LABORATORIOS??? cuja capacidade seja maior que 30. */
     SELECT NumSala FROM Sala WHERE CodPred = 1001 and CapacSala > 30;
/*h) Obtenha os nomes das disciplinas que foram oferecidas em 2002/2*/	
     SELECT NumDisc FROM Turma WHERE AnoSem = '2002/2';
SELECT NumDisc FROM Disciplina WHERE NumDisc in (5, 6);
/*i) Obtenha os n??meros das salas do pr??dio "LABORAT??RIOS". */
     SELECT NumSala from Sala WHERE CodPred = 1001;
/*j) Obtenha os nomes dos professores seguidos do nome de seu departamento. 
*/
SELECT NomeProf, CodDepto FROM Professor;
/*k) Obtenha os c??digos dos professores que n??o possuem turma em 2002/2.
*/
SELECT CodProf FROM ProfTurma WHERE AnoSem NOT IN ('2002/2');
/*l) Nomes dos departamentos que possuem disciplinas que n??o apresentam pr??-requisito.

*/	
/*m) Obtenha os c??digos dos professores que ministraram aulas em 2002/1 e 2002/2.
*/ 
SELECT CodProf FROM ProfTurma WHERE AnoSem = '2002/2' or AnoSem = '2002/1';
/*n) Obtenha os nomes dos departamentos em que h?? pelo menos uma disciplina com mais que tr??s cr??ditos.*/
SELECT CodDepto FROM Disciplina WHERE CreditosDisc > 3;
SELECT NomeDepto FROM Depto WHERE CodDepto IN (1, 2, 3);
