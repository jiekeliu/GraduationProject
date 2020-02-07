$(document).ready(function(){ 
	Surl = getUrlParam('Surl');
	console.log(Surl);
	startPlayer(Surl);
});
var Surl;

//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) 
    	return unescape(r[2]); 
    return null; //返回参数值
}
//播放器
function startPlayer(url){
	var videoObject = {
		container: '#player',//“#”代表容器的ID，“.”或“”代表容器的class
		variable: 'player',//该属性必需设置，值等于下面的new chplayer()的对象
		loaded:'loadedHandler',//监听播放器加载成功
		video: url//视频地址
	};
	var player=new ckplayer(videoObject);
}
