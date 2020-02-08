$(document).ready(function(){ 
	getProblems();
});

//获取最近20条
function getProblems(){
	$.post("php/getProblemsFont20.php", function (data) {
    	var data = JSON.parse(data);
    	setContent(data);
    });
}

// 类型匹配
function getProblemByType(type){
	$.post("php/getProblemByType.php", {type:type}, function (data) {
    	var data = JSON.parse(data);
    	setContent(data);
    });
}

//模糊搜索
function getProblemByStr(){
	var str = $("#modalProblem").val();
	$.post("php/getProblemByStr.php", {str:str}, function (data) {
    	var data = JSON.parse(data);
    	setContent(data);
    });
}

var res_dataForProblem; //全局问题数据
//问题内容设置函数
function setContent(data){
	res_dataForProblem = data;
	$("#listProblems").children().remove();
	if (data.length > 0) {
		for (var i = 0; i < data.length ; i++) {
			str = "<div class='row'>"
						+"<div class='col-xs-12 col-md-12'>"
							+"<div class='content'>"
								+"<div class='content_top'>"
									+"<div class='content_img'>"
										+"<img src='img/timg.jpg' alt='' class='img-circle'>"
									+"</div>"
									+"<div class='content_title'>"
									  	+"<h3>"+data[i]['Ptext']+"</h3>"
									  	+"<hr />"
									  	+"<span class='label label-success'>"+data[i]['Ptime']+"</span>"
									  	+"<span class='label label-warning'>"+data[i]['Ptype']+"</span>"
									+"</div>"
									+"<p style='text-align: center;' onclick='getAnswerByPid("+data[i]['Pid']+");'>"
									+"<a role='button' data-toggle='collapse' href='#problem"+data[i]['Pid']+"' aria-expanded='false' aria-controls='collapseExample'>"
							  			+"我是答案，点我"
									+"</a></p>"
									+"<div class='collapse' id='problem"+data[i]['Pid']+"'>"
									  +"<div class='well' id='answer"+data[i]['Pid']+"'>"
									  +"</div>"
									+"</div>"
									
								+"</div>"
							+"</div>"
						+"</div>"
					+"</div>";
			$('#listProblems').append(str);
		}
	} else{
		var	str = "<h3>啊，没有搜索到相关结果哦</h3>";
		$('#listProblems').append(str);
	}
	
}

function getAnswerByPid(Pid){
	ProblemId = Pid;
	var ans_data;
	$.post("../controller/php/getAnswer.php", {Pid:Pid},function (data) {
    	ans_data = JSON.parse(data);
    	setAnswerContent(ans_data,Pid);
   });
}

//答案内容设置函数
function setAnswerContent(data, Pid){
		var answerContent = $('#answer'+Pid);
		answerContent.children().remove();
		if (data.length > 0) {
			for (var i = 0; i < data.length ; i++) {
		    var	str = "<div class='row'>"
						+"<div class='col-xs-12 col-md-12'>"
							+"<div class='answerContent'>"
								+"<div class='content_top'>"
									+"<div class='content_img'>"
										+"<img src='img/omg1.jpg' alt='' class='img-circle'>"
									+"</div>"
									+"<div class='answer_title'>"
									  	+data[i]['Atext']
									  	+"<hr />"
									  	+"<span class='label label-success'>"+data[i]['Atime']+"</span>"
									  	+"<span class='label label-warning'>"+data[i]['Aperson']+"</span>"
									+"</div>"
								+"</div>"
							+"</div>"
						+"</div>"
					+"</div>"
					+"<div style='height: 20px; width: 100%;'></div>";
				var cookie = getCookie('unameid');
				if (cookie) {
					str +="<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#answerModel2' onclick='setAddProblem("+Pid+");'>我要回答</button>";
				}
				answerContent.append(str);
			}
		} else{
			var	str = "";
			var cookie = getCookie('unameid');
			if (cookie) {
				str = "<h3>还没有答案哟</h3>"
					+"<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#answerModel2' onclick='setAddProblem("+Pid+");'>我要回答</button>";
			} else{
				str = "<h3>还没有答案哟</h3>";
			}
			answerContent.append(str);
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

var ProblemId = 0; //全局问题id

function setAddProblem(pid){
	$.each(res_dataForProblem,function(index,value){
		if(value['Pid'] == pid){
			$("#answerlist2").html(value['Ptext']);
		}
	});
}

// 添加答案
function addAnswer(){
	var Atext = $("#Atext").val();
	$.post("../controller/php/addAnswer.php", {Atext:Atext, Pid:ProblemId},function (data) {
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
            window.location.reload();
        }else{
            alert(res.msg);
        }
    });
}