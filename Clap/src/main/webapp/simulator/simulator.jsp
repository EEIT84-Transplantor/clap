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
<link href="<c:url value="/resource/css/simple-sidebar"/>" rel="stylesheet">
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
											<label>Height: </label>
											<input type="number" min="50" max="300" name="height">

										</div>

										<div class="s_inpnut">
											<label>Weight:</label>
											<input type="number" min="10" max="300" name="weight">

										</div>
									</div>
									<div class="sub_setting">

										<h3>Daily Behaviors</h3>
										<div class="setting_item">
											<img src="<c:url value="/resource/images/simulator/smoke.png"/>">
											<div id="setting1"></div>
										</div>
										<div class="setting_item">
											<img src="<c:url value="/resource/images/simulator/wine.png"/>">
											<div id="setting2"></div>
										</div>
										<div class="setting_item">
											<img src="<c:url value="/resource/images/simulator/sport.png"/>">
											<div id="setting3"></div>
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
									<button class="reset_btn s_btn2 tosave">
										<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
									</button>
									<button class="reset_btn s_btn2 toreset">RESET</button>
									<div class="sub_setting savingslot" id="saveSlot1">
										1st <span class="" aria-hidden="true"></span>
									</div>
									<div class="sub_setting savingslot" id="saveSlot2">
										2nd <span class="" aria-hidden="true"></span>
									</div>
									<div class="sub_setting savingslot" id="saveSlot3">
										3rd <span class="" aria-hidden="true"></span>
									</div>
									<button class="toclear">Clear Saves</button>
								</div>

							</div>
							<div class="col-md-3">
								<div id="people">
									<c:forEach var="simulatorVO" items="${simulatorVOs}" varStatus="c_count">
								<div class="drop" id="o_${simulatorVO.categoryVO.id}"></div>
								</c:forEach>
								</div>
							</div>
							<div class="col-md-7 opacityDiv">
								<h2>Hello, ${login.name}</h2>
								<p>Description Description Description Description Description</p>
								<div class="row" id="s_graphic">
									<c:forEach begin="1" end="7" varStatus="row">
										<div class="col-md-6 col-sm-12">
											<img src="<c:url value="/resource/images/simulator/o_${row.index}.png"/>">
											<div class="graphic_detail_all">
												<div class="graphic_detail">
													<span style="width: 200px;" class="o_old organ${row.index}">Power</span> <strong>1%</strong> <span
														style="background: #16536C; width: 200px;" class="o_new organ${row.index}">Power</span> <strong>1%</strong>
												</div>
												<div class="graphic_detail">
													<span style="width: 200px;" class="o_old organ${row.index}">Endurance</span> <strong>1%</strong> <span
														style="background: #16536C; width: 200px;" class="o_new organ${row.index}">Endurance</span> <strong>1%</strong>
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
															<a class="left fa fa-chevron-left btn" href="#sim_silder${simulatorVO.categoryVO.id}" data-slide="prev"> <span
																class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
															</a>

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
																			<img name="product${product.id}" src="<c:url value="data:image/png;base64,${simulatorVO.productimgVOs[p_count.count-1].img64}"/>" class="p_drag draggable${simulatorVO.categoryVO.id}" categoryID="${simulatorVO.categoryVO.id}" width="100">
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
								<a class="right fa fa-chevron-right btn" href="#sim_silder${simulatorVO.categoryVO.id}" data-slide="next"> <span
									class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				<!-- ********************* -->

			</div>
		</div>
		<div id="s_organs_r">
			<div class="s_btn">
				<a>ADD TO CART</a>
			</div>
			<c:if test="${login.oneclick}">
			<div class="s_btn">
				<a>ONE CLICK BUY</a>
			</div>
			</c:if>
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
	var contextPath = "${pageContext.request.contextPath}";
	var urlToSend = contextPath+ "/simulator/bodySimulatorAction";
	
	
	</script>
	<script type="text/javascript" src="<c:url value="/resource/js/simulator.js"/>"></script>
</html>
