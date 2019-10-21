DROP DATABASE IF EXISTS Nutricion;

CREATE DATABASE Nutricion;

use Nutricion;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS Nutricion;

CREATE table PersonaMayor(
    id int(10) primary key not null auto_increment,
    nombre varchar(100) not null,
    apellido varchar(100) not null,
    sexo char not null,
    email varchar(100) not null,
    edad int(3) default 0,
    fechaDeNacimiento DATE not null,
    socioEconomico varchar(100) not null,
    escolaridad varchar(100) not null,
    contraseña varchar(100) not null,
    usuario varchar(100) not null,
    telefono int(12) not null,
    historiaClinica varbinary not null,
    id_planNutricional int(10) not NULL,
    FOREIGN key(id_planNutricional) REFERENCES PlanNutricional(id)

)

CREATE table RegistroMedico(
    id int(10) primary key not null auto_increment,
    peso double default 0,
    fechaRegistro DATE not null,
    estatura double default 0,
    observaciones nvarchar(300) not null,
)

CREATE Table Comentarios(
    id int(10) primary key not null auto_increment,
    contenido nvarchar(300) not null,
    fecha DATE not null
)

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

)

CREATE TABLE PlanNutricional(

    id INT(10) PRIMARY KEY NOT NULL auto_increment,
    especificaciones VARCHAR(100) not NULL,
    recomendaciones VARCHAR(100) not NULL,
    fechaModificacion DATE not null,
    fechaInicio DATE NOT NULL,
    legumbres DOUBLE DEFAULT 0,
    lacteos DOUBLE DEFAULT 0,
    frutas double DEFAULT 0,
    cereales DOUBLE DEFAULT 0,
    verduras DOUBLE DEFAULT 0,
    proteina DOUBLE DEFAULT 0,
    semillas DOUBLE DEFAULT 0,
    grasas DOUBLE DEFAULT 0,
    calendario VARCHAR(100)

    
)
CREATE TABLE Comida(
    id int(10) primary key not null auto_increment,
    entrada VARCHAR(100) NOT NULL,
    platoFuerto VARCHAR(100) NOT NULL,
    postre VARCHAR(100) Not NULL,
    bebida varchar(100)
)

CREATE TABLE Seguimiento(
    id int(10) primary key not null auto_increment,
    fechaRegistro DATE NOT NULL,
    legumbres DOUBLE DEFAULT 0,
    lacteos DOUBLE DEFAULT 0,
    frutas double DEFAULT 0,
    cereales DOUBLE DEFAULT 0,
    verduras DOUBLE DEFAULT 0,
    proteina DOUBLE DEFAULT 0,
    semillas DOUBLE DEFAULT 0,
    grasas DOUBLE DEFAULT 0,
)

--Tablas de relaciones de uno a muchos  y muchos a muchos

CREATE TABLE Nutriologo_PersonaMayor(
    id_nutriologo int (10) not NULL,
    id_personaMayor int (10) not NULL,
    foreign key(id_personaMayor) REFERENCES PersonaMayor(id),
    FOREIGN KEY(id_nutriologo) REFERENCES Nutriologo(id)
)
CREATE TABLE Nutriologo_Comentario(
    id_nutriologo int (10) not NULL,
    id_comentario int (10) NOT NULL,
    FOREIGN KEY(id_comentario) REFERENCES Comentario(id),
    FOREIGN KEY(id_nutriologo) REFERENCES Nutriologo(id)
)
CREATE TABLE PersonaMayor_Comentario(
    id_personaMayor int (10) not NULL,
    id_comentario int (10) NOT NULL,
    FOREIGN KEY(id_comentario) REFERENCES Comentario(id),
    Fforeign key(id_personaMayor) REFERENCES PersonaMayor(id)
)
CREATE TABLE Nutriologo_PlanNutricional(
    id_nutriologo int (10) not NULL,
    id_planNutricional int (10) NOT NULL,
    FOREIGN KEY(id_planNutricional) REFERENCES PlanNutricional(id),
    FOREIGN KEY(id_nutriologo) REFERENCES Nutriologo(id)
    
)
CREATE TABLE PersonaMayor_Seguimiento(
    id_personaMayor int (10) not NULL,
    id_seguimiento int (10) NOT NULL,
    FOREIGN KEY(id_seguimiento) REFERENCES Seguimiento(id),
    Fforeign key(id_personaMayor) REFERENCES PersonaMayor(id)
)
CREATE TABLE PersonaMayor_RegistroMedico(
    id_personaMayor int (10) not NULL,
    id_registroMedico int (10) NOT NULL,
    FOREIGN KEY(id_registroMedico) REFERENCES RegistroMedico(id),
    Fforeign key(id_personaMayor) REFERENCES PersonaMayor(id)
)

CREATE TABLE Comida_PlanNutricional(
    id_comida int (10) not NULL,
    id_planNutricional int (10) NOT NULL,
    FOREIGN KEY(id_planNutricional) REFERENCES PlanNutricional(id),
    FOREIGN KEY(id_nutriologo) REFERENCES Comida(id)
    
)

DROP USER 'nutricion'@'localhost';
flush privileges;

INSERT INTO Usuario (nombre,contraseña,usuario) VALUES ('administrador', 'admin1234', 'admin');

CREATE USER 'nutricion'@'localhost' IDENTIFIED BY 'mipass';
GRANT SELECT, UPDATE, INSERT, DELETE ON Nutricion.* TO 'nutricion'@'localhost';