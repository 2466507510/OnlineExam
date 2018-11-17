<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>年级信息</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<c:set var="power" value="${sessionScope.adminPower }"></c:set>
<script type="text/javascript" src="${path }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/js/classUnderGrade.js"></script>
<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
					<td colspan="3">
						<div align="center">
							<h3 class="bg-info">年级信息</h3>
						</div>
					</td>
				</tr>
				<tr>
					<th>年级编号</th>
					<th>年级名称</th>
					<th>操作</th>
					<%-- <th>hhh${power }</th> --%>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty grades }">
					<c:forEach items="${grades }" var="grade">
						<tr>
							<td>${grade.gradeId }</td>
							<td>${grade.gradeName }</td>
							<td>
								<div class="btn-group">
									<c:if test="${power==1 }">
										<button type="button" class="btn btn-info btn-sm" onclick="location='${path}/backstage/updateGrade.jsp?gradeId=${grade.gradeId}'">修改</button>
										<button type="button" class="btn btn-danger btn-sm" onclick="location='${path}/deleteGrade?gradeId=${grade.gradeId}'">删除</button>
									</c:if>
									<button type="button" class="btn btn-primary btn-sm lookclass" id="grade${grade.gradeId }">班级</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div align="center">
			<c:if test="${power==1 }">
				<a href="backstage/addGrade.jsp" class="btn btn-primary">添加年级</a>
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