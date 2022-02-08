<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
%>


<!-- saved from url=(0030)https://xa.lianjia.com/zufang/ -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-language" content="zh-CN">

		<title>网上求职招聘</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />
		
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/job_v.css" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>

		<script language=JavaScript>
			function toToudi(jobid){
				<c:if test="${sessionScope.user==null}">
	       		var url = "<%=path%>/web/login.jsp";
	       		window.location.href=url;
		        </c:if>
				
				
		        <c:if test="${sessionScope.user!=null}">
			        <c:if test="${sessionScope.user.state==0}">
		        	alert("请先完善你的简历");
		        	return;
			        </c:if>
			        <c:if test="${sessionScope.user.state==1}">
		        	var url = "<%=path%>/offer_add.action?jobid="+jobid;
			 		window.location.href=url;
			 		</c:if>
		         </c:if>
			} 
		</script>


	</head>
	<body class="page-white">
		<div id="wrap">
		<jsp:include page="../page/head.jsp" />
		<div d="main">
			<div class="job-banner">
				<div class="inner home-inner" >
					<div class="job-primary detail-box" >
						<div class="info-primary">
	                        <div class="job-status"><span>招聘中</span></div>
	                        <div class="name">
	                            <h1>${job.name}</h1>
	                            <span class="salary">${job.minsalary}-${job.maxsalary}元</span>
	                        </div>
	                            <p><a class="text-city" href="/xian/">${job.quyu}</a><em class="dolt"></em>${job.jingyan}<em class="dolt"></em>${job.xueli}</p>
	                            <div class="tag-container">
	                                
	                                <div class="job-tags">
	                                    <c:forEach items="${job.fuliArray}" var="tag" varStatus="var">	
											<span>${tag}</span>
										</c:forEach>
	                                </div>
	                            </div>
	                    </div>
	                    <div class="job-op">
	                    	<c:if test="${is_offer!=1}">
	                    	<div class="btn-container">
                            	<!-- 未登录 -->	
	                     		<a class="btn btn-startchat" onclick="toToudi(${job.id})" >投递简历</a>
	                        </div>
	                        </c:if>
	                    </div>
	                 </div>  
	            </div> 
	    	</div> 
			<div class="job-box" >
				<div class="inner home-inner">
					<div class="job-sider">
						<div class="promotion-img">
	                        <a ><img src="<%=path%>/web/images/pro-1.png" ></a>
	                    </div>
					
					</div>
					<div class="job-detail">
						<div class="detail-content">
							<div class="job-sec">
	                            <h3>职位描述</h3>
	                            <div class="text">
	                                ${job.miaoshu}
	                            </div>
	                        </div>
						</div>
						<div class="detail-content">
							<div class="job-sec">
	                            <h3>工作地址</h3>
	                            <div class="text">
	                                ${job.address}
	                            </div>
	                        </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../page/foot.jsp" />
	</body>
</html>