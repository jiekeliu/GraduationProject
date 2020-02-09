$(document).ready(function(){ 
	getFontLog();
});
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
					+"<p style='text-align: center;'><a role='button' data-toggle='collapse' href='#log"+data[i]['lid']+"' aria-expanded='false' aria-controls='collapseExample'>"
			  			+"我是内容，点我"
					+"</a></p>"
					+"<div class='collapse' id='log"+data[i]['lid']+"'>"
					  +"<div class='well'>"
					    + data[i]['ltext']
					  +"</div>"
					+"</div>"	
				+"</div>"
			+"</div>";
			
		$('#log').after(str);
	}
}
