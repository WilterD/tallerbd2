BEGIN;

CREATE TABLE FEDERACIONES(
    nombre VARCHAR(30) PRIMARY KEY,
    fechaCreacion DATE NOT NULL
);

CREATE TABLE CLUBES (
    codigoClub INTEGER PRIMARY KEY,
    nombreClub VARCHAR(30) NOT NULL,
    nroSocios INTEGER NOT NULL,
    nombreFederacion VARCHAR(30),
    CONSTRAINT fk_federaciones FOREIGN KEY (nombreFederacion) REFERENCES FEDERACIONES (nombre)
);

CREATE TABLE CLASIFICACIONES(
    codigoClub INTEGER NOT NULL,
    temporada VARCHAR(30) NOT NULL,
    competicion VARCHAR(30) NOT NULL,
    posicion INTEGER DEFAULT 0,
    CONSTRAINT pk_clasificaciones PRIMARY KEY(codigoClub,temporada,competicion),
    CONSTRAINT fk_club FOREIGN KEY (codigoClub) REFERENCES CLUBES(codigoClub)
);

CREATE TABLE JUEGOSGANADOS(
    codigoClub INTEGER NOT NULL,
    temporada VARCHAR(30) NOT NULL,
    competicion VARCHAR(30) NOT NULL,
    cantidad INTEGER DEFAULT 0,
    CONSTRAINT pk_juegosGanados PRIMARY KEY(codigoClub,temporada,competicion),
    CONSTRAINT fk_clubes FOREIGN KEY (codigoClub) REFERENCES CLUBES(codigoClub)
);

CREATE TABLE EMPLEADOS(
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    fechaNac DATE NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    numeroTlf INTEGER NOT NULL,
    tipo VARCHAR(30) NOT NULL
);

CREATE TABLE ENTRENADORES (
    codigoEmp INTEGER PRIMARY KEY,
    fueJugador BOOlEAN DEFAULT FALSE,
    fechaInicio DATE NOT NULL,
    CONSTRAINT fk_empEnt FOREIGN KEY(codigoEmp) REFERENCES EMPLEADOS(codigo)
);

CREATE TABLE JUGADORES (
    codigoEmp INTEGER PRIMARY KEY,
    peso FLOAT NOT NULL,
    altura FLOAT NOT NULL,
    CONSTRAINT fk_empJug FOREIGN KEY(codigoEmp) REFERENCES EMPLEADOS(codigo)
);

CREATE TABLE ESPECIALIDADES (
    codigoJugador INTEGER NOT NULL,
    nombreEsp VARCHAR(50) NOT NULL,
    gradoDominio INT NOT NULL,
    CONSTRAINT fk_jugadores FOREIGN KEY (codigoJugador) REFERENCES JUGADORES(codigoEmp)
);

CREATE TABLE OFERTAN (
    codigoEmpleado INTEGER NOT NULL,
    codigoClub INTEGER NOT NULL,
    fechaOferta DATE NOT NULL,
    importe FLOAT NOT NULL,
    CONSTRAINT pk_ofertan PRIMARY KEY(codigoEmpleado,codigoClub,fechaOferta),
    CONSTRAINT fk_empleado FOREIGN KEY (codigoEmpleado) REFERENCES EMPLEADOS(codigo),
    CONSTRAINT fk_codigo_club FOREIGN KEY (codigoClub) REFERENCES CLUBES(codigoClub)
);

CREATE TABLE COMPITEN (
    pClub INTEGER NOT NULL,
    sClub INTEGER NOT NULL,
    temporada VARCHAR(30) NOT NULL,
    competicion VARCHAR(30) NOT NULL,
    clubGanador INTEGER NOT NULL,
    CONSTRAINT pk_compiten PRIMARY KEY(pClub,sClub,temporada,competicion,clubGanador),
    CONSTRAINT fk_pClub FOREIGN KEY (pClub) REFERENCES CLUBES(codigoClub),
    CONSTRAINT fk_sClub FOREIGN KEY (sClub) REFERENCES CLUBES(codigoClub)
);

CREATE TABLE CONTRATAN (
    codigoEmpleado INTEGER NOT NULL,
    codigoClub INTEGER NOT NULL,
    fecha_baja DATE NOT NULL,
    importe FLOAT NOT NULL,
    CONSTRAINT pk_contratan PRIMARY KEY(codigoEmpleado,codigoClub,fecha_baja),
    CONSTRAINT fk_emp FOREIGN KEY (codigoEmpleado) REFERENCES EMPLEADOS(codigo),
    CONSTRAINT fk_cod_club FOREIGN KEY (codigoClub) REFERENCES CLUBES(codigoClub)
);

CREATE OR REPLACE FUNCTION actualizarJuegosGanados() RETURNS TRIGGER AS $$
BEGIN
    -- Si el clubGanador es el primer club (pClub), se incrementa en 1 la cantidad de juegos ganados.
    IF NEW.clubGanador = NEW.pClub THEN
        UPDATE JUEGOSGANADOS
        SET cantidad = cantidad + 1
        WHERE codigoClub = NEW.clubGanador AND temporada = NEW.temporada AND competicion = NEW.competicion;
    ELSE
        -- Si el clubGanador es el segundo club (sClub), se actualiza la cantidad de juegos ganados.
        UPDATE JUEGOSGANADOS
        SET cantidad = cantidad + 1
        WHERE codigoClub = NEW.clubGanador AND temporada = NEW.temporada AND competicion = NEW.competicion;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_actualizar_juegosganados
AFTER INSERT OR UPDATE ON COMPITEN
FOR EACH ROW
EXECUTE PROCEDURE actualizarJuegosGanados();




COMMIT;
