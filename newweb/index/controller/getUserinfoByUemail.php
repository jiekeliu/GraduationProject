<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

$uemail = $_POST['uemail'];
if ($uemail == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：邮箱不能为空')));
}


include_once "../../model/sqlfunctions.php";
$fun = new connFun;
$sql_res =$fun->act_queryByEmail($uemail);

if($sql_res){
	exit(json_encode(array('code'=>1,'msg'=>json_encode($sql_res->getAll()) )));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'查找无结果')));
}

?>