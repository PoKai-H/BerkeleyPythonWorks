CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child FROM dogs
  JOIN parents ON parents.parent = dogs.name
  ORDER BY height DESC;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size FROM dogs d
  JOIN sizes s
  WHERE d.height BETWEEN s.min + 1 and s.max
  ;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT p1.child AS sibling1, p2.child AS sibling2 FROM parents AS p1, parents AS p2 
  WHERE p1.parent = p2.parent AND p1.child < p2.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || s1.name || " and " || s2.name || ", have the same size: " || s1.size
  FROM siblings sb
  JOIN size_of_dogs s1 ON sb.sibling1 = s1.name
  JOIN size_of_dogs s2 ON sb.sibling2 = s2.name
  WHERE s1.size = s2.size;
  

-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) FROM dogs
  GROUP BY fur
  HAVING MIN(height) > AVG(height) * 0.7 AND MAX(height) < AVG(height) * 1.3;

