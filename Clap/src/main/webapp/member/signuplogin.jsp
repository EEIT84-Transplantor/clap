<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="../resource/css/bootstrap.min.css" rel="stylesheet">
<link href="../resource/css/customer.css" rel="stylesheet">
</head>
<body>
	<header>
	 <jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				<form action="login.servlet" method="post" id="sign_form">
				    <div class="row form_title"><p class="col-md-12"><h3>Welcome to C.L.A.P</h3><span>Please Enter your email below for Login / Sign Up</span> </p></div>
				    
					<div class="row"><label class="col-md-3">E-mail : </label><input type="text" name="email" value="${param.email}" class="col-md-9">${requestScope.error.email}</div>
					<div class="row" id="info_text"><p class="col-md-12"></p></div>
					
					<c:if test="${empty requestScope.error}" >
					<div class="row"><input type="button" value="Next" id="emailcheck_btn" class="btn col-md-12" /></div>
					</c:if>
					
					<div id="password_area">
					<c:if test="${not empty requestScope.error}" >
					<div class="row" id="password_group">
					<div class="row"><label class="col-md-3">Password : </label><input type="text" name="password" class="col-md-9">${requestScope.error.password}</div>
					<div class="row"><input type="submit" value="Login" class="btn col-md-12"></div>
					<div class="row"><span>need more help?</span><a href="#" id="forgotPassword">forgot password</a></div>
					</div>
					</c:if>
					
					<div class="row" id="btn_group">
						<input type="button" value="Login" id="emailcheck_btn_new" class="btn col-md-6" />
						<input type="button" value="Join us" id="forgotPassword_new" class="btn col-md-6" />
					</div>
					
					</div>
					
				</form>
				</div>
				</div>
			</div>
	</section>

	<footer>
	<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js"></script>
	<script src="../resource/js/bootstrap.min.js"></script>
	<script src="../resource/js/loginsignup.js"></script>
    <script type="text/javascript">
 
    $(document).ready(function(){
    	//隱藏項目
    	$("#btn_group").hide();
    	
    	//宣告變數
        var request = null;
    	
    	//註冊按鈕監聽器
    	$("#emailcheck_btn_new").click(function(){ sendPostRequestEmail("emailexist.servlet",$("input[name='email']").val());});
    	$("#emailcheck_btn").click(function(){ sendPostRequestEmail("emailexist.servlet",$("input[name='email']").val()); });
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
