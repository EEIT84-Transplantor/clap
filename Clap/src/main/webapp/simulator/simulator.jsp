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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet">
<link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet">
<link href="<c:url value='/resource/css/bootstrap-slider.css'/>" rel="stylesheet">
<link href="<c:url value="/resource/css/simulator.css"/>" rel="stylesheet">
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>
	<header><jsp:include page="/header.jsp" /></header>
	<section id="top-wrap">
		<div class="row">
			<div class="col-md-12">
			<div id="s_wrap">
				<div class="container" id="fullPage">
					<div class="row">
						<div class="col-md-2">
							<div id="s_setting">
								<div class="sub_setting">
									<h3>Personal Info</h3>
									<div class="s_inpnut">
										<label>Height: </label> <input type="number" min="50" max="300" name="height">
									</div>
									<div class="s_inpnut">
										<label>Weight:</label><input type="number" min="10" max="300" name="weight">
									</div>
								</div>
								<div class="sub_setting">

									<h3>Daily Behaviors</h3>
									<div class="setting_item">
										<img src="<c:url value="/resource/images/simulator/smoke.png"/>"><div id="setting1"></div>
									</div>
									<div class="setting_item">
										<img src="<c:url value="/resource/images/simulator/wine.png"/>"><div id="setting2"></div>
									</div>
									<div class="setting_item">
										<img src="<c:url value="/resource/images/simulator/sport.png"/>"><div id="setting3"></div>
									</div>
								</div>
								<div class="sub_setting">
									<h3>Environmental Setting</h3>
									<div class="factor_item">
										<img src="<c:url value="/resource/images/simulator/factor_1.png"/>">
									</div>
									<div class="factor_item">
										<img src="<c:url value="/resource/images/simulator/factor_2.png"/>">
									</div>
									<div class="factor_item">
										<img src="<c:url value="/resource/images/simulator/factor_3.png"/>">
									</div>
									<div class="factor_item">
										<img src="<c:url value="/resource/images/simulator/factor_4.png"/>">
									</div>
									<div class="clear"></div>
								</div>
								<button class="reset_btn s_btn2 tosave"><span class="glyphicon glyphicon-save" aria-hidden="true"></span></button>
								<button class="reset_btn s_btn2 toreset">RESET</button>
								<div class="sub_setting savingslot" id="saveSlot1">1st  <span class="" aria-hidden="true"></span></div>
								<div class="sub_setting savingslot" id="saveSlot2">2nd  <span class="" aria-hidden="true"></span></div>
								<div class="sub_setting savingslot" id="saveSlot3">3rd  <span class="" aria-hidden="true"></span></div>
								<button class="toclear">Clear Saves</button>
							</div>
						</div>					
						<div class="col-md-3">
							<div id="people">
