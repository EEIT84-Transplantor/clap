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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">

</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">

			<form class="form-horizontal" role="form" method="POST" style="border: solid white;">
				<div class="form-group">
					<label class="col-md-2 control-label" for="expire">Your VIP valid until:</label>
					<div class="col-md-10">
						<p class="form-control-static" name="memberVO.expire">${login.expire}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="autorenew">Activate auto renewal?</label>
					<div class="col-md-10">
						<label class="radio-inline"> 
							<input type="radio" name="autorenew" id="inlineRenew01" value="true"> Yes
						</label> 
						<label class="radio-inline"> 
							<input type="radio" name="autorenew" id="inlineRenew02" value="false"> No
						</label>
					</div>
				</div>

			</form>
			<br>
			<button type="button" class="btn btn-success">Confirm auto renewal</button>
			<button type="button" class="btn btn-default">Buy one more year</button>
		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js"/>"></script>
	<script src="../resource/js/bootstrap.min.js"/>"></script>
	<script src="../resource/js/loginsignup.js"/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var contextPath = "${pageContext.request.contextPath}";
			var isAutorenew = ("${login.autorenew}" == "true") ? true : false;

			//onload default checked
			if (isAutorenew) {
				$("#inlineRenew01").attr("checked", "checked");
			} else {
				$("#inlineRenew02").attr("checked", "checked");
			}

			//onclick Confirm auto renewal button
			$("div[class='container']>button").eq(0).on("click", function() {
				var confirmed = confirm("You want to change auto-renewal service, are you sure?");
				if (confirmed) {
					$("form").attr("action", contextPath + "/setting/autoRenewVIPAction.action");
					console.log("Confirm auto renewal");
					$("form").submit();
				}else{
					location.reload();
				}
			});
			//onclick Buy one more year button
			$("div[class='container']>button").eq(1).on("click", function() {
				var confirmed = confirm("Buy one more year VIP by credit card, are you sure?");
				if (confirmed) {
					//send Buy one more year
					$("form").attr("action", contextPath + "/setting/renewVIPAction.action");
					console.log("Buy one more year");
					$("form").submit();
				}
			});

		});
	</script>
</body>
</html>
