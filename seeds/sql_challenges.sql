-- Challenge 1
SELECT title FROM albums 
    WHERE artist_id = '1'
    AND release_year >= '1980' 
    AND release_year <= '1990';

-- Challenge 2
DELETE FROM albums WHERE id = '12';

SELECT * FROM albums;

-- Challenge 3
INSERT INTO artists 
    (name, genre, id)
    VALUES('Bruno Mars', 'Pop', '6');

SELECT * FROM artists;

INSERT INTO albums
    (title, release_year, artist_id)
    VALUES('Doo - Wops & Hooligans', '2010', '6');

SELECT * FROM albums;