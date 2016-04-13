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
<link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/customer.css" rel="stylesheet">

</head>
<body>
    <header>
	 <jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container-fulid">
			<div class="row">
				
			</div>
		</div>
	</section>

	<footer>
	<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.12.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>

</body>
</html>

