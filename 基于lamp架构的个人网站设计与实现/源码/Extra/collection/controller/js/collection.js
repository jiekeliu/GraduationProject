$(document).ready(function(){ 
	getCollectionByNum();
});
 
var res_data;   //所有返回数据
var maxpage = 0;   //最大页数

//资源列表获取函数
function getCollectionByNum(){
	$.post("php/getCollectionByNum.php",function (data) {
		var data = JSON.parse(data);
		res_data = data;
    	$.each(data,function(key,value){  //遍历键值对
           $('#pageli').before("<li><a href='javascript:;' onclick='setCollectionList("+key+");'>"+key+"</a></li>");
           maxpage++;
  		})
   		setCollectionList(1);
    });
}

//资源列表设置函数
 function setCollectionList(page){
 	$("#itable").find("tr").not(":first").remove();
	for (var i = 0; i < res_data[page].length ; i++) {
		var str ="<tr>"
	  		+"<td>"+res_data[page][i].Sid+"</td>"
	  		+"<td>"+res_data[page][i].Sname+"</td>"
	  		+"<td>"+res_data[page][i].Surl+"</td>"
	  		+"<td>"+res_data[page][i].Ssize+"</td>"
	  		+"<td>"+res_data[page][i].Stype+"</td>"
	  		+"<td>"+res_data[page][i].Ftype+"</td>"
	  		+"<th><button type='button' class='btn btn-sm btn-default' onclick=' getDetails("+res_data[page][i].Sid+")'>查看详情</button></th>"
	  		+"</tr>";
		$('#itable').append(str);
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
			setCollectionList(page+1);
		}
	} else{
		if (page-1 < 1) {
			alert('已达最小页');
		} else{
			setCollectionList(page-1);
		}
	}
}

//页面跳转函数
function getDetails(Sid){
	window.location.href = 'html/detail.html?Sid='+Sid;
}
 
//文件上传函数
 var uploading = false;
 function upload(){
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
    var Stype = $('#Stype').val();
    if(Stype == ''){
    	alert("文件类型不能为空");
      	return false;
    }  
    if(uploading){
      alert("文件正在上传中，请稍候");
      return false;
    }
    $.ajax({
      type: 'POST',
      url: "php/doAction.php?Stype="+Stype,  //当前路径
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
        // 设置进度条样式
        $('#progressBar').css('width',percent + '%');
        $('#progressBar').html(percent + '%');
      }),
      success:function(res){
      		uploading = false;
        	alert('上传成功');
        	window.location.reload();
      },
      error:function(res){
        console.log("后台处理错误");
      }
    });
 }