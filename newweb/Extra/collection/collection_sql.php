<?php
/*
功能扩展类

*/
class Sqlcontra{
	private $mysql_conn;
	 public function __construct(){
		include_once $_SERVER['DOCUMENT_ROOT'].'/model/conn.php';
		$obj = new Mysql;
		if(Class_exists("Mysql")){   //检测数据库链接类是否存在
			if(!is_object($obj))
				throw new Exception("obj isnot object");
		}else{
			throw new Exception("class is not exists");
		}
		$this->mysql_conn = $obj->sucessConn();
	}
	
	public function getRes(){
		return $this->mysql_conn;
	}
	/*  ----------------------------------分割线--创建表----------------------------------------------------- */
	
	public function createTable()
    {
    	$wordclub_sql ="CREATE TABLE IF NOT EXISTS `resources` (
					  `Sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
					  `Sname` varchar(255) NOT NULL COMMENT '名称',
					  `Surl` varchar(255) NOT NULL COMMENT '地址',
					  `Stype` varchar(255) NOT NULL COMMENT '资源类型',
					  `Ftype` varchar(255) NOT NULL COMMENT '文件分类',
					  `Ssize` int(11) NOT NULL COMMENT '文件大小',
					  PRIMARY KEY (`Sid`)
					) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表' AUTO_INCREMENT=1 ;";
		$wordclub_res = mysql_query($wordclub_sql,$this->mysql_conn);
		if(!$wordclub_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		mysql_close($this->mysql_conn);
    	return true;
    }
	
	/*  ----------------------------------分割线--删除表----------------------------------------------------- */
	public function dropTable()
    {
    	$wordclub_sql ="DROP TABLE resources;";
		$wordclub_res = mysql_query($wordclub_sql,$this->mysql_conn);
		if(!$wordclub_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		mysql_close($this->mysql_conn);
    	return true;
    }
	
	/*  ----------------------------------分割线--数据添加----------------------------------------------------- */
	/*resources表插入操作
	$Sname：名称
	$Surl：存储地址
	$Stype：资源类型
	$Ftype：文件类型
	$Ssize：文件大小
	*/
	
	public function resources_insert($Sname, $Surl, $Stype, $Ftype, $Ssize){
		$str = "INSERT INTO `resources` (`Sname`, `Surl`, `Stype`, `Ftype`, `Ssize`) VALUES (
		'".$Sname."', '".$Surl."', '".$Stype."', '".$Ftype."', ".$Ssize.");";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	/*  ----------------------------------分割线--数据更改----------------------------------------------------- */
	/*resources表最近n条问题查询操作
	$num：条数
	*/
	public function resources_selectBynum($num){
		$str = "SELECT *FROM `resources` LIMIT ".$num;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		$res_arr = array();
		while ($row = mysql_fetch_assoc($re,MYSQL_ASSOC))
		{
			array_push($res_arr, $row);
		}
		mysql_close($this->mysql_conn);
		return $res_arr;
	}
	
	/*resources表查询操作by Sid
	$Sid：资源编号
	*/
	public function resources_selectBySid($Sid){
		$str = "SELECT *FROM `resources` WHERE Sid = ".$Sid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		$res_arr = array();
		while ($row = mysql_fetch_assoc($re,MYSQL_ASSOC))
		{
			array_push($res_arr, $row);
		}
		mysql_close($this->mysql_conn);
		return $res_arr;
	}
	
	/*resources表全部查询操作
	*/
	public function resources_selecAll(){
		$str = "SELECT *FROM `resources`; ";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		$res_arr = array();
		while ($row = mysql_fetch_assoc($re,MYSQL_ASSOC))
		{
			array_push($res_arr, $row);
		}
		mysql_close($this->mysql_conn);
		return $res_arr;
	}
	/*  ----------------------------------分割线--数据查询----------------------------------------------------- */
	
	/*  ----------------------------------分割线--数据删除----------------------------------------------------- */
	
}	
?>