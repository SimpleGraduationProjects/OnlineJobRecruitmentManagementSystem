<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://account.lvye.cn/accounts/register/ -->
<html xmlns:wb="http://open.weibo.com/wb">
	<!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-language" content="zh-CN">

		<title>网上求职招聘</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />
		<link rel="stylesheet" href="<%=path%>/web/css/app_user.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/user.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.extend.js"></script>
		<script src="<%=path%>/js/jquery.validate.method.js"></script>
		<script language="javascript" type="text/javascript"
			src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
		<script language=JavaScript>
			function tiao_url(temp) {
				var url='';
				if (temp==1) {
					url = "<%=path%>/web/user/user_upwd.jsp";
					
				}else if(temp==2){
					url = "<%=path%>/my_offers.action";
				}
				window.location.href=url;
				
			}
		</script>
	</head>

	<body style="background-color: #f5f5f5;">
		<div id="wrap" >
			<jsp:include page="../page/head.jsp" />
			<div id="main" class="inner">
				<div class="account" style="margin-bottom: 20px;">
					<div class="account-tab-nav">
						<nav>
							<h3 class="nav-title">
								个人中心
							</h3>
							<ul>
								<li class="nav-list active" onclick="tiao_url(2)">
									我投递的简历
								</li>
								<li class="nav-list " onclick="tiao_url(1)">
									设置密码
									<!---->
								</li>
								
								
								<li class="nav-list" onclick="logout();">
									退出
									<!---->
								</li>
							</ul>
						</nav>
						<div class="content ">
							<div class="resume-box change-pwd-content">
								<div class="item-form resume-item resume-userinfo resume-undefined">
									<div  class="form-item">
										<div class="item-label">招聘标题</div>
										<div class="item-content">
											<div class="input-wrap input-wrap-text">
												<input  type="text" n readonly="readonly"
													class="input" value="${offer.jobVO.name}" >
												
											</div>
										</div>
									</div>
									<div  class="form-item">
										<div class="item-label">招聘职位</div>
										<div class="item-content">
											<div class="input-wrap input-wrap-text">
												<input  type="text" readonly="readonly"
													class="input" value="${offer.jobVO.catelogVO.name}" >
											</div>
										</div>
									</div>
									<div  class="form-item">
										<div class="item-label">offer状态</div>
										<div class="item-content">
											<div class="input-wrap input-wrap-text">
												<input  type="text" readonly="readonly"
													class="input" value="${offer.zt}" >
											</div>
										</div>
									</div>
									<div  class="form-item">
										<div class="item-label">投递时间</div>
										<div class="item-content">
											<div class="input-wrap input-wrap-text">
												<input  type="text" readonly="readonly"
													class="input" value="${offer.cdate}" >
											</div>
										</div>
									</div>
									<div  class="form-item"
										ka="resume_form_edit_applyStatus">
										<div class="item-label">
											回复内容
										</div>
										<div class="item-content">
											<div class="input-wrap input-wrap-text">
											
												<textarea readonly="readonly" style="height: auto;"
																rows="4" class="input">${offer.content}</textarea>
												
											</div>
										</div>
									</div>
									<div  class="form-item"
										ka="resume_form_edit_applyStatus">
										<div class="item-label">
											面试结果
										</div>
										<div class="item-content">
											<div class="input-wrap input-wrap-text">
											
												<textarea readonly="readonly" style="height: auto;"
																rows="4" class="input">${offer.jieguo}</textarea>
												
											</div>
										</div>
									</div>		
									<div class="form-btns">
										<button type="button" id="rebackBtn" class="btn btn-outline">
											关闭
										</button>
										
									</div>						
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
		<!-- container end -->
		<jsp:include page="../page/foot.jsp" />
	</body>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#rebackBtn").click(function() {
			window.history.go(-1);
		});
		
	});
</script>
</html>