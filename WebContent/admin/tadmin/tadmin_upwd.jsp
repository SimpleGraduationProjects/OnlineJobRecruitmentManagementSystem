<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改密码</title>
<link href="<%=path%>/css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/jquery.validate.min.js"></script>
<script src="<%=path%>/js/jquery.validate.extend.js"></script>
<script src="<%=path%>/js/jquery.validate.method.js"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet">
</head>
<body>
	<div class="page-content">
		<div class="panel panel-default">
			<div class="panel-heading">修改密码</div>
			<div class="panel-body">
				<form action="<%=path%>/tadmin_upwd.action" method="post" id="addForm">
					 
					<div class="container-fluid">
						<div class="row rowmargin">
							<div class="col-sm-8">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										<font color="red">*</font>
										用户名
									</label>
									<div class="col-sm-9 form-inline">
										<input id="uname" name="uname" readonly="readonly" size="35" class="form-control" type="text" value="${sessionScope.cuser.uname}" tip="请输入用户名" />
									</div>
								</div>
							</div>
						</div>
						<div class="row rowmargin">
							<div class="col-sm-8">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										<font color="red">*</font>
										原密码
									</label>
									<div class="col-sm-9 form-inline">
										<input id="pwd" name="pwd" size="35" class="form-control" type="password"   />
									</div>
								</div>
							</div>
						</div>
						<div class="row rowmargin">
							<div class="col-sm-8">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										<font color="red">*</font>
										新密码
									</label>
									<div class="col-sm-9 form-inline">
										<input id="upwd" name="upwd" size="35" class="form-control" type="password"   />
									</div>
								</div>
							</div>
						</div>
						<div class="row rowmargin">
							<div class="col-sm-8">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										<font color="red">*</font>
										确认密码
									</label>
									<div class="col-sm-9 form-inline">
										<input id="upwd1" name="upwd1" size="35" class="form-control" type="password"   />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-4" style="margin-left: 20px;">
								<button type="submit" class="btn btn-primary" style="margin-top: 40px;">提交</button>
								<button type="button" id="rebackBtn" class="btn btn-default" style="margin-top: 40px; margin-left: 20px;">返回</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#rebackBtn").click(function() {
			window.history.go(-1);
		});
		$("#addForm").validate({
			submitHandler : function(form) {//验证通过后的执行方法
				var opwd = '${sessionScope.cuser.upwd}';
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