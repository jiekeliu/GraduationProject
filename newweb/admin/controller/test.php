<?php
header('Content-Type:text/html;Charset=utf-8');
include_once "../../model/extrafunction.php";
$obj = new AxtraFun();
//$status = $obj->createMod('../../Extra/collection/controller/collection.html');
$status = $obj->deleteMod('../../Extra/collection/controller/collection.html');
echo $status;
?>