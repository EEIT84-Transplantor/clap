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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/shopping.css"/>" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="creditCard"></div>
			</div>
			<div class="col-md-3">
				<div class="creditCard"></div>
			</div>
			<div class="col-md-3">
				<div class="creditCard"></div>
			</div>
			<div class="col-md-3">
				<div class="creditCard"></div>
			</div>
			<div class="col-md-3">
				<div class="addCard_plus">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					ADD NEW
				</div>
			</div>
			<div class="col-md-3">
				<div class="newcard">
					<form id="addCreditForm">
						<table>
							<tr>
								<td><label>Number</label></td>
								<td><input type="text" name="creditCardVO.creditCard.cc_number" value="6011226470739645" /></td>
							</tr>
							<tr>
								<td><label>Good thru</label></td>
								<td><input type="text" name="creditCardVO.cc_goodthru" value="11/22" /></td>
							</tr>
							<tr>
								<td><label>CVV</label></td>
								<td><input type="text" name="creditCardVO.cc_cvv" value="333" /></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="button" value="add" id="addCreditCard"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-6"></div>
			<div class="col-md-4">
				<table class="htable">
					<tr>
						<td>總價</td>
						<td>99999</td>
					</tr>
				</table>
			</div>
			<div class="col-md-2">
				<input type="button" class="btn btn-default btn-block" value="付款">
			</div>
		</div>
	</div>
	<footer><jsp:include page="/footer.jsp" /></footer>
	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>

</body>
</html>
