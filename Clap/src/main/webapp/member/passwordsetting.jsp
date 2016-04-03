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
		<div class="container-fulid">
			<div class="row">

				<div class="col-md-12">

					<form action="login.servlet" method="post" id="sign_form">
						<div class="row">
							<label class="col-md-3">Password : </label><input type="text"
								name="password" class="col-md-9">
						</div>
						<div class="row">
							<label class="col-md-3">Re-enter : </label><input type="text"
								name="passwordconfirm" class="col-md-9">
						</div>
						<div class="row">
							<label id="info_text" class="col-md-12"></label>
						</div>
						<div class="row">
							<input type="button" value="confirm" class="btn col-md-12"
								id="btn_confirm" />
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
		$("#btn_confirm").click(function(){
			var oldPassword = $("input[name='password']").val();
			var newPassword = $("input[name='passwordconfirm']").val();
			comparePassword("${param.email}",oldPassword,newPassword,"${pageContext.request.contextPath}");
		});
	});
</script>
</body>
</html>
