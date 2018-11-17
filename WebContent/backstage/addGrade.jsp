<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
<link href="${path }/css/form-public.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div style="text-align: center;margin-top: 100px">
		<form action="${path }/addGrade" method="post">
			<span>年级名称：</span>
			<input type="text" name="gradeName" class="form-inline ipt">
			<input type="submit" value="提交" class="btn btn-primary">
		</form>
	</div>
</body>
</html>