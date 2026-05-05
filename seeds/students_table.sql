DROP TABLE IF EXISTS students;
DROP SEQUENCE IF EXISTS students_id_seq;

CREATE SEQUENCE IF NOT EXISTS students_id_seq;

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohorts text
);