<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="../src/css/bootstrap.min.css" rel="stylesheet">

<link href="../src/css/customer.css" rel="stylesheet">
</head>
<body>
	<header></header>

	<section id="wrap">
		<div class="container-fulid">
			<div class="row">
				<div class="col-md-12">
				<form action="login.action" method="post" id="sign_form">
				    <div class="row form_title"><p class="col-md-12">Welcome to C.L.A.P<br />Please Enter your email below for Login / Sign Up</p></div>
					<div class="row"><label class="col-md-3">E-mail : </label><input type="text" name="email" value="poan@gmail.com" class="col-md-9">${requestScope.error.email}</div>
					<div class="row"><label id="info_text" class="col-md-12"></label></div>
					<div class="row"><input type="button" value="Next" id="emailcheck_btn" class="btn col-md-12" /></div>
					
					<div class="row" id="btn_group">
						<input type="button" value="Login" id="emailcheck_btn_new" class="btn col-md-6" />
						<input type="button" value="Join us" id="forgotPassword_new" class="btn col-md-6" />
					</div>
					
					<div class="row" id="password_group">
					<div class="row"><label class="col-md-3">Password : </label><input type="text" name="password" value="poan" class="col-md-9">${requestScope.error.password}</div>
					<div class="row"><input type="submit" value="Login" class="btn col-md-12"></div>
					<div class="row"><span>need more help?</span><a href="#" id="forgotPassword">forgot password</a></div>
					</div>
				</form>
				</div>
				</div>
			</div>
	</section>

	<footer>
	
	
	
	</footer>

	<!-- 載入js -->
	<script src="../src/js/jquery-1.12.2.min.js"></script>
	<script src="../src/js/bootstrap.min.js"></script>
	<script src="../src/js/loginsignup.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
        //宣告變數
        var request = null;
        
    	//隱藏項目
    	$("#btn_group").hide();
    	$("#password_group").hide();
    	
    	//註冊按鈕監聽器
    	$("#emailcheck_btn_new").click(function(){ sendPostRequestEmail("emailexist.action",$("input[name='email']").val());});
    	$("#emailcheck_btn").click(function(){ sendPostRequestEmail("emailexist.action",$("input[name='email']").val()); });
    	$("#forgotPassword_new").click(function(){ sendEmail(); });
    	$("#forgotPassword").click(function(){ sendEmail(); });
	});
    
    function sendEmail(){
    	var url = "${pageContext.request.contextPath}";
		sendPostRequestEmail(url+"/emailSending.servlet",$("input[name='email']").val());
	    $("#sign_form").html(" We have sent a confirmation email to "+$("input[name='email']").val()+" , please check your email address for confirmation\n\n This page will redirect to hoempage in 5 seconds, or click <a href='"+url+"'>here</a>.");
	    setTimeout(function(){ window.location = url; }, 5000);
    }
    
    
	</script>
</body>
</html>
