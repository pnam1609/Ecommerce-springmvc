<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng nhập</title>

    <link href="resources/css/signin.css" rel="stylesheet">
     <!-- <link href="resources/css/signinup.css" rel="stylesheet"> -->
</head>
<body>
    <div class="signin-form">
        <form:form class="" action="login" method="post">
                <h1>Sign In</h1>
                <form:input placeholder="Email" path="userName" class="txtb" id="kttk"/>
                <form:password placeholder="Password" path="passWord" class="txtb" id="kttk"/>
                <label class ="errors">${error }</label>
                <input type="submit" name="action" value="SignIn" class="signin-btn" id="ktSubmit" />
                 
        </form:form>
        <div class="signin-end">
               <!--  <a href="homepage" class="signin-fpw">Forgot your password?</a> -->
                
                <a href="signup" class="signin-fpw1">Sign Up</a>
                 <a href="homepage" class="signin-fpw1">Homepage</a>
        </div>
        
    </div>
</body>
</html>