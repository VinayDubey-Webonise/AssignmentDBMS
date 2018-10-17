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
