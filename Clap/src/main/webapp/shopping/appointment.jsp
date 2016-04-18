<%@page import="hospital.model.HospitalVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.model.ProductVO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="shopping.model.OrderFormVO"%>
<%@page import="hospital.model.DoctorVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="shopping.model.OrderDetailVO"%>
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
<%-- <link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet"> --%>
<%-- <link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet"> --%>

<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>

	<%
		HospitalVO hospitalVO1 = new HospitalVO();
		hospitalVO1.setId(11);
		hospitalVO1.setName("臺大醫院");
		hospitalVO1.setAddress("100台北市中正區中山南路8號");
		OrderFormVO orderFormVO1 = new OrderFormVO();
		orderFormVO1.setHospitalVO(hospitalVO1);
		Map<String, Object> doctorVO1 = new HashMap<>();
		doctorVO1.put("id", 1);
		doctorVO1.put("name", "May");
		ProductVO productVO1 = new ProductVO();
		productVO1.setName("heart");
		productVO1.setPrice(11111.0);
		Map<String, Object> orderDetailVO1 = new HashMap<>();
		orderDetailVO1.put("id", 111);
		orderDetailVO1.put("orderFormVO", orderFormVO1);
		orderDetailVO1.put("productVO", productVO1);
		orderDetailVO1.put("cart_quantity", 1);
		orderDetailVO1.put("doctorVO", doctorVO1);
		orderDetailVO1.put("time", new Timestamp(new java.util.Date().getTime()));

		HospitalVO hospitalVO2 = new HospitalVO();
		hospitalVO2.setId(22);
		hospitalVO2.setName("臺大醫院");
		hospitalVO2.setAddress("100台北市中正區中山南路8號");
		OrderFormVO orderFormVO2 = new OrderFormVO();
		orderFormVO2.setHospitalVO(hospitalVO2);
		Map<String, Object> doctorVO2 = new HashMap<>();
		doctorVO2.put("id", 2);
		doctorVO2.put("name", "May");
		ProductVO productVO2 = new ProductVO();
		productVO2.setName("heart");
		productVO2.setPrice(22222.0);
		Map<String, Object> orderDetailVO2 = new HashMap<>();
		orderDetailVO2.put("id", 222);
		orderDetailVO2.put("orderFormVO", orderFormVO2);
		orderDetailVO2.put("productVO", productVO2);
		orderDetailVO2.put("cart_quantity", 2);
		orderDetailVO2.put("doctorVO", doctorVO2);
		orderDetailVO2.put("time", new Timestamp(new java.util.Date().getTime()));

		ArrayList<Map<String, Object>> orderList = new ArrayList<>();
		orderList.add(orderDetailVO1);
		orderList.add(orderDetailVO2);

		pageContext.setAttribute("orderList", orderList);
	%>
	<sql:query dataSource="clap/db" var="hospitalList">
		select top(10) * from hospital 
	</sql:query>
	<sql:query dataSource="clap/db" var="doctorList">
		select top(10) * from doctor 
	</sql:query>


	<header><jsp:include page="/header.jsp" /></header>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<td><label>product</label></td>
							<td><label>appointment time</label></td>
							<td><label>doctor</label></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="orderVO" items="${orderList}">
							<tr>
								<td class="id" hidden="true">${orderVO.id}</td>
								<td>${orderVO.productVO.name}</td>
								<td><input type="date" class="time"></td>
								<td><select class="doctor">
										<c:forEach var="doctor" items="${doctorList.rows}">
											<option>${doctor.doctor_name}</option>
										</c:forEach>
									</select></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-md-9">
				<label>Choose Hospital:</label>
				<select class="hospital form-control" id="hospital">
					<c:forEach var="hospital" items="${hospitalList.rows}">
						<option value="${hospital.hospital_address}" label="${hospital.hospital_name}">${hospital.hospital_id}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-3" style="height: 100%;">
				<input type="button" value="submit" id="submit" class="btn btn-default" height="100%">
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div id="map" style="width: 100%; height: 500px;"></div>
			</div>
		</div>
	</div>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script src="https://maps.googleapis.com/maps/api/js?signed_in=true&callback=initMap" async defer></script>
	<script type="text/javascript">
		$(function() {

			//顯示醫院地圖
			$(".hospital").change(function() {
				geocodeAddress(geocoder, map, $(this).val());
			})

			//日期限制
			var now = new Date().toISOString().substring(0, 10);
			$(".time").attr("min", now).attr("value", now);

			//送出資料ajax
 			var orderList = new Object();
			for (var i = 0; i < $(".id").size(); i++) {
				var data = {
					id : $(".id").eq(i).text(),
					time : $(".time").eq(i).val(),
					doctor : $(".doctor").eq(i).val(),
				}
				orderList[i]=data;
			}
			var url = "<c:url value='/shopping/doAppointmentAction.action'/>";
			$("#submit").click(function() {
				$.ajax({
					url : url,
					data : {
						"orderList":orderList,
						"hospital" : $("#hospital option:selected").text(),
					},
				}).done(function() {

				})
			})
		})

		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : {
					lat : -34.397,
					lng : 150.644
				}
			});
			geocoder = new google.maps.Geocoder();
			geocodeAddress(geocoder, map, $(".hospital:first").val());
		}

		function geocodeAddress(geocoder, resultsMap, address) {
			geocoder.geocode({
				'address' : address
			}, function(results, status) {
				if (status === google.maps.GeocoderStatus.OK) {
					resultsMap.setCenter(results[0].geometry.location);
					marker = new google.maps.Marker({
						map : resultsMap,
						position : results[0].geometry.location
					});
				} else {
					alert('Geocode was not successful for the following reason: ' + status);
				}
			});
		}
	</script>
</body>
</html>
