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
								<li class="nav-list" onclick="tiao_url(2)">
									我投递的简历
								</li>
								<li class="nav-list active" onclick="tiao_url(1)">
									设置密码
									<!---->
								</li>
								
								
								<li class="nav-list" onclick="logout();">
									退出
									<!---->
								</li>
							</ul>
						</nav>
						<div class="content">
							<div class="change-pwd-content">
								<form autocomplete="off" method="post" id="addForm"
									class="account-form ui-form ui-form-label-right ui-form-asterisk"
									style="">
									<div class="form-item">
										<div class="item-label" style="width: 160px;">
											当前登录的账号
										</div>
										<div class="item-content" style="margin-left: 160px;">
											<span class="text-gray">${sessionScope.user.uname}</span>
											<!---->
										</div>
									</div>
									<div class="form-item">
										<div class="item-label" style="width: 160px;">
											旧密码
										</div>
										<div class="item-content" style="margin-left: 160px;">
											<div class="input-wrap input-wrap-password">
												<!---->
												<!---->
												<input autocomplete="on" spellcheck="false" type="password"
													placeholder="请输入旧密码" id="pwd" name="pwd" class="input">
												<!---->
												<!---->
												<!---->
												<!---->
											</div>
											<!---->
										</div>
									</div>
									<div class="form-item">
										<div class="item-label" style="width: 160px;">
											新密码
										</div>
										<div class="item-content" style="margin-left: 160px;">
											<div class="input-wrap input-wrap-password">
												
												<input autocomplete="on" spellcheck="false" type="password"
													placeholder="设置新密码" id="upwd" name="upwd" class="input">
												
											</div>
											<!---->
										</div>
									</div>
									<div class="form-item">
										<div class="item-label" style="width: 160px;">
											确认新密码
										</div>
										<div class="item-content" style="margin-left: 160px;">
											<div class="input-wrap input-wrap-password">
												
												<input autocomplete="on" spellcheck="false" type="password"
													placeholder="确认新密码" id="upwd1" name="upwd1" class="input">
												
											</div>
											<!---->
										</div>
									</div>
									<div class="form-item">
										<!---->
										<div class="item-content" style="margin-left: 160px;">
											<button type="submit" ka="pwd_change_sure"
												class="btn btn-primary">
												确认更改密码
											</button>
											<!---->
										</div>
									</div>
								</form>
								
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
		$("#addForm").validate({
			submitHandler : function(form) {//验证通过后的执行方法
				var opwd = '${sessionScope.user.upwd}';
				var pwd = $('#pwd').val();
			 
				if(opwd!=pwd){
					alert('原密码错误');
					return;
				}else{
					form.submit();
				}
				
			},
			rules : {
				pwd : {
					required : true,

				},
				upwd : {
					required : true,
				},
				upwd1 : {
					required : true,
					equalTo: "#upwd"
				},
			},
			messages : {
				pwd : {
					required : '请输入原密码',
				},
				upwd : {
					required : '新密码不能为空',
				},
				upwd1 : {
					required : '请输入确认密码',
					equalTo: '两次密码输入不一致'
				},
			}
		});
	});
</script>
</html>