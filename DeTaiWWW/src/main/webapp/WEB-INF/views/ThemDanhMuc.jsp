<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
 		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">    
        <title>HomePage</title>
        <link rel="shortcut icon" type="image/png" href="images/bg.png"/>
        <!--CSs-->
        <link rel="stylesheet" href="<c:url value="/resources/css/ThemDanhMuc.css"/> ">
        <!--Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="navigation.jsp"></jsp:include>

    <!--Manager-->
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="Manage-menu">
                    <ul>
                        <a href="homepage1"><li>Trang Chủ</li></a>
                        <a href="quanlydanhmuc"><li>Danh Mục</li></a>
                        <a href="quanlysanpham"><li>Sản Phẩm</li></a>
                        <a href="quanlytaikhoan"><li>Tài Khoản</li></a>
                        <a href="quanlydondathang"><li>Đơn Đặt Hàng</li></a>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <h3>Thêm Mới Danh Mục</h3>
                <form:form action="save" method="post">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Mã Danh Mục</label>
                      <form:input type="text" name="maDanhMuc" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="mã danh mục" path="maDM" required="true"  title="bắt buộc nhập"/>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Tên Danh Mục</label>
                      <form:input type="text" name="tenDanhMuc" class="form-control" id="exampleInputPassword1" placeholder="tên danh mục" path="tenDM" required="true"  title="bắt buộc nhập"/>
                    </div>
                    <input type="hidden" name="command" value="insert">
                    <button type="submit" class="btn btn-outline-primary">Thêm danh mục</button>
                  </form:form>
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