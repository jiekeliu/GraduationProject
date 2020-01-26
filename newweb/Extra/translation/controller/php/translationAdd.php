<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$C_title = $_POST['C_title'];
$C_time = $_POST['C_time'];
$C_type = $_POST['C_type'];
$C_english = $_POST['C_english'];
$C_chinese = $_POST['C_chinese'];
$C_word = $_POST['C_word'];
if ($C_title == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：翻译标题不能为空')));
}
if ($C_time  == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：添加时间不能为空')));
}
if ($C_type == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：翻译类型不能为空')));
}

if ($C_english == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：英文不能为空')));
}
if ($C_chinese == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：中文不能为空')));
}
if ($C_word == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：词组不能为空')));
}

//用户查询
$uid = $_COOKIE["unameid"];
include_once $_SERVER['DOCUMENT_ROOT'].'/model/sqlfunctions.php';
$fun = new connFun;
$user = $fun->act_query($uid);
$C_person = $user->getUname();

include_once "../../translation_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->document_insert($C_title,$C_chinese,$C_english,$C_word,$C_time,$C_person,$C_type);
if($sql_res){
	exit(json_encode(array('code'=>1,'msg'=>'添加成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'添加失败')));
}


?>