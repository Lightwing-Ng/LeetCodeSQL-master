/*
这里有张 World表

+-----------------+------------+------------+--------------+---------------+
| name            | continent  | area       | population   | gdp           |
+-----------------+------------+------------+--------------+---------------+
| Afghanistan     | Asia       | 652230     | 25500100     | 20343000      |
| Albania         | Europe     | 28748      | 2831741      | 12960000      |
| Algeria         | Africa     | 2381741    | 37100000     | 188681000     |
| Andorra         | Europe     | 468        | 78115        | 3712000       |
| Angola          | Africa     | 1246700    | 20609294     | 100990000     |
+-----------------+------------+------------+--------------+---------------+
如果一个国家的面积超过300万平方公里，或者人口超过2500万，那么这个国家就是大国家。

编写一个SQL查询，输出表中所有大国家的名称、人口和地区。

例如，根据上表，我们应该输出:

+--------------+-------------+--------------+
| name         | population  | area         |
+--------------+-------------+--------------+
| Afghanistan  | 25500100    | 652230       |
| Algeria      | 37100000    | 2381741      |
+--------------+-------------+--------------+
*/

DROP TABLE IF EXISTS `world`;

CREATE TABLE `world` (
    `name` varchar(255) DEFAULT NULL,
    `continent` varchar(255) DEFAULT NULL,
    `area` int(11) DEFAULT NULL,
    `population` int(11) DEFAULT NULL,
    `gdp` varchar(20) DEFAULT NULL
) ENGINE = InnoDB CHARSET = utf8mb4;-- 

INSERT INTO `world`
VALUES ('Afghanistan', 'Asia', '652230', '25500100', '20343000000'),
    ('Albania', 'Europe', '28748', '2831741', '12960000000'),
    ('Algeria', 'Africa', '2381741', '37100000', '188681000000'),
    ('Andorra', 'Europe', '468', '78115', '3712000000'),
    ('Angola', 'Africa', '1246700', '20609294', '100990000000');

SELECT *
FROM world;

SELECT name, population, area
FROM world
WHERE area > 3000000
    OR population > 25000000;