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
<link href="<c:url value="/resource/css/bootstrap.min.css"/> rel="stylesheet">
<!-- <link href="<c:url value="/resource/css/customer.css"/> rel="stylesheet"> -->
<!-- <link href="<c:url value="/resource/css/silderbanner.css"/> rel="stylesheet"> -->
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>

	<%
		Map<String, Object> name1 = new HashMap<>();
		name1.put("name", "abc");
		name1.put("quantity", 2);
		name1.put("price", 1000);
		name1.put("stock", 5);
		Map<String, Object> name2 = new HashMap<>();
		name2.put("name", "abc");
		name2.put("quantity", 5);
		name2.put("price", 2000);
		name2.put("stock", 10);
		Map<String, Object> name3 = new HashMap<>();
		name3.put("name", "abc");
		name3.put("quantity", 10);
		name3.put("price", 3000);
		name3.put("stock", 1000);
		ArrayList<Map<String, Object>> cartList = new ArrayList<>();
		cartList.add(name1);
		cartList.add(name2);
		cartList.add(name3);
		pageContext.setAttribute("cartList", cartList);
	%>

	<header><jsp:include page="/header.jsp" /></header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<td>商品</td>
								<td>數量</td>
								<td>價格</td>
								<td>刪除</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${cartList}">
								<tr>
									<td>${row.name}</td>
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
									<td><input type="button" value="刪除" /></td>
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
							<td>商品數</td>
							<td></td>
							<td>${fn:length(cartList)}</td>
						</tr>
						<tr>
							<td>原價</td>
							<td></td>
							<td>10000</td>
						</tr>
						<tr>
							<td>禮物卡</td>
							<td></td>
							<td>-1000</td>
						</tr>
						<tr>
							<td>prome</td>
							<td><select class="form-control">
									<option>A</option>
									<option>B</option>
									<option>C</option>
								</select></td>
							<td>-2000</td>
						</tr>
						<tr>
							<td>總價</td>
							<td></td>
							<td>7000</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<input type="button" class="btn btn-default btn-block" value="結帳">
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
		var trs;

		$(function() {
			//刪除商品 修改數量
			trs = $("tbody:first tr").size();
			for (var i = 0; i < trs; i++) {

				$("input:eq(" + i + ")").click(function(event) {
					$(event.target).parent().parent().remove();
				});

				$("select:eq(" + i + ")").change(function(event) {
					var total;
					alert("change");
					getTotal();
				})
			}
		})

		function getTotal() {
			alert("getTotal");
			trs = $("tbody:first tr").size();
			alert(trs);
			var total;
			for (var i = 0; i < trs; i++) {
				alert("for");
				var price = $("tr:eq(" + 2 * i + 1 + ")").text();
				// 				var quantity = 
				alert(price);
				total += price * quantity;
				// 				alert(total);
			}
			return total;
		}
	</script>


</body>
</html>



















