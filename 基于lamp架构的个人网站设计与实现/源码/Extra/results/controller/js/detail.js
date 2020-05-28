$(document).ready(function(){ 
	setImg();
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
	var str = "";
	if (Rid != '') {
		str = "<button type='button' class='btn btn-primary btn-lg btn-block' onclick='updateResuls()'>修改文章</button>"	
				+"<div style='width: 100%; height: 20px;'></div>"
				+"<button type='button' class='btn btn-default btn-lg btn-block' onclick='delectResults()'>删除文章</button>";
		$('#detail_right').append(str);
		
		$.post("php/getResultById.php", {Rid:Rid}, function (data) {
			var data = JSON.parse(data);
	    	setResult(data);
    	});
	}else{
		str = "<button type='button' class='btn btn-primary btn-lg btn-block' onclick='addResults()'>添加文章</button>"; 
		$('#detail_right').append(str);
	}
}

//结果数据注入
function setResult(data){
	$('#Rtitile').val(data[0]['Rtitile']);
	$('#Rimg_url').val(data[0]['Rimg_url']);
	$('#Rinfo').val(data[0]['Rinfo']);
	$('#Rtext').val(data[0]['Rtext']);
	$('#Rtime').val(data[0]['Rtime']);
	$('#Rauthor').val(data[0]['Rauthor']);
	var url = window.location.protocol+"//"+window.location.host+"/" + data[0]['Rimg_url']
	document.getElementById('img_url').src = url;
	var channlVal;
	$("#Rtype option").each(function(){  //遍历所有option  
          channlVal= $(this).val();   //获取option值  
          if(channlVal == data[0]['Rtype']){  
              $(this).attr('selected', 'selected');
          }  
    }); 
}

//查看img
function showImg(){
	var url = $('#Rimg_url').val();
	url = window.location.protocol+"//"+window.location.host+"/" + url;
	document.getElementById('img_url').src = url;
}

//设置img宽高
function setImg(){
	var wid = $('#img_url').width();
	$('#img_url').height(wid);
}

//日期选择器
$('#Rtime').datetimepicker({
	language : 'zh-CN',
    format : 'yyyy-mm-dd',//日期格式
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
	forceParse: 0
 });
 
//文章修改函数
function updateResuls(){
	var Rtitile = $('#Rtitile').val();
	var Rimg_url = $('#Rimg_url').val();
	var Rinfo = $('#Rinfo').val();
	var Rtext = $('#Rtext').val();
	var Rtime = $('#Rtime').val();
	var Rauthor = $('#Rauthor').val();
	var Rtype = $('#Rtype').val();
	
	var pre_data = {
		Rid:Rid,
		Rtitile:Rtitile,
		Rimg_url:Rimg_url,
		Rinfo:Rinfo,
		Rtext:Rtext,
		Rauthor:Rauthor,
		Rtype:Rtype,
		Rtime:Rtime
	};

	$.post("php/updateResults.php", pre_data, function (data) {
		var data = JSON.parse(data);
	    alert(data.msg);
        window.location.reload();
    });
}


//文章修改函数
function addResults(){
	var Rtitile = $('#Rtitile').val();
	var Rimg_url = $('#Rimg_url').val();
	var Rinfo = $('#Rinfo').val();
	var Rtext = $('#Rtext').val();
	var Rtime = $('#Rtime').val();
	var Rauthor = $('#Rauthor').val();
	var Rtype = $('#Rtype').val();
	
	var pre_data = {
		Rtitile:Rtitile,
		Rimg_url:Rimg_url,
		Rinfo:Rinfo,
		Rtext:Rtext,
		Rauthor:Rauthor,
		Rtype:Rtype,
		Rtime:Rtime
	};

	$.post("php/addResults.php", pre_data, function (data) {
		var data = JSON.parse(data);
	    alert(data.msg);
        window.location.href = 'results.html';
    });
}

//文章修改函数
function delectResults(){
	$.post("php/delectResults.php", {Rid:Rid}, function (data) {
		var data = JSON.parse(data);
	    alert(data.msg);
        window.location.href = 'results.html';
    });
}