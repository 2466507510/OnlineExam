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
	String gradeId=request.getParameter("gradeId");
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<c:set var="gradeId" value="<%=gradeId%>"></c:set>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
<link href="${path }/css/form-public.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div style="text-align: center;margin-top: 100px">
		<form action="${path }/updateGrade" method="post">
			<h4>年级编号：</h4>
			<input type="text" name="gradeId" class="form-inline ipt" readonly="readonly" value="${gradeId }">
			<br>
			<h4>年级名称：</h4>
			<input type="text" name="gradeName" class="form-inline ipt">
			<br><br>
			<input type="submit" value="提交" class="btn btn-primary">
		</form>
	</div>
</body>
</html>