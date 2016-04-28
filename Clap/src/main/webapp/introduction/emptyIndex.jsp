<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/customer.css"
	rel="stylesheet">

</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container-fulid">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-2">
						<img width="100px" src="http://vignette3.wikia.nocookie.net/pokemon/images/1/16/025Pikachu_OS_anime_10.png/revision/20150102074354" />
					</div>
					<div class="col-md-10"></div>
				</div>
				<div class="row">
					<div class="col-md-10"></div>
					<div class="col-md-2">
			
					<img width="100px" src="http://gb.cri.cn/mmsource/images/2010/11/01/55/5295296331263085443.jpg" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
					<img width="100px" src="http://img.chinatimes.com/newsphoto/2015-10-20/656/20151020003824.jpg" />
					
					</div>
					<div class="col-md-10"></div>
				</div>
				<div class="row">
					<div class="col-md-10"></div>
					<div class="col-md-2"></div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script
		src="${pageContext.request.contextPath}/resource/js/jquery-1.12.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>

</body>
</html>

