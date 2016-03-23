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

	<!-- message页面 -->
	<div data-role="page" id="_demands_mkAppointment_ok">
		<div data-role="header" data-position="fixed">
			<a href="${pageContext.request.contextPath }/admin/adminPage.action" data-role="button" data-icon="back">返回需求大厅</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
			    <ul data-role="listview" data-inset="true">
			    	<li><b>出错啦...</b></li>
			    	<li>请确保您操作正确。由于开发时间仓促，资金缺少，系统难免存在一些问题，请谅解。</li>
			    </ul>
			    <a href="${pageContext.request.contextPath }/admin/adminPage.action" data-role="button">返回需求大厅</a>
		</div>
		<div data-role="footer" data-position="fixed">
			<h6>Copyright © Hebei University of Technology , 河北工业大学</h6>
		</div>
	</div>

</body>
</html>
