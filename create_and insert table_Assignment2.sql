create table user_types
(user_type_id int PRIMARY KEY,
user_type varchar(50));

CREATE TABLE users(
	id int NOT NULL AUTO_INCREMENT,
	name char(50) NOT NULL,
	email varchar(50) UNIQUE,
	password varchar(15),
	user_type_id int,
	PRIMARY KEY(id),
	FOREIGN KEY (user_type_id) references user_types(user_type_id)
);


create table products(id int NOT NULL,
name varchar(50),
PRIMARY KEY(id)
);

create table variants(id int NOT NULL PRIMARY KEY,
color varchar(50),
size varchar(50),
price double,
product_id int,
FOREIGN KEY (product_id) REFERENCES products(id));

create table carts(id int NOT NULL,
variant_id int PRIMARY KEY,
quantity double,
total_amount double,
user_id int,
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (variant_id) REFERENCES variants(id));

create table discounts
(id int PRIMARY KEY,
discount_type varchar(50),
percentage double
);

create table payment_modes( 
id int PRIMARY KEY,
mode_type varchar(20) NOT NUll 
);


create table payments
(id int PRIMARY KEY,
order_id int,
user_id int,
payment_status varchar(50),
amount double,
payment_date Date,
payment_mode_id int,
discount_id int,
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (discount_id) REFERENCES discounts(id),
FOREIGN KEY (payment_mode_id) REFERENCES payment_modes(id)
);

create table orders
(id int PRIMARY KEY,
user_id int,
order_status varchar(20),
delivery_address varchar(60),
payment_id int,
amount double,
order_date Date,
FOREIGN KEY (payment_id) REFERENCES payments(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE payments ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES orders(id);

CREATE TABLE order_products
(order_id int,
 product_id int,
 variant_id int,
 user_id int,
 FOREIGN KEY (order_id) REFERENCES orders(id),
 FOREIGN KEY (product_id) REFERENCES products(id),
 FOREIGN KEY (user_id) REFERENCES users(id),
 FOREIGN KEY (variant_id) REFERENCES variants(id)
);

INSERT INTO `user_types` ( `user_type`) VALUES ( 'Customer'), ( 'Seller');

INSERT INTO `users` ( `name`, `email`, `password`, `user_type_id`) VALUES ( 'Vinay', 'vinay@gmail.com', '123456', '1'), ('Vijay', 'vijay@gmail.com', '123456', '1');
INSERT INTO `users` ( `name`, `email`, `password`, `user_type_id`) VALUES ( 'Shrinivas', 'shrinivas@gmail.com', '123456', '1'), ( 'Pooja', 'pooja@gmail.com', '123456', '1');
INSERT INTO `users` ( `name`, `email`, `password`, `user_type_id`) VALUES ( 'Pinkal', 'pinkal@gmail.com', '123456', '1'), ( 'Rajkumar', 'rajkumar@gmail.com', '123456', '1');

INSERT INTO `products` (`name`) VALUES ('Mobile'), ('Clothe');
INSERT INTO `products` (`name`) VALUES ('Washing Machine'), ('Bulb');
INSERT INTO `products` (`name`) VALUES ('Bed'), ('Blanket');

INSERT INTO `variants` (`varient_name`, `color`, `size`, `price`, `product_id`) VALUES ( 'Mi red 5.5 inch', 'red', '5.5', '8000', '1'), ( 'Nokia blue 5 inch', 'blue', '5', '17000', '1');

INSERT INTO `variants` ( `varient_name`, `color`, `size`, `price`, `product_id`) VALUES ( 'Samsung Black 5.5 inch', 'black', '5.5', '8000', '1'), ( 'Iphone pink 5 inch', 'pink', '5', '17000', '1');

INSERT INTO `variants` ( `varient_name`, `color`, `size`, `price`, `product_id`) VALUES ( 'Godrej Black 50 inch', 'black', '50', '18000', '2'), ( 'Whirlpool white 25 inch', 'white', '25', '17000', '2');


