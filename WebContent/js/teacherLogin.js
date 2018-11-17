var pwd = "";
var loginStatus = false;
$(function() {
	$("#teacherAccount").blur(
			function() {
				var teacherAccount = $(this).val();
				// alert(teacherAccount);
				if (teacherAccount == null || teacherAccount.trim() == "") {
					return false;
				}
				$.post("../validateTeacher",
						"teacherAccount=" + teacherAccount, function(data) {
//					alert(data);
							if (data == "no") {
								$("#teacherAccount").val("");
								$(".error-msg").first().css("display", "block");
							}else{
								pwd=data;
								loginStatus=true;
							}
						});
			}).focus(function(){
				$(".error-msg").first().css("display", "none");	
			});
	$("#teacherPwd").blur(function() {
		var teacherPwd = $(this).val();
		// alert(teacherPwd);
		if (teacherPwd == null || teacherPwd.trim() == "") {
			return false;
		}
		if(teacherPwd!=pwd){
			$(this).val("");
			$(".error-msg").eq(1).css("display", "block");
			loginStatus=false;
		}else{
			loginStatus=true;
		}
	}).focus(function(){
		$(".error-msg").eq(1).css("display", "none");
	});
});
