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
			<form role="form" action="${pageContext.request.contextPath}/setting/changeSettingAction" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label for="email">Email:</label>
					<input class="form-control" name="email" type="email" value="poan@gmail.com" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="name">Name:</label>
					<input class="form-control" name="name" type="text" value="test" />
				</div>
				<div class="form-group">
					<label for="phone">Phone:</label>
					<input class="form-control" name="phone" type="number" maxlength="12">
				</div>
				<div class="form-group">
					<label for="photo">Photo:</label>
					<input class="form-control" name="photo" type="file" accept="image/*">
				</div>
				<button class="btn btn-default" type="button">Submit</button>
			</form>
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
			var ajaxurl = contextPath + "/setting/changeSettingAction.action";

			//onclick submit button
			$("form button").on("click", function() {
				$.ajax({
					method : "POST",
					url : ajaxurl,
					data : $("form").serialize()
				}).done(function(msg) {
					alert(msg);
				});
			});

		});
	</script>
</body>
</html>
