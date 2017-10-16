<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>freemarker导出excel</title>
<style type="text/css">
p {font-size:14px;font-family:宋体;text-align:left;}
</style>
</head>
<body style="text-align:center">
<h3 align="center">Excel样式比较复杂所以采用freemarker</h3>
<div style="width:50%;margin:0 auto;height:auto;">
<p>如果是普通的excel，比如固定的thead，每行样式都一样的tbody，那么这样的话采用poi的方式即可，需要先引入poi相关jar包</p>
<div align="left">
	<img src="../images/simple/export_excel2.jpg" alt="">
</div>
<p>采用poi导excel看下面这个例子，大概就明白怎么导了</p>
<div align="left">
	<img src="../images/simple/export_excel3.png" alt="">
</div>
<p>如果excel模板样式非常复杂的话，各种动态，各种行合并，列合并，此时用poi的方式没试过，听说可以，但是代码量非常大，采用freemarker的话事情会变得非常简单。比如下面这个模板</p>
<div align="left">
	<img src="../images/simple/exprot_excel1.jpg" alt="">
</div>
<p>表头日期是动态的，tbody中有动态列合并和动态行合并</p>
<p>此时可以采用freemarker模板的方式导excel</p>
<p>1、先用excel画好模板然后另存为xml。这里用wps轻松搞定，用office则需要自己写xml模板然后映射到excel上面。</p>
<p>2、把.xml改成.ftl。ftl是freemarker模板的格式。</p>
<p>3、往模板里头写数据，写完后在把ftl改回xls或者xlsx，完成。</p>
<p>整个操作顺序大致就是这样子，因为我是用wps来生成xml文档的，office好复杂不会用，为了达到生成的xml文档wps和office都能使用，需要注意几个地方。</p>
<div align="left">
	<img src="../images/simple/export_excel4.png" alt="">
</div>
<p>这2段wps另存为xml格式生成的代码要删掉，不删会导致office报错打不开</p>
<p>第一段应该是记录文档信息的，第二段是默认样式，有用到这个样式的地方也要删掉</p>
<p>table标签有这两个属性<font size="+1" color="blue">ss:ExpandedColumnCount</font>和<font size="+1" color="blue">ss:ExpandedRowCount</font>分别记录列数和函数，要设置成动态的或者数量大于实际量，动态的比如<font size="+1" color="blue">ss:ExpandedRowCount=&#34;&#36;&#123;dataList?size + 50&#125; &#34;</font></p>
<p>这2段wps另存为xml格式生成的代码要删掉，不删会导致office报错打不开</p>
<p>还有一点，因为这个模板有涉及tbody的列合并，模板里头是tbody是动态生成的，并不会产生列合并，所以在合并列之后的列需要加上ss:Index=&#34;&#34;用于指定列的位置，否则office报错，wps则列丢失。</p>
<p>合并多少列通过参数传递，看下面这个例子</p>
<div align="left">
	<img src="../images/simple/export_excel5.png" alt="">
</div>
<p>第一个框判断是否是第一行开始合并，第二个框通过参数觉得合并列的数，第三个框加上ss:Index属性防止列丢失。</p>
<p>freemarker还有很多用处，与使用方法，<a target="_blank" href="http://blog.csdn.net/u010722643/article/details/41732607">传送门</a></p>
<p>本章完。 </p>
<p></p>
</div>
</body>
</html>