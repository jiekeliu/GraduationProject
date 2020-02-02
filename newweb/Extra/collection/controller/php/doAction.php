<?php
header('content-type:text/html;charset=utf-8');
$Stype = $_GET["Stype"];

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
//数据注入
include_once "../../collection_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->resources_insert($Sname, $Surl, $Stype, $Ftype, $Ssize);

//创建空的附加信息
$sql2 = new Sqlcontra;
$sql2_res =$sql2->resources_selecEnd();
$Epid = $sql2_res[0]['Sid'];
$sql3 = new Sqlcontra;
$sql3_res =$sql3->resources_add_insert($Epid);

if($sql_res && $sql3_res){
	exit(json_encode(array('code'=>1,'msg'=>'添加成功')));
}else{
	exit(json_encode(array('code'=>0,'msg'=>'添加失败')));
}

?>