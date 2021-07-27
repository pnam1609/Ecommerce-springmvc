<%@page import="java.util.List"%>
<%@page import="se.ptithcm.detai.model.DanhMuc"%>
<%@page import="se.ptithcm.detai.model.TaiKhoan"%>
<%@page import="se.ptithcm.detai.model.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">    
        <title>Quản Lý Sản Phẩm</title>
        <link rel="shortcut icon" type="image/png" href="resources/images/bg.png"/>
        <!--CSs-->
        <link rel="stylesheet" href="resources/css/QuanLySanPham.css">
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
                <h3>Quản Lý Sản Phẩm</h3>
                <table class="table table-hover">
                    <thead class="table-bordered table-primary">
                      <tr>
                        <th scope="col">Mã Sản Phẩm</th>
                        <th scope="col">Tên Sản Phẩm</th>
                        <th scope="col">Đơn Giá</th>
                        <th scope="col">Hình Ảnh</th>
                        <th scope="col">Danh Mục</th>
                        <th scope="col">Cập nhật</th>
                        <th scope="col">Xóa</th>
                      </tr>
                    </thead>
                    <tbody>
						<c:forEach items="${dssp}" var="sp">                   
	                      <tr>
	                        <td>${sp.maSP}</td>
	                        <td>${sp.tenSP}</td>
	                        <td>${sp.giaTien}</td>
	                        <td><img src="${sp.imageURL}"></td>
	                        <td>${sp.danhMuc}</td>
	                        <td><a href="editsp/${sp.maSP}"><i class="far fa-edit"></i> &nbsp; Sửa</a></td>
	                        <td><a href="deletesp/${sp.maSP}"><i class="far fa-trash-alt"></i> &nbsp; Xóa</a></td>
	                      </tr>
                      	</c:forEach>
                    </tbody>
                  </table>
              <div class="row">
              		<a href="addsp"><button type="submit" class="btn btn-outline-warning">Thêm mới sản phẩm</button></a> 		
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