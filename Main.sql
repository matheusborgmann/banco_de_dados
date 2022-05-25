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
    FOREIGN KEY (CodDepto, NumDisc) REFERENCES Disciplina (CodDepto, NumDisc),
    FOREIGN KEY (CodDeptoPreReq, NumDiscPreReq) REFERENCES Disciplina(CodDepto, NumDisc)
);

CREATE TABLE Turma(
    AnoSem VARCHAR(50) NOT NULL,
    CodDepto INTEGER NOT NULL, 
    NumDisc INTEGER NOT NULL, 
    SiglaTur VARCHAR(50) NOT NULL, 
    CapacOfer INTEGER NOT NULL,
    PRIMARY KEY (AnoSem, SiglaTur),
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
FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma(AnoSem, CodDepto, NumDisc, SiglaTur),
FOREIGN KEY (CodProf) REFERENCES Professor(CodProf)
);

CREATE TABLE Titulacao(
CodTit INTEGER NOT NULL,
NomeTit VARCHAR(50) NOT NULL,
PRIMARY KEY (CodTit)
);

