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
<link href="${path }/js/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
<script src="${path }/js/bootstrap-select/bootstrap-select.min.js"></script>
</head>
<body>
	<div style="margin-top: 100px">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form class="form-horizontal" role="form" id="courseAction" action="${path }/updateCourse" method="post">
						<div class="form-group">
							<label for="courseId" class="col-sm-2 control-label">学科编号</label>
							<div class="col-sm-5">
								<input class="form-control" id="courseId" name="courseId" type="text" value="${courseId }" readonly="readonly" onfocus='this.blur()' />
							</div>
						</div>
						<div class="form-group">
							<label for="division" class="col-sm-2 control-label">分科情况</label>
							<div class="col-sm-5">
								<select class="selectpicker" name="division" id="division" data-live-search="true">
										<option value="" style="display: none;">--请选择--</option>
										<option value="0">不分科</option>
										<option value="1">文科</option>
										<option value="2">理科</option>
								</select>
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
							<label for="courseName" class="col-sm-2 control-label">学科名称</label>
							<div class="col-sm-5">
								<input class="form-control" id="courseName" name="courseName" type="text" placeholder="学科名称" />
							</div>
						</div>
						<br />
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								 <button type="button" class="btn btn-primary" id="updateCourseSub">提交 </button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#updateCourseSub").click(function(){
			var division=$("#division").val();
			var gradeId=$("#gradeId").val();
			var courseName=$("#courseName").val();
			//alert(division+"   "+gradeId+"   "+courseName);
			if(division==null||division.trim()==""){
				alert("分科情况不能为空");
				return false;
			}
			if(gradeId==null||gradeId.trim()==""){
				alert("所属年级不能为空");
				return false;
			}
			if(courseName==null||courseName.trim()==""){
				alert("学科名称不能为空");
				return false;
			}
			$("form").submit();
		});
	</script>
</body>
</html>