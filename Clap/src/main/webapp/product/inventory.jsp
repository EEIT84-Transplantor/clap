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
<style type="text/css">
#message{
	color:green;
	font-size:14px;
	margin:3px;
}
#error{
	color:red;
	font-size:14px;
	margin:3px;
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
				<div  class="col-md-2 col-sm-12">
				<jsp:include page="/sidenavadmin.jsp" />
				</div>
				  <div class="panel-body">
                            <div class="row">
                            <div class="col-lg-2">
                             
                            </div>
                           
                                <div class="col-lg-5">
       								<p id="message">${Message}</p>
       								<p id="error">${error}</p>
                                    <form role="form" action="${pageContext.request.contextPath}/product/inOutAction.action">
                                        <s:fielderror/>
                                        <div class="form-group">
                                            <label>Please Enter Product Name or Product Id</label><br>
                                            <label>Product Name</label>
                                            <input class="form-control" name="productName" value="${productName}">
                                           
                                        </div>
                                        <div class="form-group">
                                            <label>Product Id</label>
                                            <input class="form-control" name="inOutLogVO.product_id"  value="${inOutLogVO.product_id}">
                                        </div>
                        				 <div class="form-group">
                                            <label>Import or Export</label><br>
                                            <label class="radio-inline">
                                                <input type="radio" name="inOut" id="optionsRadiosInline1" value="in" name="inOut" checked>Import
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="inOut" id="optionsRadiosInline2" value="out" name="inOut">Export
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>Quantity</label>
                                            <input class="form-control" name="quantity" value="${quantity}">
                                           
                                        </div>
                                        <div class="form-group">
                                            <label>Manufacture Date</label>
                                            <input class="form-control" name="manufactureDate" value="${manufactureDate}">
                                        </div>
                                        <div class="form-group">
                                            <label>Expiration Date</label>
                                            <input class="form-control" name="expiryDate" value="${expiryDate}">
                                        </div>
                                        <div class="form-group">
                                            <label>Destination</label>
                                            <input class="form-control" name="inOutLogVO.destination" value="${inOutLogVO.destination}">
                                        </div>
                                      
                                        
                                   
                                        <button type="submit" class="btn btn-default">Submit</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    </form>
                                </div>
                             
                            </div>
                            
                            <div class="col-lg-2">
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
			</div>
		</div>
	</section>

	<footer>
	<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.12.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>

</body>
</html>
