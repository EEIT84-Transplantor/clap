<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/customer.css" rel="stylesheet">
<style>
.pack{
border-radius: 25px;
border: 2px solid white;
padding: 20px;
}
.btndiv{
position: relative;
min-height: 80px;
}
.btndiv button{
position: absolute;
top: 15px;
left: 0;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>

	<section id="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-2"><jsp:include page="/sidenav.jsp" /></div>
				<div class="col-md-9">
					<!-- content start-->
					<c:if test="${empty returnVOs}">Nothing to return</c:if>
					<c:forEach var="returnVO" items="${returnVOs}" varStatus="count">
					<div class="row pack">
					 
					 <div class="col-md-4" style="">
					   <img class="img-rounded img-responsive" src="data:image/png;base64,${returnVO.product_img64}">
					 </div>
					 <div class="col-md-5" style="">
					   <form role="form" action="<c:url value="/shopping/returnAction"/>" method="POST" >
					  	 <div class="form-group">
						   <s:textfield class="form-control" name="returnVO.orderform_id" type="text" label="Order Number" readonly="true" value="%{#attr.returnVO.orderform_id}" />
						 </div>
						 <div class="form-group">
						   <s:textfield class="form-control" name="returnVO.product_id" type="text" readonly="true" style="display:none;" value="%{#attr.returnVO.product_id}"/>
						   <s:textfield class="form-control" name="returnVO.product_name" type="text" label="Product Name" readonly="true" value="%{#attr.returnVO.product_name}" />
						 </div>
						 <div class="form-group">
						   <s:textfield class="form-control" name="returnVO.shipping_date" type="date" label="Shopping Date" readonly="true" value="%{#attr.returnVO.shipping_date}" />
						 </div>
						 <div class="form-group">
						   <s:textfield class="form-control" name="returnVO.orderDetail_quantity" index="${count.index}" type="number" readonly="true" label="Order Quantity"  value="%{#attr.returnVO.orderDetail_quantity}" />
						 </div>
					   </form>
					 </div>
					 <div class="col-md-3 btndiv">
					   <button class="btn btn-success" type="button">Return</button>
					 </div>					 
					</div>
					</c:forEach>




					<!-- content end-->
				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="../resource/js/jquery-1.12.2.min.js"/></script>
	<script src="../resource/js/bootstrap.min.js"/></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var returnCount = parseInt("${returnCount}");
			var maxList = [];
			for(var index=0;index<returnCount;index++){
				maxList.push($('input[index='+index+']').val());
			}
			$('input[name="returnVO.orderDetail_quantity"]').on("change", function(){
				var indexNumber = $(this).attr("index");
				if($(this).val()> maxList[indexNumber]){
					$(this).val(maxList[indexNumber]);
				};

				
			});
			$("button.btn-success").on("click", function() {
				
				
				$(this).parent().prev().children().eq(0).submit();
			});
			$("form").submit(function(event) {
				if ("" != "") {
					
					event.preventDefault();
				} else {
					
					return;
				}
			});
		});
	</script>
</body>
</html>
