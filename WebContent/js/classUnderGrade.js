$(function(){
	//查询年级下的班级
	var lastclick_class = -1;
	$(".lookclass").click(function(){
		$(this).parent().parent().parent().siblings("tr").css("background-color","");
		$(".panel").remove();
		$("#addtr").remove();
		var gradeId=$(this).attr("id").substring(5);
//		alert(gradeId);
		if(lastclick_class==gradeId){
			$(this).parent().parent().parent().css("background-color", "");
			lastclick_class= -1;
			return;
		}
		lastclick_class=gradeId;
		$(this).parent().parent().parent().css("background-color","#E6F1D8");
		$(this).parent().parent().parent().after("<tr id='addtr'><td colspan='3'></td></tr>");
		$("#addtr").children("td").append("<div class='panel panel-success'><div class='panel-heading'>班级信息如下</div><div class='panel-body myadd'></div></div>");
		//提交请求获取班级数据
		$.ajax({
			url:"getGradeClasses?gradeId="+gradeId,
			dataType:"json",
			cache:true,
			success:function(data){
				if(data!=null&&data.length!=0){
//					alert(data);
//					alert(data.length);
					$.each(data,function(key,value){
//						alert(key+"  "+value);
						$(".myadd").append("<b>"+value.className+"&emsp;</b>");
					});
				}else{
					$(".panel-heading").remove();
		    		$(".myadd").append("<b>暂无班级&emsp;<a href=''>添加</a></b>");	
				}
			}
		});
	});
});