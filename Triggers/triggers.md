# Modelo Entidad-Relación Víveros
## Grupo 5

### Primer trigger: email de viveros

```mysql
DELIMITER //
CREATE PROCEDURE crear_email(IN nombre VARCHAR,IN apellido VARCHAR, IN dominio VARCHAR, OUT email VARCHAR)

BEGIN

  DECLARE nombre_email VARCHAR
  DECLARE apellido_email VARCHAR
  SET nombre_email = SELECT SUBSTRING(nombre,1,3);
  SET apellido_email = SELECT SUBSTRING(apellido,1,3);

  SET email = SELECT CONCAT(nombre_email,apellido_email,@,dominio);

END;
//


DELIMITER //
CREATE TRIGGER trigger_crear_email_before_insert BEFORE INSERT ON TABLE clientes FOR EACH ROW

BEGIN

  IF NEW.email IS NULL THEN
    DECLARE nuevo_email VARCHAR;
    SET nuevo_email = CALL crear_email;
    INSERT INTO clientes (email)
      VALUES(nuevo_email);
  ELSE
    INSERT INTO cliente (email)
      VALUES(NEW.email);
  END IF;
END;
//
```

### Segundo trigger: catastro

```mysql
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
```

### Tercer trigger: stock viveros

```mysql
DELIMITER //
CREATE TRIGGER control_stock AFTER INSERT ON TABLE pedido_producto FOR EACH ROW

BEGIN

  UPDATE producto
    SET prodcuto.stock = producto.stock - cantidad;

    IF stock < 0 THEN
      RAISE EXCEPTION 'DONT HAVE ENOUGH PRODUCTS';
      END IF;
END;
//
```