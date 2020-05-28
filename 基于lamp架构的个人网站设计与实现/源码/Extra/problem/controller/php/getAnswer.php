<?php
header('Content-Type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");
$Pid = $_POST['Pid'];
if ($Pid == '') {
	ob_clean();
	exit(json_encode(array('code'=>0,'msg'=>'后台提示：问题编号异常')));
}

include_once "../../problem_sql.php";
$sql = new Sqlcontra;
$sql_res =$sql->answer_selectByPid($Pid );
$sql_res[0]['Atext'] = htmtocode($sql_res[0]['Atext']);
$sql_res = json_encode($sql_res);
print_r($sql_res);

function htmtocode($content){ 
    $content = htmlspecialchars($content, ENT_QUOTES);
    $content = str_replace(" ", "&nbsp;", $content); 
    $content = str_replace("\n", "<br>",$content);    
    return $content; 
}
?>