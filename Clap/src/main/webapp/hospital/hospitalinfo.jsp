<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="<c:url value="/resource/css/bootstrap-slider.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">

<!-- 在這加上你自己的css檔案連結  -->
<style type="text/css">
#map {
	height: 100%;
}

#floating-panel {
	padding: 5px;
	font-family: 'Roboto', 'sans-serif';
}

</style>
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>
	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2"><jsp:include page="/sidenav.jsp" /></div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<h2>Hospital Info</h2>
							<p>texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext</p>
							<div id="floating-panel">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label for="sel_city">city:</label> <select class="form-control" id="sel1">
												<option>1</option>
												<option>2</option>
											</select>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="sel1">hospital:</label> <select class="form-control" id="sel1">
												<option>1</option>
												<option>2</option>
											</select>
										</div>
									</div>
									<div class="col-md-2">
										<button type="button" class="btn btn-warning" style="margin-top:25px;" id="drop" onclick="drop()">Warning</button>
									</div>
									
								</div>
							</div>
							<div id="mapa" style="width: 100%; height: 500px;"></div>
						</div>
					</div>
				</div>
				<!-- efw -->
			</div>
			<!-- row -->
		</div>
		<!-- container -->
		</div>
		<!-- wrap -->
	</section>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value='/resource/js/jquery-1.12.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resource/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resource/js/json2.js'/>"></script>
	<script type="text/javascript">
		var neighborhoods = [ {
			lat : 52.511,
			lng : 13.447
		}, {
			lat : 52.549,
			lng : 13.422
		}, {
			lat : 52.497,
			lng : 13.396
		}, {
			lat : 52.517,
			lng : 13.394
		} ];

		var markers = [];
		var map;

		function initMap() {
			map = new google.maps.Map(document.getElementById('mapa'), {
				zoom : 12,
				center : {
					lat : 52.520,
					lng : 13.410
				}
			});
		}

		function drop() {
			clearMarkers();
			for (var i = 0; i < neighborhoods.length; i++) {
				addMarkerWithTimeout(neighborhoods[i], i * 200);
			}
		}

		function addMarkerWithTimeout(position, timeout) {
			window.setTimeout(function() {
				markers.push(new google.maps.Marker({
					position : position,
					map : map,
					animation : google.maps.Animation.DROP
				}));
			}, timeout);
		}

		function clearMarkers() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgpurFmJH7EtCW7FEf_VI_w4l9b2aBVMk&signed_in=true&callback=initMap"></script>

</body>
</html>
