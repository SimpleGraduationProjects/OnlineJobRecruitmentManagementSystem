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
			<form action="<%=path%>/fav_list.action" class="form-inline"
				method="post">
				<div class="panel panel-default">
					<div class="panel-heading">
						收藏列表
					</div>
					
					<pg:pager url="fav_list.action" items="${itemSize}"
						maxPageItems="${pageItem}" maxIndexPages="${pageItem}"
						isOffset="${true}" export="offset,currentPageNumber=pageNumber"
						scope="request">
						<pg:param name="bid" value="${bid}" />
						<pg:param name="uid" value="${uid}" />
						<div class="table-responsive">
							<table class="table table-striped table-hover"
								style="text-align: center;">
								<thead>
									<tr>
										<td>
											简历姓名
										</td>
										<td>
											性别
										</td>
										<td>
											联系电话
										</td>
										<td>
											学历
										</td>
										<td>
											期望职位
										</td>
										<td>
											薪资要求
										</td>
										<td>
											工作经验
										</td>
										<td>
											毕业学校
										</td>
										<td>
											专业
										</td>
										<td>
											求职状态
										</td>
										
										<td>
											收藏时间
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
												${info.userVO.name}
											</td>
											<td>
												${info.userVO.sex}
											</td>
											<td>
												${info.userVO.tel}
											</td>
											
											<td>
												${info.userVO.xueli}
											</td>
											<td>
												${info.userVO.catelogVO.name}
											</td>
											<td>
												${info.userVO.xinzi}
											</td>
											<td>
												${info.userVO.gzjy}
											</td>
											<td>
												${info.userVO.school}
											</td>
											<td>
												${info.userVO.zhuanye}
											</td>
											
											<td>
												${info.userVO.zt}
											</td>
											<td>
												${info.cdate}
											</td>
											<td>
												<a target="_blank" href="<%=path%>/jianli_toView.action?id=${info.uid}"
													class="btn btn-info btn-xs">查看简历</a>
													
												<a href="javascript:void();"
													onclick="delInfo('${info.id}');"
													class="btn btn-danger btn-xs"><span
													class="glyphicon glyphicon-trash"></span>取消收藏</a>
												<!--a href="#" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-eye-open"></span> 查看</a-->
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
        window.location.href = '<%=path%>/fav_toAdd.action';
   });
});
function delInfo(id){
	 if(confirm("是否确认删除？")){
	 window.location.href = '<%=path%>/fav_delete.action?id=' + id;
    }
}
</script>