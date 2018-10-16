DELIMITER //
 CREATE or replace PROCEDURE empty_cart_procedure()
   BEGIN
   	TRUNCATE TABLE cart;
   
   END //
 DELIMITER ;

