CREATE OR REPLACE FUNCTION check_reservation_dates()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.check_out_date <= NEW.check_in_date THEN
        RAISE EXCEPTION 'Check-out date must be after check-in date.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER reservation_date_check
BEFORE INSERT OR UPDATE ON reservation
FOR EACH ROW
EXECUTE FUNCTION check_reservation_dates();

INSERT INTO reservation (
	reservation_id,
	pet_id,
	room_id,
	check_in_date,
	check_out_date,
	status
)
VALUES
(99, 1, 1, '2026-12-10', '2026-12-05', 'Confirmed');

CREATE OR REPLACE FUNCTION check_pet_subtype()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_TABLE_NAME = 'cat' AND EXISTS (
        SELECT 1 FROM dog WHERE pet_id = NEW.pet_id
    ) THEN
        RAISE EXCEPTION 'A pet cannot be both a cat and a dog.';
    END IF;

    IF TG_TABLE_NAME = 'dog' AND EXISTS (
        SELECT 1 FROM cat WHERE pet_id = NEW.pet_id
    ) THEN
        RAISE EXCEPTION 'A pet cannot be both a dog and a cat.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_cat_subtype
BEFORE INSERT OR UPDATE ON cat
FOR EACH ROW
EXECUTE FUNCTION check_pet_subtype();

CREATE TRIGGER check_dog_subtype
BEFORE INSERT OR UPDATE ON dog
FOR EACH ROW
EXECUTE FUNCTION check_pet_subtype();

INSERT INTO dog (pet_id, size, fur_type)
VALUES (1, 'Small', 'Short');