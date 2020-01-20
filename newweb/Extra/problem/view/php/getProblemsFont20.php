<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
include_once "../../problem_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->problem_selectBynum(20);
$sql_res = json_encode($sql_res);
print_r($sql_res);
?>