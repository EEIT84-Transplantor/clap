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
<link href="../resource/css/bootstrap.min.css" rel="stylesheet">
<link href="../resource/css/customer.css" rel="stylesheet">

</head>
<body>

	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">
			<form class="form-horizontal" action='<c:url value="/setting/oneClickAction.action"/>' method="POST">
				<div class="table-responsive">
					<table class="table table-bordered table-striped table-highlight" hidden="true">
					<label for="oneclick">Do you want to activate OneClick shopping</label>
<!-- 自己刪 -->
<!-- 					<div class="radio"> -->
<!-- 						<label> Yes <input class="form-control" name="oneclick" type="radio" value="true"> -->
<!-- 						</label> -->
<!-- 					</div> -->
<!-- 					<div class="radio"> -->
<!-- 						<label> <input class="form-control" name="oneclick" type="radio" value="false" checked="checked"> No -->
<!-- 						</label> -->
<!-- 					</div> -->
<!-- 自己刪 -->
<form role="form">
    <div class="radio">
      <label><input type="radio" name="oneclick" value="true">Yes</label>
    </div>
    <div class="radio">
      <label><input type="radio" name="oneclick" value="false" checked="checked">No</label>
    </div>
  </form>

          











					<br>

					<tr>
						<th colspan="4" id="tableTitle">One Click Setting</th>
					</tr>
					<tr>
						<th>Deliver to</th>
						<th>Phone</th>
						<th>Hospital</th>
						<th>Credit Card</th>
					</tr>
					<tr>
						<td>${login.name}
						<input type="text" style="color: black;display:none;" value="${login.email}" readonly="readonly" name="email">
						</td>
						
						<td><input type="text" style="color: black;" value="${login.phone}" name="phone"></td>
						<td><select style="color: black;" name="id">
								<c:forEach var="row" items="${result.rows}">
									<option value="${row.hp_id}">${row.hp_name}</option>
								</c:forEach>
						</select></td>
						<td><select style="color: black;" name="number">
								<c:forEach var="row" items="${creditcards.rows}" >
									<option value="${row.cc_number}">${row.cc_number}</option>
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
				formToAction.submit();				
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
