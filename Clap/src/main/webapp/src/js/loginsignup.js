//密碼確認
function comparePassword(email,oldPassword,newPassword,url){
	if(oldPassword!=null&&oldPassword.length!==0){
		if (oldPassword!=newPassword) {
			console.log(oldPassword);
			$("#info_text").text("inconsistent password, please try again!");
		} else {
			var url = url+"/member/passwordSettingServlet.action";
			var queryString = "?email="+email+"&passwordconfirm="+newPassword+"&password="+oldPassword;
			console.log(queryString);
			window.location = url+ queryString;
		}
	}else{
		$("#info_text").text("You need to enter a password");
	}
}

//ajax狀態
function doReadyStateChange() {
	if(request.readyState==4) {
		if(request.status==200) {
			$("#emailcheck_btn").hide();
			//email是否存在
			if(request.responseText == "true"){
				$("#info_text").html("");
				$("input[name='email']").prop("readonly", true);
				$("#btn_group").hide();
				$("#password_group").show();
			}else{
				$("#info_text").html("This email is not in our system.<br /> Already a member? Please check your email again<br /> Not a member yet? -> Sign up");
				$("#btn_group").show();
			}
		} else {
			console.log("Error Code:"+request.status+", "+request.statusText);
		}
	}
}

//送出信箱認證 
function sendPostRequestEmail(url, email){
var queryString = "email="+email;
request = new XMLHttpRequest();
request.onreadystatechange = doReadyStateChange;
request.open("POST",url);
request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
request.send(queryString);
};