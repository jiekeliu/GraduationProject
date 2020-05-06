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
    	$wordclub_sql ="CREATE TABLE IF NOT EXISTS `wordclub` (
					  `Wid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
					  `Wchinese` varchar(255) NOT NULL COMMENT '中文',
					  `Wenglish` varchar(255) NOT NULL COMMENT '英文',
					  `Wtime` date NOT NULL COMMENT '添加时间',
					  PRIMARY KEY (`Wid`)
					) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='词库' AUTO_INCREMENT=1 ;";
		$wordclub_res = mysql_query($wordclub_sql,$this->mysql_conn);
		if(!$wordclub_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		
		$document_sql ="CREATE TABLE IF NOT EXISTS `english_document` (
					  `Cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
					  `C_title` varchar(255) NOT NULL COMMENT '标题',
					  `C_chinese` text NOT NULL COMMENT '中文',
					  `C_english` text NOT NULL COMMENT '英文',
					  `C_word` text NOT NULL COMMENT '词组',
					  `C_time` date NOT NULL COMMENT '添加时间',
					  `C_person` varchar(255) NOT NULL COMMENT '翻译人',
					  `C_type` varchar(255) NOT NULL COMMENT '类型',
					  PRIMARY KEY (`Cid`)
					) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='英文翻译文档' AUTO_INCREMENT=1 ;";
		$document_res = mysql_query($document_sql,$this->mysql_conn);
		if(!$document_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		
		mysql_close($this->mysql_conn);
    	return true;
    }
	
	/*  ----------------------------------分割线--删除表----------------------------------------------------- */
	public function dropTable()
    {
    	$wordclub_sql ="DROP TABLE wordclub;";
		$wordclub_res = mysql_query($wordclub_sql,$this->mysql_conn);
		if(!$wordclub_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		
		$document_sql ="DROP TABLE english_document;";
		$document_res = mysql_query($document_sql,$this->mysql_conn);
		if(!$document_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		mysql_close($this->mysql_conn);
    	return true;
    }
	
	/*  ----------------------------------分割线--数据添加----------------------------------------------------- */
	/*wordclub表插入操作
	$Wchinese:英文
	$Wenglish:中文
	$Wtime:添加时间
	*/
	
	public function wordclub_insert($Wchinese,$Wenglish,$Wtime){
		$str = "INSERT INTO `wordclub` (`Wchinese`, `Wenglish`, `Wtime`) VALUES (
		'".$Wchinese."', '".$Wenglish."', '".$Wtime."');";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	
	/*english_document表插入操作
	$C_title:标题
	$C_chinese:中文
	$C_english:英文
	$C_word:词组
	$C_time:添加时间
	$C_person:翻译人
	$C_type:类型
	*/
	
	public function document_insert($C_title,$C_chinese,$C_english,$C_word,$C_time,$C_person,$C_type){
		$str = "INSERT INTO `english_document` 
		(`C_title`, `C_chinese`, `C_english`, `C_word`, `C_time`, `C_person`, `C_type`) 
		VALUES ('".$C_title."', '".$C_chinese."', '".$C_english."', '".$C_word."', 
		'".$C_time."', '".$C_person."', '".$C_type."');";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	/*  ----------------------------------分割线--数据更改----------------------------------------------------- */
	/*english_document表修改操作
	$C_title:标题
	$C_chinese:中文
	$C_english:英文
	$C_word:词组
	$C_time:添加时间
	$Cid:编号
	$C_type:类型
	*/
	public function document_update($C_title,$C_chinese,$C_english,$C_word,$C_time,$Cid,$C_type){
		$str = "UPDATE `english_document` SET `C_title` = '".$C_title."',
				`C_chinese` = '".$C_chinese."',
				`C_english` = '".$C_english."',
				`C_word` = '".$C_word."',
				`C_time` = '".$C_time."',
				`C_type` = '".$C_type."' WHERE `english_document`.`Cid` =".$Cid.";";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	
	/*  ----------------------------------分割线--数据查询----------------------------------------------------- */
	/*english_document表最近n条问题查询操作
	$num：条数
	*/
	public function document_selectBynum($num){
		$str = "SELECT *FROM `english_document` ORDER BY C_time DESC LIMIT ".$num;
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
	
	/*english_document表时间查询操作
	$C_time：时间
	*/
	public function document_selectBytime($C_time){
		$str = "SELECT * FROM `english_document` WHERE C_time = '".$C_time."';";
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
	
	/*english_document表标题和id查询操作
	*/
	public function document_selectAllTitle(){
		$str = "SELECT `Cid` , `C_title` , `C_type` FROM `english_document` ORDER BY C_time DESC LIMIT 0 , 30";
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
	
	/*english_document表标题和id查询操作通过模糊匹配
	 * $str：匹配语句
	*/
	public function document_selectTitleByBlurry($str){
		$str = "SELECT `Cid` , `C_title` , `C_type` FROM `english_document`
				WHERE `C_title` LIKE '%".$str."%'";
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
	
	/*english_document表标题和id查询操作通过类型
	 * $C_type：类型
	*/
	public function document_selectTitleByType($C_type){
		$str = "SELECT `Cid` , `C_title` , `C_type` FROM `english_document`
				WHERE `C_type` = '".$C_type."';";
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
	
	/*english_document表查询操作通过Cid
	 * $Cid：编号
	*/
	public function document_selectByCid($Cid){
		$str = "SELECT * FROM `english_document`
				WHERE `Cid` = ".$Cid;
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
	
	/*wordclub查询操作*/
	public function wordclub_selectAll(){
		$str = "SELECT * FROM `wordclub`;";
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
	
	/*english_document表删除操作
	$Cid：编号
	*/
	public function document_delect($Cid){
		$str = "DELETE FROM `english_document` WHERE Cid =".$Cid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	
	/*wordclub表删除操作
	$Wid：编号
	*/
	public function wordclub_delect($Wid){
		$str = "DELETE FROM `wordclub` WHERE Wid =".$Wid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
}
?>