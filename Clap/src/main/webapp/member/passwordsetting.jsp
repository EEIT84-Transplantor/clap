<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="../src/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<header>
	
	
	</header>

	<section id="wrap">
		<div class="container-fulid">
			<div class="row">
				<div class="col-md-6" style="background: red; ">
				<form action="passwordSettingServlet.action" method="post">
					<label>Password : </label><input type="text" name="password" palceholder="abc.@clap.com">${requestScope.error.password}<br />
					<label>Re-enter password : </label><input type="text" name="passwordconfirm" palceholder="abc.@clap.com"><br />
					<input type="submit" value="Log in">
				</form>
				</div>
				<div class="col-md-6" style="background: blue; height: 10px;"></div>
			</div>
		</div>
	</section>

	<footer>
	
	
	
	</footer>

	<!-- 載入js -->
	<script src="../src/js/jquery-1.12.2.min.js"></script>
	<script src="../src/js/bootstrap.min.js"></script>
</body>
</html>
