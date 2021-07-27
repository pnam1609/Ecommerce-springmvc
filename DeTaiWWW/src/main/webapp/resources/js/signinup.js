function ktInputDangNhap() {
			var username = $("#loginUsername").val();
			var password1 = $("#loginPassword").val();
			if (username == "") {
			$("#loginUsernameError").html("* Phải nhập tên đăng nhập");
			return false;
			}
			else {
				if(username.length > 50) {
					$("#loginUsernameError").html("* Tên đăng nhập < 50 ký tự");
					return false;
				}
				$("#loginUsernameError").html("&nbsp;");
			}
			if(password1 == "") {
				$("#loginPasswordError").html("* Phải nhập mật khẩu");
				return false;
			}
			else {
				var re = /[a-zA-Z0-9]{8,}/;
				if(!re.test(password1)) {
					$("#loginPasswordError").html("* Mật khẩu phải từ 8 - 255 ký tự");
					return false;
				}
				$("#loginPasswordError").html("&nbsp;");
			}
			return true;
		}
		
		function submitDangNhap() {
			if(ktInputDangNhap())
				return true;
			alert("Thông tin nhập chứa đủ hoặc không chính xác");
			return false;
		}
		$("kttk").blur(function(){
			ktInputDangNhap();
		});
		$("ktSubmit").blur(function(){
			submitDangNhap();
		});
		
		function ktInputDangKy() {
			var username = $("#dangkyUserName").val();
			var password = $("#dangkyPassword").val();
			var pass2 = $("#xacnhanPassword").val();
			var hoten = $("#dangkyHoten").val();
			var gioitinh = $("#dangkyGioitinh").val();
			var email = $("#dangkyEmail").val();
			var sodt = $("#dangkySodt").val();
			var diachi = $("#dangkyDiachi").val();
			
			if (username == "") {
				$("#dangkyUserNameError").html("* Phải nhập tên đăng nhập");
				return false;
			}
			else {
				if(password.lenght < 50) {
					$("#dangkyUserNameError").html("* Tên đăng nhập < 50 ký tự");
					return false;
				}
				$("#dangkyUserNameError").html("&nbsp;");
			}
			if(password == "") {
				$("#dangkyPasswordError").html("* Phải nhập mật khẩu");
				return false;
			}
			else {
				if(password.length < 6 || password.length > 256) {
					$("#dangkyPasswordError").html("* Mật khẩu phải từ 6 - 255 ký tự");
					return false;
				}
				$("#dangkyPasswordError").html("&nbsp;");
			}
			if(pass2 != password) {
				$("#xacnhanPasswordError").html("Mật khẩu không khớp");
				return false;
			}
			$("#xacnhanPasswordError").html("&nbsp;");
			if(hoten == "") {
				$("#dangkyHotenError").html("* Phải nhập họ tên");
				return false;
			}
			$("#dangkyHotenError").html("&nbsp;");
			if(email == "") {
				$("#dangkyEmailError").html("* Phải nhập email");
				return false;
			}
			else {
				var re = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if(!re.test(email)) {
					$("#dangkyEmailError").html("Email không hợp lệ");
					return false;
				}
				$("#dangkyEmailError").html("&nbsp;");
			}
			if(sodt == "") {
				$("#dangkySodtError").html("* Phải nhập số điện thoại");
				return false;
			}
			else {
				var re = /^0[0-9]{9}/;
				if(!re.test(sodt)) {
					$("#dangkySodtError").html("Số điện thoại phải đủ 10 số và bắt đầu từ 0");
					return false;
				}
				$("#dangkySodtError").html("&nbsp;");
			}
				if(diachi == "") {
					$("#dangkyDiachiError").html("* Phải nhập địa chỉ");
					return false;
				}
				return true;
		}
		function submitDangKy() {
			if(ktInputDangKy()) {
				alert("Vui vòng chờ hệ thống xác nhận");
				return true;
			}
			alert("Thông tin nhập chứa đủ hoặc không chính xác");
			return false;
		}
		
		function submitTim() {
			var tim = $("#txtTim").val();
			if(tim == "") {
				alert("Bạn chưa nhập thông tin cần tìm");
				return false;
			}
			return true;
		}