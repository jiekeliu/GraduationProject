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
    	$results_sql ="CREATE TABLE IF NOT EXISTS `results` (
						  `Rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
						  `Rtitile` varchar(255) NOT NULL COMMENT '标题',
						  `Rinfo` text NOT NULL COMMENT '简介',
						  `Rimg_url` varchar(255) NOT NULL COMMENT '附加图地址',
						  `Rtext` text NOT NULL COMMENT '内容',
						  `Rauthor` varchar(255) NOT NULL COMMENT '作者',
						  `Rtype` varchar(255) NOT NULL COMMENT '类型',
						  `Rtime` date NOT NULL COMMENT '添加时间',
						  PRIMARY KEY (`Rid`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='成果表' AUTO_INCREMENT=1 ;";
		$results_res = mysql_query($results_sql,$this->mysql_conn);
		if(!$results_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		
		mysql_close($this->mysql_conn);
    	return true;
    }
	
	/*  ----------------------------------分割线--删除表----------------------------------------------------- */
	public function dropTable()
    {
    	$results_sql ="DROP TABLE results;";
		$results_res = mysql_query($results_sql,$this->mysql_conn);
		if(!$results_res){
			die(json_encode(array('code'=>0,'msg'=>'couldn not get the res:'.mysql_error())));
		}
		
		mysql_close($this->mysql_conn);
    	return true;
    }
	
	/*  ----------------------------------分割线--数据添加----------------------------------------------------- */
	/*results表插入操作
	$Rtitile:标题
	$Rinfo: 简介
	$Rimg_url:附加图地址
	$Rtext:内容
	$Rauthor:作者
	$Rtype:类型
	$Rtime:添加时间
	*/
	
	public function results_insert($Rtitile, $Rinfo, $Rimg_url, $Rtext, $Rauthor, $Rtype, $Rtime){
		$str = "INSERT INTO `results` (`Rtitile`, `Rinfo`, `Rimg_url`, `Rtext`, `Rauthor`, `Rtype`, `Rtime`) 
		VALUES ('".$Rtitile."', '".$Rinfo."', '".$Rimg_url."', '".$Rtext."', '".$Rauthor."', '".$Rtype."', '".$Rtime."');";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	/*  ----------------------------------分割线--数据查询----------------------------------------------------- */
	/*results表全部查询操作
	*/
	public function results_selecAll(){
		$str = "SELECT * FROM `results` ORDER BY `Rid` DESC; ";
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
	
	/*results表查询操作by Rid
	*/
	public function results_selectByid($Rid){
		$str = "SELECT * FROM `results` WHERE Rid = ".$Rid;
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
	
	/*results表 部分查询操作
	*/
	public function results_selectAllIntro(){
		$str = "SELECT `Rid` , `Rtitile` , `Rinfo` , `Rimg_url` , `Rauthor` , `Rtype` , `Rtime` FROM `results`";
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
	/*  ----------------------------------分割线--数据更改----------------------------------------------------- */
	/*results表类型更改操作
	$Rtitile:标题
	$Rid：编号
	$Rinfo: 简介
	$Rimg_url:附加图地址
	$Rtext:内容
	$Rauthor:作者
	$Rtype:类型
	$Rtime:添加时间
	*/
	public function results_update($Rid, $Rtitile, $Rinfo, $Rimg_url, $Rtext, $Rauthor, $Rtype, $Rtime){
		$str = "UPDATE `results` SET `Rtitile` = '".$Rtitile."',
				`Rinfo` = '".$Rinfo."',
				`Rimg_url` = '".$Rimg_url."',
				`Rtext` = '".$Rtext."',
				`Rauthor` = '".$Rauthor."',
				`Rtype` = '".$Rtype."',
				`Rtime` = '".$Rtime."' WHERE `results`.`Rid` =".$Rid.";";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
	/*  ----------------------------------分割线--数据删除----------------------------------------------------- */
	
	/*results表删除操作
	$Rid：编号
	*/
	public function results_delect($Rid){
		$str = "DELETE FROM `results` WHERE Rid =".$Rid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		mysql_close($this->mysql_conn);
		return $re;
	}
}	
?>