<?php
header('Content-Type:text/html;Charset=utf-8');
include_once "../../model/extrafunction.php";
$obj = new AxtraFun();
$status = $obj->createMod('../../Extra/results/controller/results.html');
//$status = $obj->deleteMod('../../Extra/results/controller/results.html');
echo $status;
?>