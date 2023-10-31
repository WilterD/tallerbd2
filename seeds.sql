INSERT INTO FEDERACIONES(nombre, fechaCreacion) VALUES
    ('Federacion A', '2000-05-15'),
    ('Federacion B', '1995-10-22'),
    ('Federacion C', '2010-03-08');

INSERT INTO CLUBES(codigoClub, nombreClub, nroSocios, nombreFederacion) VALUES
    (1, 'Club Uno', 500, 'Federacion A'),
    (2, 'Club Dos', 700, 'Federacion B'),
    (3, 'Club Tres', 300, 'Federacion C');

INSERT INTO CLASIFICACIONES(codigoClub, temporada, competicion, posicion) VALUES
    (1, '2022-2023', 'Liga', 2),
    (1, '2022-2023', 'Copa', 1),
    (2, '2022-2023', 'Liga', 3),
    (2, '2022-2023', 'Copa', 2),
    (3, '2022-2023', 'Liga', 1),
    (3, '2022-2023', 'Copa', 3);

INSERT INTO JUEGOSGANADOS(codigoClub, temporada, competicion, cantidad) VALUES
    (1, '2022-2023', 'Liga', 8),
    (1, '2022-2023', 'Copa', 5),
    (2, '2022-2023', 'Liga', 7),
    (2, '2022-2023', 'Copa', 4),
    (3, '2022-2023', 'Liga', 9),
    (3, '2022-2023', 'Copa', 6);

INSERT INTO EMPLEADOS(codigo, nombre, fechaNac, direccion, numeroTlf, tipo) VALUES
    (1, 'Empleado Uno', '1980-02-20', 'Calle Uno', 123456789, 'Administrativo'),
    (2, 'Empleado Dos', '1990-06-10', 'Calle Dos', 987654321, 'Entrenador'),
    (3, 'Empleado Tres', '1985-11-15', 'Calle Tres', 456789123, 'Jugador');

INSERT INTO ENTRENADORES(codigoEmp, fueJugador, fechaInicio) VALUES
    (2, TRUE, '2015-03-10');

INSERT INTO JUGADORES(codigoEmp, peso, altura) VALUES
    (3, 75.5, 180.2);

INSERT INTO ESPECIALIDADES(codigoJugador, nombreEsp, gradoDominio) VALUES
    (3, 'Remate', 4),
    (3, 'Pase', 5);

INSERT INTO OFERTAN(codigoEmpleado, codigoClub, fechaOferta, importe) VALUES
    (1, 1, '2023-01-05', 5000.00),
    (2, 2, '2023-02-10', 7000.00),
    (3, 3, '2023-03-15', 6000.00);

INSERT INTO COMPITEN(pClub, sClub, temporada, competicion, clubGanador) VALUES
    (1, 2, '2022-2023', 'Liga', 1),
    (2, 3, '2022-2023', 'Copa', 2),
    (3, 1, '2022-2023', 'Liga', 3);

INSERT INTO CONTRATAN(codigoEmpleado, codigoClub, fecha_baja, importe) VALUES
    (1, 1, '2023-12-31', 8000.00),
    (2, 2, '2023-11-30', 9000.00),
    (3, 3, '2023-10-31', 10000.00);
