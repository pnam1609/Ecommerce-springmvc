<%@page import="se.ptithcm.detai.model.SanPham"%>
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
    <title>Danh Mục</title>
    <link rel="shortcut icon" type="image/png" href="../resources/images/bg.png"/>
    <!--CSs-->
    <link rel="stylesheet" href="../resources/css/DanhSachSPTheoDanhMuc.css">
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

</head>
<body>
	<% 
		TaiKhoan tk = null;
		if(session.getAttribute("user")!=null){
			tk = (TaiKhoan) session.getAttribute("user");
		}
		
		CartBean cartBean = (CartBean) session.getAttribute("cart");
		if(cartBean==null){
			cartBean = new CartBean();
			session.setAttribute("cart", cartBean);
		}
		
	 %>
	<!--Header-->
    <nav class="navbar navbar-expand-lg navbar-light " id="navbarHeader">
        <a class="navbar-brand" href="#" id="header-text">Chào mừng đến với website </a>
        <ul class="navbar-nav ml-auto">
        	 <%if(tk!=null){ %>
        	 <li class="nav-item"> 
        	 	<a class="nav-link" href="#"><i class="fas fa-user"></i><%=tk.getUserName() %> </a>
        	 </li> 
        	 <%} %>            	 	
            <li class="nav-item cart">  
                <a href="cart1">
                    <button class="btn btn-outline-primary" type="submit" style="font-size: 13px;">
                        <i class="fas fa-shopping-cart"></i> Giỏ Hàng
                    </button>
                    <span> <%=cartBean.countItem() %> </span>
                </a>                 
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="signin"><i class="fas fa-user"></i>Tài Khoản</a>
            </li>
            <%if (session.getAttribute("user") !=null) { %>
            <li class="nav-item "> 
              <a class="nav-link" href="signun"><i class="fas fa-sign-out-alt"></i>Log Out</a>  
            </li>
            <% } %>
           <!--   <li class="nav-item "> 
              <a class="nav-link" href="signin.jsp"><i class="fas fa-sign-out-alt"></i>Log Out</a>  
            </li>-->
          </ul>
    </nav>
    
    <!--Navigation-->
    <nav class="navbar navbar-expand-md navbar-dark " id="navbarNav">
        <a class="navbar-brand" href="../homepage1"><img src="../resources/images/bg.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">
                <ul class="navbar-nav ">
                        <li class="nav-item">                 
                          <a class="nav-link active" href="../homepage1">Trang Chủ</a>
                        </li>   
                                          
                        <li class="nav-item dropdown">
                        	 
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  Sản Phẩm
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                     <c:forEach items="${dsdm}" var="dm">                                        	                     		
	                                	<a class="dropdown-item" href="../dssptdm/${dm.maDM }"> ${dm.tenDM } </a>
                                  		<div class="dropdown-divider"></div>   	                     				
                					</c:forEach>
                                </div>
                             	     
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="quanly">Quản Lý</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Liên Hệ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../thanhvien1">CÁ NHÂN</a>
                        </li>  
                        
                </ul> 
                <form class="form-inline ml-auto">
                        <i class="fas fa-search" style="font-size: 2rem;"></i><input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" size="50">
                        <button class="btn btn-warning" type="submit">Search</button>
                </form>
                
        </div>
    </nav>
	
	 
	 
	
    
	<!--List Product-->
    <div class="container list-product">
        <h6>Danh Sách Sản Phẩm</h6>
        <hr class="light">
        <div class="row text-center padding">
        	<c:forEach items="${dssp}" var="sp">  
	            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" >
	            	<form name="modelDetail" method="post" action="../CartServlet">
		               <a href="../ctsp1/${sp.maSP}" > <img src="../${sp.imageURL}"></a>
		               <div class="btnCTSP"><a href="../ctsp1/${sp.maSP}">Xem Thêm</a></div>
		               <a href="../ctsp1/${sp.maSP}"> <h3>${sp.tenSP}</h3></a>
		               <p>${sp.giaTien}đ</p>
		               		<input type="text" size="2" value="1" name="quantity" id="quantity" required="true" pattern="^[0-9]{1,2}" title="Số lượng phải là số (1-99)"><br>
							<input type="hidden" name="modelNo" value="${sp.maSP}"> 
							<input type="hidden" name="mota" value="${sp.moTa}"> 
							<input type="hidden" name="price" value="${sp.giaTien}">
							<input type="hidden" name="description" value="${sp.tenSP}"> 
							<input type="hidden" name="action" value="add">              
		                    <button id="btnGH" class="btn btn-outline-success" type="submit" style="font-size: 13px;">
		                        <i class="fas fa-shopping-cart"></i> Mua Ngay
		                    </button>	
		            </form>             
	            </div>
            </c:forEach>
            
            
           
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
				<h6>
					<img src="../resources/images/bg.png" style="height: 4rem;">Security
				</h6>
				<hr class="light">
				<p>Hotline: 08-333-333</p>
				<p>SecurityDevice@gmail.com</p>
				<p>12 Nguyễn Văn Bảo, phường 4</p>
				<p>quận Gò Vấp, Tp.HCM</p>
			</div>
			<div class="col-md-4">
				<hr class="light">
				<h5>Thời gian hoạt động</h5>
				<hr class="light">
				<p>Thứ 2 - Thứ 6: 7:00AM - 12:00PM</p>
				<p>Thứ 7: 9:00AM - 10:00PM</p>
				<p>Chủ Nhật: CLOSED</p>
			</div>
			<div class="col-md-4">
				<hr class="light">
				<h5>Phương Thức Thanh Toán</h5>
				<div class="footer-icons-PTTT">
					<i class="fab fa-cc-paypal"></i> <i class="fab fa-cc-visa"></i> <i
						class="fab fa-cc-mastercard"></i> <i class="far fa-money-bill-alt"></i>
					<i class="fab fa-cc-jcb"></i>
				</div>
				<a href="#"><button class="btn btn-outline-warning">
						<i class="fas fa-arrow-up"></i>
					</button></a>
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