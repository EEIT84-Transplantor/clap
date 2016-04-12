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
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/bootstrap-slider.css"/>" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-3"><jsp:include page="/sidenav.jsp" /></div>
				<div class="col-md-9">
					<div class="row">
						<div class="col-md-8">
							<h2>PRODUCT</h2>
						</div>
						<div class="col-md-4">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 商品明細 -->
					<div class="row">
						<div class="col-md-4">
							<img src="../resource/images/orgins/brain.png" class="img-responsive">
						</div>
						<div class="col-md-8">
							<h3>productname</h3>
							<p>price : 99.9</p>

							<div class="row">
								<div class="col-md-4">

									<div id="1" class="input-group input-group-option quantity-wrapper">

										<span class="input-group-addon input-group-addon-remove quantity-remove btn"> <span class="glyphicon glyphicon-minus"></span>
										</span> <input id="1inp" type="text" value="6" name="option[]" class="form-control quantity-count" placeholder="1"> <span
											class="input-group-addon input-group-addon-remove quantity-add btn"> <span class="glyphicon glyphicon-plus"></span>
										</span>

									</div>
								</div>

								<div class="col-md-4">
									<button type="button" class="btn btn-primary">Add to cart</button>
								</div>

								<div class="col-md-4">

									<button type="button" class="btn btn-success">One Click Buy</button>
								</div>



							</div>
							<!-- 商品描述 -->
					<div class="row">
						<div class="col-md-12 p_discribe" >
							<p>心臟是一種在人類和其他動物都有的肌造器官，它的功用是推動循環系統中血管的血液[1]。血液提供身體氧氣以及養分，同時也協助身體移除代謝廢棄物[2]。心臟位於胸部縱隔腔的中間部位[3] 。
								人類、其他哺乳類、鳥類的心臟可分為四個腔室：左右心房（上半部）、左右心室（下半部）心臟是一種在人類和其他動物都有的肌造器官，它的功用是推動循環系統中血管的血液[1]。血液提供身體氧氣以及養分，同時也協助身體移除代謝廢棄物[2]。心臟位於胸部縱隔腔的中間部位[3] 。
								人類、其他哺乳類、鳥類的心臟可分為四個腔室：左右心房（上半部）、左右心室（下半部）心臟是一種在人類和其他動物都有的肌造器官，它的功用是推動循環系統中血管的血液[1]。血液提供身體氧氣以及養分，同時也協助身體移除代謝廢棄物[2]。心臟位於胸部縱隔腔的中間部位[3] 。
								人類、其他哺乳類、鳥類的心臟可分為四個腔室：左右心房（上半部）、左右心室（下半部）。
								</p>
						</div>
					</div>
						</div>


					</div>
					<!-- 結束商品明細 -->

					

				</div>
				<!-- 結束商品描述 -->
			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</section>
	<!-- wrap -->

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript">
// 		$('#star').raty('score');
	</script>
</body>
</html>
