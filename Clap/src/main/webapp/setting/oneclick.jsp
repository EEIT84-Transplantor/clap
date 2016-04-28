<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=clap"
	user="sa" password="passw0rd" />
<sql:query dataSource="${snapshot}" var="result">
SELECT * from hospital;
</sql:query>
<sql:query dataSource="${snapshot}" var="creditcards">
SELECT * from creditcard;
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<style type="text/css">
th,td{
background:#000;
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
				<div class="col-md-2"><jsp:include page="/sidenav.jsp" /></div>
				<div class="col-md-10" style="padding-left: 20px;">
					<h2>One click setting</h2>

					<form id="yesorno" class="form-horizontal" action='<c:url value="/setting/oneClickAction.action"/>' method="POST">

						<p>Do you want to activate OneClick shopping</p>

						<c:if test="${not login.oneclick}">
						<div class="radio">
							<label><input type="radio" name="oneclick" value="true">Yes</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="oneclick" value="false" checked="checked">No</label>
						</div>
						</c:if>
						<c:if test="${login.oneclick}">
						<div class="radio">
							<label><input type="radio" name="oneclick" value="true" checked="checked">Yes</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="oneclick" value="false" >No</label>
						</div>
						</c:if>
						<div class="table" style="margin-top:20px;">
						
							<table class="table table-bordered table-striped" hidden="true">

							
								<tr>
									<th>Deliver to</th>
									<th>Phone</th>
									<th>Hospital</th>
									<th>Credit Card</th>
								</tr>
								<tr>
									<td>${login.name}<input type="text" style="color: black; display: none;" value="${login.email}" readonly="readonly" name="email">
									</td>

									<td><input type="text" style="color: black; width:100%;" value="${login.phone}" name="phone"></td>
									<td><select style="color: black; max-width:300px;" name="id">
											<c:forEach var="row" items="${result.rows}">
												<option value="${row.hospital_id}">${row.hospital_name}</option>
											</c:forEach>
									</select></td>
									<td><select style="color: black;" name="number">
											<c:forEach var="card" items="${cards}">
												<option value="${card.creditCardPK.cc_number}">${card.creditCardPK.cc_number}</option>
											</c:forEach>
									</select></td>
								</tr>
							</table>
						</div>
					</form>
					<form role="form">
						<button class="btn btn-default" type="button" style="display: none;">Submit</button>
						<button class="btn btn-default" type="button" style="display: none;">Reset</button>
					</form>
				</div>

			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js"></script>
	<script src="../resource/js/bootstrap.min.js"></script>
	<script src="../resource/js/loginsignup.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var oneClickYes = $("input[type='radio']").eq(0);
			var oneClickNo = $("input[type='radio']").eq(1);
			var submitBtn = $("form > button");
			var ajaxUrl = "${pageContext.request.contextPath}" + "/setting/oneClickAction.action";
			var formToAction = $("form.form-horizontal");

			oneClickYes.on("change", function() {
				$("table").fadeIn();
				submitBtn.fadeIn();
			});
			oneClickNo.on("change", function() {
				var phone = $("input[type='text']").val();
				var hospital = $("select option:selected").eq(0).text();
				var creditcard = $("select option:selected").eq(1).text();
				$("table").fadeOut();
				submitBtn.fadeOut();
				var formTitle = $("#tableTitle");
				formTitle.html("One Click Setting");
				$.ajax({
					url:ajaxUrl,
					method:"POST",
					data:$("#yesorno").serialize()
				}).done(function(msg){
					console.log(msg);
				});
// 				formToAction.submit();
			});

			//onclick submit button
			$("form button").eq(0).on("click", function() {
				console.log("submit");
				var formTitle = $("#tableTitle");
				formTitle.html("One Click Setting: info updated");
				formToAction.submit();

			});
			//onclick reset button
			$("form button").eq(1).on("click", function() {
				alert("function not yet done");
			});

		});
	</script>
</body>
</html>
