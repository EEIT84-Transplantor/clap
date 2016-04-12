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
<link href="<c:url value="/resource/css/bootstrap.min.css"/> rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/> rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/> rel="stylesheet">

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
							<td>order detail id</td>
							<td>hospital</td>
							<td>appointment time</td>
							<td>doctor</td>
							<td>product</td>
							<td>quantity</td>
							<td>price</td>
							<td>total</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>123</td>
							<td>臺大醫院</td>
							<td>3000-01-01 10:10:30</td>
							<td>吳永智</td>
							<td>鐵胃</td>
							<td>1</td>
							<td>5000</td>
							<td>5000</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div id="googleMap" style="width: 100%; height: 500px;"></div>
			</div>
		</div>
	</div>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script type="text/javascript">
		var myCenter = new google.maps.LatLng(51.508742, -0.120850);

		function initialize() {

			//Create a Basic Google Map
			var mapProp = {
				center : myCenter,
				zoom : 5,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

			//Add a Marker
			var marker = new google.maps.Marker({
				position : myCenter,
			});
			marker.setMap(map);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>

</body>
</html>
