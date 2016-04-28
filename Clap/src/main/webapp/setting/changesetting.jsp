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
				<div class="col-md-2"><jsp:include page="/sidenav.jsp" /></div>
				<div class="col-md-10">
				<h2>Change setting</h2>
			<form role="form" action="<c:url value="/setting/changeSettingAction"/>" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<s:textfield class="form-control" name="email" type="text" label="Email" readonly="true" value="%{#session.login.email}" />
				</div>
				<div class="form-group">
					<s:textfield class="form-control" name="name" type="text" label="Name" value="%{#session.login.name}"/>
				</div>
				<div class="form-group">
					<s:textfield class="form-control" name="phone" type="text" label="Phone" value="%{#session.login.phone}" errorPosition="bottom"/>
				</div>
				<div class="form-group">
					<s:file class="form-control" name="photo" label="Photo" errorPosition="bottom"/>
				</div>
				<button class="btn btn-default" type="button">Submit</button>
			</form>
		</div></div>
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
			
			//onclick submit button
			$("form button").on("click", function() {
				$(this).parent().submit();
			});
			
			//errorMessage color red
			$("span.errorMessage").css("color","white").css("text-shadow","0px 0px 1px grey");
			
		});
	</script>
</body>
</html>
