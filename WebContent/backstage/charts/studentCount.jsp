<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级人数统计</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/js/echarts/echarts.js"></script>
<script type="text/javascript" src="${path }/js/echarts/shine.js"></script>
<style type="text/css">
    li {list-style: none;}
    a{text-decoration:none;}
	a:HOVER{text-decoration: none;color: red}
	a:link{text-decoration:none; }
	a:visited{text-decoration:none; }
	a:active{text-decoration:none;}
	li a {cursor: pointer;}
</style>
</head>
<body>
	<div style="width: 100%; height: 100%;margin-top: 100px" align="center">
		<div style="width: 100px; height: 100%;float: left;">
			<ul>
				<li><a onclick="loadShopLine(1)">高一</a></li>
				<li><a onclick="loadShopLine(2)">高二</a></li>
				<li><a onclick="loadShopLine(3)">高三</a></li>
				<li><a onclick="loadShopLine(-1)">全部</a></li>
			</ul>
		</div>
		<div id="studentCount" style="width:1000px; height: 400px; float: left; border: 1px solid #E5E5E5;"></div>
	</div>
	<script type="text/javascript">
		var studentCount=echarts.init(document.getElementById("studentCount"),"shine");
		//加载数据
		function loadShopLine(flag) {
			studentCount.clear();
			studentCount.showLoading({text: "图表正在努力加载中..."});
			$.getJSON("${path}/getStudentCount"+(flag==-1?"":"?gradeId="+flag), function(json) {
				studentCount.setOption(json, true);
				studentCount.hideLoading();
			});
		}
		//载入折线图
		loadShopLine(-1);
	</script>
</body>
</html>