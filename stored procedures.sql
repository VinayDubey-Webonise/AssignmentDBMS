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




DELIMITER //
 CREATE or replace PROCEDURE order_procedure(IN usr_id int,IN ord_stat varchar(30),IN del_address varchar(100),IN pay_id int,IN amt double,IN dt Date)
   BEGIN

     DECLARE oid int;
     Declare var_id int;
   	INSERT INTO orders(user_id,order_status,delivery_address,payment_id,amount,order_date) VALUES(usr_id,ord_stat,del_address,pay_id,amt,dt);

SELECT id into oid from orders ORDER BY id DESC LIMIT 1;

update payments set order_id= oid where id=pay_id;

call order_products_procedure(oid,usr_id);
    
   END //
 DELIMITER ;

__________________________________________________________________________________________

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

CALL empty_cart_procedure();

close cur1;
   END //
 DELIMITER ;

_____________________________________________________________________________________________

DELIMITER //
 CREATE or replace PROCEDURE empty_cart_procedure()
   BEGIN
   	TRUNCATE TABLE cart;
   
   END //
 DELIMITER ;

______________________________________________________________________________________________

delimiter $$
create or replace trigger password_check before insert on users
 for each row
  begin
  if new.password = '' then
  signal sqlstate '45000';
  end if;
  end;$$


CREATE VIEW view_orders
AS SELECT orders.id, orders.amount, orders.order_date,discounts.percentage,payment_modes.mode_type,payments.payment_status FROM payment_modes,payments,orders,discounts WHERE payments.payment_mode_id=payment_modes.id and discounts.id=payments.discount_id and payments.id=orders.payment_id;
