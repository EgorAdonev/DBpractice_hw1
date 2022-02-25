--PostgreSQL 14.2 
--restaurant DB by Egor Adonev

--Data Definition 
--create schema restaurant
    drop table if exists restaurant.customer;
	drop table if exists restaurant.ord;
	drop table if exists restaurant.ord_item;

	create table restaurant.customer (
		cID 		serial,
		email		varchar(30),
		phone		varchar(12),
		paymentID	int
	);

	create table restaurant.ord (
		pk_orderID		int primary key,
		orderitem	varchar(20),
		orderdate	date,
		customerID 	int not null references customer(cID),
		qty 		int,
		ready		bool
	);

	create table restaurant.ord_item (
		ord_itemID	int primary key,
		foodID		int,
		quantity	int,
		price		decimal(5,3),
		constraint 	fk_ordID 	
		foreign key(ord_itemID)
		references ord(pk_orderID)
	);

-- Data Manipulation
 insert into restaurant.customer(cID,email,phone,paymentID) 
 values (1,'iamhungry@icloud.com','+79997864433',43231),
 (2,'iamhungry@icloud.ru','+79997864433',43231);