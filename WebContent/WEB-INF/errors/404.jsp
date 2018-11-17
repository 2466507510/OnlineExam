<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/images/reception/index.png" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" href="${path }/js/jquery404/css/404.css" />
</head>
<body>
	<div class="code">
		<p>ERROR 404</p>
	</div>
	<div class="road">
		<div class="shadow">
			<div class="shelt">
				<div class="head">
					<div class="eyes">
						<div class="lefteye">
							<div class="eyeball"></div>
							<div class="eyebrow"></div>
						</div>
						<div class="righteye">
							<div class="eyeball"></div>
							<div class="eyebrow"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="hat"></div>
			<div class="bubble">
				<a href="javascript:history.go(-1)">Go back Page?</a>
			</div>
		</div>
		<p>PAGE NOT FOUND</p>
	</div>
	<script type="text/javascript" src="${path }/js/jquery404/js/404.js" ></script>
	<script type="text/javascript" src="${path }/js/jquery.js" ></script>
</body>
</html>