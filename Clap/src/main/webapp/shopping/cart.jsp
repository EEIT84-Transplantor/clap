<%@page import="payment.model.PromoVO"%>
<%@page import="member.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2"><jsp:include page="/sidenav.jsp" /></div>
				<div class="col-md-10">
				<h2>Cart</h2>
					<table class="table">
						<thead>
							<tr>
								<td>Product</td>
								<td>Quantity</td>
								<td>Price</td>
								<td>Delete</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${cartList}">
								<tr>
									<td hidden="true">${row.id}</td>
									<td class="name">${row.name}</td>
									<td><select>
											<c:forEach var="i" begin="1" end="${row.stock<10?row.stock:10}">
												<c:choose>
													<c:when test="${row.quantity==i}">
														<option value="${i}" selected>${i}</option>
													</c:when>
													<c:otherwise>
														<option value="${i}">${i}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select></td>
									<td>${row.price}</td>
									<td><input type="button" value="Delete" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8"></div>
				<div class="col-md-4">
					<table class="table">
						<tr>
							<td>Quantity</td>
							<td id="quantity">${fn:length(cartList)}<br />${error}</td>
						</tr>
						<tr>
							<td>total</td>
							<td id="total">10000</td>
						</tr>
						<tr>
							<td>promo</td>
							<td><select id="promoTitle" class="form-control">
									<option value="1" selected></option>
									<c:forEach var="promoVO" items="${promoList}">
										<option value="${promoVO.pm_discount}">${promoVO.pm_title}</option>
									</c:forEach>
								</select></td>
						</tr>
						<tr>
							<td>Gift Card</td>
							<td id="amount">${login.amount}</td>
						</tr>
						<tr>
							<td>reduced</td>
							<td id="reduced">7000</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<input type="button" id="checkOut" class="btn btn-default btn-block" value="Pay">
				</div>
			</div>
		</div></div>
	</section>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript">
		var trs = $("tbody:first tr").size();

		$(function() {
			getTotal();

			//listener 刪除商品 修改數量 
			for (var i = 0; i < trs; i++) {
				//刪除商品
				$("input:eq(" + i + ")").click(function(event) {
					$(event.target).parent().parent().remove();
					getTotal();
					var productid = $(this).parent().prevAll().eq(3).text();
					$.ajax({
						url:'<c:url value="/shopping/deleteCartAction.action"/>',
						data: {"productid":productid}
					}).done(function(msg) {
						console.log('delete success');
						$(".cart_anchor").text(msg);
					});
				});

				//修改數量
				$("select:eq(" + i + ")").change(function() {
					getTotal();
				})
			}
			//listener 選擇promo 
			for (var i = 0; i < $("select:last option").length - 1; i++) {
				$("select:last").change(function() {
					getTotal();
				})
			}
			//listener 結帳
			$("#checkOut").on("click", function() {
				var url = "<c:url value='/shopping/checkOutAction.action'/>";
				var productArray = [];
				var promoTitle = $("#promoTitle").val();
				$("tbody:first tr").each(function() {
					var productId = $(this).children().eq(0).text();
					var quantity = $(this).children().eq(2).children().val();
					productArray.push(JSON.stringify({
						"productId" : productId,
						"quantity" : quantity
					}));
				});

				$.ajax({
					url : url,
					data : {
						"productArray" : productArray,
						"promoTitle" : promoTitle
					},
				}).done(function(result) {
					if(result=="true"){
						window.location.href = "<c:url value='/shopping/checkout.jsp'/>";
					}else{
						window.location.href = "<c:url value='/member/signuplogin.jsp'/>";
					}
				})

				//測試程式
				console.log(url);
				console.log({
					"productArray" : productArray,
					"promoTitle" : promoTitle
				});
			})
		})

		//更新價格
		function getTotal() {
			trs = $("tbody:first tr").size();
			var total = 0;
			var amount = $("#amount").text();
			var promo = $("select:last option:selected").val();
			for (var i = 0; i < trs; i++) {
				var price = $("select:eq(" + i + ")").parent().next().text();
				var quantity = $("select:eq(" + i + ")").val();
				total = price * quantity + total;
			}
			amount = total * promo > amount ? amount : total * promo;
			var reduced = total * promo - amount;
			$("#total").text(total);
			$("#reduced").text(reduced);
			$("#amount").text(amount);

			var quantity = $('.name').size();
			$('#quantity').text(quantity);
		}
	</script>
</body>
</html>



















