<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$Pid = $_POST['Pid'];
$Ptype = $_POST['Ptype'];
$Ptext = $_POST['Ptext'];
$Ptime = $_POST['Ptime'];
$Pstatus = $_POST['Pstatus'];
if ($Pid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：问题编号异常')));
}
if ($Ptype == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：类型异常')));
}
if ($Ptext == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：内容不能为空')));
}
if ($Ptime == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：提交时间异常')));
}
if ($Pstatus == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：状态异常')));
}
include_once "../../problem_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->problem_update($Pid, $Ptext, $Ptime, $Ptype, $Pstatus);
if($sql_res){
	exit(json_encode(array('code'=>1,'msg'=>'修改成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'修改失败')));
}


?>