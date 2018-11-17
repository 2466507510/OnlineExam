<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生登录</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="${path }/js/zeroModal/zeroModal.css" type="text/css"
	rel="stylesheet" />
</head>
<body>
	<div>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form class="form-horizonta form-signinl" onsubmit="return loginStatusValidate()" role="form" action="${path }/studentLogin" method="post" id="receptionLogin" name="receptionLogin" >
						<div class="form-group">
							<label for="studentAccount" class="col-sm-2 control-label">账&emsp;号</label>
							<div class="col-sm-10">
								<input class="form-control" name="studentAccount"
									id="studentAccount" type="text" placeholder="考试登录账号" /> <label
									style="color: red; font-size: 12px;" id="studentAccountMsg"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="studentPwd" class="col-sm-2 control-label">密&emsp;码</label>
							<div class="col-sm-10">
								<input class="form-control" name="studentPwd"
									id="studentPwd" type="password" placeholder="考试登录密码" /> <label
									style="color: red; font-size: 12px;" id="studentPwdMsg"></label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label><input type="checkbox" name="remember" />记住我</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit"
									class="btn btn-default btn-lg btn-primary btn-block"
									id="studentLoginSubmit">登&emsp;&emsp;&emsp;录</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="${path }/js/jquery/jquery.js"></script>
	<script src="${path }/js/studentLoginAndRegister.js"></script>
	<script src="${path }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${path }/js/zeroModal/zeroModal.min.js"></script>
</body>
</html>