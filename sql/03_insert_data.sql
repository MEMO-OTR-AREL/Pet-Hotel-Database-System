INSERT INTO owner (owner_id, first_name, last_name, phone, email)
VALUES
(1, 'Eyüphan', 'Gündüz', '05436580989', 'eyüphanG@gmail.com'),
(2, 'Arda', 'Basıbüyük', '05329086435', 'ardaB@gmail.com'),
(3, 'Mehmet', 'Oter', '05547669012', 'mehmetO@gmail.com');

SELECT * FROM owner;

INSERT INTO pet (pet_id, owner_id, name, birth_date, breed)
VALUES
(1, 1, 'Mia', '2022-05-10', 'British Shorthair'),
(2, 1, 'Max', '2021-08-15', 'Golden Retriever'),
(3, 2, 'Luna', '2023-02-20', 'Siamese'),
(4, 3, 'Rocky', '2020-11-05', 'German Shepherd');

SELECT * FROM pet;

INSERT INTO cat (pet_id, cat_type, color)
VALUES
(1, 'Indoor', 'Gray'),
(2, 'Indoor', 'Cream');

INSERT INTO dog (pet_id, size, fur_type)
VALUES
(2, 'Large', 'Long'),
(4, 'Large', 'Medium');

INSERT INTO room (room_id, room_number, room_type, price_per_night, capacity)
VALUES
(1, 'R101', 'Standard', 500.00, 1),
(2, 'R102', 'Deluxe', 750.00, 2),
(3, 'R201', 'Premium', 1000.00, 2);

SELECT * FROM room;

INSERT INTO service (service_id, service_name, price)
VALUES
(1, 'Groming', 300.00),
(2, 'Walking', 150.00),
(3, 'Bath', 200.00);

SELECT * FROM service;

INSERT INTO reservation (
	reservation_id,
	pet_id,
	room_id,
	check_in_date,
	check_out_date,
	status
)
VALUES
(1, 1, 1, '2026-11-01', '2026-11-04', 'Confirmed'),
(2, 2, 2, '2026-11-03', '2026-11-07', 'Confirmed'),
(3, 3, 1, '2026-11-10', '2026-11-12', 'Confirmed'),
(4, 4, 3, '2026-11-15', '2026-11-20', 'Confirmed');

SELECT * FROM reservation;

INSERT INTO reservation_service (reservation_id, service_id, quantity)
VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 2),
(3, 3, 1),
(4, 1, 1),
(4, 2, 3);

SELECT * FROM reservation_service;

INSERT INTO payment (
	payment_id,
	reservation_id,
	amount,
	payment_date,
	transaction_id,
	payment_method
)
VALUES
(1, 1, 1800.00, '2026-10-28', 'TRX001', 'Credi Card'),
(2, 2, 3300.00, '2026-10-30', 'TRX002', 'Credit Card'),
(3, 3, 1200.00, '2026-11-08', 'TRX003', 'Cash'),
(4, 4, 5450.00, '2026-11-13', 'TRX004', 'Debit Card');

SELECT * FROM payment;