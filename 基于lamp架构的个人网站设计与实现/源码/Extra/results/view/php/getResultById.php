<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");

$Rid = $_POST['Rid'];
if ($Rid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：编号异常')));
}

include_once "../../results_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->results_selectByid($Rid);

$sql_res[0]['Rtext'] = htmtocode($sql_res[0]['Rtext']);
$sql_res = json_encode($sql_res);
print_r($sql_res);

function htmtocode($content){ 
    $content = htmlspecialchars($content, ENT_QUOTES);
    $content = str_replace(" ", "&nbsp;", $content); 
    $content = str_replace("\n", "<br>",$content);    
    return $content; 
}
?>