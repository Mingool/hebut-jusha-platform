<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
	<title>聚沙捐助平台</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
	<link rel="stylesheet" href="../css/jquery.mobile-1.3.2.css" />
	<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="../js/jquery.mobile-1.3.2.js"></script>
    <script type="text/javascript">
    	
    </script>
</head>

<body>

	<!-- 具体需求页面 -->
	<div data-role="page" id="demandsInfo">
		<div data-role="header" data-position="fixed">
			<a href="${pageContext.request.contextPath }/admin/adminPage.action" data-role="button" data-icon="home">首页</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
				<h4>${demands.title }</h4>
				<h5>志愿者：${demands.user.nickname }</h5>
				<h5>描述:${demands.description }</h5>
			    <ul data-role="listview" data-inset="true">
			    	<c:forEach items="${demands.itemSet }" var="item">
			    		<li>${item.name }<span class="ui-li-count">开放预约数量:${item.totalNum-item.receiveNum-item.reservationNum }</span></li>
			    	</c:forEach>
			    </ul>
			    <c:if test="${demands.status==1 }">
			    	<a href="${pageContext.request.contextPath }/admin/showMkAppointmentPage.action?demandsID=${demands.id}" data-role="button">我要预约捐赠</a>
			    </c:if>
		</div>
		<div data-role="footer" data-position="fixed">
			<h6>Copyright © Hebei University of Technology , 河北工业大学</h6>
		</div>
	</div>

</body>
</html>