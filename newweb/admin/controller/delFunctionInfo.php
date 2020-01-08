<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$fid = $_POST['fid'];
if ($fid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：功能编号不能为空')));
}
include_once "../../model/sqlfunctions.php";
//数据库删除
$fun4 = new connFun;
$fun4_res =$fun4->fun_queryByfid($fid);
$furl = $fun4_res[0]['furl'];
include_once "../../model/extrafunction.php";
$obj = new AxtraFun();
$status = $obj->deleteMod($furl);
//功能删除
$fun = new connFun;
$fun_res =$fun->fun_delete($fid);
//权限更改
$fun2 = new connFun;
$fun_res2 =$fun2->fun_queryAll();
$Fid_having ='';
for($i=0; $i<count($fun_res2);$i++ ){
	$strnum = strval($fun_res2[$i]['fid']);
	$Fid_having .= $strnum.'|';
}
$Fid_having = substr($Fid_having, 0, -1);
$fun3 = new connFun;
$aut_res =$fun3->authority_update(1, 1, $Fid_having);

if($fun_res && $aut_res && $status){
	exit(json_encode(array('code'=>1,'msg'=>'删除成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'删除失败')));
}
?>