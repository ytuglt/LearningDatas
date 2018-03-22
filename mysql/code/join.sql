-- 查询cms_user: id,username 
-- provinces: proName
-- cms_user 的proId 对应省份表中的id
SELECT cms_user.id,username,proName FROM cms_user,provinces 
WHERE cms_user.proId=provinces.id;

-- 查询cms_user:id,username,email,sex
-- provinces: proName
SELECT u.id,u.username,u.email,u.sex,p.proName 
FROM cms_user AS u
INNER JOIN provinces AS p
ON u.proId=p.id;

-- 连接查询和where条件查询效果是一样的，但是一般where用来做为查询的第一个条件，使用内连接来查询

-- 通过CROSS JOIN 实现,效果和INNER JOIN相同
SELECT u.id,u.username,u.email,u.sex,p.proName 
FROM provinces AS p
CROSS JOIN cms_user AS u
ON p.id=u.proId;

-- 通过JOIN 实现,效果和INNER JOIN相同
SELECT u.id,u.username,u.email,u.sex,p.proName 
FROM provinces AS p
JOIN cms_user AS u
ON p.id=u.proId;

-- 查询cms_news: id,title
-- cms_cate:catename
-- cms_admin:username,role
SELECT n.id,n.title,c.catename,a.username,a.role 
FROM cms_cate AS c
JOIN 
cms_news AS n
ON n.cId=c.id
JOIN
cms_admin AS a
ON n.aId=a.id;

--------------------------------

-- 插入错误的数据
INSERT cms_user(username,passwd,regTime,proId)
VALUES('TEST2','TEST2','1381203974',20);

-- 内连接查询，只能查询到符合条件的记录，上面插入的id错误的记录是查询不到的
SELECT u.id,u.username,u.email,u.sex,p.proName 
FROM cms_user AS u
INNER JOIN provinces AS p
ON u.proId=p.id;

-- 左外连接查询
SELECT u.id,u.username,u.email,u.sex,p.proName 
FROM cms_user AS u
LEFT JOIN provinces AS p
ON u.proId=p.id;

SELECT u.id,u.username,u.email,u.sex,p.proName 
FROM provinces AS p
LEFT JOIN cms_user AS u
ON u.proId=p.id;

-- 右外连接查询
SELECT u.id,u.username,u.email,u.sex,p.proName 
FROM cms_user AS u
RIGHT JOIN provinces AS p
ON u.proId=p.id;

SELECT u.id,u.username,u.email,u.sex,p.proName 
FROM provinces AS p
RIGHT JOIN cms_user AS u
ON u.proId=p.id;

------------------------------------------------
-- 外键

-- 创建部门表department(主表)
-- id depName
CREATE TABLE IF NOT EXISTS department(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
depName VARCHAR(20) NOT NULL UNIQUE
)ENGINE=INNODB;

INSERT department(depName) VALUES('教学部'),
('市场部'),
('运营部'),
('督导部');

SHOW TABLES;

-- 创建员工表employee(字表)
-- id,username,depId
CREATE TABLE IF NOT EXISTS employee(
id SMALLINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED
)ENGINE=INNODB;

INSERT employee(username,depId) VALUES('king',1),
('queen',2),
('张三',3),
('李四',4),
('王五',1);

-- 内连接查询
SELECT e.id,e.username,d.depName FROM
employee AS e
JOIN
department AS d
ON e.depId=d.id;

-- 假设督导部解散
-- 删除督导部
DELETE FROM department WHERE depName='督导部';

SELECT * FROM department;

-- 这样就会导致部门删掉了，但是部门对应的员工还存在

DROP TABLE employee,department;

-- 创建部门表department(主表)
-- id depName
CREATE TABLE IF NOT EXISTS department(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
depName VARCHAR(20) NOT NULL UNIQUE
)ENGINE=INNODB;

INSERT department(depName) VALUES('教学部'),
('市场部'),
('运营部'),
('督导部');

SHOW TABLES;

-- 创建员工表employee(字表)
-- id,username,depId
CREATE TABLE IF NOT EXISTS employee(
id SMALLINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED,
FOREIGN KEY(depId) REFERENCES department(id)
)ENGINE=INNODB;

INSERT employee(username,depId) VALUES('king',1),
('queen',2),
('张三',3),
('李四',4),
('王五',1);

-- 注意此处一定要先有主表，才可以创建外键字表

DESC employee;
SHOW CREATE TABLE employee;

-- 删除主表中的记录
DELETE FROM department WHERE id=1;

-- 执行上面语句会报错，需要首先删除字表中对应的员工

-- 删除employee中的属于1部门的人
DELETE FROM employee WHERE depId=1;
DELETE FROM department WHERE id=1;

-- 插入垃圾数据,会报错
INSERT employee(username,depId) VALUES('test',11);


-- 删除员工表
DROP TABLE employee;

-- 指定外键名称
-- 创建员工表employee(字表)
-- id,username,depId
CREATE TABLE IF NOT EXISTS employee(
id SMALLINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED,
CONSTRAINT emp_fk_dep FOREIGN KEY(depId) REFERENCES department(id)
)ENGINE=INNODB;

SHOW CREATE TABLE employee;

INSERT employee(username,depId) VALUES('king',3),
('queen',2),
('张三',3),
('李四',4),
('王五',2);

-- 删除外键
ALTER TABLE employee DROP FOREIGN KEY emp_fk_dep;

-- 添加外键,表中数据对应约束必须正确，否则添加外键失败
ALTER TABLE employee ADD CONSTRAINT emp_fk_dep FOREIGN KEY(depId) REFERENCES department(id);

--------------
DROP TABLE employee,department;

-- 创建部门表department(主表)
-- id depName
CREATE TABLE IF NOT EXISTS department(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
depName VARCHAR(20) NOT NULL UNIQUE
)ENGINE=INNODB;

INSERT department(depName) VALUES('教学部'),
('市场部'),
('运营部'),
('督导部');

SHOW TABLES;

-- 创建员工表employee(字表)
-- id,username,depId
CREATE TABLE IF NOT EXISTS employee(
id SMALLINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED,
FOREIGN KEY(depId) REFERENCES department(id) ON DELETE CASCADE 
)ENGINE=INNODB;

INSERT employee(username,depId) VALUES('king',1),
('queen',2),
('张三',3),
('李四',4),
('王五',1);

SHOW CREATE TABLE employee;

-- 删除部门表中的第一个部门
DELETE FROM department WHERE id=1;
UPDATE department SET id=id+10;


-- 创建员工表employee(字表)
-- id,username,depId
CREATE TABLE IF NOT EXISTS employee(
id SMALLINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED,
FOREIGN KEY(depId) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;


-- 创建员工表employee(字表)
-- id,username,depId
CREATE TABLE IF NOT EXISTS employee(
id SMALLINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED,
FOREIGN KEY(depId) REFERENCES department(id) ON DELETE SET NULL ON UPDATE SET NULL
)ENGINE=INNODB;


-- 联合查询
SELECT username FROM employee UNION SELECT username FROM cms_user;

SELECT username FROM employee UNION ALL SELECT username FROM cms_user;

-- 下面这个查询会报错
SELECT id,username FROM employee UNION ALL SELECT username FROM cms_user;

SELECT id,username FROM employee UNION ALL SELECT username,age FROM cms_user;