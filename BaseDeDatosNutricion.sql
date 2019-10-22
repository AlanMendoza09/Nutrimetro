

DROP DATABASE IF EXISTS Nutricion;

CREATE DATABASE Nutricion;

use Nutricion;

--
-- 
--


CREATE TABLE Administrador (
  id int(10)  primary key not null auto_increment,
  nombre varchar(100) NOT NULL,
  apellido varchar(100) not null,
  contraseña varchar(100) not null, 
  usuario varchar(100) not null
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE table PersonaMayor(
    id int(10) primary key not null auto_increment,
    nombre VARCHAR(100) not null,
    apellido varchar(100) not null,
    sexo char not null,
    email varchar(100) not null,
    edad int(3) DEFAULT 0,
    fechaDeNacimiento DATE not null,
    socioEconomico VARCHAR(100) not null,
    escolaridad varchar(100) not null,
    contraseña varchar(100) not null,
    usuario varchar(100) not null,
    telefono int(12) not null,
    historiaClinica varchar(100) not null,
    id_planNutricional int(10) NOT NULL,
    id_historiaClinica int(10) NOT NULL, 
    FOREIGN key(id_planNutricional) REFERENCES PlanNutricional(id),
    FOREIGN key(id_historiaClinica) REFERENCES HistorialClinico(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE table RegistroMedico(
    id int(10) primary key not null auto_increment,
    peso FLOAT DEFAULT 0,
    fechaRegistro DATE not null,
    estatura FLOAT DEFAULT 0,
    observaciones nvarchar(300) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE Table Comentarios(
    id int(10) primary key not null auto_increment,
    contenido nvarchar(300) not null,
    fecha DATE not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE table Nutriologo(
    id int(10) primary key not null auto_increment,
    nombre varchar(100) NOT NULL,
    apellido varchar(100) not null,
    email varchar(100) not null,
    contraseña varchar(100) not null,
    usuario varchar(100) not null,
    telefono int(12) not null,
    cedula varchar(100) not null,
    domicilioCons varchar(100) not null,
    domicilioPos varchar(100) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE PlanNutricional(

    id INT(10) PRIMARY KEY NOT NULL auto_increment,
    especificaciones VARCHAR(100) not NULL,
    recomendaciones VARCHAR(100) not NULL,
    fechaModificacion DATE not null,
    fechaInicio DATE NOT NULL,
    legumbres FLOAT DEFAULT 0,
    lacteos FLOAT DEFAULT 0,
    frutas FLOAT DEFAULT 0,
    cereales FLOAT DEFAULT 0,
    verduras FLOAT DEFAULT 0,
    proteina FLOAT DEFAULT 0,
    semillas FLOAT DEFAULT 0,
    grasas FLOAT DEFAULT 0,
    calendario VARCHAR(100)  
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Comida(
    id int(10) primary key not null auto_increment,
    entrada VARCHAR(100) NOT NULL,
    platoFuerto VARCHAR(100) NOT NULL,
    postre VARCHAR(100) Not NULL,
    bebida varchar(100)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Seguimiento(
    id int(10) primary key not null auto_increment,
    fechaRegistro DATE NOT NULL,
    legumbres FLOAT DEFAULT 0,
    lacteos FLOAT DEFAULT 0,
    frutas FLOAT DEFAULT 0,
    cereales FLOAT DEFAULT 0,
    verduras FLOAT DEFAULT 0,
    proteina FLOAT DEFAULT 0,
    semillas FLOAT DEFAULT 0,
    grasas FLOAT DEFAULT 0
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE HistorialClinico(
    id int(10) primary key not null auto_increment,
    fechaRegistro DATE NOT NULL,
    diabetes Boolean DEFAULT FALSE,
    hipertensión Boolean DEFAULT FALSE,
    dislipidemias Boolean DEFAULT FALSE,
    dislipidemiasString VARCHAR(100),
    cancer Boolean DEFAULT FALSE,
    cancerString VARCHAR(100),
    sobrepeso Boolean DEFAULT FALSE,
    otrosAntecedentes VARCHAR(100),
    perdidasDentales Boolean DEFAULT FALSE,
    tropieza Boolean DEFAULT FALSE,
    ayudaComer Boolean DEFAULT FALSE,
    ayudaBanioo Boolean DEFAULT FALSE,
    ayudaVestirse Boolean DEFAULT FALSE,
    moretones Boolean DEFAULT FALSE,
    pielPalida Boolean DEFAULT FALSE,
    nigricans Boolean DEFAULT FALSE,
    uniasPelo Boolean DEFAULT FALSE,
    edema Boolean DEFAULT FALSE,
    astenia Boolean DEFAULT FALSE,
    asteniaString VARCHAR(100),
    jorobaDeBufalo Boolean DEFAULT FALSE,
    cushing Boolean DEFAULT FALSE,
    ectomorfoString VARCHAR(100),
    vision Boolean DEFAULT FALSE,
    visionString VARCHAR(100),
    bocaLengua Boolean DEFAULT FALSE,
    bocaLenguaString VARCHAR(100),
    tonoMuscular VARCHAR(100),
    hallazgos VARCHAR(100),
    otrosString VARCHAR(100),
    medicamentos VARCHAR(100),
    tabaquismo Boolean DEFAULT FALSE,
    tabaquismoString VARCHAR(100),
    alcohol Boolean DEFAULT FALSE,
    alcoholFrecuencia VARCHAR(100),
    cafeina Boolean DEFAULT FALSE,
    cafeinaFrecuencia VARCHAR(100),
    drogas Boolean DEFAULT FALSE,
    drogasFrecuencia VARCHAR(100),
    inactividadSemana VARCHAR(100),
    inactividadFinSemana VARCHAR(100)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Nutriologo_PersonaMayor(
    id_nutriologo int (10) not NULL,
    id_personaMayor int (10) not NULL,
    foreign key(id_personaMayor) REFERENCES PersonaMayor(id),
    FOREIGN KEY(id_nutriologo) REFERENCES Nutriologo(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Nutriologo_Comentario(
    id_nutriologo int (10) not NULL,
    id_comentario int (10) NOT NULL,
    FOREIGN KEY(id_comentario) REFERENCES Comentario(id),
    FOREIGN KEY(id_nutriologo) REFERENCES Nutriologo(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE PersonaMayor_Comentario(
    id_personaMayor int (10) not NULL,
    id_comentario int (10) NOT NULL,
    FOREIGN KEY(id_comentario) REFERENCES Comentario(id),
    foreign key(id_personaMayor) REFERENCES PersonaMayor(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Nutriologo_PlanNutricional(
    id_nutriologo int (10) not NULL,
    id_planNutricional int (10) NOT NULL,
    FOREIGN KEY(id_planNutricional) REFERENCES PlanNutricional(id),
    FOREIGN KEY(id_nutriologo) REFERENCES Nutriologo(id)
    
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE PersonaMayor_Seguimiento(
    id_personaMayor int (10) not NULL,
    id_seguimiento int (10) NOT NULL,
    FOREIGN KEY(id_seguimiento) REFERENCES Seguimiento(id),
    foreign key(id_personaMayor) REFERENCES PersonaMayor(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE PersonaMayor_RegistroMedico(
    id_personaMayor int (10) not NULL,
    id_registroMedico int (10) NOT NULL,
    FOREIGN KEY(id_registroMedico) REFERENCES RegistroMedico(id),
    foreign key(id_personaMayor) REFERENCES PersonaMayor(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Comida_PlanNutricional(
    id_comida int (10) not NULL,
    id_planNutricional int (10) NOT NULL,
    FOREIGN KEY(id_planNutricional) REFERENCES PlanNutricional(id),
    FOREIGN KEY(id_comida) REFERENCES Comida(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
    

DROP USER 'nutricion'@'localhost';
flush privileges;

INSERT INTO Administrador (nombre, apellido,contraseña,usuario) VALUES ('administrador','admin', 'admin1234', 'admin');

CREATE USER 'nutricion'@'localhost' IDENTIFIED BY 'mipass';
GRANT SELECT, UPDATE, INSERT, DELETE ON Nutricion.* TO 'nutricion'@'localhost';







