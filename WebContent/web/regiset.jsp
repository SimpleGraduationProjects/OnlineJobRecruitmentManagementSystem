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

		<title>注册</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.extend.js"></script>
		<script src="<%=path%>/js/jquery.validate.method.js"></script>
		<script language="javascript" type="text/javascript"
			src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
		<link rel="stylesheet" href="<%=path%>/web/css1/common.css" />
		<link rel="stylesheet" href="<%=path%>/web/css1/tools.css" />
		
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
	
		

	</head>

	<body class="page-sign">
		<div id="wrap">
			<!-- header begin -->
			<jsp:include page="page/head.jsp" />
			<!-- header end -->
	
	
	
			<!-- container begin -->
			<div class="mainContent">
				<div class="registerbox">
					
					<h1>会员注册</h1>
					
					
					
					<div class="guideBox" style="color:#9fa3b0">
				    	已有账号<a href="<%=path%>/web/login.jsp" id="loginUrl">直接登录</a>
				    </div>
					
					<div class="toolContent">
						<form method="post" action="<%=path%>/userReg.action" id="addForm"
							name="addForm"  class="registerform" style="display: block;">
							<div style="    width: 600px;">
								<div class="calculatorItem">
									<label class="itemTitle" >
									
										用户名：
									</label>
									<div class="u-select">
										<input type="text" class="u-select-selected"
											name="uname" id="uname" maxlength="20" placeholder="长度为8-16位字母、数字或符号" />
									</div>
								</div>
	
								<div class="calculatorItem">
									<label class="itemTitle" >
										姓名：
									</label>
									<div class="u-select">
										<input type="text" class="u-select-selected" 
											name="name" id="name" maxlength="20" placeholder="请输入姓名"/>
	
									</div>
								</div>
	
	
								<div class="calculatorItem">
									<label class="itemTitle" >
										设置密码：
									</label>
									<div class="u-select">
										<input type="password" id="upwd"
											class="u-select-selected" name="upwd" maxlength="12" placeholder="长度为6-12位字母、数字或符号"/>
									</div>
								</div>
	
	
								<div class="calculatorItem">
									<label class="itemTitle" >
										确认密码：
									</label>
									<div class="u-select">
										<input type="password" id="upwd1" maxlength="12" 
											class="u-select-selected" name="upwd1" placeholder="2次密码输入一致">
									</div>
									
									
								</div>
								
								
								<div class="calculatorItem">
									<label class="itemTitle" >
										性别：
									</label>
									<div class="u-select">
										<select class="reg_select" name="sex" id="sex">
	                                       <option value="男">男</option>
	                                       <option value="女">女</option>
	                                    </select>
										
									</div>
								</div>
	
	
								<div class="calculatorItem">
									<label class="itemTitle" >
										手机号码：
									</label>
									<div class="u-select">
										<input type="text" class="u-select-selected" name="tel"
											id="tel" maxlength="11" placeholder="请输入手机号码">
									</div>
								</div>
								
								
								
								
								
								
	
								<div class="calculatorItem">
									<label class="itemTitle" >
										邮箱：
									</label>
									<div class="u-select">
										<input type="text" class="u-select-selected"
											name="email" id="email" maxlength="20" placeholder="请输入邮箱">
									</div>
								</div>
								
								<div class="calculatorItem">
									<label class="itemTitle" >
										出生日期：
									</label>
									<div class="u-select">
										<input type="text" class="u-select-selected" onClick="WdatePicker()"
											name="birthday" id="birthday" maxlength="20" placeholder="请输入出生日期">
									</div>
								</div>
	
								
								<div class="calculatorBtn" ><button type="submit" >立即注册</button></div>
							</div>
						</form>
					</div>
				</div>
	
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$(document).ready(function() {
		    
		    $("#addForm").validate({
		        submitHandler: function(form) { //验证通过后的执行方法
		            form.submit();
		        },
		        rules: {
		            uname: {
		                required: true,
		                remote: {
		                    url: "<%=path%>/user_unameExist.action",
		                    type: "post",
		                    dataType: "json",
		                    data: {
		                        uname: function() {
		                            return $("#uname").val();
		                        }
		                    },
		                    dataFilter: function(data) {
		                        return data;
		                    }
		                }
		            },
		            upwd: {
		                required: true,
		            },
		            upwd1: {
		                required: true,
		                equalTo: "#upwd",
		            },
		            name: {
		                required: true,
		            },
		            tel: {
		                required: true,
		                telphone: true,
		            },
		            email: {
		                required: true,
		                email: true,
		            },
		            birthday: {
		                required: true,
		            },
		        },
		        messages: {
		            uname: {
		                required: '学号不能为空',
		                remote: '学号已存在',
		            },
		            upwd: {
		                required: '密码不能为空',
		            },
		            upwd1: {
		                required: '请输入确认密码',
		                equalTo: '两次密码输入不一致',
		            },
		            name: {
		                required: '姓名不能为空',
		            },
		            tel: {
		                required: '联系电话不能为空',
		                telphone: '联系电话格式错误',
		            },
		            email: {
		                required: '邮箱不能为空',
		                email: '邮箱格式错误',
		            },
		            birthday: {
		                required: '出生日期不能为空',
		            },
		        }
		    });
		});
	</script>
	

</html>