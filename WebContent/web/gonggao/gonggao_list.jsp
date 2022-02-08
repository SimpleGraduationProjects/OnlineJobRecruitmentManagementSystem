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

			<div id="main">
				<div class="list-banner">
					<div class="inner">
						<div class="text">
							<h1>
								求职面试技巧，应聘技巧，职场资讯，热点新闻
							</h1>

						</div>
					</div>
				</div>

				<div class="inner">
					<div class="list-news">
						<ul>
							<c:forEach items="${list}" var="gonggao" varStatus="status">
							<li>
								<div class="img-wrap">
									<a href="<%=path%>/gonggao_toView.action?id=${gonggao.id}" class="img"> 
										<img src="<%=path%>/${gonggao.tupian}" /> 
									</a>
									<a href="#" class="badge"> ${gonggao.gtype} </a>
								</div>
								<div class="text">
									<p class="text-title">
										<a href="<%=path%>/gonggao_toView.action?id=${gonggao.id}">
											${gonggao.name} </a>
									</p>
									<p class="summary">
										${gonggao.jianjie}
									</p>
									<div class="info">
										<p class="author">
											${gonggao.gtype}
											<em>·</em><span class="time">${gonggao.cdate}</span>
										</p>
									</div>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../page/foot.jsp" />
	</body>
</html>