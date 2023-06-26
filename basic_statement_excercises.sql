-- Use the albums_db database.
USE albums_db;
SHOW TABLES;
-- What is the primary key for the albums table?
SHOW CREATE TABLE albums;
-- 		PRIMARY KEY (id)
-- What does the column named 'name' represent?
SELECT * FROM albums;
-- 		name of albums
-- What do you think the sales column represents?
-- 		total sales in millions
-- Find the name of all albums by Pink Floyd.
SELECT name FROM albums WHERE artist = 'Pink Floyd';
-- 		The Dark Side of the Moon,The Wall

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 		1967
-- What is the genre for the album Nevermind?
SELECT genre FROM albums WHERE name = "Nevermind";
-- 		Grunge, Alternative rock
-- Which albums were released in the 1990s?
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT name FROM albums WHERE sales <= "20";
SELECT name AS low_selling_albums FROM albums WHERE sales <= "20";