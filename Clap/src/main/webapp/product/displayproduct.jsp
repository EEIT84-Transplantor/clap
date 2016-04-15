<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	java.util.List<product.model.ProductVO> productVOs = (java.util.List<product.model.ProductVO>) request
			.getAttribute("productVOs");
	if (productVOs == null) {
		response.sendRedirect(request.getContextPath() + "/product/preDisplayAction.action");
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

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/jquery-ui.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/jquery-ui.structure.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/jquery-ui.theme.min.css"/>" rel="stylesheet">
<style type="text/css">
input, select {
	background-color: black;
}

#insertform {
	display: none;
}


#hi {
	display: none;
}

#message {
	color: red;
}

.showimg {
	width: 10%;
}

.showimg img {
	width: 70%;
	height: auto;
}
.table-to-update td{
max-width:100px;
word-wrap:break-word;
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
				<div class="col-md-2">
				<jsp:include page="/sidenav.jsp" />
				</div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-11">
							<input type="button" value="Add New Item" id="add" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-11">
							<form id="insertform" action="${pageContext.request.contextPath}/product/setProductAction.action" method="POST"
								enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-condensed table-condensedalot">
										<thead>
											<tr>
												<th>Picture</th>
												
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
												<th><input type="file" name="upload" /></th>
												<th><input class="form-control col-md-1" type="text" name="productVO.name" /></th>
												<th><input class="form-control col-md-1" type="number" min="0" name="productVO.price" /></th>
												<th><input class="form-control col-md-1" type="text" name="productVO.description" /></th>
												<th><input class="form-control col-md-1" type="number" min="0" max="1" name="productVO.discount" /></th>
												<th><select id="category" name="productVO.category_id">
													<c:forEach items="${categoryVOs}" var="row">
														<option value="${row.id}">${row.name}</option>														
													</c:forEach>
												</select></th>
												<th><input id="submitInsert" type="submit" value="add" /> <input id="insertCancel" type="button" value="cancel" /></th>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
						</div>
					</div>
					<p id="message"></p>
					<div class="row">

						<div class="col-md-11">
							<table id="example" class="table table-to-update">
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
									<c:forEach var="productVO" varStatus="index" items="${productVOs}">
										<tr>
											<td class="showimg">
											  <c:if test="${not empty productImgs[index.count-1]}">
													<img class="img-responsive img-rounded" src="data:image/png;base64,${productImgs[index.count-1]}" />
													<input type="file" id="img${productVO.id}" class="Uploadimage" name="productImg" style="display: none; width: 100%;">
											  </c:if> 
											  <c:if test="${empty productImgs[index.count-1]}">
											  		<img class="img-responsive img-rounded" src="" style="display: none; width: 100%;"/>
													<input type="file" id="img${productVO.id}" class="Uploadimage" name="productImg">
											  </c:if>
											  
											</td>
											<td>${productVO.id}</td>
											<td class="col-md-1">
											  <label>${productVO.name}</label> 
											  <input type="text" class="form-control" name="productVO.name" value="${productVO.name}" style="display:none; width:100%;">
											</td>
											<td class="col-md-1">
											  <label>${productVO.price}</label> 
											  <input type="number" min="0" class="form-control" name="productVO.price" value="${productVO.price}" style="display: none">
											</td>
											<td class="col-md-4">
											  <label>${productVO.description}</label> 
											  <input type="text" class="form-control" name="productVO.description" value="${productVO.description}" style="display: none">
											</td>
											<td>${productVO.rating}</td>
											<td class="col-md-1">
											  <label>${productVO.discount}</label> 
											  <input type="number" min="0" max="1" class="form-control" name="productVO.discount" value="${productVO.discount}" style="display: none">
											</td>
											<td class="col-md-1">
											  <label>${productVO.categoryVO.name}</label> 
											  <input type="text" class="form-control" name="productVO.categoryVO.name" value="${productVO.categoryVO.id}" style="display: none" readonly="readonly">
											</td>
											<td class="col-md-3">
											  <img class="delete" src="${pageContext.request.contextPath}/resource/images/empty-trash-512.png" height="20px" width="20px" /> 
											  <button class="btn btn-primary btn-xs sendUpdate" type="button">Update</button> 
											  <button class="btn btn-default btn-xs cancelUpdate" type="button">Cancel</button>
											</td>

										</tr>

									</c:forEach>
								</tbody>
							</table>

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>
	<div id="ajaxBox" style="display:none;">
	</div>
	<img id="imgBox" class="imgBox" style="display:none;"/>
	
	<!-- 載入js -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.12.2.min.js" /></script>
	<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js" /></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.12.0.min.js" /></script>
	<script src="${pageContext.request.contextPath}/resource/js/jquery-ui.min.js" /></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js" /></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js" /></script>

	<script type="text/javascript">
	
	var uploadFiles64 = new Object();
	function loadImageFileAsURL(id)
	{
		
	    var filesSelected = document.getElementById(id).files;
	    if (filesSelected.length > 0)
	    {
	        var fileToLoad = filesSelected[0];	 
	        var fileReader = new FileReader();	 
	        fileReader.onload = function(fileLoadedEvent)  {
	 	     
	            var fileBase64 = fileLoadedEvent.target.result;
	            $("input[id="+id+"]").prev().css("width", "100%").attr("src",fileBase64).show();
	            uploadFiles64[id] = fileBase64;
	        };	 
	        fileReader.readAsDataURL(fileToLoad);
	    }
	}
	
	$("td>label").on("click", function() {
		if($(this).next().attr("name") != "productVO.categoryVO.name"){
			$(this).hide();
			$(this).next().css("width", "auto").show().focus();
		}				
		
	});
	var selectedTD;
	$("td.showimg").on("click", function(){
		selectedTD = $(this);
		selectedTD.children().first().hide();
		selectedTD.children().last().css("width", "100%").show().focus();
	}).on("blur", function(){
		selectedTD.children().last().hide();
		selectedTD.children().first().show();		
	});
	$("td.showimg>input").on("change",function(){
		loadImageFileAsURL($(this).attr("id"));
		});
	$("td.showimg img").on("mouseover",function(){
		$(this).css("opacity", "0.6");		
		var srcToMove = $(this).attr("src");
		
		var position =$(this).offset();
		var bottomPosition = position.top - 5;
		var widthFixed = $(window).width() * 0.1;
		var leftPosition = position.left - 10 - widthFixed;
		
								
		$("#imgBox").attr("src", srcToMove).css("background-color","white").css("color","black")
		.css("border","2px solid silver").css("border-radius","20px")
		.css("position","absolute").css("top", bottomPosition)
		.css("left", leftPosition).css("width", widthFixed).fadeIn();
		
// 		"data:image/png;base64,";
	}).on("mouseout", function(){
		$("#imgBox").hide();
		$(this).css("opacity", "1");		
	}).on("blur", function(){
		$("#imgBox").hide();
		$(this).css("opacity", "1");		
	});
	
	$("td>input").on("change", function() {
		if($(this).attr("name")=="productVO.price"){
			if($(this).val()<0){
				$(this).val(0);
			}
		}else if($(this).attr("name")=="productVO.discount"){
			if($(this).val()<0||$(this).val()>1){
				$(this).val(1);
			}
		}
		$(this).prev().html($(this).val());
	}).on("blur", function() {
		$(this).hide();
		$(this).prev().show();
	});
	
	
	$('#submitInsert').on("click", function() {
		alert("add product");
	});
	
	$("button.cancelUpdate").on("click", function(){
		
		location.reload();
	});
	var updateJQobj;
	
	$('button.sendUpdate').on("click", function() {
		updateJQobj = $(this);
		var dataObj = {
				"productVO.id":"id", 
				"productVO.name":"name","productVO.price":"100",
				"productVO.description":"xxx",
				"productVO.discount":"1", 
				"productVO.category_id":"2"
		};
		
		var index=1;
		for(var key in dataObj) {
			if(index == 1){
				dataObj[key] = $(this).parent().parent().children().eq(1).text();
			}else if(index!=5 && index!=7){
				dataObj[key] = $(this).parent().parent().children().eq(index).children().text();
			}else if (index==7){
				dataObj[key] = $(this).parent().parent().children().eq(index).children().eq(1).val();			
			}else{
				dataObj[key] = $(this).parent().parent().children().eq(6).children().text();
				index++;
			}
			index++;
//				alert(dataObj[key]);
		}
		
		dataObj.productimg64 = uploadFiles64['img'+dataObj['productVO.id']];
		
		console.log(dataObj['productVO.id']+" "+dataObj['productVO.name']+" "+dataObj['productVO.description']);
		//var data = table.row($(this).parent().parent().children(':first')).data();
		//console.log(data[1]);		
		if (confirm("Do you want to update this product?") == true) {
			$.ajax({
				method: "POST",
				  url: "${pageContext.request.contextPath}/product/updateProductAction.action",
				  data:dataObj
			}).done(function(msg){
				var jsonObj = JSON.parse(msg);
					
				var position =updateJQobj.offset();
				var topPosition = position.top - 35;
				var leftPosition = position.left - 10;
										
				$("#ajaxBox").css("background-color","white").css("color","black")
				.css("padding","10px").css("padding-top","5px").css("padding-bottom","5px")
				.css("border","1px solid black").css("border-radius","20px")
				.css("position","absolute").css("top", topPosition)
				.css("left", leftPosition).css("box-shadow", "0px 0px 3px silver")
				.css("width","auto").html(jsonObj.message).fadeIn();
				setTimeout(function(){$("#ajaxBox").fadeOut(); location.reload();}, 500);
			});
		}
	});

	var removeJQobj;
	$('img.delete', 'tbody tr:nth-child(2n)').css("opacity","0.6").hover(function(){
		removeJQobj = $(this);
		removeJQobj.css("opacity","1");
		
	},function(){
		removeJQobj.css("opacity","0.6");
	});
	$('img.delete', 'tbody tr:nth-child(2n+1)').css("opacity","0.6").hover(function(){
		removeJQobj = $(this);
		removeJQobj.css("opacity","1");
		
	},function(){
		removeJQobj.css("opacity","0.6");
	});
	
	$('.delete').click(function() {
		removeJQobj = $(this);
		if (confirm("Do you want to delete this product?") == true) {
			var dataObj = {productId: removeJQobj.parent().parent().children().eq(1).text()};
			$.ajax({
				method: "POST",
				  url: "${pageContext.request.contextPath}/product/removeProductAction.action",
				  data: dataObj
			}).done(function(msg){
				location.reload();
			});

		}
	});
		$(document).ready(function() {
			var table = $('#example').DataTable();

			$("#add").on("click", function() {

				$("table.table-condensedalot tr>th:first-child").css("max-width","13em").css("width","auto");
				$("table.table-condensedalot tr>th>input:first-child").css("max-width","13em").css("width","auto");
				$("#insertform").show();
			});
			$("td.showimg>input").css("width", "100%");
			
			
			
			$('tbody tr td').on("click", function() {
				var data = table.cell(this).data();
				//console.log(data);
				// 			if(!$(this).is(':last-child')){
				// 				$(this).attr("contenteditable",'true');
				// 			}

			});
			$('tbody tr td').blur(function() {
				if (!$(this).is(':last-child')) {
					//console.log(table.row($(this).parent()).data());
					// 				$(this).siblings(":last");	
				}

			});
			$("#insertCancel").on("click", function() {
				$("#insertform").css("display", "none");
			});

			
			function sendPostRequestProduct(url, data) {
				request = new XMLHttpRequest();
				request.onreadystatechange = doReadyStateChange;
				request.open("POST", url, true);
				console.log(url);
				request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				request.send(data);
				console.log(url + '33');
			}
			;
			function doReadyStateChange() {
				if (request.readyState == 4) {
					if (request.status == 200) {
						processJSON(request.responseText);
					} else {
						console.log("Error Code:" + request.status + ", " + request.statusText);
					}
				}
			}

			function processJSON(data) {
				var json = JSON.parse(data);
				var isChanged = json[0].isChanged;
				var message = json[0].message;
				$('#message').html(message);
				if (isChanged) {
					table.row('.selected').remove().draw(false);
				} else {
					$('.selected').removeAttr('class');
				}
			}
			// 		$("#Uploadimage").on("click",function(){
			// 			$(this).hide();
			// 			$(this).next().show().focus();

			// 		});
// 			$("input[type='image']").change(function() {
// 				$("input[id='Uploadimage']").click();
// 			});
			
		});
	</script>
</body>
</html>

