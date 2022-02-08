<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
%>


<!-- saved from url=(0030)https://xa.lianjia.com/zufang/ -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-language" content="zh-CN">

		<title>网上求职招聘</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />

		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/home.css" />

		<script type="text/javascript" src="<%=path%>/js/jquery-3.4.1.min.js"></script>

	</head>
	<body>
		<div id="wrap">
			<jsp:include page="../page/head.jsp" />

			<div id="main" style="overflow: hidden;">
				<div class="detail inner">
					<div class="detail-main" style="width:1184px ">
						
						<div class="detail-content">
							<h1 class="title">
								${company.name}
							</h1>
							<div class="info" style="height: 600px;">
								<!-- 酷播V4.05跨平台代码/开始 -->
								<div class="video" id="CuPlayer" style="width: 100%; height: 100%">
									<script type="text/javascript">
										
										<!--
										var vID        = "c1";                   //vID
										var vWidth     = "100%";                  //宽度设定，配合CSS实现
										var vHeight    = "600";                  //高度设定，配合CSS实现
										var vFile      = "<%=path%>/web/player/CuSunV4set.xml";       //配置文件地址:支持五种广告设定
										var vPlayer    = "<%=path%>/web/player/player.swf?v=4.0";     //播放器文件地址
										var vPic       = "<%=path%>/web/images/bobg.png";        //视频缩略图
										var vCssurlv   = "<%=path%>/web/player/css/videos.min.css";   //CSS文件
										var vAutoPlay  = "no";                  //是否自动播放
										var vEndTime   = 0;                      //预览时间(秒数),默认为0
										var vLogoPath  = "";      //Logo地址
										var vPlayMod   = 0;                      //播放模式优先级,默认=0,html5优先=1,flash优先=2
										var vMp4url    = "<%=path%>/${company.shipin}";//视频文件地址推荐用mp4文件(h264编码)
										//-->
										</script>
									<script class="CuPlayerVideo" data-mce-role="CuPlayerVideo"
										type="text/javascript"
										src="<%=path%>/web/player/js/player.min.js"></script>
								</div>
								<!-- 酷播V4.05跨平台代码/结束 -->
							</div>
							<div class=content>
								${company.miaoshu}
							</div>

						</div>

						
					</div>
				</div>
			</div>
		</div>



		<jsp:include page="../page/foot.jsp" />
	</body>
</html>