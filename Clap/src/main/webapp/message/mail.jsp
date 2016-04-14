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

</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">
			<form class="form-horizontal" action='<c:url value=""/>' method="POST">
				<div class="table-responsive">
					<table class="table table-bordered table-striped table-highlight">
						<tr class="row">
						<th colspan="4" class="col-md-12">Mail Box</th>
						</tr>
						<tr class="row">
						<th class="col-md-1"><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span></th>
						<th class="col-md-2">From</th>
						<th class="col-md-7">Subject</th>
						<th class="col-md-2">Time</th>
						</tr>
						<c:forEach var="row" items="${messages}">
						 <tr>
						  <td>
						   <div class="checkbox">
							<label> 
								<input type="checkbox" id="blankCheckbox" value="${row.messageId}" aria-label="...">
							</label>
						   </div>
						  </td>
						  <td>${row.sender}</td>
						  <td>${row.subject}</td>
						  <td>${row.date}</td>
						 </tr>
						</c:forEach>
					

					</table>
				</div>
				<input type="text" name="email" value="${login.email}" style="display:none;">
			</form>
			<form role="form">
				<button class="btn btn-default" type="button">Delete messages</button>
			</form>



		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js"/></script>
	<script src="../resource/js/bootstrap.min.js"/></script>
	<script src="../resource/js/loginsignup.js"/></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var submitBtn = $("form > button");
			var formToAction = $("form.form-horizontal");
			
			//onclick delete button
			$("form button").eq(0).on("click", function() {
				console.log("delete sent");
				formToAction.submit();
			});

		});
	</script>
</body>
</html>
