<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

$Cid = $_POST['Cid'];
if ($Cid== '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：Cid异常')));
}

include_once "../../translation_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->document_selectByCid($Cid);

$sql_res = json_encode($sql_res);
print_r($sql_res);
?>