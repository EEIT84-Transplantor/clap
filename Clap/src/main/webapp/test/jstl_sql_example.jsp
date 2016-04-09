<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<sql:query dataSource="clap/db" var="members">SELECT * from member</sql:query>
	<c:forEach var="member" items="${members.rows}">
			${member.mb_email}<br>
	</c:forEach>

	<sql:update dataSource="clap/db" var="count">
		UPDATE member SET mb_name=? WHERE mb_email=?;
		<sql:param value="Diy"/>
		<sql:param value="poan@gmail.com"/>	
	</sql:update>

	
</body>
</html>