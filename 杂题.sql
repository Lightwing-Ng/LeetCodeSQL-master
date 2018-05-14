DROP TABLE IF EXISTS `TableX`; 
CREATE TABLE `TableX` (
    `Code` int(11) NOT NULL AUTO_INCREMENT, 
    `Name` char(20) NOT NULL DEFAULT '', 
    `Age` int(11) NOT NULL DEFAULT '20', 
    PRIMARY KEY (`Code`)
  ) ENGINE = InnoDB DEFAULT CHARSET = UTF8; 
BEGIN;
 
INSERT INTO `TableX` 
VALUES 
  ('97001', '张三', '22'), 
  ('97002', '赵四', '21'), 
  ('97003', '张飞', '20'), 
  ('97004', '李五', '22'); 
COMMIT; 

DROP TABLE IF EXISTS `TableY`; 
CREATE TABLE `TableY` (
    `Code` int(11) NOT NULL AUTO_INCREMENT, 
    `Class` char(20) NOT NULL DEFAULT '', 
    `Score` int(11) NOT NULL DEFAULT '0', 
    PRIMARY KEY (`Code`, `Class`)
  ) ENGINE = InnoDB DEFAULT CHARSET = UTF8; 
BEGIN; 
INSERT INTO `TableY` 
VALUES 
  ('97001', '数学', '80'), 
  ('97002', '计算机', '59'), 
  ('97003', '计算机', '60'), 
  ('97004', '数学', '55'); 
COMMIT; 

SELECT 
  * 
FROM 
  TableX; 
/*
  +-------+--------+-----+
  | Code  | Name   | Age |
  +-------+--------+-----+
  | 97001 | 张三   |  22 |
  | 97002 | 赵四   |  21 |
  | 97003 | 张飞   |  20 |
  | 97004 | 李五   |  22 |
  +-------+--------+-----+
*/

SELECT 
  * 
FROM 
  TableY; 
  /*
  +-------+-----------+-------+
  | Code  | Class     | Score |
  +-------+-----------+-------+
  | 97001 | 数学      |    80 |
  | 97002 | 计算机    |    59 |
  | 97003 | 计算机    |    60 |
  | 97004 | 数学      |    55 |
  +-------+-----------+-------+
  */
  
/*
  TableX有三个字段Code、 Name、 Age、 其中Code为主键；
  TableY有三个字段Code、 Class、Score, 其中Code + Class 为主键。两表记录如下：
  
  Code Name Age Code Class Score
  97001 张三 22 97001 数学 80
  97002 赵四 21 97002 计算机 59
  97003 张飞 20 97003 计算机 60
  97004 李五 22 97004 数学 55
*/
  
/*
  1、请写出SQL，找出所有姓张的学生，并按年龄从小到大排列；
*/
SELECT 
  * 
FROM 
  TableX 
WHERE 
  Name LIKE '张%' 
ORDER BY 
  Age; 
/*
  +-------+--------+-----+
  | Code  | Name   | Age |
  +-------+--------+-----+
  | 97003 | 张飞   |  20 |
  | 97001 | 张三   |  22 |
  +-------+--------+-----+
  2 rows in set (0.00 sec)
  
  2、请写出SQL，取出计算机科考成绩不及格的学生；
*/

SELECT 
  * 
FROM 
  TableX x, 
  TableY y 
WHERE 
  x.Code = y.Code 
  AND Class = '计算机' 
  AND Score & lt; 60; 
/*
  +-------+--------+-----+-------+-----------+-------+
  | Code  | Name   | Age | Code  | Class     | Score |
  +-------+--------+-----+-------+-----------+-------+
  | 97002 | 赵四   |  21 | 97002 | 计算机    |    59 |
  +-------+--------+-----+-------+-----------+-------+
  1 row in set (0.00 sec)

3、通过等值联接，取出Name、Class、Score，请写出SQL即输出结果
*/
SELECT 
  x.Name, 
  y.Class, 
  y.Score 
FROM 
  TableX x, 
  TableY y 
WHERE 
  x.Code = y.Code;
/*
+--------+-----------+-------+
| Name   | Class     | Score |
+--------+-----------+-------+
| 张三   | 数学      |    80 |
| 赵四   | 计算机    |    59 |
| 张飞   | 计算机    |    60 |
| 李五   | 数学      |    55 |
+--------+-----------+-------+
4 rows in set (0.00 sec)

4、通过外联接，取出每个学生的Name、Class、Score、请写SQL输出结果
*/

/*
5、请写SQL，在TableX 表中增加一条学生记录(学号：97005 姓名：赵六 年龄：20)；
*/
INSERT INTO TableX(Code, Name, Age) 
VALUES 
  ('97005', '赵六', '20'); 
COMMIT;

/*
6、李五的年龄记录错了，应该是21，请写SQL，根据主键进行更新；
*/

UPDATE 
  TableX 
SET 
  Age = '21' 
WHERE 
  Code in (
    SELECT 
      Code 
    FROM 
      TableX 
    WHERE 
      Name = '李五'
  );