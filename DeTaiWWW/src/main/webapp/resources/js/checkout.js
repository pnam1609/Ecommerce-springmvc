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
	
    function KiemTraAddress() {
		if($("#address").val()==""){
			$("#tbAddress").html("Chưa nhập địa chỉ giao hàng");
			return false;
		}
		$("#tbAddress").html("*");
		return true;
	}
    
    $("#address").blur(KiemTraAddress);
    
    $("#btnThanhToan").click(function () {
        if(!KiemTraAddress()) {
            return false;
        }
        return true;
    });
});