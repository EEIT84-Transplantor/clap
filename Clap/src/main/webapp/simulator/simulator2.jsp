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
									<h3>persional setting</h3>
									<div class="s_inpnut">
										<label>height : </label> <input type="text" name="height">
									</div>
									<div class="s_inpnut">
										<label>weight : </label> <input type="text" name="weight">
									</div>
								</div>
								<div class="sub_setting">
									<h3>living habit</h3>
									<div class="setting_item">
										<img src="<c:url value="/resource/images/simulator/smoke.png"/>"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span>
									</div>
									<div class="setting_item">
										<img src="<c:url value="/resource/images/simulator/wine.png"/>"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span>
									</div>
									<div class="setting_item">
										<img src="<c:url value="/resource/images/simulator/sport.png"/>"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span>
									</div>
								</div>
								<div class="sub_setting">
									<h3>envirnmental factor</h3>
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
								<div class="reset_btn s_btn">
									<a>RESET</a>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div id="people"></div>
						</div>
						<div class="col-md-7">
							<h2>USER NAME</h2>
							<p>texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext</p>
							<div class="row" id="s_graphic">
								<div class="col-md-6">
									<img src="<c:url value="/resource/images/simulator/o_1.png"/>">
									<div class="graphic_detail_all">
										<div class="graphic_detail">
											<span style="width: 70px;" class="o_old">skillA</span><strong>60%</strong> <span style="background: #72B3BF; width: 200px;"
												class="o_new"></span><strong>80%</strong>
										</div>
										<div class="graphic_detail">
											<span style="width: 90px;" class="o_old">skillB</span><strong>60%</strong> <span style="background: #16536C; width: 250px;"
												class="o_new"></span><strong>80%</strong>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<img src="<c:url value="/resource/images/simulator/o_2.png"/>">
									<div class="graphic_detail_all">
										<div class="graphic_detail">
											<span style="width: 70px;" class="o_old">skillA</span><strong>60%</strong> <span style="background: #409371; width: 200px;"
												class="o_new"></span><strong>80%</strong>
										</div>
										<div class="graphic_detail">
											<span style="width: 90px;" class="o_old">skillB</span><strong>60%</strong> <span style="background: #005D61; width: 250px;"
												class="o_new"></span><strong>80%</strong>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<img src="<c:url value="/resource/images/simulator/o_3.png"/>">
									<div class="graphic_detail_all">
										<div class="graphic_detail">
											<span style="width: 70px;" class="o_old">skillA</span><strong>60%</strong> <span style="background: #F2EA77; width: 200px;"
												class="o_new"></span><strong>80%</strong>
										</div>
										<div class="graphic_detail">
											<span style="width: 90px;" class="o_old">skillB</span><strong>60%</strong> <span style="background: #EBBE6B; width: 250px;"
												class="o_new"></span><strong>80%</strong>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<img src="<c:url value="/resource/images/simulator/o_4.png"/>">
									<div class="graphic_detail_all">
										<div class="graphic_detail">
											<span style="width: 70px;" class="o_old">skillA</span><strong>60%</strong> <span style="background: #829F2A; width: 200px;"
												class="o_new"></span><strong>80%</strong>
										</div>
										<div class="graphic_detail">
											<span style="width: 90px;" class="o_old">skillB</span><strong>60%</strong> <span style="background: #B2C301; width: 250px;"
												class="o_new"></span><strong>80%</strong>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<img src="<c:url value="/resource/images/simulator/o_5.png"/>">
									<div class="graphic_detail_all">
										<div class="graphic_detail">
											<span style="width: 70px;" class="o_old">skillA</span><strong>60%</strong> <span style="background: #C66D16; width: 200px;"
												class="o_new"></span><strong>80%</strong>
										</div>
										<div class="graphic_detail">
											<span style="width: 90px;" class="o_old">skillB</span><strong>60%</strong> <span style="background: #E05A41; width: 250px;"
												class="o_new"></span><strong>80%</strong>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<img src="<c:url value="/resource/images/simulator/o_6.png"/>">
									<div class="graphic_detail_all">
										<div class="graphic_detail">
											<span style="width: 70px;" class="o_old">skillA</span><strong>60%</strong> <span style="background: #72B3BF; width: 200px;"
												class="o_new"></span><strong>80%</strong>
										</div>
										<div class="graphic_detail">
											<span style="width: 90px;" class="o_old">skillB</span><strong>60%</strong> <span style="background: #16536C; width: 250px;"
												class="o_new"></span><strong>80%</strong>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<img src="<c:url value="/resource/images/simulator/o_7.png"/>">
									<div class="graphic_detail_all">
										<div class="graphic_detail">
											<span style="width: 70px;" class="o_old">skillA</span><strong>60%</strong> <span style="background: #9A71AF; width: 200px;"
												class="o_new"></span><strong>80%</strong>
										</div>
										<div class="graphic_detail">
											<span style="width: 90px;" class="o_old">skillB</span><strong>60%</strong> <span style="background: #9B4495; width: 250px;"
												class="o_new"></span><strong>80%</strong>
										</div>
									</div>
								</div>
							</div>
							<div id="s_organs">
								<div id="s_organs_l">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#organ1">organ1</a></li>
										<li><a data-toggle="tab" href="#organ2">organ2</a></li>
										<li><a data-toggle="tab" href="#organ3">organ3</a></li>
										<li><a data-toggle="tab" href="#organ4">organ4</a></li>
										<li><a data-toggle="tab" href="#organ5">organ5</a></li>
										<li><a data-toggle="tab" href="#organ6">organ6</a></li>
										<li><a data-toggle="tab" href="#organ7">organ7</a></li>
									</ul>
									<div class="tab-content">
										<div id="organ1" class="tab-pane fade in active">
											<!-- ****************************** -->
											<div class="row">
												<div class="col-md-1">
													<!-- Controls -->
													<div class="controls pull-right hidden-xs">
														<a class="left fa fa-chevron-left btn" href="#sim_silder" data-slide="prev"><span class="glyphicon glyphicon-menu-left"
															aria-hidden="true"></span></a>
													</div>
												</div>
												<div class="col-md-10">
													<div id="sim_silder" class="carousel slide hidden-xs">
														<!-- Wrapper for slides -->
														<div class="carousel-inner">
															<%-- 								<c:forEach items="${popular}" var="product" varStatus="p_count"> --%>
															<c:forEach begin="1" end="8" step="1" varStatus="p_count">
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
																			<img src="<c:url value="/resource/images/simulator/temp.png"/>">
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
									</div>
								</div>
								<div class="col-md-1">
									<!-- Controls -->
									<div class="controls pull-right hidden-xs">
										<a class="right fa fa-chevron-right btn" href="#sim_silder" data-slide="next"><span class="glyphicon glyphicon-menu-right"
											aria-hidden="true"></span></a>
									</div>
								</div>

							</div>
							<!-- ********************* -->
						</div>
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
	<div id="wrapper">
	

