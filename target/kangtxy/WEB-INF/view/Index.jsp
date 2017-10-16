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
<script type="text/javascript">
	
</script>
<body>
	<%@ include file="/WEB-INF/view/TitleList.jsp"%>
	<!--content start-->
	<div id="content">
		<!--left-->
		<div class="left" id="c_left">
			<div class="s_tuijian">
				<h2>
					文章<span>推荐</span>
				</h2>
			</div>
			<div class="content_text">
				<!-- foreach begin -->
				<div class="wz">
					<h3>
						<a href="#" title="浅谈：html5和html的区别">浅谈：html5和html的区别</a>
					</h3>
					<dl>
						<dt>
							<img src="images/s.jpg" width="200" height="123" alt="">
						</dt>
						<dd>
							<p class="dd_text_1">最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联
								网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对"XP系统"不提供更新补丁、维护的情况下。
								html5+css3也逐渐的成为新一代web前端技术.....</p>
							<p class="dd_text_2">
								<span class="left author">name</span><span class="left sj">yyyy-mm-dd</span>
								<span class="left fl">Type:<a href="#" title="学无止境">学无止境</a></span><span
									class="left yd"><a href="#" title="阅读全文">阅读全文</a> </span>
							</p>
							<div class="clear"></div>
						</dd>
					</dl>
				</div>

				<!-- foreach end -->
			</div>
		</div>
		<!--left end-->

		<%@ include file="/WEB-INF/view/RightContent.jsp"%>

		<div class="clear"></div>
	</div>
	<!--content end-->
	<div id="footer">
		<p>
			Design by:<a href="" target="_blank">xxx</a> yyyy-mm-dd
		</p>
	</div>
</body>
</html>