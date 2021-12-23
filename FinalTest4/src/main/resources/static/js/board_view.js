
$(function() {
	
    $("#report").click(function() {
		
        $(".report_modal_wrap").fadeIn();

    }); //$("#report").click-end

    $("#report_cancle_btn").click(function() {
        $(".report_modal_wrap").fadeOut();
        $("#b_report_content").text("");
    }); //$("#report_cancle_btn").click-end

}); // $(function()-end

