<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

$Rid = $_POST['Rid'];
$Rtitile = $_POST['Rtitile'];
$Rimg_url = $_POST['Rimg_url'];
$Rinfo = $_POST['Rinfo'];
$Rtext = $_POST['Rtext'];
$Rauthor = $_POST['Rauthor'];
$Rtype = $_POST['Rtype'];
$Rtime = $_POST['Rtime'];

if ($Rid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：文章编号异常')));
}

if ($Rtitile == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：文章缺少标题')));
}

if ($Rtext == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：文章内容为空')));
}
	
if ($Rauthor == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：文章作者不详')));
}

if ($Rtype == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：文章类型不详')));
}

if ($Rtime == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：文章添加时间')));
}

include_once "../../results_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->results_update($Rid, $Rtitile, $Rinfo, $Rimg_url, $Rtext, $Rauthor, $Rtype, $Rtime);

if($sql_res){
	exit(json_encode(array('code'=>1,'msg'=>'修改成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'修改失败')));
}
?>