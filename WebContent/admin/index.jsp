<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>网上求职招聘系统</title>
</head>
<body>
<body>
	<div id="topDiv"></div>
	<div id="cotentDiv" style="margin-top: 90px;"></div>
</body>
</html>
<script type="text/javascript">
      $(function(){
        $("#topDiv").load("<%=path%>/admin/top.jsp");
        $("#cotentDiv").load("<%=path%>/admin/left.jsp");
    });

</script>