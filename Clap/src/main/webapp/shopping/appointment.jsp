<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<link href="<c:url value="/resource/css/avgrund.css"/>" rel="stylesheet">

<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>

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
										<c:forEach var="doctor" items="${doctorList}">
											<option value="${doctor.id}">${doctor.name}</option>
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
					<c:forEach var="hospital" items="${hospitalList}">
						<option value="${hospital.address}" label="${hospital.name}">${hospital.id}</option>
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
	<script type="text/javascript" src="<c:url value="/resource/js/jquery.avgrund.js"/>"></script>
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
			var orderList = [];
			for (var i = 0; i < $(".id").size(); i++) {
				var data = {
					id : $(".id").eq(i).text(),
					time : $(".time").eq(i).val(),
					doctor : $(".doctor").eq(i).val(),
				}
				orderList[i] = JSON.stringify(data);
			}
			var url = "<c:url value='/shopping/doAppointmentAction.action'/>";
			$("#submit").click(function() {
				$.ajax({
					url : url,
					data : {
						"orderList" : orderList,
						"hospital" : $("#hospital option:selected").text(),
						"orderform_id" : "${orderform_id}"
					},
				}).done(function() {
					finish();
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

		function finish() {
			//顯示彈出式窗
			$('#submit').avgrund({
				width : 380, // max is 640px
				height : 280, // max is 350px
				openOnEvent : false, // set to 'false' to init on load
				template : '購買完成 五秒後回首頁' // or function (elem) { }, or $('.content')
			});
			
			//導回首頁
			setTimeout(function() {
				window.location.href = "<c:url value='/index.jsp'/>";
			}, 3000);
		}
	</script>
</body>
</html>
