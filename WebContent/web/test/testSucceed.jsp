<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"  %> 
<%
	 String path = request.getContextPath();
%>


<!DOCTYPE html>

<html>
	<head>

		<title>教师在线培训系统平台</title>
		<meta name="keywords" content="">
		<meta name="description" content="">

		<link rel="stylesheet" href="<%=path %>/web/css1/index.css">
		<link rel="stylesheet" href="<%=path %>/web/css1/index1.css">
		<link rel="stylesheet" href="<%=path %>/web/css1/common_sync0_libs_4d81287.css">
		<link rel="stylesheet" href="<%=path %>/web/css1/common_sync1_libs_769abc5.css">
		


		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/home.css" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		
		

		<script language="javascript">
           
          
          function fanhui(){
          		var url="<%=path%>/index.action"; 	
           	 	window.location.href=url
          }
          
          
       </script>
		
		<style>
			.btn-shoucang {
				padding: 5px 10px;
			    font-size: 14px;
			    line-height: 1.5;
			    display: inline-block;
			    background-color: #18a689;
			    border-color: #18a689;
			    color: #FFF;
			    margin-bottom: 0;
			    
			    font-weight: 400;
			    text-align: center;
			    white-space: nowrap;
			    vertical-align: middle;
			    -ms-touch-action: manipulation;
			    touch-action: manipulation;
			    cursor: pointer;
			    -webkit-user-select: none;
			    -moz-user-select: none;
			    -ms-user-select: none;
			    user-select: none;
			    background-image: none;
			    border: 1px solid transparent;
			    border-radius: 3px;
			}
			.num{
				margin: 0 5px;
    			font-weight: 600;
			}
			.luse{
				color:#35b558;
			}
			.red{
				color:#b53535;
			}
			
			.index-h2 {
			    font-size: 30px;
			    margin-top: 5px;
			    font-weight: bold;
			    margin-bottom: 22px;
			    display: inline-block;
			    color: #35b558;
			}
		</style>
		
	</head>
	<body>

		<div id="wrap">
			<jsp:include page="../page/head.jsp" />
			<div class="inner" style="margin: 10px auto;border-radius: 4px;">
		

				<div class="wrap w-1000" style="min-height: 600px;">
					<div style="height: 400px; background-color: #fff;margin: 20px 0;border-radius: 2px;text-align: center;">
						<h2 style="width: 100%;padding: 41px 0 0 0;text-align: center;">
							<div  class="index-h2" >
							提交成功
							</div>
						</h2>
						<div style="margin: 5px;font-size:18px">本试题<label class="num">${score.zongshu}</label>道，总分(<label class="num">${score.zongfen}</label>)，做对<label class="num luse">${score.num}</label>道，得分(<label class="num red">${score.defen}</label>)</div>
						<div style="color: #8e8a8a;"> 
							<span>选题答案：${score.mydaan}</span>
							<span>正确答案：${score.okdaan}</span>
							<button  class="btn-shoucang" onclick="fanhui()">返回首页
		                    </button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../page/foot.jsp" />
	</body>
</html>