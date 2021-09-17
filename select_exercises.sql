-- 2
USE albums_db;
-- 3
-- 3a: 
SELECT * FROM albums;
-- 31 rows
-- 3b: 
SELECT COUNT(DISTINCT name) FROM albums;
-- 31 unique names
-- 3c
SHOW CREATE TABLE albums;
-- id is the primary key
-- 3d: 
SELECT MIN(release_date) FROM albums;
SELECT MAX(release_date) FROM albums;
-- the oldest relaase date is 1967 and the most recent release is 2011
-- 4
-- 4a:
SELECT name FROM albums WHERE artist = 'Pink Floyd';
-- The Dark Side of the Moon and The Wall
-- 4b:
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 1967
-- 4c:
SELECT genre FROM albums WHERE name = 'Nevermind';
-- Grunge, alternative rock
-- 4d: 
SELECT name FROM albums WHERE release_date > '1989' AND release_date < '2000';
-- The Bodyguar, Jagged Little Pill, Come on Over, Falling into You, Let's Talk About Love, Dangerous, The Immaculate Collection, Titanic, Metallica, nevermind, Supernatural
-- 4e: 
SELECT name FROM albums WHERE sales < '20';
-- Grease, Bad, Sgt. Pepper's, Dirty Dancing, Let's Talk About Love, Dangerous, The Immaculate Collection, Abbey Road, Born in the USA, Brothers in Arms, Titanic, Nevermind, The Wall
-- 4f:
SELECT name FROM albums WHERE genre LIKE '%Rock%';
-- Because we would be specifically querying for the 'rock' string