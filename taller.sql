BEGIN;

CREATE TABLE competiciones (
  id_competicion INT PRIMARY KEY,
  nombre VARCHAR(50),
  fecha_inicio DATE,
  fecha_fin DATE,
  temporada VARCHAR(10) NOT NULL
);

CREATE TABLE federaciones (
    id_federacion INT PRIMARY KEY,
    nombre_federacion VARCHAR(255) NOT NULL,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE clubes (
  id_club INT PRIMARY KEY,
  nombre_club VARCHAR(50) NOT NULL,
  num_socios INT NOT NULL,
  id_entrenador INT,
  id_federacion INT,
	
  FOREIGN KEY (id_federacion) REFERENCES federaciones(id_federacion)
);

CREATE TABLE entrenadores (
  id_entrenador INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  fecha_inicio_carrera DATE NOT NULL,
  id_club INT,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club)
);

CREATE TABLE especialidades (
  id_especialidad INT PRIMARY KEY,
  nombre_especialidad VARCHAR(50) NOT NULL,
  grado_especialidad INT NOT NULL
);


CREATE TABLE jugadores (
  id_jugador INT PRIMARY KEY,
  nombre VARCHAR(50),
  fecha_nacimiento DATE NOT NULL,
  posicion VARCHAR(50),
  id_club INT,
  telefono VARCHAR(20) NOT NULL,
  peso FLOAT NOT NULL,
  altura FLOAT NOT NULL,
  id_especialidad INT,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club),
  FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad)
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

COMMIT;

