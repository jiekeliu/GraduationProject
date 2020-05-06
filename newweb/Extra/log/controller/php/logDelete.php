<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$lid = $_POST['lid'];
if ($lid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：lid异常')));
}
include_once "../../log_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->log_delete($lid);
if($sql_res){
	exit(json_encode(array('code'=>1,'msg'=>'删除成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'删除失败')));
}


?>