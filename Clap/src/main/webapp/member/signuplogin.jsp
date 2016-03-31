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
<script src="../src/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){

		$("input").eq(1).click(function(){
			emailConfirm($("input").eq(0).val());
			console.log("sd");
		});
	});
    
    var request = null;
    function emailConfirm(email){
    	var url = "emailexist.action";
    	var queryString = "email="+email;
    	request = new XMLHttpRequest();
    	request.onreadystatechange = doReadyStateChange;
    	request.open("POST",url);
    	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    	request.send(queryString);
    }
    
    function doReadyStateChange() {
    if(request.readyState==4) {
    		if(request.status==200) {
    			if(request.responseText == "true"){
    				//email已存在
    				console.log("email已存在");
    			}else{
    				//email不存在
    				console.log("email不存在");
    			}
    		} else {
    			console.log("Error Code:"+request.status+", "+request.statusText);
    		}
    	}

    }
	</script>
</head>
<body>
	<header>
	
	
	</header>

	<section id="wrap">
		<div class="container-fulid">
			<div class="row">
				<div class="col-md-6" style="background: red;">
				<form action="login.action" method="post">
					<label>E-mail : </label><input type="text" name="email" value="poan@gmail.com">${requestScope.error.email}<br />
					<label>Password : </label><input type="text" name="password" value="poan">${requestScope.error.password}<br />
					<input type="submit" value="Log in">
				</form>
				<span>need more help?</span>
				<span><a href="#">forgot password</a></span>
				</div>
				<div class="col-md-6" style="background: blue; height: 10px;"></div>
			</div>
		</div>
	</section>

	<footer>
	
	
	
	</footer>

	<!-- 載入js -->
	
	<script src="../src/js/bootstrap.min.js"></script>
	
</body>
</html>
