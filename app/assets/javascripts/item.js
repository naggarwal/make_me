
var item = {
	toggleForm : function(){
		alert("Form is hidden: " + $("#formOptional").hasClass("hide"));
		if($("#formOptional").hasClass("hide")){
			$("#formOptional").removeClass("hide");
			$("#optional").html("Hide Advanced <i class=\"icon-minus-sign\"></i>");
		} else {
			$("#formOptional").addClass("hide");
			$("#optional").html("Show Advanced <i class=\"icon-plus-sign\"></i>")
			
		}
	}
}