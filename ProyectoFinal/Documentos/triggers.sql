DELIMITER $$
USE `mydb`$$
CREATE TRIGGER insert_competition AFTER INSERT ON `COMPETICION` FOR EACH ROW
BEGIN

	UPDATE PAIS
    SET PAIS.NCompeticiones = PAIS.NCompeticiones + 1
    WHERE COMPETICION.NombrePais = PAIS.NombrePais;

END;$$

USE `mydb`$$
CREATE TRIGGER insert_club AFTER INSERT ON `CLUB` FOR EACH ROW
BEGIN

	UPDATE PAIS
    SET PAIS.NClubs = PAIS.NClubs + 1
    WHERE CLUB.NombrePais = PAIS.NombrePais;

END;$$

USE `mydb`$$
CREATE TRIGGER insert_player AFTER INSERT ON `JUGADOR` FOR EACH ROW
BEGIN

	UPDATE PAIS
    SET PAIS.NJugadores = PAIS.NJugadores + 1
    WHERE JUGADOR.Nacionalidad = PAIS.NombrePais;

END;$$

USE `mydb`$$
CREATE TRIGGER value_club BEFORE INSERT ON `CLUB` FOR EACH ROW
BEGIN

IF(PosicionRankingClubs BETWEEN 1 AND 100) THEN
	IF(valorClub > 1000000000) THEN
		RAISE EXCEPTION 'El valor del club supera el limite establecido';
	END IF;
END IF;

 IF(PosicionRankingClubs > 100) THEN
	IF(valorClub > 500000000) THEN
		RAISE EXCEPTION 'El valor del club supera el limite establecido';
	END IF;
END IF;
END;$$

USE `mydb`$$
CREATE TRIGGER value_club BEFORE UPDATE ON `CLUB` FOR EACH ROW
BEGIN

IF(PosicionRankingClubs BETWEEN 1 AND 100) THEN
	IF(valorClub > 1000000000) THEN
		RAISE EXCEPTION 'El valor del club supera el limite establecido';
	END IF;
END IF;

 IF(PosicionRankingClubs > 100) THEN
	IF(valorClub > 500000000) THEN
		RAISE EXCEPTION 'El valor del club supera el limite establecido';
	END IF;
END IF;
END;$$

USE `mydb`$$
CREATE TRIGGER player_club BEFORE INSERT ON `JUGADOR` FOR EACH ROW

BEGIN

IF JUGADOR.DNIJugador = CONTRATO.DNIJugador THEN

IF CONTRATO.FechaFin > sysdate THEN

RAISE EXCEPTION "El jugador tiene contrato en vigor con un club";
END IF;
END IF;

END;$$

USE `mydb`$$
CREATE TRIGGER player_federado BEFORE INSERT ON `JUGADOR` FOR EACH ROW

BEGIN

IF JUGADOR.Federado = 0 THEN

RAISE EXCEPTION 'El jugador debe estar federado y abonar el seguro';

END IF;
END;$$

USE `mydb`$$
CREATE TRIGGER player_seleccion BEFORE INSERT ON `JUGADOR` FOR EACH ROW

BEGIN

IF JUGADOR.Seleccionado = 1 THEN
	IF JUGADOR.NombreClub = null THEN
		RAISE EXCEPTION 'El jugador debe pertenecer a un club, al estar en la seleccion';
	END IF;
END IF;
END;$$

USE `mydb`$$
CREATE TRIGGER player_offer BEFORE INSERT ON `OFERTA` FOR EACH ROW

BEGIN

IF OFERTA.DNIJugador = CONTRATO.DNIJugador THEN

IF(CONTRATO.FechaFin > sysdate) THEN

RAISE EXCEPTION "El jugador tiene contrato en vigor con un club";
END IF;
END IF;

END;$$

USE `mydb`$$
CREATE TRIGGER matches_club BEFORE INSERT ON `PARTIDOS` FOR EACH ROW

BEGIN
DECLARE countlocal INT;
DECLARE countvisitante INT;

SET countlocal = (SELECT count(*) FROM PARTIDOS WHERE NEW.ClubLocal = PARTIDOS.ClubLocal OR NEW.ClubLocal = PARTIDOS.ClubVisitante GROUP BY NEW.ClubLocal);
set countvisitante = (SELECT count(*) FROM PARTIDOS WHERE NEW.ClubVisitante = PARTIDOS.ClubLocal OR NEW.ClubVisitante = PARTIDOS.ClubVisitante GROUP BY NEW.ClubVisitante);

IF COMPETICION.NPartidos < countlocal THEN
	RAISE EXCEPTION 'No se puede insertar, supera el limite de partidos', ;
ELSE
	IF  COMPETICION.NPartidos < countvisitante THEN
		RAISE EXCEPTION 'No se puede insertar, supera el limite de partidos';
	END IF;
END IF;
END;$$

DELIMITER ;
