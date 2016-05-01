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
<link href="<c:url value="/resource/css/cust_table.css"/>" rel="stylesheet">
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
				<p>Your cart detail information</p>
					<div class="row">
				<div class="col-md-9">
				
					<table class="table">
						<thead>
							<tr>
								<td>Product</td>
								<td>Quantity</td>
								<td>Price / per</td>
								<td>Modify</td>
							</tr>
						</thead>
						<tbody id="p_detail">
							<c:forEach var="row" items="${cartList}">
								<tr>
									<td hidden="true">${row.id}</td>
									<td class="name">${row.name}</td>
									<td><select class="quantity_select form-control">
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
									<td>$${row.price}</td>
									<td width="80"><input type="button" value="Delete" class="btn btn-danger"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-3">
					<table class="table sum" >
					<tr >
							<th colspan="2">Payment</th>
							</tr>
						<tr>
							<td>Total Quantity</td>
							<td id="total_quantity"><br />${error}</td>
<%-- 							<td id="quantity">${fn:length(cartList)}<br />${error}</td> --%>
						</tr>
						
						<tr>
							<td colspan="2"><p>promo</p>
						<select id="promoTitle" class="form-control">
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
						<tr class="totaltr">
							<td>total</td>
							<td id="total">10000</td>
						</tr>
					</table>
				
				<div class="row">
				<div class="col-md-12">
					<input type="button" id="checkOut" class="btn btn-success btn-block" value="Buy Now">
				</div>
				</div>
			</div>
			</div>
			</div>
			</div>
		</div>
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
                
				var previousValue;
				//修改數量
				$("select:eq(" + i + ")").focus(function(){previousValue = parseInt($(this).val());}).change(function() {
					getTotal();
					
					var nowValue = parseInt($(this).val());
					
					var result = nowValue-previousValue;
					changeCart($(this).parent().prev().prev().text(),result);
					previousValue = nowValue;
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
// 				var price = $("select:eq(" + i + ")").parent().next().text();
// 				var quantity = $("select:eq(" + i + ")").val();
                var price = $("#p_detail tr").eq(i).children().eq(3).text().substring(1);
				var quantity = $("#p_detail tr").eq(i).children().eq(2).children().val();
				console.log("price"+price);
				console.log("quantity"+quantity);
				total = price * quantity + total;
			}
			console.log("ahahahha"+total+amount);
			amount = total * promo > amount ? amount : total * promo;
			var reduced = total * promo - amount;
			$("#total").text(total);
			$("#reduced").text(reduced);
			$("#amount").text(amount);

// 			var quantity = $('.name').size();
// 			$('#quantity').text(quantity);
			
			
			
		//yali
		
		
		
		
		
		
		
		
		
		
		
		
		
				var totalCount = 0;
				var quantity_select = $(".quantity_select");
				
				for(i=0;i<quantity_select.size();i++){
					totalCount += parseInt($(".quantity_select").eq(i).val());
				}
				$('#total_quantity').text(totalCount);
		
			
		}
		
		
		
		
		
		
		
		
		
		//yali
		 function changeCart(id,quantity) {
			 var url = "${pageContext.request.contextPath}/shopping/setCart.action?";

		    	var data  = "cartVO.product_id="+id+"&cartVO.quantity="+quantity;
		    	request = new XMLHttpRequest();
				request.onreadystatechange = doReadyStateChange;
				request.open("POST", url, true);
				request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				request.send(data);
			}
		
		 function doReadyStateChange() {
				if (request.readyState == 4) {
					if (request.status == 200) {
		                $(".cart_anchor").text(request.responseText);
		                console.log("recevied quantity"+request.responseText);
					} else {
						console.log("Error Code:" + request.status + ", "+ request.statusText);
					}
				}
			}
	</script>
</body>
</html>



















