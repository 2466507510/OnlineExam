<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/images/backstage/index.png" rel="shortcut icon" type="image/x-icon" />
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${path }/js/zeroModal/zeroModal.css" />
<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/dropdown.js"></script>
<script src="${path }/js/zeroModal/zeroModal.min.js"></script>
</head>
<body>
	<c:if test="${sessionScope.loginTeacher == null }">
		<%response.sendRedirect("../backstage/login.jsp"); %>
	</c:if>
<%-- 	<frameset rows="15%, *" frameborder="0">
    	<frame src="${path }/admin/head.jsp" name="head" noresize="noresize" />
    	<frameset cols="15%, *" frameborder="0">
    		<frame src="${path }/admin/left.jsp" name="left" noresize="noresize" />
    		<frameset rows="7%, *">
	    		<frame src="${path }/admin/nav.jsp" name="nav" noresize="noresize" />
	    		<frame src="${path }/admin/home.jsp" name="right" noresize="noresize" />    			
    		</frameset>
    	</frameset>
    </frameset> --%>
    <div style="width: 100%; height: 100%;">
		<div>
			<%@include file="head.jsp"%>
		</div>
		<div>
			<%@include file="left.jsp"%>
		</div>
		<div style="margin-left: 210px;">
			<%@include file="nav.jsp"%>
		</div>
		<div style="height: 1080px;margin-left: 210px;margin-right: 0px;margin-top: 128px">
			<iframe id="lijinjin" src="home.jsp" name="right" width="100%" height="100%" style="border-left:0px"></iframe>
		</div>
	</div>
</body>
</html>