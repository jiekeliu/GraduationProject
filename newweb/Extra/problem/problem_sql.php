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
    	$problem_sql ="CREATE TABLE IF NOT EXISTS `problems` (
					  `Pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
					  `Ptext` text NOT NULL COMMENT '内容',
					  `Ptime` date NOT NULL COMMENT '提问时间',
					  `Ptype` varchar(255) NOT NULL COMMENT '问题类别',
					  `Pstatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1-未解决，0-解决',
					  PRIMARY KEY (`Pid`)
					) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题表' AUTO_INCREMENT=1 ;";
		$problem_res = mysql_query($problem_sql,$this->mysql_conn);
		if(!$problem_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		
		$answer_sql ="CREATE TABLE IF NOT EXISTS `answer` (
					  `Aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
					  `pid` int(11) NOT NULL COMMENT '问题编号',
					  `Atext` text NOT NULL COMMENT '内容',
					  `Aperson` varchar(255) NOT NULL COMMENT '回答人',
					  `Atime` date NOT NULL COMMENT '回答时间',
					  PRIMARY KEY (`Aid`)
					) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='答案表' AUTO_INCREMENT=1 ;";
		$answer_res = mysql_query($answer_sql,$this->mysql_conn);
		if(!$answer_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		
		mysql_close($this->mysql_conn);
    	return true;
    }
	
	/*  ----------------------------------分割线--删除表----------------------------------------------------- */
	public function dropTable()
    {
    	$problem_sql ="DROP TABLE problems;";
		$problem_res = mysql_query($problem_sql,$this->mysql_conn);
		if(!$problem_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		
		$answer_sql ="DROP TABLE answer;";
		$answer_res = mysql_query($answer_sql,$this->mysql_conn);
		if(!$answer_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		mysql_close($this->mysql_conn);
    	return true;
    }
	
	/*  ----------------------------------分割线--数据添加----------------------------------------------------- */
	/*problem表插入操作
	$Ptext:内容
	$Ptime:提问时间
	$Ptype:问题类型
	*/
	
	public function problem_insert($Ptext,$Ptime,$Ptype){
		$str = "INSERT INTO `problems` (`Ptext`, `Ptime`, `Ptype`) VALUES (
		'".$Ptext."', '".$Ptime."', '".$Ptype."');";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	
	/*answer表插入操作
	$Atext:内容
	$pid：问题编号
	$Atime:提问时间
	$$Aperson:回答人
	*/
	
	public function answer_insert($pid,$Atext,$Aperson,$Atime){
		$str = "INSERT INTO `answer` (`pid`, `Atext`, `Aperson`, `Atime`) 
		VALUES ('".$pid."', '".$Atext."', '".$Aperson."', '".$Atime."');";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	/*  ----------------------------------分割线--数据更改----------------------------------------------------- */
	/*problem表更改操作
	$Ptext:内容
	$pid:编号
	$Ptime:提问时间
	$Pstatus：状态
	$Ptype:问题类型
	*/
	public function problem_update($Pid,$Ptext,$Ptime,$Ptype,$Pstatus){
		$str = "UPDATE `problems` SET `Ptext` = '".$Ptext."',
				`Ptime` = '".$Ptime."',
				`Ptype` = '".$Ptype."',
				`pstatus` = '".$Pstatus."' WHERE `problems`.`Pid` =".$Pid.";";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	
	/*answer表更改操作
	$Atext:内容
	$Aid:编号
	$pid：问题编号
	$Atime:提问时间
	$$Aperson:回答人
	*/
	
	public function answer_update($Aid,$pid,$Atext,$Aperson,$Atime){
		$str = "UPDATE `answer` SET `pid` = '".$pid."',
				`Atext` = '".$Atext."',
				`Aperson` = '".$Aperson."',
				`Atime` = '".$Atime."' WHERE `answer`.`Aid` =".$Aid.";";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	
	/*  ----------------------------------分割线--数据查询----------------------------------------------------- */
	/*problem表最近n条问题查询操作
	$num：问题条数
	*/
	public function problem_selectBynum($num){
		$str = "SELECT *FROM `problems` ORDER BY Ptime DESC LIMIT ".$num;
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
	
	/*problem表模糊匹配内容查询操作
	$str：需要匹配的内容
	*/
	public function problem_selectBystr($str){
		$str = "SELECT * FROM `problems` WHERE Ptext LIKE '%".$str."%' LIMIT 0 , 30;";
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
	
	/*problem表类型匹配内容查询操作
	$type：需要匹配的类型
	*/
	public function problem_selectByType($type){
		$str = "SELECT * FROM `problems` WHERE Ptype = '".$type."' LIMIT 0 , 30;";
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
	
	/*problem表所有内容内容查询操作
	*/
	public function problem_selectAll(){
		$str = "SELECT * FROM `problems`;";
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
	
	/*answer表所有内容内容查询操作
	*/
	public function answer_selectByPid($pid){
		$str = "SELECT * FROM `answer` WHERE pid =".$pid." LIMIT 0 , 30";
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
	
	/*  ----------------------------------分割线--数据删除----------------------------------------------------- */
	
	/*problem表删除操作
	$Pid：编号
	*/
	public function problem_delect($Pid){
		$str = "DELETE FROM `problems` WHERE Pid =".$Pid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	
	/*answer表删除操作
	$Aid：编号
	*/
	public function answer_delect($Aid){
		$str = "DELETE FROM `answer` WHERE Aid =".$Aid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	
	/*answer表删除操作
	$Pid：问题编号
	*/
	public function answer_delectByPid($Pid){
		$str = "DELETE FROM `answer` WHERE Pid =".$Pid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
}
?>