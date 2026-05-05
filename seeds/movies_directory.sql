-- The job of this file is to reset all of our important database tables.
-- And add any data that is needed for the tests to run.
-- This is so that our tests, and application, are always operating from a fresh
-- database state, and that tests don't interfere with each other.

-- First, we must delete (drop) all our tables
DROP TABLE IF EXISTS movies;
DROP SEQUENCE IF EXISTS movie_id_seq;


-- Then, we recreate them
CREATE SEQUENCE IF NOT EXISTS movie_id_seq;
CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    genre VARCHAR(255),
    release_year VARCHAR(255)
);


-- Finally, we add any records that are needed for the tests to run
INSERT INTO movies (title, genre, release_year) VALUES ('Up', 'Adventure', 2009);
INSERT INTO movies (title, genre, release_year) VALUES ('Parasite', 'Thriller', 2019);
