/*
Employee 表包含所有员工信息，每个员工有其对应的 Id, salary 和 department Id 。

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
+----+-------+--------+--------------+
Department 表包含公司所有部门的信息。

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
编写一个 SQL 查询，找出每个部门工资前三高的员工。例如，根据上述给定的表格，查询结果应返回：

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
*/
DROP TABLE IF EXISTS `Employee`;

CREATE TABLE IF NOT EXISTS Employee (
    Id int,
    Name varchar(255),
    Salary int,
    DepartmentId int
);

DROP TABLE IF EXISTS `Department`;

CREATE TABLE IF NOT EXISTS Department (
    Id int,
    Name varchar(255)
);

TRUNCATE TABLE Employee;

INSERT INTO Employee (Id, Name, Salary, DepartmentId)
VALUES ('1', 'Joe', '70000', '1'),
    ('2', 'Henry', '80000', '2'),
    ('3', 'Sam', '60000', '2'),
    ('4', 'Max', '90000', '1');

TRUNCATE TABLE Department;

INSERT INTO Department (Id, Name)
VALUES ('1', 'IT'),
    ('2', 'Sales');

SELECT *
FROM Employee;

SELECT *
FROM Department;

SELECT D.Name AS Department, E.Name AS Employee, E.Salary AS Salary
FROM Employee E
    INNER JOIN Department D ON E.DepartmentId = D.Id
WHERE (
    SELECT COUNT(DISTINCT Salary)
    FROM Employee
    WHERE DepartmentId = E.DepartmentId
        AND Salary > E.Salary
) < 3
ORDER BY E.DepartmentId, E.Salary DESC;