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
<link href="<c:url value='/resource/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/resource/css/customer.css'/>" rel="stylesheet">
<link href="<c:url value='/resource/css/bootstrap-slider.css'/>" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>
	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2"><jsp:include page="/sidenav.jsp" /></div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-8">
							<h2>PRODUCT</h2>
						</div>
						<div class="col-md-4">
							<form action="${pageContext.request.contextPath}/shopping/searchProduct.action">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search" name="keyword" id="srch-term">
									<div class="input-group-btn">
										<button class="btn btn-default" type="submit" id="search_btn">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- 商品明細 -->
					<div class="row">
						<div class="col-md-4">
							<img src="data:image/png;base64,${productimage}" class="img-responsive">
						</div>
						<div class="col-md-5">
							<h3>${product.name}</h3>
							<p>price : ${product.price}</p>
							<p>rating :
								<c:forEach begin="1" end="${product.rating}" step="1">
									<span class="glyphicon glyphicon-star" aria-hidden="true" style="color: yellow;"></span>
								</c:forEach>
							</p>
							<p>${product.description}</p>
							<!-- 商品描述 -->
						</div>
						<div class="col-md-3" style="border: 1px #fff solid; padding: 25px;">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<select class="form-control" id="sel1">
											<c:forEach step="1" begin="1" end="${quantity>0?10:quantity}" varStatus="q_count">
												<option>${q_count.count}</option>
											</c:forEach>

										</select>
									</div>
								</div>
								<div class="col-md-6">
									<button type="button" class="btn btn-primary" style="width: 100%;">
										<a href="javascript:void(0);" onclick="changeCart(${product.id});" class="add-to-cart">Add to cart</a>
									</button>
								</div>
								<div class="col-md-12">
									<button type="button" class="btn btn-success" style="width: 100%;">
										<a onclick="oneclick(${product.id});">One Click Buy</a>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 結束商品明細 -->
					<div class="row" style="border-top: 1px #fff solid; padding-top: 20px; margin-top: 40px;">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-9">
									<h3>Popular</h3>
								</div>
								<div class="col-md-3">
									<!-- Controls -->
									<div class="controls pull-right hidden-xs">
										<a class="left fa fa-chevron-left btn btn-success" href="#category-silder" data-slide="prev"><span
											class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a> <a class="right fa fa-chevron-right btn btn-success"
											href="#category-silder" data-slide="next"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<div id="category-silder" class="carousel slide hidden-xs">
								<!-- Wrapper for slides -->
								<div class="carousel-inner">
									<c:forEach items="${popular}" var="product" varStatus="p_count">
										<c:if test="${p_count.count % 6 == 1}">
											<c:if test="${p_count.count == 1}">
												<div class="item active">
											</c:if>
											<c:if test="${p_count.count != 1}">
												<div class="item">
											</c:if>
											<div class="row">
										</c:if>
										<div class="col-sm-2">
											<div class="col-item">
												<div class="photo">
													<a href="${pageContext.request.contextPath}/shopping/productDetial.action?productVO.id=${product.id}"><img
														src="data:image/png;base64,${productimages[product.id]}" class="img-responsive popularimg" /></a>
												</div>
											</div>
										</div>
										<c:if test="${p_count.count % 6 == 0||p_count.count == fn:length(values)}">
								</div>
							</div>
							</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 分類推薦 -->
			</div>
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
	<script type="text/javascript" src="<c:url value="/resource/js/codex-fly.js"/>"></script>
	<script type="text/javascript">
	
	var quantity;
    function changeCart(id) {
    	var url = "${pageContext.request.contextPath}/shopping/setCart.action?";
        var quantity = $("#sel1").val();
    	var data  = "cartVO.product_id="+id+"&cartVO.quantity="+quantity;
    	request = new XMLHttpRequest();
		request.onreadystatechange = doReadyStateChange;
		request.open("POST", url, true);
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
            $('html, body').animate({
                'scrollTop' : $(".cart_anchor").position().top
            });
            var itemImg = $(this).parent().parent().parent().parent().parent().find('img').eq(0);
           
            flyToElement($(itemImg), $('.cart_anchor'));
        });
    });
    
    function oneclick(id){
		 var quantity = $("#sel1").val();
		 
			var dataObj = {
					"productList" : [ {
						"product_id" : id,"quantity" : quantity
					}]
				};
			var data1 = JSON.stringify(dataObj);
			$.ajax({
				url : "<c:url value='/simulator/oneclickPackAction.action'/>",
				data : data1,
				method : "POST",
				contentType : "application/json",
			}).done(function(result) {
				if(result=true){
 					window.location.href = "<c:url value='/shopping/appointmentAction.action'/>";
				}else{
					confirm("Please try again!");
				}
			})
    }

    </script>
</body>
</html>
