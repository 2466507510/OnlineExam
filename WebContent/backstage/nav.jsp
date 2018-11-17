<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>操作记录</title>
<style type="text/css">
 		a{text-decoration:none;}
		a:HOVER{text-decoration: none;}
		a:link{text-decoration:none; }
		a:visited{text-decoration:none; }
		a:active{text-decoration:none;}
 		.index_title {
 			/*width: 100px;*/
 			height: 30px;
 			line-height: 30px;
 			border: 1px solid green;
 			text-align: center;
 			margin-left: 9px;
 			cursor: pointer;
 			border-radius: 3px;
 		}
 		sup {
 			cursor: pointer;
 		}
 		sup:hover {
 			background-color: gray;
 			color: red;
 		}
 </style>
</head>
<body>
	<div class="headcon" style="width: 100%; height: 30px; border-bottom: 1px solid #E5E5E5;margin-top: 98px;background-color: #D0DFEF">
		<div id="head-nav-show" style="width: 100%; height: 100%;">
			<div class='index_title' id='it111' style='float: left; background-color: #CAE5E8;'>
				<a href=home.jsp target='right' style='color: #707070; margin-left: 5px;' onclick='changeShow(111)'>
					首页
				</a>&emsp;
				<!-- <sup onclick='removeParent(11)'>×</sup> -->
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function removeParent(i) {
			//当前页处于显示状态，无法删除
			/* if ($("#it" + i).attr("show") == "t") {
				return;
			} */
			
			//怎么判断是不是当前页
			//如果是当前页，那么他的背景色是深色
			//var color=$("#it"+i).style.background-color;
			//var v=document.getElementById("it"+i).style.bgcolor;
			var v=$("#it"+i).css('background-color');
			//alert(v);
			$("#it" + i).remove();
			if(v!="rgb(255, 255, 255)"){
				window.right.location.href="home.jsp";	
			}
		}
		function changeShow(i) {
			$(".index_title").css("background-color", "#FFF");
			$("#it" + i).css("background-color", "#CAE5E8");
		}
		$(function() {
    		$("#head-nav-show").mouseover(function() {
    			if($(".index_title").size() <= 0) {
    				return false;
    			}
    			$(this).css("border-bottom", "1px solid orange").css("cursor", "pointer");
    		}).mouseout(function() {
    			$(this).css("border-bottom", "1px solid #E5E5E5");   			
    		});
    	});
	</script>
</body>
</html>