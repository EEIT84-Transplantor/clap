
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
<!-- <link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet"> -->
<!-- <link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet"> -->
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>

	</select>
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript">
		$(function() {

			var dogs = {
				"dog1.name" : "may",
				"dog2.name" : "day",	
			};
			$.ajax({
				url : "<c:url value='/test/test.action'/>",
				data : dogs,
			})
			console.log(dogs);

		})
	</script>

</body>
</html>






















