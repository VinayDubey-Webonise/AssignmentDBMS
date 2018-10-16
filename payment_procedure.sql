DELIMITER //
 CREATE or replace PROCEDURE payment_procedure(IN usr_id int,IN dis_id int,IN pay_mode int,IN del_address varchar(100))
   BEGIN
   	DECLARE total int;
    DECLARE pid int;
   	SELECT SUM(total_amount) into total FROM cart;
	
	insert into payments(user_id,payment_status,amount,payment_date,payment_mode_id,discount_id) values(usr_id,"Success",total,current_date(),pay_mode,dis_id);
	
    SELECT id into pid from payments ORDER BY id DESC LIMIT 1;
    
    CALL order_procedure(usr_id,"Success",del_address,pid,total,current_date());
   END //
 DELIMITER ;



