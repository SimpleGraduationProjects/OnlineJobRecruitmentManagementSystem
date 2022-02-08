
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html>
<!-- saved from url=(0023)https://xa.lianjia.com/ -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-language" content="zh-CN">
		<title>登陆</title>

		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/web/css/reset.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/web/css/login.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/web/css/sign.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/web/css/sem10.css" />

		<script type="text/javascript" src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery-pdm.js"></script>
		<script type="text/javascript" src="<%=path%>/js/layer/layer.js"></script>
		
	</head>
	<body id="page_login">
		<jsp:include page="page/head.jsp" />
		<div class="main">
			<div class="container">


				<!-- 注册 -->
				<div class="box">
					<div class="sign-wrap">

						<!--注册-->
						<div class="sign-form sign-register" style="display: block;">
							<h3 class="title">
								网上求职招聘登录
							</h3>
							<div id="alert-error" class="tip-error"></div>
							<form id="loginForm"
								action="#" method="post" >
								<div class="form-row">
									<span class="ipt-wrap"> 
										<i class="icon-sign-phone"></i>
										<input type="text" class="ipt ipt-login"
											placeholder="用户名" id="uname" name="uname" > 
									</span>
									
								</div>
								<div class="form-row">
									<span class="ipt-wrap"> 
										<i class="icon-sign-pwd"></i>
										<input type="password" class="ipt ipt-pwd"
											placeholder="密码" id="upwd" id="upwd"> 
									</span>
									
								</div><!--

								<div class="form-row">
									<span class="ipt-wrap"> 
										<i class="icon-sign-sms"></i> <input
											type="text" class="ipt ipt-sms required" ka="signup-sms"
											placeholder="短信验证码" name="phoneCode" maxlength="6"> <input
											type="hidden" name="smsType" value="2">
										<button type="button" class="btn btn-sms"
											data-url="/wapi/zppassport/send/smsCodeV2">
											发送验证码
										</button> </span>
								</div>
								
								--><div class="form-row">
									<span class="ipt-wrap"> 
										<i class="icon-sign-sms"></i> 
										<input id="vcode" type="text" class="ipt ipt-sms required" 
											placeholder="验证码" name="vcode" maxlength="6">
									
										<a href="javascript:void(0);" class=" btn-sms" style="top: 0;">
											<img src="<%=path%>/CheckCode.tmp"
												style="width: 104px; height: 42px; vertical-align: bottom;"
												border="0" id="authcode_img" name="Img1"
												onclick="fresh(document.getElementById(&#39;authcode_img&#39;),'<%=path%>');">
										</a>
									</span>
								</div>
								<div class="form-btn">
									<button type="button" onclick="return login();" class="btn regester">
										登录
									</button>
								</div>
								<div class="text-tip">
					              <a href="<%=path%>/web/regiset.jsp" class="link-signup">免费注册</a>
					            </div>
							</form>

						</div>

					</div>
				</div>


				<!-- 主题背景-pc -->
				<div class="theme">
					<div class="title">
						海量优质人才，在线约面
					</div>
					<div class="desc">
						找人才就上企业直聘
					</div>
					<img src="<%=path%>/web/images/banner.png" >
				</div>



			</div>
			<div class="banner-wave"></div>
		</div>




		<jsp:include page="page/foot.jsp" />



	</body>
	<script type="text/javascript">
      function login(){
    	  var uname = $('#uname').val();
    	  var upwd = $('#upwd').val();
    	  var vcode = $('#vcode').val();
    	  if(!uname){
    		  $('#alert-error').text("用户名不能为空");
    		  $('#alert-error').show();
    		  return false;
    	  }
    	  if(!upwd){
    		  $('#alert-error').text("密码不能为空");
    		  $('#alert-error').show();
    		  return false;
    	  }
    	  if(vcode==null||vcode==''){
 		  	 
		  	  $('#alert-error').text("验证码不能为空");
    		  $('#alert-error').show();
		  	  return false;
		  }
    	  $.post("<%=path%>/user_login.action", { uname:uname,upwd:upwd,vcode:vcode},
   			   function(data){
    		        var datas = eval('data');
    		        datas = $.trim(datas);
    		       
   			        if(datas=="false"){
   			            $('#alert-error').text("用户名密码错误");
   	    		        $('#alert-error').show();
   	    		        return false;
   			        }else if(datas=="false1"){
   			            $('#alert-error').text("验证码错误");
   	    		        $('#alert-error').show();
   	    		        return false;
   			        }else{
   			         	window.location.href = '<%=path%>/index.action';	
   			        }
    		      
   		   });
    	  
      }
      //刷新验证码
      function fresh(v,url){
		v.src = url +"/CheckCode.tmp?id=" + Math.floor(Math.random() * 1000);	 
	  }
	</script>
</html>