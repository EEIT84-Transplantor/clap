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
	#insertform{
		display:none;
		margin:25px;
	}
	#hi{
		display:none;
	}
	#message{
	color:red;
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
			<form id="insertform" action="SetProductAction.action" >
				<table  class="table">
					 <thead>
			            <tr>
			                <th>Picture</th>
			                <th>Id</th>
			                <th>Name</th>
			                <th>Price</th>
			                <th>Description</th>
			                <th>Rating</th>
			                <th>Discount</th>
			                <th>Category</th>
			            	<th></th>
			            </tr>
			        </thead>
			        <tbody>
	              	<tr>
						<!-- ~需要一個servlet讀照片~ -->
		<%-- 			${pageContext.request.contextPath}/products/productImgServlet.action?id=[index.count-1] --%>
		                <td><input type="file" value="" name="productVO.img"/></td>
		                <td><input type="text" name="productVO.id"/></td>
		                <td><input type="text" name="productVO.name"/></td>
		                <td><input type="text" name="productVO.price"/></td>
		                <td><input type="text" name="productVO.description"/></td>
		                <td><input type="text" name="productVO.rating"/></td>
		                <td><input type="text" name="productVO.discount"/></td>
		                <td><input type="text" name="productVO.category"/></td>
		            	<td><input id="submitInsert" type="submit" value="add"/><input id="insertCancel" type="button" value="cancel"/></td>
		            </tr>
	       			 </tbody>
				</table>   
	    	</form>
    		<div class="col-md-1"></div>
   		</div>
    	</div>
    	<p id="message"></p>
		<div class="row">
			<div class="col-md-1">side-nav:sub-menu</div>
			<div class="col-md-10">
			<table id="example" class="table">
	        <thead>
	            <tr>
	                <th>Picture</th>
	                <th>Id</th>
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
<!-- 	        <tr id="hi"> -->
<!-- 	            <td><input type="text"/></td>  -->
<!--             	<td><input id="insertConfirm" type="submit" value="add"/><input id="insertCancel" type="button" value="cancel"/></td> -->
<!--             </tr> -->
        	<c:forEach var="productVO"  varStatus="index" items="${productVOs}">
	              	<tr>
		          
						<!-- ~需要一個servlet讀照片~ -->
		<%-- 			${pageContext.request.contextPath}/products/productImgServlet.action?id=[index.count-1] --%>
<%-- 		                <td><img src="data:image/png;base64,${ProductimgVOs[index-1}"/></td> --%>
		                <td><img src="../resource/images/visa.png" height="20px" width="20px"/></td> 
		                <td>12</td> 
<%-- 		                <td>${productVO.id}</td> --%>
<%-- 		                <td>${productVO.name}</td> --%>
<%-- 		                <td>${productVO.price}</td> --%>
<%-- 		                <td>${productVO.description}</td> --%>
<%-- 		                <td>${productVO.rating}</td> --%>
<%-- 		                <td>${productVO.discount}</td> --%>
<%-- 		                <td>${productVO.category}</td> --%>
		            	<td><img class="delete" src="../resource/images/delete.png" height="20px" width="20px"/>
		            	<input id="submitInsert1" type="submit" value="add"/>
		            	<input id="insertCancel" type="button" value="cancel"/></td>
		       		 
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

		$( "#add" ).click(function() {
			$("#insertform").css("display","table-row");
			
		});



		$('#submitInsert').click(function(){
			alert("hhihi");
		});
// 		$('tbody tr td').click(function(){
// 			var data = table.cell(this).data();
// 			console.log(data);
// 			if(!$(this).is(':last-child')){
// 				$(this).attr("contenteditable",'true');
// 			}
			
// 		});
// 		$('tbody tr td').blur(function(){
// 			if(!$(this).is(':last-child')){
// 				$(this).attr("contenteditable",'true');
// // 				$(this).siblings(":last");	
// 			}
			
// 		});
	$("#insertCancel").click(function(){
			$("#insertform").css("display","none");
		});

		$('#submitInsert1').click( function () {
			alert("hello");
			var data = table.row($(this).parent().parent().children(':first')).data();
			var dataSend="productVO.id"+data[1]+"productVO.name"+data[2]+"productVO.price"+data[3]+"productVO.description"+data[4]
			+"productVO.rating"+data[5]+"productVO.discount"+data[6]+"productVO.category"+data[7];
			sendPostRequestProduct("${pageContext.request.contextPath}/product/SetProductAction.action?", dataSend);
			
	    });
		
		$('.delete').click( function () {
			var id = table.row($(this).parent().parent().children(':first')).data()[1];
			console.log(id);
			sendPostRequestProduct("${pageContext.request.contextPath}/product/RemoveProductAction.action?", "productId="+id );
			$(this).parent().parent().addClass('selected');
			alert("clicked");
		
	    });
		function sendPostRequestProduct(url, data) {
			request = new XMLHttpRequest();
			request.onreadystatechange = doReadyStateChange;
			request.open("POST", url, true);
			console.log(url);
			request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			request.send(data);
			console.log(url+'33');
		};
		function doReadyStateChange() {
			if (request.readyState == 4) {
				if (request.status == 200) {
                    processJSON(request.responseText);
				} else {
					console.log("Error Code:" + request.status + ", "+ request.statusText);
				}
			}
		}
		
		function processJSON(data) {
			var json = JSON.parse(data);
		    var isChanged = json[0].isChanged;
		    var message = json[0].message;
		    $('#message').html(message);
		    if(isChanged){
				table.row('.selected').remove().draw( false );
		    }else{
		    	$('.selected').removeAttr('class');
		    }
		}
	} );

	</script>
</body>
</html>

