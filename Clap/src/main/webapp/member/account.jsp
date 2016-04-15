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
			<div class="row">
			<div class="center-block" style="width:60%;">
			
				<div class="row">
				<div class="col-md-1"></div>
				<button type="button" class="btn btn-primary btn-lg col-md-4">Payment Manage</button>
				<div class="col-md-2"></div>
				<button type="button" class="btn btn-default btn-lg col-md-4">Change Password</button>
				<div class="col-md-1"></div>
				</div>
				<br>
				<div class="row">
				<div class="col-md-1"></div>
				<button type="button" class="btn btn-default btn-lg col-md-4">Change Setting</button>
				<div class="col-md-2"></div>
				<button type="button" class="btn btn-primary btn-lg col-md-4">Set Oneclick Shopping</button>
				<div class="col-md-1"></div>
				</div>
				<br>
				<div class="row">
				<div class="col-md-1"></div>
				<button type="button" class="btn btn-primary btn-lg col-md-4">Activate VIP</button>
				<div class="col-md-2"></div>
				<button type="button" class="btn btn-default btn-lg col-md-4">Mail Box</button>
				<div class="col-md-1"></div>
				</div>
				
			
			</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js"/></script>
	<script src="../resource/js/bootstrap.min.js"/></script>
	<script src="../resource/js/loginsignup.js"/></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var contextPath = "${pageContext.request.contextPath}";
			var paymentmanageUrl = contextPath + "/payment/paymentmanage.jsp";
			var passwordchangeUrl = contextPath + "/setting/passwordchange.jsp";
			var changesettingUrl = contextPath + "/setting/changesetting.jsp";
			var oneclickUrl = contextPath + "/setting/oneclick.jsp";
			var vipUrl = contextPath + "/setting/vip.jsp";
			var mailUrl = contextPath + "/message/mailbox.jsp";
			
			
			//onclick paymentmanage button
			$("button").eq(1).on("click", function() {
				location.href = paymentmanageUrl;
			});
			//onclick passwordchange button
			$("button").eq(2).on("click", function() {
				location.href = passwordchangeUrl;
			});
			//onclick changesetting button
			$("button").eq(3).on("click", function() {
				location.href = changesettingUrl;
			});
			//onclick Oneclick button
			$("button").eq(4).on("click", function() {
				location.href = oneclickUrl;
			});
			//onclick VIP button
			$("button").eq(5).on("click", function() {
				location.href = vipUrl;
			});
			//onclick mailbox button
			$("button").eq(6).on("click", function() {
				location.href = mailUrl;
			});
		});
	</script>
</body>
</html>
