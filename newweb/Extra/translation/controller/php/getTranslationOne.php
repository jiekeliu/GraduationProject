<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$C_time = $_POST['C_time'];

include_once "../../translation_sql.php";
$sql = new Sqlcontra;
if ($C_time) {
	$sql_res =$sql->document_selectBytime($C_time);
	$sql_res = json_encode($sql_res);
	print_r($sql_res);
}else{
	$sql_res =$sql->document_selectBynum(1);
	$sql_res = json_encode($sql_res);
	print_r($sql_res);
}
?>