<div id="origin" class="fbox">
</div>
</div>
	<footer style="margin-top: -15px;"><jsp:include page="/footer.jsp" /></footer>
	<!-- 載入js -->
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/json2.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/jquery.color-2.1.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/jquery-ui.min.js"/>"></script>
	<script type="text/javascript">
	//set open background color animation to dark
	$("body").hide();
	$("html").show().animate({backgroundColor: '#031014'}, 200, "linear", function(){
		$("html").animate({backgroundColor: '#062128'}, 300,"linear");
		$(document).ready(function(){
			$("body").fadeIn(400);
		});
	});
	
	var heartBeat, heartBeat2;	
	$("#sim_silder img").on("mouseover", function(event) {
			var dragSrc = $(this).attr("src");
			$("#origin").html("<div id='abc'><img class='img-responsive draggable'></div>");
			$("#abc img").attr("src", dragSrc).css("position","absolute").css("top", $(this).offset().top)
			.css("left", $(this).offset().left).show().draggable({ cursor: "crosshair", revert: "invalid"})
			.on("mouseout", function(){
				$("#abc img").fadeOut();
			});
			
// 			setTimeout(function(){ heartBeat = setInterval(function(){ $("#abc img").fadeOut(); }, 1000);	}, 500);
// 			heartBeat2 = setInterval(function(){ $("#abc img").show(); }, 1000);			
			
		}).on("mouseout", function(){
// 			$("#abc img").fadeOut();
// 			clearInterval(heartBeat);
// 			clearInterval(heartBeat2);		
		});
	
		$(".factor_item").on("click", function() {
			var src = $(this).find('img').attr('src');
			var bg_img;

			switch (src.substr(39, 1)) {
			case "1":
				bg_img = "s_bg_1.png";
				break;
			case "2":
				bg_img = "s_bg_2.png";
				break;
			case "3":
				bg_img = "s_bg_3.png";
				break;
			case "4":
				bg_img = "none";
			}
			
// 			$("#s_wrap").fadeTo('slow', 0.1, function() {
// 				$(this).css("background-image", "url(<c:url value='/resource/images/simulator/"+bg_img+"'/>)");
// 			}).fadeTo('slow', 1);
			 $('#fullPage').animate(
					 {backgroundColor: 'rgb(0,0,0)'}, 600, function(){
						 $('#s_wrap').css('backgroundImage', "url(<c:url value='/resource/images/simulator/"+bg_img+"'/>)");
					 }).animate({backgroundColor: 'rgba(0,0,0,0.1)'}, 600);
			
//         $('#s_wrap').css('backgroundImage', function () {
//             $('#fullPage').animate(
//             		{backgroundColor: 'rgb(0,0,0)'}, 1000, function(){
//             			setTimeout(function(){$('#fullPage').animate({backgroundColor: 'transparent'}, 1000);},3000);
//             });
//             return "url(<c:url value='/resource/images/simulator/"+bg_img+"'/>)";
// 			 });
		});
		$(document).ready(function(){
			$(".carousel").carousel("pause");
			
			var clickFlag = false;
			$("span", "div.setting_item").on("mouseover", function(){
				var selectedSpan = $(this);
				fillBar(selectedSpan);

			}).on("mouseout", function(){
				if(clickFlag){}else{
				var selectedSpan = $(this);
				removeBar(selectedSpan);
				}
				clickFlag = false;
			}).on("click", function(){
				var selectedSpan = $(this);
				removeBar(selectedSpan);
				fillBar(selectedSpan);
				clickFlag = true;
			});
			
			function removeBar(selectedSpan){
				var indexBar = selectedSpan.index();
				for(var index = indexBar;index>0; index--){
		   			selectedSpan.parent().children().eq(index).css({
					"border":"2px #3F4849 solid",
					"background":"rgba(0,0,0,0)"
				    });
		   		}
			}
			function fillBar(selectedSpan){
				var indexBar = selectedSpan.index();
			   	for(var index = 1;index<=indexBar; index++){
			   		selectedSpan.parent().children().eq(index).css({
						"border":"2px #C13F2E solid",
						"background":"#C13F2E"
					    });;
			   	}
			}
			// reset/save setting
			var fixedTop = 0, fixedTop2 = 0, fixedLeft=0, fixedLeft2=0;
			$('div[class="reset_btn s_btn"').eq(0).on("click",function(){
				cleanBar($("#setting1"));
				cleanBar($("#setting2"));
				cleanBar($("#setting3"));
				clicksetting1 = true, clicksetting2 = true, clicksetting3 = true; 				
			}).on("mousedown",function(){
				var top = fixedTop + 3;
				var left = fixedLeft;
				var width = $(this).width();
				var height = $(this).height();
				$(this).css({"position":"absolute",
					"top":top+"px",
					"left":left+"px",
					"width":width+"px",
					"height":height+"px"
				});
			})
			.on("mouseup",function(){
				var top = fixedTop + 1;
				var left = fixedLeft;
				var width = $(this).width();
				var height = $(this).height();
				$(this).css({"position":"absolute",
					"top":top+"px",
					"left":left+"px",
					"width":width+"px",
					"height":height+"px"
				});
			}).on("mouseover", function(){
				//fix the next element position
				var nextElement = $(this).next();
				var offset2 = nextElement.position();
				fixedTop2 = offset2.top;
				fixedLeft2 = offset2.left;
				var top2 = fixedTop2;
				var left2 = fixedLeft2;
				var width2 = nextElement.width();
				var height2 = nextElement.height();
				nextElement.css({"position":"absolute",
					"top":top2+"px",
					"left":left2+"px",
					"width":width2+"px",
					"height":height2+"px"
				});
				//fix first element position
				var offset = $(this).position();
				fixedTop = offset.top;
				fixedLeft = offset.left;
				var top = fixedTop + 1;
				var left = fixedLeft;
				var width = $(this).width();
				var height = $(this).height();
				$(this).css({"position":"absolute",
					"top":top+"px",
					"left":left+"px",
					"width":width+"px",
					"height":height+"px"
				});		
			}).on("mouseout", function(){
				var top = fixedTop;
				var left = fixedLeft;
				var width = $(this).width();
				var height = $(this).height();
				$(this).css({"position":"absolute",
					"top":top+"px",
					"left":left+"px",
					"width":width+"px",
					"height":height+"px"
				});
			});
			$('div[class="reset_btn s_btn"').eq(1).on("click",function(){
				cleanBar($("#setting1"));
				cleanBar($("#setting2"));
				cleanBar($("#setting3"));
				clicksetting1 = true, clicksetting2 = true, clicksetting3 = true; 				
			}).on("mousedown",function(){
				var top = fixedTop2 + 3;
				var left = fixedLeft2;
				var width = $(this).width();
				var height = $(this).height();
				$(this).css({"position":"absolute",
					"top":top+"px",
					"left":left+"px",
					"width":width+"px",
					"height":height+"px"
				});
			})
			.on("mouseup",function(){
				var top = fixedTop2 + 1;
				var left = fixedLeft2;
				var width = $(this).width();
				var height = $(this).height();
				$(this).css({"position":"absolute",
					"top":top+"px",
					"left":left+"px",
					"width":width+"px",
					"height":height+"px"
				});
			}).on("mouseover", function(){
			
				var offset = $(this).position();
				fixedTop2 = offset.top;
				fixedLeft2 = offset.left;
				var top = fixedTop2 + 1;
				var left = fixedLeft2;
				var width = $(this).width();
				var height = $(this).height();
				$(this).css({"position":"absolute",
					"top":top+"px",
					"left":left+"px",
					"width":width+"px",
					"height":height+"px"
				});
			}).on("mouseout", function(){
				var top = fixedTop2;
				var left = fixedLeft2;
				var width = $(this).width();
				var height = $(this).height();
				$(this).css({"position":"absolute",
					"top":top+"px",
					"left":left+"px",
					"width":width+"px",
					"height":height+"px"
				});
			});
		});
		var x , y;
		$("#people").droppable({ accept: ".draggable", 
		            drop: function(event, ui) {
		            
		            $(this).removeClass("border").removeClass("over");
		            var dropped = ui.draggable;
		            var droppedOn = $(this);
		            $(dropped).detach().css({top:'25%',left: '48%'}).appendTo(droppedOn);      
		            }, 
		             over: function(event, elem) {
		                  $(this).addClass("over");
		                  
		            }
		                ,
		            out: function(event, elem) {
		            $(this).removeClass("over");
		            }
		            });
		$("#drop").sortable();
		
	</script>
</html>
