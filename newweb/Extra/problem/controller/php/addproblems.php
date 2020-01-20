<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$Ptext = $_POST['Ptext'];
$Ptype = $_POST['Ptype'];
if ($Ptext == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：内容不能为空')));
}
if ($Ptype == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：类型异常')));
}
$Ptime = date('Y-m-d', time());

include_once "../../problem_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->problem_insert($Ptext,$Ptime, $Ptype);
//$sql_res =$sql->problem_update(3,'我yaozuoshme','2020/1/16','python',0);
//$sql_res =$sql->problem_delect(4);
//$sql_res =$sql->problem_selectBynum(2);
//$sql_res =$sql-> problem_selectBystr('我');
//$sql_res =$sql->problem_selectAll();
if($sql_res){
	exit(json_encode(array('code'=>1,'msg'=>'添加成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'添加失败')));
}

?>