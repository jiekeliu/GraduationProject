$(document).ready(function(){ 
	getAllintro();
	getProblems();
});
  
var res_data;   //所有返回数据
//成果资源列表获取函数
function getAllintro(){
	$.post("../../Extra/results/view/php/getAllintro.php",function (data) {
		var data = JSON.parse(data);
		res_data = data;
		setResultsList(1);
    });
}

//成果资源列表设置函数
 function setResultsList(page){
 	$("#results_list").children().remove();
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
		$('#results_list').append(str);
	}
 }
 
//成果资源列表页面跳转函数
function getArticleByid(Rid){
	window.location.href = '../../Extra/results/view/article.html?Rid='+Rid;
}

//问题列表获取函数
function getProblems(){
	$.post("../../Extra/problem/view/php/getProblemsFont20.php",function (data) {
		var data = JSON.parse(data);
		setProblems(data);
    });
}

function setProblems(data){
	var url = window.location.protocol+"//"+window.location.host+"/"+ 'Extra/problem/view/problem_font.html';
	$("#problemList").children().remove();
	for (var i = 0; i < data.length ; i++) {
		var str = "<li class='list-group-item' onclick=\" clickDump('"+url+"')\">"+data[i]['Ptext']+"</li>";
		
		$('#problemList').append(str);
	}
}

//点击跳转函数
function clickDump(url){
	window.location.href = url;
}