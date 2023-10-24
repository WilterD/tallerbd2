BEGIN;

CREATE TABLE competiciones (
  id_competicion SERIAL PRIMARY KEY,
  nombre VARCHAR(50),
  fecha_inicio DATE,
  fecha_fin DATE,
  temporada VARCHAR(10) NOT NULL
);

CREATE TABLE partidos (
    id_partido SERIAL PRIMARY KEY,
    id_club_local int NOT NULL,
    id_club_visitante int NOT NULL,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE federaciones (
    id_federacion SERIAL PRIMARY KEY,
    nombre_federacion VARCHAR(255) NOT NULL,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE clubes (
  id_club SERIAL PRIMARY KEY,
  nombre_club VARCHAR(50) NOT NULL,
  num_socios INT NOT NULL,
  id_entrenador INT,
  id_federacion INT,
	
  FOREIGN KEY (id_federacion) REFERENCES federaciones(id_federacion)
);

CREATE TABLE entrenadores (
  id_entrenador SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  fecha_inicio_carrera DATE NOT NULL,
  id_club INT,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club)
);

CREATE TABLE especialidades (
  id_especialidad SERIAL PRIMARY KEY,
  nombre_especialidad VARCHAR(50) NOT NULL,
  grado_especialidad INT NOT NULL
);

CREATE TABLE jugadores (
  id_jugador SERIAL PRIMARY KEY,
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
  id_clasificacion SERIAL PRIMARY KEY,
  id_club INT,
  id_competicion INT,
  posicion INT NOT NULL,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club),
  FOREIGN KEY (id_competicion) REFERENCES competiciones(id_competicion)
);


CREATE TABLE contrataciones (
  id_contratacion SERIAL PRIMARY KEY,
  id_persona INT,
  ic_club INT,
  fecha_contratacion DATE NOT NULL,
  fecha_baja DATE,
  importe DECIMAL(10, 2),
  FOREIGN KEY (id_persona) REFERENCES jugadores(id_jugador) ON DELETE CASCADE,
  FOREIGN KEY (id_persona) REFERENCES entrenadores(id_entrenador) ON DELETE CASCADE,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club)
);

CREATE TABLE ofertas (
  id_oferta SERIAL PRIMARY KEY,
  id_persona INT, 
  id_club INT,
  fecha_oferta DATE NOT NULL,
  importe DECIMAL(10, 2), 
  FOREIGN KEY (id_persona) REFERENCES jugadores(id_Jugador) ON DELETE CASCADE,
  FOREIGN KEY (id_persona) REFERENCES entrenadores(id_entrenador) ON DELETE CASCADE,
  FOREIGN KEY (id_club) REFERENCES clubes(id_club)
);

-- TRIGGERS

-- CREATE OR REPLACE FUNCTION registro_contratacion()
-- RETURNS TRIGGER AS $$
-- BEGIN
--   INSERT INTO contrataciones (id_persona, id_club, fecha_contratacion, importe)
--   VALUES (NEW.id_persona, NEW.id_club, NEW.fecha_contratacion, NEW.importe);
--   RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;

-- CREATE TRIGGER registro_contratacion_trigger
-- AFTER INSERT ON contrataciones_temp
-- FOR EACH ROW
-- EXECUTE FUNCTION registro_contratacion();

-- CREATE OR REPLACE FUNCTION registro_oferta()
-- RETURNS TRIGGER AS $$
-- BEGIN
--   INSERT INTO ofertas (id_persona, id_club, fecha_oferta, importe)
--   VALUES (NEW.id_persona, NEW.id_club, NEW.fecha_oferta, NEW.importe);
--   RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;

-- CREATE TRIGGER registro_oferta_trigger
-- AFTER INSERT ON ofertas
-- FOR EACH ROW
-- EXECUTE FUNCTION registro_oferta();


COMMIT;

