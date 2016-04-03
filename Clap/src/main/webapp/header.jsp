<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">

					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#c-navbar-collapse"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>


					<a class="navbar-brand" href="${pageContext.request.contextPath}/"> <img class="hidden-xs"
						src="${pageContext.request.contextPath}/resource/images/logo.png"> <img class="visible-xs"
						src="${pageContext.request.contextPath}/resource/images/logo-s.png">
					</a>

				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="c-navbar-collapse">

					<div class="row">
						<ul class="nav nav-pills navbar-right">
							<li><a href="${pageContext.request.contextPath}/member/signuplogin.jsp">Sign in</a></li>
							<li><a href="${pageContext.request.contextPath}/member/signuplogin.jsp" class="active">Sign up
							<span class="sr-only">(current)</span></a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">language <img
									src="${pageContext.request.contextPath}/resource/images/usa_flag.png"><span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">English</a></li>

									<li><a href="#">Chinese</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="row">
						<ul class="nav navbar-nav navbar-right">
							<li><img src="${pageContext.request.contextPath}/resource/images/box.png"></li>
							<li><a href="#">Purchase</a></li>
							<li class="active"><a href="#">About</a></li>
							<li><a href="#">Simulator</a></li>
							<li><a href="#">Appointment</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Account</a></li>
						</ul>
					</div>

				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>