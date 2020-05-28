<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$Sid = $_POST['Sid'];
$Stype = $_POST['Stype'];
$Eurl = $_POST['Eurl'];
$Efake = $_POST['Efake'];
$Edescription = $_POST['Edescription'];
$Eextra = $_POST['Eextra'];

include_once "../../collection_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->resources_update($Stype, $Sid);

$sql2 = new Sqlcontra;
$sql2_res =$sql2->resources_add_update($Sid, $Eurl, $Edescription, $Efake, $Eextra);

if($sql_res && $sql2_res){
	exit(json_encode(array('code'=>1,'msg'=>'修改成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'修改失败')));
}
?>