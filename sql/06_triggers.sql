USE pet_hotel;
GO

CREATE OR ALTER TRIGGER reservation_date_check
ON reservation
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE check_out_date <= check_in_date
    )
    BEGIN
        RAISERROR ('Check-out date must be after check-in date.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO

CREATE OR ALTER TRIGGER check_cat_subtype
ON cat
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN dog d ON i.pet_id = d.pet_id
    )
    BEGIN
        RAISERROR ('A pet cannot be both a cat and a dog.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO

CREATE OR ALTER TRIGGER check_dog_subtype
ON dog
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN cat c ON i.pet_id = c.pet_id
    )
    BEGIN
        RAISERROR ('A pet cannot be both a dog and a cat.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO