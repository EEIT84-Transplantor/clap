<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.Map"%>
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
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2">side-nav:sub-menu</div>
				<div class="col-md-10">
					<h2>PRODUCT</h2> <!-- 該頁標題  -->
					<!-- 
                                                                    內容可以寫這裡
                                                                    



                      -->
					
					
				</div><!-- row -->
			</div><!-- container -->
		</div><!-- wrap -->
	</section>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="../resource/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="../resource/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resource/js/json2.js"></script>

</body>
</html>
