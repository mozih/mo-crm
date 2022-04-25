<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<!-- Head -->
<head>
<title>登录界面</title>
<!-- Meta-Tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- style CSS -->
<link rel="stylesheet" href="<%=basePath%>css/style.css" type="text/css"
	media="all">
<!-- google fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap"
	rel="stylesheet">
<link href="<%=basePath%>css/css2.css" rel="stylesheet">
</head>

<body>
	<section class="main">
		<div class="logo text-center">
			<h1>
				<a href="#"> 校园宽带办理系统 </a>
			</h1>
		</div>
		<div class="content-w3ls text-center">
			<img src="images/admin.png" alt="" class="img-responsive">
			<form action="<%=basePath%>login" method="post">
				<div class="wthree-field">
					<input name="user_name" id="user_name" type="text"
						placeholder="用户名" required>
				</div>
				<div class="wthree-field">
					<input name="user_password" id="user_password" type="Password"
						placeholder="密码" required>
				</div>
				<div class="wthree-field">
					<button type="submit" class="btn">登录</button>
				</div>
			</form>
		</div>
		<div class="copyright">
			<p>© 2021 广州交通大学 Made with love | Designed by mozihao</p>
		</div>
	</section>

	<%if ((String)request.getAttribute("msg") == "failure1") { %>
	<script>
    alert("用户已被禁用！"); 
   </script>
	<%}else if((String)request.getAttribute("msg") == "failure2"){%>
	<script>
	alert("用户不存在或用户名密码错误！");
	</script>
	<% } %>
</body>
</html>