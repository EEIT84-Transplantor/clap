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
			<form role="form" action="" method="POST">
				<label for="oneclick">Do you want to activate OneClick shopping</label>
				<div class="radio">
					<label>
						<input class="form-control" name="oneclick" type="radio" value="1">
						Yes
					</label>
				</div>
				<div class="radio">
					<label>
						<input class="form-control" name="oneclick" type="radio" value="0" checked="checked">
						No
					</label>
				</div>

			</form>
			<br>
			<table class="table table-bordered" hidden="true">
				<tr>
					<th colspan="4" id="tableTitle">One Click Setting</th>
				</tr>
				<tr>
					<th>Deliver to</th>
					<th>Phone</th>
					<th>Hospital</th>
					<th>Credit Card</th>
				</tr>
				<tr>
					<td>${memberVO.name}</td>
					<td>
						<input type="text" style="color: black;" value="${memberVO.phone}">
					</td>
					<td>
						<select style="color: black;">
							<option>NTUH1</option>
							<option>NTUH2</option>
							<option>NTUH3</option>
							<c:forEach var="row" items="">
								<option></option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select style="color: black;">
							<option>VISA 1231...</option>
							<option>VISA 1231...</option>
							<c:forEach var="row" items="${creditCards}">
								<option value="${row.cc_number}${row.cc_number}"></option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
			<form role="form">
				<button class="btn btn-default" type="button" style="display: none;">Submit</button>
				<button class="btn btn-default" type="button" style="display: none;">Reset</button>
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
			var oneClickYes = $("input[type='radio']").eq(0);
			var oneClickNo = $("input[type='radio']").eq(1);
			var submitBtn = $("form > button");
			var ajaxUrl = "${pageContext.request.contextPath}" + "/setting/oneClickAction.action";

			oneClickYes.on("change", function() {
				$("table").fadeIn();
				submitBtn.fadeIn();
			});
			oneClickNo.on("change", function() {
				var email = "${memberVO.email}";
				if (email == "") {
					email = "andrew@gmail.com";
				}
				var phone = $("input[type='text']").val();
				var hospital = $("select option:selected").eq(0).text();
				var creditcard = $("select option:selected").eq(1).text();
				$("table").fadeOut();
				submitBtn.fadeOut();
				$.ajax({
					method : "POST",
					url : ajaxUrl,
					data : {
						email : email,
						phone : phone,
						hospital : hospital,
						creditcard : creditcard,
						oneclick : "false"
					}
				}).done(function(msg) {
					//ajax success
					JSON.parse(msg);
					console.log("send ajax " + msg);
					var formTitle = $("#tableTitle");
					formTitle.html("One Click Setting");
				});
			});

			//onclick submit button
			$("form button").eq(0).on("click", function() {
				console.log("submit");
				var email = "${memberVO.email}";
				if (email == "") {
					email = "andrew@gmail.com";
				}
				var phone = $("input[type='text']").val();
				var hospital = $("select option:selected").eq(0).text();
				var creditcard = $("select option:selected").eq(1).text();
				//ajax to xxx.action
				$.ajax({
					method : "POST",
					url : ajaxUrl,
					data : {
						email : email,
						phone : phone,
						hospital : hospital,
						creditcard : creditcard,
						oneclick : "true"
					}
				}).done(function(msg) {
					//ajax success
					console.log("send ajax " + msg);
					var formTitle = $("#tableTitle");
					formTitle.html("One Click Setting: info updated");
				});
			});
			//onclick reset button
			$("form button").eq(1).on("click", function() {
				alert("function not yet done");
			});

		});
	</script>
</body>
</html>
