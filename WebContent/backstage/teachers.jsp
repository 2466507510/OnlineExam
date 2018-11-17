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
	<div style="text-align: center;">
		<table class="table table-striped table-hover table-condensed">
			<thead>
				<tr>
					<td colspan="7">
						<div align="center">
							<h3 class="bg-info">教师信息</h3>
						</div>
					</td>
				</tr>
				<tr>
					<th>教师编号</th>
					<th>教师姓名</th>
					<th>后台账户</th>
					<th>后台密码</th>
					<th>后台权限</th>
					<th>班主任</th>
					<c:if test="${power==1 }">
						<th>操作</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty teachers }">
						<c:forEach items="${teachers }" var="teacher">
							<tr>
								<td>${teacher.teacherId }</td>
								<td>${teacher.teacherName }</td>
								<td>${teacher.teacherAccount }</td>
								<td>
									<!-- 只有真正后台管理员才能查看教师后台密码，且重置 --> 
									<c:if test="${sessionScope.adminPower == 1 }">
										<span id="hidePwd">******</span>
										<span id="showPwd" style="display: none">${teacher.teacherPwd }</span>
										<button id="viewPwd" type="button" class="btn btn-info btn-xs viewPwd">查看</button>
									</c:if> 
									<c:if test="${power != 1 }">
										******
									</c:if>
								</td>
								<td>
									<c:if test="${teacher.adminPower == 0 }">
										普通教职工
									</c:if> 
									<c:if test="${teacher.adminPower == 1 }">
										<span style="color: red;">管理员</span>
									</c:if>
								</td>
								<td>
									<c:if test="${teacher.isWork == 0 }">
										否
									</c:if> 
									<c:if test="${teacher.isWork == 1 }">
										<a href="getClassByClassId?classId=${teacher.classInfo.classId }">${teacher.classInfo.className }</a>
									</c:if>
								</td>
								<td>
									<div class="btn-group">
										<c:if test="${sessionScope.loginTeacher.teacherName == teacher.teacherName or sessionScope.adminPower == 1 }">
											<button type="button" class="btn btn-info btn-sm" onclick="location='${path}/preUpdateTeacher?teacherId=${teacher.teacherId }'">修改</button>
										</c:if>
										<c:if test="${sessionScope.adminPower == 1}">
											<button type="button" class="btn btn-danger btn-sm" onclick="location='${path}/deleteTeacher?teacherId=${teacher.teacherId }'">删除</button>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<div align="center">
			<c:if test="${power==1 }">
				<a href="${path }/backstage/addTeacher.jsp" class="btn btn-primary">添加教师</a>
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
	<script type="text/javascript">
		$(".viewPwd").click(function(){
			//alert("哈哈哈");
			var buttonV=$(this).text();
			//alert(buttonV);
			if(buttonV=="查看"){
				var pwd=$(this).siblings("#showPwd").text();
				//alert(pwd);
				$(this).siblings("#hidePwd").text(pwd);
				$(this).text("隐藏");
			}
			if(buttonV=="隐藏"){
				$(this).siblings("#hidePwd").text("******");
				$(this).text("查看");
			}
		});
	</script>
</body>
</html>