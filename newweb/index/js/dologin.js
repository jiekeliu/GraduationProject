$(document).ready(function(){ 
	resetHeight();
	createVerificationCode();
});

//信息提交函数
$('#submit_btn').click(function () {
	var uname = $('#uname').val();
	var upwd = $('#upwd').val();
	if (uname == '') {
		alert('name not allow empty')
		return;
	}
	if (upwd == '') {
		alert('pwd not allow paraty')
		return;
	}
	
	var vcode = checkVerificationCode();
//	console.log(vcode);
	if (vcode) {
		  $.post("../controller/dologin.php", $('#form').serialize(),function (data) {
	    	var data = JSON.parse(data);
//	    	console.log(data);  
	    	if (data.code) {
	    		alert(data.msg);
	    		setTimeout(window.location.href ="../controller/checkCookie.php",1000);
	    	} else{
	    		alert(data.msg);
	    		createVerificationCode();
	    	}    
	    });
	} 
});
//主体位置重置函数
function resetHeight(){
	var h = ($(document).height()-$('#con').height())/2;
	$('#con').css('margin-top',h);
}
var code;  //全局验证码字符串
//随机验证码函数
function createVerificationCode(){
	code = '';//首先默认code为空字符串
	var codeLength = 4;//设置长度，这里看需求，我这里设置了4
	var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');//设置随机字符
	for(var i = 0; i < codeLength; i++){ //循环codeLength 我设置的4就是循环4次   
		var index = Math.floor(Math.random()*36); //设置随机数范围,这设置为0 ~ 36  
		code += random[index];  //字符串拼接 将每次随机的字符 进行拼接	
	}
	$('#showVerificationCode').html(code);
}
//刷新验证码函数
$('#refresh').click(function () {
	createVerificationCode();			
});

//验证码验证函数
function checkVerificationCode(){
	var oValue = $("#verificationCode").val().toUpperCase();
	if(oValue ==""){
		alert('请输入验证码');
		return 0;
	}else if(oValue != code){
		alert('验证码不正确，请重新输入');
		oValue = "";
		$("#verificationCode").val('');
		createVerificationCode();
		return 0;
	}else{
		return 1;
	}
}
//找回密码
function getUserinfoByUemail(){
	var uemail = $('#uemail').val();
	var chk_res = checkEmeail(uemail);
	if (!chk_res) {
		alert("邮箱表达式错误，请重新输入");
		$('#uemail').val("");
		return;
	} 
	
	$.post("../controller/getUserinfoByUemail.php", $('#emailform').serialize(),function (data) {
	    	var data = JSON.parse(data);
	    	console.log(data);  
	    	if (data.code) {
				var msg = JSON.parse(data.msg);
				alert("用户 '"+msg['uname']+"' 的密码为："+msg['upwd']+", 请尽快更新密码，防止泄露");
				window.location.reload();
	    	} else{
	    		alert(data.msg);
	    	}    
	    });
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