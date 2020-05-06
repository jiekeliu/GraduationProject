<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$Pid = $_POST['Pid'];
if ($Pid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：编号异常')));
}
include_once "../../problem_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->problem_delect($Pid);
//删除相关联的答案
$sql_ans = new Sqlcontra;
$ans_res =$sql_ans->answer_delectByPid($Pid);
if($sql_res && $ans_res){
	exit(json_encode(array('code'=>1,'msg'=>'删除成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'删除失败')));
}

?>