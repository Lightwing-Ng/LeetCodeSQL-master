/*
有一个Courses 表 ，有: student (学生) 和 class (课程)。

请列出所有超过或等于5名学生的课。

例如,表:

+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
应该输出:

+---------+
| class   |
+---------+
| Math    |
+---------+
Note:
学生在每个课中不应被重复计算。
*/
DROP TABLE IF EXISTS `Courses`;

CREATE TABLE IF NOT EXISTS Courses (
    student varchar(255),
    class varchar(255)
);

TRUNCATE TABLE Courses;

INSERT INTO Courses (student, class)
VALUES ('A', 'Math'),
    ('B', 'English'),
    ('C', 'Math'),
    ('D', 'Biology'),
    ('E', 'Math'),
    ('F', 'Computer'),
    ('G', 'Math'),
    ('H', 'Math'),
    ('I', 'Math');

SELECT *
FROM Courses;

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;

SELECT class
FROM (
    SELECT class, COUNT(DISTINCT student) AS num
    FROM Courses
    GROUP BY class
) temp_table
WHERE num >= 5;