<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=path%>/css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/left.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path%>/js/jquery-3.4.1.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-pdm.js"></script>
<title>菜单栏</title>
</head>
<body>


	<!--main-->
	<div class="container-fluid mybody">
		<div class="main-wapper">
			<!--菜单-->
			<div id="siderbar" class="siderbar-wapper">

				<div class="panel-group menu" id="accordion" role="tablist" aria-multiselectable="true">
                  	<!-- 管理员菜单 -->
                  	
                  	<c:if test="${sessionScope.utype==0}">
					<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<span class="glyphicon glyphicon-folder-open"></span>
									系统管理
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="list-group list-group-self">
								<a href="<%=path%>/tadmin_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									管理员管理
								</a>
                                <a href="<%=path%>/admin/tadmin/tadmin_upwd.jsp" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									修改密码
								</a>
							</div>
						</div>
					</div>
					
					<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="heading1">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
									<span class="glyphicon glyphicon-th"></span>
									人信息管理
								</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1">
							<div class="list-group list-group-self">
								<a href="<%=path%>/boss_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									招聘人员信息
								</a>
								
							</div>
							<div class="list-group list-group-self">
								
								<a href="<%=path%>/user_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									应聘人员信息
								</a>
							</div>
							
						</div>
					</div>
					
					<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="heading3">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" aria-controls="collapse3">
									<span class="glyphicon glyphicon-th"></span>
									职位管理
								</a>
							</h4>
						</div>
						<div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
							<div class="list-group list-group-self">
							    <a href="<%=path%>/catelog_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									职位类型
								</a>
							</div>
							<div class="list-group list-group-self">
							    <a href="<%=path%>/job_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									招聘信息
								</a>
							</div>
							
						</div>
					</div>
					
					<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="heading4">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" aria-controls="collapse4">
									<span class="glyphicon glyphicon-th"></span>
									练习题管理
								</a>
							</h4>
						</div>
						<div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
							<div class="list-group list-group-self">
							    <a href="<%=path%>/test_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									习题管理
								</a>
							</div>
						
							
						</div>
					</div>
					
					<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="heading5">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="false" aria-controls="collapse5">
									<span class="glyphicon glyphicon-th"></span>
									咨询管理
								</a>
							</h4>
						</div>
						<div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
							<div class="list-group list-group-self">
							    <a href="<%=path%>/gonggao_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									咨询信息
								</a>
							</div>
						</div>
					</div>
					</c:if>
					
					<c:if test="${sessionScope.utype==1}">
					<!-- 招聘员工菜单 -->
					<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<span class="glyphicon glyphicon-folder-open"></span>
									个人中心
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="list-group list-group-self">
								<a href="<%=path%>/admin/boss/boss_info.jsp" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									个人信息
								</a>
                                <a href="<%=path%>/admin/boss/boss_upwd.jsp" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									修改密码
								</a>
							</div>
						</div>
					</div>
					
					
					
					
					
					
					
					
					<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="heading3">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" aria-controls="collapse3">
									<span class="glyphicon glyphicon-th"></span>
									职位管理
								</a>
							</h4>
						</div>
						<div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
							<div class="list-group list-group-self">
							    <a href="<%=path%>/catelog_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									职位类型
								</a>
							</div>
							<div class="list-group list-group-self">
							    <a href="<%=path%>/job_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									招聘信息
								</a>
							</div>
							
						</div>
					</div>
					
					
					
					
					<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="heading4">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" aria-controls="collapse4">
									<span class="glyphicon glyphicon-th"></span>
									简历管理
								</a>
							</h4>
						</div>
						<div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
							<div class="list-group list-group-self">
							    <a href="<%=path%>/offer_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									查看投递简历
								</a>
							</div>
							<div class="list-group list-group-self">
							    <a href="<%=path%>/fav_list.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									收藏简历
								</a>
							</div>
							
						</div>
					</div>
					</c:if>
					
					
					<!--<div class="panel panel-inner">
						<div class="panel-heading panel-heading-self" role="tab" id="heading6">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="false" aria-controls="collapse6">
									<span class="glyphicon glyphicon-th"></span>
									企业管理
								</a>
							</h4>
						</div>
						<div id="collapse6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading6">
							<div class="list-group list-group-self">
							    <a href="<%=path%>/company_toInfo.action" target="appiframe" class="list-group-item">
									<span class="glyphicon glyphicon-menu-right"></span>
									企业介绍
								</a>
							</div>
						
						</div>
					</div>
						-->
				
				
				
				</div>

			</div>
			<!--菜单-->
			<!--内容-->
			<div id="content" class="main-content">
			    <c:if test="${sessionScope.utype==0}">
				<iframe src="<%=path%>/tadmin_list.action" style="width: 100%; height: 100%;" id="appiframe" name="appiframe" frameborder="0"></iframe>
				</c:if>
				<c:if test="${sessionScope.utype==1}">
				<iframe src="<%=path%>/admin/boss/boss_info.jsp" style="width: 100%; height: 100%;" id="appiframe" name="appiframe" frameborder="0"></iframe>
				</c:if>
			</div>
			<!--内容-->
		</div>

	</div>

	<!--main-->

</body>
</html>