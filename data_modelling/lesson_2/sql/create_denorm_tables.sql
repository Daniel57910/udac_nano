
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

-- denormalization reduces number of joins, but requires data replication and more complex writes

CREATE TABLE IF NOT EXISTS f_transaction (
	transaction_id SERIAL,
	transaction_year INTEGER not null,
	sale_amount INTEGER not null,
	cust_name VARCHAR(40) not null,
	employee_name VARCHAR(40_ not null,
	album_name VARCHAR(40), not null,
	PRIMARY KEY(transaction_id)
);

-- indexes

CREATE INDEX d_cust_cust_name_idx on d_cust(cust_name);
CREATE INDEX d_employee_employee_name_idx on d_employee(employee_name);
CREATE INDEX d_album_album_name_idx on d_album(album_name);
CREATE INDEX f_transaction _year_idx on f_transaction(transaction_year);
