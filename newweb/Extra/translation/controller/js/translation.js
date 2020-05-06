$(document).ready(function(){ 
	 getTranslationOne();
});	
//日期选择器
$('#C_time').datetimepicker({
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
 
// 添加文档
function addTranslation(){
	$.post("php/translationAdd.php", $('#translation_form').serialize(),function (data) {
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

//获取最近一项翻译文档
function getTranslationOne(){
	$.post("php/getTranslationOne.php", function (data) {
    	var data = JSON.parse(data);
//  	console.log(data);
    	setTranslationContent(data);
    });
}

//按时间获取翻译文档
function getTranslationBytime(){
	var C_time = $("#C_time").val();
	$.post("php/getTranslationOne.php", {C_time:C_time}, function (data) {
    	var data = JSON.parse(data);
    	console.log(data);
    	setTranslationContent(data);
    });
}

//内容设置函数
function setTranslationContent(data){
	if (data.length > 0) {
    	$("#C_chinese").val(data[0]['C_chinese']);
	   	$("#C_english").val(data[0]['C_english']);
		$("#C_person").val(data[0]['C_person']);
	 	$("#hiddenlid").html(data[0]['Cid']);
	 	$("#C_time").val(data[0]['C_time']);
		$("#C_title").val(data[0]['C_title']);
	 	$("#C_word").html(data[0]['C_word']);
	 	$("#C_type option").each(function(){  //遍历所有option  
          var channlVal= $(this).val();   //获取option值   
          if(channlVal == data[0]['C_type']){  
              $(this).attr('selected', 'selected');
          }  
    }); 
    } else{
    	alert('文档不存在');
    }
}

//修改文档
function updateTranslation(){
	var C_chinese =	$("#C_chinese").val();
	var C_english =	$("#C_english").val();
	var C_person  = $("#C_person").val();
	var C_hiddenlid = $("#hiddenlid").html();
	var C_time = $("#C_time").val();
	var C_title	= $("#C_title").val();
	var C_word = $("#C_word").html();
	var C_type = $("#C_type").val();
	
	var predata = {
		C_chinese:C_chinese,
		C_english:C_english,
		C_person:C_person,
		Cid:C_hiddenlid,
		C_title:C_title,
		C_word:C_word,
		C_type:C_type,
		C_time:C_time
	};
	
	$.post("php/updateTranslation.php", predata,function (data) {
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

//用id设置函数
function setLogid(){
	var lid = $("#hiddenlid").html();
	$("#duid").html(lid);
}

//删除文档
function deleteTranslation(){
	var Cid = $("#hiddenlid").html();
	$.post("php/translationDelete.php", {Cid:Cid},function (data) {
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