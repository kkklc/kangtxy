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
<h3 align="center">手把手教你搭建自己的blog</h3>
方法很多这里采用 Spring MVC
<!-- <div style="width:50%;margin:0 auto;height:auto; border:1px solid #F00"> -->
<div style="width:50%;margin:0 auto;height:auto;">
	<h4 align="left">◎ New Maven Project</h4>
	<p>打开我们熟悉的Eclipse JEE版本，右键new project选择Maven</p>
	<div align="left">
		<img src="../images/simple/newproject.jpg" alt="">
	</div>
	<p>Next选择maven-archetype-webapp</p>
	<div align="left">
		<img src="../images/simple/newproject2.jpg" alt="">
	</div>
	<p>Next填入Group Id、Artifact Id接着Finish</p>
	<div align="left">
		<img src="../images/simple/newproject3.jpg" alt="">
	</div>
	<p>创建完后，整体项目结构是这样的</p>
	<div align="left">
		<img src="../images/simple/newproject4.png" alt="">
	</div>
	<p>Maven简介</p>
	<p>Maven项目对象模型(POM)，可以通过一小段描述信息来管理项目的构建，报告和文档的软件项目管理工具。</p>
	<p>Maven 除了以程序构建能力为特色之外，还提供高级项目管理工具。由于 Maven 的缺省构建规则有较高的可重用性，所以常常用两三行 Maven 构建脚本就可以构建简单的项目。由于 Maven 的面向项目的方法，许多 Apache Jakarta 项目发文时使用 Maven，而且公司项目采用 Maven 的比例在持续增长。</p>
	<p>接着搭建项目，打开pom.xml</p>
	<p>增加Properties：展开Properties选项，然后点击Create…按钮</p>
	<div align="left">
		<img src="../images/simple/properties1.png" alt="">
	</div>
	<p>然后Name字段填入springVersion，Value字段填入3.2.5.RELEASE。即在pom.xml中增加了一个属性springVersion，属性值为3.2.5.RELEASE</p>
	<p>选择Dependencies标签，打开Dependencies选项卡，并增加一个新的Dependency</p>
	<div align="left">
		<img src="../images/simple/properties2.png" alt="">
	</div>
	<p>Group Id：org.springframework</p>
	<p>Artifact Id：spring-web</p>
	<p>Version：${springVersion}</p>
	<p>点击ok按钮</p>
	<p>说明：该过程是加入springframe的spring-web依赖库，${springVersion}是之前设置的属性</p>
	<p>Group Id：org.springframework</p>
	<p>Artifact Id：spring-webmvc</p>
	<p>Version：${springVersion}</p>
	<p>点击ok按钮</p>
	<p>说明：该过程是加入springframe的spring-webmvc依赖库，${springVersion}是之前设置的属性</p>
	<p>依赖库设定完之后，如果本地不存在还需要从网络上下载相应的依赖库，选中pom.xml文件，右击鼠标选中Run AS – maven install，然后系统自动从网络上下载相应的依赖库</p>
	<div align="left">
		<img src="../images/simple/mavenInstall1.png" alt="">
	</div>
	<p>下载完后可以看到这些依赖都存在本地了</p>
	<div align="left">
		<img src="../images/simple/mavenInstall2.png" alt="">
	</div>
	<h4 align="left">◎ 项目配置</h4>
	<p>配置前先在src - main目录下新建文件夹名为java，然后在java目录下建立com.kangtxy包，KtxyController.java类，这是一个controller类</p>
	<div align="left">
		<img src="../images/simple/filepz1.png" alt="">
	</div>
	<p>在src – main –webapp – WEB-INF目录下新建文件夹view，并新建文件Index.jsp，顾名思义这是网站首页的意思</p>
	<div align="left">
		<img src="../images/simple/filepz2.png" alt="">
	</div>
	<p>接着打开web.xml文件，改成这样</p>
	<div align="left">
		<img src="../images/simple/filepz3.png" alt="">
	</div>
	<p>在src – main –resources目录下新建文件spring-mvc-servlet.xml，内容如下</p>
	<div align="left">
		<img src="../images/simple/filepz4.png" alt="">
	</div>
	<p>（可以看到Index.jsp报错，构建路径中把Server Runtime 加进去解决）</p>
	<p>Spring Mvc配置简介</p>
	<p>1、SpringMVC的配置分为两部分 application.xml 和 spring-servlet.xml</p>
	<p>2、application.xml：对应的是系统级别的配置，作用范围是系统上下文</p>
	<p>3、spring-servlet.xml：对应的是 controller级别的配置，作用范围是控制层上下文</p>
	<p>4、因为 application.xml是系统级别的上下文，所以它的初始化需要放到 web.xml 中的<font color="blue">&lt;context-param&gt;</font>标签中，同时其他的类似定时任务的配置文件等等都是放在这个标签下进行初始化的</p>
	<p>5、因为spring-servlet.xml只是 controller级别的上下文，说白了就是servlet级别的初始化，它不涉及到除了转发之外的任何实体，所以它的作用范围仅仅限制在 servlet级别，所以它的初始化应该是跟spring 的 DispatcherServlet 初始化在一起，所以就是在<font color="blue">&lt;servlet&gt;</font>标签中初始化的。它有一个默认值就是<font color="blue">[/WEB-INF/remoting-servlet.xml]</font>，注意配置文件的对应的名称是<font color="blue">[servlet-name]-servlet.xml</font>，所以如果你没有给servlet 制定配置文件的位置，并且在默认位置下也没有配置文件，那么系统启动的时候就会报错</p>
	<p>注意：对于 servlet配置文件里面应该初始化的东西，除了视图的解析方式、静态资源文件的存放位置、controller的初始化方式之外，其他的都不应该放在 servlet 配置文件中，应为它只负责 请求的转发，返回结果的解析以及静态资源文件的解析，其他的对象的初始化，定时任务...都不应该放到这个配置文件下进行管理</p>
	<p>因为我不想把spring-mvc-servlet.xml放到WEB-INF下面，所以需要在web.xml里头指定路径，改成这样</p>
	<div align="left">
		<img src="../images/simple/filepz5.png" alt="">
	</div>
	<p>classpath和classpath*区别：</p>
	<p>classpath：只会到你的class路径中查找找文件</p>
	<p>classpath*：不仅包含class路径，还包括jar文件中(class路径)进行查找</p>
	<p>ok，到这里都配置好了，打开KtxyController.java添加内容</p>
	<div align="left">
		<img src="../images/simple/filepz6.png" alt="">
	</div>
	<p>打开Index.jsp添加内容</p>
	<div align="left">
		<img src="../images/simple/filepz7.png" alt="">
	</div>
	<p>启动项目：浏览器输入地址http://localhost:8080/kangtxy/，效果</p>
	<div align="left">
		<img src="../images/simple/filepz8.png" alt="">
	</div>
	<p>上下文kangtxy可以在tomcat的server.xml文件中修改Context标签中的path属性</p>
	<p>到这里初版框架就已经搭建好了，并且项目也跑起来了，接下来要做的就是设计一个网站然后塞进这个框架里头。</p>
	<p>本章完。 </p>
</div>
</body>
</html>