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
<style type="text/css">
	tr,th{
		text-align: center;
	}
</style>
</head>
<body>

<!-- 	<button style="display: none" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="mymodal"></button>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					 	添加成功
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-xs btn-primary" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#mymodal").click();
		});
	</script> -->
	<table class="table table-striped table-hover table-condensed">
		<tr>
			<td>1</td>
			<td>李谨进</td>
			<td>
				<div class="btn-group">
						<button type="button" class="btn btn-info btn-sm">修改</button>
						<button type="button" class="btn btn-danger btn-sm">删除</button>
						<button type="button" class="btn btn-primary btn-sm lookclass">班级</button>
				</div>
			</td>
		</tr>
		<tr id="addtr" style="background-color: #E6F1D8">
			<td colspan="3">
				<div class='panel panel-success'>
					<div class='panel-heading'>班级信息如下</div>
					<div class='panel-body myadd'></div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>