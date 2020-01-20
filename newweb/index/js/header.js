$(document).ready(function(){ 
	getNavigationbar();
	getFontsetting();
});	
//网站根目录获取方法
function getRootPath(){
    var strFullPath=window.document.location.href;
    var strPath=window.document.location.pathname;
    var pos=strFullPath.indexOf(strPath);
    var prePath=strFullPath.substring(0,pos);
    var postPath=strPath.substring(0,strPath.substr(0).indexOf('/')+1);
    return(prePath+postPath);
}
//网站信息获取函数
function getFontsetting(){
	var root = getRootPath();
	path = root + 'index/controller/getFontsettingInfo.php';
	$.post(path,function (data) {
		var data = JSON.parse(data);
		setFontsetting(data)
	});
}

//网站信息设置函数
function setFontsetting(data){
	$("title").html(data[0]['web_name']);
	$("#footer_text").html(data[0]['webfooter_info']);
	var root = getRootPath();
	img_path = root + data[0]['webimg_url'];
	$("#web_img").attr('src',img_path);
	console.log(data);
}

//导航条设置函数	
function getNavigationbar(){
	var root = getRootPath();
	path = root + 'index/controller/index.php';
	$.post(path,function (data) {
		seeCookie();
    	var res = JSON.parse(data);
    	var bar_data = [];
	    bar_data[0] = [];
		for(var i =0 ;i < res.length;i++){
			var tpid = parseInt(res[i]['father_id']);
			if (tpid == 0) {
				var tid = parseInt(res[i]['tid']);
				bar_data[0].push(res[i]);
				bar_data[tid] = [];
			}
			if(tpid != 0){
				bar_data[tpid].push(res[i]);
			}
	   }
    	
    	$.each(bar_data[0],function(index,value){
			var id = parseInt(value['tid']);
			if (bar_data[id].length > 0) {
				var str = "<li role='presentation' class='dropdown'>"
					    +"<a class='dropdown-toggle' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>"
					    + value['tname']+"<span class='caret'></span>"
					    +"</a>"
					    +"<ul class='dropdown-menu'>";
				str +="<li role='presentation'>"
					+"<a href='"+root+value['turl']+"'>"+value['tname']+"</a>"
					+"</li>";
				$.each(bar_data[id],function(index2,value2){
					str += "<li role='presentation'>"
					+"<a href='"+root+value2['turl']+"'>"+value2['tname']+"</a>"
					+"</li>";
				});	
				str +="</ul></li>";
				$('#ul').append(str);
				
			} else{
				var str = "<li role='presentation'>"
				+"<a href='"+root+value['turl']+"' id='"+value['turl']+"'>"+value['tname']+"</a>"
				+"</li>";
		    	$('#ul').append(str);
			}
		});  //each
    	
   });   //post
}

//cookie检测函数
function seeCookie(){
	var ckie = getCookie('url');
	var root = getRootPath();
	if (!ckie) {
		$('#cub').append("<li><a href='"+root+"index/view/dologin.html'>登录</a></li><li><a href='registation.html'>注册</a></li>");
	} else{
		$('#cub').append("<li><a href='"+root+"admin/view/index.html'>控制台</a></li><li><a href='javascript:;' onclick='delCookie();'>退出</a></li>");
	}
}
//cookic查询函数
function getCookie(name){
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return false;
}
//cookic删除函数
function deleteCookie() {
    var cookies = document.cookie.split(";");
    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
    }
    if(cookies.length > 0)
    {
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i];
            var eqPos = cookie.indexOf("=");
            var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
            var domain = location.host.substr(location.host.indexOf('.'));
            document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/; domain=" + domain;
        }
    }
}
//删除cookie函数
function delCookie(){
	deleteCookie();
	alert('退出成功');
    setTimeout(function(){window.location.reload();},1000);
}
