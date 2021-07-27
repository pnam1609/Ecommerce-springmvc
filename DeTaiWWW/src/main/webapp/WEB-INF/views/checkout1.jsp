<%@page import="se.ptithcm.detai.model.CartBean"%>
<%@page import="se.ptithcm.detai.model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thanh Toán</title>
    <link rel="shortcut icon" type="image/png" href="resources/images/bg.png"/>

    <!--CSs-->
    <link rel="stylesheet" href="resources/css/checkout.css">
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/checkout.js" type="text/javascript"></script>
</head>
<body>
		
	<%
		TaiKhoan tk = (TaiKhoan) session.getAttribute("user");
		if (tk == null) {
			response.sendRedirect("signin");
		}

		CartBean cartBean = (CartBean) session.getAttribute("cart");
		if (cartBean == null) {
			cartBean = new CartBean();
			session.setAttribute("cart", cartBean);
		}
	%>
	<jsp:include page="header.jsp"></jsp:include>

    <!--Payment-->
    <div class="container">
    	<form:form action="addDonDatHang" method="post">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <thead class="table-bordered table-info">
                      <tr>
                        <th scope="col" colspan="2">Tên Sản Phẩm</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Đơn Giá</th>
                        <th scope="col">Tổng Tiền</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="cartItem" items="${cart.cartItems}" varStatus="counter">	
	                      <tr>
	                        <td colspan="2"><c:out value="${cartItem.partNumber}" /> 
	                        				<input type="hidden" value="${cartItem.partNumber}">
	                        </td>
	                        <td><c:out value='${cartItem.quantity }'/> 
	                        	<input type="hidden" name="quantity" value='<c:out value='${cartItem.quantity }'/>' />
	                        </td>
	                        <td>
	                        	<input type="hidden" name="unitcost" value='<c:out value='${cartItem.unitCost }'/>' />
	                			<c:out value="${cartItem.unitCost }" />đ
	                        </td>
	                        <td> <c:out value="${cartItem.totalCost }" />đ </td>
	                      </tr>                      
                       </c:forEach>
                    </tbody>
                    <tfoot>
                    	<tr>
	                          <td colspan="4">Tổng Thành Tiền= <c:out value="${cart.orderTotal}" />đ 
	                          	<form:input type="hidden" path="total" value="${cart.orderTotal }"/>
	                          </td>
	                      </tr>
                    </tfoot>
                  </table>
            </div>
        </div>
        <hr class="light">
        <div class="row">
            <div class="col-md-12">
                <h3>Thông Tin Thêm</h3>
            </div>
            <div class="col-md-12">
                
                        <div class="form-group row">
                          <label for="staticEmail" class="col-md-3 label-email">Nhập địa chỉ giao hàng</label>                         
                          <div class="col-md-9">
                                <form:input type="text" path="address" class="form-control" id="address" placeholder="ex: 100 Trần Quang Khải, K5, P5, Tp.Cà Mau"/>
                          		<span id="tbAddress" style="color: red"></span>
                          </div>                         
                        </div>
                        <div class="form-group row">
                          <label for="inputPassword" class="col-md-3 label-email">Phương thức thanh toán</label>
                          <div class="col-md-9">
                                <div class="form-check form-check-inline">
                                    <form:radiobutton class="form-check-input" path="payment" id="payment" value="COD" checked="true"/>
                                    <label class="form-check-label" for="payment">COD</label>                                       
                                </div>
                                <div class="form-check form-check-inline">
                                    <form:radiobutton class="form-check-input" path="payment" id="payment" value="ATM"/>
                                    <label class="form-check-label" for="payment">ATM</label>
                                </div>
                          </div>
                        </div>
                        <button type="submit" class="btn btn-outline-primary" class="btnThanhToan" name="action" value="ThanhToan" id="btnThanhToan" >Thanh Toán</button>
            </div>
        </div>
        </form:form>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>





     <!--JS bootstrap-->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
</body>
</html>