<%@page import="member.model.MemberVO"%>
<%@page import="payment.model.CreditCardPK"%>
<%@page import="payment.model.CreditCardVO"%>
<%@page import="java.util.ArrayList"%>
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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" " rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/>" " rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" " rel="stylesheet">
<link href="<c:url value="/resource/css/shopping.css"/>" " rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>

	<%
		ArrayList<CreditCardVO> creditCardList = new ArrayList<>();
		CreditCardVO card1 = new CreditCardVO();
		CreditCardPK card1PK = new CreditCardPK();
		card1PK.setCc_number("111111111");
		card1PK.setMb_email("poan@gmail.com");
		card1.setCreditCardPK(card1PK);
		card1.setCc_cvv("111");
		card1.setCc_goodthru("11/11");

		CreditCardVO card2 = new CreditCardVO();
		CreditCardPK card2PK = new CreditCardPK();
		card2PK.setCc_number("222222222");
		card2PK.setMb_email("poan@gmail.com");
		card2.setCreditCardPK(card2PK);
		card2.setCc_cvv("222");
		card2.setCc_goodthru("22/22");

		CreditCardVO card3 = new CreditCardVO();
		CreditCardPK card3PK = new CreditCardPK();
		card3PK.setCc_number("333333333");
		card3PK.setMb_email("poan@gmail.com");
		card3.setCreditCardPK(card3PK);
		card3.setCc_cvv("333");
		card3.setCc_goodthru("33/33");

		creditCardList.add(card1);
		creditCardList.add(card2);
		creditCardList.add(card3);

		MemberVO memberVO = new MemberVO();
		memberVO.setEmail("poan@gmail.com");

		pageContext.setAttribute("creditCardList", creditCardList);
		pageContext.setAttribute("total", "413413");
		pageContext.setAttribute("login", memberVO);
	%>

	<header><jsp:include page="/header.jsp" /></header>
	<div class="container">
		<div id="cardTable" class="row">
			<!-- 會員信用卡 -->
			<c:forEach var="creditCardVO" items="${creditCardList}">
				<div class="col-md-3">
					<div class="creditCard">
						<table>
							<tr>
								<td><label>Number</label></td>
								<td><label class="number">${creditCardVO.creditCardPK.cc_number}</label></td>
							</tr>
							<tr>
								<td><label>Good thru</label></td>
								<td><label class="goodthru">${creditCardVO.cc_goodthru}</label></td>

							</tr>
							<tr>
								<td><label>CVV</label></td>
								<td><label class="cvv">${creditCardVO.cc_cvv}</label></td>
							</tr>
						</table>
					</div>
				</div>
			</c:forEach>

			<!-- 新卡片表格 -->
			<div class="col-md-3" hidden id="hidden">
				<div class="newcard">
					<form id="addCreditForm">
						<table>
							<tr>
								<td><label>Number</label></td>
								<td><input type="text" name="creditCardVO.creditCard.cc_number" value="6011226470739645" class="number" /></td>
							</tr>
							<tr>
								<td><label>Good thru</label></td>
								<td><input type="text" name="creditCardVO.cc_goodthru" value="11/22" class="goodthru" /></td>
							</tr>
							<tr>
								<td><label>CVV</label></td>
								<td><input type="text" name="creditCardVO.cc_cvv" value="333" class="cvv" /></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="button" value="add" id="addCreditCard"></td>
							</tr>
							<tr>
								<td id="false">false</td>
								<td id="true">true</td>
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
			<div class="col-md-6"></div>
			<div class="col-md-4">
				<table class="htable" id="test">
					<tr>
						<td>total</td>
						<td>${total}</td>
					</tr>
				</table>
			</div>
			<div class="col-md-2">
				<input type="button" class="btn btn-default btn-block" value="付款">
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
			var setCreditCardAction = "<c:url value='/shopping/checkOutAction.action'/>";

			//listener 新增卡片表格
			$("#addNewCardForm").click(function() {
				$("div:hidden").show();
			})

			//listener 新增卡片
			$("#addCreditCard").click(function() {
				var result = ajax(setCreditCardAction, setNewCardVO());
				// setNewCard(result);
			})

			//listener 選擇付款信用卡
			selectCardListener(".creditCard");
			
			//listener 付款
			ajax(checkOutAction,cc_number);

			//測試新增卡片回傳的結果
			$("#true").click(function() {
				$("#hidden").prev().clone().prependTo("#cardTable");
				$(".number:first").text(creditCardVO.creditCardPK.cc_number);
				$(".goodthru:first").text(creditCardVO.cc_goodthru);
				$(".cvv:first").text(creditCardVO.cc_cvv);
				$(".creditCard:first").css("border-style", "");
				selectCardListener(".creditCard:first");
				$("#hidden").toggle();
			})
			$("#false").click(function() {
				$("#false").text("信用卡資料錯誤");
			})

		})

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
			}).done(function(msg) {
				result = msg;
			})
			return result;
		}

		//在畫面產生新卡片
		function setNewCard(result) {
			if (result == true) {
				//產生新卡片
				$("#hidden").prev().clone().prependTo("#cardTable");
				$(".number:first").text(creditCardVO.creditCardPK.cc_number);
				$(".goodthru:first").text(creditCardVO.cc_goodthru);
				$(".cvv:first").text(creditCardVO.cc_cvv);
				$(".creditCard:first").css("border-style", "");
				selectCardListener(".creditCard:first");
				//隱藏清空新卡片表格
				$("#hidden").toggle();
			} else {
				$("#false").text("信用卡資料錯誤");
			}
		}

		//取得新卡片資訊 製作成creditCardVO
		function setNewCardVO() {
			var mb_email = "${login.email}";
			var cc_number = $(".number:last").val();
			var creditCardPK = {
				"mb_email" : mb_email,
				"cc_number" : cc_number
			};
			var cc_goodthru = $(".goodthru:last").val();
			var cc_cvv = $(".cvv:last").val();
			return creditCardVO = {
				"creditCardPK" : creditCardPK,
				"cc_goodthru" : cc_goodthru,
				"cc_cvv" : cc_cvv
			};
		}
	</script>


</body>
</html>
