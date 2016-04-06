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
					<input class="form-control" name="memberVO.email" type="email" value="poan@gmail.com" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="password">Password:</label>
					<input class="form-control" name="oldPassword" type="password" placeholder="click to change password">
				</div>
				<div class="form-group"></div>
				<div class="form-group"></div>
				<div class="form-group">
					<label for="name">Name:</label>
					<input class="form-control" name="memberVO.name" type="text" value="test" />
				</div>
				<div class="form-group">
					<label for="phone">Phone:</label>
					<input class="form-control" name="memberVO.phone" type="number" maxlength="12">
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
			//onclick oldPassword column
			$("input[name='oldPassword']").on("click", function() {
				var oldPassword = $("input[name='oldPassword']");
				oldPassword.attr("placeholder", "");
			}

			).on("keyup", function() {
				var email = $("input[name='memberVO.email']").val();
				var oldPassword = $("input[name='oldPassword']");
				var passwordLabel = oldPassword.prev();
				if (oldPassword.val().length < 4 || oldPassword.attr("readonly") == "readonly") {
					return;
				}
				passwordLabel.html("Password: checking");
				$.ajax({
					method : "POST",
					url : contextPath + "/member/getpassword.servlet",
					data : {
						email : email,
						oldPassword : oldPassword.val()
					}
				}).done(function(msg) {
					if (msg == "true") {
						var htmlStr1 = "<label for='new password'>New Password:</label> <input class='form-control' name='newPassword' type='password'>";
						var htmlStr2 = "<label for='confirm newPass'>Confirm New Password:</label> <input class='form-control' name='memberVO.password' readonly='readonly' type='password'>";
						oldPassword.attr("readonly", "readonly");
						oldPassword.on("click", function() {
						});
						oldPassword.parent().next().html(htmlStr1);
						oldPassword.parent().next().next().html(htmlStr2);
						onclickNewColumns();
						passwordLabel.html("Password: correct");
					} else {
						passwordLabel.html("Password: wrong");
					}
				})
			});

			//onclick newPassword column
			function onclickNewColumns() {
				var newPassword = $("input[name='newPassword']");
				var confirmPass = $("input[name='memberVO.password']");
				newPassword.on("focus", function() {
					confirmPass.removeAttr("readonly");
				}).on("blur", function() {
					checkPasswordSame();
				});
				confirmPass.on("keyup", function() {
					checkPasswordSame();
				});
			}
			//new passwords confirmation
			function checkPasswordSame() {
				var newPassword = $("input[name='newPassword']");
				var confirmPass = $("input[name='memberVO.password']");
				if (newPassword.val().length >= 4 && newPassword.val() == confirmPass.val()) {
					newPassword.prev().html("New Password:");
					confirmPass.prev().html("Confirm New Password: password consistent");
				} else {
					newPassword.prev().html("New Password: CHECK YOUR INPUT");
					confirmPass.prev().html("Confirm New Password: CHECK YOUR INPUT");
				}
			}

			//onclick submit button
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
