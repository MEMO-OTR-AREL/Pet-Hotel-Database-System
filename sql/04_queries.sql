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

SELECT
    AVG(price_per_night) AS average_room_price
FROM room;

SELECT 
	service.service_name,
	SUM(reservation_service.quantity) AS total_usage
FROM reservation_service
JOIN service
	ON reservation_service.service_id = service.service_id
GROUP BY service.service_id, service.service_name
ORDER BY total_usage DESC;

SELECT
    reservation.reservation_id,
    pet.name AS pet_name,
    room.room_number,
    reservation.check_in_date,
    reservation.check_out_date,
    reservation.status
FROM reservation
JOIN pet
    ON reservation.pet_id = pet.pet_id
JOIN room
    ON reservation.room_id = room.room_id
ORDER BY reservation.check_in_date;

SELECT
    room_id,
    room_number,
    room_type,
    price_per_night,
    capacity
FROM room
WHERE room_id NOT IN (
    SELECT room_id
    FROM reservation
    WHERE '2026-11-08' >= check_in_date
      AND '2026-11-08' < check_out_date
);