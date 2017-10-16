<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/com_css.jsp"%>
<%@ include file="/WEB-INF/view/include/com_js.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人博客</title>
<meta name="keywords" content="个人博客" />
<meta name="description" content="" />
</head>

<!-- 配置文件 -->
<script type="text/javascript"
	src="./ueditor-utf8-jsp/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="./ueditor-utf8-jsp/ueditor.all.js"></script>
<!-- 语言包文件(建议手动加载语言包，避免在ie下，因为加载语言失败导致编辑器加载失败) -->
<script type="text/javascript"
	src="./ueditor-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
	var ue = UE.getEditor('container', {
		//自定义工具栏
// 		toolbars : [ [ 'fullscreen', 'source', 'undo', 'redo', 'bold' ] ],
		autoHeightEnabled : true,
		autoFloatEnabled : true
	});
</script>

<body>
	<%@ include file="/WEB-INF/view/TitleList.jsp"%>

	<!--content start-->
	<div id="content">
		<!--left-->
		<div class="left" id="about_me">
			<div class="weizi">
				<div class="wz_text">
					当前位置：<a href="index.html">首页></a>
					<h1>关于我</h1>
				</div>
			</div>
			<div class="about_content">
				<!-- 加载编辑器的容器 -->
				<script id="container" name="content" type="text/plain">请输入内容</script>
			</div>
		</div>
		<!--end left -->
		<%@ include file="/WEB-INF/view/RightContent.jsp"%>

	</div>
	<!--content end-->
	<div id="footer">
		<p>Design by:少年 2014-8-9</p>
	</div>
</body>
</html>