<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台登录</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="${path }/images/backstage/index.png" rel="shortcut icon" type="image/x-icon" />
<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/js/teacherLogin.js"></script>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
		body {
			background: url("${path}/images/backstage/login_bg.jpg") no-repeat scroll 0px 0px
				transparent;
			background-size: 100%;
		}
		.container {
			width: 300px;
			height: 200px;
			margin-top: 100px;
		}
		.error-msg {
			color: red;
			font-size: 12px;
			display: none;
		}
</style>
</head>
<body>
	<div class="container">
		<form class="form-signin" action="${path }/teacherLogin" method="post" id="adminLogin">
			<h2 class="form-signin-heading">登录</h2>
			<label for="teacherAccount" class="sr-only">teacherAccount</label> 
			<input type="text" id="teacherAccount" name="teacherAccount" class="form-control" placeholder="用户名" required autofocus /> 
			<label class="error-msg">用户名不存在</label>
			<br /> 
			<label for="teacherPwd" class="sr-only">teacherPwd</label> 
			<input type="password" id="teacherPwd" name="teacherPwd" class="form-control" placeholder="密  码" required /> 
			<label class="error-msg">密码错误</label> 
			<br />
			<button class="btn btn-lg btn-primary btn-block" type="submit" id="teacherLogin">确认</button>
		</form>
	</div>
</body>
</html>