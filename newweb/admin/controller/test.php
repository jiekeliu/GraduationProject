<?php
header('Content-Type:text/html;Charset=utf-8');
include_once "../../model/extrafunction.php";
$obj = new AxtraFun();
$status = $obj->createMod('../../Extra/translation/controller/translation.html');
//$status = $obj->deleteMod('../../Extra/translation/controller/translation.html');
echo $status;
?>