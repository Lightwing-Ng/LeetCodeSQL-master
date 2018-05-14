/*
某网站包含两个表，Customers 表和 Orders 表。编写一个 SQL 查询，找出所有从不订购任何东西的客户。

Customers 表：

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders 表：

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
例如给定上述表格，你的查询应返回：

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
*/
/*
某网站包含两个表，Customers 表和 Orders 表。编写一个 SQL 查询，找出所有从不订购任何东西的客户。

Customers 表：

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders 表：

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
例如给定上述表格，你的查询应返回：

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
*/
CREATE TABLE IF NOT EXISTS Customers (
    Id int,
    Name varchar(255)
);

CREATE TABLE IF NOT EXISTS Orders (
    Id int,
    CustomerId int
);

TRUNCATE TABLE Customers;

INSERT INTO Customers (Id, Name)
VALUES ('1', 'Joe'),
    ('2', 'Henry'),
    ('3', 'Sam'),
    ('4', 'Max');

SELECT *
FROM Customers;

TRUNCATE TABLE Orders;

INSERT INTO Orders (Id, CustomerId)
VALUES ('1', '3'),
    ('2', '1');

SELECT *
FROM Orders;

SELECT c.name AS Customers
FROM Customers c
    LEFT JOIN Orders o ON o.CustomerId = c.Id
WHERE o.CustomerId IS NULL;

SELECT Name AS Customers
FROM Customers
WHERE Id NOT IN (
    SELECT CustomerId
    FROM Orders
);