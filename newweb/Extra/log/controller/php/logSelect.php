<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$ltime = $_POST['ltime'];

include_once "../../log_sql.php";
$sql = new Sqlcontra;
if ($ltime) {
	$sql_res =$sql->log_select($ltime);
	$sql_res = json_encode($sql_res);
	print_r($sql_res);
}else{
	$sql_res =$sql->log_selectByNum(1);
	$sql_res = json_encode($sql_res);
	print_r($sql_res);
}
?>