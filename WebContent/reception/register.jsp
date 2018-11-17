<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>学生注册</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
<link href="${path }/js/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${path }/js/zeroModal/zeroModal.css" />
<style type="text/css">
.dropdown-toggle {
	height: 30px;
}
</style>
</head>
<body>
	<div>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form class="form-horizontal" role="form" id="studentRegSub" action="">
						<div class="form-group">
							<label for="validateName" class="col-sm-2 control-label">真实姓名</label>
							<div class="col-sm-10">
								<input class="form-control" name="studentName" id="validateName" type="text" placeholder="真实姓名" />
							</div>
						</div>
						<div class="form-group">
							<label for="account" class="col-sm-2 control-label" >考试登录账户</label>
							<span id="result" style="color:green;"></span>
							<div class="col-sm-10">
								<input class="form-control" name="studentAccount" id="account" type="text" placeholder="考试登录账户" />
							</div>
						</div>
						<div class="form-group">
							<label for="pwd" class="col-sm-2 control-label">考试登录密码</label>
							<div class="col-sm-10">
								<input class="form-control" name="studentPwd" id="pwd" type="password" placeholder="考试登录密码" />
							</div>
						</div>
						<div class="form-group">
							<label for="class" class="col-sm-2 control-label">就读班级</label>
							<div class="col-sm-10">
								<select id="classId" class="selectpicker" name="classInfo.classId" data-live-search="true">
									<option value="">--请选择--</option>
									<c:forEach items="${classes }" var="classes">
										<option value="${classes.classId }">${classes.className }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<br />
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-default btn-lg btn-primary btn-block" id="signSubmit">确定</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="${path }/js/jquery/jquery.js"></script>
	<script src="${path }/js/zeroModal/zeroModal.min.js"></script>
	<script src="${path }/js/studentLoginAndRegister.js"></script>
	<script src="${path }/js/bootstrap/bootstrap.min.js"></script>
	<script src="${path }/js/bootstrap-select/bootstrap-select.min.js"></script>
	<script type="text/javascript">
		$('.selectpicker').selectpicker({
			style : 'btn-default',
			size : 8
		});
	</script>
</body>
</html>