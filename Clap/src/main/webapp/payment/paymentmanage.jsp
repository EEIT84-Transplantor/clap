<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
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
<sx:head/>
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
				<div id="payment_detail"><p>Registered credit cards</p>
				
				<c:forEach begin="1" end="4" step="1" var="cards" varStatus="index">
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
				   <c:if test="${index.count==4}">
				     
				     <div class="col-md-4">
				     <div class="addCard">
						   <strong>NEW CARD </strong>
						    <s:form id="addCreditForm">
						      <s:textfield name="creditCardVO.cc_number" label="Number" />
						      <s:textfield name="creditCardVO.cc_goodthru" label="Good thru" />
						      <s:textfield name="creditCardVO.cc_cvv" label="CVV" />
		
						      <sx:submit href="managePayment.action"  targets="newCardDiv" loadingText="Loading..." showLoadingText="true" errorText="載入失敗!" formId="addCreditForm"></sx:submit> 
						
						    </s:form>
						<div id="newCardDiv">newCardDiv</div>  
						</div>
				      </div>
				   </c:if>
				   
				   <c:if test="${index.count%3==0||index.count==4}">
				      </div>
				   </c:if>
				
				   
				</c:forEach>
				
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

</body>
</html>
