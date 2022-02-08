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
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>	


	</head>
	<body>
		<div id="wrap">
			<jsp:include page="../page/head.jsp" />

			<div id="main" style="overflow: hidden;">
				<div class="detail inner">
					<div class="detail-main">
						
						<div class="detail-content">
							<h1 class="title">
								${gonggao.name}
							</h1>
							<div class="info">
								<p class="author">
									<span class="time">${gonggao.cdate}</span>
								</p>
								<p class="tags">
									${gonggao.gtype}
								</p>
								<p></p>
							</div>
							<div class=content>
								${gonggao.miaoshu}
							</div>

						</div>

						
					</div>
				</div>
			</div>
		</div>



		<jsp:include page="../page/foot.jsp" />
	</body>
</html>