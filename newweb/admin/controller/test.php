<?php
header('Content-Type:text/html;Charset=utf-8');
include_once "../../model/extrafunction.php";
$obj = new AxtraFun();
$status = $obj->createMod('../../Extra/problem/controller/problem.html');
//$status = $obj->deleteMod('../../Extra/problem/controller/problem.html');
echo $status;
?>