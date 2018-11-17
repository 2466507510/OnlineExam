<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
<script src="${path }/js/jquery/jquery.js"></script>
<script src="${path }/js/bootstrap/bootstrap.min.js"></script>
<title>HOME</title>
<style type="text/css">
 		.totalDiv {
 			height: 100px;
 			border: 1px solid #DDDDDD;
 			line-height: 100px;
 			margin-left: 65px;
 			margin-top: 31px;
 			border-radius: 3px;
 		}
 		.totalTitle {
 			float: left;
 			width: 40%;
 			height: 100%;
 			line-height: 100px;
 			text-align: center;
 			margin-left: -15px;
 		}
 		.totalValue {
 			float: right;
 			width: 50%;
 			height: 100%;
 			line-height: 100px;
 			text-align: center;
 		}
 		.val {
 			font-size: 30px;
 			font-weight: 700;
 		}
 		h1 {
 			color: #FFF;
 		}
</style>
</head>
<body style="text-align: center">
	<div class="alert alert-block alert-success">
		<button class="close" data-dismiss="alert" type="button" style="text-align: center;">
			<img src="../images/backstage/x.png" />
		</button>
		<i class="icon-ok green"></i> 欢迎使用 <strong> 智夫子后台管理系统 <small>(v2.0)</small>
		</strong> , 努力做教育服务
	</div>
	<div class="state-overview clearfix">
		<div class="col-lg-3 col-sm-5 totalDiv">
			<div class="totalTitle" id="studentTotal">
				<h1></h1>
			</div>
			<div class="totalValue">
				<span class="val"></span>
			</div>
		</div>
		<div class="col-lg-3 col-sm-5 totalDiv">
			<div class="totalTitle" id="teacherTotal">
				<h1></h1>
			</div>
			<div class="totalValue">
				<span class="val"></span>
			</div>
		</div>
		<div class="col-lg-3 col-sm-5 totalDiv">
			<div class="totalTitle" id="examPaperTotal">
				<h1></h1>
			</div>
			<div class="totalValue">
				<span class="val"></span>
			</div>
		</div>
		<div class="col-lg-3 col-sm-5 totalDiv">
			<div class="totalTitle" id="subjectTotal">
				<h1></h1>
			</div>
			<div class="totalValue">
				<span class="val"></span>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${path }/js/backstageHome.js"></script>
</body>
</html>