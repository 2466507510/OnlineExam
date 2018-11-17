var pwd = "";
var loginStatus = false;
$(function() {
	$("div#abc a[href$=#nowhere]").click(function(){
		alert("还没做");
	});
	$("#resetPwdSubmit").click(function() {
		$("#tishi").html("");
		var newPwd = $("#pwd").val();
		var studentId = $("#studentId").text();
		// alert(newPwd + " " + studentId);
		if (newPwd == null || newPwd.trim() == "") {
			// alert("密码不能为空");
			$("#tishi").html("密码不能为空");
			return false;
		}
		$.ajax({
			type : "POST",
			data : "studentId=" + studentId + "&studentPwd=" + newPwd,
			url : "resetStudentPwd",
			success : function(data) {
				// alert(data);
				if (data.trim() == "t") {
					alert("密码修改成功");
					window.location.href = "index.jsp";
				} else {
					alert("密码修改失败");
				}
			},
		});
	});
	$("#resetPwd").click(function() {
		$("#tishi").html("");
	});

	$("#self").click(function() {
		var href = $(this).attr("href");
		zeroModal.show({
			title : "个人信息",
			content : "个人信息查看",
			width : '400px',
			height : '200px',
			top : '100px',
			left : '430px',
			url : href,
			overlay : false,
			ok : true,
			onClosed : function() {
				location.reload();
			}
		});
		return false;
	});
	// 学生注册弹出注册界面
	$("#studentRegister").click(function() {
		parent.zeroModal.show({
			title : '注册',
			iframe : true,
			url : 'studentRegisterClassSelect',
			width : '28%',
			height : '65%',
			top : '100px',
			left : '430px',
			esc : true,
			overlay : true,
			onClosed : function() {
				location.reload();
			}
		});
	});
	// 学生注册提交
	$("#signSubmit").click(
			// 验证输入元素数据是否正确
			function() {
				var studentName = $("#validateName").val();
				var studentAccount = $("#account").val();
				var studentPwd = $("#pwd").val();
				var studentClassId = $("#classId").val();
				// alert(studentName+studentAccount+studentPwd+studentClassId);
				if (studentName.trim() == null || studentName.trim() == "") {
					zeroModal.show({
						title : "提示",
						content : "请输入真实姓名!",
						width : '200px',
						height : '130px',
						overlay : false,
						ok : true,
						onClosed : function() {
							$("#validateName").val("");
							$("#validateName").get(0).focus();
						}
					});
					return false;
				}
				if (studentAccount.trim() == null
						|| studentAccount.trim() == ""
						|| studentAccount.length <= 0
						|| studentAccount.length > 10) {
					zeroModal.show({
						title : "提示",
						content : "考试登录账户不合法!",
						width : '200px',
						height : '130px',
						overlay : false,
						ok : true,
						onClosed : function() {
							$("#account").val("");
							$("#account").get(0).focus();
						}
					});
					return false;
				}
				if (studentPwd.trim() == null || studentPwd.trim() == ""
						|| studentPwd.length < 6 || studentPwd.length > 10) {
					zeroModal.show({
						title : "提示",
						content : "考试登录密码不合法!",
						width : '200px',
						height : '130px',
						overlay : false,
						ok : true,
						onClosed : function() {
							$("#pwd").val("");
							$("#pwd").get(0).focus();
						}
					});
					return false;
				}
				$.ajax({
					type : "POST",
					url : "studentRegister",
					data : "studentName=" + studentName + "&studentAccount="
							+ studentAccount + "&studentPwd=" + studentPwd
							+ "&studentClassId=" + studentClassId,
					success : function(data) {
						if (data.trim() == "t") {
							zeroModal.show({
								title : "提示",
								content : "注册成功!",
								width : '200px',
								height : '130px',
								overlay : false,
								ok : true,
								okFn : function() {
									parent.zeroModal.closeAll();
								},
								onClosed : function() {
									$("#validateName").val("");
									$("#account").val("");
									$("#pwd").val("");
								}
							});
						} else {
							alert("注册失败");
						}
					}
				});
			});
	$("#account").blur(function() {
		$("#result").html("");
		var account = $(this).val();
		// alert(account);
		if (account == null || account.trim() == "") {
			return false;
		}
		$.ajax({
			type : "POST",
			data : "studentAccount=" + account,
			url : "validateStudentAccount",
			success : function(data) {
				if (data.trim() != "t") {
					zeroModal.show({
						title : "提示",
						content : "该账户已被注册!",
						width : '200px',
						height : '130px',
						overlay : false,
						ok : true,
						onClosed : function() {
							$("#account").val("");
						}
					});
					return false;
				} else {
					// alert(data);
					// alert("sjjs");
					$("#result").html("该账户可以使用a");
					return false;
				}
			}
		});
	});
	$("#studentLogin").click(function() {
		zeroModal.show({
			title : '登录',
			iframe : true,
			url : 'reception/login.jsp',
			width : '30%',
			height : '50%',
			top : '100px',
			left : '430px',
			esc : true,
			overlay : true,
			onClosed : function() {
				location.reload();
			}
		});
	});
	$("#studentLoginSubmit").click(function() {
		var studentAccount = $("#studentAccount").val();
		var studentPwd = $("#studentPwd").val();
		// alert(studentAccount + studentPwd);
		if (studentAccount.trim() == null || studentAccount.trim() == "") {
			zeroModal.show({
				title : "提示",
				content : "请输入登录账号!",
				width : '200px',
				height : '130px',
				overlay : false,
				ok : true,
				onClosed : function() {
					$("#studentAccount").val("");
					$("#studentAccount").get(0).focus();
				}
			});
			return false;
		}
		if (studentPwd.trim() == null || studentPwd.trim() == "") {
			zeroModal.show({
				title : "提示",
				content : "请输入密码!",
				width : '200px',
				height : '130px',
				overlay : false,
				ok : true,
				onClosed : function() {
					$("#studentPwd").val("");
					$("#studentPwd").get(0).focus();
				}
			});
			return false;
		}
	});
	$("#studentAccount").blur(
			function() {
				var studentAccount = $(this).val();
				// alert(studentAccount);
				if (studentAccount == null || studentAccount.trim() == "") {
					$("#studentAccountMsg").html("账号不能为空");
					return false;
				}
				$.post("../validateStudentAccount", "studentAccount="
						+ studentAccount, function(data) {
					if (data == "t") {
						$("#studentAccount").val();
						$("#studentAccountMsg").html("账号不存在");
					} else {
						pwd = data;
					}
				});
			}).focus(function() {
		$("#studentAccountMsg").html("");
	});
	$("#studentPwd").blur(function() {
		var studentPwd = $(this).val();
		// alert(studentPwd);
		if (studentPwd == null || studentPwd.trim() == "") {
			$("#studentPwdMsg").html("密码不能为空");
			return false;
		}
		if (studentPwd != pwd) {
			$(this).val("");
			$("#studentPwdMsg").html("密码错误");
		} else {
			loginStatus = true;
		}
	}).focus(function() {
		$("#studentPwdMsg").html("");
	});
});
function loginStatusValidate() {
	if (loginStatus) {
		zeroModal.closeAll();
		return true;
	} else {
		alert("登录发生错误");
		return false;
	}
}