-- The job of this file is to reset all of our important database tables.
-- And add any data that is needed for the tests to run.
-- This is so that our tests, and application, are always operating from a fresh
-- database state, and that tests don't interfere with each other.

-- First, we must delete (drop) all our tables
DROP TABLE IF EXISTS posts;
DROP SEQUENCE IF EXISTS posts_id_seq;
DROP TABLE IF EXISTS comments;
DROP SEQUENCE IF EXISTS comments_id_seq;

-- Then, we recreate them
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;
-- Create the table without the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  content VARCHAR(255)
);

-- Then the table with the foreign key second.
CREATE SEQUENCE IF NOT EXISTS comments_id_seq;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  content int,
-- The foreign key name is always {other_table_singular}_id
  post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
);

-- -- Finally, we add any records that are needed for the tests to run
-- INSERT INTO books (title, author_name) VALUES ('Nineteen Eighty-Four', 'George Orwell');
-- INSERT INTO books (title, author_name) VALUES ('Mrs Dalloway', 'Virginia Woolf');
-- INSERT INTO books (title, author_name) VALUES ('Emma', 'Jane Austen');
-- INSERT INTO books (title, author_name) VALUES ('Dracula', 'Bram Stoker');
-- INSERT INTO books (title, author_name) VALUES ('The Age of Innocence', 'Edith Wharton');
