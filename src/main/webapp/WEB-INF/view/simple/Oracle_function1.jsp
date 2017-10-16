<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Oracle常用功能</title>
<style type="text/css">
p {font-size:14px;font-family:宋体;text-align:left;}
</style>
</head>
<body style="text-align:center">
<h3 align="center">记录自己平常使用过程中遇到的问题</h3>
当然这里是以开发者角度，而非DBA

<div style="width:50%;margin:0 auto;height:auto;">
	<h4 align="left">◎ 自治事务，PRAGMA AUTONOMOUS_TRANSACTION;</h4>
	<p>有次在写一个函数时有DML操作报错ORA-14551: 无法在查询中执行DML操作，一般的函数是不支持DML语句的，一般也不会有这个，解决办法是引入自治事务，比如：</p>
	<p style="color:#00CACA">create or replace function func_name(par in varchar2) return varchar2 is<BR>
	pragma autonomous_transaction;--自治事务<BR>
	begin<BR>
	end;</p>
	<p>附参考资料：<a target="_blank" href="http://blog.csdn.net/gigiouter/article/details/7616627">ORA-14551: 无法在查询中执行 DML 操作</a></p>
	<h4 align="left">◎ 创建物化试图遭遇ORA-12052</h4>
	<p>比如先创建物化视图日志：</p>
	<p style="color:#00CACA">create materialized view log on table_name with primary key;</p>
	<p>接着创建物化视图：</p>
	<p style="color:#00CACA">create materialized view view_name<BR>
	refresh fast on commit<BR>
	enable query rewrite<BR>
	as select a.c1 ,b.c2 from table1 a, table2 b where a.c1 = b.c1;</p>
	<p>这里采用快速刷新机制，即只将自上次刷新以后对基表进行的所有操作刷新到物化视图中去。</p>
	<p>此时就会报ORA-12052，解决办法是创建物化视图日志时添加rowid，比如：</p>
	<p style="color:#00CACA">create materialized view log on table_name with rowid, primary key including new values;</p>
	<p>并且在sql中把rowid select出来，如：</p>
	<p style="color:#00CACA">create materialized view view_name<BR>
	refresh fast on commit<BR>
	enable query rewrite<BR>
	as select a.c1 ,b.c2,a.rowid a_rowid, b.rowid b_rowid from table1 a, table2 b where a.c1 = b.c1;</p>
	<p>附参考资料：<a target="_blank" href="http://blog.csdn.net/wll_1017/article/details/9378451">物化视图快速刷新的限制</a></p>
	<h4 align="left">◎ 存储过程中执行动态SQL权限不足</h4>
	<p>有次在用存储过程处理数据时，需要借助临时表，比如：</p>
	<p style="color:#00CACA">create or replace procedure proc_name is<BR>
	begin<BR>
  	Execute Immediate 'create table temp_tab(id varchar2(32))';<BR>
	end proc_name;</p>
	<p>然后提示权限不足，有两个解决办法，1是显示授予系统权限grant create table to user;2是加入Authid Current_User关键字来使用role权限，第二种方法简单些，如：</p>
	<p style="color:#00CACA">create or replace procedure proc_name Authid Current_User is<BR>
	begin<BR>
  	Execute Immediate 'create table temp_tab(id varchar2(32))';<BR>
	end proc_name;</p>
	<p>附参考资料：<a target="_blank" href="http://wallimn.iteye.com/blog/1900195">Authid Current_User简单介绍</a></p>
	<h4 align="left">◎ row_number()over()</h4>
	<p>说到去重，可能会想到distinct, not exists甚至group by 因为group by 也能达到去重效果，但是不建议这么做</p>
	<p>以上关键字都能够很好的处理对某个字段去重操作，但是涉及到排序就蛋疼，比如根据身份证去重但是要保留最新的数据，解决办法是使用row_number()over()函数，例子：</p>
	<p style="color:#00CACA">select * from ( <br>
	select c1,c2,c3, row_number()over(parttion by cardno order by createtime desc) as row_no from your_table<br>
	) where row_no = 1;<br>
	<h4 align="left">◎ minus</h4>
	<p>Oracle集合操作函数有union、intersect、minus。集合操作符专门用于合并多条select 语句的结果，包括：UNION, UNION ALL, INTERSECT , MINUS。当使用集合操作符时，必须确保不同查询的列个数和数据类型匹配</p>
	<p>因为最近老是需要根据a表过滤b的数据，刚开始使用not exists效率并不好，解决办法是源表数据量大时用minus效率高，小时用not exists效率高</p>
	<p style="color:#00CACA">select c1 from tab1 minus select c2 from tab2;</p>
	<h4 align="left">◎ merge into</h4>
	<p>有次在使用存储过程处理数据时需要判断某个条件然后决定是insert还是update，后来听同事说这样做效率不高而且代码不简洁，解决办法是使用merge into</p>
	<p>MERGE语句是Oracle9i新增的语法，用来合并UPDATE和INSERT语句。通过MERGE语句，根据一张表或子查询的连接条件对另外一张表进行查询，连接条件匹配上的进行UPDATE，无法匹配的执行INSERT。这个语法仅需要一次全表扫描就完成了全部工作，执行效率要高于INSERT＋UPDATE。</p>
	<p style="color:#00CACA">merge into taba a using (select c1,c2,c3 from tabb) b on (a.c1 = b.c1) when matched then<br>
	update set a.c2 = b.c2, a.c3 = b.c3<br>
	when not matched then<br>
	insert values(b.c1, b.c2, b.c3);</p>
</div>
</body>
</html>