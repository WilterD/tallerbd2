CREATE TABLE competiciones (
  id_competicion INT PRIMARY KEY,
  nombre VARCHAR(50),
  fecha_inicio DATE,
  fecha_fin DATE,
  temporada VARCHAR(10) NOT NULL
);

CREATE TABLE clubes (
  id_club INT PRIMARY KEY,
  nombre_club VARCHAR(50) NOT NULL,
  fecha_creacion DATE NOT NULL,
  num_socios INT NOT NULL,
  id_entrenador INT,
  id_federacion INT,
  FOREIGN KEY (id_entrenador) REFERENCES entrenadores(id_entrenador),
  FOREIGN KEY (id_federacion) REFERENCES federaciones(id_federacion)
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

-- Tabla de clasificaciones
CREATE TABLE clasificaciones (
  id_clasificacion INT PRIMARY KEY,
  id_club INT,
  id_competicion INT,
  posicion INT NOT NULL,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club),
  FOREIGN KEY (id_competicion) REFERENCES competiciones(id_competicion)
);