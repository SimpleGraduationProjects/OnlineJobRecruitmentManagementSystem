<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0028)https://www.jikexueyuan.com/ -->
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>网上求职招聘</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />

		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/home.css" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="../page/head.jsp" />

			<div id="main">
				<div class="list-banner-paper">
		            <div class="inner">
		                <div class="text">
		                    <h1>在线面试题练习</h1>
		                    
		                </div>
		            </div>
		        </div>
				
				


				<div class="inner" style="margin: 10px auto;border-radius: 4px;">
					<div class="inner-center clearfix" style="background-color: #fff;padding: 10px 20px;">
						<div class="content tabs mod-sub">
							<div class="container-1200">
								<div class="series-test-hd" style="padding:20px 0">
									<h2 style="font-size: 24px;text-align: center;"> 在线练习</h2>
								</div>
							</div>
							<div class="sm-cont sm-main-inner ">
							
								<div class="mod-comments" id="js-comments" style="visibility: visible;">
									<form  method="post" action="<%=path%>/okTest.action" name="formAdd"  >	
									
									<div class="section-comment-list grid-data">
										<div class="comment-list grid-row-2">
											<c:forEach items="${list}" var="test" varStatus="status">
											<div class="comment-item">
											
												<div class="item-right">
													
													<div class="comment-bd">${status.index + 1}. ${test.content }（${test.score }分）</div>
													<div class="xx">
														<span class="comment-time">A. <input type="radio" value="A"    name="TM#${test.id}"   /> ${test.option1}</span>
													</div>
													<div class="xx">
														<span class="comment-time">B. <input type="radio" value="B"    name="TM#${test.id}"   /> ${test.option2}</span>
													</div>
													<div class="xx">	
														<span class="comment-time">C. <input type="radio" value="C"    name="TM#${test.id}"    /> ${test.option3}</span>
													</div>
													<div class="xx">
														<span class="comment-time">D. <input type="radio" value="D"    name="TM#${test.id}"    /> ${test.option4}</span>
												
													</div>
												</div>
											</div>
											</c:forEach>
										</div>
									</div>
								
									
									<div style="width:100%; text-align: center;margin: 10px auto;">
										<button type="submit" style="" class="btn"> 提           交 </button>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
						<style>
							.item-right{
								margin: 10px;
							}
							.comment-bd{
								margin: 15px 0;
							}
							.xx{
								margin: 5px 0;
							}
							    
						</style>
					</div>


				</div>



			</div>
			
		</div>
		<jsp:include page="../page/foot.jsp" />
	</body>
</html>