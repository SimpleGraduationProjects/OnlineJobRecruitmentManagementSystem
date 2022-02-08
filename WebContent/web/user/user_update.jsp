<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://account.lvye.cn/accounts/register/ -->
<html xmlns:wb="http://open.weibo.com/wb">
	<!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-language" content="zh-CN">

		<title>网上求职招聘</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />
		
		<link rel="stylesheet" href="<%=path%>/web/css/app_user.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/common.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/user.css" />
		
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.min.js"></script>
		<script src="<%=path%>/js/jquery.validate.extend.js"></script>
		<script src="<%=path%>/js/jquery.validate.method.js"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script language="javascript" type="text/javascript"
			src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>

	</head>

	<body style="background-color: #f5f5f5;">
		<div id="wrap" >
			<jsp:include page="../page/head.jsp" />
			<div id="main" class="inner">
				<div id="container" class="resume-container" style="padding-bottom: 20px;">
					<div class="resume-content">
						<div class="resume-content-box">
							<div class="resume-box" style="display: black;">
								<form  action="<%=path%>/user_info.action" method="post"
										id="addForm" class="ui-form ui-form-label-top">
								<input name="id" type="hidden" value="${user.id}" />
								<input name="upwd" type="hidden" value="${user.upwd}" />
								<input name="state" type="hidden" value="${user.state}" />
								<div class="resume-item resume-userinfo resume-undefined">

									<div  class="item-form">
										<h3  class="title">编辑个人信息</h3>
										<div  class="form-item">
											<div class="item-label">姓名</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
													<input  type="text" name="name" id="name"
														placeholder="请输入您的姓名" maxlength="24" readonly="readonly"
														class="input" value="${sessionScope.user.name}" >
													
												</div>
											</div>
										</div>
										<div  class="form-item">
											<div class="item-label">照片</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
													<input  type="text" name="photo" id="photo" readonly="readonly"
														style="width:250px"
														class="input" value="${sessionScope.user.photo}" >
													<input type="button" class="btn" style="min-width: 54px;" value="上传" onclick="up('photo',0)" />
												</div>
											</div>
										</div>
										<div  class="form-item"
											ka="resume_form_edit_applyStatus">
											<div class="item-label">
												当前求职状态
											</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
												
													<select id="zt" name="zt" class="input">
														<option <c:if test="${sessionScope.user.zt=='离职-随时到岗'}">selected</c:if> value="离职-随时到岗">
															离职-随时到岗
														</option>
														<option <c:if test="${sessionScope.user.zt=='在职-暂不考虑'}">selected</c:if> value="高中">
															在职-暂不考虑
														</option>
														<option <c:if test="${sessionScope.user.zt=='在职-考虑机会'}">selected</c:if> value="大专">
															在职-考虑机会
														</option>
														<option <c:if test="${sessionScope.user.zt=='在职-月内到岗'}">selected</c:if> value="本科">
															在职-月内到岗
														</option>
														
													</select>
													
												</div>
											</div>
										</div>
										<div  class="form-item">
											<div class="item-label">学历</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
													<select id="xueli" name="xueli" class="input">
														<option <c:if test="${sessionScope.user.xueli=='初中及以下'}">selected</c:if> value="初中及以下">
															初中及以下
														</option>
														<option <c:if test="${sessionScope.user.xueli=='高中'}">selected</c:if> value="高中">
															高中
														</option>
														<option <c:if test="${sessionScope.user.xueli=='大专'}">selected</c:if> value="大专">
															大专
														</option>
														<option <c:if test="${sessionScope.user.xueli=='本科'}">selected</c:if> value="本科">
															本科
														</option>
														<option <c:if test="${sessionScope.user.xueli=='硕士'}">selected</c:if> value="硕士">
															硕士
														</option>
														<option <c:if test="${sessionScope.user.xueli=='博士'}">selected</c:if> value="博士">
															博士
														</option>
													</select>
													
												</div>
											</div>
										</div>
										<div  class="form-item">
											<div class="item-label">
												性别
											</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
												
													<select id="sex" name="sex" class="input">
														<option <c:if test="${sessionScope.user.sex=='男'}">selected</c:if> value="男">
															男
														</option>
														<option <c:if test="${sessionScope.user.sex=='女'}">selected</c:if> value="女">
															女
														</option>
													</select>
													
												</div>
											</div>
										</div>
										
										<div  class="form-item">
											<div class="item-label">
												生日
											</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
													<input  type="text" name="birthday" id="birthday"
														placeholder="请输入您的生日" maxlength="24"
														class="input"  onClick="WdatePicker()" value="${sessionScope.user.birthday}">
													
												</div>
											</div>
										</div>
										<div  class="form-item">
											<div class="item-label">
												电话
											</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
													<input  type="text" name="tel" id="tel"
														placeholder="请输入您的电话" maxlength="24"
														class="input" value="${sessionScope.user.tel}">
													
												</div>
												<!---->
											</div>
										</div>
										<div  class="form-item">
											<div class="item-label">
												邮箱
											</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
													<input  type="text" name="email" id="email"
														placeholder="请输入您的邮箱" maxlength="24"
														class="input"  value="${sessionScope.user.email}">
													
												</div>
												<!---->
											</div>
										</div>
										
									</div>
									<!---->
								</div>

								<div id="summary"
									class="resume-item resume-summary resume-undefined">
									<div class="item-form">
										<h3 class="title">
											编辑个人优势
										</h3>
										
										<div class="form-item-full form-item-advantage form-item form-item-required">
											<div class="item-content">
												<div class="input-wrap input-wrap-textarea">
													<textarea wrap="soft" autocomplete="off"
														spellcheck="false" id="youdian" name="youdian"
														placeholder="例如：两年UI设计经验，熟悉IOS和Android的界面设计规范，对产品本色有独特见解，有一定的手绘基础"
														rows="2" class="input">${sessionScope.user.youdian}</textarea>
													
												</div>
											</div>
										</div>
											
										
									</div>
									<!---->
								</div>
								<div id="purpose"
									class="resume-item resume-purpose resume-undefined">
									<div data-v-1b643000="" class="item-form expectation-form">
										<h3 data-v-1b643000="" class="title">
											编辑求职期望
										</h3>
										
										<div data-v-1b643000="" class="form-item form-item-required">
											<div class="item-label">
												期望职位
											</div>
											<div class="input-wrap input-wrap-text">
											
												<select id="catelogid" name="catelogid" class="input">
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
										
										
										<div  class="form-item">
											<div class="item-label">
												薪资要求
											</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
													<input  type="text" name="xinzi" id="xinzi"
														placeholder="请输入您的薪资要求" maxlength="24"
														class="input" value="${sessionScope.user.xinzi}" >
													
												</div>
												<!---->
											</div>
										</div>
										<div  class="form-item">
											<div class="item-label">
												工作经验
											</div>
											<div class="item-content">
												<div class="input-wrap input-wrap-text">
													<input  type="text" name="gzjy" id="gzjy"
														placeholder="请输入您的工作经验" maxlength="24"
														class="input"  value="${sessionScope.user.gzjy}" >
													
												</div>
												<!---->
											</div>
										</div>
									</div>
									<!---->
								</div>
								<div id="summary"
									class="resume-item resume-summary resume-undefined">
									<div class="item-form">
										<h3 class="title">
											工作经历
										</h3>
										
										<div class="form-item-full form-item-advantage form-item form-item-required">
											<div class="item-content">
												<div class="input-wrap input-wrap-textarea">
													<textarea wrap="soft" autocomplete="off"
														spellcheck="false" id="gzjl" name="gzjl"
														placeholder="请输入你的工作经历"
														rows="2" class="input">${sessionScope.user.gzjl}</textarea>
													
												</div>
											</div>
										</div>
											
										
									</div>
									<!---->
								</div>
								
								<div id="education"
									class="resume-item resume-education resume-undefined">
									<div class="item-form">
										<h3 class="title">
											编辑教育经历
										</h3>
										
											<div class="form-item form-item-required">
												<div class="item-label">
													学校名称
												</div>
												<div class="item-content">
													<div class="input-wrap input-wrap-text">
														<input  type="text" name="school" id="school"
															placeholder="请输入您的学校名称" maxlength="100"
															class="input" value="${sessionScope.user.school}" >
														
													</div>
													<!---->
												</div>
											</div>
											<div class="form-item form-item-required">
												<div class="item-label">
													专业
												</div>
												<div class="item-content">
													<div class="input-wrap input-wrap-text">
														<input  type="text" name="zhuanye" id="zhuanye"
															placeholder="请输入您的专业" maxlength="100"
															class="input" value="${sessionScope.user.zhuanye}" >
														
													</div>
													<!---->
												</div>
											</div>
											
											
											
											<div class="form-item form-item-required">
												<div class="item-label">
													毕业时间
												</div>
												<div class="item-content">
													<div class="input-wrap input-wrap-text">
														<input  type="text" name="sdate" id="sdate"
															placeholder="请输入您的毕业时间" readonly="readonly"
															class="input" onClick="WdatePicker({dateFmt:'yyyy-MM'})"
																value="${sessionScope.user.sdate}" >
														
													</div>
													
												</div>
											</div>
											
											<div class="form-btns">
												<button type="button" id="rebackBtn" class="btn btn-outline">
													取消
												</button>
												<button type="submit" class="btn btn-primary">
													<!---->
													完成
												</button>
											</div>
										
									</div>
									<!---->
								</div>
								</form>
							</div>
						</div>
					</div>
					<div class="user-sider">
						<div data-v-40a7bab8="" class="sider-box sider-resume">
							<div data-v-40a7bab8="" class="resume-attachment">
								<h3 data-v-40a7bab8="" class="sider-title">
									附件管理
									<!---->
								</h3>
								<!---->
								<div class="btns">
									<button onclick="yulan()" type="button"
										class="btn btn-primary">
										在线预览
										<!---->
									</button>
									<!---->
								</div>
								
							</div>
						</div>
						<div class="sider-box zhipin-resume">
							<a> <img src="<%=path%>/web/images/u_tab.png" /> </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- container end -->
		<jsp:include page="../page/foot.jsp" />
	</body>
	<script type="text/javascript">
	function yulan(){
		window.location.href = '<%=path%>/web/user/user_info.jsp';
	}
	$(document).ready(function() {
		
	    $("#rebackBtn").click(function() {
	        window.location.href = '<%=path%>/web/user/user_info.jsp';
	    });
	    $("#addForm").validate({
	        submitHandler: function(form) { //验证通过后的执行方法
	            form.submit();
	        },
	        rules: {
	            
	            name: {
	                required: true,
	            },
	            sex: {
	                required: true,
	            },
	            tel: {
	                required: true,
	                telphone: true,
	            },
	            email: {
	                required: true,
	                email: true,
	            },
	            birthday: {
	                required: true,
	            },
	            photo: {
	                required: true,
	            },
	            xueli: {
	                required: true,
	            },
	            catelogid: {
	                required: true,
	            },
	            xinzi: {
	                required: true,
	            },
	            gzjy: {
	                required: true,
	            },
	            school: {
	                required: true,
	            },
	            zhuanye: {
	                required: true,
	            },
	            sdate: {
	                required: true,
	            },
	            zt: {
	                required: true,
	            },
	            youdian: {
	                required: true,
	            },
	        },
	        messages: {
	            
	            name: {
	                required: '姓名不能为空',
	            },
	            sex: {
	                required: '性别不能为空',
	            },
	            tel: {
	                required: '电话不能为空',
	                telphone: '电话格式错误',
	            },
	            email: {
	                required: '邮箱不能为空',
	                email: '邮箱格式错误',
	            },
	            birthday: {
	                required: '出生日期不能为空',
	            },
	            photo: {
	                required: '照片不能为空',
	            },
	            xueli: {
	                required: '学历不能为空',
	            },
	            catelogid: {
	                required: '期望职位不能为空',
	            },
	            xinzi: {
	                required: '薪资要求不能为空',
	            },
	            gzjy: {
	                required: '工作经验不能为空',
	            },
	            school: {
	                required: '毕业学校不能为空',
	            },
	            zhuanye: {
	                required: '专业不能为空',
	            },
	            sdate: {
	                required: '在校时间不能为空',
	            },
	            zt: {
	                required: '求职状态不能为空',
	            },
	            youdian: {
	                required: '个人优势不能为空',
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