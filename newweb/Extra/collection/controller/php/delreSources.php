<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$Sid = $_POST['Sid'];
$Stype = $_POST['Stype'];
$Surl = $_POST['Surl'];

//资源文件删除
if($Surl != '' && $Surl != NULL){
	$path_Surl = $_SERVER['DOCUMENT_ROOT']."/".$Surl;
}
include_once "../../collection_sql.php";
if(file_exists($path_Surl)){
	$status=unlink($path_Surl);    
	if($status){  
		$sql = new Sqlcontra;
		$Surl_status =$sql->resources_delect($Sid);
		
		$Eurl_status = true;
		if($Stype != 'img_add'){
			$sql2 = new Sqlcontra;
			$Eurl_status =$sql2->resources_add_delect($Sid); 
		}  
	}else{  
		$Surl_status = false;
	}
}

if($Eurl_status && $Surl_status){
	exit(json_encode(array('code'=>1,'msg'=>'删除成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'删除失败')));
}
?>