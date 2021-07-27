<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thành Viên</title>
    <link rel="shortcut icon" type="image/png" href="resources/images/bg.png"/>
    <!--CSs-->
    <link rel="stylesheet" href="resources/css/thanhvien.css">
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="header1.jsp"></jsp:include>
    
    <!--Our Team-->
    <div class="container our-team" >
        <div class="col-12">
            Thành Viên Nhóm
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="border">
                <img src="resources/images/avatar2.jpg">
                <div class="fullname">Trương Quốc Đức Thành</div>
                <div class="starts">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
                <hr class="light">
                <div class="content">
                        <p>MSSV: 16020131</p>
                        
                </div>
                </div>    
            </div>
            <div class="col-md-4">
                <div class="border">
                <img src="resources/images/avatar1.jpg">
                <div class="fullname">Nguyễn Thanh Tường</div>
                <div class="starts">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <hr class="light">
                <div class="content">
                        <p>MSSV: 16028491</p>
                        
                </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="border">
                <img src="resources/images/avatar3.jpg">
                <div class="fullname">Tô Văn Thống</div>
                <div class="starts">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
                <hr class="light">
                <div class="content">
                    <p>MSSV: 16039931/p>
                    
                </div>
                </div>
            </div>
        </div>
    </div>

	<jsp:include page="footer.jsp"></jsp:include>
    
    


















  <!--JS bootstrap-->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
</body>
</html>