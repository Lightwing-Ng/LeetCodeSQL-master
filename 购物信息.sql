DROP TABLE IF EXISTS `购物信息`; 
CREATE TABLE `购物信息` (
    `购物人` char(20) NOT NULL DEFAULT '' COMMENT '购物人', 
    `商品名称` char(10) NOT NULL DEFAULT '' COMMENT '国家', 
    `数量` int(11) NOT NULL DEFAULT '0' COMMENT '数量'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8; 
BEGIN; 
INSERT INTO `购物信息` 
VALUES 
  ('A', '甲', '2'), 
  ('B', '乙', '4'), 
  ('C', '丙', '1'), 
  ('A', '丁', '2'), 
  ('B', '丙', '5');
COMMIT;


SELECT 
  * 
FROM 
  购物信息; 
  /*
      表名：购物信息
    +-----------+--------------+--------+
    | 购物人     | 商品名称     | 数量   |
    +-----------+--------------+--------+
    | A         | 甲           |      2 |
    | B         | 乙           |      4 |
    | C         | 丙           |      1 |
    | A         | 丁           |      2 |
    | B         | 丙           |      5 |
    +-----------+--------------+--------+
      给出所有购入商品为两种或两种以上的购物人记录
      */
SELECT 
  * 
FROM 
  购物信息 
WHERE 
  购物人 IN (
    SELECT 
      购物人 
    FROM 
      购物信息 
    GROUP BY 
      购物人 
    HAVING 
      COUNT(*) & amp; gt; 2
  ); 
  /*
    +-----------+--------------+--------+
    | 购物人    | 商品名称     | 数量   |
    +-----------+--------------+--------+
    | A         | 甲           |      2 |
    | B         | 乙           |      4 |
    | A         | 丁           |      2 |
    | B         | 丙           |      5 |
    +-----------+--------------+--------+
    4 rows in set (0.00 sec)
    */