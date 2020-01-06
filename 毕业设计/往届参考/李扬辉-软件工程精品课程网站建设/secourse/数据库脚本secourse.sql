# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 127.0.0.1    Database: secourse
# ------------------------------------------------------
# Server version 5.0.67-community-nt

DROP DATABASE IF EXISTS `secourse`;
CREATE DATABASE `secourse` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `secourse`;

#
# Source for table huifu
#

DROP TABLE IF EXISTS `huifu`;
CREATE TABLE `huifu` (
  `wentiID` int(11) NOT NULL default '0',
  `huifuID` int(11) NOT NULL auto_increment,
  `userID` int(11) NOT NULL default '0',
  `huifuContent` text NOT NULL,
  `date` char(20) NOT NULL default '',
  `editdate` char(20) default '',
  PRIMARY KEY  (`huifuID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

#
# Dumping data for table huifu
#

LOCK TABLES `huifu` WRITE;
/*!40000 ALTER TABLE `huifu` DISABLE KEYS */;
INSERT INTO `huifu` VALUES (11,5,0,'hsjs','','');
INSERT INTO `huifu` VALUES (31,9,2,'ggg','2006-09-25 17:01:39','');
INSERT INTO `huifu` VALUES (32,10,4,'ff','2006-09-25 19:18:58','');
/*!40000 ALTER TABLE `huifu` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table news_t
#

DROP TABLE IF EXISTS `news_t`;
CREATE TABLE `news_t` (
  `newsID` int(11) NOT NULL auto_increment,
  `title` char(50) NOT NULL default '',
  `content` text NOT NULL,
  `author` char(8) NOT NULL default '',
  `update_date` char(20) default '',
  `date` char(20) NOT NULL default '',
  PRIMARY KEY  (`newsID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gb2312;

#
# Dumping data for table news_t
#

LOCK TABLES `news_t` WRITE;
/*!40000 ALTER TABLE `news_t` DISABLE KEYS */;
INSERT INTO `news_t` VALUES (7,'乱码问题解决了','小意思','admin','','2011-05-01 08:42:01');
INSERT INTO `news_t` VALUES (8,'我靠，，终于搞定了吧','小问题大麻烦','admin','','2011-05-01 12:05:47');
/*!40000 ALTER TABLE `news_t` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table student
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `xuehao` char(20) NOT NULL default '',
  `xingming` char(8) NOT NULL default '',
  `banji` char(20) NOT NULL default '',
  `xingbie` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`xuehao`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

#
# Dumping data for table student
#

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_admin
#

DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminID` char(8) NOT NULL default '',
  `password` char(12) NOT NULL default '',
  `grade` int(1) NOT NULL default '1',
  PRIMARY KEY  (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

#
# Dumping data for table t_admin
#

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES ('admin','admin',3);
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_file
#

DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `fileID` int(11) NOT NULL auto_increment,
  `fileName` varchar(50) character set gb2312 NOT NULL,
  `fileSize` varchar(50) character set gb2312 default NULL,
  `fileTime` datetime default NULL,
  `fileAdmin` varchar(20) character set gb2312 default NULL,
  `fileType` varchar(20) character set gb2312 NOT NULL,
  PRIMARY KEY  (`fileID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312;

#
# Dumping data for table t_file
#

LOCK TABLES `t_file` WRITE;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
INSERT INTO `t_file` VALUES (12,'TeeChart.rar','20334',NULL,'null','shiyan');
INSERT INTO `t_file` VALUES (13,'7698916.gif','34',NULL,'null','CouseWare');
INSERT INTO `t_file` VALUES (14,'lwdg.doc','81',NULL,'null','CouseWare');
INSERT INTO `t_file` VALUES (15,'A Love That Will Never Grow Old.mp3','4714',NULL,'null','CouseWare');
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_question
#

DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `question` text NOT NULL,
  `qID` int(11) NOT NULL auto_increment,
  `answer` char(4) NOT NULL default '',
  `zhangjie` tinyint(4) NOT NULL default '0',
  `type` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`qID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

#
# Dumping data for table t_question
#

LOCK TABLES `t_question` WRITE;
/*!40000 ALTER TABLE `t_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_question` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user_information
#

DROP TABLE IF EXISTS `user_information`;
CREATE TABLE `user_information` (
  `userID` int(11) NOT NULL auto_increment,
  `xuehao` char(12) default '',
  `username` char(16) NOT NULL default '',
  `mima` char(16) NOT NULL default '',
  PRIMARY KEY  (`userID`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

#
# Dumping data for table user_information
#

LOCK TABLES `user_information` WRITE;
/*!40000 ALTER TABLE `user_information` DISABLE KEYS */;
INSERT INTO `user_information` VALUES (1,'','a','a');
/*!40000 ALTER TABLE `user_information` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table wenti
#

DROP TABLE IF EXISTS `wenti`;
CREATE TABLE `wenti` (
  `wentiID` int(11) NOT NULL auto_increment,
  `userID` int(11) NOT NULL default '0',
  `date` char(20) NOT NULL default '',
  `wentiTitle` char(50) NOT NULL default '',
  `wentiContent` varchar(2000) NOT NULL default '',
  `editdate` char(20) default '',
  PRIMARY KEY  (`wentiID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=gb2312;

#
# Dumping data for table wenti
#

LOCK TABLES `wenti` WRITE;
/*!40000 ALTER TABLE `wenti` DISABLE KEYS */;
INSERT INTO `wenti` VALUES (34,1,'2011-05-01 08:35:39','对方的负担','负责','2011-05-01 08:38:01');
/*!40000 ALTER TABLE `wenti` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
