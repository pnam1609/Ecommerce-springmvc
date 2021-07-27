<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
 		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">    
        <title>Thêm Sản Phẩm</title>
        <link rel="shortcut icon" type="image/png" href="resources/images/bg.png"/>
        <!--CSs-->
        <link rel="stylesheet" href="resources/css/ThemDanhMuc.css">
        <link rel="stylesheet" href="resources/css/homepage.css">
        <!--Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
<body>
	<!--Navigation-->
    <nav class="navbar navbar-expand-md navbar-dark " id="navbarNav">
        <a class="navbar-brand" href="homepage1"><img src="resources/images/bg.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">
                <ul class="navbar-nav ">
                        <li class="nav-item">                 
                          <a class="nav-link active" href="homepage1">Trang Chủ</a>
                        </li>   
                                          
                        <li class="nav-item dropdown">
                        	 
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  Sản Phẩm
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                     <c:forEach items="${dsdm}" var="dm">                                        	                     		
	                                	<a class="dropdown-item" href="dssptdm1/${dm.maDM}"> ${dm.tenDM } </a>
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
                            <a class="nav-link" href="thanhvien">Thành Viên</a>
                        </li>  
                        
                </ul> 
                <form class="form-inline ml-auto">
                        <i class="fas fa-search" style="font-size: 2rem;"></i><input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" size="50">
                        <button class="btn btn-warning" type="submit">Search</button>
                </form>
                
        </div>
    </nav>

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
                <h3>Thêm Mới Sản Phẩm</h3>
                <form:form action="savesp" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Mã Sản Phẩm</label>
                      <form:input type="text" path="maSP" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="mã sản phẩm" required="true"/>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Tên Sản Phẩm</label>
                      <form:input type="text" path="tenSP" class="form-control" id="exampleInputPassword1" placeholder="tên sản phẩm" required="true"/>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword2">Mô Tả Sản Phẩm</label>
                      <form:input type="text" path="moTa" class="form-control" id="exampleInputPassword2" placeholder="mô tả sản phẩm" required="true"/>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword3">Giá Tiền</label>
                      <form:input type="text" path="giaTien" class="form-control" id="exampleInputPassword3" placeholder="đơn giá" required="true" pattern="[0-9]{5,}" title="Giá tiền >=10000"/>
                    </div>
                    <%-- <div class="form-group">
                      <label for="exampleInputPassword4">Hình Ảnh</label>
                      <form:input type="text" path="imageURL" class="form-control" id="exampleInputPassword4" placeholder="đường dẫn hình ảnh" required="true"/>
                    </div> --%>
                    
                    <%-- <div class="form-group">
                      <label for="exampleInputPassword4">Hình Ảnh</label>
                      <form:input type="file" path="imageURL" class="form-control" id="exampleInputPassword4" placeholder="đường dẫn hình ảnh" required="true"/>
                    </div> --%>
                    
                    <input type="file" name="image" accept="image/png, image/jpeg"/>
                        
                    <div class="form-group">	       
                      		<label for="inputState">Mã Danh Mục</label>		
						      <form:select id="inputState" class="form-control" path="danhMuc">
						      	<c:forEach items="${dsdm}" var="dm">
						        <option>${dm.maDM}</option>
						        </c:forEach>		        
						      </form:select>
                    </div>
                    <input type="hidden" name="command" value="insert">
                    <button type="submit" class="btn btn-outline-primary">Thêm sản phẩm</button>
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