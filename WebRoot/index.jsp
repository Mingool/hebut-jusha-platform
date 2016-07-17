<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<meta name="author" content="www.frebsite.nl" />
		<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />

		<title>聚沙公益</title>
		<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">

		<link type="text/css" rel="stylesheet" href="css/flexslider.css" />
		<link type="text/css" rel="stylesheet" href="css/jquery.mmenu.all.css" />
		<link type="text/css" rel="stylesheet" href="css/style.css" />

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.mmenu.min.all.js"></script>
		<script type="text/javascript" src="js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="js/o-script.js"></script>
		
	</head>
	<body class="o-page">
		<div id="page">
			<!-- Header -->
			<div id="header">
				<span id="Logo" class="svg">
					<img src="img/mylogo.png" />
				</span>
				<!--
				<a class="backBtn" href="javascript:history.back();"></a>
				-->
			</div>
			<div class="subHeader">
				<i class="i-home i-small"></i>时代在变，时间在变，不变的是我们的关怀。
			</div>
			
			<!-- Banner -->
			<div class="bannerPane">
			  <section class="slider">
				<div class="flexslider">
				  <ul class="slides">
					<li>
						<img src="img/blog/1.jpg" />
						</li>
						<li>
						<img src="img/blog/2.jpg" />
						</li>
						<li>
						<img src="img/blog/3.jpg" />
						</li>
				  </ul>
				</div>
			  </section>
			</div>
			<!-- End Banner -->
			
			<!-- Content -->
			<div id="content">
				<div class="mainIconPane">
					<span class="i-pane i-green">
						<i class="i-phone" style="background-image: url('css/fonts/pic_1.png')"></i>
					</span>
					<h4></h4>
					<p>
						<span class="c-green">雷云</span>
						虽然是贫困县，在山西闻喜，也很少有人还住窑洞了。13岁的雷云（化名）就和爷爷奶奶生活在阴暗潮湿的窑洞里。
					</p>
				</div>
				
				<div class="mainIconPane">
					<span class="i-pane i-orange">
						<i class="i-neat" style="background-image: url('css/fonts/pic_2.png')"></i>
					</span>
					<h4></h4>
					<p>
						<span class="c-orange">梅红芳</span>
						“我一岁的时候妈妈就走了……”八岁的小芬说这句话的时候，眼睛望向墙角，有些失落。不知道周围人多少遍的重复，才能....
					</p>
				</div>
				
				<div class="mainIconPane">
					<span class="i-pane i-red">
						<i class="i-flexible" style="background-image: url('css/fonts/pic_3.png')"></i>
					</span>
					<h4></h4>
					<p>
						<span class="c-red"></span>
						在中国，由于儿童福利制度尚未完善，还有数以万计需要救助的儿童。每年也还有新的儿童因家庭变故而陷入困境，他们有的甚至吃不饱...
					</p>
				</div>
			</div>
			<div class="block">
				选项
			</div>
			
			<div class="exploreSiteFullPane">
				
				<a href="${pageContext.request.contextPath }/login.jsp" class="explorePane active">
					<span class="i-pane i-blue">
						<i class="i-home" ></i>
					</span>
					<h4>登陆&amp;注册</h4>
				</a>
				<a href="javascript:alert('请等待..');" class="explorePane middle">
					<span class="i-pane i-blue">
						<i class="i-about"></i>
					</span>
					<h4>关于我们</h4>
				</a>
			</div>
			
			<!-- Social Icons -->
			<div class="socialMedia scl-grey" style="background-color:#000">
				<font style="color:#FFF">河北工业大学</font>
			</div>
			
			<!-- Menu navigation -->
			<nav id="menu">
				
			</nav>
		</div>
		
	</body>
</html>