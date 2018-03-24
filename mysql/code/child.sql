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

-- 由[NOT] IN 引发的子查询
SELECT id FROM department;
SELECT id,username FROM employee WHERE depId IN (1,2,3,4);

SELECT id,username FROM employee WHERE depId IN (SELECT id FROM department);

-- 插入垃圾数据
INSERT employee(username,depId) VALUES("testtest",8);
SELECT id,username FROM employee WHERE depId NOT IN (SELECT id FROM department);


------------------------------------------

-- 创建学员表student
-- id,username,score
CREATE TABLE IF NOT EXISTS student(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
score TINYINT UNSIGNED
);

INSERT student(username,score) VALUES("king",90),
("king1",10),
("king2",20),
("king3",30),
("king4",40),
("king5",50),
("king6",60),
("king7",70),
("king8",80),
("king9",100);

-- 创建奖学金表scholarship
-- id,level
CREATE TABLE IF NOT EXISTS scholarship(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
level TINYINT UNSIGNED
);

INSERT scholarship(level) VALUES(90),(80),(70);


-- 查询获得一等奖学金的学员
SELECT level FROM scholarship WHERE id=1;
SELECT id,username FROM student WHERE score>=90;

SELECT id,username FROM student WHERE score>=(SELECT level FROM scholarship WHERE id=1);

-- 查询部门表
SELECT * FROM department WHERE id=5;
-- 查询结果为空
SELECT id,username FROM employee WHERE EXISTS(SELECT * FROM department WHERE id=5);
-- 正常查询
SELECT id,username FROM employee WHERE EXISTS(SELECT * FROM department WHERE id=4);

SELECT id,username FROM employee WHERE NOT EXISTS(SELECT * FROM department WHERE id=41);


-- 查询所有获得奖学金的学员
SELECT id,username,score FROM student WHERE score>=ANY(SELECT level FROM scholarship);
SELECT id,username,score FROM student WHERE score>=SOME(SELECT level FROM scholarship);

-- 查询所有学员中获得一等奖学金的学员
SELECT id,username,score FROM student WHERE score>=ALL(SELECT level FROM scholarship);

-- 查询没有获取奖学金的学员
SELECT id,username,score FROM student WHERE score<ALL(SELECT level FROM scholarship);

-- 相当于 IN 
SELECT id,username,score FROM student WHERE score=ANY(SELECT level FROM scholarship);
SELECT id,username,score FROM student WHERE score IN (SELECT level FROM scholarship);

-- 相当于NOT IN
SELECT id,username,score FROM student WHERE score NOT IN (SELECT level FROM scholarship);
-- <>：不等于
SELECT id,username,score FROM student WHERE score <>ALL(SELECT level FROM scholarship);

CREATE TABLE test1(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
num TINYINT UNSIGNED
);

INSERT test1(id,num)
SELECT id,score FROM student;


CREATE TABLE test2(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
num TINYINT UNSIGNED
)SELECT id,score FROM student;

DESC test2;

CREATE TABLE test3(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
score TINYINT UNSIGNED
)SELECT id,score FROM student;
