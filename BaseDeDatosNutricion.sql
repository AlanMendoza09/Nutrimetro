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
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE table RegistroMedico(
    id int(10) primary key not null auto_increment,
    peso double default 0,
    fechaRegistro DATE not null,
    estatura double default 0,
    observaciones nvarchar(300) not null,
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
    bebida varchar(100),
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
