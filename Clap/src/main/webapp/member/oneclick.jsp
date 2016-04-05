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
<link href="../resource/css/bootstrap.min.css" rel="stylesheet">
<link href="../resource/css/customer.css" rel="stylesheet">

</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">
			<form role="form" action="" method="POST">
				<label for="oneclick">Do you want to activate OneClick shopping</label>
				<div class="radio">
					<label><input class="form-control" name="oneclick" type="radio" value="1">Yes</label>
				</div>
				<div class="radio">
					<label><input class="form-control" name="oneclick" type="radio" value="0" checked="checked">No</label>
				</div>
				
			</form>
			<br>
			<table class="table table-bordered" hidden="true">
			  <tr>
			 	<th colspan="4">One Click Setting</th>			 	
			 </tr>
			  <tr>
			 	<th>Deliver to</th>		
			 	<th>Phone</th>	
			 	<th>Hospital</th>	
			 	<th>Credit Card</th>		 	
			 </tr>
			  <tr>
			 	<td>${memberVO.name}</td>
			 	<td><input type="text" style="color:black;" value="${memberVO.phone}"></td>
			 	<td><select style="color:black;">
			 		<option>NTUH1</option>
			 		<option>NTUH2</option>
			 		<option>NTUH3</option>
			 		<c:forEach var="row" items="">
			 		<option></option>
			 		</c:forEach>
			 	</select></td>
			 	<td><select style="color:black;">
			 		<option>VISA 1231...</option>
			 		<option>VISA 1231...</option>
			 		<c:forEach var="row" items="${creditCards}">
			 		<option value="${row.cc_number}${row.cc_number}"></option>
			 		</c:forEach>
			 	</select></td>
			 </tr>
			</table>
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
			oneClickYes.on("change", function(){
				$("table").fadeIn()
				
				});
			oneClickNo.on("change", function(){
				$("table").fadeOut()
				
				});
			
			//onclick submit button
			$("form button").on("click", function() {
				console.log();
				console.log();
				$("form").submit();
			});
			$("form").submit(function(event) {
				if ($("input").val() == "") {
					console.log("Submit error");
					event.preventDefault();
				} else {
					console.log("Submit done");
					return;
				}
			});
		});
	</script>
</body>
</html>
