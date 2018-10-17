DELIMITER //
 CREATE or replace PROCEDURE empty_cart_procedure(IN userid int)
   BEGIN
   	Delete from cart where user_id=userid;
   
   END //
 DELIMITER ;

