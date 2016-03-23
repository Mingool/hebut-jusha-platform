<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html> 
<html>
<head>
	<title>管理页面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
	<link rel="stylesheet" href="../css/jquery.mobile-1.3.2.css" />
	<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="../js/jquery.mobile-1.3.2.js"></script>
</head>

<body data-dom-cache="false">

	<!-- 需求大厅 -->
	<div data-role="page" id="demands" data-dom-cache="false">
		<div data-role="header" data-position="fixed">
			<a href="${pageContext.request.contextPath }/admin/adminPage.action" data-role="button" data-icon="refresh">刷新</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
			<ul data-role="listview" data-inset="true">
		      	<li data-role="list-divider"><fmt:formatDate value="<%=new Date() %>" pattern="MM 月 dd 日 , yyyy" /></li>
		      	<c:forEach items="${demandsList}" var="demands">
		      		<li>
				      	<a href="${pageContext.request.contextPath }/admin/showDemandsInfo.action?demandsID=${demands.id}">   
					        <h2>${demands.title}</h2>
					        <p><b>志愿者:${demands.user.nickname}</b></p>
					        <p>${demands.description}</p>
					        <p><b>贫困地区:${demands.powertyArea}</b></p>
					        <p class="ui-li-aside">状态: 
						        <c:if test="${demands.status==1 }"><font style="color:green">接受预约中</font></c:if>
						        <c:if test="${demands.status==2 }"><font style="color:red">预约已停止</font></c:if>
						        <c:if test="${demands.status==3 }"><font style="color:yellow">物资运输中</font></c:if>
						        <c:if test="${demands.status==4 }"><font style="color:black">已结束</font></c:if>
					        </p>
				        </a>
		      		</li>
		      	</c:forEach>
		    </ul>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
		    	<ul>
			        <li><a href="#demands" data-icon="search" class="ui-btn-active ui-state-persist">需求大厅</a></li>
			        <li><a href="#myAppointment" data-icon="info">我的预约</a></li>
			        <li><a href="#myScore" data-icon="star">我的积分</a></li>
			        <li><a href="#myInfo" data-icon="home">我的信息</a></li>
		      	</ul>
		    </div>
		</div>
	</div>

	<!-- 我的预约 -->
	<div data-role="page" id="myAppointment" data-dom-cache="false">
		<div data-role="header" data-position="fixed">
			<a href="${pageContext.request.contextPath }/admin/adminPage.action" data-role="button" data-icon="refresh">刷新</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
			<ul data-role="listview" data-inset="true">
		      	<li data-role="list-divider">我的预约列表</li>
		      	<c:if test="${fn:length(appointmentSet)<=0}">
		      		<li>您目前没有任何预约。</li>
		      	</c:if>
		      	<c:if test="${fn:length(appointmentSet)>0}">
		      		<c:forEach items="${appointmentSet }" var="appointment">
		      			<li>
					      	<a href="${pageContext.request.contextPath }/admin/showAppointmentInfo.action?appointmentID=${appointment.id }">   
						        <h2>${appointment.demands.title }</h2>
						        <p><b>预约时间:${appointment.startTime }</b></p>
						        <p class="ui-li-aside">
						        	<c:if test="${apppintment.isFinished}">状态: <font style="color:green">已完成</font></c:if>
						        	<c:if test="${!apppintment.isFinished}">状态: <font style="color:red">等待捐赠</font></c:if>
						        </p>
					        </a>
		      			</li>
		      		</c:forEach>
		      	</c:if>
		      	
		    </ul>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
		    	<ul>
			        <li><a href="#demands" data-icon="search">需求大厅</a></li>
			        <li><a href="#myAppointment" data-icon="info" class="ui-btn-active ui-state-persist">我的预约</a></li>
			        <li><a href="#myScore" data-icon="star">我的积分</a></li>
			        <li><a href="#myInfo" data-icon="home">我的信息</a></li>
		      	</ul>
		    </div>
		</div>
	</div>

	<!-- 我的积分 -->
	<div data-role="page" id="myScore" data-dom-cache="false">
		<div data-role="header" data-position="fixed">
			<a href="${pageContext.request.contextPath }/admin/adminPage.action" data-role="button" data-icon="refresh">刷新</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
			<ul data-role="listview" data-inset="true">
				<li data-role="list-divider">我的积分</li>
				<li>您目前没有积分.</li>
			</ul>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
		    	<ul>
			        <li><a href="#demands" data-icon="search">需求大厅</a></li>
			        <li><a href="#myAppointment" data-icon="info">我的预约</a></li>
			        <li><a href="#myScore" data-icon="star" class="ui-btn-active ui-state-persist">我的积分</a></li>
			        <li><a href="#myInfo" data-icon="home">我的信息</a></li>
		      	</ul>
		    </div>
		</div>
	</div>

	<!-- 我的信息 -->
	<div data-role="page" id="myInfo" data-dom-cache="false">
		<div data-role="header" data-position="fixed">
			<a href="${pageContext.request.contextPath }/admin/adminPage.action" data-role="button" data-icon="refresh">刷新</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
			<ul data-role="listview" data-inset="true">
				<li>用户名:&nbsp;&nbsp;&nbsp;<span class="ui-li-count">${user.username }</span></li>
				<li>昵称:&nbsp;&nbsp;&nbsp;<span class="ui-li-count">${user.nickname }</span></li>
				<li>账号类型:&nbsp;&nbsp;&nbsp;<span class="ui-li-count"><c:if test="${user.isVolunteer }">贫困地区志愿者</c:if><c:if test="${!user.isVolunteer }">物资捐赠者</c:if></span></li>
				<li>电话:&nbsp;&nbsp;&nbsp;<span class="ui-li-count">${user.addressInfo.telephone }</span></li>
				<li>住址:&nbsp;&nbsp;&nbsp;<span class="ui-li-count">${user.addressInfo.addr }</span></li>
				<li>注册时间:&nbsp;&nbsp;&nbsp;<span class="ui-li-count">${user.registTime }</span></li>
			</ul>
			<a href="${pageContext.request.contextPath }/logout.action" data-role="button">退出登录</a>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
		    	<ul>
			        <li><a href="#demands" data-icon="search">需求大厅</a></li>
			        <li><a href="#myAppointment" data-icon="info">我的预约</a></li>
			        <li><a href="#myScore" data-icon="star">我的积分</a></li>
			        <li><a href="#myInfo" data-icon="home" class="ui-btn-active ui-state-persist">我的信息</a></li>
		      	</ul>
		    </div>
		</div>
	</div>

</body>
</html>