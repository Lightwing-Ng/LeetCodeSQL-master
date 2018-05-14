DROP TABLE IF EXISTS `成绩表`; 
CREATE TABLE `成绩表` (
    `姓名` char(20) NOT NULL DEFAULT '' COMMENT '姓名', 
    `课程` char(10) NOT NULL DEFAULT '' COMMENT '课程', 
    `分数` int(11) NOT NULL DEFAULT '0' COMMENT '分数'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8; 
BEGIN; 

INSERT INTO `成绩表` 
VALUES 
  ('张三', '语文', '81'), 
  ('张三', '数学', '75'), 
  ('李四', '语文', '56'), 
  ('李四', '数学', '90'), 
  ('王五', '语文', '81'), 
  ('王五', '数学', '100'), 
  ('王五', '英语', '49'); 
COMMIT; 

SELECT 
  * 
FROM 
  成绩表; 
/*
  表名：成绩表
  +--------+--------+--------+
  | 姓名   | 课程   | 分数   |
  +--------+--------+--------+
  | 张三   | 语文   |     81 |
  | 张三   | 数学   |     75 |
  | 李四   | 语文   |     56 |
  | 李四   | 数学   |     90 |
  | 王五   | 语文   |     81 |
  | 王五   | 数学   |    100 |
  | 王五   | 英语   |     49 |
  +--------+--------+--------+
  给出成绩全部合格的学生信息（包含姓名、课程、分数），注：分数在60以上评为合格
  答案：
*/

SELECT 
  * 
FROM 
  成绩表 
WHERE 
  姓名 IN (
    SELECT 
      姓名 
    FROM 
      成绩表 
    GROUP BY 
      姓名 
    HAVING 
      MIN(分数) & >= 60
  );

/*
+--------+--------+--------+
| 姓名   | 课程   | 分数   |
+--------+--------+--------+
| 张三   | 语文   |     81 |
| 张三   | 数学   |     75 |
+--------+--------+--------+
2 rows in set (0.00 sec)
*/