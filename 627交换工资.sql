/*
给定一个 Salary表，如下所示，有m=男性 和 f=女性的值 。交换所有的 f 和 m 值(例如，将所有 f 值更改为 m，反之亦然)。要求使用一个更新查询，并且没有中间临时表。

例如:
+------+------+------+--------+
| id   | name | sex  | Salary |
+------+------+------+--------+
|    1 | A    | m    |   2500 |
|    2 | B    | f    |   1500 |
|    3 | C    | m    |   5500 |
|    4 | D    | f    |    500 |
+------+------+------+--------+
运行你所编写的查询语句之后，将会得到以下表:
+------+------+------+--------+
| id   | name | sex  | Salary |
+------+------+------+--------+
|    1 | A    | f    |   2500 |
|    2 | B    | m    |   1500 |
|    3 | C    | f    |   5500 |
|    4 | D    | m    |    500 |
+------+------+------+--------+
*/
/*
给定一个 Salary表，如下所示，有m=男性 和 f=女性的值 。交换所有的 f 和 m 值(例如，将所有 f 值更改为 m，反之亦然)。要求使用一个更新查询，并且没有中间临时表。

例如:
+------+------+------+--------+
| id   | name | sex  | Salary |
+------+------+------+--------+
|    1 | A    | m    |   2500 |
|    2 | B    | f    |   1500 |
|    3 | C    | m    |   5500 |
|    4 | D    | f    |    500 |
+------+------+------+--------+
运行你所编写的查询语句之后，将会得到以下表:
+------+------+------+--------+
| id   | name | sex  | Salary |
+------+------+------+--------+
|    1 | A    | f    |   2500 |
|    2 | B    | m    |   1500 |
|    3 | C    | f    |   5500 |
|    4 | D    | m    |    500 |
+------+------+------+--------+
*/
DROP TABLE IF EXISTS `Salary`;

CREATE TABLE IF NOT EXISTS Salary (
    id int,
    name varchar(100),
    sex char(1),
    Salary int
);

TRUNCATE TABLE Salary;

INSERT INTO Salary (id, name, sex, Salary)
VALUES ('1', 'A', 'm', '2500'),
    ('2', 'B', 'f', '1500'),
    ('3', 'C', 'm', '5500'),
    ('4', 'D', 'f', '500');

SELECT *
FROM Salary;

UPDATE Salary
SET sex = if(sex = 'm', 'f', 'm');

SELECT *
FROM Salary;