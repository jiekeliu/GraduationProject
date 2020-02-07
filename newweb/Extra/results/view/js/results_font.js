$(document).ready(function(){ 
	getAllintro();
});
  
var res_data;   //所有返回数据
var maxpage = 0;   //最大页数
//资源列表获取函数
function getAllintro(){
	$.post("php/getAllintro.php",function (data) {
		var data = JSON.parse(data);
		res_data = data;
		console.log(data);
		$.each(data,function(key,value){  //遍历键值对
           $('#pageli').before("<li><a href='javascript:;' onclick='setResultsList("+key+");'>"+key+"</a></li>");
           maxpage++;
  		})
		setResultsList(1);
    });
}

//资源列表设置函数
 function setResultsList(page){
 	$("#itable").find("tr").not(":first").remove();
	for (var i = 0; i < res_data[page].length ; i++) {
		var img_url = window.location.protocol+"//"+window.location.host+"/" + res_data[page][i].Rimg_url;
		var str = "<div class='panel panel-default' onclick='getArticleByid("+res_data[page][i].Rid+");'>"
					  +"<div class='panel-heading'>"
					  	+"<span class='label label-success'>"+res_data[page][i].Rtype+"</span>&nbsp;"+res_data[page][i].Rtitile
					  +"</div>"
					  +"<div class='panel-body'>"
					  	+"<a href='javascript:;' class='thumbnail'>"
							+"<img src='"+img_url+"' alt=''>"
						+"</a>"
					  	+"<div class='intro'>"
					  		+res_data[page][i].Rinfo
					  	+"</div>"
					  +"</div>"
					  +"<div class='panel-footer'>"
					  	+"<span class='glyphicon glyphicon-user'></span>"
					  	+"<span >"+res_data[page][i].Rauthor+"</span>"
					  	+"<span class='glyphicon glyphicon-time'></span>"
					  	+"<span >"+res_data[page][i].Rtime+"</span>"
					  +"</div>"
					+"</div>";
		$('#hiddenpage').before(str);
		$("#hiddenpage").html(page);
	}
 }
 
//翻页控制函数
function pageContro(status){
	var page =parseInt($("#hiddenpage").html());
	if (status) {
		if (page+1 > maxpage) {
			alert('已达最大页');
		} else{
			setResultsList(page+1);
		}
	} else{
		if (page-1 < 1) {
			alert('已达最小页');
		} else{
			setResultsList(page-1);
		}
	}
}

//页面跳转函数
function getArticleByid(Rid){
	window.location.href = 'article.html?Rid='+Rid;
}