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
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		
		
	</head>
	<body class="home-body city-site">
		<div id="wrap">
			<!-- header begin -->
			<jsp:include page="page/head.jsp" />
			<!-- header end -->
			<div class="fast-register-box top-sign-box">
				<div class="inner home-inner">
					<img
						src="<%=path%>/web/images/fast-reg.png"
						class="icon-tip"/>
					<div class="step-form">
                        <img src="<%=path%>/web/images/fast-reg-text.png">
                        <a href="<%=path%>/user_toUpdate_web.action" class="btn btn-dialog-upload btn-to-upload" >制作你的简历</a>
                	</div>
				</div>
			</div>
			<div class="column-search-panel">
				<div class="inner home-inner">
					<div class="search-box">
						<div class="search-form ">
							<form action="<%=path%>/job_list_web.action" method="post" class="">

								<div class="search-form-con">
									<p class="ipt-wrap">
										<input type="text" name="name" class="ipt-search"
											maxlength="50" autocomplete="off" placeholder="搜索职位" />
									</p>
								</div>

								<button class="btn btn-search" type="submit">
									搜索
								</button>

							</form>
						</div>
						<div class="search-hot">
							<b>热门职位:</b>
							<a href="<%=path%>/job_list_web.action?catelogid=14"><b>JAVA开发</b></a>
							<a href="<%=path%>/job_list_web.action?catelogid=13">UI设计师</a>

						</div>
					</div>
				</div>
			</div>
			<div id="main" class="inner home-inner">
				<div class="home-box">
					<div class="home-sider">
						<!-- 左侧职位选择 -->
						<div class="job-menu menu-sub">
							<div class="show-all" style="display: block;border-bottom: dashed 1px #ecedef; border-top: 0;
    												margin-top: -10px; padding-left: 0;margin-bottom: 10px;" >
								全部职位
							</div>
							<ul class="text">
								<c:forEach items="${sessionScope.catelogList}" var="info" varStatus="var">	
								<li>
									<a href="<%=path%>/job_list_web.action?catelogid=${info.id}">${info.name}</a>
								</li>
								</c:forEach>
								

							</ul>
							<%--<div class="show-all" style="display: block;" onmouseover="">
								显示全部职位
							</div>
						--%></div>

					</div>
					<div class="home-main">
						<div class="slider-box">
							<div class="promotion-main">
								<table data-sort="sortDisabled">
									<tbody>
										<tr class="firstRow">
											<td valign="top" rowspan="2" colspan="2"
												style="word-break: break-all;">
												<a>
													<img src="<%=path%>/web/images/tab1.jpg"/>
												</a>
											</td>
											<td width="307" valign="top" rowspan="2" colspan="1"
												style="word-break: break-all;">
												<a style="white-space: normal;">
													<img src="<%=path%>/web/images/tab2.jpg"/>
												</a>
											</td>
										</tr>
										<tr></tr>
										<tr>
											<td valign="top" rowspan="1" colspan="2"
												style="word-break: break-all;">
												<a style="white-space: normal;">
													<img src="<%=path%>/web/images/tab3.jpg"/>
												</a>
											</td>
											<td width="307" valign="top" style="word-break: break-all;">
												<a style="white-space: normal;">
													<img src="<%=path%>/web/images/tab4.jpg"/>
												</a>
											</td>
										</tr>
									</tbody>
								</table>
								
							</div>
						</div>
					</div>
					<div class="common-tab-box merge-city-job" >
						<div class="box-title">热招职位</div>
						<ul class="cur">
							<c:forEach items="${list}" var="job" varStatus="status">
							<li>
                                <div class="sub-li">
                                    <a href="<%=path%>/job_toView_web.action?id=${job.id}" class="job-info"  >
                                        <div class="sub-li-top">
                                            <p class="name">${job.name}</p>
                                           
                                            <p class="salary">${job.minsalary}-${job.maxsalary}</p>
                                        </div>
                                        <p class="job-text">${job.quyu}<span class="vline"></span>${job.jingyan}<span class="vline"></span>${job.xueli}</p>
                                    </a>
                                    <div class="sub-li-bottom">
                                        
                                        <a  class="sub-li-bottom-commany-info" >
                                            <span class="type">${job.fuli}</span>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
						</ul>
						<p class="common-tab-more">
							<a class="btn btn-outline" href="<%=path%>/job_list_web.action">查看更多</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="page/foot.jsp" />
	</body>
</html>