<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

include_once "../../collection_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->resources_selecAll();
$sql_res = json_encode($sql_res);
print_r($sql_res);
?>