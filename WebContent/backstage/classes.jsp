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
							<h3 class="bg-info">班级信息</h3>
						</div>
					</td>
				</tr>
				<tr>
					<th>班级编号</th>
					<th>班级名称</th>
					<th>所属年级</th>
					<th>班主任</th>
					<c:if test="${power==1 }">
						<th>操作</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty classes }">
					<c:forEach items="${classes }" var="class_">
						<tr>
							<td>${class_.classId }</td>
							<td>${class_.className }</td>
							<td>${class_.gradeInfo.gradeName }</td>
							<td>${class_.teacherInfo.teacherName }</td>
							<td>
								<c:if test="${power == 1 }">
										<div class="btn-group">
											<button type="button" class="btn btn-info btn-sm" onclick="location='${path}/preUpdateClass?classId=${class_.classId }&&oldTeacherId=${class_.teacherInfo.teacherId }'">修改</button>
											<button type="button" class="btn btn-danger btn-sm" onclick="location='${path}/deleteClass?classId=${class_.classId }&&oldTeacherId=${class_.teacherInfo.teacherId }'">删除</button>
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
				<a href="${path }/preAddClass" class="btn btn-primary">添加班级</a>
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