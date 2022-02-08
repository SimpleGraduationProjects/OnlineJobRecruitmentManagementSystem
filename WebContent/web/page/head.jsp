<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script language=JavaScript>
	function logout() {
		if (confirm("您确定要退出 网上求职招聘平台吗？")) {
			top.location = "<%=path%>/user_loginout.action";
			return true;
		}
		return false;
	}
	
	
	
	
	function tiao(temp,id){
		var url='';
       	if(temp==1){
       		<c:if test="${sessionScope.user==null}">
       		url = "<%=path%>/web/login.jsp";
	        </c:if>
	        <c:if test="${sessionScope.user!=null}">
	        url = "<%=path%>/web/user/user_info.jsp";
	        </c:if>
	        window.location.href=url;
        }else{
        	<c:if test="${sessionScope.user==null}">
	        	alert("请先登录");
	        </c:if>
	        <c:if test="${sessionScope.user!=null}">
	        	var url='';
	           	if(temp==2){
	           		url = "<%=path%>/test_list_web.action";
	           	}else if(temp==3){
	           		<c:if test="${sessionScope.user.state==0}">
		        	alert("请先完善你的简历");
		        	return;
			        </c:if>
	           		url = "<%=path%>/comment_list_web.action";
		        }
		 		window.location.href=url;
	         </c:if>

       	}	
	
	}
</script>

<script src="<%=path%>/web/js/main.js"></script>




<div id="header">
	<div class="home-inner">
		<div class="logo">
			<a href="<%=path%>/index.action" >
			</a>
		</div>
		<div class="nav">
			<ul>
				<li <c:if test="${top_index==1}">class="cur"</c:if> >
					<a href="<%=path%>/index.action">首页</a>
				</li>
				<li <c:if test="${top_index==2}">class="cur"</c:if>>
					<a href="<%=path%>/job_list_web.action">职位</a>
				</li>
				<li <c:if test="${top_index==3}">class="cur"</c:if>>
					<a onclick="tiao(2)" >在线答题</a>
				</li>

				<li <c:if test="${top_index==4}">class="cur"</c:if>>
					<a href="<%=path%>/gonggao_list_web.action">资讯</a>
				</li>
				<!--
				<li <c:if test="${top_index==5}">class="cur"</c:if>>
					<a class="nav-find" 
						href="<%=path%>/company_toView.action">企业概况</a>
				</li>
				-->
				<li <c:if test="${top_index==6}">class="cur"</c:if>>
					<a onclick="tiao(3)" >面试评价</a>
				</li>
			</ul>
		</div>
		<div class="user-nav">
			<!--未登录-->
			<c:if test="${sessionScope.user.name==null}">
			<div class="btns">
				
				<a href="<%=path%>/web/regiset.jsp" ka="header-register"
					class="btn btn-outline">注册</a>
				<a href="<%=path%>/web/login.jsp" ka="header-login"
					class="btn btn-outline">登录</a>
			</div>
			</c:if>
			<c:if test="${sessionScope.user.name!=null}">
			<ul >
				 <li class=""><a ka="header-resume" href="<%=path%>/web/user/user_info.jsp">我的简历</a></li>
                 <li class="nav-figure">
                    <a  >
                        <span class="label-text">${sessionScope.user.name}</span>
                        <img <c:if test="${sessionScope.user.photo==null||sessionScope.user.photo==''}">src="<%=path%>/web/images/default_user.png"</c:if> 
							<c:if test="${sessionScope.user.photo!=null||sessionScope.user.photo!=''}">src="<%=path%>/${sessionScope.user.photo}"</c:if> alt="" />
                    </a>
                    <div class="dropdown" style="display: none;">
                        <a href="<%=path%>/user_toUpdate_web.action" >制作简历<span>编辑在线简历</span></a>
                        <a href="<%=path%>/web/user/user_upwd.jsp" >账号设置<span>修改密码</span></a>
                        
                        <a href="<%=path%>/my_offers.action" class="link-mall">offer通知</a>
                        
                        <a onclick="logout();" class="link-logout" >退出登录</a>
                       
                    </div>
                </li>
            </ul>
            </c:if>
		</div>
	</div>
	
</div>

