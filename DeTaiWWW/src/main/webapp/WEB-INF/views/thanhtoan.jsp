<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form method="post" action="addDonDatHang">
		<table>
			<tr>
				<td>Payment:</td>
				<td><form:input path="payment"/></td>
			</tr>
			
			<tr>
				<td>Address:</td>
				<td><form:input path="address"/></td>
			</tr>
			
			<tr>
				<td>Total:</td>
				<td><form:input path="total"/></td>
			</tr>
			
			
			
			<tr>
				<td colspan="2"><input type="submit" value="Save"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>