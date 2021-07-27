$(document).ready(function () {
    var i = 1;
    
    function KiemTra(txt, re, tb, mess) {
        if (txt.val() == "") {
            tb.html("Chưa nhập số lượng");
            return false;
        }
        if (!re.test(txt.val())) {
            tb.html(mess);
            return false;
        }
        tb.html("*");
        return true;
    }
	
    function KiemTraQuantity() {
		if($("#quantity").val()==""){
			$("#tbQuantity").html("Chưa nhập số lượng");
			return false;
		}
		$("#tbQuantity").html("*");
		return true;
	}
    
    $("#quantity").blur(KiemTraQuantity);
    
    $("#quantity").blur(function () {
        KiemTra($("#quantity"),  /^[0-9]{1,}$/, $("#tbQuantity"), "Số lượng phải là số");
    });
    
    $("#btnUpdate").click(function () {
        if(!KiemTraQuantity() ||  !KiemTra($("#quantity"),  /^[0-9]{1,}$/, $("#tbQuantity"), "Số lượng phải là số")) {
            return false;
        }
        return true;
    });
    
    $("#btnGH").click(function () {
        if(!KiemTraQuantity() ||  !KiemTra($("#quantity"),  /^[0-9]{1,}$/, $("#tbQuantity"), "Số lượng phải là số")) {
            return false;
        }
        return true;
    });
});