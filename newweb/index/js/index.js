$(document).ready(function(){ 
	$(".headerpage").load("header.html");
	resetHeight();
	$(".footerpage").load("footer.html");
});

function resetHeight(){
	var h = ($(document).height()-100);
	$('#mainContent').css('min-height',h);
}