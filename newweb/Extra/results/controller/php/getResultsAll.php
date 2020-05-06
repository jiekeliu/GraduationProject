<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
	
include_once "../../results_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->results_selecAll();

$arr = [];
for($i=0; $i<count($sql_res);$i++ ){
	$j = (int)$i/10+1;
	$arr[$j][$i%10] = $sql_res[$i];
}
$arr = json_encode($arr);
print_r($arr);
?>