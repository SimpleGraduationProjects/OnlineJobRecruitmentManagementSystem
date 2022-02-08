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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script language="javascript" type="text/javascript"
			src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
		<link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet">
	</head>
	<body>
		<div class="page-content">
			<div class="panel panel-default">
				<div class="panel-heading">
					修改
				</div>
				<div class="panel-body">
					<form action="<%=path%>/user_update.action" method="post"
						id="addForm">
						<input name="id" type="hidden" value="${user.id}" />
						<div class="container-fluid">
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>用户名
										</label>
										<div class="col-sm-9 form-inline">
											<input id="uname" name="uname" size="35" class="form-control"
												type="text" value="${user.uname}" tip="请输入用户名" />
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
												type="text" value="${user.upwd}" tip="请输入密码" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>姓名
										</label>
										<div class="col-sm-9 form-inline">
											<input id="name" name="name" size="35" class="form-control"
												type="text" value="${user.name}" tip="请输入姓名" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>性别
										</label>
										<div class="col-sm-9 form-inline">
											<select id="sex" name="sex" class="form-control">
												<option <c:if test="${user.sex=='男'}">selected</c:if>
													value="男">
													男
												</option>
												<option <c:if test="${user.sex=='女'}">selected</c:if>
													value="女">
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
											<font color="red">*</font>联系电话
										</label>
										<div class="col-sm-9 form-inline">
											<input id="tel" name="tel" size="35" class="form-control"
												type="text" value="${user.tel}" tip="请输入联系电话" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>邮箱
										</label>
										<div class="col-sm-9 form-inline">
											<input id="email" name="email" size="35" class="form-control"
												type="text" value="${user.email}" tip="请输入邮箱" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>出生日期
										</label>
										<div class="col-sm-9 form-inline">
											<input id="birthday" name="birthday" size="35"
												class="form-control" readonly="readonly"
												onClick="WdatePicker()" type="text" value="${user.birthday}"
												tip="请输入出生日期" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>照片
										</label>
										<div class="col-sm-9 form-inline">
											<input id="photo" readonly="readonly" name="photo"
												value="${user.photo}" size="35" class="form-control"
												type="text" tip="请上传文件" />
											<input type="button" value="上传" onclick="up('photo',0)" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>学历
										</label>
										<div class="col-sm-9 form-inline">
											<select id="xueli" name="xueli" class="form-control">
												<option <c:if test="${user.xueli=='初中及以下'}">selected</c:if>
													value="初中及以下">
													初中及以下
												</option>
												<option <c:if test="${user.xueli=='高中'}">selected</c:if>
													value="高中">
													高中
												</option>
												<option <c:if test="${user.xueli=='大专'}">selected</c:if>
													value="大专">
													大专
												</option>
												<option <c:if test="${user.xueli=='本科'}">selected</c:if>
													value="本科">
													本科
												</option>
												<option <c:if test="${user.xueli=='硕士'}">selected</c:if>
													value="硕士">
													硕士
												</option>
												<option <c:if test="${user.xueli=='博士'}">selected</c:if>
													value="博士">
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
											<font color="red">*</font>期望职位
										</label>
										<div class="col-sm-9 form-inline">
											<select id="catelogid" name="catelogid" class="form-control">
												<c:forEach items="${catelogList}" var="info">
													<option
														<c:if test="${user.catelogid==info.id}">selected</c:if>
														value="${info.id}">
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
											<font color="red">*</font>薪资要求
										</label>
										<div class="col-sm-9 form-inline">
											<input id="xinzi" name="xinzi" size="35" class="form-control"
												type="text" value="${user.xinzi}" tip="请输入薪资要求" />
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
											<textarea rows="5" cols="80" id="gzjy" name="gzjy"
												class="form-control" tip="请输入工作经验">${user.gzjy}</textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>毕业学校
										</label>
										<div class="col-sm-9 form-inline">
											<input id="school" name="school" size="35"
												class="form-control" type="text" value="${user.school}"
												tip="请输入毕业学校" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>专业
										</label>
										<div class="col-sm-9 form-inline">
											<input id="zhuanye" name="zhuanye" size="35"
												class="form-control" type="text" value="${user.zhuanye}"
												tip="请输入专业" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>在校时间
										</label>
										<div class="col-sm-9 form-inline">
											<input id="sdate" name="sdate" size="35" class="form-control"
												type="text" value="${user.sdate}" tip="请输入在校时间" />
										</div>
									</div>
								</div>
							</div>
							<div class="row rowmargin">
								<div class="col-sm-7">
									<div class="form-group">
										<label class="col-sm-3 control-label">
											<font color="red">*</font>求职状态
										</label>
										<div class="col-sm-9 form-inline">
											<select id="zt" name="zt" class="form-control">
												<option <c:if test="${user.zt=='离职-随时到岗'}">selected</c:if>
													value="离职-随时到岗">
													离职-随时到岗
												</option>
												<option <c:if test="${user.zt=='在职-暂不考虑'}">selected</c:if>
													value="在职-暂不考虑">
													在职-暂不考虑
												</option>
												<option <c:if test="${user.zt=='在职-考虑机会'}">selected</c:if>
													value="在职-考虑机会">
													在职-考虑机会
												</option>
												<option <c:if test="${user.zt=='在职-月内到岗'}">selected</c:if>
													value="在职-月内到岗">
													在职-月内到岗
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
											<font color="red">*</font>个人优势
										</label>
										<div class="col-sm-9 form-inline">
											<textarea rows="5" cols="80" id="youdian" name="youdian"
												class="form-control" tip="请输入个人优势">${user.youdian}</textarea>
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
                        uname:{
                                    required:true,
                                    remote: {
                    url: "<%=path%>/user_unameExist.action",
                            type: "post",
                            dataType: "json",
                            data: {
                        uname: function (){ return $("#uname").val();}
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
                                sex:{
                                    required:true,
                    },
                                tel:{
                                    required:true,
                                    telphone:true,
                    },
                                email:{
                                    required:true,
                                    email:true,
                    },
                                birthday:{
                                    required:true,
                    },
                                photo:{
                                    required:true,
                    },
                                xueli:{
                                    required:true,
                    },
                                catelogid:{
                                    required:true,
                    },
                                xinzi:{
                                    required:true,
                    },
                                gzjy:{
                                    required:true,
                    },
                                school:{
                                    required:true,
                    },
                                zhuanye:{
                                    required:true,
                    },
                                sdate:{
                                    required:true,
                    },
                                zt:{
                                    required:true,
                    },
                                youdian:{
                                    required:true,
                    },
            },
    messages:{
                                    uname:{
                                                            required:'用户名不能为空',
                                                            remote:'用户名已存在',
                            },
                                                upwd:{
                                                            required:'密码不能为空',
                            },
                                                name:{
                                                            required:'姓名不能为空',
                            },
                                                sex:{
                                                            required:'性别不能为空',
                            },
                                                tel:{
                                                            required:'联系电话不能为空',
                                                            telphone:'联系电话格式错误',
                            },
                                                email:{
                                                            required:'邮箱不能为空',
                                                            email:'邮箱格式错误',
                            },
                                                birthday:{
                                                            required:'出生日期不能为空',
                            },
                                                photo:{
                                                            required:'照片不能为空',
                            },
                                                xueli:{
                                                            required:'学历不能为空',
                            },
                                                catelogid:{
                                                            required:'期望职位不能为空',
                            },
                                                xinzi:{
                                                            required:'薪资要求不能为空',
                            },
                                                gzjy:{
                                                            required:'工作经验不能为空',
                            },
                                                school:{
                                                            required:'毕业学校不能为空',
                            },
                                                zhuanye:{
                                                            required:'专业不能为空',
                            },
                                                sdate:{
                                                            required:'在校时间不能为空',
                            },
                                                zt:{
                                                            required:'求职状态不能为空',
                            },
                                                youdian:{
                                                            required:'个人优势不能为空',
                            },
    }
});
});
        var pop;
    function up(fname,type)
    {
        pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
        pop.setContent("contentUrl","<%=path %>/upload/upload.jsp?fname="+fname + "&pt=" + type);
        pop.setContent("title","文件上传");
        pop.build();
        pop.show();
    }
    function popupClose(){
        pop.close();
    }
    </script>
</html>