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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">

<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="height:1000px">
				<table class="table">
					<thead>
						<tr>
							<td>order detail id</td>
							<td>hospital</td>
							<td>appointment time</td>
							<td>doctor</td>
							<td>product</td>
							<td>quantity</td>
							<td>price</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="orderVO" items="${orderList}">
							<tr>
								<td>${orderVO.id}</td>
								<td>${orderVO.orderFormVO.hospitalVO.name}</td>
								<td>${orderVO.orderdetail_surgerytime}</td>
								<td>${orderVO.doctorVO.name}</td>
								<td>${orderVO.productVO.name}</td>
								<td>${orderVO.ct_quantity}</td>
								<td>${orderVO.productVO.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : {
					lat : -34.397,
					lng : 150.644
				}
			});
			var geocoder = new google.maps.Geocoder();
			geocodeAddress(geocoder, map);
		}

		function geocodeAddress(geocoder, resultsMap) {
			console.log();
			var address = "${orderList[0].orderFormVO.hospitalVO.address}";
			;
			geocoder.geocode({
				'address' : address
			}, function(results, status) {
				if (status === google.maps.GeocoderStatus.OK) {
					resultsMap.setCenter(results[0].geometry.location);
					var marker = new google.maps.Marker({
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
