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
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<td>order id</td>
							<td>time</td>
							<td>total</td>
							<td>order status</td>
							<td>cancel</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="orderVO" items="${orderList}">
							<tr>
								<td><a href="<c:url value='/shopping/orderDetailAction.action?orderId=${orderVO.id}'/>">${orderVO.id}</a></td>
								<td>${orderVO.time}</td>
								<td>${orderVO.total}</td>
								<td>${orderVO.status}</td>
								<td><c:if test="${orderVO.status==1}">
										<input type="button" value="delete" class="delete" />
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript">
		$(function() {

			var deleteOrderAction = "<c:url value='/shopping/deleteOrderAction.action'/>"

			//listener 刪除
			$(".delete").click(function() {
				var button = $(this);
				var orderId = $(this).parent().siblings().eq(0).text();
				var result;
				$.ajax({
					url : deleteOrderAction,
					data : {
						"orderId" : orderId
					},
				}).done(function(result) {
					
					if (result == "true") {
						$(button).parent().parent().remove();
					}
				})
			})
		})
	</script>
</body>
</html>
