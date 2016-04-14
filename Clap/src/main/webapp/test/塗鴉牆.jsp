
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<!-- <link href="<c:url value="/resource/css/customer.css"/>" rel="stylesheet"> -->
<!-- <link href="<c:url value="/resource/css/silderbanner.css"/>" rel="stylesheet"> -->
<!-- 在這加上你自己的css檔案連結  -->
</head>
<body>

<!-- 	<table class="table"> -->
<%-- 		<c:set var="theads" value="${['商品數','原價','禮物卡','prome','總價']}" scope="page" /> --%>
<%-- 		<c:forEach var="thead" items="${theads}"> --%>
<!-- 			<tr> -->
<%-- 				<td>${thead}</td> --%>
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table> -->

	<%
		Map table = new HashMap();
		table.put("aaa", "abc");
		table.put("bbb", "bbb");
		table.put("ccc", "cccc");
		pageContext.setAttribute("table", table);
	%>

	${table}
	
	<select>
		<c:forEach var="i" begin="1" end="5">
			<option>${i}</option>
		</c:forEach>
	
	</select>

</body>
</html>






















