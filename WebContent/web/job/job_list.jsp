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

		<title>企业招聘</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon" rel="shortcut icon" />
		
		<link rel="stylesheet" href="<%=path%>/web/css1/common.css" />
		<link rel="stylesheet" href="<%=path%>/web/css1/common1.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/web/css1/index.css">
		<link property="stylesheet" rel="stylesheet" href="<%=path%>/web/css1/lianjiaim.css" />
		
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<style type="text/css">
			.sold{
				background: url(./images/sprite_user.png) no-repeat -54px -64px;
			    width: 59px;
			    height: 59px;
			    position: absolute;
			    top: 0;
			    right: 0;
			    display: inline-block;
			
			}
		</style>
		
		<script language=JavaScript>
			function serlist(servalue,temp){
				
				if(temp==1){
					document.getElementById("catelogid").value = servalue;
				}else if(temp==2){
					document.getElementById("xinzIndex").value = servalue;
				}else if(temp==4){
					document.getElementById("xueli").value = servalue;
				}
	        	  
	        	   
				document.formAdd.submit();
			}
			function ser(){
				document.formAdd.submit();
			}
		</script>	
	</head>
	<body>
		<jsp:include page="../page/head.jsp" />
		<form action="<%=path%>/job_list_web.action" name="formAdd" method="post">
		
		<input type="hidden" id="catelogid" name="catelogid" value="${catelogid}" />
		<input type="hidden" id="xinzIndex" name="xinzIndex" value="${zjindex}" />
		<input type="hidden" id="xueli" name="xueli" value="${xueli}" />	
		<div class="search__area">
			<div style="width: 1000px; margin: 0 auto;">
				<a>首页 </a> &gt;
				<a>招聘列表</a>
			</div>
			<div class="search w1150" id="search">
				
				<div class="search__wrap" style="position: relative;">
					<input class="search__input fl" type="text" name="name"
						placeholder="请输入招聘岗位" value="${name}" >
					
					<button class="btn btn-search fl" style="font-size:14px" type="">
						搜索
					</button>
				</div>
	
			</div>
		</div>
		</form>
	

	<div class="filter">
		<div class="filter__wrapper w1150" id="filter">


			<ul data-target="station">
			</ul>

			<ul class="filter__ul" data-el="rentType">
				<li class="filter__item--level4 filter__item--aside">
					<a href="javascript:;">职位</a>
				</li>
				<li  <c:if test="${catelogid==null||catelogid==''}">class="filter__item--level4 strong"</c:if >   
					 <c:if test="${catelogid!=null&&catelogid!=''}">class="filter__item--level4 "</c:if > >
					 <a onclick="serlist('',1)" rel="nofollow">不限</a>
				</li>
				<c:forEach items="${catelogList}" var="catelog" varStatus="status">
				<li <c:if test="${catelogid==catelog.id}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${catelogid!=catelog.id}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('${catelog.id}',1)">${catelog.name}</a>
				</li>
				</c:forEach>
				
				
				
			</ul>
			
			<ul class="filter__ul">
				<li class="filter__item--level5 filter__item--aside">
					<a href="javascript:;">学历</a>
				</li>
				<li <c:if test="${xueli==null||xueli==''}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xueli!=null&&xueli!=''}">class="filter__item--level5 check  "</c:if > >
					<a onclick="serlist('',4)"
						rel="nofollow">不限</a>
				</li>
				
				<li <c:if test="${xueli=='初中及以下'}">class="filter__item--level5 strong"</c:if >
					<c:if test="${xueli!='初中及以下'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('初中及以下',4)">初中及以下</a>
				</li>
				<li <c:if test="${xueli=='高中'}">class="filter__item--level5 strong"</c:if >
					<c:if test="${xueli!='高中'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('高中',4)">高中</a>
				</li>
				<li <c:if test="${xueli=='大专'}">class="filter__item--level5 strong"</c:if >
					<c:if test="${xueli!='大专'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('大专',4)">大专</a>
				</li>
				<li <c:if test="${xueli=='本科'}">class="filter__item--level5 strong"</c:if >
					<c:if test="${xueli!='本科'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('本科',4)">本科</a>
				</li>
				<li <c:if test="${xueli=='硕士'}">class="filter__item--level5 strong"</c:if >
					<c:if test="${xueli!='硕士'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('硕士',4)">硕士</a>
				</li>
				<li <c:if test="${xueli=='博士'}">class="filter__item--level5 strong"</c:if >
					<c:if test="${xueli!='博士'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('博士',4)">博士</a>
				</li>
				
				
				
			</ul>


			<ul class="filter__ul" data-el="filterPrice">
				<li class="filter__item--level5 filter__item--aside">
					<a href="javascript:;">薪资</a>
				</li>
				<li <c:if test="${xinzIndex==null||xinzIndex==''}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xinzIndex!=null&&xinzIndex!=''}">class="filter__item--level5 check  "</c:if > >
					<a onclick="serlist('',2)" rel="nofollow">不限</a>
				</li>
				<li <c:if test="${xinzIndex=='1'}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xinzIndex!='1'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('1',2)" >1000以下</a>
				</li>
				<li <c:if test="${xinzIndex=='2'}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xinzIndex!='2'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('2',2)">1000-2000</a>
				</li>
				<li <c:if test="${xinzIndex=='3'}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xinzIndex!='3'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('3',2)">2000-4000</a>
				</li>
				<li <c:if test="${xinzIndex=='4'}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xinzIndex!='4'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('4',2)">4000-8000</a>
				</li>
				<li <c:if test="${xinzIndex=='5'}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xinzIndex!='5'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('5',2)">8000-12000</a>
				</li>
				<li <c:if test="${xinzIndex=='6'}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xinzIndex!='6'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('6',2)">12000-20000</a>
				</li>
				<li <c:if test="${xinzIndex=='7'}">class="filter__item--level5 strong"</c:if >   
					<c:if test="${xinzIndex!='7'}">class="filter__item--level5 check  "</c:if >>
					<a onclick="serlist('7',2)">20000以上</a>
				</li>
			
				
			
			</ul>
			
			

			

		</div>
			
	</div>
	
	<div class="content w1150" id="content">
		<div class="content__article">
		

			<ul class="content__filter" id="contentList">
				<li class="content__filter--selected">
					<a href=""
						data-event_id="10797" data-event_action="target=综合排序">综合排序</a>
				</li>
				
				
			</ul>
			
			<div class="content__list">
			
				<c:forEach items="${list}" var="job" varStatus="status">	
				<div class="content__list--item" style="border-bottom: 1px solid #eee;height: 142px;margin-top: 20px;">
					
					<div class="content__list--item--main" style="margin-left:0">
						<p class="content__list--item--title twoline">
							<a href="<%=path%>/job_toView_web.action?id=${job.id}">
								${job.name} </a>
						</p>
						<p class="content__list--item--des" style="margin-top:15px">
							<a >${job.quyu}</a>
							<i>|</i> ${job.jingyan}
							<i>|</i> ${job.xueli}
							
						</p>
						
						<p class="content__list--item--time oneline" style="position: absolute; top: 10px;right: 0;color:#000;   font-size: 18px;font-weight: 700;">
							${job.address}
						</p>
						<p class="content__list--item--bottom oneline" style="bottom: 40px;left: 0;">
							<c:forEach items="${job.fuliArray}" var="tag" varStatus="var">	
							<i>${tag}</i>
							</c:forEach>
						</p>
						<span class="content__list--item-price"><em>${job.minsalary}-${job.maxsalary}</em>
							元</span>
					</div>
				</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
			
	
	<jsp:include page="../page/foot.jsp" />
	</body>
</html>