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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script type="text/javascript" charset="utf-8"
			src="<%=path%>/js/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8"
			src="<%=path%>/js/ueditor/ueditor.all.min.js"> </script>
		<script type="text/javascript" charset="utf-8"
			src="<%=path%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>
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
					<form action="<%=path%>/gonggao_add.action" method="post"
						id="addForm">
						<div class="container-fluid">
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>咨询标题
										</label>
										<div class="col-sm-9 form-inline">
											<input id="name" name="name" size="35" class="form-control"
												type="text" value="" tip="请输入咨询标题" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>资讯类型
										</label>
										<div class="col-sm-9 form-inline">
											<select id="gtype" name="gtype" class="form-control">
												<option value="面试技巧">
													面试技巧
												</option>
												<option value="应聘技巧">
													应聘技巧
												</option>
												<option value="职场资讯">
													职场资讯
												</option>
												<option value="热点新闻">
													热点新闻
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
											<font color="red">*</font>图片
										</label>
										<div class="col-sm-9 form-inline">
											<input id="tupian" readonly="readonly" name="tupian"
												size="35"  class="form-control"
												type="text" tip="请上传文件" />
											<input type="button" value="上传" onclick="up('tupian',0)" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>简介
										</label>
										<div class="col-sm-9 form-inline">
											<textarea rows="5" cols="80" id="jianjie" name="jianjie"
												class="form-control" tip="请输入简介" maxlength="200"></textarea>
										</div>
									</div>
								</div>
							</div>

						
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>描述
										</label>
										<div class="col-sm-9 form-inline">
											<script id="container" type="text/plain"
												style="width:850px;height:300px;"></script>
											<input id="miaoshu" name="miaoshu" type="hidden" />
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
	    var ue = UE.getEditor('container');
	    $("#rebackBtn").click(function() {
	        window.history.go( - 1);
	    });
	    $("#addForm").validate({
	        submitHandler: function(form) { //验证通过后的执行方法
	            var htmlv = ue.getContent();
	            if (htmlv == null || htmlv == '') {
	                alert("内容不能为空");
	                return false;
	            }
	            document.getElementById("miaoshu").value = htmlv;
	            form.submit();
	        },
	        rules: {
	            name: {
	                required: true,
	            },
	            gtype: {
	                required: true,
	            },
	            tupian:{
                    required:true,
				},
				jianjie:{
				    required:true,
				},
	            miaoshu: {
	                required: true,
	            },
	        },
	        messages: {
	            name: {
	                required: '咨询标题不能为空',
	            },
	            name: {
	                required: '图片不能为空',
	            },
	            jianjie: {
	                required: '简介不能为空',
	            },
	            gtype: {
	                required: '资讯类型不能为空',
	            },
	            miaoshu: {
	                required: '描述不能为空',
	            },
	        }
	    });
	});
	var pop;
	function up(fname, type) {
	    pop = new Popup({
	        contentType: 1,
	        isReloadOnClose: false,
	        width: 400,
	        height: 200
	    });
	    pop.setContent("contentUrl", "<%=path %>/upload/upload.jsp?fname=" + fname + "&pt=" + type);
	    pop.setContent("title", "文件上传");
	    pop.build();
	    pop.show();
	}
	function popupClose() {
	    pop.close();
	}
</script>
</html>