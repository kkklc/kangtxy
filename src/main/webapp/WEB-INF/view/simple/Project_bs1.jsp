<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目部署</title>
<style type="text/css">
p {font-size:14px;font-family:宋体;text-align:left;}
</style>
</head>
<body style="text-align:center">
<h3 align="center">Windows Server下web项目部署简介</h3>
<div style="width:50%;margin:0 auto;height:auto;">
	<p>与Linux系统下相比，Windows Server下部署web项目要简单很多</p>
	<p>平常使用的操作系统也是windows所以对windows也不会太陌生</p>
	<p>在阿里云上面搞了台云主机，配置信息如下</p>
	<div align="left">
		<img src="../images/simple/bushu1.jpg" alt="">
	</div>
	<p>因为我要部署的是Java Web项目所以我们需要安装JDK和Tomcat，可以去官网下载跟操作系统相应的版本</p>
	<div align="left">
		<img src="../images/simple/bushu2.jpg" alt="">
	</div>
	<p>安装过程也比较简单，一直Next就好。安装好后，需要配置JDK环境变量</p>
	<p>环境变量也很简单，就不介绍了</p>
	<p>接下来把之前开发好的项目打包，war包，2种方法，第一种用Eclipse的导出功能</p>
	<div align="left">
		<img src="../images/simple/bushu3.jpg" alt="">
	</div>
	<p>第二种就是使用Maven生成war包，Run as - Maven install</p>
	<p>成功之后就可以在target目录下面看到生成的war包了</p>
	<div align="left">
		<img src="../images/simple/bushu4.jpg" alt="">
	</div>
	<p>然后通过windows自带的远程工具，将war拷贝到Windows Server服务器上面</p>
	<p>放在Tomcat安装目录下的webapps目录，比如：C:\Program Files (x86)\Apache Software Foundation\Tomcat 7.0\webapps</p>
	<div align="left">
		<img src="../images/simple/bushu5.jpg" alt="">
	</div>
	<p>接着打开Tomcat安装目录下的conf目录下的server.xml文件，看下有没有&lt;Context&gt;标签，没有的话添加，比如：</p>
	<p><font color="blue">&lt;Context docBase="kangtxy" path="/kangtxy" reloadable="true" source="org.eclipse.jst.j2ee.server:kangtxy"/&gt;</font></p>
	<p>path可以指定上下文 </p>
	<p>然后执行bin目录下的exe文件，这是启动tomcat的意思，看到server startup in xxx ms说明启动成功了</p>
	<div align="left">
		<img src="../images/simple/bushu6.jpg" alt="">
	</div>
	<p>然后就可以在浏览器中访问刚部署的项目啦 </p>
	<div align="left">
		<img src="../images/simple/bushu7.jpg" alt="">
	</div>
	<p>更新项目的话，先关闭tomcat，接着删除webapps目录下的war包和同名文件夹，在把新的war拷贝进去，在启动tomcat就完成更新了 </p>
	<p>本章完。 </p>
</div>
</body>
</html>