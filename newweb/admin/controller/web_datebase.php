<?php
/*
网站基本信息录入和站长基本信息处理文件
*/
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$uname = $_POST['uname'];
$upwd = $_POST['upwd'];
$uemall = $_POST['uemall'];
$web_name = $_POST['web_name'];
if ($uname == '') {
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：用户名不能为空')));
}
if ($upwd == '') {
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：密码不能为空')));
}
if ($uemall == '') {
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：邮箱不能为空')));
}
if ($web_name == '') {
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：网站名称不能为空')));
}
$utime = date('Y-m-d', time());
include_once "../../model/sqlfunctions.php";
$fun = new connFun;
$act_res =$fun->act_insert($uname,$upwd,$utime,$uemall);
$fon_res =$fun->fontsetting_insert($web_name,' ',' ');
$fun_res1 = $fun->fun_insert(0,"用户管理","url",1);
$fun_res2 = $fun->fun_insert(0,"功能管理","url",1);
$fun_res3 = $fun->fun_insert(0,"网站管理","url",1);
$fun_res4 = $fun->fun_insert(0,"站长信息","url",1);
$stt_res = $fun->stationmaster_insert();
$aut_res = $fun->authority_insert(1, 1, '[0]');
//var_dump($aut_res);

if(act_res && $fon_res && fun_res1 && fun_res2 && fun_res3 && fun_res4 && $stt_res && $aut_res){
	ob_clean();
	exit(json_encode(array('code'=>1,'msg'=>'all ready')));
}else{
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'exists error')));
}


?>