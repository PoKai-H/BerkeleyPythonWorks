.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = "blue" AND pet = "dog";


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students
  GROUP BY smallest
  HAVING COUNT(*) = 1;


CREATE TABLE matchmaker AS
  SELECT A.pet, A.song, A.color, B.color 
  FROM students AS A, students AS B
  WHERE A.pet = B.pet AND A.song = B.song AND A.time != B.time;

CREATE TABLE sevens AS
  SELECT seven FROM students
  INNER JOIN numbers ON students.time = numbers.time
  WHERE numbers.'7' = "True" AND students.smallest <= 7;

