CREATE TABLE IF NOT EXISTS Person(
	id int NOT NULL AUTO_INCREMENT,
	first_name varchar(50) NOT NULL, 
	last_name varchar(50) NOT NULL,
	date_of_birth datetime default '2021-01-01 14:29:36',
	medicare_number INT NOT NULL, 
	telephone_number varchar(10), 
	address varchar(50) NOT NULL, 
	city varchar(50) NOT NULL, 
	province varchar(50) default "QC", 
	postal_code varchar(6) NOT NULL, 
	citizenship varchar(50) default "Canadian", 
	email varchar(50) NOT NULL,
	parent INT # TODO do forign KEY
);

CREATE TABLE IF NOT EXISTS GroupZone(
	id INT NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL UNIQUE
);

# M-to-M table
CREATE TABLE IF NOT EXISTS Person_GroupZone(
	person_id INT NOT NULL,
    group_zone_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS PublicHealthCenter(
);

CREATE TABLE IF NOT EXISTS PublicHealthWorker(
);

CREATE TABLE IF NOT EXISTS Diagnostic(
	id INT NOT NULL AUTO_INCREMENT,
    person_id INT NOT NULL,
    date datetime default now(),
);


