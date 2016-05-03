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
			
			<form class="form-horizontal" role="form" action="" method="POST" style="border:solid white;">
				<div class="form-group">
					<label class="col-md-2 control-label" for="expire">Your VIP valid until:</label> 
					<div class="col-md-10"><p class="form-control-static" name="memberVO.expire" >2016/02/29${memberVO.expire }</p></div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="autorenew">Activate auto renewal?</label> 
					<div class="col-md-10">
					<label class="radio-inline">
  					  <input type="radio" name="inlineRadioOptions" id="inlineRenew01" value="yes">Yes
					</label>
					<label class="radio-inline">
					  <input type="radio" name="inlineRadioOptions" id="inlineRenew02" value="no" checked="checked">No
					</label>
					</div>
				</div>
				
				</form>
				<br>
			<button type="button" class="btn btn-success">Confirm auto renewal</button>
			<button type="button" class="btn btn-default">Buy one more year</button>
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
			var isRenewal = false;
			//onchange for click auto-renewal
			$("#inlineRenew01").on("change",function(){
				$("div[class='container']>button").eq(1).fadeOut();	
				isRenewal = true;
			});
			//onchange for cancel auto-renewal
			$("#inlineRenew02").on("change",function(){
				$("div[class='container']>button").eq(1).fadeIn();
				isRenewal = false;
			});
			
			//onclick Confirm auto renewal button
			$("div[class='container']>button").eq(0).on("click", function() {
				
				
				if(isRenewal){
					var confirmed = confirm("Auto pay by your credit card, are you sure?");
					if(confirmed){
						//send autorenew to servlet
						
						$.ajax().done();
					}
				}else{
					var confirmed = confirm("Auto-renewal will be cancelled, are you sure?");
					if(confirmed){
						//cancel autorenew in servlet
						
						$.ajax().done();
					}
				}
			});
			//onclick Buy one more year button
			$("div[class='container']>button").eq(1).on("click", function() {
				var confirmed = confirm("Buy one more year VIP by credit card, are you sure?");
				if(confirmed){
					//send Buy one more year to servlet
					
					$.ajax().done();
				}
			});

			
		});
	</script>
</body>
</html>
