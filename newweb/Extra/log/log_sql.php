<?php
/*
功能扩展日志类

*/

class Sqlcontra{
	
	public function createTable()
    {
    	/*
		创建日志表
		*/
		include_once "../../model/conn.php";
		$obj = new Mysql;
		$mysql_conn = $obj->sucessConn();
		$log_sql ="CREATE TABLE IF NOT EXISTS `log` (
				  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引',
				  `ltime` date NOT NULL COMMENT '时间',
				  `ltitle` varchar(255) DEFAULT NULL COMMENT '标题',
				  `ltext` text COMMENT '内容',
				  PRIMARY KEY (`lid`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日志 表' AUTO_INCREMENT=1 ;";
		$log_res = mysql_query($log_sql,$mysql_conn);
		if(!$log_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		mysql_close($mysql_conn);
    	return true;
    }
	
	
	public function dropTable()
    {
    	/*
		删除日志表
		*/
		include_once "../../model/conn.php";
		$obj = new Mysql;
		$mysql_conn = $obj->sucessConn();
		$log_sql ="DROP TABLE `log`;";
		$log_res = mysql_query($log_sql,$mysql_conn);
		if(!$log_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		mysql_close($mysql_conn);
    	return true;
    }
	
	/*log表插入操作
	$ltitle:日志标题
	$ltime:上传时间
	$ltext:上传内容
	*/
	
	public function log_insert($ltitle,$ltime,$ltext){
		include_once $_SERVER['DOCUMENT_ROOT'].'/model/conn.php';
		$obj = new Mysql;
		$mysql_conn = $obj->sucessConn();
		$str = "INSERT INTO `log` (`ltime`, `ltitle`, `ltext`) VALUES ('".$ltime."', '".$ltitle."', '".$ltext."');";
		$re = mysql_query($str,$mysql_conn);
        if (!$re) {
		    die("couldn't get the log tables res:\n" . mysql_error());
		}
		mysql_close($mysql_conn);
		return $re;
	}
	
	/*log表修改操作
	$ltitle:日志标题
	$ltime:上传时间
	$ltext:上传内容
	$lid:编号
	*/
	public function log_update($lid, $ltitle, $ltime, $ltext){
		include_once $_SERVER['DOCUMENT_ROOT'].'/model/conn.php';
		$obj = new Mysql;
		$mysql_conn = $obj->sucessConn();
		$str = "UPDATE `log` SET `ltime` = '". $ltime."',
				`ltitle` = '".$ltitle."',
				`ltext` = '".$ltext."' WHERE `lid` =".$lid.";";
		$re = mysql_query($str,$mysql_conn);
        if (!$re) {
		    die("couldn't get the log tables res:\n" . mysql_error());
		}
		mysql_close($mysql_conn);
		return $re;
	}
	
	/*log表查询操作
	$ltime:上传时间
	*/
	public function log_select($ltime){
		include_once $_SERVER['DOCUMENT_ROOT'].'/model/conn.php';
		$obj = new Mysql;
		$mysql_conn = $obj->sucessConn();
		$str = "SELECT * FROM `log` WHERE ltime = '".$ltime."';";
		$re = mysql_query($str,$mysql_conn);
        if (!$re) {
		    die("couldn't get the log tables res:\n" . mysql_error());
		}
		$res_arr = array();
		while ($row = mysql_fetch_assoc($re,MYSQL_ASSOC))
		{
			array_push($res_arr, $row);
		}
		mysql_close($mysql_conn);
		return $res_arr;
	}
	
	/*log表查询最后n条操作
	$num：查询日志数目
	*/
	public function log_selectByNum($num){
		include_once $_SERVER['DOCUMENT_ROOT'].'/model/conn.php';
		$obj = new Mysql;
		$mysql_conn = $obj->sucessConn();
		$str = "SELECT * FROM `log` ORDER BY ltime DESC LIMIT ".$num.";";
		$re = mysql_query($str,$mysql_conn);
        if (!$re) {
		    die("couldn't get the log tables res:\n" . mysql_error());
		}
		$res_arr = array();
		while ($row = mysql_fetch_assoc($re,MYSQL_ASSOC))
		{
			array_push($res_arr, $row);
		}
		mysql_close($mysql_conn);
		return $res_arr;
	}
	
	/*log表删除操作
	$lid:编号
	*/
	public function log_delete($lid){
		include_once $_SERVER['DOCUMENT_ROOT'].'/model/conn.php';
		$obj = new Mysql;
		$mysql_conn = $obj->sucessConn();
		$str = " DELETE FROM `log` WHERE `lid` =".$lid;
		$re = mysql_query($str,$mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($mysql_conn);
		return $re;
	}
	
}
?>