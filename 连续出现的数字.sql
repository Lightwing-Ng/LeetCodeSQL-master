/*
编写一个 SQL 查询，查找所有至少连续出现三次的数字。

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
例如，给定上面的 Logs 表， 1 是唯一连续出现至少三次的数字。

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/
/*
编写一个 SQL 查询，查找所有至少连续出现三次的数字。

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
例如，给定上面的 Logs 表， 1 是唯一连续出现至少三次的数字。

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/
CREATE TABLE IF NOT EXISTS Logs (
    Id int,
    Num int
);

TRUNCATE TABLE Logs;

INSERT INTO Logs (Id, Num)
VALUES ('1', '1'),
    ('2', '1'),
    ('3', '1'),
    ('4', '2'),
    ('5', '1'),
    ('6', '2'),
    ('7', '2');

SELECT *
FROM Logs;

SELECT DISTINCT l1.Num
FROM Logs l1
    JOIN Logs l2 ON l1.Id = l2.Id - 1
    JOIN Logs l3 ON l1.Id = l3.Id - 2
WHERE l1.Num = l2.Num
    AND l2.Num = l3.Num;
/*
+------+
| Num  |
+------+
|    1 |
+------+
1 row in set (0.00 sec)
*/