<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<s:url action='setting/onClickAction'/>">Hello World</a>
	<%-- 	<sql:setDataSource var="snapshot" dataSource="clap/db"/> --%>
	<%-- 	<sql:query dataSource="${snapshot}" var="members">SELECT * from member;</sql:query> --%>
	<%-- 	<c:forEach var="member" items="${members.rows}"> --%>
	<%-- 		<br>${member.mb_email} --%>
	<%-- 	</c:forEach> --%>

	<%-- 	<s:form action="onClickAction" namespace="/setting" method="post"> --%>
	<%-- 		<s:radio label="oneclick" name="memberVO.oneclick"	list="#{'true':'yes','false':'no'}" value="false"/> --%>
	<%-- 		<s:submit value="submit"/> --%>
	<%-- 	</s:form> --%>
</body>
</html>