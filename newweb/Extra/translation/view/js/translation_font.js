$(document).ready(function(){ 
	$(".headerpage").load("../../../index/view/header.html");
	$(".footerpage").load("../../../index/view/footer.html");
	getTranslationWord();
});

// 翻译
function translationStr(type){
	var pre_str = $("#pre_str").val();
	var pre_select = $("#pre_select").val();
	$.post("php/translationStr.php", {pre_str:pre_str, pre_select:pre_select, type:type}, function (data) {
		var data = JSON.parse(data);
    	$("#res_str").val(data['msg']);
    });
}

var mat_data; //存储词库的全局数组
//词库内容获取
function getTranslationWord(){
	$.post("php/getTranslationWord.php",function (data) {
		var data = JSON.parse(data);
    	mat_data = formatting(data);
    	setWordLength(mat_data);
    });
}

//格式整理
function formatting(data){
	var word_club = [];
	for (var i = 1; i<=12; i++) {
		 word_club[i] = [];
	}
	
	for (var i = 0; i<data.length; i++) {
		time_arr=data[i]['Wtime'].split('-');
		word_club[parseInt(time_arr[1])].push(data[i]);
		word_club[0] = time_arr[0];
	}
	return word_club;
}

//单词导航设置
function setWordLength(data){
	var str ="";
	for (var i = 1; i<data.length; i++) {
		if (i<10) {
			str += "<li role='presentation'  style='text-align: center;' onclick='setWord("+i+")'>"
			+"<a href='javascript:;'>"+data[0]+"-0"+i
			+"<span class='badge'>"+data[i].length+"</span></a></li>";
		} else{
			str += "<li role='presentation'  style='text-align: center;' onclick='setWord("+i+")'>"
			+"<a href='javascript:;'>"+data[0]+"-"+i
			+"<span class='badge'>"+data[i].length+"</span></a></li>";
		}		
	}
	$("#wordclub").after(str);
}

//单词内容设置
function setWord(time){
	console.log(mat_data[time]);
}