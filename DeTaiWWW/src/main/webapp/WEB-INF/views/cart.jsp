<%@page import="se.ptithcm.detai.model.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cart</title>

    <link rel="stylesheet" href="resources/css/cart.css">
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!--<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/cart.js" type="text/javascript"></script>  -->
</head>
<body>
	<% 		
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
        	           	 	
            <li class="nav-item cart">  
                <a href="cart">
                    <button class="btn btn-outline-primary" type="submit" style="font-size: 13px;">
                        <i class="fas fa-shopping-cart"></i> Giỏ Hàng
                    </button>
                    <span> <%=cartBean.countItem() %> </span>
                   <span>cart.countItem()</span>
                </a>                 
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="signin"><i class="fas fa-user"></i>Tài Khoản</a>
            </li>
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
                            <a class="nav-link" href="thanhvien">Thành Viên</a>
                        </li>  
                        
                </ul> 
                <form class="form-inline ml-auto">
                        <i class="fas fa-search" style="font-size: 2rem;"></i><input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" size="50">
                        <button class="btn btn-warning" type="submit">Search</button>
                </form>
                
        </div>
    </nav>
        
        <!--Breadcrumb-->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="homepage">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Giỏ Hàng</li>
            </ol>
        </nav>


       <!--Content Cart-->
       <table class="table table-bordered ">
            <thead class="thead-dark">
              <tr>
                <th scope="col">TÊN SẢN PHẨM</th>
                <th scope="col">SỐ LƯỢNG</th>
                <th scope="col">ĐƠN GIÁ</th>
                <th scope="col">TỔNG TIỀN</th>
              </tr>
            </thead>
            <tbody>
            	<c:if test="${cart.lineItemCount==0}">
					<tr>
						<td colspan="4"> Không có sản phẩm nào trong giỏ hàng <br /></td>
					</tr>
				</c:if>
				<c:forEach var="cartItem" items="${cart.cartItems}" varStatus="counter">
					<form name="item" method="post" action="CartServlet">
              			<tr>
	                		<td> <c:out value="${cartItem.partNumber}" /> <input type="hidden" name="maDH" value="${cartItem.partNumber}"> <br/>
	                			 <c:out value="${cartItem.modelDescription}" />
	                		</td>
	                		<td>
	                			<input type="hidden" name="itemIndex" value='<c:out value="${counter.count}"/>'> 
	                			<input type="text" name="quantity" id="quantity" required="true" pattern="^[0-9]{1,2}" title="Số lượng phải là số (1-99)" value='<c:out value='${cartItem.quantity }'/>'> 
	                			<span id="tbQuantity"></span>
	                        	<button class="btn btn-outline-primary" type="submit" style="font-size: 13px;" id="btn" name="action" value="Delete">
	                                <i class="fas fa-trash-alt"></i> Xóa sản phẩm
	                        	</button>
	                        	<button class="btn btn-outline-warning" type="submit" style="font-size: 13px;" id="btnUpdate" name="action" value="Update">
	                                <i class="fas fa-edit"></i> Cập nhật số lượng
	                        	</button>
	                		</td>
			                <td><c:out value="${cartItem.unitCost }" />đ </td>
			                <td><c:out value="${cartItem.totalCost }" />đ <input type="hidden" name="thanhTien" value="${cartItem.totalCost }"></td>
             			</tr>
             			    
             		</form>
             	</c:forEach>
              	<tr>
                	<td colspan="3" id="subtt">Tổng Thành Tiền</td>
                	<td>
                		<c:out value="${cart.orderTotal}" />đ
                	</td>
              	</tr>

              	<tr>
					<td colspan="3"></td>
					<td>
						<a href="checkout"><button class="btn btn-outline-success" type="submit" style="font-size: 13px; width: 200px;" id="btn">                      	                            
									Tiến hành đặt hàng
						</button></a>
					</td> 
				</tr>  
	              	
            </tbody>
          </table>

       <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>