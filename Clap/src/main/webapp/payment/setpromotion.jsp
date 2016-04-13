<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% java.util.List<payment.model.PromoVO> promoVOs = (java.util.List<payment.model.PromoVO>)request.getAttribute("promoVOs"); 
    if(promoVOs==null){
    	response.sendRedirect(request.getContextPath()+"/payment/prePromoteAction.action");
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
	<section id="wrap">
		<div class="container-fulid">
			<div class="row">
				<div class="col-md-2">side-nav:sub-menu</div>
				<div class="col-md-10">
					<div class="row" >
						<div class="col-md-12">
							<input type="button" value="Add New Item" id="add" />
						</div>
					</div>
					<div class="row">					
						<div class="col-md-12 col-sm-12">
							<div class="row">
								<form action="${pageContext.request.contextPath}/payment/prePromoteAction.action">
									<div class="col-md-1 col-sm-1">
										<span>Search By:</span>
									</div>
									<div class="col-md-3 col-sm-5">
										Starting Date<input type="datetime" name="expireFrom"/>
									</div>
									<div class="col-md-3 col-sm-4">
										Ending Date<input type="datetime" name="expireTo" />
									</div>
									<div class="col-md-3 col-sm-1">
										Category<input type="text" name="categoryName" />
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
							<p>${message}</p>
						</div>
					</div>
					<div class="row" id="table1">
						<div class="col-md-12">
							<form id="insertform"
								action="${pageContext.request.contextPath}/payment/setPromoteAction.action"
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
											<td><input type="text" name="promoVO.pm_code" /></td>
											<td><select name="category">
												<c:forEach var="categoryVO" varStatus="index" items="${categoryVOs}">
													<option value="${categoryVO.name}">${categoryVO.name}</option>
												</c:forEach>
											</select></td>
											<td><input type="datetime" name="promoVO.pm_expire" /></td>
											<td><input type="text" name="promoVO.pm_title" /></td>
											<td><input type="number" name="promoVO.pm_discount" /></td>
											<td><input type="submit" value="add" /><input
												id="insertCancel" type="button" value="cancel"/></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
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
									<c:forEach var="promoVO" varStatus="index" items="${promoVOs}">
										<tr>
											<td>
												<label>${promoVO.pm_code}</label>
						    					<input type="text" class="form-control" name="promoVO.pm_code" value="${promoVO.pm_code}" style="display:none">
					    					</td>
											<td>
												<label>${promoVO.categoryVO.name}</label>
						    					<input type="text" class="form-control" name="category" value="${promoVO.categoryVO.name}" style="display:none">
											</td>
											<td>
												<label>${promoVO.pm_expire}</label>
						    					<input type="text" class="form-control" name="promoVO.pm_expire" value="${promoVO.pm_expire}" style="display:none">
											
											</td>
											<td>
												<label>${promoVO.pm_title}</label>
						    					<input type="text" class="form-control" name="promoVO.pm_title" value="${promoVO.pm_title}" style="display:none">
											</td>
											<td>
												<label>${promoVO.pm_discount}</label>
						    					<input type="text" class="form-control" name="promoVO.pm_discount" value="${promoVO.pm_discount}" style="display:none">
						    				</td>
											<td><input id="submitInsert1" type="button" value="update" />
												<input type="button" value="cancel"  onclick="window.location.reload()" /></td>

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

							$("#add").click(function() {
								$("#insertform").css("display", "table-row");

							});

							$("#insertCancel").click(function() {
								alert("hi");
								window.location.reload();
							});
							$('#submitInsert').click(function() {
								alert("hhihi");
							});
							$("#example td>label").on("click",function(){
								$(this).hide();
								$(this).next().show().focus();
							});
							
							$("#example td>input[type=text]").on("change",function(){
								$(this).prev().html($(this).val());
							}).on("blur",function(){
								$(this).hide();
								$(this).prev().show();
							});

							$('#submitInsert1')
									.click(
											function() {
												alert("hello");
												var data = table
														.row($(this)
														.parent()
														.parent()
														.children(':first'))
														.data();
												var dataSend = "promoVO.pm_code="
														+ data[0].substring(data[0].indexOf("<label>")+7,data[0].indexOf("</label>")) + "&category="
														+ data[1].substring(data[1].indexOf("<label>")+7,data[1].indexOf("</label>"))
														+ "&promoVO.pm_expire="
														+ data[2].substring(data[2].indexOf("<label>")+7,data[2].indexOf("</label>"))
														+ "&promoVO.pm_title="
														+ encodeURI(data[3].substring(data[3].indexOf("<label>")+7,data[3].indexOf("</label>")))
														+ "&promoVO.pm_discount="
														+ data[4].substring(data[4].indexOf("<label>")+7,data[4].indexOf("</label>"));
												console.log(dataSend);
// 												sendPostRequestProduct(
// 														"${pageContext.request.contextPath}/payment/setPromoteAction.action?",
// 														dataSend);

												$.ajax({
													   type: "POST",
													   url: "${pageContext.request.contextPath}/payment/setPromoteAction.action",
													   data: dataSend,
													   success: function(msg){
													     alert('wow'+msg);
													   }
												});
											
											
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
							function processJSON(data) {
								var json = JSON.parse(data);
							    var isChanged = json[0].isChanged;
							    var message = json[0].message;
							    $('#message').html(message);
							  
							}
						});
	</script>
	</body>
</html>

