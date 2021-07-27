
<%@page import="se.ptithcm.detai.model.CartBean"%>
<%@page import="se.ptithcm.detai.model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>Website giới thiệu, bán đồ trang trí đồ nội thất</title>
</head>
<body>
	<jsp:include page="header1.jsp"></jsp:include>
	
	<%-- <jsp:include page="banner.jsp"></jsp:include> --%>
	
	<!--List Product-->	
	<div class="list">
    <div class="container list-product">
        <div class="row text-center padding">
            
            <c:forEach items="${ds}" var="sp">
	            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
	            	<form name="modelDetail1" method="post" action="CartServlet">
	            	<p class="tensp">${sp.tenSP}</p>
	                <a href="ctsp1/${sp.maSP}"> <img src='${sp.imageURL}'></a>
	                <div class="btnCTSP"><a href="ctsp1/${sp.maSP}">Xem Thêm</a></div>
	                <p>${sp.giaTien}đ</p>
	                		<input type="text" size="2" value="1" name="quantity" id="quantity" required="true" pattern="^[0-9]{1,2}" title="Số lượng phải là số (1-99)"><br>
							<input type="hidden" name="modelNo" value="${sp.maSP}"> 
							<input type="hidden" name="mota" value="${sp.moTa}"> 
							<input type="hidden" name="price" value="${sp.giaTien}">
							<input type="hidden" name="description" value="${sp.tenSP}"> 
							<input type="hidden" name="action" value="add"> 
	                <a href="">
	                    <button id="btnGH" class="btn btn-outline-success" type="submit" style="font-size: 13px;">
	                        <i class="fas fa-shopping-cart"></i> Mua Ngay
	                    </button></a>
	                </form>
	            </div>
            </c:forEach>         
             
        </div>

    </div>
	</div>	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>