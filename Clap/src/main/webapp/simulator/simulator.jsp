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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/simulator.css"/>" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>

	<section id="top-wrap">
		<!-- TOP SEARCH BAR-->
		<div class="navbar-wrapper">
				<nav class="navbar navbar-static-top shoppingbar">
					<div class="container">
						

					</div>
				</nav>
			
		</div>
		<!-- END TOP SEARCH BAR-->

		<!-- 換背景 -->
		<div id="shoppingbanner" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#shoppingbanner" data-slide-to="0" class="active medical_img" ></li>
				<li data-target="#shoppingbanner" data-slide-to="1" class="shape_img"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="first-slide" src="../resource/images/banner-1.jpg" alt="See more future.">
				</div>
				<div class="item">
					<img class="third-slide" src="../resource/images/banner-2.jpg" alt="Improve your life">
				</div>
			</div>
		</div>
		<!-- /.carousel -->
		<!-- 分類推薦 -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<c:forEach items="${allCategoryProduct}" var="CategoryProducts">
						<div class="row">
							<div class="col-md-9">
								
								<h3 ><a class="b_color" href="${pageContext.request.contextPath}/shopping/categories.action?organ=${CategoryProducts.key}">${CategoryProducts.key}</a></h3>
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
								
									<c:forEach items="${CategoryProducts.value}" var="product" varStatus="p_count">
										<c:if test="${p_count.count % 4 == 1}">
										<c:if test="${p_count.count == 1}">
										<div class="item active">
										</c:if>
										<c:if test="${p_count.count != 1}">
										<div class="item">
										</c:if>
											<div class="row">
										</c:if>
										<div class="col-sm-3">
											<div class="col-item">
												<div class="photo">
													<img src="../resource/images/orgins/brain.png"
														class="img-responsive" alt="" />
												</div>
											</div>
										</div>

										<c:if test="${p_count.count % 4 == 0||p_count.count == fn:length(values)}">
								  </div>
								    </div>
								</c:if>
					</c:forEach>
				
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

	<footer style="margin-top:-15px;"><jsp:include page="/footer.jsp" /></footer>

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
    	var data  = "cartVO.product_id="+id;
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
    $('.carousel').carousel({
        interval: false
    }); 
    </script>

</body>
</html>
