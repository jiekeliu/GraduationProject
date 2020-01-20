$(document).ready(function(){ 
	getProblem();
});

var res_data;   //所有返回数据
var maxpage = 0;   //最大页数

function getProblem(){
	$.post("php/getProblems.php",function (data) {
    	var data = JSON.parse(data);
		$.each(data,function(key,value){  //遍历键值对
           $('#pageli').before("<li><a href='javascript:;' onclick='setData("+key+");'>"+key+"</a></li>");
           maxpage++;
		})
		for (var i = 0; i < data[1].length ; i++) {
			var str ="<tr>"
		  		+"<td>"+data[1][i].Pid+"</td>"
		  		+"<td>"+data[1][i].Ptext+"</td>"
		  		+"<td>"+data[1][i].Ptime+"</td>"
		  		+"<td>"+data[1][i].Ptype+"</td>"
		  		+"<td>"+data[1][i].Pstatus+"</td>"
		  		+"<th><button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#answerModel2' onclick='setAddAnswer("+data[1][i].Pid+")'>我要回答</button></th>"
		  		+"<th><button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#answerModel' onclick='getAnswerByPid("+data[1][i].Pid+")'>答案列表</button></th>"
		  		+"<th><button type='button' class='btn btn-sm btn-info' data-toggle='modal' data-target='#changeModal' onclick='changeProblems("+data[1][i].Pid+")'>修改</button></th>"
	  			+"<th><button type='button' class='btn btn-sm btn-warning' data-toggle='modal' data-target='.bs-example-modal-sm' onclick='setProblemid("+data[1][i].Pid+")'>删除</button></th>"
		  		+"</tr>";
			$('#itable').append(str);
		}
     	res_data = data;
    });
}

function setData(page){
	//console.log(res_data);
	$("#itable").find("tr").not(":first").remove();
	for (var i = 0; i < res_data[page].length ; i++) {
		var str ="<tr>"
	  		+"<td>"+res_data[page][i].Pid+"</td>"
		  	+"<td>"+res_data[page][i].Ptext+"</td>"
		  	+"<td>"+res_data[page][i].Ptime+"</td>"
		  	+"<td>"+res_data[page][i].Ptype+"</td>"
		  	+"<td>"+res_data[page][i].Pstatus+"</td>"
		  	+"<th><button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#answerModel2' onclick='setAddAnswer("+res_data[page][i].Pid+")'>我要回答</button></th>"
		  	+"<th><button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#answerModel' onclick='getAnswerByPid("+res_data[page][i].Pid+")'>答案列表</button></th>"
	  		+"<th><button type='button' class='btn btn-sm btn-info' data-toggle='modal' data-target='#changeModal' onclick='changeProblems("+res_data[page][i].Pid+")'>修改</button></th>"
	  		+"<th><button type='button' class='btn btn-sm btn-warning' data-toggle='modal' data-target='.bs-example-modal-sm' onclick='setProblemid("+res_data[page][i].Pid+")'>删除</button></th>"
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
			setData(page+1);
		}
	} else{
		if (page-1 < 1) {
			alert('已达最小页');
		} else{
			setData(page-1);
		}
	}
}

//功能添加函数
function addProblem(){
	$.post("php/addproblems.php", $('#addform').serialize(),function (data) {
//	  	console.log(data);
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
           window.location.reload();
        }else{
            alert(res.msg);
        }
    });
}

//修改模态框查询函数
function changeProblems(id){
	var apage =parseInt($("#hiddenpage").html());
	arr = [];
	for (var i = 0; i < res_data[apage].length ; i++) {
		var Pid = parseInt(res_data[apage][i].Pid);
		if (Pid == id) {
			arr = res_data[apage][i];
		}
	}
	$("#cPid").val(arr['Pid']);
	$("#cPtext").val(arr['Ptext']);
	$("#cPtime").val(arr['Ptime']);
	$("#cPstatus").val(arr['Pstatus']);
	$("#cPtype option").each(function(){  //遍历所有option  
          var channlVal= $(this).val();   //获取option值   
          if(channlVal == arr['Ptype']){  
              $(this).attr('selected', 'selected');
          }  
    }); 
}

