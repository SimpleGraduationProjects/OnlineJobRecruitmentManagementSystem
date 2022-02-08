<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath(); %>
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
					新增
				</div>
				<div class="panel-body">
					<form action="<%=path%>/test_add.action" method="post" id="addForm">
						<div class="container-fluid">
							
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>问题
										</label>
										<div class="col-sm-9 form-inline">
											<input id="content" name="content" size="35"
												class="form-control" type="text" value="" tip="请输入问题" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>选项1
										</label>
										<div class="col-sm-9 form-inline">
											<input id="option1" name="option1" size="35"
												class="form-control" type="text" value="" tip="请输入选项1" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>选项2
										</label>
										<div class="col-sm-9 form-inline">
											<input id="option2" name="option2" size="35"
												class="form-control" type="text" value="" tip="请输入选项2" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>选项3
										</label>
										<div class="col-sm-9 form-inline">
											<input id="option3" name="option3" size="35"
												class="form-control" type="text" value="" tip="请输入选项3" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>选项4
										</label>
										<div class="col-sm-9 form-inline">
											<input id="option4" name="option4" size="35"
												class="form-control" type="text" value="" tip="请输入选项4" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>答案
										</label>
										<div class="col-sm-9 form-inline">
											<select id="okey" name="okey" class="form-control">
												<option value="A">
													A
												</option>
												<option value="B">
													B
												</option>
												<option value="C">
													C
												</option>
												<option value="D">
													D
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
											得分
										</label>
										<div class="col-sm-9 form-inline">
											<input id="score" name="score" size="35" class="form-control"
												type="text" value="" tip="请输入得分" />
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
										提交
									</button>
									<button type="button" id="rebackBtn" class="btn btn-default"
										style="margin-top: 40px; margin-left: 20px;">
										返回
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
                                                                                content:{
                                                                    required:true,
                                                    },
                                                                    option1:{
                                                                    required:true,
                                                    },
                                                                    option2:{
                                                                    required:true,
                                                    },
                                                                    option3:{
                                                                    required:true,
                                                    },
                                                                    option4:{
                                                                    required:true,
                                                    },
                                                                    okey:{
                                                                    required:true,
                                                    },
                                                                },
        messages:{
                                                                            content:{
                                                                        required:'问题不能为空',
                                    },
                                                                option1:{
                                                                        required:'选项1不能为空',
                                    },
                                                                option2:{
                                                                        required:'选项2不能为空',
                                    },
                                                                option3:{
                                                                        required:'选项3不能为空',
                                    },
                                                                option4:{
                                                                        required:'选项4不能为空',
                                    },
                                                                okey:{
                                                                        required:'答案不能为空',
                                    },
        }
    });
});
</script>
</html>