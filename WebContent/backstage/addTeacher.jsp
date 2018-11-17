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
<link href="${path }/js/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
<script src="${path }/js/bootstrap-select/bootstrap-select.min.js"></script>
</head>
<body>
	<div style="margin-top: 100px">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form class="form-horizontal" role="form" id="teacherAction" action="${path }/addTeacher" method="post">
						<div class="form-group">
							<label for="adminPower" class="col-sm-2 control-label">后台权限</label>
							<div class="col-sm-5">
								<select class="selectpicker" name="adminPower" id="adminPower" data-live-search="true">
									<option value="" style="display: none">--请选择--</option>
									<option value="1">管理员</option>
									<option value="0">普通教职工</option>	
								</select>
							</div>
						</div>
						<div class="form-group">
							 <label for="teacherName" class="col-sm-2 control-label">教师姓名</label>
							<div class="col-sm-5">
								<input class="form-control" id="teacherName" name="teacherName" type="text" placeholder="教师姓名" />
							</div>
						</div>
						<div class="form-group">
							 <label for="teacherAccount" class="col-sm-2 control-label">后台登录账户</label>
							<div class="col-sm-5">
								<input class="form-control" id="teacherAccount" name="teacherAccount" type="text" placeholder="后台登录账户" />
							</div>
						</div>
						<div class="form-group">
							 <label for="teacherPwd" class="col-sm-2 control-label">后台登录密码</label>
							<div class="col-sm-5">
								<input class="form-control" id="teacherPwd" name="teacherPwd" type="password" placeholder="后台登录密码" />
							</div>
						</div>
						<br />
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								 <button type="button" class="btn btn-primary" id="teacherSub">提交 </button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#teacherSub").click(function(){
			var adminPower=$("#adminPower").val();
			var teacherName=$("#teacherName").val();
			var teacherAccount=$("#teacherAccount").val();
			var teacherPwd=$("#teacherPwd").val();
			//alert(division+"   "+gradeId+"   "+courseName);
			if(adminPower==null||adminPower.trim()==""){
				alert("后台权限不能为空");
				return false;
			}
			if(teacherName==null||teacherName.trim()==""){
				alert("教师姓名不能为空");
				return false;
			}
			if(teacherAccount==null||teacherAccount.trim()==""){
				alert("后台登录账户不能为空");
				return false;
			}
			if(teacherPwd==null||teacherPwd.trim()==""){
				alert("后台登录密码不能为空");
				return false;
			}
			$("form").submit();
		});
	</script>
</body>
</html>