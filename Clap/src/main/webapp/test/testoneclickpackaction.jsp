<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="<c:url value="/resource/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resource/css/shopping.css"/>"
	rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>test</h1>
			</div>
		</div>
	</div>
	<footer><jsp:include page="/footer.jsp" /></footer>
	<!-- 載入js -->
	<script type="text/javascript"
		src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript">
		var dataObj = {
			"productList" : [ {
				"product_id" : "123",
			}, {
				"product_id" : "123",
			}, {
				"product_id" : "123",
			}, {
				"product_id" : "123",
			} ]
		};

		var data1 = JSON.stringify(dataObj);

		$(function() {

		});

		function oneclick() {

			console.log(dataObj);
			console.log(data1);

			$.ajax({
				url : "<c:url value='/simulator/oneclickPackAction.action'/>",

				data : data1,
				method : "POST",
				contentType : "application/json",

			}).done(function(result) {
				console.log(result);
			})
		}

		function addcart() {

			console.log(dataObj);
			console.log(data1);

			$.ajax({

				url : "<c:url value='/simulator/AddToCartAction.action'/>",
				data : data1,
				method : "POST",
				contentType : "application/json",

			}).done(function(result) {
				console.log(result);
			});
		}

	</script>
</body>
</html>
