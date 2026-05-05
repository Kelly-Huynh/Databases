INSERT INTO albums(title, release_year, artist_id)
    VALUES('Abbey Road', 1969, 7),
        ('Rubber Soul', 1965, 7);


UPDATE artists SET genre = 'Disco' WHERE id = 2;

UPDATE albums SET release_year = 1989 WHERE id = 2;

UPDATE albums SET title = 'Super Trouper (Deluxe Edition)' WHERE id =4;

DELETE FROM albums WHERE artist_id = 4;


DELETE FROM albums WHERE id =3;

DELETE FROM albums WHERE artist_id = 2;

DELETE FROM albums WHERE release_year <1980;

DELETE FROM artists WHERE id = 4;

DELETE FROM artists WHERE id =1;
DELETE FROM albums WHERE artist_id = 1;