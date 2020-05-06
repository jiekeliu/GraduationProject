<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

$str = $_POST['str'];
if ($str== '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：不能匹配空字符')));
}

include_once "../../translation_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->document_selectTitleByBlurry($str);

$sql_res = json_encode($sql_res);
print_r($sql_res);
?>