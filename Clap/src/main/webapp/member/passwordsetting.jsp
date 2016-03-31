<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="../src/css/bootstrap.min.css" rel="stylesheet">
<link href="../src/css/customer.css" rel="stylesheet">
<script src="../src/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#btn_confirm").click(function(){ 
    
	if($("input[name='password']").val() != $("input[name='checkpassword']").val()){
		$("#info_text").text("inconsistent password");
	}else{
		var queryString = "email="+${param.email}+"&password="+password;
    	request = new XMLHttpRequest();
    	request.onreadystatechange = doReadyStateChange;
    	request.open("POST","/member/passwordSettingServlet.action");
    	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    	request.send(queryString);
	}
});
	
});



</script>
</head>
<body>
	<header>
	
	
	</header>

<section id="wrap">
		<div class="container-fulid">
			<div class="row">

				<div class="col-md-12">
				
				<form action="login.action" method="post" id="sign_form">
				    <div class="row"><label class="col-md-3">Password : </label><input type="text" name="password" class="col-md-9"></div>
					<div class="row"><label class="col-md-3">Re-enter : </label><input type="text" name="checkpassword" class="col-md-9"></div>
					<div class="row"><label id="info_text" class="col-md-12"></label></div>
					<div class="row"><input type="button" value="confirm" class="btn col-md-12" id="btn_confirm"/></div>

					

				</form>
				</div>
				</div>
			</div>
	</section>

	<footer>
	
	
	
	</footer>

	<!-- 載入js -->
	
	<script src="../src/js/bootstrap.min.js"></script>
</body>
</html>
