<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.Map" %>
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
			<div class="row">
				<div class="col-md-2">
				side-nav:sub-menu
				</div>
				<div class="col-md-10">
				<h2>PAYMENT</h2>
				<p>The Amazon.com Store Card and the Amazon Prime Store Card are issued by Synchrony Bank. If you have questions about the Amazon.com Store Card or the Amazon Prime Store Card, call 1-866-634-8379, available 24 hours a day. The Amazon.com Store Card or the Amazon Prime Store Card may be used for purchases at Amazon.com and for purchases from other merchants who have enabled the Amazon.com Store Card or the Amazon Prime Store Card as a payment option, but may not be used for the purchase of digital newspaper and magazine subscriptions or games and software downloads at Amazon.com.</p>
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="#">Credit Cards</a></li>
					<li role="presentation"><a href="#">Gift Cards</a></li>
					<li role="presentation"><a href="#">Promotions</a></li>
				</ul>
				<div id="payment_detail">
				<p>Registered credit cards</p>
				
				<c:forEach begin="1" end="2" step="1" var="cards" varStatus="index">
				   <c:if test="${index.count%3==1}">
				      <div class="row">
				   </c:if>
				   <div class="col-md-4">
						<div class="creditCard">
						   <div class="credit_info">
						   <p class="cc_number">1111 2222 3333 4444</p>
						   <p class="cc_goodthru">12 / 22</p>
						   <p class="cc_name">YAlI HSIAO</p>
						   <img src="../resource/images/master.png" width="60" />
						   </div>
						   <div class="delete_card">
						   <span class="glyphicon glyphicon-remove"></span>
						   </div>
						</div>
						
				      </div>
				   <c:if test="${index.count==2}">
				     <div class="col-md-4">
				     <div class="addCard">
						   <strong>NEW CARD </strong>
						    <form id="addCreditForm">
						     Number :<input type="text" name="creditCardVO.cc_number" value="1111222233334447"/> <br />
						     Good thru :<input type="text" name="creditCardVO.cc_goodthru" value="11/22"/> <br />
						     CVV :<input type="text" name="creditCardVO.cc_cvv" value="333"/> <br />
						     <input type="button" value="add"  id="addCreditCard"><br />
						    </form>
						<div id="newCardDiv">newCardDiv</div>  
						</div>
				      </div>
				   </c:if>
				   
				   <c:if test="${index.count%3==0||index.count==2}">
				      </div>
				   </c:if>
				
				   
				</c:forEach>
				
				<!-- ******************************* -->
				
				<p>Received gift cards</p>
				<div class="row">
				<div class="col-md-12">
				     <div class="addCard">
						   <strong>USE GIFT CARD </strong>
						    <form id="useGiftForm">
						     Number :<input type="text" name="gifttCardVO.gc_number" value="123456789"/> <br />
						     Code :<input type="text" name="gifttCardVO.gc_code" value="123"/> <br />
						     <input type="button" value="use"  id="useGiftCard"><br />
						    </form>
				      </div>
				</div>
			    <!-- ******************************* -->
			    <p>Received Promotions</p>
			    
			    <ul>
			      <li>Title : ${promoVO.expire}</li>
			      <li>Expire : ${promoVO.title}</li>
			    </ul>
			    
			    
			    
			    
			    
			    
			    
			    
				</div><!-- payment_detail -->
			</div>
			</div>
	</section>

	<footer>
	<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js"></script>
	<script src="../resource/js/bootstrap.min.js"></script>
	<script src="../resource/js/json2.js"></script>
<script type="text/javascript">
var path = "${pageContext.request.contextPath}";
//CreditCard
$("#addCreditCard").click(function(){
	    var data = $("#addCreditForm").serialize();
	 	var url = path;
        var action = "AddCreditCard";
        sendPostRwquestPayment(url,data,action);
});

$(".delete_card").click(function(){
	var data = "creditCardVO.cc_number="+$(this).prev().children(".cc_number").text();
 	var url = path;
    var action = "deleteCreditCard";
    sendPostRwquestPayment(url,data,action);
});

// GiftCard
$("#useGiftCard").click(function(){
    var data = $("#useGiftForm").serialize();
 	var url = path;
    var action = "UseGifttCard";
    sendPostRwquestPayment(url,data,action);
});







function sendPostRwquestPayment(url,data,action){
	var target = url+"/payment/managePayment.action?buttonClicked"+action;
	request = new XMLHttpRequest();
	request.onreadystatechange = doReadyStateChange;
	request.open("POST", target, true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	request.send(data);
};


function doReadyStateChange() {
	if(request.readyState==4) {
		if(request.status==200) {
			console.log("haha"+request.responseText);
		} else {
			console.log("Error Code:"+request.status+", "+request.statusText);
		}
	}
}



</script>
</body>
</html>
