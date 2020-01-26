<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$Atext = $_POST['Atext'];
$Pid = $_POST['Pid'];
if ($Atext == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：内容不能为空')));
}
if ($Pid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：问题编号异常')));
}
$Atime = date('Y-m-d', time());
//用户查询
$uid = $_COOKIE["unameid"];
include_once $_SERVER['DOCUMENT_ROOT'].'/model/sqlfunctions.php';
$fun = new connFun;
$user = $fun->act_query($uid);
$Aperson = $user->getUname();

//问题插入
include_once "../../problem_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->answer_insert($Pid,$Atext,$Aperson,$Atime);
if($sql_res){
	exit(json_encode(array('code'=>1,'msg'=>'添加成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'添加失败')));
}
?>