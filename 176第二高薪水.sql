/*
176. 第二高的薪水
题目描述提示帮助提交记录社区讨论阅读解答
 SQL架构随机一题
编写一个 SQL 查询，获取 Employee 表中第二高的薪水（Salary） 。

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
例如上述 Employee 表，SQL查询应该返回 200 作为第二高的薪水。如果不存在第二高的薪水，那么查询应返回 null。

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
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

SELECT (
    SELECT 
      DISTINCT Salary 
    FROM 
      Employee 
    ORDER BY 
      Salary DESC 
    LIMIT 
      1 OFFSET 1
  ) AS SecondHighestSalary;