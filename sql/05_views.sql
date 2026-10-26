CREATE VIEW reservation_details AS
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
    ON reservation.room_id = room.room_id;

SELECT * FROM reservation_details;

CREATE VIEW service_usage_summary AS
SELECT
    service.service_id,
    service.service_name,
    SUM(reservation_service.quantity) AS total_usage
FROM service
JOIN reservation_service
    ON service.service_id = reservation_service.service_id
GROUP BY service.service_id, service.service_name;

SELECT * FROM service_usage_summary
ORDER BY total_usage DESC;