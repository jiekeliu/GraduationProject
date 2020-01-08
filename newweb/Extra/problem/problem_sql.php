<?php
/*
功能扩展类

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
	
	
	
}
?>