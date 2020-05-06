<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

$Sid = $_POST['Sid'];
if ($Sid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：资源编号异常')));
}

include_once "../../collection_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->resources_add_selectByEpid($Sid);

$sql_res = json_encode($sql_res);
print_r($sql_res);
?>