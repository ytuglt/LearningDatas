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

