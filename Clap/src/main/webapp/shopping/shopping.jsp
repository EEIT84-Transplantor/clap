<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/>"
	rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>

	<section id="top-wrap">
		<!-- TOP SEARCH BAR-->
		<div class="navbar-wrapper">
			<div class="container">
				<nav class="navbar navbar-static-top shoppingbar">
					<div class="container">
						<div class="navbar-header">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search"
									name="srch-term" id="srch-term">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</div>

					</div>
				</nav>
			</div>
		</div>
		<!-- END TOP SEARCH BAR-->

		<!-- Carousel -->
		<div id="shoppingbanner" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#shoppingbanner" data-slide-to="0" class="active"></li>
				<li data-target="#shoppingbanner" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="first-slide" src="../resource/images/banner-1.jpg"
						alt="See more future.">
					<div class="container">
						<div class="carousel-caption">
							<h2>See more future.</h2>
							<p>That's one small step for CLAP, one giant leap for
								mankind.</p>
						</div>
					</div>
				</div>
				<div class="item">
					<img class="third-slide" src="../resource/images/banner-2.jpg"
						alt="Improve your life">
					<div class="container">
						<div class="carousel-caption">
							<h2>New life revolution</h2>
							<p>That's one small step for CLAP, one giant leap for
								mankind.</p>
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#shoppingbanner" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#shoppingbanner"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->



		<%-- 		<c:forEach items="${allCategoryProduct}" var="CategoryProducts"> --%>
		<%--                  ${CategoryProducts.key} :==:<br> --%>



		<%-- 			<c:forEach items="${CategoryProducts.value}" var="product"> --%>
		<%--                  ${product}<br> --%>
		<%-- 			</c:forEach> --%>




		<%-- 		</c:forEach> --%>






		<!-- 分類推薦 -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<c:forEach items="${allCategoryProduct}" var="CategoryProducts">
						<div class="row">
							<div class="col-md-9">
								<h3 class="b_color">${CategoryProducts.key}</h3>
							</div>
							<div class="col-md-3">
								<!-- Controls -->
								<div class="controls pull-right hidden-xs">
									<a class="left fa fa-chevron-left btn btn-success"
										href="#category-silder" data-slide="prev"><span
										class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>
									<a class="right fa fa-chevron-right btn btn-success"
										href="#category-silder" data-slide="next"><span
										class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></a>
								</div>
							</div>
						</div>
						<div id="category-silder" class="carousel slide hidden-xs">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<c:forEach items="${CategoryProducts.value}" var="product"
										varStatus="p_count">
										<c:if test="${p_count.count % 4 == 1}">
											<div class="row">
										</c:if>
										<div class="col-sm-3">
											<div class="col-item">
												<div class="photo">
													<img src="../resource/images/orgins/brain.png"
														class="img-responsive" alt="a" />
												</div>
												<div class="info">
													<div class="row">
														<div class="price col-md-12">
															<h4>${product.name}</h4>
															<!--<h5 class="price-text-color">$199.99</h5> -->
														</div>

													</div>
												</div>
												<div class="g_btn">
													<div class="separator clear-left">
														<p class="btn-add">
															<i class="fa fa-shopping-cart"></i><a href="javascript:void(0);"
																onclick="changeCart(${product.id});" class="hidden-sm add-to-cart">Add
																to cart</a>
														</p>
														<p class="btn-details">
															<i class="fa fa-list"></i><a href="#" class="hidden-sm">More
																details</a>
														</p>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>

										<c:if
											test="${p_count.count % 4 == 0||p_count.count == fn:length(values)}">
								</div>
								</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		</c:forEach>
		</div>
		</div>
		</div>

		<!-- 分類推薦 -->





		</div>
		<!-- row -->

		</div>
		<!-- container -->
		</div>
		<!-- wrap -->
	</section>

	<footer><jsp:include page="/footer.jsp" /></footer>

	<!-- 載入js -->
	<script type="text/javascript"
		src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/resource/js/codex-fly.js"/>"></script>
	<script type="text/javascript">
    function changeCart(id) {
    	var url = "${pageContext.request.contextPath}/shopping/setCart.action?";
    	var data  = "productVO.id="+id;
    	request = new XMLHttpRequest();
		request.onreadystatechange = doReadyStateChange;
		request.open("POST", url, true);
		console.log(url);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		request.send(data);
	}
    
    function doReadyStateChange() {
		if (request.readyState == 4) {
			if (request.status == 200) {
                $(".cart_anchor").text(request.responseText);
                
			} else {
				console.log("Error Code:" + request.status + ", "+ request.statusText);
			}
		}
	}
    
    //飛入購物車
    $(document).ready(function(){
        $('.add-to-cart').on('click',function(){
            //Scroll to top if cart icon is hidden on top
            $('html, body').animate({
                'scrollTop' : $(".cart_anchor").position().top
            });
            //Select item image and pass to the function
            var itemImg = $(this).parent().parent().parent().parent().children().find('img').eq(0);
            flyToElement($(itemImg), $('.cart_anchor'));
        });
    });
    </script>

</body>
</html>
