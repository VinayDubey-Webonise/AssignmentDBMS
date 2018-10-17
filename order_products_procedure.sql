DELIMITER //
 CREATE or replace PROCEDURE order_products_procedure(IN oid int,IN usr_id int)
   BEGIN
		DECLARE done INT DEFAULT 0;
 DECLARE var_id INT;
 DECLARE cur1 CURSOR FOR SELECT variant_id from cart; 
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN cur1;

read_loop: LOOP
 IF done THEN
 LEAVE read_loop;
 END IF;
 FETCH cur1 INTO var_id;
	INSERT INTO order_products(order_id,user_id,variant_id) VALUES(oid,usr_id,var_id);
 END LOOP;

CALL empty_cart_procedure(usr_id);

close cur1;
   END //
 DELIMITER ;
