DELIMITER //
CREATE TRIGGER vivr_una_vivienda BEFORE INSERT OR UPDATE ON vivienda FOR EACH ROW
    BEGIN

    DECLARE contador INT
    DECLARE contador_pisos INT
    DECLARE contador_total INT

    SET contador_pisos = COUNT(piso.DNIcabeza) WHERE (piso.DNIcabeza = NEW.DNIcabeza);
    SET contador = COUNT(DNIcabeza) WHERE (DNIcabeza = NEW.DNIcabeza);
    SET contador_total = contador + contador_pisos;

    IF contador_total > 1 THEN
        IF NEW.zona = OLD.zona THEN
            RAISE EXCEPTION "Ya posee una vivienda en esta zona";
    END IF;
    END IF;
END;
//

DELIMITER //
CREATE TRIGGER vivr_una_piso BEFORE INSERT OR UPDATE ON piso FOR EACH ROW
    BEGIN

    DECLARE contador INT
    DECLARE contador_viviendas INT
    DECLARE contador_total INT

    SET contador_viviendas = COUNT(viviendas.DNIcabeza) WHERE (viviendas.DNIcabeza = NEW.DNIcabeza);
    SET contador = COUNT(DNIcabeza) WHERE (DNIcabeza = NEW.DNIcabeza);
    SET contador_total = contador + contador_pisos;

    IF contador_total > 1 THEN
        IF NEW.zona = OLD.zona THEN
            RAISE EXCEPTION "Ya posee una propiedad en esta zona";
    END IF;
    END IF;
END;
//

# Por la estructura de nuestra base de datos, donde diferenciamos los bloques de pisos de las viviendas, hemos necesitado crear dos Triggers, para comprobar que un dueño no compré dos viviendas en la misma zona.
