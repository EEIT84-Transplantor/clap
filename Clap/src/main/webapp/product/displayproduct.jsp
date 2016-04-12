<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% java.util.List<product.model.ProductVO> productVOs = (java.util.List<product.model.ProductVO>)request.getAttribute("productVOs"); 
    if(productVOs==null){
    	response.sendRedirect(request.getContextPath()+"/product/preDisplayAction.action");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
      rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<style type="text/css">
	input, select{
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
	.showimg{
	width:15%;
	}
	.showimg img{
	width:70%;
	height:auto;
	}

</style>
</head>
<body>
    <header>
	 <jsp:include page="/header.jsp" />
	</header>
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
			<form id="insertform" action="${pageContext.request.contextPath}/product/setProductAction.action" method="POST" enctype="multipart/form-data">
				<table  class="table">
					 <thead>
			            <tr>
			                <th>Picture</th>
			                <th>Id</th>
			                <th>Name</th>
			                <th>Price</th>
			                <th>Description</th>
			                <th>Discount</th>
			                <th>Category</th>
			            	<th></th>
			            </tr>
			        </thead>
			        <tbody>
	              	<tr>
						<!-- ~需要一個servlet讀照片~ -->

<%-- 					${pageContext.request.contextPath}/products/productImgServlet.action?id=[index.count-1] --%>
		                <th><input type="file" name="upload"/></th>
		                <th><input type="text" name="productVO.id"/></th>
		                <th><input type="text" name="productVO.name"/></th>
		                <th><input type="text" name="productVO.price"/></th>
		                <th><input type="text" name="productVO.description"/></th>
		                <th><input type="text" name="productVO.discount"/></th>
		                <th><select id="category" name="productVO.category_id">

							  <option value="1">Lung</option>
							  <option value="2" >Liver</option>
							  <option value="3">Kidney</option>
							</select></th>
				      	<th><input id="submitInsert" type="submit" value="add"/><input id="insertCancel" type="button" value="cancel"/></th>
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
<!-- 	        <tr id="hi"> -->
<!-- 	            <td><input type="text"/></td>  -->
<!--             	<td><input id="insertConfirm" type="submit" value="add"/><input id="insertCancel" type="button" value="cancel"/></td> -->
<!--             </tr> -->
        	<c:forEach var="productVO"  varStatus="index" items="${productVOs}">
	              	<tr>
		                <td class="showimg" >
		                <c:if test="${not empty productImgs[index.count-1]}"><img class="img-responsive img-rounded" src="data:image/png;base64,${productImgs[index.count-1]}"/>
		                </c:if>
		                <input type="file" id="Uploadimage" name="productImg" style="display:none">
		                
		                </td>


		                <td>${productVO.id}</td>
		                <td>
		              		<label>${productVO.name}</label>
					    	<input type="text" class="form-control" name="productVO.name" value="${productVO.name}" style="display:none">
 							</td>
		                <td><label>${productVO.price}</label>
					    	<input type="number" class="form-control" name="productVO.price" value="${productVO.price}" style="display:none">
		                </td>
		                <td><label>${productVO.description}</label>
					    	<input type="text" class="form-control" name="productVO.description" value="${productVO.description}" style="display:none">
		                </td>
		                <td>${productVO.rating}
					    </td>
		                <td><label>${productVO.discount}</label>
					    	<input type="number" class="form-control" name="productVO.discount" value="${productVO.discount}" style="display:none">
					    	</td>
		                <td><label>${productVO.categoryVO.name}</label>
					    	<input type="text" class="form-control" name="productVO.categoryVO.name" value="${productVO.categoryVO.name}" style="display:none">
					    </td>
		            	<td><img class="delete" src="../resource/images/delete.png" height="20px" width="20px"/>
		            	<input id="submitInsert1" type="button" value="update"/>
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
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.12.0.min.js"/>"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"/>"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"/>"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
	    var table = $('#example').DataTable();

		$( "#add" ).click(function() {
			$("#insertform").css("display","table-row");
			
		});



		$('#submitInsert').click(function(){
			alert("hhihi");
		});
		$('tbody tr td').click(function(){
			var data = table.cell(this).data();
			console.log(data);
// 			if(!$(this).is(':last-child')){
// 				$(this).attr("contenteditable",'true');
// 			}
			
		});
		$('tbody tr td').blur(function(){
			if(!$(this).is(':last-child')){
				console.log(table.row($(this).parent()).data());
// 				$(this).siblings(":last");	
			}
			
		});
	$("#insertCancel").click(function(){
			$("#insertform").css("display","none");
		});

		$('#submitInsert1').click( function () {
			alert("hello");
			var data = table.row($(this).parent().parent().children(':first')).data();
			console.log(data[1]);
			if (confirm("Do you want to update this product?") == true) {
				var data = table.row($(this).parent().parent().children(':first')).data();
				console.log(data[1]);
				var dataSend="productVO.id="+data[1]+"productVO.name="+data[2]+"productVO.price="+data[3]+"productVO.description="+data[4]
				+"productVO.rating="+data[5]+"productVO.discount="+data[6]+"productVO.category="+data[7];
				sendPostRequestProduct("${pageContext.request.contextPath}/product/updateProductAction.action?", dataSend);
			}
	    });
		
		$('.delete').click( function () {
			if (confirm("Do you want to delete this product?") == true) {
				var id = table.row($(this).parent().parent().children(':first')).data()[1];
				console.log(id);
				sendPostRequestProduct("${pageContext.request.contextPath}/product/removeProductAction.action?", "productId="+id );
				$(this).parent().parent().addClass('selected');
				alert("clicked");
			}
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
// 		$("#Uploadimage").on("click",function(){
// 			$(this).hide();
// 			$(this).next().show().focus();

// 		});
		$("input[type='image']").change(function(){
			 $("input[id='Uploadimage']").click();
		});
		$("td>label").on("click",function(){
			$(this).hide();
			$(this).next().show().focus();
		});
		
		$("td>input").on("change",function(){
			$(this).prev().html($(this).val());
		}).on("blur",function(){
			$(this).hide();
			$(this).prev().show();
		});
	} );

	</script>
</body>
</html>

