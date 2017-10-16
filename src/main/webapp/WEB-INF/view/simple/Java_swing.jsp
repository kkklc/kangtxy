<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Swing编程</title>
<style type="text/css">
p {font-size:14px;font-family:宋体;text-align:left;}
</style>
</head>
<body style="text-align:center">
<h3 align="center">零经验的情况下利用空余时间折腾出了个小工具</h3>
<div style="width:50%;margin:0 auto;height:auto;">
	<p>因为项目刚上线，问题比较多，每天技术支持都会反馈特别多的问题，处理这些问题需要操作数据库才能知道怎么处理</p>
	<p>作为开发人员，一边需要赶进度的开发，一边需要处理线上问题，实在是忙不过来，于是开发了这个小工具</p>
	<p>有了这个小工具就可以安心的开发了，成果图：</p>
	<div align="left">
		<img src="../images/simple/xgj1.jpg" alt="">
	</div>
	<p>用到的组件还挺多的，JTabbedPane、JRadioButton、ButtonGroup、JPasswordField、JScrollPane等这些常用的功能</p>
	<p>光靠脑子想，然后布置一个面板比较费事，这里可以在Eclipse上安装WindowBuilder插件，实现可视化编程</p>
	<p><a target="_blank" href="http://www.eclipse.org/windowbuilder/">插件下载地址</a></p>
	<p>安装好后，new → project → SWT/JFace Java Project</p>
	<div align="left">
		<img src="../images/simple/xgj2.jpg" alt="">
	</div>
	<p>输入Project Name之后直接Finish</p>
	<div align="left">
		<img src="../images/simple/xgj3.jpg" alt="">
	</div>
	<p>此时已经创建好一个空的项目</p>
	<div align="left">
		<img src="../images/simple/xgj4.jpg" alt="">
	</div>
	<p>接着需要创建一个面板，右键src → new → others → windowbuilder → swing designer → application window</p>
	<div align="left">
		<img src="../images/simple/xgj5.jpg" alt="">
	</div>
	<p>此时已经创建好一个空的面板，Source为源码窗口，Design可视化窗口</p>
	<div align="left">
		<img src="../images/simple/xgj6.jpg" alt="">
	</div>
	<p>接着就可以自由发挥了</p>
	<p>整个思路大致是这样的，看source窗口源码可以看到刚创建的是一个空的框架new JFrame()想要在上面放东西，需要先创建一个面板new JPanel()，这个面板上可以放置label、文本框、按钮等，为了能够自由摆放，需要把面板的样式置空panel.setLayout(null)，然后把布置好的面板放到JFrame上面</p>
	<h4 align="left">◎JTabbedPane标签页</h4>
	<p>先来做一个标签页，最底层是JFrame，上一层是JPanel（第一个），在上一层是JTabbedPane，最顶层是JPanel（第二个），也就是说画好的JPanel（第二个）放在JTabbedPane上，多个JTabbedPane整好后放在另一个JPanel（第一个）上，把这个JPanel（第一个）放在JFrame上显示即可，知道这个顺序就可以开始开发了。</p>
	<div align="left">
		<img src="../images/simple/xgj7.jpg" alt="">
	</div>
	<p>对应source源码</p>
	<div align="left">
		<img src="../images/simple/xgj8.png" alt="">
	</div>
	<p>如果面板很复杂，按照系统自动创建的代码，那么initialize()这个方法将会特别特别多，不利于维护，建议把每个顶层面板单独出一个类来</p>
	<h4 align="left">◎JRadioButton小圆点</h4>
	<p>这个radio跟平时html页面上的不一样，它不能直接获取选中值，为了达到单选目的，首先需要建立一个ButtonGroup，然后把所有的radio都放进这个组里头，接着创建一个全局变量，每个radio都添加监听，监听的同时给全局变量赋值，这就达到单选并且获取选中值的目的了</p>
	<p>具体做法看这段源码就知道了</p>
	<div align="left">
		<img src="../images/simple/xgj9.jpg" alt="">
	</div>
	<h4 align="left">◎JScrollPane滚动条</h4>
	<p>这里给文本框JTextArea添加滚动条，把做好的文本框JTextArea放假滚动条JScrollPane中，接着把JScrollPane放进面板JPanel即可，要注意的是，JTextArea的大小跟JScrollPane的大小，一般都设置成一样。这里的滚动条横纵都有。</p>
	<div align="left">
		<img src="../images/simple/xgj10.jpg" alt="">
	</div>
	<h4 align="left">◎JLabel</h4>
	<p>一开始以为它跟html中的label标签一样，后来才发现完全不是一回事，JLabel也能够像JPanel一样装JLabel、JTextArea、JButton等</p>
	<p>这里先把JPanel划分成两行一列setLayout(new GridLayout(2, 1))，两行分别用于展示两个JLabel</p>
	<div align="left">
		<img src="../images/simple/xgj11.jpg" alt="">
	</div>
	<p>对应源码</p>
	<div align="left">
		<img src="../images/simple/xgj12.jpg" alt="">
	</div>
	<p>JLabel不仅可以显示文本、图片、还能显示超链接</p>
	<p>JLabel jlabel = new JLabel("&lt;HTML&gt;&lt;A href='http://baidu.com'&gt;百度一下&lt;/A&gt;&lt;/HTML&gt;");</p>
	<p>本章完。 </p>
</div>
</body>
</html>