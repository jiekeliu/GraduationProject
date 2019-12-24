<?php
/*
数据操作文件
*/
class connFun{
	 private $mysql_conn;
	 public function __construct(){
		include_once "conn.php";
		$obj = new Mysql;
		if(Class_exists("Mysql")){   //检测数据库链接类是否存在
			if(!is_object($obj))
				throw new Exception("obj isnot object");
		}else{
			throw new Exception("class is not exists");
		}
		$this->mysql_conn = $obj->sucessConn();;
	}
	
	public function getRes(){
		return $this->mysql_conn;
	}
/*  ----------------------------------act_manage用户表------------------------------------------------------- */
	//act_manage表查询操作by uid，$uid：用户编号
	public function act_query($uid){
		$str = "SELECT * FROM `act_manage`WHERE uid =".$uid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		include_once "act.php";
		while ($row = mysql_fetch_assoc($re,MYSQL_ASSOC))
		{
			$user = new Act($row['uid'],$row['uname'],$row['upwd'],$row['utime'],$row['ustatus'],$row['uemail']);
		}
		mysql_close($this->mysql_conn);
		return $user;
	}
	//act_manage表查询操作by uemail，$uemail：用户邮箱
	public function act_queryByEmail($uemail){
		$str = "SELECT * FROM `act_manage`WHERE uemail =".$uemail;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		include_once "act.php";
		while ($row = mysql_fetch_assoc($re,MYSQL_ASSOC))
		{
			$user = new Act($row['uid'],$row['uname'],$row['upwd'],$row['utime'],$row['ustatus'],$row['uemail']);
		}
		mysql_close($this->mysql_conn);
		return $user;
	}
	
	//act_manage表所有内容查询操作
	public function act_queryAll(){
		$str = "SELECT * FROM `act_manage`;";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		include_once "act.php";
		$res_arr = array();
		while ($row = mysql_fetch_assoc($re,MYSQL_ASSOC))
		{
			$user = new Act($row['uid'],$row['uname'],$row['upwd'],$row['utime'],$row['ustatus'],$row['uemail']);
			 array_push($res_arr, $user);
		}
		mysql_close($this->mysql_conn);
		return $res_arr;
	}
	
	/*act_manage表插入操作
	$uname:用户名
	$upwd:密码
	$utime:注册时间
	$uemail:电子邮箱
	*/
	
	public function act_insert($uname,$upwd,$utime,$uemail){
		
		$str = "INSERT INTO `act_manage` ( `uname` , `upwd` , `utime` , `uemail` )
		VALUES ('".$uname."', '".$upwd."', '".$utime."', '".$uemail."');";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		return $re;
	}
	/*act_manage表修改操作
	$uid:用户编号
	$uname:用户名
	$upwd:密码
	$ustatus:用户状态
	$uemail:电子邮箱
	*/
	public function act_update($uid,$uname,$upwd,$ustatus,$uemail){
		
		$str = "UPDATE `act_manage` SET `uname` = '".$uname."',
				`upwd` = '".$upwd."',
				`ustatus` = ".$ustatus.",
				`uemail` = '".$uemail."' WHERE uid =".$uid.";";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		return $re;
	}
	
	
	/*act_manage表修改操作
	$uid:用户编号
	*/
	public function act_delete($uid){
		
		$str = "DELETE FROM `act_manage` WHERE uid =".$uid;
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		return $re;
	}
	
/*  ----------------------------------act_manage表------------------------------------------------------- */

/*  ----------------------------------fontsetting网站基本信息表------------------------------------------------------- */
	/*fontsetting表插入操作
	$web_name:网站名称
	$webimg_url:网站图标链接地址
	$webfooter_info:网站备注信息
	*/
	public function fontsetting_insert($web_name,$webimg_url,$webfooter_info){
		
		$str = "INSERT INTO `frontsetings` ( `web_name` , `webimg_url` , `webfooter_info` )
				VALUES ('".$web_name."', '".$webimg_url."', '".$webfooter_info."');";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		return $re;
	}
	
	/*fontsetting表修改操作
	$web_name:网站名称
	$webimg_url:网站图标链接地址
	$webfooter_info:网站备注信息
	*/
	public function fontsetting_update($web_name,$webimg_url,$webfooter_info){
		$str = "UPDATE `frontsetings` SET `web_name` = '".$web_name."',
			`webimg_url` = '".$webimg_url."',
			`webfooter_info` = '".$webfooter_info."' WHERE set_id =1";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		return $re;
	}
/*  ----------------------------------fontsetting表------------------------------------------------------- */

/*  ----------------------------------function_table功能目录表------------------------------------------------------- */
	/*function_table表插入操作
	$fpid:父功能id
	$fname:功能名称
	$furl:功能实现地址
	fgrade:功能层级
	*/
	public function fun_insert($fpid, $fname, $furl, $fgrade){
		
		$str = "INSERT INTO `function_table` ( `fpid` , `fname` , `furl` , `fgrade` )
				VALUES (".$fpid.", '".$fname."', '".$furl."', ".$fgrade." )";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		return $re;
	}
/*  ----------------------------------function_table表------------------------------------------------------- */

/*  ----------------------------------stationmaster站长信息表------------------------------------------------------- */
	/*stationmaster_table表插入操作
	默认插入一个空白行，站长信息只能修改不能添加和删除
	*/
	public function stationmaster_insert(){
		
		$str = "INSERT INTO `stationmasterinfo` ( `name` , `age` , `rfs` , `profession` , `like` , `specialty` , `pac` , `plan` , `selfintro` )
				VALUES ('name', 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ')";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		return $re;
	}
/*  ----------------------------------stationmaster表------------------------------------------------------- */

/*  ----------------------------------authority_user权限关系表------------------------------------------------------- */
	/*authority_user表插入操作
	$Agrede:权限层级
	$Uid:用户id号
	$Fid_having:所拥有的功能的id
	*/
	public function authority_insert($Agrede, $Uid, $Fid_having){
		
		$str = "INSERT INTO `authority_user` ( `Agrede` , `Uid` , `Fid_having` )
				VALUES ( ".$Agrede.", ".$Uid.", '".$Fid_having."' )";
		$re = mysql_query($str,$this->mysql_conn);
        if (!$re) {
		    die("couldn't get the res:\n" . mysql_error());
		}
		return $re;
	}
/*  ----------------------------------authority_user表------------------------------------------------------- */
	
}


?>