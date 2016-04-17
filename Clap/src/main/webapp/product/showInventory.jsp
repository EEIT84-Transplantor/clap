<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	java.util.List<payment.model.PromoVO> promoVOs = (java.util.List<payment.model.PromoVO>) request.getAttribute("promoVOs");
	String message = (String) request.getAttribute("message");
	System.out.println("ggg" + message);
	request.setAttribute("message", message);
	if (promoVOs == null) {
		response.sendRedirect(request.getContextPath() + "/paymentmanage/prePromoteAction.action");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="../resource/css/bootstrap.min.css" rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../resource/css/customer.css" rel="stylesheet">
<style type="text/css">
input, select {
	background-color: black;
}

#insertform {
	display: none;
}

#hi {
	display: none;
}

#message {
	color: red;
	font-size: 18px;
}

.title {
	width: 80px;
	word-break: break-all;
	padding: 0;
	margin: 0;
}
.row{
margin:10px 0;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>
	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<jsp:include page="/sidenav.jsp" />
				</div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<table id="example" class="table">
								<thead>
									<tr>
										<th>Inventory ID</th>
										<th>Product ID</th>
										<th>Quantity</th>
										<th>Manufacture Date</th>
										<th>Expire Date</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="inventoryVO" varStatus="index" items="${inventoryVOs}">
										<tr>
											<td><label>${inventoryVO.id}</label></td>
											<td><label>${inventoryVO.product_id}</label>
											</td>
											<td><label>${inventoryVO.quantity}</label> 
											</td>
											<td><label>${inventoryVO.manufactureDate}</label> </td>
											<td><label>${inventoryVO.expiryDate}</label>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
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
	<script type="text/javascript"
		src="//code.jquery.com/jquery-1.12.0.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var table = $('#example').DataTable();
							
						});
	</script>
</body>
</html>