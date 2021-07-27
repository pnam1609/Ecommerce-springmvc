<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
 		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">    
        <title>HomePage</title>
        <link rel="shortcut icon" type="image/png" href="images/bg.png"/>
        <!--CSs-->
        <link rel="stylesheet" href='<c:url value="/resources/css/ThemDanhMuc.css"></c:url>'>
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
                        <a href="../homepage1"><li>Trang Chủ</li></a>
                        <a href="../quanlydanhmuc"><li>Danh Mục</li></a>
                        <a href="../quanlysanpham"><li>Sản Phẩm</li></a>
                        <a href="../quanlytaikhoan"><li>Tài Khoản</li></a>
                        <a href="../quanlydondathang"><li>Đơn Đặt Hàng</li></a>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <h3>Cập Nhật Khách Hàng</h3>
                <%-- <form:form action="../editsave" method="post">
                	
                    <div class="form-group">
                      <label for="exampleInputPassword1">Số Điện Thoại</label>
                      <form:input class="form-control" id="exampleInputPassword1" placeholder="số điện thoại" path="soDienThoai" required="true" title="So Dien thoai < 11 so bat dau bang 0" pattern="^0+[0-9]{9,10}"/>
                    </div>
                    <form:input type="hidden" path="maKH"/>
                    <form:button type="submit" class="btn btn-outline-primary">Cập nhật khách hàng</form:button>
                 </form:form> --%>
                 
                 <form:form action="../editsave" method="post" modelAttribute="tk">
                 
                 <div class="form-group">
                      <label for="exampleInputPassword1">UserName</label>
                      <form:input class="form-control" id="exampleInputPassword1" path="userName" readonly="true"/>
                   </div>
                   
                   <div class="form-group">
                      <label for="exampleInputPassword1">PassWord</label>
                      <form:input class="form-control" id="exampleInputPassword1" path="passWord"/>
                   </div>
                   
                   <div class="form-group">
                      <label for="exampleInputPassword1">Họ</label>
                      <form:input class="form-control" id="exampleInputPassword1" path="ho" placeholder="Họ" required="true"/>
                   </div>
                             
                   <div class="form-group">
                      <label for="exampleInputPassword1">Tên</label>
                      <form:input class="form-control" id="exampleInputPassword1" path="ten"  placeholder="Tên" required="true"/>
                   </div>
                   <div class="form-group">
                      <label for="exampleInputPassword1">Địa chỉ</label>
                      <form:input class="form-control" id="exampleInputPassword1" path="diachi"  placeholder="Địa chỉ" required="true"/>
                   </div>
                   
                  <div class="form-group">
                      <label for="exampleInputPassword1">Số Điện Thoại</label>
                      <form:input class="form-control" id="exampleInputPassword1" placeholder="số điện thoại" path="sodienthoai" required="true" title="So Dien thoai < 11 so bat dau bang 0" pattern="^0+[0-9]{9,10}"/>
                   </div>
                 <form:button type="submit" class="btn btn-outline-primary">Cập nhật khách hàng</form:button>
                 
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