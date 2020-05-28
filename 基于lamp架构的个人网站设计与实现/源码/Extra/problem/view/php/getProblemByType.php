<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$type = $_POST['type'];
if ($type== '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：不能匹配空字符串')));
}

include_once "../../problem_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->problem_selectByType($type);
$sql_res = json_encode($sql_res);
print_r($sql_res);
?>