<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Đăng ký</title>

<link href="resources/css/signup.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/signup.js" type="text/javascript"></script>
</head>
<body>

	<div class="signup-form">
		<form:form modelAttribute="tk" action="savesignup" method="POST">
			<h1>Sign Up</h1>

			<div class="form-group">
				<label for="txtEmail">UserName:</label>
				<form:input placeholder="Email" path="userName" id="txtEmail"
					class="txtb" required="true" />
				<span id="tbEmail">${message}</span>
			</div>

			<div class="form-group">
				<label for="txtPass">Password:</label>
				<form:password placeholder="Password" path="passWord" id="txtPass"
					class="txtb" required="true" />
				<span id="tbPass"></span>
			</div>

			<div class="form-group">
				<label>Họ:</label>
				<form:input placeholder="Vd: Đoàn Ngọc" path="ho" class="txtb" required="true"/>
			</div>

			<div class="form-group">
				<label>Tên:</label>
				<form:input path="ten" placeholder="Vd: Trí" class="txtb" required="true"/>
			</div>
			
			<div class="form-group">
				<label for="txtSDT">Số điện thoại:</label>
				<form:password placeholder="Vd: 0123456789" path="sodienthoai" id="txtSDT"
					class="txtb" required="true" />
				<span id="tbSDT"></span>
			</div>

			<div class="form-group">
				<label for="txtEmail">Địa chỉ:</label>
				<form:input path="diachi" placeholder="Vd: 97 Man Thiện,Quận 9,TPHCM" class="txtb" required="true"/>
			</div>
				<button name="action" id="btnSave" class="signup-btn">SignUp</button>
			<a href="homepage" class="signup-fpw1">Home Page</a>
		</form:form>
	</div>
</body>
</html>