/*
小美是一所中学的信息科技老师，她有一张 seat 座位表，平时用来储存学生名字和与他们相对应的座位 id。
其中纵列的 id 是连续递增的
小美想改变相邻俩学生的座位。
你能不能帮她写一个 SQL query 来输出小美想要的结果呢？

 

示例：

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+
假如数据输入的是上表，则输出结果如下：

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+
注意：

如果学生人数是奇数，则不需要改变最后一个同学的座位。
*/
DROP TABLE IF EXISTS `seat`;
CREATE TABLE IF NOT EXISTS seat (
    id int,
    student varchar(255)
);

TRUNCATE TABLE seat;

INSERT INTO seat (id, student)
VALUES ('1', 'Abbot'),
    ('2', 'Doris'),
    ('3', 'Emerson'),
    ('4', 'Green'),
    ('5', 'Jeames');

select * from seat;

SELECT CASE 
        WHEN mod(id, 2) != 0
        AND id != counts THEN id + 1
        WHEN mod(id, 2) != 0
        AND id = counts THEN id
        ELSE id - 1
    END AS id, student
FROM seat, (
        SELECT COUNT(*) AS counts
        FROM seat
    ) seat_counts
ORDER BY id;

SELECT *
FROM (
    SELECT CASE 
            WHEN mod(a.id, 2) = 1
            AND a.id = p.m THEN a.id
            WHEN mod(a.id, 2) = 1
            AND a.id != p.m THEN a.id + 1
            ELSE a.id - 1
        END AS id, a.student
    FROM seat a, (
            SELECT MAX(b.id) AS m
            FROM seat b
        ) p
) t
ORDER BY t.id;