# {{Movies}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](https://journey.makers.tech/pages/single-table-design-recipe-template).

*In this template, we'll use an example table `movies`*

```
# EXAMPLE
As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' titles.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' genres.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' release years.

Table: movies

Columns:
id | title | genre | release_year
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE movies RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO movies (title, genre, release_year) VALUES ('Up', 'Adventure', 2009);
INSERT INTO movies (title, genre, release_year) VALUES ('Parasite', 'Thriller' 2019);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 movies_directory < seeds/movies_directory.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```python
# EXAMPLE
# Table name: movie

# Model class
# (in lib/movie.py)
class Movie


# Repository class
# (in lib/movies_repository.py)
class MoviesRepository

```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```python
# EXAMPLE
# Table name: movies

# Model class
# (in lib/movie.py)

class Movie:
    def __init__(self):
        self.id = 0
        self.title = ""
        self.genre = ""
        self.release_year = ""

        # Replace the attributes by your own columns.


# We can set the attributes to default empty values and set them later,
# here's an example:
#
# >>> student = Student()
# >>> student.name = "Will"
# >>> student.genre, release_year = "September Devs"
# >>> student.name
# 'Will'
# >>> student.genre, release_year
# 'September Devs'

```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```python
# EXAMPLE
# Table name: movies

# Repository class
# (in lib/movies_repository.py)

class MoviesRepository():

    # Selecting all records
    # No arguments
    def all():
        # Executes the SQL query:
        # SELECT id, title, genre, release_year FROM movies;

        # Returns an array of Student objects.

        # Gets a single record by its ID
        # One argument: the id (number)
    def find(id):
        # Executes the SQL query:
        # SELECT id, title, genre, release_year FROM movies WHERE id = $1;

        # Returns a single Movie object.

        # Add more methods below for each operation you'd like to implement.

    # def create(movie)
    # 

    # def update(movie)
    # 

    # def delete(movie)
    # 

```

## 6. Write Test Examples

Write Python code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as Pytest tests.

```python
# EXAMPLES

# 1
# Get all movies

repo = MoviesRepository()

movies = repo.all()

len(movies) # =>  2

movies[0].id # =>  1
movies[0].title # =>  'Up'
movies[0].genre # =>  'Adventure'
movies[0].release_year # => 2009

movies[1].id # =>  2
movies[1].title # =>  'Parasite'
movies[1].genre # =>  'Thriller'
movies[1].release_year # => 2019

# 2
# Get a single movie

repo = MoviesRepository()

movie = repo.find(1)

movie.id # =>  1
movie.title # =>  'Up'
movie.genre# =>  'Adventure'
movie.release_year# => 2009

# Add more examples for each method
```

Encode this example as a test.


## 7. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._