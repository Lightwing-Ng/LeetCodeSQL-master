/*
Trips 表中存所有出租车的行程信息。每段行程有唯一健 Id，Client_Id 和 Driver_Id 是 Users 表中 Users_Id 的外键。Status 是枚举类型，枚举成员为 (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’)。

+----+-----------+-----------+---------+--------------------+----------+
| Id | Client_Id | Driver_Id | City_Id |        Status      |Request_at|
+----+-----------+-----------+---------+--------------------+----------+
| 1  |     1     |    10     |    1    |     completed      |2013-10-01|
| 2  |     2     |    11     |    1    | cancelled_by_driver|2013-10-01|
| 3  |     3     |    12     |    6    |     completed      |2013-10-01|
| 4  |     4     |    13     |    6    | cancelled_by_client|2013-10-01|
| 5  |     1     |    10     |    1    |     completed      |2013-10-02|
| 6  |     2     |    11     |    6    |     completed      |2013-10-02|
| 7  |     3     |    12     |    6    |     completed      |2013-10-02|
| 8  |     2     |    12     |    12   |     completed      |2013-10-03|
| 9  |     3     |    10     |    12   |     completed      |2013-10-03| 
| 10 |     4     |    13     |    12   | cancelled_by_driver|2013-10-03|
+----+-----------+-----------+---------+--------------------+----------+
Users 表存所有用户。每个用户有唯一键 Users_Id。Banned 表示这个用户是否被禁止，Role 则是一个表示（‘client’, ‘driver’, ‘partner’）的枚举类型。

+----------+--------+--------+
| Users_Id | Banned |  Role  |
+----------+--------+--------+
|    1     |   No   | client |
|    2     |   Yes  | client |
|    3     |   No   | client |
|    4     |   No   | client |
|    10    |   No   | driver |
|    11    |   No   | driver |
|    12    |   No   | driver |
|    13    |   No   | driver |
+----------+--------+--------+
写一段 SQL 语句查出 2013年10月1日 至 2013年10月3日 期间非禁止用户的取消率。基于上表，你的 SQL 语句应返回如下结果，取消率（Cancellation Rate）保留两位小数。

+------------+-------------------+
|     Day    | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 |       0.33        |
| 2013-10-02 |       0.00        |
| 2013-10-03 |       0.50        |
+------------+-------------------+
*/
DROP TABLE IF EXISTS `Trips`;

CREATE TABLE IF NOT EXISTS Trips (
    Id int,
    Client_Id int,
    Driver_Id int,
    City_Id int,
    Status ENUM('completed', 'cancelled_by_driver', 'cancelled_by_client'),
    Request_at varchar(50)
);

DROP TABLE IF EXISTS `Users`;

CREATE TABLE IF NOT EXISTS Users (
    Users_Id int,
    Banned varchar(50),
    Role ENUM('client', 'driver', 'partner')
);

TRUNCATE TABLE Trips;

INSERT INTO Trips (Id, Client_Id, Driver_Id, City_Id, Status
    , Request_at)
VALUES ('1', '1', '10', '1', 'completed'
        , '2013-10-01'),
    ('2', '2', '11', '1', 'cancelled_by_driver'
        , '2013-10-01'),
    ('3', '3', '12', '6', 'completed'
        , '2013-10-01'),
    ('4', '4', '13', '6', 'cancelled_by_client'
        , '2013-10-01'),
    ('5', '1', '10', '1', 'completed'
        , '2013-10-02'),
    ('6', '2', '11', '6', 'completed'
        , '2013-10-02'),
    ('7', '3', '12', '6', 'completed'
        , '2013-10-02'),
    ('8', '2', '12', '12', 'completed'
        , '2013-10-03'),
    ('9', '3', '10', '12', 'completed'
        , '2013-10-03'),
    ('10', '4', '13', '12', 'cancelled_by_driver'
        , '2013-10-03');

SELECT *
FROM Trips;

TRUNCATE TABLE Users;

INSERT INTO Users (Users_Id, Banned, Role)
VALUES ('1', 'No', 'client'),
    ('2', 'Yes', 'client'),
    ('3', 'No', 'client'),
    ('4', 'No', 'client'),
    ('10', 'No', 'driver'),
    ('11', 'No', 'driver'),
    ('12', 'No', 'driver'),
    ('13', 'No', 'driver');

SELECT *
FROM Users;

SELECT Request_at AS Day
    , round(COUNT(if(Status <> 'completed', true, NULL)) / COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips
WHERE Request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND Client_id NOT IN (
        SELECT Users_Id
        FROM Users
        WHERE Banned = 'Yes'
    )
GROUP BY Request_at;