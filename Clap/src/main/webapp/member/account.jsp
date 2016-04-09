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
			<div class="row">
			<div class="center-block" style="width:60%;">
			<form role="form">
				
				<button type="button" class="btn btn-primary btn-lg ">Payment Manage</button>
				<button type="button" class="btn btn-default btn-lg ">Change Password</button>
				<button type="button" class="btn btn-primary btn-lg ">Change Setting</button>
				<button type="button" class="btn btn-default btn-lg ">Set Oneclick Shopping</button>
				<button type="button" class="btn btn-primary btn-lg ">Activate VIP</button>
				<button type="button" class="btn btn-primary btn-lg ">Mail Box</button>
				
				
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
		$(document).ready(function() {
			var contextPath = "${pageContext.request.contextPath}";
			var paymentmanageUrl = contextPath + "/payment/paymentmanage.jsp";
			var passwordchangeUrl = contextPath + "/setting/passwordchange.action";
			var changesettingUrl = contextPath + "/setting/changesetting.action";
			var oneclickUrl = contextPath + "/setting/oneclick.action";
			var vipUrl = contextPath + "/setting/vip.action";
			var mailUrl = contextPath + "/message/mailbox.jsp";
			
			
			//onclick paymentmanage button
			$("form button").eq(0).on("click", function() {
				location.href = paymentmanageUrl;
			});
			//onclick passwordchange button
			$("form button").eq(1).on("click", function() {
				location.href = passwordchangeUrl;
			});
			//onclick changesetting button
			$("form button").eq(2).on("click", function() {
				location.href = changesettingUrl;
			});
			//onclick Oneclick button
			$("form button").eq(3).on("click", function() {
				location.href = oneclickUrl;
			});
			//onclick VIP button
			$("form button").eq(4).on("click", function() {
				location.href = vipUrl;
			});
			//onclick mailbox button
			$("form button").eq(5).on("click", function() {
				location.href = mailUrl;
			});
		});
	</script>
</body>
</html>
