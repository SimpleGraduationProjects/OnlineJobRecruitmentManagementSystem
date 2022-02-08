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
			<form action="<%=path%>/user_list.action" class="form-inline"
				method="post">
				<div class="panel panel-default">
					<div class="panel-heading">
						应聘人员列表
					</div>
					<div class="panel-body">
						<div class="pull-left">
							
							<div class="form-group qinfo">
								<label>
									姓名：
								</label>
								<input name="name" value="${name}" class="form-control">
							</div>
							<label>
								学历：
							</label>
							<select id="xueli" name="xueli" class="form-control">
								<option value="">
									全部
								</option>
								<option <c:if test="${xueli=='初中及以下'}">selected</c:if>
									value="初中及以下">
									初中及以下
								</option>
								<option <c:if test="${xueli=='高中'}">selected</c:if> value="高中">
									高中
								</option>
								<option <c:if test="${xueli=='大专'}">selected</c:if> value="大专">
									大专
								</option>
								<option <c:if test="${xueli=='本科'}">selected</c:if> value="本科">
									本科
								</option>
								<option <c:if test="${xueli=='硕士'}">selected</c:if> value="硕士">
									硕士
								</option>
								<option <c:if test="${xueli=='博士'}">selected</c:if> value="博士">
									博士
								</option>
							</select>
							<label>
								期望职位：
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
							<label>
								求职状态：
							</label>
							<select id="zt" name="zt" class="form-control">
								<option value="">
									全部
								</option>
								<option <c:if test="${zt=='离职-随时到岗'}">selected</c:if>
									value="离职-随时到岗">
									离职-随时到岗
								</option>
								<option <c:if test="${zt=='在职-暂不考虑'}">selected</c:if>
									value="在职-暂不考虑">
									在职-暂不考虑
								</option>
								<option <c:if test="${zt=='在职-考虑机会'}">selected</c:if>
									value="在职-考虑机会">
									在职-考虑机会
								</option>
								<option <c:if test="${zt=='在职-月内到岗'}">selected</c:if>
									value="在职-月内到岗">
									在职-月内到岗
								</option>
							</select>
							<button type="submit" class="btn btn-default">
								查询
							</button>
						</div>
					</div>
					<pg:pager url="user_list.action" items="${itemSize}"
						maxPageItems="${pageItem}" maxIndexPages="${pageItem}"
						isOffset="${true}" export="offset,currentPageNumber=pageNumber"
						scope="request">
						<pg:param name="uname" value="${uname}" />
						<pg:param name="upwd" value="${upwd}" />
						<pg:param name="name" value="${name}" />
						<pg:param name="xueli" value="${xueli}" />
						<pg:param name="catelogid" value="${catelogid}" />
						<pg:param name="zt" value="${zt}" />
						<div class="table-responsive">
							<table class="table table-striped table-hover"
								style="text-align: center;">
								<thead>
									<tr>
										<td>
											用户名
										</td>
										<td>
											密码
										</td>
										<td>
											姓名
										</td>
										<td>
											性别
										</td>
										<td>
											联系电话
										</td>
										<td>
											邮箱
										</td>
										<td>
											出生日期
										</td>
										<td>
											照片
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
											在校时间
										</td>
										<td>
											求职状态
										</td>
										<td>
											个人优势
										</td>
										<th width="12%">
											操作
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="info">
										<tr>
											<td>
												<a style="color: #000000"
													href="<%=path%>/user_toView.action?id=${info.id}">${info.uname}</a>
											</td>
											<td>
												${info.upwd}
											</td>
											<td>
												${info.name}
											</td>
											<td>
												${info.sex}
											</td>
											<td>
												${info.tel}
											</td>
											<td>
												${info.email}
											</td>
											<td>
												${info.birthday}
											</td>
											<td>
												${info.photo}
											</td>
											<td>
												${info.xueli}
											</td>
											<td>
												${info.catelogVO.name}
											</td>
											<td>
												${info.xinzi}
											</td>
											<td>
												${info.gzjy}
											</td>
											<td>
												${info.school}
											</td>
											<td>
												${info.zhuanye}
											</td>
											<td>
												${info.sdate}
											</td>
											<td>
												${info.zt}
											</td>
											<td>
												${info.youdian}
											</td>
											<td>
												<a href="<%=path%>/user_toUpdate.action?id=${info.id}"
													class="btn btn-info btn-xs"><span
													class="glyphicon glyphicon-edit"></span>编辑</a>
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
								<div class="pull-left">
									<button type="button" id="addBtn" class="btn btn-info">
										新增
									</button>
								</div>
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
        window.location.href = '<%=path%>/user_toAdd.action';
   });
});
function delInfo(id){
	 if(confirm("是否确认删除？")){
	 window.location.href = '<%=path%>/user_delete.action?id=' + id;
    }
}
</script>