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
					<form action="<%=path%>/job_add.action" method="post" id="addForm">
						<div class="container-fluid">
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>标题
										</label>
										<div class="col-sm-9 form-inline">
											<input id="name" name="name" size="35" class="form-control"
												type="text" value="" tip="请输入标题" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>职位
										</label>
										<div class="col-sm-9 form-inline">
											<select id="catelogid" name="catelogid" class="form-control">
												<c:forEach items="${catelogList}" var="info">
													<option value="${info.id}">
														${info.name}
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
											<font color="red">*</font>薪资
										</label>
										<div class="col-sm-9 form-inline">
											<input id="minsalary" name="minsalary" size="35" style="width:80px"
												class="form-control" type="text" value="" tip="请输入最小薪资" />
											-
											<input id="maxsalary" name="maxsalary" size="35" style="width:80px"
												class="form-control" type="text" value="" tip="请输入最大薪资" />
										</div>
									</div>
								</div>
							</div>
							
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>工作地址
										</label>
										<div class="col-sm-9 form-inline">
											<input id="address" name="address" size="35"
												class="form-control" type="text" value="" tip="请输入工作地址" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>工作区域
										</label>
										<div class="col-sm-9 form-inline">
											<input id="quyu" name="quyu" size="35" class="form-control"
												type="text" value="" tip="请输入工作区域" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>要求学历
										</label>
										<div class="col-sm-9 form-inline">
											<select id="xueli" name="xueli" class="form-control">
												<option value="初中及以下">
													初中及以下
												</option>
												<option value="高中">
													高中
												</option>
												<option value="大专">
													大专
												</option>
												<option value="本科">
													本科
												</option>
												<option value="硕士">
													硕士
												</option>
												<option value="博士">
													博士
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
											<font color="red">*</font>工作经验
										</label>
										<div class="col-sm-9 form-inline">
											<input id="jingyan" name="jingyan" size="35"
												class="form-control" type="text" value="" tip="请输入工作经验" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>公司福利
										</label>
										<div class="col-sm-9 form-inline">
											<textarea rows="3" cols="80" id="fuli" name="fuli"
												class="form-control" tip="请输入公司福利"></textarea>
												
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>职位描述
										</label>
										<div class="col-sm-9 form-inline">
											
											<textarea rows="8" cols="80" id="miaoshu" name="miaoshu"
												class="form-control" tip="请输入职位描述"></textarea>
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
	$(document).ready(function() {
	    $("#rebackBtn").click(function() {
	        window.history.go( - 1);
	    });
	    $("#addForm").validate({
	        submitHandler: function(form) { //验证通过后的执行方法
	            form.submit();
	        },
	        rules: {
	            
	            catelogid: {
	                required: true,
	            },
	            name: {
	                required: true,
	            },
	            minsalary: {
	                required: true,
	                digits: true,
	            },
	            maxsalary: {
	                required: true,
	                digits: true,
	            },
	            address: {
	                required: true,
	            },
	            quyu: {
	                required: true,
	            },
	            xueli: {
	                required: true,
	            },
	            jingyan: {
	                required: true,
	            },
	            fuli: {
	                required: true,
	            },
	            miaoshu: {
	                required: true,
	            },
	        },
	        messages: {
	           
	            catelogid: {
	                required: '职位不能为空',
	            },
	            name: {
	                required: '标题不能为空',
	            },
	            minsalary: {
	                required: '最小薪资不能为空',
	                digits: '最小薪资必须为整数',
	            },
	            maxsalary: {
	                required: '最大薪资不能为空',
	                digits: '最大薪资必须为整数',
	            },
	            address: {
	                required: '工作地址不能为空',
	            },
	            quyu: {
	                required: '工作区域不能为空',
	            },
	            xueli: {
	                required: '要求学历不能为空',
	            },
	            jingyan: {
	                required: '工作经验不能为空',
	            },
	            fuli: {
	                required: '公司福利不能为空',
	            },
	            miaoshu: {
	                required: '职位描述不能为空',
	            },
	        }
	    });
	});
</script>
</html>