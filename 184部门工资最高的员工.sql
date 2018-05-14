/*
Employee 表包含所有员工信息，每个员工有其对应的 Id, salary 和 department Id。

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department 表包含公司所有部门的信息。

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
编写一个 SQL 查询，找出每个部门工资最高的员工。例如，根据上述给定的表格，Max 在 IT 部门有最高工资，Henry 在 Sales 部门有最高工资。

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
*/
CREATE TABLE IF NOT EXISTS Employee (
    Id int,
    Name varchar(255),
    Salary int,
    DepartmentId int
);

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

SELECT *
FROM Employee;

TRUNCATE TABLE Department;

INSERT INTO Department (Id, Name)
VALUES ('1', 'IT'),
    ('2', 'Sales');

SELECT *
FROM Department;

SELECT dep.Name AS Department, emp.Name AS Employee, emp.Salary
FROM Department dep, Employee emp
WHERE emp.DepartmentId = dep.Id
    AND emp.Salary = (
        SELECT MAX(Salary)
        FROM Employee e2
        WHERE e2.DepartmentId = dep.Id
    );

# Write your MySQL query statement below
SELECT d.Name AS Department, e.Name AS Employee, t.Salary
FROM Employee e
    INNER JOIN (
        SELECT DepartmentId, MAX(Salary) AS Salary
        FROM Employee
        GROUP BY DepartmentId
    ) t USING (DepartmentId, Salary)
    INNER JOIN Department d ON d.id = t.DepartmentId;