CREATE DATABASE IF NOT EXISTS cms DEFAULT CHARACTER SET utf8;
USE cms;
-- 管理员表cms_admin
CREATE TABLE cms_admin(
	id TINYINT UNSIGNED AUTO_INCREMENT KEY,
	username VARCHAR(20) NOT NULL UNIQUE,
	passwd CHAR(32) NOT NULL,
	email VARCHAR(50) NOT NULL DEFAULT 'admin@qq.com',
	role ENUM('普通管理员','超级管理员') DEFAULT '普通管理员'
);
INSERT cms_admin(username,passwd,email,role) VALUES('admin','admin','admin@qq.com','超级管理员');
INSERT cms_admin(username,passwd) VALUES('king','king'),
('麦子','maizi'),
('queen','queen'),
('sss','sss'),
('qaaa','qaaa'),
('test','test');

-- 创建分类表cms_cate
CREATE TABLE cms_cate(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
cateName VARCHAR(50) NOT NULL UNIQUE,
cateDesc VARCHAR(200) NOT NULL DEFAULT ''
);

INSERT cms_cate(cateName,cateDesc) VALUES('国内新闻','聚焦当今最热的国内新闻'),
('国际新闻','聚焦当今最热的国际新闻'),
('体育新闻','聚焦当今最热的体育新闻'),
('军事新闻','聚焦当今最热的军事新闻'),
('教育新闻','聚焦当今最热的教育新闻');

-- 创建新闻表 cms_news
CREATE TABLE cms_news(
id INT UNSIGNED AUTO_INCREMENT KEY,
title VARCHAR(50) NOT NULL UNIQUE,
content TEXT,
clickNum INT UNSIGNED DEFAULT 0,
pubTime INT UNSIGNED,
cId TINYINT UNSIGNED NOT NULL COMMENT '新闻所属分类，对应分类表中的id',
aId TINYINT UNSIGNED NOT NULL COMMENT '哪个管理员发布的，对应管理员表中的id'
);
INSERT cms_news(title,content,pubTime,cId,aId) VALUES('标题11111111','内容11111111111',1419818508,1,3),
('标题2222222222','内容22222222222',1419818508,1,3),
('标题333333333333333','内容3333333333',1419818508,2,3),
('标题444444444','内容444444444444',1419818508,3,5),
('标题55555555555555','内容5555555555',1419818508,2,4),
('标题66666666666666','内容666666666666',1419818508,1,5),
('标题777777777','内容777777777777',1419818508,1,5);

-- 创建省份表 provinces
CREATE TABLE provinces(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
proName VARCHAR(10) NOT NULL UNIQUE
);
INSERT provinces(proName) VALUES('北京'),
('山东'),
('天津'),
('上海'),
('安徽'),
('湖南');

-- 创建用户表 cms_user
CREATE TABLE cms_user(
id INT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
passwd CHAR(32) NOT NULL,
email VARCHAR(50) NOT NULL DEFAULT 'user@qq.com',
regTime INT UNSIGNED NOT NULL,
face VARCHAR(100) NOT NULL DEFAULT 'user.jpg',
proId TINYINT UNSIGNED NOT NULL COMMENT '用户所属省份'
);

INSERT cms_user(username,passwd,regTime,proId)
VALUES('赵武','zhangsan',1419814708,4),
('章子怡','zhangsan',1419812708,2),
('long','zhangsan',1419813708,3),
('dld','zhangsan',1419816708,4),
('dlfd','zhangsan',1419816708,3),
('liu','zhangsan',1419816708,3),
('heng','zhangsan',1419816708,3),
('hua','zhangsan',1419816708,2);



-- 查询
SELECT * FROM cms_admin;
SELECT cms_admin.* FROM cms_admin;

-- 查询管理员编号和名称
SELECT id,username FROM cms_admin;

-- 表来自于哪个数据库下db_name.tbl_name
SELECT id,username,role FROM cms.cms_admin;

-- 字段来自于哪张表
SELECT cms_admin.id,cms_admin.username FROM cms.cms_admin;


-- 给表名起别名
SELECT id,username FROM cms_admin AS a;
SELECT id,username FROM cms_admin a;

SELECT a.id,a.username,a.role FROM cms_admin AS a;

-- 给字段起别名
SELECT id AS '编号',username AS '用户名', role AS '角色' FROM cms_admin;
	























