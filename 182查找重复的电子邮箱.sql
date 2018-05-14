DROP TABLE IF EXISTS `Person`;

CREATE TABLE IF NOT EXISTS Person (
    Id int,
    Email varchar(255)
);

TRUNCATE TABLE Person;

INSERT INTO Person (Id, Email)
VALUES ('1', 'a@b.com'),
    ('2', 'c@d.com'),
    ('3', 'a@b.com');

SELECT *
FROM Person;

SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1;
