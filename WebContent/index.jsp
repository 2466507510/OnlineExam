<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>考考考在线考试系统</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/images/reception/index.png" rel="shortcut icon" type="image/x-icon" />
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${path }/js/zeroModal/zeroModal.css" type="text/css" rel="stylesheet" />
</head>
<body style="background-color: #EEEEEE;">
	<div style="width: 100%; height: 100%">
		<div class="container" id="abc">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							 	<span class="sr-only">Toggle navigation</span>
							 	<span class="icon-bar"></span>
							 	<span class="icon-bar"></span>
							 	<span class="icon-bar"></span>
							 </button>
							<a class="navbar-brand" href="index.jsp">考考考</a>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="index.jsp">首页</a></li>
								<li><a href="#nowhere">考试中心</a></li>
								<li><a href="#nowhere">考试历史</a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right" style="margin-right: 10px;">
								<li class="dropdown">
									<c:if test="${sessionScope.loginStudent != null }">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										 	<img class="img-circle" src="${path }/images/reception/photo.jpg" alt="Photo" style="width: 30px; height: 30px;" />
										 	<strong class="caret"></strong>
										</a>
										<ul class="dropdown-menu">
											<li>
												<a href="selfInformation?studentId=${sessionScope.loginStudent.studentId }" id="self">${sessionScope.loginStudent.studentName }</a>
											</li>
											<li class="divider"></li>
											<li>
												<a href="${path }/studentExit">退出登录</a>
											</li>
										</ul>
									</c:if>
									<c:if test="${sessionScope.loginStudent == null }">
										<li>
											<button id="gotobackstage" style="margin-top:5px" type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="bottom" title="如果你是教师或者管理员请登录后台管理系统">后台管理</button>
										</li>
										<div class="btn-group" style="margin-top: 5px;">
											<button class="btn btn-default btn-sm" type="button" id="studentLogin">登陆</button>
											<button class="btn btn-default btn-sm" type="button" id="studentRegister">注册</button>
										</div>
									</c:if>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<div>
			<jsp:include page="reception/home.jsp" />
		</div>
	</div>
	<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
	<script type="text/javascript" src="${path }/js/zeroModal/zeroModal.min.js"></script>
	<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${path }/js/studentLoginAndRegister.js"></script>
	<script>
   		$(function () {
   			$("[data-toggle='tooltip']").tooltip(); 
   			$("#gotobackstage").click(function(){
   				window.location.href="${path}/backstage/index.jsp";
   			});
   		});
	</script>
</body>
</html>