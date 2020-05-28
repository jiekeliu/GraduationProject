<?php
header('content-type:text/html;charset=utf-8');

$fileInfo = $_FILES['myFile'];
$Sname = $fileInfo['name'];
$Ssize = $fileInfo['size'];
$Ftype = $fileInfo['type'];

require_once 'upload.php';
$path = $_SERVER['DOCUMENT_ROOT'].'/resourceLibrary';
$upload = new upload('myFile',$path);//(post上传文件名，相对于调用函数的存储位置)
$dest = $upload->uploadFile();
//地址重组
$arr = explode("/",$dest);
$Surl = $arr[count($arr)-2].'/'.$arr[count($arr)-1];

include_once "../../collection_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->resources_insert($Sname, $Surl, 'img_add', $Ftype, $Ssize);


if($Surl){
	exit(json_encode(array('code'=>1,'msg'=>$Surl)));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'上传失败')));
}

?>