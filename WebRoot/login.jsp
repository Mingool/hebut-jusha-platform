<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
	<title>聚沙捐助平台</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
	<link rel="stylesheet" href="css/jquery.mobile-1.3.2.css" />
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.mobile-1.3.2.js"></script>
	
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
    		// 处理登陆请求
    		$("#loginButton").unbind("click");
    		$("#loginButton").bind('click',function(){
    			var $loginForm = $("#loginForm");
    			var formData = $loginForm.serialize();
    			console.log("loginFormData=" + formData);
    			showLoader();
    			$.ajax({
				    type: "POST",
				    url: "login.action",
				    data: formData,
				    dataType:"json",
				    success: function(data, textStatus){ 
				    	hideLoader();
				    	var flag = data.flag;
				    	if(!flag){
				    		$("#tipsContent").html(data.message);
				    		$.mobile.changePage( "#tipsWindow", { role: "dialog" } );
				    		return;
				    	}
				    	console.log("登陆成功");
				    	//跳转到admin部分
				    	window.location.href = "${pageContext.request.contextPath }/admin/adminPage.action";
				    },
				    error: function(json){
				    	hideLoader();
				    	$("#tipsContent").html("额,服务器貌似出现问题了:(");
				    	$.mobile.changePage( "#tipsWindow", { role: "dialog" } );
				    	return;
				    }
				});
    		});
    		
    		// 处理注册请求
    		$("#registButton").unbind("click");
    		$("#registButton").bind('click',function(){
    			var formData = $('#registForm').serialize();
    			console.log("registFormData=" + formData);
    			showLoader();
    			$.ajax({
				    type: "POST",
				    url: "regist.action",
				    data: formData,
				    dataType:"json",
				    success: function(data, textStatus){ 
				    	hideLoader();
				    	var flag = data.flag;
				    	if(!flag){
				    		$("#tipsContent").html(data.message);
				    		$.mobile.changePage( "#tipsWindow", { role: "dialog" } );
				    		return;
				    	}
				    	console.log("注册成功");
				    	//跳转到admin部分
				    	window.location.href = "${pageContext.request.contextPath }/admin/adminPage.action";
				    },
				    error: function(json){
				    	hideLoader();
				    	$("#tipsContent").html("请检查网络连接:)");
				    	$.mobile.changePage( "#tipsWindow", { role: "dialog" } );
				    	return;
				    }
				});
    		});
    		
    	});
    </script>
</head>

<body>
	<!-- 登陆页面 -->
	<div data-role="page" id="loginPage">
		<div data-role="header" data-position="fixed">
			<a href="${pageContext.request.contextPath }/index.jsp" data-role="button" data-icon="home">首页</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
			<form id="loginForm">
				<div data-role="fieldcontain">  
		            <label for="username">用户名:</label>  
		            <input type="text" name="user.username" id="username" value=""  />  
		            <label for="password">密码:</label>  
		            <input type="text" name="user.password" id="password" value=""  /> 
		        </div> 		  
		        <div data-role="fieldcontain">  
		            <input type="button" id="loginButton" value="登录"  /> 
		            <a href="#registPage" data-role="button" data-transition="slide">没有注册?请点击这里</a>
		        </div>      
		    </form>
		</div>
		<div data-role="footer" data-position="fixed">
			<h6>Copyright © Hebei University of Technology , 河北工业大学</h6>
		</div>
	</div>


	<!-- 注册页面 -->
	<div data-role="page" id="registPage" >
		<div data-role="header" data-position="fixed">
			<a href="#loginPage" data-transition="slide" data-direction="reverse" data-role="button" data-icon="back">返回</a>
    		<h1>欢迎访问聚沙捐助平台</h1>
		</div>
		<div data-role="content">
			<form method="post" id="registForm">
				<div data-role="fieldcontain">  
		            <label for="username">用户名:</label>  
		            <input type="text" name="user.username" id="user.username" value=""  />
		            <label for="password">密码:</label>  
		            <input type="text" name="user.password" id="user.password" value=""  />  
		            <label for="nickname">昵称:</label>  
		            <input type="text" name="user.nickname" id="user.nickname" value=""  />  
		            <label for="telephone">电话:</label>  
		            <input type="text" name="user.addressInfo.telephone" id="user.addressInfo.telephone" value=""  />  
		            <label for="addr">住址:</label>  
		            <input type="text" name="user.addressInfo.addr" id="user.addressInfo.addr" value=""  />
		        </div>  
		        <fieldset data-role="controlgroup">
			      	<legend>请选择您要注册账号的类型：</legend>
			        <label for="type">贫困地区志愿者</label>
			        <input type="radio" name="user.isVolunteer" id="user.volunteer" value="true" checked>
			        <label for="type">物资捐助者</label>
			        <input type="radio" name="user.isVolunteer" id="user.not_volunteer" value="false">	
		      	</fieldset>    
		        <div data-role="fieldcontain">
		        </div>  
		        <div data-role="fieldcontain">
		            <input type="button" id="registButton" value="立即注册"  />  
		        </div>      
		    </form>
		</div>
	</div>

	<!-- 提示页面 -->
	<div data-role="page" id="tipsWindow" >
		<div data-role="header">
			<h1>提示信息</h1>
		</div>
	  	<div data-role="content">
		    <p id="tipsContent"></p>
	  	</div>
	</div>

</body>
</html>