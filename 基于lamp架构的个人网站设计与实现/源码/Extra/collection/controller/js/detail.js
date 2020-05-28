$(document).ready(function(){ 
	Sid = getUrlParam('Sid');
	setImg();
	getreSources();
});
var Sid;

//资源附加信息获取
function getAddreSources() {
	$.post("../php/getAddreSources.php", {Sid:Sid}, function (data) {
		var data = JSON.parse(data);
    	setAddreSources(data);
    });
}

//资源附加信息注入
function setAddreSources(data){
	$('#Eextra').val(data[0]['Eextra']);
	$('#Edescription').val(data[0]['Edescription']);
	$('#Efake').val(data[0]['Efake']);
	$('#Thumbnail_url').val(data[0]['Eurl']);
	
	var Stype = $('#Ftype').val();
	if (Stype != 'image/jpeg' && Stype !='image/png' && Stype != 'image/gif') {
		document.getElementById('sur_img').src =window.location.protocol+"//"+window.location.host+"/"+data[0]['Eurl'];
	}
	
}

//资源信息获取
function getreSources() {
	$.post("../php/getreSources.php", {Sid:Sid}, function (data) {
		var data = JSON.parse(data);
    	setreSources(data);
    });
}

//资源信息注入
function setreSources(data) {
	if (data[0]['Ftype'] == 'image/jpeg'||data[0]['Ftype'] =='image/png'||data[0]['Ftype'] == 'image/gif') {
		document.getElementById('sur_img').src =window.location.protocol+"//"+window.location.host+"/"+data[0]['Surl'];
		$('#sub').attr('disabled','disabled');
		$('#file').attr('disabled','disabled');
	}
	
	$('#Sid').val(data[0]['Sid']);
	$('#Surl').val(data[0]['Surl']);
	$('#Sname').html(data[0]['Sname']);
	$('#Ssize').val(data[0]['Ssize']);
	$('#Ftype').val(data[0]['Ftype']);
	var channlVal;
	$("#Stype option").each(function(){  //遍历所有option  
          channlVal= $(this).val();   //获取option值  
          if(channlVal == data[0]['Stype']){  
              $(this).attr('selected', 'selected');
          }  
    }); 
    
    if(data[0]['Stype'] == 'img_add'){
		$('#sub').attr('disabled','disabled');
		$('#file').attr('disabled','disabled');
		$('#Thumbnail_url').attr('disabled','disabled');
		$('#Efake').attr('disabled','disabled');
		$('#Edescription').attr('disabled','disabled');
		$('#Eextra').attr('disabled','disabled');
		$('#Stype').attr('disabled','disabled');
		$('#updataS').attr('disabled','disabled');
	}else{
		getAddreSources();
	}
	
}

 //获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) 
    	return unescape(r[2]); 
    return null; //返回参数值
}

//设置img宽高
function setImg(){
	var wid = $('#sur_img').width();
	$('#sur_img').height(wid);
}

window.onresize = function(){
	setImg();
}

//上传图片处理函数
function changepic() {
	 var reads = new FileReader();
	 f = document.getElementById('file').files[0];
	 reads.readAsDataURL(f);
	 reads.onload = function(e) {
		 document.getElementById('sur_img').src = this.result;
		 $('#img_status').children().remove();
	 };
}
var uploading = false;
//缩略图上传函数
function uploadImg(){
	var percent; //上传百分比
    //首先封装一个方法 传入一个监听函数 返回一个绑定了监听函数的XMLHttpRequest对象
    var xhrOnProgress=function(fun) {
      xhrOnProgress.onprogress = fun; //绑定监听
      //使用闭包实现监听绑
      return function() {
        //通过$.ajaxSettings.xhr();获得XMLHttpRequest对象
        var xhr = $.ajaxSettings.xhr();
        //判断监听函数是否为函数
        if (typeof xhrOnProgress.onprogress !== 'function')
          return xhr;
        //如果有监听函数并且xhr对象支持绑定时就把监听函数绑定上去
        if (xhrOnProgress.onprogress && xhr.upload) {
          xhr.upload.onprogress = xhrOnProgress.onprogress;
        }
        return xhr;
      }
    }
	var data = new FormData($('#mainForm')[0]); //要加【0】
	if (!$('#file').val()) {
		alert("还没有选择文件");
      	return false;
	}
	if(uploading){
      alert("文件正在上传中，请稍候");
      return false;
    }
	$.ajax({
      type: 'POST',
      url: "../php/uploadImg.php",  //当前路径
      data: data,
//    dataType: 'json',
      processData: false,  //序列化，no
      contentType: false,  //不设置内容类型
      beforeSend: function(){
        uploading = true;
      },
      //进度条要调用原生xhr
      xhr:xhrOnProgress(function(evt){
        percent = Math.floor(evt.loaded / evt.total*100);//计算百分比
      }),
      success:function(res){
      		var res = JSON.parse(res);
      		if (res.code) {
      			$('#Thumbnail_url').val(res.msg);
            	document.getElementById('sur_img').src =window.location.protocol+"//"+window.location.host+"/"+res.msg ;
            	$('#img_status').append('<p>图片上传成功</p>');
      		}else{
      			$('#img_status').append('<p>图片上传失败</p>');
      		}
            
          },
      error:function(res){
             console.log("后台处理错误");
         }
   });
}

//资源信息修改
function updatareSources(){
	var Stype = $('#Stype').val();
	
	var Eurl = $('#Thumbnail_url').val();
	var Efake = $('#Efake').val();
	var Edescription = $('#Edescription').val();
	var Eextra = $('#Eextra').val();
	
	var pre_data = {
		Sid:Sid,
		Stype:Stype,
		Eurl:Eurl,
		Efake:Efake,
		Edescription:Edescription,
		Eextra:Eextra
	};
	
	$.post("../php/updatareSources.php", pre_data, function (data) {
		var data = JSON.parse(data);
    	alert(data.msg);
        window.location.reload();
    });

}


//上传图片处理函数
function delreSources() {
	var Surl = $('#Surl').val();
	var Stype = $('#Stype').val();
	var pre_data = {
		Sid:Sid,
		Stype:Stype,
		Surl:Surl
	};
	
	$.post("../php/delreSources.php", pre_data, function (data) {
		var data = JSON.parse(data);
    	alert(data.msg);
        window.location.href = '../collection.html';
    });
}