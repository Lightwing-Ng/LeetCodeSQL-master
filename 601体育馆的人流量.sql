/*
X 市建了一个新的体育馆，每日人流量信息被记录在这三列信息中：序号 (id)、日期 (date)、 人流量 (people)。

请编写一个查询语句，找出高峰期时段，要求连续三天及以上，并且每天人流量均不少于100。

例如，表 Stadium：

+------+------------+-----------+
| id   | date       | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
对于上面的示例数据，输出为：

+------+------------+-----------+
| id   | date       | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
Note:
每天只有一行记录，日期随着 id 的增加而增加。
*/

DROP TABLE IF EXISTS `Stadium`;

CREATE TABLE IF NOT EXISTS Stadium (
    id int,
    date DATE NULL,
    people int
);

TRUNCATE TABLE Stadium;

INSERT INTO Stadium (id, date, people)
VALUES ('1', '2017-01-01', '10'),
    ('2', '2017-01-02', '109'),
    ('3', '2017-01-03', '150'),
    ('4', '2017-01-04', '99'),
    ('5', '2017-01-05', '145'),
    ('6', '2017-01-06', '1455'),
    ('7', '2017-01-07', '199'),
    ('8', '2017-01-08', '188');

SELECT *
FROM Stadium;

SELECT DISTINCT s1.*
FROM stadium s1, stadium s2, stadium s3
WHERE s1.people >= 100
    AND s2.people >= 100
    AND s3.people >= 100
    AND ((s1.id - s2.id = 1
            AND s2.id - s3.id = 1)
        OR (s2.id - s1.id = 1
            AND s1.id - s3.id = 1)
        OR (s3.id - s2.id = 1
            AND s2.id - s1.id = 1))
ORDER BY s1.id;

SELECT a.id, a.date, a.people
FROM stadium a, (
        SELECT MAX(p.id) AS mid, MAX(p.c) AS mc
        FROM (
            SELECT l.id, l.date, l.people
                , CASE 
                    WHEN l.people >= 100 THEN @cur := @cur + 1
                    ELSE @cur := 0
                END AS c
                , CASE 
                    WHEN @cur > 0 THEN @index := @index
                    ELSE @index := @index + 1
                END AS d
            FROM stadium l, (
                    SELECT @cur := 0, @index := 0
                ) t
        ) p
        GROUP BY p.d
        HAVING COUNT(p.c) > 3
    ) t
WHERE a.id <= t.mid
    AND a.id > t.mid - t.mc;