<!-- 							<div id="drop" class="o_heart"></div> -->
<!-- 							<div id="drop" class="Lung"></div> -->
<!-- 							<div id="drop" class="Liver"></div> -->
<!-- 							<div id="drop" class="Kidney"></div> -->
<!-- 							<div id="drop" class="Stomach"></div> -->
<!-- 							<div id="drop" class="Cornea"></div> -->
<!-- 							<div id="drop" class="Intestine"></div> -->
							</div>
						</div>
						<div class="col-md-7 opacityDiv" >
							<h2>USER NAME</h2>
							<p>Description Description Description Description Description </p>
							<div class="row" id="s_graphic">
							<c:forEach begin="1" end="7" varStatus="row">
								<div class="col-md-6 col-sm-12">
									<img src="<c:url value="/resource/images/simulator/o_${row.index}.png"/>">
									<div class="graphic_detail_all">
										<div class="graphic_detail">
											<span style="width: 70px;" class="o_old organ${row.index}">Power</span><strong>60%</strong> <span style="background: #16536C; width: 200px;"
												class="o_new organ${row.index}">Power</span><strong>80%</strong>
										</div>
										<div class="graphic_detail">
											<span style="width: 90px;" class="o_old organ${row.index}">Endurance</span><strong>60%</strong> <span style="background: #16536C; width: 250px;"
												class="o_new organ${row.index}">Endurance</span><strong>80%</strong>
										</div>
									</div>
								</div>
							</c:forEach>
							</div>
							<div id="s_organs">
								<div id="s_organs_l">
									<ul class="nav nav-tabs">
									<c:forEach var="simulatorVO" items="${simulatorVOs}" varStatus="c_count">
									    <c:if test="${c_count.count==1}">
									       <li class="active"><a data-toggle="tab" href="#${simulatorVO.categoryVO.name}">${simulatorVO.categoryVO.name}</a></li>
									    </c:if>
									    <c:if test="${c_count.count!=1}">
									       <li><a data-toggle="tab" href="#${simulatorVO.categoryVO.name}">${simulatorVO.categoryVO.name}</a></li>
									    </c:if>
									</c:forEach>
									</ul>
									<div class="tab-content">
									
									
									
									
									
									
									
									
									
									   <c:forEach var="simulatorVO" items="${simulatorVOs}" varStatus="c_count">
									   <c:if test="${c_count.count==1}">
										<div id="${simulatorVO.categoryVO.name}" class="tab-pane fade in active">
									   </c:if>
										<c:if test="${c_count.count!=1}">
										<div id="${simulatorVO.categoryVO.name}" class="tab-pane fade">
										</c:if>
										
											<!-- ****************************** -->
											<div class="row">
												<div class="col-md-1">
													<!-- Controls -->
													<div class="controls pull-right hidden-xs">
														<a class="left fa fa-chevron-left btn" href="#sim_silder${simulatorVO.categoryVO.id}" data-slide="prev"><span class="glyphicon glyphicon-menu-left"
															aria-hidden="true"></span></a>
													</div>
												</div>
												<div class="col-md-10">
													<div id="sim_silder${simulatorVO.categoryVO.id}" class="carousel slide hidden-xs">
														<!-- Wrapper for slides -->
														<div class="carousel-inner">
															<c:forEach items="${simulatorVO.productVOs}" var="product" varStatus="p_count">
															
																<c:if test="${p_count.count % 4 == 1}">
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
																		<div class="photo" id="haha">
																			<img name="product${simulatorVO.productVOs[p_count.count-1].id}" src="<c:url value="data:image/png;base64,${simulatorVO.productimgVOs[p_count.count-1].img64}"/>" class="draggable" >
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
										</div>

									</div>
								</div>
								<div class="col-md-1">
									<!-- Controls -->
									<div class="controls pull-right hidden-xs">
										<a class="right fa fa-chevron-right btn" href="#sim_silder${simulatorVO.categoryVO.id}" data-slide="next"><span class="glyphicon glyphicon-menu-right"
											aria-hidden="true"></span></a>
									</div>
								</div></div>
							</div></c:forEach>
							<!-- ********************* -->
						
					</div>
				</div>
				<div id="s_organs_r">
					<div class="s_btn">
						<a>ADD TO CART</a>
					</div>
					<div class="s_btn">
						<a>ONE CLICK BUY</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			</div>
		</div>
		</div>
		</div>
		</div>
	</section>
	<footer style="margin-top: -15px;"><jsp:include page="/footer.jsp" /></footer>
	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/jquery.color-2.1.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-ui.min.js"/>"></script>
	<script type="text/javascript">
	
		//get all products JSON String
		JSON.parse(${simulatorVOsJSON});
		//get all products when init
