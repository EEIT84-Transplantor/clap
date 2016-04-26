<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>

	<section id="wrap">
		<div class="row">
			<div class="col-md-12" >
				<h3 style="text-align:center;font-size:30px;">Oops!</h3>
				<p style="text-align:center;font-size:20px;">We can't seem to find the page you're looking for.</p>
			</div>
		</div>

	</section>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/codex-fly.js"/>"></script>
</body>
</html>
