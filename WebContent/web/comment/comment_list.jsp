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
		<link rel="stylesheet" href="<%=path%>/web/css/detail.css" />
		
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
								评价企业公司
							</h1>

						</div>
					</div>
				</div>

				<div class="inner">
					<pg:pager url="boss_list.action" items="${itemSize}"
						maxPageItems="${pageItem}" maxIndexPages="${pageItem}"
						isOffset="${true}" export="offset,currentPageNumber=pageNumber"
						scope="request">
					<div class="list-news">
						<c:forEach items="${list}" var="info" varStatus="status">
							<div class="list-item">
								<div class="item-header">
									<div class="avtar">
										<div class="img-wrap1">
											<img src="<%=path%>/${info.userVO.photo}" class="avtar-img" >
										</div>
									</div>
									<div class="user-info">
										<div class="name">
											${info.userVO.name}·
										</div>
										<div class="job-title" >工作经验·${info.userVO.gzjy}</div>
									</div>
								</div>
								<div class="text-viewer">
									<div class="text markdown-body" style="height: 24px;margin-left:0">
										
										${info.content}
										
									</div>
									<!---->
								</div>
								
								<div class="time">
									发布于：${info.cdate}·
								</div>
								
							</div>
						</c:forEach>
					</div>
					<pg:index>
						<jsp:include page="/common/pagination_tag.jsp" flush="true" />
					</pg:index>
					</pg:pager>
					<div class="list-news">
						<div class="item-form">
							<h3 class="title">
								在线评价
							</h3>
							<form action="<%=path%>/comment_add.action" method="post"
										id="addForm" autocomplete="off" class="ui-form ui-form-label-top" >
								<div
									class="form-item-full form-item-advantage form-item form-item-required">
									<!---->
									<div class="item-content">
										<div class="input-wrap input-wrap-textarea">
											<textarea required="required"
												maxlength="300" id="content" name="content"
												rows="2" class="input"></textarea>
											
										</div>
									</div>
								</div>
								<div class="form-btns">
									
									<button type="submit" ka="resume_form_advantage_ok"
										class="btn btn-primary">
										<!---->
										完成
									</button>
								</div>
							</form>
						</div>


					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../page/foot.jsp" />
	</body>
</html>