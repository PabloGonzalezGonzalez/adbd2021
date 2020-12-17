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
