CREATE TABLE IF NOT EXISTS Person(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
    
	parent_id INT, 
	FOREIGN KEY (parent_id) REFERENCES Person(id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS GroupZone(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL UNIQUE
);

# M-to-M table
CREATE TABLE IF NOT EXISTS Person_GroupZone(
	person_id INT NOT NULL,
    group_zone_id INT NOT NULL,
    
    PRIMARY KEY(person_id, group_zone_id),
    
    FOREIGN KEY (person_id) 
		REFERENCES Person(id)
		ON DELETE CASCADE,
	
	FOREIGN KEY (group_zone_id) 
		REFERENCES GroupZone(id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PublicHealthCenter(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL, 
	website varchar(50) NOT NULL,
    telephone_number varchar(10), 
	address varchar(50) NOT NULL, 
	facility_type varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PublicHealthWorker(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name varchar(50) NOT NULL, 
	last_name varchar(50) NOT NULL,
	date_of_birth datetime default '2021-01-01 14:29:36',
    telephone_number varchar(10), 
	city varchar(50) NOT NULL, 
	email varchar(50) NOT NULL,
    is_tested bit NOT NULL,
    
    center_id int NOT NULL, 
    
    FOREIGN KEY (center_id) 
		REFERENCES PublicHealthCenter(id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Diagnostic(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    covid_19_positive BIT NOT NULL,
    test_date datetime default now(),
    result_date datetime,
    
    person_id INT NOT NULL,
    center_id INT NOT NULL,
    worker_id INT NOT NULL,
    
    FOREIGN KEY (center_id) 
		REFERENCES PublicHealthCenter(id)
		ON DELETE CASCADE,
	
	FOREIGN KEY (person_id) 
		REFERENCES Person(id)
		ON DELETE CASCADE,
		
	FOREIGN KEY (worker_id) 
		REFERENCES PublicHealthWorker(id)
		ON DELETE CASCADE
);


