<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<% String path = request.getContextPath(); %>
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
			<form action="<%=path%>/job_list.action" class="form-inline"
				method="post">
				<div class="panel panel-default">
					<div class="panel-heading">
						招聘列表
					</div>
					<div class="panel-body">
						<div class="pull-left">
							
							<label>
								职位：
							</label>
							<select id="catelogid" name="catelogid" class="form-control">
								<option value="0">
									全部
								</option>
								<c:forEach items="${catelogList}" var="info">
									<option <c:if test="${catelogid==info.id}">selected</c:if>
										value="${info.id}">
										${info.name}
									</option>
								</c:forEach>
							</select>
							<div class="form-group qinfo">
								<label>
									标题：
								</label>
								<input name="name" value="${name}" class="form-control">
							</div>
							
							<div class="form-group qinfo">
								<label>
									工作区域：
								</label>
								<input name="quyu" value="${quyu}" class="form-control">
							</div>
							<div class="form-group qinfo">
								<label>
									要求学历：
								</label>
								<select id="xueli" name="xueli" class="form-control">
									<option value="">
										全部
									</option>
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
							<button type="submit" class="btn btn-default">
								查询
							</button>
						</div>
					</div>
					<pg:pager url="job_list.action" items="${itemSize}"
						maxPageItems="${pageItem}" maxIndexPages="${pageItem}"
						isOffset="${true}" export="offset,currentPageNumber=pageNumber"
						scope="request">
						
						<pg:param name="catelogid" value="${catelogid}" />
						<pg:param name="name" value="${name}" />
						<pg:param name="quyu" value="${quyu}" />
						<pg:param name="xueli" value="${xueli}" />
						<div class="table-responsive">
							<table class="table table-striped table-hover"
								style="text-align: center;">
								<thead>
									<tr>
										<td>
											标题
										</td>
										<td>
											职位
										</td>
										
										<td>
											薪资
										</td>
										
										<td>
											工作区域
										</td>
										<td>
											要求学历
										</td>
										<td>
											工作经验
										</td>
										
										<td>
											发布时间
										</td>
										
										<th width="120px">
											操作
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="info">
										<tr>
											<td>
												<a style="color: #000000"
													href="<%=path%>/job_toView.action?id=${info.id}">${info.name}</a>
											</td>
											<td>
												${info.catelogVO.name}
											</td>
											
											<td>
												${info.minsalary}-${info.maxsalary}
											</td>
										
											<td>
												${info.quyu}
											</td>
											<td>
												${info.xueli}
											</td>
											<td>
												${info.jingyan}
											</td>
											
											<td>
												${info.cdate}
											</td>
											
											<td>
												<c:if test="${sessionScope.utype==1}">
												<a href="<%=path%>/job_toUpdate.action?id=${info.id}"
													class="btn btn-info btn-xs"><span
													class="glyphicon glyphicon-edit"></span>编辑</a>
												</c:if>	
												<a href="javascript:void();"
													onclick="delInfo('${info.id}');"
													class="btn btn-danger btn-xs"><span
													class="glyphicon glyphicon-trash"></span>删除</a>
												<!--a href="#" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-eye-open"></span> 查看</a-->
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="panel-footer clearfix">
								<c:if test="${sessionScope.utype==1}">
								<div class="pull-left">
									<button type="button" id="addBtn" class="btn btn-info">
										新增
									</button>
								</div>
								</c:if>
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
        window.location.href = '<%=path%>/job_toAdd.action';
   });
});
function delInfo(id){
	 if(confirm("是否确认删除？")){
	 window.location.href = '<%=path%>/job_delete.action?id=' + id;
    }
}
</script>