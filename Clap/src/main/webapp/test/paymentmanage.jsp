<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.Map"%>
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
	<header><jsp:include page="/header.jsp" /></header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2">side-nav:sub-menu</div>
				<div class="col-md-10">
					<h2>PAYMENT</h2>
					<p>The Amazon.com Store Card and the Amazon Prime Store Card are issued by Synchrony Bank. If you have questions about the
						Amazon.com Store Card or the Amazon Prime Store Card, call 1-866-634-8379 FREE, available 24 hours a day. The Amazon.com Store Card or the Amazon Prime Store Card may be used for purchases at Amazon.com and for purchases from other merchants who have enabled
						the Amazon.com Store Card or the Amazon Prime Store Card as a payment option, but may not be used for the purchase of digital newspaper and magazine subscriptions or games and software downloads at Amazon.com.</p>
					<ul class="nav nav-tabs">
						<li><a href="#credit_content" data-toggle="tab">Credit Cards</a></li>
						<li><a href="#gift_content" data-toggle="tab">Gift Cards</a></li>
						<li><a href="#promo_content" data-toggle="tab">Promotions</a></li>
					</ul>
					
					<div id="payment_detail">
						<div class="tab-content" id="tabs">
							<div class="tab-pane" id="credit_content">
								<p>Registered credit cards</p>
								<c:forEach var="card" varStatus="index" items="${cards}">
								
									<div class="payment_detail_box">
										<div class="creditCard">
											<div class="credit_info">
												<p class="cc_number">${card.creditCard.cc_number}</p>
												<p class="cc_goodthru">${card.cc_goodthru}</p>
												<p class="cc_name">${login.name}</p>
												
												<img src="../resource/images/${cardType[index.count-1]}.png" width="60" />
											</div>
											<div class="delete_card">
												<span class="glyphicon glyphicon-remove"></span>
											</div>
										</div>
									</div>
								
								</c:forEach>

								<div class="flip-container" ontouchstart="this.classList.toggle('hover');">
									<div class="flipper">
										<div class="front">
											<div class="addCard_plus">
												<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>ADD NEW
											</div>
										</div>
										<div class="back">
											<div class="addCard">
												<strong>NEW CARD </strong>
												<form id="addCreditForm">
													Number :<input type="text" name="creditCardVO.creditCard.cc_number" value="6011226470739645" /> <br /> 
													Good thru :<input type="text" name="creditCardVO.cc_goodthru" value="11/22" /><br /> 
													CVV :<input type="text" name="creditCardVO.cc_cvv" value="333" /> <br /> 
													<input type="button" value="add" id="addCreditCard"><br />
												</form>
											</div>
										</div>
									</div>
								</div>
								<div style="clear: both;" id="error"></div>
								
							</div>
							<div class="tab-pane" id="gift_content">
								<p>Received gift cards</p>
								<p id="totalAmount">Total amount : ${amount}</p>
								<div class="addCard">
									<strong>USE GIFT CARD </strong>
									<form id="useGiftForm">
										Number :<input type="text" name="giftCardVO.gc_number"
											value="1111" /> <br /> Code :<input type="text"
											name="giftCardVO.gc_code" value="gccode1" /> <br /> <input
											type="button" value="use" id="useGiftCard"><br />
									</form>
								</div>
								<div style="clear: both;" id="errorGitCard"></div>
							</div>
							<div class="tab-pane" id="promo_content">
								<p>Received Promotions</p>
								<table class="table table-striped">
									<thead>
										<tr><th>Promotion Code</th>
											<th>Expire</th>
											<th>Title</th>
											
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="promo" items="${promos}"> 
										<tr >
										<td>${promo.pm_code}</td>
										    <td>${promo.pm_expire}</td>
										    
										    <td>${promo.pm_tiltle}</td>
										     
											<td><a href="#" class="delete_promo"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
										</tr>
									</c:forEach>
									<div class="addCard">
									<strong>Add Promotion code</strong>

									<form id="AddPromoForm">
										Code :<input type="text" name="promoCodeVO.promoCode.pm_code" value="333" /> <br /> 

										<input type="button" value="ADD" id="AddPromoCode"><br />
									</form>
								</div>
								
								</tbody>
								</table>
								<div style="clear: both;" id="errorPromo"></div>
							</div>
						</div>
					</div><!-- payment_detail -->
				</div><!-- row -->
			</div><!-- container -->
		</div><!-- wrap -->
	</section>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="../resource/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="../resource/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resource/js/json2.js"></script>
	<script type="text/javascript">
		var path = "${pageContext.request.contextPath}";
	    
		//預設tab顯示
		$(document).ready(function() {
			activaTab('credit_content');
		});
		
        //tab切換
		function activaTab(tab) {
			$('.nav-tabs a[href="#' + tab + '"]').tab('show');
		};
		
		//CreditCard
		$("#addCreditCard").click(function() {
			var data = $("#addCreditForm").serialize();
			var url = path;
			var action = "AddCreditCard";
			sendPostRwquestPayment(url,data,action);
			
		});
		
		$('body').on('click','.delete_card',function() {
			if (confirm("Do you want to delete this promotion code?") == true) {
				var data = "creditCardVO.creditCard.cc_number="+$(this).prev().children(".cc_number").text();
			 	var url = path;
			    var action = "deleteCreditCard";
			    sendPostRwquestPayment(url,data,action);
				}
			});

		// GiftCard
		$("#useGiftCard").click(function() {
			var data = $("#useGiftForm").serialize();
			var url = path;
			var action = "UseGiftCard";
			sendPostRwquestPayment(url, data, action);
		});
		
		//Promotion
		$(".delete_promo").click(function() {
			 if (confirm("Do you want to delete this promotion code?") == true) {
				var data = "promoCodeVO.promoCode.pm_code="+$(this).parent().parent().children(':first-child').text();
				var url = path;
				var action = "deletePromotion";
	 			sendPostRwquestPayment(url,data,action);
	 			$(this).parent().parent().hide();
			 }
		});

		$("#AddPromoCode").click(function() {
				var data = "promoCodeVO.promoCode.pm_code="+$(this).prev().prev().val();
				var url = path;
				var action = "AddPromoCode";
	 			sendPostRwquestPayment(url,data,action);
		});
		
		
		
		
		
		function sendPostRwquestPayment(url, data, action) {
			var target = url + "/payment/managePayment.action?buttonClicked="+ action;
			request = new XMLHttpRequest();
			request.onreadystatechange = doReadyStateChange;
			request.open("POST", target, true);
			request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			request.send(data);
		};
		function doReadyStateChange() {
			if (request.readyState == 4) {
				if (request.status == 200) {
                    processJSON(request.responseText);
				} else {
					console.log("Error Code:" + request.status + ", "+ request.statusText);
				}
			}
		}
		
		function processJSON(data) {
			var json = JSON.parse(data);
		    var key = json[0].buttonClicked;
		    var isError = json[0].isError;
		    if(isError){
		    	switch(key){
		    	case "addCreditCard":
		    		$('#error').css("color","rgb(255,0,0)");
			    	$('#error').html("Error: "+json[0].errorMessage);
			    	return;
		    	case "deleteCreditCard":
		    		$('#errorGitCard').css("color","rgb(255,0,0)");
			    	$('#errorGitCard').html("Error: "+json[0].errorMessage);
			    	return;	
		    	case "addPromoCode":
		    		$('#errorPromo').css("color","rgb(255,0,0)");
			    	$('#errorPromo').html("Error: "+json[0].errorMessage);
			    	return;	
		    	
		    	
		    	
		    	}
		    	
		    }
		    $('#error').html("");
		    var info = json[1];
		    switch(key) {
		    case "AddCreditCard":
		    	  $(".payment_detail_box").last().after('<div class="payment_detail_box"><div class="creditCard"><div class="credit_info"><p class="cc_number">'+info.cc_number+'</p><p class="cc_goodthru">'+info.cc_goodthru+'</p><p class="cc_name">'+info.name+'</p><img src="../resource/images/'+info.cardType+'.png" width="60" /></div><div class="delete_card"><span class="glyphicon glyphicon-remove"></span></div></div></div>');
		    	  break;
		    case "deleteCreditCard":
		    	 if(info.result){
		    		var temp = info.cc_number;
		    		$("p:contains("+temp+")").parent().parent().parent().hide();
		    	 }
		        break;
		    case "UseGiftCard": 
		    	 if(info.result!=0){ 
		    		 $("#totalAmount").text("Total amount "+info.total);
		    	 }else{
		    		 $("#totalAmount").text("Can't use this card");
		    	 }
		        break;
		    case "AddPromoCode":
		    	var promocodeinfo = json[2];
		    	  $("#promo_content tbody:last-child").append('<tr><td>'+promocodeinfo.pm_code+'</td><td>'+promocodeinfo.pm_expire+'</td><td>'+promocodeinfo.pm_title+'</td><td><a href="#" class="delete_promo"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td></tr>');
		        break;
		    }
		}
      
	</script>
</body>
</html>
