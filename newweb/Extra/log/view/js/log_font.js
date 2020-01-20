$(document).ready(function(){ 
	$(".headerpage").load("../../../index/view/header.html");
	$(".footerpage").load("../../../index/view/footer.html");
	getFontLog();
});

//内容控制函数
function showText(c){
	var a = $(c.nextSibling);
	var childen = $(c.children);
	if (a.css('display') == 'none') {
		a.css('display','block');
		childen.css('transform','rotate(180deg)');
	} else{
		a.css('display','none');
		childen.css('transform','rotate(0deg)');
	}
}


//获取最近20条日志内容
function getFontLog(){
	$.post("php/logFontSelect.php", function (data) {
    	var data = JSON.parse(data);
    	setContent(data);
    });
}
//内容设置函数
function setContent(data){
	for (var i = 0; i < data.length ; i++) {
		str = "<div class='content'>"
				+"<div class='content_top'>"
					+"<div class='content_img'>"
						+"<img src='img/omg1.jpg' alt='' class='img-circle'>"
					+"</div>"
					+"<div class='content_title'>"
					  	+"<h3>"+ data[i]['ltitle']+"</h3>"
					  	+"<hr />"
					  	+"<span class='label label-danger'>"+ data[i]['ltime']+"</span>"
					+"</div>"
					+"<div class='drop' onclick='showText(this);'>"
						+"我是内容，点我 <span class='caret'></span> "
					+"</div>"
					+"<div class='content_text'>"
						+ data[i]['ltext']
					+"</div>"
				+"</div>"
			+"</div>";
			
		$('#log').after(str);
	}
}
