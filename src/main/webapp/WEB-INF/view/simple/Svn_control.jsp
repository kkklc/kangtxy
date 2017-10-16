<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>svn</title>
<style type="text/css">
p {font-size:14px;font-family:宋体;text-align:left;}
</style>
</head>

<body style="text-align:center">
<h3 align="center">svn服务器搭建</h3>
<div style="width:50%;margin:0 auto;height:auto;">
	<p>为了更好的管理项目，我们需要一个搭建一个svn服务器，用于控制代码版本</p>
	<p>首先到apache网站下载跟操作系统相应版本的服务端和客户端，最好2个都下载，搭配使用</p>
	<p>这里我还下载了一个语言包</p>
	<div align="left">
		<img src="../images/simple/svn1.png" alt="">
	</div>
	<p>然后就是安装，下一步下一步下一步...</p>
	<p>安装完后启动VisualSVN Server Manager服务端，Repositories - Create New Repositories</p>
	<div align="left">
		<img src="../images/simple/svn2.jpg" alt="">
	</div>
	<div align="left">
		<img src="../images/simple/svn3.jpg" alt="">
	</div>
	<p>FSFS和VDFS，两种文件存储方式，选择默认的然后下一步</p>
	<div align="left">
		<img src="../images/simple/svn4.jpg" alt="">
	</div>
	<p>下一步</p>
	<div align="left">
		<img src="../images/simple/svn5.jpg" alt="">
	</div>
	<p>下一步</p>
	<div align="left">
		<img src="../images/simple/svn6.jpg" alt="">
	</div>
	<p>下一步</p>
	<div align="left">
		<img src="../images/simple/svn7.jpg" alt="">
	</div>
	<p>到这已经成功的创建了一个空的仓库</p>
	<div align="left">
		<img src="../images/simple/svn8.jpg" alt="">
	</div>
	<p>接着将项目导入到版本库中，找到你的项目文件夹，在项目文件夹上点击鼠标右键，找到SVN菜单，选择导入，如图：</p>
	<div align="left">
		<img src="../images/simple/svn9.jpg" alt="">
	</div>
	<p>这里需要一个URL</p>
	<div align="left">
		<img src="../images/simple/svn11.jpg" alt="">
	</div>
	<p>URL获取方式，回到VisualSVN Server，右键刚建好的仓库，Copy URL</p>
	<div align="left">
		<img src="../images/simple/svn10.png" alt="">
	</div>
	<p>点击确定，所选中的项目就会被导入到版本库中</p>
	<div align="left">
		<img src="../images/simple/svn12.jpg" alt="">
	</div>
	<div align="left">
		<img src="../images/simple/svn13.jpg" alt="">
	</div>
	<p>接着创建用户组和用户，用于控制谁能读写</p>
	<p>Create Groups</p>
	<div align="left">
		<img src="../images/simple/svn14.jpg" alt="">
	</div>
	<p>Create Users</p>
	<div align="left">
		<img src="../images/simple/svn15.jpg" alt="">
	</div>
	<p>接着右键刚创建好的仓库，选择propertises，给用户和用户组添加权限</p>
	<div align="left">
		<img src="../images/simple/svn16.jpg" alt="">
	</div>
	<p>到这svn服务器就搭建完了，接着可以到Eclipse中，或者某个磁盘目录中把项目从svn上导下来</p>
	<p>Eclipse上导出文件后面都会有版本信息</p>
	<div align="left">
		<img src="../images/simple/svn17.jpg" alt="">
	</div>
	<p>某个磁盘目录下直接右键，可以选择相应的操作</p>
	<div align="left">
		<img src="../images/simple/svn18.jpg" alt="">
	</div>
	<p>本章完。</p>
</div>
</body>
</html>