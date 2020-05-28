$(document).ready(function(){ 
	Rid = getUrlParam('Rid');
	getResultById();
});
var Sid;

//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) 
    	return unescape(r[2]); 
    return null; //返回参数值
}

//资源列表获取函数
function getResultById(){
		
	$.post("php/getResultById.php", {Rid:Rid}, function (data) {
		var data = JSON.parse(data);
	    setArticle(data);
    });
}

//文章注入
function setArticle(data){
	console.log(data);
	$('#Rtitile').html(data[0]['Rtitile']);
	$('#Rauthor').html(data[0]['Rauthor']);
	$('#Rtext').html(data[0]['Rtext']);
	$('#Rtime').html(data[0]['Rtime']);
}
