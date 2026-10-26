CREATE TABLE owner (
	owner_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone VARCHAR(20),
	email VARCHAR(100)
);
CREATE TABLE pet (
	pet_id INTEGER PRIMARY KEY,
	owner_id INTEGER NOT NULL,
	name VARCHAR(50) NOT NULL,
	birth_date DATE,
	breed VARCHAR(50),
	FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);
CREATE TABLE cat (
	pet_id INTEGER PRIMARY KEY,
	cat_type VARCHAR(50),
	color VARCHAR(50),
	FOREIGN KEY (pet_id) REFERENCES pet(pet_id)
);
CREATE TABLE dog (
	pet_id INTEGER PRIMARY KEY,
	size VARCHAR(30),
	fur_type VARCHAR(50),
	FOREIGN KEY (pet_id) REFERENCES pet(pet_id)
);
CREATE TABLE room (
	room_id INTEGER PRIMARY KEY,
	room_number VARCHAR(20) NOT NULL,
	room_type VARCHAR(50) NOT NULL,
	price_per_night DECIMAL(10,2) NOT NULL,
	capacity INTEGER NOT NULL
);
CREATE TABLE reservation (
	reservation_id INTEGER PRIMARY KEY,
	Pet_id INTEGER NOT NULL,
	room_id INTEGER NOT NULL,
	check_in_date DATE NOT NULL,
	check_out_date DATE NOT NULL,
	status VARCHAR(30) NOT NULL,
	FOREIGN KEY (pet_id) REFERENCES pet(pet_id),
	FOREIGN KEY (room_id) REFERENCES room(room_id)
);
CREATE TABLE service (
	service_id INTEGER PRIMARY KEY,
	service_name VARCHAR(100) NOT NULL,
	price DECIMAL(10,2) NOT NULL
);
CREATE TABLE reservation_service (
	reservation_id INTEGER,
	service_id INTEGER,
	quantity INTEGER NOT NULL,
	PRIMARY KEY (reservation_id, service_id),
	FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
	FOREIGN KEY (service_id) REFERENCES service(service_id)
);
CREATE TABLE payment (
	payment_id INTEGER PRIMARY KEY,
	reservation_id INTEGER NOT NULL UNIQUE,
	amount DECIMAL(10,2) NOT NULL,
	payment_date DATE,
	transaction_id VARCHAR(100),
	payment_method VARCHAR(50),
	FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id)
);