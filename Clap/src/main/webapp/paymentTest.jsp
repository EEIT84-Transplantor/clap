<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:form action="payment/managePayment">
	
	<s:textfield name="creditCardVO.cc_number" />
	<s:submit value="Add Credit Card" name="addType"/> 

</s:form>
<s:form action="payment/managePayment">
	
	<s:textfield name="payment.name" />
	<s:submit value="submit"/> 

</s:form>


</body>
</html>