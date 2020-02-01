$(document).ready(function(){ 
	getTranslationWord();
	getTranslationArticle();
	setAuthority();
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
	$("#div_content").children().remove();
	var str ="<table class='table table-hover table-bordered'>"
						+"<tr class='success'>"
							+"<th>原词</th>"
							+"<th>翻译</th>"
							+"<th></th>"
						+"</tr>";
	var cookie = getCookie('unameid');
	if (cookie) {	
		for (var i = 0; i < mat_data[time].length; i++) {
			str += "<tr>"
				+"<td>"+mat_data[time][i]['Wchinese']+"</td>"
				+"<td>"+mat_data[time][i]['Wenglish']+"</td>"
				+"<td style='width: 20%;'><button type='button' class='btn btn-warning btn-sm' onclick='delWord("+mat_data[time][i]['Wid']+")'>"
				+"我记住了</button></td>"
				+"</tr>";
		}	
	}else{
		for (var i = 0; i < mat_data[time].length; i++) {
			str += "<tr>"
				+"<td>"+mat_data[time][i]['Wchinese']+"</td>"
				+"<td>"+mat_data[time][i]['Wenglish']+"</td>"
				+"<td style='width: 20%;'>"
				+"<button type='button' class='btn btn-warning btn-sm' disabled='disabled'>"
				+"我记住了</button></td>"
				+"</tr>";
		}	
	}
	
	str += "</table>";
	$("#div_content").append(str);
}

//单词删除
function delWord(id){
	$.post("php/delWord.php", {Wid:id},function (data) {
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

//文档标题和编号获取
function getTranslationArticle(){
	$.post("php/getTranslationArticle.php",function (data) {
		var data = JSON.parse(data);
    	setArticleNav(data);
    });
}

//文档标题和编号获取通过模糊匹配
function getTranslationArticleByBlurry(){
	var str = $("#str").val();
	$.post("php/getTranslationArticleByBlurry.php", {str:str},function (data) {
		var data = JSON.parse(data);
    	setArticleNav(data);
    });
}

//文档标题和编号获取通过文章类型
function getTranslationArticleByType(){
	var C_type = $("#C_type").val();
	$.post("php/getTranslationArticleByType.php", {C_type:C_type},function (data) {
		var data = JSON.parse(data);
    	setArticleNav(data);
    });
}

//文档导航设置
function setArticleNav(data){
	$("#div_content").children().remove();
	var str = "";
	if(data.length == 0){
		str = "<p>没有搜索到相关内容哦</p>";
		$("#div_content").append(str);
		return;
	}
	str ="<table class='table table-hover'>";
	
	for (var i = 0; i < data.length; i++) {
		str += "<tr>"
			+"<td>"+data[i]['C_title']+"</td>"
			+"<td style='width: 20%;'>"+data[i]['C_type']+"</td>"
			+"<td style='width: 20%;'><button type='button' class='btn btn-warning btn-sm' onclick='getTranslationById("+data[i]['Cid']+")'>"
			+"查看全文</button></td>"
			+"</tr>";
	}			
	
	str += "</table>";
	$("#div_content").append(str);
}

//文档内容获取通过文章id
function getTranslationById(Cid){
	$.post("php/getTranslationById.php", {Cid:Cid},function (data) {
		var data = JSON.parse(data);
    	console.log(data);
    	setArticle(data);
    });
}

//文档内容填充
function setArticle(data){
	$("#div_content").children().remove();
	var str = "<div class='interpreter'>"
				+"<div class='ipt_title'>"+data[0]['C_title']+"</div>"
				+"<div class='ipt_txt'>"
					+"<p class='english'>"+data[0]['C_english']+"</p>"
					+"<p class='china'>"+data[0]['C_chinese']+"</p>"
					+"<p class='key_word'>"+data[0]['C_word']+"</p>"
				+"</div>"
			+"</div>";
	
	$("#div_content").append(str);
}

//cookic查询函数
function getCookie(name){
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return false;
}

function setAuthority(){
	var cookie = getCookie('unameid');
	var str = "";
	if (cookie) {
		str = "<option>只翻译不保存</option><option>翻译且保存</option>";
	} else{
		str = "<option>只翻译不保存</option>";
	}
	
	$("#pre_select").append(str);
}