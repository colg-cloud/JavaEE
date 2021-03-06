-- order by 关键字优化
USE mysql_advance;
DROP TABLE IF EXISTS tbl_A;
CREATE TABLE tbl_A (
	id INT PRIMARY KEY AUTO_INCREMENT,
	age INT,
	birth TIMESTAMP NOT NULL
);

INSERT INTO tbl_A(age, birth) VALUES
(22, NOW()),
(23, NOW()),
(24, NOW());

# 添加索引
ALTER TABLE tbl_A ADD INDEX idx_A_ageBirth(age, birth);

SELECT * FROM tbl_A;
SHOW INDEX FROM tbl_A;

# 以下方式会产生 Using filesort
EXPLAIN
SELECT * FROM tbl_A WHERE age > 20 ORDER BY birth;

EXPLAIN
SELECT * FROM tbl_A WHERE age > 20 ORDER BY birth, age;

EXPLAIN
SELECT * FROM tbl_A ORDER BY birth;

EXPLAIN
SELECT * FROM tbl_A WHERE birth > '2017-11-15 22:26:33' ORDER BY birth;

EXPLAIN
SELECT * FROM tbl_A ORDER BY age ASC, birth DESC;