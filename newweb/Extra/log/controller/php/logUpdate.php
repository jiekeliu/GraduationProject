<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$lid = $_POST['lid'];
$ltitle = $_POST['ltitle'];
$ltime = $_POST['ltime'];
$ltext = $_POST['ltext'];
if ($ltitle == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：日志标题不能为空')));
}
if ($lid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：lid异常')));
}
if ($ltime == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：日志时间不能为空')));
}
if ($ltext == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：日志内容不能为空')));
}

include_once "../../log_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->log_update($lid, $ltitle, $ltime, $ltext);
if($sql_res){
	exit(json_encode(array('code'=>1,'msg'=>'修改成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'修改失败')));
}


?>