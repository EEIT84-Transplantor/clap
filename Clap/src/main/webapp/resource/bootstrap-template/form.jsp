<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/customer.css"/>" rel="stylesheet">

</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">
			<form role="form" action="" method="POST">
				<div class="form-group">
					<label for="email">Email:</label> <input class="form-control"
						type="email" value="${pageContext.request.contextPath}"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input class="form-control"
						type="password" value="">
				</div>
				<div class="form-group">
					<label for="name">Name:</label> <input class="form-control"
						type="text" value="">
				</div>
				<div class="form-group">
					<label for="phone">Phone:</label> <input class="form-control"
						type="text" value="">
				</div>
				<div class="form-group">
					<label for="photo">Photo:</label> <input class="form-control"
						type="file" accept="image/*" value="">
				</div>
				<button class="btn btn-default" type="button">Submit</button>
			</form>
		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js"/>"></script>
	<script src="../resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("form button").on("click", function() {
				console.log();
				console.log();
				$("form").submit();
			});
			$("form").submit(function(event) {
				if ($("input").val() == "") {
					console.log("Submit error");
					event.preventDefault();
				} else {
					console.log("Submit done");
					return;
				}
			});
		});
	</script>
</body>
</html>
