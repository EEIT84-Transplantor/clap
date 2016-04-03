<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<s:url action='setting/getsettingaction'/>">Hello World</a>
<%-- 	<sql:setDataSource dataSource="clap/db" var="dataSource" scope="page"/> --%>
<%-- 	<sql:query sql="select * from member" var="members" dataSource="dataSource"></sql:query> --%>
<%-- 	<c:forEach var="member" items="${members}"> --%>
<%-- 		${member}<br> --%>
<%-- 	</c:forEach> --%>
</body>
</html>