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
<style>
.btn{
width:100%;
padding:50px 0;
background:#47BED9;
}
button span{
display:block;
margin-bottom:20px;
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
				<div class="col-md-2"><jsp:include page="/sidenav.jsp" /></div>
				<div class="col-md-10">
					<h2>Setting account </h2>
					<p style="margin-bottom:30px;">texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext</p>

					<div class="row" style="padding-left: 15px;">
						<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-lg" >
							<span class="glyphicon glyphicon-user" aria-hidden="true" style="font-size: 50px;"></span><p>Payment Manage</p>
						</button>
						</div>
						<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-lg ">
							<span class="glyphicon glyphicon-wrench" aria-hidden="true" style="font-size: 50px;"></span><p>Change Password</p>
						</button>
						</div>
						<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-lg ">
							<span class="glyphicon glyphicon-cog" aria-hidden="true" style="font-size: 50px;"></span><p>Change Setting</p>
						</button>
						</div>
						<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-usd" aria-hidden="true" style="font-size: 50px;"></span><p>Set Oneclick Shopping</p>
						</button>
						</div>
					
					</div>
					
					<div class="row" style="padding-left: 15px;  margin-top:20px;">
					<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-star-empty" aria-hidden="true" style="font-size: 50px;"></span><p>Activate VIP</p>
						</button>
						</div>
						<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-size: 50px;"></span><p>Mail Box</p>
						</button>
						</div>
						
					</div>


				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js" /></script>
	<script src="../resource/js/bootstrap.min.js" /></script>
	<script src="../resource/js/loginsignup.js" /></script>
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
				location.reload();
			});
			//onclick mailbox button
			$("button").eq(6).on("click", function() {
				location.reload();
			});
		});
	</script>
</body>
</html>
