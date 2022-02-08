<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>新增</title>
		<link href="<%=path%>/css/bootstrap/css/bootstrap.css"
			rel="stylesheet" type="text/css">
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.extend.js"></script>
		<script src="<%=path%>/js/jquery.validate.method.js"></script>
		<script language="javascript" type="text/javascript"
			src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
		<link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet">
	</head>
	<body>
		<div class="page-content">
			<div class="panel panel-default">
				<div class="panel-heading">
					注册
					 <p class="text-muted text-center"><small>已经有账户了？</small><a href="<%=path%>/admin/login.jsp" target="_self">点此登录</a>
               		 </p>
				</div>
				<div class="panel-body">
					<form action="<%=path%>/yezhuReg.action" method="post"
						id="addForm">
						<div class="container-fluid">
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>住户号
										</label>
										<div class="col-sm-9 form-inline">
											<input id="zno" name="zno" size="35" class="form-control"
												type="text" value="" tip="请输入住户号" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>密码
										</label>
										<div class="col-sm-9 form-inline">
											<input id="upwd" name="upwd" size="35" class="form-control"
												type="password" value="" tip="请输入密码" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											房号
										</label>
										<div class="col-sm-9 form-inline">
											<select id="fid" name="fid" class="form-control">
												<c:forEach items="${fangwuList}" var="info">
													<option value="${info.id}">
														${info.fanghao}
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>业主姓名
										</label>
										<div class="col-sm-9 form-inline">
											<input id="name" name="name" size="35" class="form-control"
												type="text" value="" tip="请输入业主姓名" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											性别
										</label>
										<div class="col-sm-9 form-inline">
											<select id="sex" name="sex" class="form-control">
												<option value="男">
													男
												</option>
												<option value="女">
													女
												</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											工作单位
										</label>
										<div class="col-sm-9 form-inline">
											<input id="gzdw" name="gzdw" size="35" class="form-control"
												type="text" value="" tip="请输入工作单位" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											电话
										</label>
										<div class="col-sm-9 form-inline">
											<input id="tel" name="tel" size="35" class="form-control"
												type="text" value="" tip="请输入电话" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											备注
										</label>
										<div class="col-sm-9 form-inline">
											<textarea rows="5" cols="80" id="remark" name="remark"
												class="form-control" tip="请输入备注"></textarea>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-2">
								</div>
								<div class="col-sm-4" style="margin-left: 20px;">
									<button type="submit" class="btn btn-primary"
										style="margin-top: 40px;">
										注册
									</button>
									
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
$(document).ready(function(){
    	 $("#rebackBtn").click(function(){
	     window.history.go(-1); 
	 });
    $("#addForm").validate({
        submitHandler:function(form){//验证通过后的执行方法
                        form.submit();
        },
        rules: {
                                                    zno:{
                                                                    required:true,
                                                                    remote: {
                                        url: "<%=path%>/yezhu_znoExist.action",
                                                type: "post",
                                                dataType: "json",
                                                data: {
                                           zno: function (){ return $("#zno").val();}
                                        },
                                        dataFilter: function (data) {
                                            return data;
                                        }
                                }
                                                    },
                                                                    upwd:{
                                                                    required:true,
                                                    },
                                                                                                name:{
                                                                    required:true,
                                                    },
                                                                                                                            tel:{
                                                                    telphone:true,
                                                    },
                                                                                            },
        messages:{
                                                zno:{
                                                                        required:'住户号不能为空',
                                                                        remote:'住户号已存在',
                                    },
                                                                upwd:{
                                                                        required:'密码不能为空',
                                    },
                                                                                            name:{
                                                                        required:'业主姓名不能为空',
                                    },
                                                                                                                        tel:{
                                                                        telphone:'电话格式错误',
                                    },
        }
    });
});
</script>
</html>