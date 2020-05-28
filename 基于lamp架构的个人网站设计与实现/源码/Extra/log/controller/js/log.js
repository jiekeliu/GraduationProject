$(document).ready(function(){ 
	getLog();
});	
//获取最近一条日志内容
function getLog(){
	$.post("php/logSelect.php", function (data) {
    	var data = JSON.parse(data);
    	$("#ltitle").val(data[0]['ltitle']);
    	$("#ltime").val(data[0]['ltime']);
    	$("#ltext").val(data[0]['ltext']);
    	$("#hiddenlid").html(data[0]['lid']);
    });
}
//日志查询
function searchLog(){
	var ltime = $("#ltime").val();
	$.post("php/logSelect.php", {ltime:ltime}, function (data) {
    	var data = JSON.parse(data);
    	if (data.length > 0) {
    		$("#ltitle").val(data[0]['ltitle']);
	    	$("#ltime").val(data[0]['ltime']);
	    	$("#ltext").val(data[0]['ltext']);
	    	$("#hiddenlid").html(data[0]['lid']);
    	} else{
    		alert('日志不存在');
    	}
    	
    });
}

//日期选择器
$('#ltime').datetimepicker({
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
// 添加日志
function addLog(){
	$.post("php/logAdd.php", $('#log_form').serialize(),function (data) {
//	  	console.log(data);
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
        }else{
            alert(res.msg);
        }
    });
}

//修改日志
function updateLog(){
	var lid = $("#hiddenlid").html();
	var ltitle = $("#ltitle").val();
    var ltime = $("#ltime").val();
    var ltext = $("#ltext").val();
	$.post("php/logUpdate.php", {lid:lid, ltitle:ltitle, ltime:ltime, ltext:ltext},function (data) {
//	  	console.log(data);
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
        }else{
            alert(res.msg);
        }
    });
}

//用户id设置函数
function setLogid(){
	var lid = $("#hiddenlid").html();
	$("#duid").html(lid);
}

//删除日志
function deleteLog(){
	var lid = $("#hiddenlid").html();
	$.post("php/logDelete.php", {lid:lid},function (data) {
//	  	console.log(data);
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
    		window.location.reload();
        }else{
            alert(res.msg);
            window.location.reload();
        }
    });
}