<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>修改</title>
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
					面试通知
				</div>
				<div class="panel-body">
					<form action="<%=path%>/offer_update.action" method="post"
						id="addForm">
						<input name="id" type="hidden" value="${offer.id}" />
						
						
						<div class="container-fluid">
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											应聘者
										</label>
										<div class="col-sm-9 form-inline">
											<input size="35" class="form-control"
												type="text" value="${offer.userVO.name}" readonly="readonly" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											是否通知
										</label>
										<div class="col-sm-9 form-inline">
											<select id="zt" name="zt" class="form-control">
												<option <c:if test="${offer.zt=='面试'}">selected</c:if>
														value="面试">面试</option>
												<option <c:if test="${offer.zt=='不符合'}">selected</c:if>
														value="不符合">不符合</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>回复内容
										</label>
										<div class="col-sm-9 form-inline">
											<textarea rows="5" cols="80" id="content" name="content" maxlength="250"
												class="form-control" tip="请输入回复内容">${offer.content}</textarea>
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
										保存
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
	            content: {
	                required: true,
	            },
	        },
	        messages: {
	            content: {
	                required: '回复内容不能为空',
	            },
	        }
	    });
	});
    </script>
</html>