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
<link href="../resource/css/silderbanner.css" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<td>刪除</td>
								<td>商品</td>
								<td>數量</td>
								<td>價格</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cartVO" items="${cartVOs}">
								<tr>${cartVO.}</tr>
								
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-8"></div>
				<div class="col-md-4">
					<table class="table">
						<tr>
							<td>商品數</td>
							<td></td>
							<td>10</td>
						</tr>
						<tr>
							<td>原價</td>
							<td></td>
							<td>10000</td>
						</tr>
						<tr>
							<td>禮物卡</td>
							<td></td>
							<td>-1000</td>
						</tr>
						<tr>
							<td>prome</td>
							<td><select class="form-control">
									<option>A</option>
									<option>B</option>
									<option>C</option>
								</select></td>
							<td>-2000</td>
						</tr>
						<tr>
							<td>總價</td>
							<td></td>
							<td>7000</td>
						</tr>
					</table>
				</div>
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<input type="button" class="btn btn-default btn-block" value="結帳">
				</div>
			</div>
		</div>
	</section>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="../resource/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="../resource/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resource/js/json2.js"></script>

</body>
</html>
