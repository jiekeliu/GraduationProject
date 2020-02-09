$(document).ready(function(){ 
	getResultsAll();
});
 
var res_data;   //所有返回数据
var maxpage = 0;   //最大页数

//资源列表获取函数
function getResultsAll(){
	$.post("php/getResultsAll.php",function (data) {
		var data = JSON.parse(data);
		res_data = data;
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
		var str ="<tr>"
	  		+"<td>"+res_data[page][i].Rid+"</td>"
	  		+"<td>"+res_data[page][i].Rtitile+"</td>"
	  		+"<td>"+res_data[page][i].Rauthor+"</td>"
	  		+"<td>"+res_data[page][i].Rtype+"</td>"
	  		+"<td>"+res_data[page][i].Rtime+"</td>"
	  		+"<th><button type='button' class='btn btn-sm btn-default' onclick='setDetail("+res_data[page][i].Rid+")'>查看详情</button></th>"
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
function setDetail(Rid){
	window.location.href = 'detail.html?Rid='+Rid;
}

function addDetail(){
	window.location.href = 'detail.html?Rid=';
}