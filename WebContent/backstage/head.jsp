<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台首页头部</title>
<style type="text/css">
a {
	text-decoration: none;
}
a:HOVER {
	text-decoration: none;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.headcon{
	position: fixed;
}
</style>
</head>
<body>
	<div class="headcon" style="width: 100%; height: 98px; background-color: #3D3D3D;">
		<div style="float: left; width: 19.7%; height: 100%;line-height:80px;margin-left: -40px;">
			<a href="index.jsp" target="_top">
				<img src="../images/backstage/logo.png" alt="WiseMan logo" style="width: 95%; height: 100%;" />
			</a>
		</div>
		<div id="head-nav-show-head" style="float: left; width: 36.5%; height: 100%;margin-left: 112px;">
			<div style="margin-top: 25px; float: right; width: 211px; height: 35px; background-color: #3D3D3D;line-height: 35px;text-align: center;">
				<span id="date_time" style="color: #FFF;font-size: 14px"></span>
			</div>
		</div>
		<div id="loginTeacher" style="float:right; width: 200px; height:100%;line-height: 80px;">
			<c:if test="${sessionScope.loginTeacher != null }">
				<a class="btn btn-info" href="" style="margin-left: 9px;">
					${sessionScope.loginTeacher.teacherName }
				</a>
			</c:if>
			<c:if test="${sessionScope.loginTeacher == null }">
				<a target="right" class="btn btn-info" href="#" style="margin-left: 9px;">
					未登录
				</a>
			</c:if>
			<a class="btn btn-info" href="${path }/teacherExit" target="_parent">退出登录</a>
		</div>
	</div>
	<script type="text/javascript">
		getDateTime();
		function getDateTime(){
			var date=new Date();
			var year=date.getFullYear();
			var month=date.getMonth()+1;
			var day=date.getDate();
			var hour = date.getHours();
    		var minute = date.getMinutes();
    		var second = date.getSeconds();
    		if(parseInt(second) >= 0 && parseInt(second) < 10) {
    			second = "0"+second;
    		}
    		$("#date_time").text(year+"年"+month+"月"+day+"日"+hour+"时"+minute+"分"+second+"秒");
		}
		setInterval("getDateTime()", 1000);
	</script>
</body>
</html>