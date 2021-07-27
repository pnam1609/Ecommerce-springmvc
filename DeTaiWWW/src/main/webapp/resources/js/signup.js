$(document).ready(function () {
    var i = 1;
    
    function KiemTra(txt, re, tb, mess) {
        if (txt.val() == "") {
            tb.html("Bắt buộc nhập");
            return false;
        }
        if (!re.test(txt.val())) {
            tb.html(mess);
            return false;
        }
        tb.html("*");
        return true;
    }
	
    function KiemTraTenKH() {
		if($("#txtTenKH").val()==""){
			$("#tbTenKH").html("Bắt buộc nhập");
			return false;
		}
		$("#tbTenKH").html("*");
		return true;
	}
    
    function KiemTraDiaChi() {
		if($("#txtDiaChi").val()==""){
			$("#tbDiaChi").html("Bắt buộc nhập");
			return false;
		}
		$("#tbDiaChi").html("*");
		return true;
	}
    
    $("#txtTenKH").blur(KiemTraTenKH);
	
	$("#txtDiaChi").blur(KiemTraDiaChi);
    
    $("#txtSDT").blur(function () {
        KiemTra($("#txtSDT"),  /^[0]\d{9,10}$/, $("#tbSDT"), "SĐT bắt đầu bằng 0 và 9-10 số");
    });


    $("#txtEmail").blur(function () {
        KiemTra($("#txtEmail"),  /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[AZa-z]{2,})$/, $("#tbEmail"), "Email phải đúng mẫu:'yourname@yourcompany.com'");
    });
    
    $("#txtPass").blur(function () {
        KiemTra($("#txtPass"),  /^[A-Za-z0-9]{8,32}$/	, $("#tbPass"), "Password cần tối thiểu 8 và tối đa 32");
    });
    
	
    
    $("#btnSave").click(function () {
        if(!KiemTra($("#txtEmail"),  /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[AZa-z]{2,})$/, $("#tbEmail"), "Email phải đúng mẫu:'yourname@yourcompany.com'")
        		|| !KiemTra($("#txtPass"),  /^[A-Za-z0-9]{8,32}$/, $("#tbPass"), "Password cần tối thiểu 8 và tối đa 32")) {
            return false;
        }
        return true;
    });

});