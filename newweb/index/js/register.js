$(document).ready(function(){ 
	resetHeight();
});

//主体位置重置函数
function resetHeight(){
	var h = ($(document).height()-$('#con').height())/2;
	$('#con').css('margin-top',h);
}

//邮箱格式校验函数
function checkEmeail(email){
	var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/; //邮箱js正则
	if(reg.test(email)){
		return 1;
	}else{
		return 0;
	}
}


//用户添加函数
function addUser(){
	
	var uname = $('#auname').val();
	var upwd = $('#aupwd').val();
	var dell_aupwd = $('#dell_aupwd').val();
	if (uname == '') {
		alert("缺少用户名");
		return;
	}
	
	if (upwd != dell_aupwd) {
		alert("两次密码不一致");
		$('#aupwd').val("");
		$('#dell_aupwd').val("");
		return;
	}
	
	var uemail = $('#auemail').val();
	var chk_res = checkEmeail(uemail);
	if (!chk_res) {
		alert("邮箱表达式错误，请重新输入");
		$('#auemail').val("");
		return;
	} 
	
	var pre_data = {
		uname:uname,
		upwd:upwd,
		uemail:uemail,
		Agrede:3
	};
	console.log(pre_data);
	
	$.post("../../admin/controller/addUserInfo.php", pre_data, function (data) {
	  	console.log(data);
    	var res = JSON.parse(data);
    	if (res.code) {
    		alert(res.msg);
            setTimeout(function(){window.location.reload();},1000);
        }else{
            alert(res.msg);
        }
    });
}