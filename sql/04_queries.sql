SELECT * FROM owner;

SELECT * FROM pet WHERE owner_id = 1;

SELECT
	owner.first_name,
	owner.last_name,
	pet.name AS pet_name,
	pet.breed
FROM owner
JOIN pet ON owner.owner_id = pet.owner_id;

SELECT
	reservation_id,
	pet_id,
	room_id,
	check_in_date,
	check_out_date,
	status
FROM reservation
ORDER BY check_in_date ASC;

SELECT 
	room_id,
	COUNT(reservation_id) AS reservation_count
FROM reservation
GROUP BY room_id
ORDER BY room_id;

SELECT 
	SUM(amount) AS total_payments
FROM payment;



