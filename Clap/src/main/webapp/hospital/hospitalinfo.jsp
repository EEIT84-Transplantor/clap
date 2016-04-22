<%@page import="org.junit.runner.Request"%>
<%@page import="org.springframework.web.context.request.RequestScope"%>
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
									<div class="col-md-9">
										<div class="form-group">
											<div style="width: 40%; display: inline-block;">
												<select class="form-control" id="citySelect">
                                                    <c:forEach var="location" items="${locations}">
													<option value="${location.id}">${location.name}</option>
													</c:forEach>
												</select>
											</div>
											<div style="width: 40%; display: inline-block;">
												<select class="form-control" id="hospitalSelect">
													<option value="all">all</option>
													<c:forEach var="hospital" items="${hospitals}">
													<option value="${hospital.address}">${hospital.name}</option>
													</c:forEach>
												</select>
											</div>
											<div style="width: 5%; display: inline-block;">
												<button type="button" class="btn btn-warning" id="selectH">Warning</button>
											</div>
										</div>
									</div>

									<div class="col-md-3">
										<div class="input-group">

											<input type="textbox" class="form-control" placeholder="Search" name="srch-term" id="address" value="臺大醫院">
											<div class="input-group-btn">
												<button class="btn btn-default" type="submit" id="submit">
													<i class="glyphicon glyphicon-search"></i>
												</button>
											</div>
										</div>
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
	
	$("#citySelect").on("change",function(){
		var  url = "<%=request.getContextPath()%>/hospital/hospitalInfo";
		var  loaction = $(this).val();
		$.ajax({
			method:"POST",
			url:url,
			data: {"location":loaction}
		}).done(function(msg){
			 console.log();
			 
			 $("#hospitalSelect").html('<option value="all">all</option>');
			 
			 
			 for(var i =0;i<msg["hospitals"].length;i++){
			 $("#hospitalSelect").append($('<option>', { 
			        value: msg["hospitals"][i].address,
			        text : msg["hospitals"][i].name 
			    }));
			 
			 }
		});
	});
	
		var markers = [];
		var map;
		var geocoder;
		function initMap() {
			map = new google.maps.Map(document.getElementById('mapa'), {
				zoom : 12,
				center : {
					lat : 52.520,
					lng : 13.410
				}
			});

			geocoder = new google.maps.Geocoder();

			document.getElementById('submit').addEventListener('click', function() {
				geocodeAddress("search", geocoder, map);
			});
			document.getElementById('selectH').addEventListener('click', function() {
				geocodeAddress("select", geocoder, map);
			});
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
		var totalHospital;
		function geocodeAddress(target, geocoder, resultsMap) {

			var address = [];
			if (target == "search") {
				address.push(document.getElementById('address').value);

			} else if (target = "select") {
				var temp = document.getElementById('hospitalSelect');
				if (temp.value == "all") {
					for (var i = 1; i < temp.length; i++) {
						address.push(temp.options[i].value);
					}
				} else {
					address = [ temp.value ];
				}
			}

			totalHospital = [];
			for (var i = 0; i < address.length; i++) {
				geocoder.geocode({
					'address' : address[i]
				}, function(results, status) {
					if (status === google.maps.GeocoderStatus.OK) {
						addHlocation(results[0].geometry.location, address, resultsMap);
					} else {
						alert('Geocode was not successful for the following reason: ' + status);
					}
				});
			}
		}

		function addHlocation(location, address, resultsMap) {
			totalHospital.push(location);
			if (address.length == totalHospital.length) {
				//清除所有座標
				clearMarkers();
				//設定地圖中心
				resultsMap.setCenter(totalHospital[0]);
				//每隔0.2秒加入一間醫院
				for (var i = 0; i < totalHospital.length; i++) {
					addMarkerWithTimeout(totalHospital[i], i * 200);
				}
			}
		}
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgpurFmJH7EtCW7FEf_VI_w4l9b2aBVMk&signed_in=true&callback=initMap"></script>

</body>
</html>
