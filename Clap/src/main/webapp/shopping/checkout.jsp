<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/shopping.css"/>" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->

<style type="text/css">
.number {
	letter-spacing: 3px;
	left: 15%;
	top: 50%;
	position: absolute;
}

.goodthru {
	position: absolute;
	top: 70%;
	left: 60%;
}

#addCreditForm {
	position: relative;
	top: 50%;
	transform: translate(0, -50%);
}
</style>

</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>
	<div class="container">
		<div id="cardTable" class="row">
			<!-- 會員信用卡 -->
			<c:forEach var="creditCardVO" items="${creditCardList}">
				<div class="col-md-3">
					<div class="creditCard">
						<table>
							<tr>
								<td><label class="number">${creditCardVO.creditCardPK.cc_number}</label></td>
							</tr>
							<tr>
								<td><label class="goodthru">${creditCardVO.cc_goodthru}</label></td>
							</tr>
						</table>
					</div>
				</div>
			</c:forEach>

			<!-- 新卡片表格 -->
			<div class="col-md-3" hidden=true id="hidden">
				<div class="newcard">
					<form id="addCreditForm">
						<table>
							<tr>
								<td><label>Number</label></td>
								<td><input type="text" name="creditCardVO.creditCard.cc_number" value="6011226470739645" id="number"/></td>
							</tr>
							<tr>
								<td><label>Good thru</label></td>
								<td><input type="text" name="creditCardVO.cc_goodthru" value="11/22" id="goodthru"/></td>
							</tr>
							<tr>
								<td><label>CVV</label></td>
								<td><input type="text" name="creditCardVO.cc_cvv" value="333" id="cvv"/></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="button" value="add" id="addCreditCard"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>

			<!-- 新增信用卡 -->
			<div class="col-md-3">
				<div id="addNewCardForm" class="addCard_plus">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					ADD NEW
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-10">
				<span id="error"></span>
			</div>
			<div class="col-md-2">
				<input type="button" class="btn btn-default btn-block" value="Pay" id="submit">
			</div>
		</div>

	</div>
	<footer><jsp:include page="/footer.jsp" /></footer>
	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript">
		//ready
		$(function() {

			var setCreditCardAction = "<c:url value='/shopping/setCreditCardAction.action'/>";
			var doCheckOutAction = "<c:url value='/shopping/doCheckOutAction.action'/>";

			//listener 新增卡片表格
			$("#addNewCardForm").click(function() {
				$("div:hidden").show();
			})

			//listener 新增卡片
			$("#addCreditCard").click(function() {
				ajax(setCreditCardAction, setNewCardVO());
			})

			//listener 選擇付款信用卡
			selectCardListener(".creditCard");

			//listener 付款
			$("#submit").click(function() {
				if ("cc_number" in window) {
					$.ajax({
						url : doCheckOutAction,
						data : {"cc_number":cc_number}
					}).done(function(result) {
						window.location.href = "<c:url value='/shopping/appointmentAction.action'/>";
					});
				} else {
					$("#error").text("Please Choose a Credit Card")
				}
			})
		})
		
		var cardvo;

		//listener 選擇付款信用卡
		function selectCardListener(creditCard) {
			$(creditCard).click(function() {
				$(".creditCard").css("border-style", "");
				$(this).css("border-color", "red").css("border-style", "solid");
				cc_number = $(this).contents().find("label.number").text();
			});
		}

		//ajax
		function ajax(url, data) {
			var result;
			$.ajax({
				url : url,
				data : data,
				dataType : "json"
			}).done(function(result) {
				
				setNewCard(result);
			})
		}

		//在畫面產生新卡片
		function setNewCard(result) {
			if (result) {
				
				//產生新卡片
				$("#hidden").prev().clone().prependTo("#cardTable");
				$(".number:first").text(cardvo.cc_number);
				$(".goodthru:first").text(cardvo.cc_goodthru);
				$(".creditCard:first").css("border-style", "");
				selectCardListener(".creditCard:first");
				//隱藏清空新卡片表格
				$("#hidden").toggle();
			} else {
				$("#false").text("Credit Card is wrong, please try again");
			}
		}

		//取得新卡片資訊 製作成creditCardVO
		function setNewCardVO() {
			cardvo = {
				"mb_email" : "${login.email}",
				"cc_number" : $("#number").val(),
				"cc_goodthru" : $("#goodthru").val(),
				"cc_cvv" : $("#cvv").val()
			}
			return cardvo;
		};
	</script>


</body>
</html>
