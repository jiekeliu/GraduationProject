<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

include_once "../../collection_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->resources_selecAll();

$arr = [];
for($i=0; $i<count($sql_res);$i++ ){
	$j = (int)$i/10+1;
	$arr[$j][$i%10] = $sql_res[$i];
}
$arr = json_encode($arr);
//print_r($sql_res[0]);
print_r($arr);
?>