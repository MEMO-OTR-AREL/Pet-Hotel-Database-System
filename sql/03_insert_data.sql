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