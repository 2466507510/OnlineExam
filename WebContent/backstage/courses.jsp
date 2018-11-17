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
<c:set var="power" value="${sessionScope.adminPower }"></c:set>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
<style type="text/css">
	tr,th{
		text-align: center;
	}
</style>
</head>
<body>
	<div>
		<table class="table table-striped table-hover table-condensed">
			<thead>
				<tr>
					<td colspan="5">
						<div align="center">
							<h3 class="bg-info">科目信息</h3>
						</div>
					</td>
				</tr>
				<tr>
					<th>科目编号</th>
					<th>科目名称</th>
					<th>分科情况</th>
					<th>所属年级</th>
					<c:if test="${power==1 }">
						<th>操作</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty courses }">
					<c:forEach items="${courses }" var="course">
						<tr>
							<td>${course.courseId }</td>
							<td>${course.courseName }</td>
							<td>
								<c:if test="${course.division==0 }">暂未分科</c:if>
								<c:if test="${course.division==1 }">文科</c:if>
								<c:if test="${course.division==2 }">理科</c:if>
							</td>
							<td>${course.gradeInfo.gradeName }</td>
							<td>
								<c:if test="${power == 1 }">
										<div class="btn-group">
											<button type="button" class="btn btn-info btn-sm" onclick="location='${path}/preUpdateCourse?courseId=${course.courseId }'">修改</button>
											<button type="button" class="btn btn-danger btn-sm" onclick="location='${path}/deleteCourse?courseId=${course.courseId }'">删除</button>
										</div>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div align="center">
			<c:if test="${power==1 }">
				<a href="${path }/preAddCourse" class="btn btn-primary">添加科目</a>
			</c:if>
		</div>
		<button style="display: none" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="mymodal"></button>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<span style="font-size: 20px;color: green">${msg }</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-primary" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${msg!=null }">
			<script type="text/javascript">
				$(function(){
					$("#mymodal").click();
				});
			</script>
		</c:if>
	</div>
</body>
</html>