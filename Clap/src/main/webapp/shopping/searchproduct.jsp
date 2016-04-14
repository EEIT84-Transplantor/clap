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
							<h2>Search result</h2>
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
					<div class="row" style="margin-bottom: 15px;" id="searchProduct">
					<c:if test="${empty products[0]}">
					Sorry, we can't find anything..QQ
					</c:if>
					
					<c:forEach items="${products}" var="product" varStatus="p_count">
						
	
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-bottom:20px;">
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
						
				
				
				</c:forEach>
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
	<script type="text/javascript" src="<c:url value='/resource/js/bootstrap-slider.js'/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/codex-fly.js"/>"></script>

	<script type="text/javascript">
	
	//ajax
	function ajax(url, data) {
		var result;
		$.ajax({
			url : url,
			data : data,
		}).done(function(msg) {
		    getproduct(msg);
		})
		
	}
	function getproduct(msg){
		var productArray = JSON.parse(msg);
		$("#searchProduct").text("");
		for(var index in productArray){
			$("#searchProduct").append('<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-bottom:20px;"><div class="hovereffect"><img class="img-responsive" src="<c:url value="/resource/images/orgins/brain.jpg"/>" alt=""><div class="overlay"><h2>'+productArray[index].name+'</h2><p><span>$'+productArray[index].price+'</span> <a class="info add-to-cart" href="javascript:void(0);" onclick="changeCart('+productArray[index].id+');">ADD TO CART</a></p></div></div></div>');
		}
	};
	
//搜尋
var keyword;

$("#srch-term").next().find('button').on("click",function(){
	keyword = $("#srch-term").val();
	 var url = "<%=request.getContextPath()%>/shopping/searchProduct.action";
	 var data = {"page":"search","keyword":keyword};
	 ajax(url, data);
});


var min;
var max;

var slider = new Slider('#p_price', {});
slider.on('slide', function (ev) {
	
    var pricerange = $('#p_price').val().split(",");
    min = pricerange[0];
    max = pricerange[1];
    document.getElementById("min_price").innerHTML="$"+min;
    document.getElementById("max_price").innerHTML="$"+max;
    var url = "<%=request.getContextPath()%>/shopping/searchProduct.action";
	var data = {"page":"search","min":min,"max":max,"keyword":keyword};

	ajax(url, data);
});

</script>
	<script type="text/javascript">
    function changeCart(id) {
    	var url = "${pageContext.request.contextPath}/shopping/setCart.action?";
    	var data  = "cartVO.product_id="+id;
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
        $('#searchProduct').on('click','.add-to-cart',function(){
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