//问题确认修改函数
function changeProblemDeed(){
	$.post("php/updateProblems.php", $('#changeform').serialize(),function (data) {
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
            window.location.reload();
        }else{
            alert(res.msg);
        }
    });
}

//用户id设置函数
function setProblemid(id){
	$("#duid").html(id);
}

function delProblem(){
	var Pid = $("#duid").html();
	$.post("php/delectProblems.php",{Pid:Pid},function (data) {
//	  	console.log(data);
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
            window.location.reload();
        }else{
            alert(res.msg);
        }
    });
}

// 问题列表获取
function getAnswerByPid(Pid){
	var ans_data;
	$.post("php/getAnswer.php", {Pid:Pid},function (data) {
    	ans_data = JSON.parse(data);
    	setAnswer(Pid, ans_data);
   });
}

// 问题列表设置
function setAnswer(Pid, ans_data){
	ProblemId = Pid;
	var apage =parseInt($("#hiddenpage").html());
	arr = [];
	for (var i = 0; i < res_data[apage].length ; i++) {
		var id = parseInt(res_data[apage][i].Pid);
		if (id == Pid) {
			arr = res_data[apage][i];
		}
	}
	$("#answerlist").html(arr['Ptext']);
	$("#anslistbody").children().remove();
	if (ans_data.length > 0) {
		for (var i = 0; i < ans_data.length ; i++) {
			var list_str ="<div class='row' style='margin: 20px 0px;'>"
								+"<p id='hiddenAnswerId' hidden>"+ans_data[i]['Aid']+"</p>"
								+"<div class='col-md-2'>"
									+"<p style='text-align:center;'>"+ans_data[i]['Aperson']+"</p>"
								+"</div>"
								+"<div class='col-md-8'>"
									+"<textarea class='form-control' rows='4' id='Atext"+ans_data[i]['Aid']+"'>"+ans_data[i]['Atext']+"</textarea>"
								+"</div>"
								+"<div class='col-md-2'>"
									+"<div style='width: 100%; height: 10px;'></div>"
									+"<button type='button' class='btn btn-warning btn-block' onclick='updateAnswer("+ans_data[i]['Aid']+");'>修改</button>"
									+"<button type='button' class='btn btn-danger btn-block' onclick='delectAnswer("+ans_data[i]['Aid']+");'>删除</button>"
								+"</div>"
							+"</div>";
			$('#anslistbody').append(list_str);
		}
	} else{
		var error_str ="<h3>还没有答案哟</h3>";
		$('#anslistbody').append(error_str);
	}
	
}

var ProblemId = 0; //全局问题id

// 添加回答模态框设置
function setAddAnswer(Pid){
	ProblemId = Pid;
	$("#Atext").val('');
	var apage =parseInt($("#hiddenpage").html());
	arr = [];
	for (var i = 0; i < res_data[apage].length ; i++) {
		var id = parseInt(res_data[apage][i].Pid);
		if (id == Pid) {
			arr = res_data[apage][i];
		}
	}
	$("#answerlist2").html(arr['Ptext']);
}

// 添加答案
function addAnswer(){
	var Atext = $("#Atext").val();
	$.post("php/addAnswer.php", {Atext:Atext, Pid:ProblemId},function (data) {
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
            window.location.reload();
        }else{
            alert(res.msg);
        }
    });
}

// 修改答案
function updateAnswer(Aid){
	var Atext = $("#Atext"+Aid).val();
	$.post("php/updateAnswer.php", {Aid:Aid, Atext:Atext, Pid:ProblemId},function (data) {
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
            window.location.reload();
        }else{
            alert(res.msg);
        }
    });
}

// 修改答案
function delectAnswer(Aid){
	alert('你正在删除信息，请谨慎操作！！！');
	$.post("php/delectAnswer.php", {Aid:Aid},function (data) {
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
            window.location.reload();
        }else{
            alert(res.msg);
        }
    });
}

