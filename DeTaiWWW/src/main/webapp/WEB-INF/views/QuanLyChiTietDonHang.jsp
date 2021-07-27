<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">    
        <title>Quản Lý Chi Tiết Đơn Hàng</title>
        <link rel="shortcut icon" type="image/png" href="images/bg.png"/>
        <!--CSs-->
        <link rel="stylesheet" href="<c:url value="/resources/css/QuanLyDanhMuc.css" />" >
        <!--Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="navigation1.jsp"></jsp:include>

    <!--Manager-->
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="Manage-menu">
                    <ul>
                        <a href="homepage1"><li>Trang Chủ</li></a>
                        <a href="quanlydanhmuc"><li>Danh Mục</li></a>
                        <a href="quanlysanpham"><li>Sản Phẩm</li></a>
                        <a href="quanlykhachhang"><li>Tài Khoản</li></a>
                        <a href="quanlydondathang"><li>Đơn Đặt Hàng</li></a>
                        <a href="quanlychitietdondathang"><li>Chi Tiết Đơn Đặt Hàng</li></a>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <h3>Quản Lý Chi Tiết Đơn Dặt Hàng</h3>
                <table class="table table-hover">
                    <thead class="table-bordered table-primary">
                      <tr>
                        <th scope="col">Mã CTDDH</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Mã DDH</th>
                        <th scope="col">Mã Sản Phẩm</th>
                      </tr>
                    </thead>
                    <tbody>
						<c:forEach items="${list}" var="ctddh">                   
	                      <tr>
	                        <td>${ctddh.billDetailID}</td>
	                        <td>${ctddh.price}</td>
	                        <td>${ctddh.quantity}</td>
	                        <td>${ctddh.donDatHang}</td>
	                        <td>${ctddh.sanPham}</td>
	                      </tr>
                      	</c:forEach>
                    </tbody>
                  </table>
            </div> 
        </div>
    </div>

    <!--Footer Start-->
    <hr class="light">
    <div class="container">
      <div class="row text-center padding">
        <div class="col-12">
            <h3>Kết Nối Với Chúng Tôi</h3>
        </div>
        <div class="col-12 social padding">
          <a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
          <a href="https://twitter.com"><i class="fab fa-twitter"></i></a>
          <a href="https://plus.google.com"><i class="fab fa-google-plus-g"></i></a>
          <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
          <a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
    </div>
    <!--Footer End-->
    <footer>
      <div class="container-fluid padding">
        <div class="row text-center">
          <div class="col-md-4">
            <h6><img src="images/bg.png" style="height: 4rem;">Security</h6> 
            <hr class="light"> 
            <p>Hotline: 08-333-333</p>
            <p>SecurityDevice@gmail.com</p>
            <p>12,Nguyễn Văn Bảo</p>
            <p>Quận Gò Vấp,TPHCM</p>
          </div>
          <div class="col-md-4">
            <hr class="light">
            <h5>Thời gian hoạt động</h5>
            <hr class="light">
            <p>Thứ 2 - Thứ 6: 7am-12pm</p>
            <p>Thứ 7: 9am - 10pm</p>
            <p>Chủ Nhật: off</p>
          </div>
          <div class="col-md-4">
            <hr class="light">
            <h5>Phương Thức Thanh Toán</h5>
            <div class="footer-icons-PTTT">
                <i class="fab fa-cc-paypal"></i>
                <i class="fab fa-cc-visa"></i>
                <i class="fab fa-cc-mastercard"></i>
                <i class="far fa-money-bill-alt"></i>
                <i class="fab fa-cc-jcb"></i>
            </div>
            <a href="#"><button class="btn btn-outline-warning"><i class="fas fa-arrow-up"></i></button></a>
          </div>
        </div>
      </div>
    </footer>
    
  <!--JS bootstrap-->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
</body>
</html>