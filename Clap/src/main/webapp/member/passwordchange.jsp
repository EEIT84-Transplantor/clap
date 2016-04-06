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
<link href="../resource/css/bootstrap.min.css" rel="stylesheet">
<link href="../resource/css/customer.css" rel="stylesheet">

</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">
			<div class="center-block" style="width:40%;">
			<form role="form">
				<div class="form-group">
					<label for="name">Password:</label>
					<input class="form-control" name="memberVO.password" type="text" placeholder="input current password" />
				</div>
				<div class="form-group">
				</div>
				<div class="form-group">
				</div>
				<button class="btn btn-default" type="button">Submit</button>
			</form>
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
		$(document).ready(function() {
			var contextPath = "${pageContext.request.contextPath}";
			//onclick current password
			$("form>div>input").eq(0).on("click", function(){
				$("form>div>input").attr("placeholder","");
			}).on("blur", function(){
				$("form>div>input").attr("placeholder","input current password");
			});
			
			//onclick submit
			$("form button").eq(0).on("click", function(){
				alert($("form>div>input").val());
				
			})
			

			

		});
	</script>
</body>
</html>
