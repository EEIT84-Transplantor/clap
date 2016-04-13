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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<style type="text/css">
input, select {
	background-color: black;
}

#table1 {
	margin: 20px;
}

#insertform {
	display: none;
}

#hi {
	display: none;
}

#message {
	color: red;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>
	<c:set var="productVOs" value="{2000,3000,20300}" />
	<section id="wrap">
		<div class="container-fulid">
			<div class="row">
				<div class="col-md-2">side-nav:sub-menu</div>
				<div class="col-md-10">
					<div class="row">

						<div class="col-md-1 col-sm-1">
							<input type="button" value="Add New Item" id="add" />
						</div>
						<div class="col-md-11 col-sm-11">
							<div class="row">
								<form>
									<div class="col-md-1 col-sm-1">
										<span>Search By:</span>
									</div>
									<div class="col-md-3 col-sm-5">
										Starting Date<input type="datetime" />
									</div>
									<div class="col-md-3 col-sm-4">
										Ending Date<input type="datetime" />
									</div>
									<div class="col-md-3 col-sm-1">
										Category<input type="text" />
									</div>
									<div class="col-md-2 col-sm-1">
										<input type="submit" value="search">
									</div>

								</form>
							</div>
						</div>
					</div>
					<div class="row" id="table1">
						<div class="col-md-12">
							<form id="insertform"
								action="${pageContext.request.contextPath}/promotion/SetProductAction.action"
								method="POST">
								<table class="table">
									<thead>
										<tr>
											<th>Promotion Code</th>
											<th>Category</th>
											<th>Expire</th>
											<th>Title</th>
											<th>Discount</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="text" value="" name="promoVO.code" /></td>
											<td><select id="category">
													<option value="Lung">Lung</option>
													<option value="Liver">Liver</option>
													<option value="Kidney">Kidney</option>
											</select>
											<td><input type="text" name="promoVO.expire" /></td>
											<td><input type="text" name="promoVO.title" /></td>
											<td><input type="text" name="promoVO.discount" /></td>
											<td><input id="submitInsert" type="submit" value="add" /><input
												id="insertCancel" type="button" value="cancel" /></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<p id="message"></p>
					<div class="row">
						<div class="col-md-12">
							<table id="example" class="table">
								<thead>
									<tr>
										<th>Promotion Code</th>
										<th>Category</th>
										<th>Expire</th>
										<th>Title</th>
										<th>Discount</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<!-- 	        <tr id="hi"> -->
									<!-- 	            <td><input type="text"/></td>  -->
									<!--             	<td><input id="insertConfirm" type="submit" value="add"/><input id="insertCancel" type="button" value="cancel"/></td> -->
									<!--             </tr> -->
									<c:forEach var="promoVO" varStatus="index" items="${promoVOs}">
										<tr>
											<td>${promoVO.code}</td>
											<td>${categoryNames[index.count-1]}</td>
											<td>${promoVO.expire}</td>
											<td>${promoVO.title}</td>
											<td>${promoVO.discount}</td>
											<td><input id="submitInsert1" type="submit" value="add" />
												<input type="button" value="cancel" /></td>

										</tr>


									</c:forEach>
								</tbody>
							</table>
						</div>

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
		src="${pageContext.request.contextPath}/resource/js/jquery-1.12.2.min.js"/></script>
	<script
		src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"/></script>
	<script type="text/javascript"
		src="//code.jquery.com/jquery-1.12.0.min.js"/></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"/></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"/></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var table = $('#example').DataTable();

							$("#add").click(function() {
								$("#insertform").css("display", "table-row");

							});

							$("#insertCancel").click(function() {
								$("#insertform").css("display", "none");
								// 			$('input[name="promoVO.code"]').html('');
								// 			$('input[name="categoryNames"]').html('');
								// 			$('input[name="promoVO.expire"]').html('');
								// 			$('input[name="promoVO.title"]').html('');
								// 			$('input[name="promoVO.discount"]').html('');
							});
							$('#submitInsert').click(function() {
								alert("hhihi");
							});
							$('tbody tr td').click(function() {
								var data = table.cell(this).data();
								console.log(data);
								if (!$(this).is(':last-child')) {
									$(this).attr("contenteditable", 'true');
								}

							});
							// 		$('tbody tr td').blur(function(){
							// 			if(!$(this).is(':last-child')){
							// 				$(this).attr("contenteditable",'true');
							// // 				$(this).siblings(":last");	
							// 			}

							// 		});

							$('#submitInsert1')
									.click(
											function() {
												alert("hello");
												var data = table
														.row(
																$(this)
																		.parent()
																		.parent()
																		.children(
																				':first'))
														.data();
												var dataSend = "promoVO.code="
														+ data[0] + "category="
														+ data[1]
														+ "promoVO.expire="
														+ data[2]
														+ "promoVO.title="
														+ data[3]
														+ "promoVO.discount="
														+ data[4];
												sendPostRequestProduct(
														"${pageContext.request.contextPath}/product/UpdateProductAction.action?",
														dataSend);

											});
							function sendPostRequestProduct(url, data) {
								request = new XMLHttpRequest();
								request.onreadystatechange = doReadyStateChange;
								request.open("POST", url, true);
								console.log(url);
								request.setRequestHeader("Content-Type",
										"application/x-www-form-urlencoded");
								request.send(data);
								console.log(url + '33');
							}
							;
							function doReadyStateChange() {
								if (request.readyState == 4) {
									if (request.status == 200) {
										processJSON(request.responseText);
									} else {
										console.log("Error Code:"
												+ request.status + ", "
												+ request.statusText);
									}
								}
							}
						});
	</script>
	</ body>
</html>

