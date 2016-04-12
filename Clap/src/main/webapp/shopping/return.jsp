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
<link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/customer.css" rel="stylesheet">
<style>
.pack{
border: 1px solid white;
padding: 20px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2">side-nav:sub-menu</div>
				<div class="col-md-9">
					<!-- content start-->
					<div class="row pack">
					 
					 <div class="col-md-4" style="background-color: red">1</div>
					 <div class="col-md-5" style="background-color: blue">2</div>
					 <div class="col-md-3" style="background-color: yellow">3</div>
					</div>





					<!-- content end-->
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
