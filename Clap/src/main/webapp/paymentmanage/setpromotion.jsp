<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	java.util.List<payment.model.PromoVO> promoVOs = (java.util.List<payment.model.PromoVO>) request
			.getAttribute("promoVOs");
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
/* input{  */
/*  	background-color: #337ab7;  */
/*  }  */
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
word-wrap:break-word;
	padding: 0;
	margin: 0;
}

.row {
	margin: 10px 0;
}
#successmessage{
	color: green;
	font-size: 18px;
	
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
						<div class="col-md-2">
							<input type="button" value="Add New Item" id="add" />
						</div>
						<div class="col-md-10">
							<p id="message">${message}</p>
							<p id="successmessage">${successmessage}</p>
							<s:fielderror name="promoVO.pm_discount" />
						</div>
			
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="row">
								<form
									action="${pageContext.request.contextPath}/paymentmanage/prePromoteAction.action">
									<div class="col-md-1 col-sm-1">
										<span>Search By:</span>
									</div>
									<div class="col-md-3 col-sm-5">
										Starting Date<input type="datetime" name="expireFrom" placeholder="yyyy/MM/dd HH:mm:ss"/>
									</div>
									<div class="col-md-3 col-sm-4">
										Ending Date<input type="datetime" name="expireTo" placeholder="yyyy/MM/dd HH:mm:ss"/>
									</div>
									<div class="col-md-3 col-sm-1">
										Category<br /> <select name="categoryName">
											<option value="All">All</option>
											<c:forEach var="categoryVO" varStatus="index"
												items="${categoryVOs}">
												<option value="${categoryVO.name}">${categoryVO.name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-2 col-sm-1">
										<br> <input type="submit" value="search">
									</div>

								</form>
							</div>
						</div>
					</div>


					<div class="row" id="insertform">
						<div class="col-md-12">
							<form
								action="${pageContext.request.contextPath}/paymentmanage/setPromoteAction.action"
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
													<c:forEach var="categoryVO" varStatus="index"
														items="${categoryVOs}">
														<option value="${categoryVO.name}">${categoryVO.name}</option>
													</c:forEach>
											</select></td>
											<td><input type="datetime" name="promoVO.pm_expire" /></td>
											<td><input type="text" name="promoVO.pm_title" /></td>
											<td><input type="text" name="promoVO.pm_discount" /></td>
											<td><input type="submit" value="add" /> <input
												id="insertCancel" type="reset" value="cancel" /></td>
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
											<td><label>${promoVO.pm_code}</label> <input type="text"
												class="form-control" name="promoVO.pm_code"
												value="${promoVO.pm_code}" style="display: none"></td>
											<td><label>${promoVO.categoryVO.name}</label> <input
												type="text" class="form-control" name="category"
												value="${promoVO.categoryVO.name}" style="display: none">
											</td>
											<td><label>${promoVO.pm_expire}</label> <input
												type="text" class="form-control" name="promoVO.pm_expire"
												value="${promoVO.pm_expire}" style="display: none">

											</td>
											<td class="title"><label>${promoVO.pm_title}</label> <input
												type="text" class="form-control" name="promoVO.pm_title"
												value="${promoVO.pm_title}" style="display: none"></td>
											<td><label>${promoVO.pm_discount}</label> <input
												type="text" class="form-control" name="promoVO.pm_discount"
												value="${promoVO.pm_discount}" style="display: none">
											</td>
											<td><input class="update" type="button" value="update"
												style="background-color: #337ab7; color: white;" /> <input
												type="button" value="cancel"
												onclick="window.location.reload()" /></td>

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
		$("#example td>label").on("click", function() {
			$(this).hide();
			$(this).next().show().focus();
		});
		$("#example td>input[type=text]").on("change", function() {
			$(this).prev().html($(this).val());
		}).on("blur", function() {
			$(this).hide();
			$(this).prev().show();
		});
		$(document)
				.ready(
						function() {
							var table = $('#example').DataTable();
							$("#add").click(function() {
								$("#insertform").css("display", "table-row");

							});

							$("#insertCancel").click(function() {
								$("#insertform").css("display", "none");
								$("#insertform input[type=text]").val = "";
							});

							$("#message").fadeOut(10000);
							$("#successmessage").fadeOut(10000);
							$('.update')
									.click(
											function() {

												var dataSend = "promoVO.pm_code="
														+ $(this).parent()
																.parent()
																.children().eq(
																		0)
																.children()
																.text()
														+ "&category="
														+ $(this).parent()
																.parent()
																.children().eq(
																		1)
																.children()
																.text()
														+ "&promoVO.pm_expire="
														+ $(this).parent()
																.parent()
																.children().eq(
																		2)
																.children()
																.text()
														+ "&promoVO.pm_title="
														+ encodeURI($(this)
																.parent()
																.parent()
																.children().eq(
																		3)
																.children()
																.text())
														+ "&promoVO.pm_discount="
														+ $(this).parent()
																.parent()
																.children().eq(
																		4)
																.children()
																.text();

												console.log(dataSend);
												// 												sendPostRequestProduct(
												// 														"${pageContext.request.contextPath}/payment/setPromoteAction.action?",
												// 														dataSend);

												$
														.ajax({
															type : "POST",
															url : "${pageContext.request.contextPath}/paymentmanage/setPromoteAction.action",
															data : dataSend
														});

											});

						});
	</script>
</body>
</html>

