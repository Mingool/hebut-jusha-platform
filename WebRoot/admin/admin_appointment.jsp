<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html> 
<html>
<head>
	<title>管理页面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
	<link rel="stylesheet" href="../css/jquery.mobile-1.3.2.css" />
	<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="../js/jquery.mobile-1.3.2.js"></script>
</head>

<body>

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
			        <li><a href="${pageContext.request.contextPath }/admin/adminPage.action#demands" data-icon="search">需求大厅</a></li>
			        <li><a href="#myAppointment" data-icon="info" class="ui-btn-active ui-state-persist">我的预约</a></li>
			        <li><a href="${pageContext.request.contextPath }/admin/adminPage.action#myScore" data-icon="star">我的积分</a></li>
			        <li><a href="${pageContext.request.contextPath }/admin/adminPage.action#myInfo" data-icon="home">我的信息</a></li>
		      	</ul>
		    </div>
		</div>
	</div>

</body>
</html>