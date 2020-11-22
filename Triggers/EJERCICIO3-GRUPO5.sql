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
