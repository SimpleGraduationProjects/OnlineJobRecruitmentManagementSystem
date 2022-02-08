<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<style type="text/css">
a:link {
	text-decoration: none;
}
</style>
<body>

	<nav class="pull-right">
	<ul class="pagination pagination-self">
		<pg:first export="pageUrl">
			<c:if test="${pageUrl!=null }">
				<li>
					<a href="${pageUrl}" aria-label="上一页">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			<c:if test="${pageUrl==null }">
				<li class="disabled">
					<a href="#">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
		</pg:first>




		<pg:pages>
			<c:choose>
				<c:when test="${currentPageNumber eq pageNumber }">
					<li class="active">
						<a href="#">${pageNumber }</a>
					</li>
				</c:when>
				
				<c:otherwise>

					<li>
						<a href="${pageUrl }">${pageNumber }</a>
					</li>

				</c:otherwise>
			</c:choose>
		</pg:pages>


		<pg:last export="pageUrl">

			<c:if test="${pageUrl!=null }">
				<li>
					<a href="${pageUrl}" aria-label="下一页">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>

		</pg:last>




	</ul>
	</nav>


</body>
</html>
