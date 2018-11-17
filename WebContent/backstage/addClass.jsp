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
<link href="${path }/css/form-public.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div style="margin-top: 100px">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form class="form-horizontal" role="form" id="courseAction" action="${path }/addClass" method="post">
						<div class="form-group">
							<label for="className" class="col-sm-2 control-label">班级名称</label>
							<div class="col-sm-5">
								<input class="form-control" id="className" name="className" type="text" placeholder="班级名称" />
							</div>
						</div>
						<div class="form-group">
							<label for="gradeId" class="col-sm-2 control-label">所属年级</label>
							<div class="col-sm-5">
								<select class="selectpicker" name="gradeId" id="gradeId" data-live-search="true">
									<option value="" style="display: none;">--请选择--</option>
									<c:forEach items="${grades }" var="grade">
										<option value="${grade.gradeId }">${grade.gradeName }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="teacherId" class="col-sm-2 control-label">班主任</label>
							<div class="col-sm-5">
								<select class="selectpicker" name="teacherId" id="teacherId" data-live-search="true">
									<c:if test="${not empty teachers }">
										<option value="" style="display: none;">--请选择--</option>
										<c:forEach items="${teachers }" var="teacher">
											<option value="${teacher.teacherId }">${teacher.teacherName }</option>
										</c:forEach>
									</c:if>
									<c:if test="${empty teachers }">
										<option value="" style="display: none;">--暂无不是班主任的教师--</option>
									</c:if>
								</select>
							</div>
						</div>
						<br />
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								 <button type="button" class="btn btn-primary" id="classSub">提交 </button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#classSub").click(function(){
			var gradeId=$("#gradeId").val();
			var teacherId=$("#teacherId").val();
			var className=$("#className").val();
			//alert(division+"   "+gradeId+"   "+courseName);
			if(className==null||className.trim()==""){
				alert("班级名称不能为空");
				return false;
			}
			if(gradeId==null||gradeId.trim()==""){
				alert("所属年级不能为空");
				return false;
			}
			if(teacherId==null||teacherId.trim()==""){
				alert("班主任不能为空");
				return false;
			}
			$("form").submit();
		});
	</script>
</body>
</html>