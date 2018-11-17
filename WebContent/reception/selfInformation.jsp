<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<style type="text/css">
.title {
	font-size: 12px;
}

.label-val {
	cursor: pointer;
}
</style>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${path }/js/zeroModal/zeroModal.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div style="width: 400px">
		<label style="display: none;" id="studentId">${student.studentId }</label>
		<span class="title">姓&emsp;名: </span>
		<label class="label-val">${student.studentName }</label>
		<br />
		<span class="title">登录账户: </span>
		<label class="label-val">${student.studentAccount }</label>
		<br />
		<span class="title">登录密码: </span>
		<label class="label-val"  id="sutdentPwd">******</label>
		<button type="button" class="btn btn-xs" style="color: green" id="resetPwd" data-toggle="modal" data-target="#myModal">修改密码</button>
		<br />
		<span class="title">就读班级: </span>
		<label class="label-val">${student.classInfo.className }</label>
		<br />
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
        		<div class="modal-content">
          			<div class="modal-body">
            			<p>请输入密码</p>
            			<input type="text" id="pwd" name="pwd" class="form-control">
            			<span id="tishi" style="color: red"></span>
          			</div>
          			<div class="modal-footer">
            			<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            			<button class="btn btn-primary" type="button" id="resetPwdSubmit">提交</button>
          			</div>
        		</div><!-- /.modal-content -->
      		</div><!-- /.modal-dialog -->
		</div>
	</div>
	<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
	<script type="text/javascript" src="${path }/js/zeroModal/zeroModal.min.js"></script>
	<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${path }/js/studentLoginAndRegister.js"></script>
</body>
</html>