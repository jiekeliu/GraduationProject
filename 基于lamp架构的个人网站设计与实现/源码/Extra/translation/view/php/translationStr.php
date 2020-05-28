<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

$pre_str = $_POST['pre_str'];
$pre_select = $_POST['pre_select'];
$type = $_POST['type'];
if ($pre_str == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：翻译内容为空')));
}
if ($pre_select == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：储存选择异常')));
}
if ($type == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：翻译类型异常')));
}

include_once "translation.php";
$tra = new Translation;

$Wenglish = $tra->gtranslate($pre_str,$type);
$Wtime = date('Y-m-d', time());
if($pre_select == '翻译且保存'){
	include_once "../../translation_sql.php";
	$sql = new Sqlcontra;
	$save_res = $sql->wordclub_insert($pre_str, $Wenglish, $Wtime);
	if($save_res){
		exit(json_encode(array('code'=>1,'msg'=>$Wenglish)));
	}else{
		exit(json_encode(array('code'=>0,'msg'=>'存储异常')));
	}
}else{
	exit(json_encode(array('code'=>1,'msg'=>$Wenglish)));
}




?>