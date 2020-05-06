<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$ltime = $_POST['ltime'];

include_once "../../log_sql.php";
$sql = new Sqlcontra;
if ($ltime) {
	$sql_res =$sql->log_select($ltime);
	for($i=0; $i<count($sql_res);$i++ ){
		$sql_res[$i]['ltext'] = htmtocode($sql_res[$i]['ltext']);
	}
	
	$sql_res = json_encode($sql_res);
	print_r($sql_res);
}else{
	$sql_res =$sql->log_selectByNum(20);
	for($i=0; $i<count($sql_res);$i++ ){
		$sql_res[$i]['ltext'] = htmtocode($sql_res[$i]['ltext']);
	}
	$sql_res = json_encode($sql_res);
	print_r($sql_res);
}

function htmtocode($content){ 
    $content = htmlspecialchars($content, ENT_QUOTES);
    $content = str_replace(" ", "&nbsp;", $content); 
    $content = str_replace("\n", "<br>",$content);    
    return $content; 
}

?>