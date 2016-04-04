<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>changesetting</title>
</head>
<body>

<s:form method="post" action="setting/changesettingaction">
<%-- 	<s:textfield label="email" name="memberVO.email" value="%{#request.login.email}"/> --%>
	<s:textfield label="email" name="memberVO.email" value="poan@gmail.com"/>
	<s:textfield label="password" name="memberVO.mb_password"/>
	<s:textfield label="newpassword" name="newpassword"/>
	<s:textfield label="confirm" name="confirm"/>
	<s:textfield label="name" name="memberVO.mb_name" value="%{#request.login.mb_name}"/>
	<s:textfield label="phone" name="memberVO.mb_phone" value="%{#request.login.mb_phone}"/>
	<s:file label="photo" name="memberVO.mb_photo"/>
	<s:submit label="submit"/>
</s:form>

</body>
</html>