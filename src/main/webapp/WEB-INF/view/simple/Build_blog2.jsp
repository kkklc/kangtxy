<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>如何创建个人博客</title>
<style type="text/css">
p {font-size:14px;font-family:宋体;text-align:left;}
</style>
</head>
<body style="text-align:center">
<h3 align="center">基于上篇文章这里介绍一些常用配置</h3>
<!-- <div style="width:50%;margin:0 auto;height:auto; border:1px solid #F00"> -->
<div style="width:50%;margin:0 auto;height:auto;">
	<h4 align="left">◎ 配置静态文件</h4>
	<p>为了防止访问静态资源的请求被拦截，打开spring-mvc-servlet.xml添加静态文件配置</p>
	<div align="left">
		<img src="../images/simple/static1.jpg" alt="">
	</div>
	<h4 align="left">◎ 数据库配置</h4>
	<p>Mybatis + Oracle</p>
	<p>首先创建数据库配置文件</p>
	<div align="left">
		<img src="../images/simple/db1.png" alt="">
	</div>
	<p>内容如下</p>
	<div align="left">
		<img src="../images/simple/db2.png" alt="">
	</div>
	<p>创建jdbc-context.xml</p>
	<div align="left">
		<img src="../images/simple/db3.png" alt="">
	</div>
	<p>内容如下</p>
	<div align="left">
		<img src="../images/simple/db4.jpg" alt="">
	</div>
	<p>打开web.xml，添加配置</p>
	<div align="left">
		<img src="../images/simple/db5.png" alt="">
	</div>
	<p>创建dao、entity包</p>
	<div align="left">
		<img src="../images/simple/db6.png" alt="">
	</div>
	<p>UserDao.java内容</p>
	<div align="left">
		<img src="../images/simple/db7.png" alt="">
	</div>
	<p>UserDao.xml内容</p>
	<div align="left">
		<img src="../images/simple/db8.png" alt="">
	</div>
	<p>User.java内容</p>
	<div align="left">
		<img src="../images/simple/db9.png" alt="">
	</div>
	<p>创建mybatis-config.xml</p>
	<div align="left">
		<img src="../images/simple/db10.png" alt="">
	</div>
	<p>内容如下</p>
	<div align="left">
		<img src="../images/simple/db11.png" alt="">
	</div>
	<p>打开jdbc-context.xml添加</p>
	<div align="left">
		<img src="../images/simple/db12.jpg" alt="">
	</div>
	<p>SqlSessionFactoryBean是一个工厂bean，它的作用就是解析配置（数据源、别名等）</p>
	<p>MapperFactoryBean是一个工厂bean，在spring容器里，工厂bean是有特殊用途的，当spring将工厂bean注入到其他bean里时，它不是注入工厂bean本身而是调用bean的getObject方法</p>
	<div align="left">
		<img src="../images/simple/db13.png" alt="">
	</div>
	<p>这个方法和我们之前单独使用Mybatis的方式是一样的，都是先获取一个Sqlsession对象，然后再从Sqlsession里获取Mapper对象（再次强调Mapper是一个代理对象，它代理的是mapperInterface接口，而这个接口是用户提供的dao接口）。自然，最终注入到业务层就是这个Mapper对象</p>
	<p>接下来编辑pom.xml添加依赖包</p>
	<div align="left">
		<img src="../images/simple/db14.jpg" alt="">
	</div>
	<p>这里ojdbc包比较特殊，Oracle的限制，这个包只能手动导入，如果本地安装了maven则使用命令导入，如果没有则可以使用eclipse，如下</p>
	<p>Run - Run Configurations</p>
	<p>groupId:com.oracle</p>
	<p>artifactId:ojdbc14</p>
	<p>version:10.2.0.3.0</p>
	<div align="left">
		<img src="../images/simple/db15.png" alt="">
	</div>
	<p>jdk版本要与项目的一至</p>
	<div align="left">
		<img src="../images/simple/db16.png" alt="">
	</div>
	<p>然后run</p>
	<div align="left">
		<img src="../images/simple/db17.png" alt="">
	</div>
	<p>一切配置好之后就可以操作数据库了，如下操作</p>
	<div align="left">
		<img src="../images/simple/db18.jpg" alt="">
	</div>
	<p>控制台输出内容</p>
	<div align="left">
		<img src="../images/simple/db19.jpg" alt="">
	</div>
	<p>此时查询数据库，可以到看一切正常</p>
	<div align="left">
		<img src="../images/simple/db20.jpg" alt="">
	</div>
	<p>如果代码中有用ClassPathXmlApplicationContext去加载spring配置文件，那么每次运行到此处代码，spring都会重新获得一个数据库连接，如果浏览量太大就会导致超出数据库连接，解决办法是在项目启动时去加载这个applicationContext文件，具体做法，在web.xml配置文件添加listener</p>
	<div align="left">
		<img src="../images/simple/db21.jpg" alt="">
	</div>
	<p>这样spring就会自动加载，然后就可以在controller里头获取bean实例了</p>
	<div align="left">
		<img src="../images/simple/db22.jpg" alt="">
	</div>
	<p>数据库查询结果</p>
	<div align="left">
		<img src="../images/simple/db23.jpg" alt="">
	</div>
	<p>本章完。</p>
</div>
</body>
</html>