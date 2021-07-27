<%@page import="se.ptithcm.detai.model.TaiKhoan"%>
<%@page import="se.ptithcm.detai.model.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">    
    <link rel="shortcut icon" type="image/png" href="resources/images/bg.png"/>
    <!--CSs-->
    <link rel="stylesheet" href="resources/css/homepage.css">
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<title>Header</title>
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
                <a href="cart">
                    <button class="btn btn-outline-primary" type="submit" style="font-size: 13px;">
                        <i class="fas fa-shopping-cart"></i> Giỏ Hàng
                    </button>
                    <span> <%=cartBean.countItem() %> </span>
                </a>                 
            </li>
             <%if (session.getAttribute("user") ==null) { %>
            <li class="nav-item ">
              <a class="nav-link" href="signin"><i class="fas fa-user"></i>Tài Khoản</a>
            </li>
             <% } %>
            <%if (session.getAttribute("user") !=null) { %>
            <li class="nav-item "> 
              <a class="nav-link" href="signin"><i class="fas fa-sign-out-alt"></i>Log Out</a>  
            </li>
            <% } %>
           <!--   <li class="nav-item "> 
              <a class="nav-link" href="signin.jsp"><i class="fas fa-sign-out-alt"></i>Log Out</a>  
            </li>-->
          </ul>
    </nav>
    
    <!--Navigation-->
    <nav class="navbar navbar-expand-md navbar-dark " id="navbarNav">
        <a class="navbar-brand" href="homepage"><img src="resources/images/bg.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">
                <ul class="navbar-nav ">
                        <li class="nav-item">                 
                          <a class="nav-link active" href="homepage">Trang Chủ</a>
                        </li>   
                                          
                        <li class="nav-item dropdown">
                        	 
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  Sản Phẩm
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                     <c:forEach items="${dsdm}" var="dm">                                        	                     		
	                                	<a class="dropdown-item" href="dssptdm/${dm.maDM }"> ${dm.tenDM } </a>
	                                	<!-- dssptdm/ -->
                                  		<div class="dropdown-divider"></div>   	                     				
                					</c:forEach>
                                </div>
                             	     
                        </li>
                       
                        <li class="nav-item">	
                            <a class="nav-link" href="#">Quản Lý</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Liên Hệ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="thanhvien">CÁ NHÂN</a>
                        </li>  
                        
                </ul> 
                <form class="form-inline ml-auto">
                        <i class="fas fa-search" style="font-size: 2rem;"></i><input id="cardsearchinput" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" size="50">
                        <button class="btn btn-warning" type="submit">Search</button>
                </form>
                
        </div>
    </nav>
    <!--JS bootstrap-->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
</body>
</html>