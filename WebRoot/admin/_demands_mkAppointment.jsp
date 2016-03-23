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
    	//显示加载器  
		function showLoader() {  
		    //显示加载器.for jQuery Mobile 1.2.0  
		    $.mobile.loading('show', {  
		        text: '加载中...', //加载器中显示的文字  
		        textVisible: true, //是否显示文字  
		        theme: 'a',        //加载器主题样式a-e  
		        textonly: false,   //是否只显示文字  
		        html: ""           //要显示的html内容，如图片等  
		    });  
		}    
		//隐藏加载器.for jQuery Mobile 1.2.0  
		function hideLoader()  
		{  
		    //隐藏加载器  
		    $.mobile.loading('hide');  
		}
    	$(function(){
    		var $mkApmBtn = $("#mkAppointmentButton");
    		$mkApmBtn.unbind("click");
    		$mkApmBtn.bind("click",function(){
    			showLoader(); // 显示 loading
    			var formData = $("#itemForm").serialize();
    			console.log("formData=" + formData);
    			formData = formData.replace(/&/g,";");
    			var formData_ = "j=" + formData + "&demandsID=" + ${demands.id};
    			console.log("formData_=" + formData_);
				$.ajax({
				    type: "POST",
				    url: "admin/mkAppointment.action",
				    data: formData_,
				    dataType:"json",
				    success: function(data, textStatus){ 
				    	hideLoader();
				    	var flag = data.flag;
				    	if(!flag){
				    		$("#tipsContent").html(data.message);
				    		$.mobile.changePage( "#tipsWindow", { role: "dialog" } );
				    		return;
				    	}
				    	console.log("预约成功");
				    	//跳转到预约成功页面
				    	window.location.href = "${pageContext.request.contextPath }/admin/_demands_mkAppointment_OK.jsp";
				    },
				    error: function(json){
				    	hideLoader();
				    	$("#tipsContent").html("额...服务器貌似出现问题了 :(");
				    	$.mobile.changePage( "#tipsWindow", { role: "dialog" } );
				    	return;
				    }
				});   			
    		});
    	});
    </script>
</head>

<body>

	<!-- 预约页面 -->
	<div data-role="page" id="submitAppointment">
		<div data-role="header" data-position="fixed">
			<a href="${pageContext.request.contextPath }/admin/adminPage.action" data-role="button" data-icon="home">首页</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
			<form id="itemForm">
				<div data-role="fieldcontain">
					<ul data-role="listview" data-inset="true">
						<c:forEach items="${demands.itemSet }" var="item">
							<li>
								<label for="${item.id }">${item.name }:</label>
					       		<input type="range" name="${item.id }" id="${item.id }" value="0" min="0" max="${item.totalNum-item.receiveNum-item.reservationNum }">
							</li>
						</c:forEach>
						<li>Tips:若页面无响应,请刷新页面.</li>
					</ul>
			    </div>
			    <a href="javascript:void(0);" id="mkAppointmentButton" data-role="button">立即预约</a>
		    </form>
		</div>
		<div data-role="footer" data-position="fixed">
			<h6>Copyright © Hebei University of Technology , 河北工业大学</h6>
		</div>
	</div>

	<!-- 提示页面 -->
	<div data-role="page" id="tipsWindow" >
		<div data-role="header">
			<h1>提示信息</h1>
		</div>
	  	<div data-role="content" id="tipsContent">
		    <p>对话框与普通页面不同，它显示在当前页面的顶端。它不会横跨整个页面宽度。对话框页眉中的图标 “X” 可关闭对话框。</p>
	  	</div>
	</div>

</body>
</html>