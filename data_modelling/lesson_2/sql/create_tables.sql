CREATE TABLE IF NOT EXISTS tCust (
	cust_id SERIAL, 
	cust_name VARCHAR(40),
	PRIMARY KEY(cust_id)
);

CREATE TABLE IF NOT EXISTS tEmployee (
	employee_id SERIAL, 
	employee_name VARCHAR(40),
	PRIMARY KEY(employee_id)
);

CREATE TABLE IF NOT EXISTS tAlbum (
	album_id SERIAL, 
	album_name VARCHAR(40),
	PRIMARY KEY(album_id)
);

CREATE TABLE IF NOT EXISTS tTransaction(
	transaction_id SERIAL,
	transaction_year INTEGER not null,
	cust_id INTEGER references tCust(cust_id),
	employee_id INTEGER references tEmployee(employee_id),
	album_id INTEGER references tAlbum(album_id),
	PRIMARY KEY(transaction_id)
);