<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<link rel="stylesheet" href="<%=path%>/web/css/common.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/user.css" />
		
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script src="<%=path%>/js/jquery-migrate-1.2.1.min.js"></script>
		
		<script src="<%=path%>/js/jquery.jqprint-0.3.js"></script>

	</head>

	<body style="background-color: #f5f5f5;">
		<div id="wrap" >
			<jsp:include page="../page/head.jsp" />
			<div id="main" class="inner">
				<div id="container" class="resume-container" style="padding-bottom: 20px;">
					<div class="resume-content">
						<div class="resume-content-box" id="jianli_word">
							<div class="resume-box">
								<div id="userinfo"
									class="resume-item resume-userinfo resume-undefined">

									<div class="item-primary baseinfo-container" style="">
										<div class="user-info">
											<div class="header-upload">
												<div class="header-box">
													<div class="header-mask"></div>
													
													<img <c:if test="${sessionScope.user.photo==null||sessionScope.user.photo==''}">src="<%=path%>/web/images/default_user.png"</c:if> 
														<c:if test="${sessionScope.user.photo!=null||sessionScope.user.photo!=''}">src="<%=path%>/${sessionScope.user.photo}"</c:if> class="header-img">
													
												
													<!---->
												</div>
												
												<use xlink:href="#icon_man"></use>
												</svg>
											</div>
											<p class="name">
												${sessionScope.user.name}
											</p>
											<p class="look-resume">
												<i class="ui-icon-view"></i>
											</p>
										</div>
										<div class="info-flex">
											<div class="info-flex-item">
												<div class="info-labels">
													<p>
														<span class="prev-line"><i
															class="fz-resume fz-experience"></i>${sessionScope.user.gzjy}经验</span>
														<span class="prev-line"> <i
															class="fz-resume fz-degree"></i>${sessionScope.user.xueli}</span>
														<span class="prev-line"> <i
															class="fz-resume fz-status"></i>${sessionScope.user.zt}</span>
													</p>
													<p>
														<span class="prev-line"><i
															class="fz-resume fz-mail"></i>${sessionScope.user.email}</span><span
															class="prev-line"><i class="fz-resume fz-tel"></i>${sessionScope.user.tel}</span><span
															class="prev-line"><i class="fz-resume fz-time"></i>${sessionScope.user.birthday}
													</p>
												</div>
											</div>
										</div>
									</div>
									<!---->
								</div>

								<div id="summary"
									class="resume-item resume-summary resume-undefined">
									<div class="item-primary advantage-show">
										<h3 class="title">
											个人优势
											<!---->
										</h3>
										<ul>
											<li  class="">
												<div class="primary-info">
													<!---->
													<div class="info-text advantage-text">${sessionScope.user.youdian}</div>
												</div>

											</li>
										</ul>
									</div>
									<!---->
								</div>
								<div id="purpose"
									class="resume-item resume-purpose resume-undefined">
									<div class="item-primary">
										<h3 class="title">
											期望职位
										</h3>
										<ul>
											<li ka="user-resume-edit-expectation0" class="">
												<div class="primary-info">
													<div class="info-labels">
														<span class="prev-line"><span class="label-text"><i
																class="fz-resume fz-job"></i> ${sessionScope.user.catelogVO.name} </span> </span><span
															class="prev-line"><i class="fz-resume fz-salary"></i>
															${sessionScope.user.xinzi} </span>
													</div>
												</div>

											</li>
										</ul>
									</div>
									<!---->
								</div>
								<div id="history"
									class="resume-item resume-history resume-undefined">
									<div class="item-primary">
										<h3 class="title">
											工作经历

										</h3>
										<ul>
											<li ka="user-resume-edit-advantage" class="">
												<div class="primary-info">
													<!---->
													<div class="info-text advantage-text">${sessionScope.user.gzjl}</div>
												</div>

											</li>
										</ul>
									</div>
									<!---->
								</div>
								
								<div id="education"
									class="resume-item resume-education resume-undefined">
									<div class="item-primary">
										<h3 class="title">
											教育经历
										</h3>
										<ul>
											<li  class="">
												<div class="primary-info">
													<div class="info-text"><h4 class="name">${sessionScope.user.school}</h4><span class="gray period">${sessionScope.user.sdate}</span></div>
													<div class="info-text"><h4><span class="prev-line">${sessionScope.user.zhuanye}</span><span
																class="prev-line">${sessionScope.user.xueli}</span></h4></div>
												</div>

											</li>
										</ul>
									</div>
									<!---->
								</div>
							</div>
						</div>
					</div>
					<div class="user-sider">
						<div data-v-40a7bab8="" class="sider-box sider-resume">
							<div data-v-40a7bab8="" class="resume-attachment">
								<h3 data-v-40a7bab8="" class="sider-title">
									附件管理
									<!---->
								</h3>
								<!---->
								<div class="btns">
									<button id="rebackBtn"  type="button"
										class="btn btn-primary" onclick="toUpdate()">
										在线编辑
										<!---->
									</button>
									<!---->
								</div>
								<div class="btns">
									<button type="button" class="btn btn-primary" onclick="xiazai()">
										下载简历
										<!---->
									</button>
									<!---->
								</div>
								
							</div>
						</div>
						<div class="sider-box zhipin-resume">
							<a> <img src="<%=path%>/web/images/u_tab.png" /> </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- container end -->
		<jsp:include page="../page/foot.jsp" />
	</body>
	<script type="text/javascript">
	
	function toUpdate(){
		window.location.href = '<%=path%>/user_toUpdate_web.action';
	}
	function xiazai(){
		$("#jianli_word").jqprint();
	}
	
	</script>
</html>