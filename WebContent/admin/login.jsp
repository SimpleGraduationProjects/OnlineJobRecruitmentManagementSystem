<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="<%=path%>/css/layer.css"
			id="layuicss-layer">
		<script type="text/javascript" src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery-pdm.js"></script>
		<script type="text/javascript" src="<%=path%>/js/layer/layer.js"></script>
		<link href="<%=path%>/css/login.css" rel="stylesheet">
		<title>网上求职招聘系统</title>
	</head>
	<body>
		<div class="login">
			<div class="login-top">
				<div style="text-align: center; padding-top: 50px;">
					<img src="<%=path%>/images/logo.png" height="62">
				</div>
			</div>
			<div class="loginDiv">
				<div class="login-con">
					<div class="login-tit">
						登录
					</div>
					<div class="login-form">
						<form id="loginForm"
							action="#" method="post" >
							<div id="alert-error" class="error">
							</div>
							<p class="p1">
								<input type="text" autocomplete="on" class="alterInput"
									placeholder="请输入用户名" id="uname" name="uname" value="">
							</p>
							<p class="p2">
								<input type="password" autocomplete="off" class="alterInput"
									placeholder="请输入密码" id="upwd" id="upwd" value="">
							</p>
							
							<p class="p3">
								<select id="utype" name="utype" class="alterOption">
									<option value="1">招聘员工</option>
									<option value="0">管理员</option>
								</select>
							</p>
							
							<p style="padding-left: 0px; margin-bottom: 20px;">
								<input type="button" onclick="return login();" id="btnSubmit" value="登录" class="btn btn1">
							
							</p>
						</form>
					</div>
				</div>
			</div>
			<div class="help">
				<a href="">技术支持</a>
			</div>
			<div class="login-footer">
				版权©-运动会管理系统
			</div>
		</div>
		<div class="layui-layer-move"></div>
	</body>
	<script type="text/javascript">
      function login(){
    	  var uname = $('#uname').val();
    	  var upwd = $('#upwd').val();
    	  var utype = $('#utype').val();
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
    	  
    	  $.post("<%=path%>/tadmin_login.action", { uname:uname,upwd:upwd,utype:utype},
   			   function(data){
    		        var datas = eval('data');
    		        datas = $.trim(datas);
    		       
   			        if(datas=="false"){
   			            $('#alert-error').text("用户名密码错误");
   	    		        $('#alert-error').show();
   	    		        return false;
   			        }else{
   			         	window.location.href = '<%=path%>/admin/index.jsp';	
   			        }
    		      
   		   });
    	  
      }
     
</script>
</html>
