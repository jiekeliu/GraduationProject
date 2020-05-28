$(document).ready(function(){ 
	$(".headerpage").load("header.html");
	resetHeight();
	$(".footerpage").load("footer.html");
});

function resetHeight(){
	var h = ($(document).height()-80);
	$('#mainContent').css('height',h);
}