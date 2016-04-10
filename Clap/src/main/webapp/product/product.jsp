<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="../resource/css/bootstrap.min.css" rel="stylesheet">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
      rel="stylesheet">
<link href="../resource/css/customer.css" rel="stylesheet">
<style type="text/css">
	input{
		background-color:black;
	}
</style>
</head>
<body>
    <header>
	 <jsp:include page="/header.jsp" />
	</header>
<c:set var="productVOs" value="{2000,3000,20300}"/>
	<section id="wrap">
		<div class="container-fulid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<input type="button" value="Add New Item" id="add"/>
			</div>
			<div class="col-md-1"></div>
				
		</div>
		<div class="row">
			<div class="col-md-1">side-nav:sub-menu</div>
			<div class="col-md-10">
			<table id="example" class="table">
	        <thead>
	            <tr>
	                <th>Picture</th>
<!-- 	                <th>Id</th> -->
<!-- 	                <th>Name</th> -->
<!-- 	                <th>Price</th> -->
<!-- 	                <th>Description</th> -->
<!-- 	                <th>Rating</th> -->
<!-- 	                <th>Discount</th> -->
<!-- 	                <th>Category</th> -->
	            	<th></th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="productVO"  varStatus="index" items="${productVOs}">
	              	<tr>
		          
						<!-- ~需要一個servlet讀照片~ -->
		<%-- 			${pageContext.request.contextPath}/products/productImgServlet.action?id=[index.count-1] --%>
		                <td><img src="../resource/images/visa.png" height="20px" width="20px"/></td> 
		<%--                 <td>${productVO.id}</td> --%>
		<%--                 <td>${productVO.name}</td> --%>
		<%--                 <td>${productVO.price}</td> --%>
		<%--                 <td>${productVO.description}</td> --%>
		<%--                 <td>${productVO.rating}</td> --%>
		<%--                 <td>${productVO.discount}</td> --%>
		<%--                 <td>${productVO.category}</td> --%>
		            	<td class="delete"><img src="../resource/images/delete.png" height="20px" width="20px"/></td>
		       		 
		            </tr>
	              	
	              	
	              	
	              	
	      	            	            
		            
	         
	            
	       		</c:forEach>
	        </tbody>
	    </table>
    	<div class="col-md-1"></div>
    </div>
		
	</div>
	</div>
	</section>

	<footer>
	<jsp:include page="/footer.jsp" />
	</footer>

	<!-- 載入js -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.12.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
	    var table = $('#example').DataTable();

// 		$( "#add" ).click();
		$( "#add" ).click(function() {
			table.row().add( [
			            "<input type='text'>",
			            "<input type='text' >",
			           
			        ] ).draw( false );
		});
		$('.delete').click( function () {
			alert("clicked");
			$(this).parent().addClass('selected');
			table.row('.selected').remove().draw( false );
	    } );
	
	} );

	</script>
</body>
</html>

