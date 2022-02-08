<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>详情</title>
    <link href="<%=path%>/css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
    <script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/jquery.validate.min.js"></script>
    <script src="<%=path%>/js/jquery.validate.extend.js"></script>
    <link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet">
</head>
<body>
<div class="page-content">
    <div class="panel panel-default">
        <div class="panel-heading">详情</div>
        <div class="panel-body">
                <div class="container-fluid">
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>用户名   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="uname" name="uname" size="35" value="${user.uname}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>密码   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="upwd" name="upwd" size="35" value="${user.upwd}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>姓名   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="name" name="name" size="35" value="${user.name}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>性别   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="sex" name="sex" size="35" value="${user.sex}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>联系电话   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="tel" name="tel" size="35" value="${user.tel}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>邮箱   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="email" name="email" size="35" value="${user.email}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>出生日期   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="birthday" name="birthday" size="35" value="${user.birthday}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>照片   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="photo" name="photo" size="35" value="${user.photo}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>学历   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="xueli" name="xueli" size="35" value="${user.xueli}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>期望职位   </label>
                                    <div class="col-sm-9 form-inline" >
                                                    <input id="catelogid" name="catelogid" size="35" value="${user.catelogVO.name}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>薪资要求   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="xinzi" name="xinzi" size="35" value="${user.xinzi}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>工作经验   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <textarea rows="5" readonly="readonly" cols="80" id="gzjy" name="gzjy" class="form-control" tip="请输入工作经验">${user.gzjy}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>毕业学校   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="school" name="school" size="35" value="${user.school}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>专业   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="zhuanye" name="zhuanye" size="35" value="${user.zhuanye}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>在校时间   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="sdate" name="sdate" size="35" value="${user.sdate}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>求职状态   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <input id="zt" name="zt" size="35" value="${user.zt}" readonly="readonly" class="form-control" type="text"  />
                                    </div>
                                </div>
                            </div>
                        </div>
					                        <div class="row rowmargin">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><font color="red">*</font>个人优势   </label>
                                    <div class="col-sm-9 form-inline" >
                                                                                    <textarea rows="5" readonly="readonly" cols="80" id="youdian" name="youdian" class="form-control" tip="请输入个人优势">${user.youdian}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="row">
                        <div class="col-sm-2">
                        </div>
                        <div class="col-sm-4" style="margin-left: 20px;">
                            <button type="button" id="rebackBtn" class="btn btn-default" style="margin-top: 40px;margin-left: 20px;">返回</button>
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