// 		function initGetProducts(){
// 			alert(JsonString.length);
// 			var jsonarray = JSON.parse(JsonString);			
// 		}
// 		initGetProducts();
		//set open background color animation to dark
		$("body").hide();
		$("html").show().animate({backgroundColor: '#031014'}, 200, "linear", function(){
			$("html").animate({backgroundColor: '#062128'}, 300,"linear");
			$(document).ready(function(){
				$("body").fadeIn(400);
			});
		});
		
		
		//======  DOCUMENT READY  ======= 
		$(document).ready(function(){
			
			var environmentIndex = 0;
			//set onclick to change env background
			function initChangeBackClick(){
			$(".factor_item").on("click", function() {
				var src = $(this).find('img').attr('src');
				var bg_img;

				switch (src.substr(39, 1)) {
				case "1":
					bg_img = "s_bg_1.png";
					environmentIndex = 1;
					break;
				case "2":
					bg_img = "s_bg_2.png";
					environmentIndex = 2;
					break;
				case "3":
					bg_img = "s_bg_3.png";
					environmentIndex = 3;
					break;
				case "4":
					bg_img = "none";
					environmentIndex = 0;
				}
				sendEnvAjax(createFactors());
				 $('#fullPage').animate(
						 {backgroundColor: 'rgb(0,0,0)'}, 600, function(){
							 $('#s_wrap').css('backgroundImage', "url(<c:url value='/resource/images/simulator/"+bg_img+"'/>)");
						 }).animate({backgroundColor: 'rgba(0,0,0,0.1)'}, 600);
				 
			});
			}
			//use init method for document
			initOrganBars();
			initSaveObject();		
			initChangeBackClick();
			$(".carousel").carousel("pause");
			
			//set dragging
			$("#sim_silder img").draggable();
			$("#people").droppable();
			$(".draggable").draggable({ helper: 'clone',cursor: "crosshair", revert: "invalid",appendTo: 'body'});
			
			$("#people").droppable({ accept: ".draggable", 
		           drop: function(event, ui) {
		              $(this).removeClass("border").removeClass("over");
		              var dropped = ui.draggable;
		              var droppedOn = $(this);
		              $(dropped).detach().css({top: 0,left: 0}).appendTo(droppedOn);
		             
		             $("#haha").html('<img src="'+$(dropped).attr("src")+'" class="disable_img" >');
		              
		          }
		    });
			
			//setting of smoking, alcohol, and sport
			var clicksetting1 = true, clicksetting2 = true, clicksetting3 = true; 
			$("#setting1").on("mousemove", function(event){
				var selectedBar = $(this);
				if(clicksetting1){
				drawBar(selectedBar);
				}
			}).on("click", function(){
				clicksetting1 = false;
			}).on("mouseout", function(){
				var selectedBar = $(this);
				if(clicksetting1){
				cleanBar(selectedBar);
				}
			});
			
			$("#setting2").on("mousemove", function(){
				var selectedBar = $(this);
				if(clicksetting2){
				drawBar(selectedBar);
				}
			}).on("click", function(){
				clicksetting2 = false;
			}).on("mouseout", function(){
				var selectedBar = $(this);
				if(clicksetting2){
				cleanBar(selectedBar);
				}
			});
			
			$("#setting3").on("mousemove", function(){
				var selectedBar = $(this);
				if(clicksetting3){
				drawBar(selectedBar);
				}
			}).on("click", function(){
				clicksetting3 = false;
			}).on("mouseout", function(){
				var selectedBar = $(this);
				if(clicksetting3){
				cleanBar(selectedBar);
				}
			});
			
			function drawBar(selectedBar){
				var offset = selectedBar.offset();
				var width = selectedBar.width();
				var percent = (event.pageX - offset.left) / width;
				percent = 100 * percent;
				selectedBar.css({
				"background": "-webkit-linear-gradient(left, #C13F2E "+ percent +"%, rgba(0,0,0,0) "+ percent +"%)",
			    "background":  "  -moz-linear-gradient(left, #C13F2E "+ percent +"%, rgba(0,0,0,0) "+ percent +"%)",
			    "background":  "   -ms-linear-gradient(left, #C13F2E "+ percent +"%,rgba(0,0,0,0) "+ percent +"%)",
			    "background":  "    -o-linear-gradient(left, #C13F2E "+ percent +"%,rgba(0,0,0,0) "+ percent +"%)",
			    "background":   "      linear-gradient(to right, #C13F2E "+ percent +"%,rgba(0,0,0,0) "+ percent +"%)"
				});
			}
			function drawBarToPercent(selectedBar, percent){
				selectedBar.css({
				"background": "-webkit-linear-gradient(left, #C13F2E "+ percent +"%, rgba(0,0,0,0) "+ percent +"%)",
			    "background":  "  -moz-linear-gradient(left, #C13F2E "+ percent +"%, rgba(0,0,0,0) "+ percent +"%)",
			    "background":  "   -ms-linear-gradient(left, #C13F2E "+ percent +"%,rgba(0,0,0,0) "+ percent +"%)",
			    "background":  "    -o-linear-gradient(left, #C13F2E "+ percent +"%,rgba(0,0,0,0) "+ percent +"%)",
			    "background":   "      linear-gradient(to right, #C13F2E "+ percent +"%,rgba(0,0,0,0) "+ percent +"%)"
				});
			}
			function cleanBar(selectedBar){
				selectedBar.css({
				"background": "-webkit-linear-gradient(left, #C13F2E 0%, rgba(0,0,0,0) 0%)",
			    "background":  "  -moz-linear-gradient(left, #C13F2E 0%, rgba(0,0,0,0) 0%)",
			    "background":  "   -ms-linear-gradient(left, #C13F2E 0%, rgba(0,0,0,0) 0%)",
			    "background":  "    -o-linear-gradient(left, #C13F2E 0%, rgba(0,0,0,0) 0%)",
			    "background":   "      linear-gradient(to right, #C13F2E 0%, rgba(0,0,0,0) 0%)"
				});
			}
			//set reset
			$('button[class="reset_btn s_btn2 toreset"').on("click",function(){
				cleanBar($("#setting1"));
				cleanBar($("#setting2"));
				cleanBar($("#setting3"));
				$("input[name='weight']").val("");
				$("input[name='height']").val("");
				clicksetting1 = true, clicksetting2 = true, clicksetting3 = true; 					
			})
			
			//create factors
			function createFactors(){
				var factors = new Object();
				var tempAttr = $("#setting1").css("background");
				var index = tempAttr.indexOf('%)',0);
				tempAttr = tempAttr.substring(0, index);
				tempAttr = tempAttr.substring(tempAttr.lastIndexOf(')')+1);
				var temp = parseInt(tempAttr); 
				if(index == -1){
				factors.smoking = 0;
				}else{
				factors.smoking = temp;
				}
				var tempAttr = $("#setting2").css("background");
				var index = tempAttr.indexOf('%)',0);
				tempAttr = tempAttr.substring(0, index);
				tempAttr = tempAttr.substring(tempAttr.lastIndexOf(')')+1);
				var temp = parseInt(tempAttr); 
				if(index == -1){
				factors.drinking = 0;
				}else{
				factors.drinking = temp;
				}
				var tempAttr = $("#setting3").css("background");
				var index = tempAttr.indexOf('%)',0);
				tempAttr = tempAttr.substring(0, index);
				tempAttr = tempAttr.substring(tempAttr.lastIndexOf(')')+1);
				var temp = parseInt(tempAttr); 
				if(index == -1){
				factors.exercising = 0;
				}else{
				factors.exercising = temp;
				}
				var weight = $("input[name='weight']").val();
				var height = $("input[name='height']").val();
				weight = (weight == "")?60:(weight > 300)?300:(weight < 10)?10:weight;
				height = (height == "")?175:(height > 300)?300:(height < 50)?50:height;
				$("input[name='height']").val(height);
				$("input[name='weight']").val(weight);
				factors.weight = weight;
				factors.height = height;
				factors.env_id = environmentIndex;
				return factors;
			}
			
			
			//set save			
			$('button[class="reset_btn s_btn2 tosave"').on("click",function(){
				var factors = createFactors();
				var index = 1;
				for(var savedObjKey in saveContainer){
					var containerLength = Object.keys(saveContainer).length;
					var savedObj = saveContainer[savedObjKey];
					if (savedObj.saved == false){
						setSaveObject(factors, savedObj);
						savedObj.saved = true;
						$("#saveSlot"+index+" span").attr("class", "glyphicon glyphicon-open");
						//set save slot icon
						$("#saveSlot"+index).on("mouseover", function(){$("#saveSlot"+index+" span").attr("class", "glyphicon glyphicon-hand-up");}).on("mouseout", function(){$("#saveSlot"+index+" span").attr("class", "glyphicon glyphicon-open");});
						//set retrieval from save slot
						$("#saveSlot"+index).css("opacity", "1").on("click", function(){
							var tempObj = saveContainer["save"+index];
							regenerateFromSave(tempObj);
							});
						break;
					}
					if(index == containerLength){
						alert("no more to save");
					}
					index++;
				}
				$("button.toclear").on("click", function(){
					initSaveObject();
					for(var index = 1;index<=3;index++ ){
					$("#saveSlot"+index+" span").attr("class", "");
					//clear save slot icon
					$("#saveSlot"+index).css("opacity", "0.5").off("mouseover")
					.off("mouseout")
					.off("click");
					}
				})
				
				for(var savedObjKey in saveContainer){
					var savedObj = saveContainer[savedObjKey];
					printObject(savedObj);
				}
				
			});
			
			function setEnvironmentBG(tempEnvIndex, ajaxDataObj){
				var bg_img;
				sendEnvAjax(ajaxDataObj);
				switch (tempEnvIndex) {
				case 1:
					bg_img = "s_bg_1.png";
					environmentIndex = 1;
					break;
				case 2:
					bg_img = "s_bg_2.png";
					environmentIndex = 2;
					
					break;
				case 3:
					bg_img = "s_bg_3.png";
					environmentIndex = 3;
					break;
				case 0:
					bg_img = "none";
					environmentIndex = 0;
				}
				 $('#fullPage').animate(
						 {backgroundColor: 'rgb(0,0,0)'}, 600, function(){
							 $('#s_wrap').css('backgroundImage', "url(<c:url value='/resource/images/simulator/"+bg_img+"'/>)");
						 }).animate({backgroundColor: 'rgba(0,0,0,0.1)'}, 600);
			}
			function regenerateFromSave(savedObjectToBack){
				drawBarToPercent($("#setting1"), savedObjectToBack.smoking);
				drawBarToPercent($("#setting2"), savedObjectToBack.drinking);
				drawBarToPercent($("#setting3"), savedObjectToBack.exercising);
				$("input[name='weight']").val(savedObjectToBack.weight);
				$("input[name='height']").val(savedObjectToBack.height);
				setEnvironmentBG(savedObjectToBack.env_id, savedObjectToBack);
			}
			
			//Ajax send to Env Action 
			function sendEnvAjax(sentDataObj){
				
				printObject(sentDataObj);
							$.ajax({
							url:"${pageContext.request.contextPath}/simulator/bodySimulatorAction",
							data:sentDataObj
							}).done(function(msg){
								console.log(msg);
								});
			}
			//set organ bars original
			function initOrganBars(){
				$("span.o_old").css("width", "200px");
				$("span.o_new").css("width", "200px");
			}			
			
			//function to adjust designated organ bar
			function adjustOrganBars(index, valueBoxforAdjust){
				var oldValueP = valueBoxforAdjust.oldVP + 100;
				var newValueP = valueBoxforAdjust.newVP + 100;
				var reverseP = (oldValueP > newValueP)?true:false;
				var oldValueE = valueBoxforAdjust.oldVE + 100;
				var newValueE = valueBoxforAdjust.newVE + 100;
				var reverseE = (oldValueE > newValueE)?true:false;
				if(reverseP){
					$("span[class='o_old organ" + index + "']").eq(0).css("z-index","3").animate({width: oldValueP+'px'}, 100);
					$("span[class='o_new organ" + index + "']").eq(0).css("z-index","5").animate({width: newValueP+'px'}, 100);
				}else{
					$("span[class='o_old organ" + index + "']").eq(0).css("z-index","5").animate({width: oldValueP+'px'}, 100);
					$("span[class='o_new organ" + index + "']").eq(0).css("z-index","3").animate({width: newValueP+'px'}, 100);
				}
				if(reverseE){
					$("span[class='o_old organ" + index + "']").eq(1).css("z-index","3").animate({width: oldValueE+'px'}, 100);
					$("span[class='o_new organ" + index + "']").eq(1).css("z-index","5").animate({width: newValueE+'px'}, 100);
				}else{
					$("span[class='o_old organ" + index + "']").eq(1).css("z-index","5").animate({width: oldValueE+'px'}, 100);				
					$("span[class='o_new organ" + index + "']").eq(1).css("z-index","3").animate({width: newValueE+'px'}, 100);
				}
			}
			
			//add onmouseover onmouseout to organs
			for(var iii = 1;iii<999;iii++){
			$("img[name='product"+iii+"']").on("mouseover",function(){
				//stop previous animation
				$("span.o_old").stop();
				$("span.o_new").stop();
				
				var valueBox = new Object();
				var categoryIndex = $(this).attr("name");
				categoryIndex = categoryIndex.substring(7, 8);
				valueBox.oldVP = 100;
				valueBox.newVP = 140;
				valueBox.oldVE = 100;
				valueBox.newVE = 50;
				//start bar animation
				adjustOrganBars(categoryIndex, valueBox);
			}).on("mouseout",function(){
				//stop previous animation
				$("span.o_old").stop();
				$("span.o_new").stop();
				
				var valueBox = new Object();
				var categoryIndex = $(this).attr("name");
				categoryIndex = categoryIndex.substring(7, 8);
				valueBox.oldVP = 100;
				valueBox.newVP = 100;
				valueBox.oldVE = 100;
				valueBox.newVE = 100;
				//start bar animation
				adjustOrganBars(categoryIndex, valueBox);
			});
			}
			
		});//end of document ready
		
		//init document save objects
		function initSaveObject(){
			saveObject1 = new Object(), saveObject2 = new Object(), saveObject3 = new Object();
			saveContainer = new Object;
			saveObject1.saved = false;
			saveObject2.saved = false;
			saveObject3.saved = false;
			saveContainer.save1 = saveObject1;
			saveContainer.save2 = saveObject2;
			saveContainer.save3 = saveObject3;
			$("#saveSlot1 span").attr("class", "");
			$("#saveSlot2 span").attr("class", "");
			$("#saveSlot3 span").attr("class", "");
		}
		
		function setSaveObject(sourceObj, targetObject){
			for(var key in sourceObj){
				targetObject[key] = sourceObj[key];
			}			
		}
		

		
		function printObject(printedObj){
			for(var key in printedObj){
				console.log("["+key+"]: "+printedObj[key]);
			}			
		}
		

		
		
	</script>

</html>
