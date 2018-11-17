$(function(){
	$.getJSON("../homeInfo",function(data){
		$.each(data, function(key, value) {
//			alert(key+"    "+value);
			if(key.trim()=="studentTotal"){
				$("#studentTotal").css("background-color","#6CCAC9");
				$("#studentTotal").children("h1").text("学生人数");
				$("#studentTotal").siblings(".totalValue").children("span").text(value+"人");
			}else if(key.trim()=="teacherTotal"){
				$("#teacherTotal").css("background-color","#FF6C60");
				$("#teacherTotal").children("h1").text("教师人数");
				$("#teacherTotal").siblings(".totalValue").children("span").text(value+"人");
			}else if(key.trim()=="subjectTotal"){
				$("#subjectTotal").css("background-color","#F8D347");
				$("#subjectTotal").children("h1").text("题目数量");
				$("#subjectTotal").siblings(".totalValue").children("span").text(value+"道");
			}else if(key.trim()=="examPaperTotal"){
				$("#examPaperTotal").css("background-color","#57C8F2");
				$("#examPaperTotal").children("h1").text("试卷数量");
				$("#examPaperTotal").siblings(".totalValue").children("span").text(value+"套");
			}
		});
	});
});