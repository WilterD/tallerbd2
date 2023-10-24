CREATE TABLE competiciones (
  id_competicion INT PRIMARY KEY,
  nombre VARCHAR(50),
  fecha_inicio DATE,
  fecha_fin DATE
);

CREATE TABLE clubes (
  id_club INT PRIMARY KEY,
  nombre VARCHAR(50),
  ciudad VARCHAR(50),
  estadio VARCHAR(50),
  capacidad_estadio INT
);

CREATE TABLE jugadores (
  id_jugador INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  fecha_nacimiento DATE,
  posicion VARCHAR(50),
  id_club INT,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club)
);

CREATE TABLE entrenadores (
  id_entrenador INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  fecha_nacimiento DATE,
  id_club INT,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club)
);