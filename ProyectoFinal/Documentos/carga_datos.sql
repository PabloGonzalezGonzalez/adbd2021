-- -----------------------------------------------------
-- Data for table `mydb`.`PAIS`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`PAIS` (`NombrePais`, `PosicionRankingPaises`, `NClubs`, `NJugadores`, `NCompeticiones`) VALUES ('España', 1, 0, 0, 0);
INSERT INTO `mydb`.`PAIS` (`NombrePais`, `PosicionRankingPaises`, `NClubs`, `NJugadores`, `NCompeticiones`) VALUES ('Inglaterra', 2, 0, 0, 0);
INSERT INTO `mydb`.`PAIS` (`NombrePais`, `PosicionRankingPaises`, `NClubs`, `NJugadores`, `NCompeticiones`) VALUES ('Argentina', 3, 0, 0, 0);
INSERT INTO `mydb`.`PAIS` (`NombrePais`, `PosicionRankingPaises`, `NClubs`, `NJugadores`, `NCompeticiones`) VALUES ('Uruguay', 4, 0, 0, 0);


COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`COMPETICION`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`COMPETICION` (`NombreCompeticion`, `NombrePais`, `PremioMetalico`, `NClubs`, `PuntosFIFPro`, `Profesional`, `NPartidos`) VALUES ('LaLiga SmartBank', 'España', 150000000, 20, 2000, 1, 38);
INSERT INTO `mydb`.`COMPETICION` (`NombreCompeticion`, `NombrePais`, `PremioMetalico`, `NClubs`, `PuntosFIFPro`, `Profesional`, `NPartidos`) VALUES ('La Copa del Rey', 'España', 15000000, 192, 500, 1, 13);
INSERT INTO `mydb`.`COMPETICION` (`NombreCompeticion`, `NombrePais`, `PremioMetalico`, `NClubs`, `PuntosFIFPro`, `Profesional`, `NPartidos`) VALUES ('Barclays Premier League', 'Inglaterra', 300000000, 20, 2000, 1, 38);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`CLUB`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`CLUB` (`CodigoClub`, `NombreClub`, `ValorClub`, `PosicionRankingClubs`, `NJugadores`, `NombrePais`, `Presidente`) VALUES (1, 'FC Barcelona', 150000000, 1, 23, 'España', 'Laporta');
INSERT INTO `mydb`.`CLUB` (`CodigoClub`, `NombreClub`, `ValorClub`, `PosicionRankingClubs`, `NJugadores`, `NombrePais`, `Presidente`) VALUES (2, 'Real Madrid', 142000000, 2, 23, 'España', 'Florentino');
INSERT INTO `mydb`.`CLUB` (`CodigoClub`, `NombreClub`, `ValorClub`, `PosicionRankingClubs`, `NJugadores`, `NombrePais`, `Presidente`) VALUES (3, 'Atletico de Madrid', 100000000, 3, 20, 'España', 'Cerezo');
INSERT INTO `mydb`.`CLUB` (`CodigoClub`, `NombreClub`, `ValorClub`, `PosicionRankingClubs`, `NJugadores`, `NombrePais`, `Presidente`) VALUES (4, 'Manchester City', 200000000, 4, 25, 'Inglaterra', 'Abdul');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`JUGADOR`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`JUGADOR` (`DNIJugador`, `NombreJugador`, `Sueldo`, `Altura`, `Posicion`, `Nacionalidad`, `NombreClub`, `Federado`, `Seleccionado`) VALUES ('42234738E', 'Lionel Messi', 54000000, 170, 'DL', 'Argentina', 'FC Barcelona', 1, 1);
INSERT INTO `mydb`.`JUGADOR` (`DNIJugador`, `NombreJugador`, `Sueldo`, `Altura`, `Posicion`, `Nacionalidad`, `NombreClub`, `Federado`, `Seleccionado`) VALUES ('42166152E', 'Ansu Fati', 5000000, 175, 'EI', 'España', 'FC Barcelona', 1, 1);
INSERT INTO `mydb`.`JUGADOR` (`DNIJugador`, `NombreJugador`, `Sueldo`, `Altura`, `Posicion`, `Nacionalidad`, `NombreClub`, `Federado`, `Seleccionado`) VALUES ('42072174X', 'Luis Suarez', 25000000, 182, 'DL', 'Uruguay', 'Atletico de Madrid', 1, 0);
INSERT INTO `mydb`.`JUGADOR` (`DNIJugador`, `NombreJugador`, `Sueldo`, `Altura`, `Posicion`, `Nacionalidad`, `NombreClub`, `Federado`, `Seleccionado`) VALUES ('42222333F', 'Pedrito', NULL, 180, 'ED', 'España', NULL, 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`OFERTA`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`OFERTA` (`CodigoOferta`, `DNIJugador`, `NombreClub`, `DuracionContrato`, `Sueldo`) VALUES (1, '42222333F', 'FC Barcelona', 1095, 1000000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`CONTRATO`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`CONTRATO` (`DNIJugador`, `CodigoClub`, `FechaIni`, `FechaFin`) VALUES ('42234738E', 1, '2019-01-01', '2022-01-01');
INSERT INTO `mydb`.`CONTRATO` (`DNIJugador`, `CodigoClub`, `FechaIni`, `FechaFin`) VALUES ('42166152E', 1, '2018-01-01', '2022-07-01');
INSERT INTO `mydb`.`CONTRATO` (`DNIJugador`, `CodigoClub`, `FechaIni`, `FechaFin`) VALUES ('42072174X', 3, '2020-07-01', '2024-07-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`PARTIDOS`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`PARTIDOS` (`CodigoPartido`, `NombreCompeticion`, `ClubLocal`, `ClubVisitante`, `Resultado`) VALUES (1, 'La Copa del Rey', 'FC Barcelona', 'Atletico de Madrid', '2-1');
INSERT INTO `mydb`.`PARTIDOS` (`CodigoPartido`, `NombreCompeticion`, `ClubLocal`, `ClubVisitante`, `Resultado`) VALUES (2, 'La Copa del Rey', 'Atletico de Madrid', 'FC Barcelona', '1-1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`MINUTOS`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`MINUTOS` (`CodigoPartido`, `DNIJugador`, `Minutos`) VALUES (1, '42234738E', 90);
INSERT INTO `mydb`.`MINUTOS` (`CodigoPartido`, `DNIJugador`, `Minutos`) VALUES (1, '42166152E', 67);
INSERT INTO `mydb`.`MINUTOS` (`CodigoPartido`, `DNIJugador`, `Minutos`) VALUES (1, '42072174X', 90);
INSERT INTO `mydb`.`MINUTOS` (`CodigoPartido`, `DNIJugador`, `Minutos`) VALUES (2, '42234738E', 85);
INSERT INTO `mydb`.`MINUTOS` (`CodigoPartido`, `DNIJugador`, `Minutos`) VALUES (2, '42072174X', 90);

COMMIT;
