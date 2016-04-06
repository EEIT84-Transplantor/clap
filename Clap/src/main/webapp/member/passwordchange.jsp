<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

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
			<form role="form" action="<c:url value="/setting/changePasswordAction"/>" method="POST" >

				<div class="form-group">
					<s:textfield class="form-control" name="email" type="email" label="Email" readonly="true" value="poan@gmail.com" />

				</div>

				<div class="form-group">
					<s:textfield class="form-control" name="password" type="password" label="password" errorPosition="bottom" value=""/>

				</div>
				<div class="form-group">

					<s:textfield class="form-control" name="newpassword" type="password" label="newpassword" errorPosition="bottom" value=""/>
				</div>
				<div class="form-group">
					<s:textfield class="form-control" name="confirm" type="password" label="confirm" errorPosition="bottom" value=""/>

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
			//onclick submit button
			$("form button").on("click", function() {
				$("form").submit();
			});
			});
	</script>
</body>
</html>
