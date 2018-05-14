/*
编写一个 SQL 查询，获取 Employee 表中第 n 高的薪水（Salary）。

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
例如上述 Employee 表，n = 2 时，应返回第二高的薪水 200。如果不存在第 n 高的薪水，那么查询应返回 null。

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
*/

DROP TABLE IF EXISTS `Employee`; 
CREATE TABLE `Employee` (
    `Id` int(4) NOT NULL AUTO_INCREMENT, 
    `Salary` int(4) NOT NULL, 
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8; 
BEGIN; 

INSERT INTO `Employee` 
VALUES 
  ('1', '100'), 
  ('2', '200'), 
  ('3', '300'); 
COMMIT; 

SELECT 
  * 
FROM 
  Employee;

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN DECLARE M INT; 
SET 
  M = N - 1; 
RETURN (
    # Write your MySQL query statement below.
    SELECT 
      DISTINCT Salary 
    FROM 
      Employee 
    ORDER BY 
      Salary DESC 
    LIMIT 
      M, 
      1
  ); END