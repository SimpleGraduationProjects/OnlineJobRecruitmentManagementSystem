<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>详情</title>
		<link href="<%=path%>/css/bootstrap/css/bootstrap.css"
			rel="stylesheet" type="text/css">
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.extend.js"></script>
		<link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet">
	</head>
	<body>
		<div class="page-content">
			<div class="panel panel-default">
				<div class="panel-heading">
					详情
				</div>
				<div class="panel-body">
					<div class="container-fluid">
						<div class="row rowmargin">
							<div class="col-sm-7">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										<font color="red">*</font>标题
									</label>
									<div class="col-sm-9 form-inline">
										<input id="name" name="name" size="35" value="${job.name}"
											readonly="readonly" class="form-control" type="text" />
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
										<input id="catelogid" name="catelogid" size="35"
											value="${job.catelogVO.name}" readonly="readonly"
											class="form-control" type="text" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="row rowmargin">
							<div class="col-sm-7">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										<font color="red">*</font>最小薪资
									</label>
									<div class="col-sm-9 form-inline">
										<input id="minsalary" name="minsalary" size="35"   style="width:80px"
											value="${job.minsalary}" readonly="readonly"
											class="form-control" type="text" />
										-
										<input id="maxsalary" name="maxsalary" size="35"  style="width:80px"
											value="${job.maxsalary}" readonly="readonly"
											class="form-control" type="text" />
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
											value="${job.address}" readonly="readonly"
											class="form-control" type="text" />
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
										<input id="quyu" name="quyu" size="35" value="${job.quyu}"
											readonly="readonly" class="form-control" type="text" />
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
										<input id="xueli" name="xueli" size="35" value="${job.xueli}"
											readonly="readonly" class="form-control" type="text" />
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
											value="${job.jingyan}" readonly="readonly"
											class="form-control" type="text" />
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
										<textarea rows="3" cols="80" id="fuli" name="fuli" readonly="readonly"
												class="form-control" tip="请输入公司福利">${job.fuli}</textarea>
									
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
										<textarea rows="8" cols="80" id="miaoshu" name="miaoshu" readonly="readonly"
												class="form-control" tip="请输入职位描述">${job.miaoshu}</textarea>
									
									</div>
								</div>
							</div>
						</div>
						<div class="row rowmargin">
							<div class="col-sm-7">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										<font color="red">*</font>发布时间
									</label>
									<div class="col-sm-9 form-inline">
										<input id="cdate" name="cdate" size="35" value="${job.cdate}"
											readonly="readonly" class="form-control" type="text" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-2">
							</div>
							<div class="col-sm-4" style="margin-left: 20px;">
								<button type="button" id="rebackBtn" class="btn btn-default"
									style="margin-top: 40px; margin-left: 20px;">
									返回
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
    $(document).ready(function(){
        $("#rebackBtn").click(function(){
            window.history.go(-1);
        });
    });
</script>
</html>
