/*
给定一个 Weather 表，编写一个 SQL 查询，来查找与之前（昨天的）日期相比温度更高的所有日期的 Id。
+---------+------------+------------------+
| Id(INT) | Date(DATE) | Temperature(INT) |
+---------+------------+------------------+
|       1 | 2015-01-01 |               10 |
|       2 | 2015-01-02 |               25 |
|       3 | 2015-01-03 |               20 |
|       4 | 2015-01-04 |               30 |
+---------+------------+------------------+
例如，根据上述给定的 Weather 表格，返回如下 Id:
+----+
| Id |
+----+
|  2 |
|  4 |
+----+
*/
 
DROP TABLE IF EXISTS `Weather`;

CREATE TABLE `Weather` (
    `Id` int(11) DEFAULT NULL,
    `RecordDate` date DEFAULT NULL,
    `Temperature` int(11) DEFAULT NULL
) ENGINE = InnoDB CHARSET = utf8mb4;

INSERT INTO `Weather`
VALUES ('1', '2015-01-01', '10'),
    ('2', '2015-01-02', '25'),
    ('3', '2015-01-03', '20'),
    ('4', '2015-01-04', '30');

SELECT *
FROM Weather;

SELECT w1.Id
FROM Weather w1
    INNER JOIN Weather w2
    ON w1.Temperature > w2.Temperature
        AND DATEDIFF(w1.RecordDate, w2.RecordDate) = 1;

SELECT a.id AS Id
FROM weather a
    LEFT JOIN weather w ON datediff(a.recorddate, w.recorddate) = 1
WHERE a.temperature > w.temperature;