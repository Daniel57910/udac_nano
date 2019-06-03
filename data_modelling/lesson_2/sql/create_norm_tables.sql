
CREATE TABLE IF NOT EXISTS d_cust (
	cust_id SERIAL, 
	cust_name VARCHAR(40),
	PRIMARY KEY(cust_id)
);

CREATE TABLE IF NOT EXISTS d_employee (
	employee_id SERIAL, 
	employee_name VARCHAR(40),
	PRIMARY KEY(employee_id)
);

CREATE TABLE IF NOT EXISTS d_album (
	album_id SERIAL, 
	album_name VARCHAR(40),
	PRIMARY KEY(album_id)
);


CREATE TABLE IF NOT EXISTS d_sale (
	sale_id SERIAL,
	sale_amount INTEGER not null
);


CREATE TABLE IF NOT EXISTS f_transaction (
	transaction_id SERIAL,
	transaction_year INTEGER not null,
	cust_id INTEGER references d_cust(cust_id),
	employee_id INTEGER references d_employee(employee_id),
	album_id INTEGER references d_album(album_id),
	sale_id INTEGER references d_sale(sale_id),
	PRIMARY KEY(transaction_id)
);
-- indexes

CREATE INDEX d_cust_cust_name_idx on d_cust(cust_name);
CREATE INDEX d_employee_employee_name_idx on d_employee(employee_name);
CREATE INDEX d_album_album_name_idx on d_album(album_name);
CREATE INDEX f_transaction _year_idx on f_transaction(transaction_year);
