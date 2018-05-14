/*
表1: Person
+-------------+---------+
| 列名         | 类型     |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
PersonId 是上表主键
表2: Address
+-------------+---------+
| 列名         | 类型    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
AddressId 是上表主键
编写一个 SQL 查询，满足条件：无论 person 是否有地址信息，都需要基于上述两表提供 person 的以下信息：
FirstName, LastName, City, State
*/

DROP TABLE IF EXISTS `Person`; 
CREATE TABLE `Person` (
    `PersonId` int(4) NOT NULL AUTO_INCREMENT, 
    `FirstName` char(10) NOT NULL, 
    `LastName` char(10) NOT NULL, 
    PRIMARY KEY (`PersonId`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8; BEGIN; INSERT INTO `Person` 
VALUES 
  ('01', 'Zeb', 'Atlas'), 
  ('02', 'Erik', 'Rhodes'), 
  ('03', 'Arpad', 'Miklos'), 
  ('04', 'Leo', 'Giamanni'); COMMIT; 
SELECT 
  * 
FROM 
  Person; 

DROP TABLE IF EXISTS `Address`; CREATE TABLE `Address` (
    `AddressId` int(4) NOT NULL, 
    `PersonId` int(4) NOT NULL, 
    `City` char(20) NOT NULL, 
    `State` char(10) NOT NULL, 
    PRIMARY KEY (`AddressId`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8; 
BEGIN; 
INSERT INTO `Address` 
VALUES 
  ('0034', '01', 'Las Vegas', 'NV'), 
  ('4022', '02', 'New York', 'NY'), 
  ('3200', '03', 'San Francisco', 'CA'), 
  ('8810', '04', 'Los Angeles', 'CA'); 
COMMIT; 
SELECT 
  * 
FROM 
  Address;

# Write your MySQL query statement below
SELECT 
  p.FirstName, 
  p.LastName, 
  a.City, 
  a.State 
FROM 
  Person p 
  LEFT JOIN Address a ON p.personId = a.personId;

-- +-----------+----------+---------------+-------+
-- | FirstName | LastName | City          | State |
-- +-----------+----------+---------------+-------+
-- | Zeb       | Atlas    | Las Vegas     | NV    |
-- | Arpad     | Miklos   | San Francisco | CA    |
-- | Erik      | Rhodes   | New York      | NY    |
-- | Leo       | Giamanni | Los Angeles   | CA    |
-- +-----------+----------+---------------+-------+
-- 4 rows in set (0.00 sec)