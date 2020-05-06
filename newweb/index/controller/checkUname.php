<?php
header('Content-Type:text/html;Charset=utf-8');
$uname = $_POST['uname'];
if ($uname == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：用户名不能为空')));
}

$uemail = $_POST['uemail'];
if ($uemail == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：邮箱不能为空')));
}


include_once "../../model/sqlfunctions.php";
//用户检测
$fun = new connFun;
$act_res =$fun->act_queryByName($uname);
if (count($act_res) != 0) {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：该用户已存在')));
}
//邮箱检测
$fun2 = new connFun;
$act2_res =$fun2->act_queryByEmail($uemail);
if (count($act2_res) == 0) {
	ob_clean();
	exit(json_encode(array('code'=>1,'msg'=>'后台提示：检测成功')));
}else{
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：邮箱已存在')));
}
?>