<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=path%>/css/bootstrap/css/bootstrap.css"
			rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/left.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet"
			type="text/css">
		<script type="text/javascript" src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<script language="javascript" type="text/javascript"
			src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
		<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery-pdm.js"></script>
		<title>菜单栏</title>
	</head>
	<body>
		<div class="page-content">
			<form action="<%=path%>/offer_list.action" class="form-inline"
				method="post">
				<div class="panel panel-default">
					<div class="panel-heading">
						投递简历列表
					</div>
					<div class="panel-body">
						<div class="pull-left">
							
							<div class="form-group qinfo">
								<label>
									状态：
								</label>
								<select id="zt" name="zt" class="form-control">
									<option value="">
										全部
									</option>
									<option <c:if test="${zt=='已投递'}">selected</c:if>
											value="已投递">已投递</option>
									<option <c:if test="${zt=='通过'}">selected</c:if>
											value="通过">通过</option>
									<option <c:if test="${zt=='面试'}">selected</c:if>
											value="面试">面试</option>
									<option <c:if test="${zt=='不符合'}">selected</c:if>
											value="不符合">不符合</option>
									<option <c:if test="${zt=='不通过'}">selected</c:if>
											value="不通过">不通过</option>
								</select>
								
							</div>
							
							<button type="submit" class="btn btn-default">
								查询
							</button>
						</div>
					</div>
					<pg:pager url="offer_list.action" items="${itemSize}"
						maxPageItems="${pageItem}" maxIndexPages="${pageItem}"
						isOffset="${true}" export="offset,currentPageNumber=pageNumber"
						scope="request">
						<pg:param name="uid" value="${uid}" />
						<pg:param name="bid" value="${bid}" />
						<pg:param name="zt" value="${zt}" />
						<pg:param name="jieguo" value="${jieguo}" />
						<div class="table-responsive">
							<table class="table table-striped table-hover"
								style="text-align: center;">
								<thead>
									<tr>
										
										<td>
											简历用户
										</td>
										<td>
											查看简历
										</td>
										<td>
											招聘信息
										</td>
										<td>
											岗位
										</td>
										<td>
											状态
										</td>
										<td>
											投递时间
										</td>
										
										<th width="160px">
											操作
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="info">
										<tr>
											<td>
												<a href="<%=path%>/offer_toView.action?id=${info.id}">${info.userVO.name}</a>
												
											</td>
											<td>
												<a target="_blank" href="<%=path%>/jianli_toView.action?id=${info.uid}">简历</a>
											</td>
											<td>
												${info.jobVO.name}
											</td>
											<td>
												${info.jobVO.catelogVO.name}
											</td>
											<td>
												${info.zt}
											</td>
											<td>
												${info.cdate}
											</td>
											<td>
												<c:if test="${info.zt=='已投递'}">
												<a href="<%=path%>/offer_toUpdate.action?id=${info.id}"
													class="btn btn-info btn-xs">筛选</a>
												</c:if>	
												
												<c:if test="${info.zt=='面试'}">
												<a href="<%=path%>/offer_tojieguo.action?id=${info.id}"
													class="btn btn-info btn-xs">面试结果</a>
												</c:if>
												
												<c:if test="${info.fav=='否'}">
												<a href="<%=path%>/fav_add.action?uid=${info.uid}"
													class="btn btn-info btn-xs">收藏简历</a>
												</c:if>
												
													
												
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="panel-footer clearfix">
								
								<nav class="pull-right">
								<pg:index>
									<jsp:include page="/common/pagination_tag.jsp" flush="true" />
								</pg:index>
								</nav>
							</div>
						</div>
					</pg:pager>
				</div>
			</form>
		</div>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
   $("#addBtn").click(function(){
        window.location.href = '<%=path%>/offer_toAdd.action';
   });
});
function delInfo(id){
	 if(confirm("是否确认删除？")){
	 window.location.href = '<%=path%>
	_176$26_/offer_delete.action?id=' + id;
</script>