DROP DATABASE IF EXISTS mybatis;
CREATE DATABASE mybatis CHARACTER SET UTF8;
USE mybatis;

DROP TABLE IF EXISTS tbl_employee;
CREATE TABLE tbl_employee(
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
	last_name VARCHAR(32) COMMENT '姓名',
	gender CHAR(1) COMMENT '性别（0：男，1：女）',
	email VARCHAR(32) COMMENT '邮箱'
);

INSERT INTO tbl_employee(last_name, gender, email) VALUES('jack', '0', 'jack@colg.com');

# 新建部门表，修改员工表结构
DROP TABLE IF EXISTS tbl_dept;
CREATE TABLE tbl_dept(
	id INT(11) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
	dept_name VARCHAR(32)
);

INSERT INTO tbl_dept(dept_name) VALUE('开发部');
INSERT INTO tbl_dept(dept_name) VALUE('测试部');

ALTER TABLE tbl_employee ADD COLUMN dept_id INT(11);
# 建立外键关系
ALTER TABLE tbl_employee ADD CONSTRAINT fk_emp_dept FOREIGN KEY(dept_id) REFERENCES tbl_dept(id);

# /// ----------------------------------------------------------------------------------------------------

SELECT te.id, te.last_name, te.gender, te.email, te.dept_id
FROM tbl_employee te
WHERE te.dept_id = ?
WHERE te.id = 1;


SELECT td.id, td.dept_name
FROM tbl_dept td
WHERE td.id = 1;

SELECT
	td.id, td.dept_name,
	te.id, te.last_name, te.gender, te.email
FROM tbl_dept td
INNER JOIN tbl_employee te ON td.id = te.dept_id
WHERE td.id = 1;

SELECT
	td.id, td.dept_name,
	te.id te_id, te.last_name, te.gender, te.email, te.dept_id
FROM tbl_dept td
INNER JOIN tbl_employee te ON td.id = te.dept_id
WHERE td.id = 1 AND td.dept_name LIKE ?;

SELECT td.id, td.dept_name FROM tbl_dept td WHERE td.id = 1