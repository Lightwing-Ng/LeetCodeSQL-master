/*
某城市开了一家新的电影院，吸引了很多人过来看电影。该电影院特别注意用户体验，专门有个 LED显示板做电影推荐，上面公布着影评和相关电影描述。

作为该电影院的信息部主管，您需要编写一个 SQL查询，找出所有影片描述为非 boring (不无聊) 的并且 id 为奇数 的影片，结果请按等级 rating 排列。

 

例如，下表 Cinema:

+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   1     | War       |   great 3D   |   8.9     |
|   2     | Science   |   fiction    |   8.5     |
|   3     | irish     |   boring     |   6.2     |
|   4     | Ice song  |   Fantacy    |   8.6     |
|   5     | House card|   Interesting|   9.1     |
+---------+-----------+--------------+-----------+
对于上面的例子，则正确的输出是为：

+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   5     | House card|   Interesting|   9.1     |
|   1     | War       |   great 3D   |   8.9     |
+---------+-----------+--------------+-----------+
*/
DROP TABLE IF EXISTS `Cinema`;

CREATE TABLE IF NOT EXISTS Cinema (
    id int,
    movie varchar(255),
    description varchar(255),
    rating float(2, 1)
);

TRUNCATE TABLE Cinema;

INSERT INTO Cinema (id, movie, description, rating)
VALUES ('1', 'War', 'great 3D', '8.9'),
    ('2', 'Science', 'fiction', '8.5'),
    ('3', 'Irish', 'boring', '6.2'),
    ('4', 'Ice song', 'Fantacy', '8.6'),
    ('5', 'House card', 'Interesting', '9.1');

SELECT *
FROM Cinema;

SELECT *
FROM Cinema
WHERE description != 'boring'
    AND MOD(id, 2) != 0
ORDER BY rating DESC;

SELECT *
FROM Cinema
WHERE id % 2 = 1
    AND description <> "boring"
ORDER BY rating DESC;