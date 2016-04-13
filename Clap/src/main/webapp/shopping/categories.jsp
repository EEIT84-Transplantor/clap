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
<link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet">

<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>
	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2"><jsp:include page="/sidenav.jsp" /><jsp:include page="/priceFilter.jsp" /></div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-8">
							<h2>${organ}</h2>
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
					<!--  內容可以寫這裡  -->
					<c:forEach items="${productlist}" var="product" varStatus="p_count">
						<c:if test="${p_count.count%4==1}">
							<div class="row" style="margin-bottom: 15px;">
						</c:if>

						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
							<div class="hovereffect">
								<img class="img-responsive" src="<c:url value="/resource/images/orgins/brain.jpg"/>" alt="">
								<div class="overlay">
									<h2>${product.name}</h2>
									<p>
										<span>$${product.price}</span> <a class="info add-to-cart" href="javascript:void(0);" onclick="changeCart(${product.id});">ADD TO
											CART</a>
									</p>
								</div>
							</div>
						</div>
						<c:if test="${p_count.count%4==0||p_count.count ==fn:length(values)}">
				</div>
				</c:if>
				</c:forEach>

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
	<script type="text/javascript" src="<c:url value='/resource/js/bootstrap-slider.js'/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/codex-fly.js"/>"></script>
	
	<script type="text/javascript">
//搜尋
var keyword;

$("#srch-term").next().find('button').on("click",function(){
	keyword = $("#srch-term").val();
	
	
});



var slider = new Slider('#p_price', {});
slider.on('slide', function (ev) {
    var pricerange = $('#p_price').val().split(",");
    var min = pricerange[0];
    var max = pricerange[1];
    document.getElementById("min_price").innerHTML="$"+min;
    document.getElementById("max_price").innerHTML="$"+max;
    
    
});




</script>
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
            var itemImg = $(this).parent().parent().parent().find('img').eq(0);
            flyToElement($(itemImg), $('.cart_anchor'));
        });
    });
    
    
  
    
    
    </script>
</body>
</html>
