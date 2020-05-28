<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

$C_type = $_POST['C_type'];
if ($C_type== '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：类型异常')));
}

include_once "../../translation_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->document_selectTitleByType($C_type);

$sql_res = json_encode($sql_res);
print_r($sql_res);
?>