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
												<p class="cc_number">${card.cc_number}</p>
												<p class="cc_goodthru">${card.cc_goodthru}</p>
												<p class="cc_name">xxx</p>
												<img src="../resource/images/master.png" width="60" />
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
													Number :<input type="text" name="creditCardVO.cc_number" value="1111222233334447" /> <br /> 
													Good thru :<input type="text" name="creditCardVO.cc_goodthru" value="11/22" /><br /> 
													CVV :<input type="text" name="creditCardVO.cc_cvv" value="333" /> <br /> 
													<input type="button" value="add" id="addCreditCard"><br />
												</form>
											</div>
										</div>
									</div>
								</div>
								<div style="clear: both;"></div>
							</div>
							<div class="tab-pane" id="gift_content">
								<p>Received gift cards</p>
								<p>Total amount : ${amount}</p>
								<div class="addCard">
									<strong>USE GIFT CARD </strong>
									<form id="useGiftForm">
										Number :<input type="text" name="gifttCardVO.gc_number"
											value="123456789" /> <br /> Code :<input type="text"
											name="gifttCardVO.gc_code" value="123" /> <br /> <input
											type="button" value="use" id="useGiftCard"><br />
									</form>
								</div>
							</div>
							<div class="tab-pane" id="promo_content">
								<p>Received Promotions</p>
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Expire</th>
											<th>Title</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="promo" items="${promos}"> 
										<tr>
										    <td>${promo.pm_expire}</td>
										    <td>${promo.pm_tiltle}</td>
											<td><a href="#" class="delete_promo"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
								</table>
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
		$(".delete_card").click(function() {
			if (confirm("Do you want to delete this promotion code?") == true) {
			var data = "creditCardVO.cc_number="+$(this).prev().children(".cc_number").text();
		 	var url = path;
		    var action = "deleteCreditCard";
		    sendPostRwquestPayment(url,data,action);
			}
		});
		// GiftCard
		$("#useGiftCard").click(function() {
			var data = $("#useGiftForm").serialize();
			var url = path;
			var action = "UseGifttCard";
			sendPostRwquestPayment(url, data, action);
		});
		
		//Promotion
		$(".delete_promo").click(function() {
			 if (confirm("Do you want to delete this promotion code?") == true) {
				var data = "promoVO.pm_tiltle="+$(this).parent().prev().text();
				var url = path;
				var action = "deletePromotion";
	 			sendPostRwquestPayment(url,data,action);
	 			$(this).parent().parent().hide();
			 }
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
					//   刪信用卡   $(this).parent().parent().hide(); 
					//	   加信用卡       $(".payment_detail_box").last().after('<div class="payment_detail_box"><div class="creditCard"><div class="credit_info"><p class="cc_number">1111 2222 3333 4444</p><p class="cc_goodthru">12 / 22</p><p class="cc_name">YAlI HSIAO</p><img src="../resource/images/master.png" width="60" /></div><div class="delete_card"><span class="glyphicon glyphicon-remove"></span></div></div></div>');
				} else {
					console.log("Error Code:" + request.status + ", "+ request.statusText);
				}
			}
		}
		
		function processJSON(data) {
			var json = JSON.parse(data);
			console.log("123"+json[0]);
// 			var showTextNode = document.createTextNode(json[0].text);
// 			var spanElement = document.getElementsByTagName("span")[0];
// 			spanElement.appendChild(showTextNode);
// 			if(json[0].hasMoreData) {
// 				document.forms[0].id.value = json[1].id;
// 				document.forms[0].name.value = json[1].name;
// 				document.forms[0].price.value = json[1].price;
// 				document.forms[0].make.value = json[1].make;
// 				document.forms[0].expire.value = json[1].expire;
// 			}
		}
        
	</script>
</body>
</html>
