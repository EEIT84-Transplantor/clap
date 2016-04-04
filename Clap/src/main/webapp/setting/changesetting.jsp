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

<s:form action="changeSettingAction" method="post" enctype="multipart/form-data">
<%-- 	<s:textfield label="email" name="memberVO.email" value="%{#request.login.email}"/> --%>
	<s:textfield label="email" name="memberVO.email" value="poan@gmail.com"/>
	<s:textfield label="password" name="memberVO.password" value=""/>
	<s:textfield label="newpassword" name="newpassword" value=""/>
	<s:textfield label="confirm" name="confirm" value=""/>
	<s:textfield label="name" name="memberVO.name" value="%{#request.login.name}"/>
	<s:textfield label="phone" name="memberVO.phone" value="%{#request.login.phone}"/>
	<s:file label="photo" name="photo"/>
	<s:submit label="submit"/>
</s:form>

</body>
</html>