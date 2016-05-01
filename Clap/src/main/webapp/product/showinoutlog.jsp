<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<jsp:include page="/sidenavadmin.jsp" />
				</div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<a href="${pageContext.request.contextPath}/product/downloadInOutLogExcel.action">Export as Excel</a>
						</div>			
					</div>
				</div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<table id="example" class="table">
								<thead>
									<tr>
										<th>Log ID</th>
										<th>Inv. ID</th>
										<th>P. ID</th>
										<th>In Quant.</th>
										<th>Out Quant.</th>
										<th>Order ID</th>
										<th>Manu. Date</th>
										<th>Exp. Date</th>
										<th>Destination</th>
										<th>Date</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="inOutLogVO" varStatus="index" items="${inOutLogVOs}">
										<tr>
											<td><label>${inOutLogVO.id}</label></td>
											<td><label>${inOutLogVO.inventory_id}</label>
											</td>
											<td><label>${inOutLogVO.product_id}</label> 
											</td>
											<td><label>${inOutLogVO.inQuantity}</label></td>
											<td><label>${inOutLogVO.outQuantity}</label>
											</td>
											<td><label>${inOutLogVO.orderdetail_id}</label>
											</td>
												<td><label>${inOutLogVO.manufactureDate}</label>
											</td>
												<td><label>${inOutLogVO.expiryDate}</label>
											</td>
												<td><label>${inOutLogVO.destination}</label>
											</td>
											<td><label>${inOutLogVO.date}</label>
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