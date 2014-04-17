# Host: localhost  (Version: 5.5.16)
# Date: 2014-02-25 11:27:18
# Generator: MySQL-Front 5.3  (Build 4.81)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "think_contact"
#

DROP TABLE IF EXISTS `think_contact`;
CREATE TABLE `think_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT '拼音',
  `company` varchar(30) NOT NULL DEFAULT '' COMMENT '公司',
  `dept` varchar(20) NOT NULL DEFAULT '' COMMENT '部门',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT '职位',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `website` varchar(50) NOT NULL DEFAULT '' COMMENT '网站',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` text COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='think_user_info';

#
# Data for table "think_contact"
#

/*!40000 ALTER TABLE `think_contact` DISABLE KEYS */;
INSERT INTO `think_contact` VALUES (9,'马腾化','MTH','腾讯','CEO','CEO','pony@qq.com','公电话','手机','','','2',1,'',0),(10,'雷军','LJ','小米','CEO','CEO','yyyyy@yy.com','010-12341234','139-1234-1234','www.sohu.com','1234567','',1,'',0),(11,'张三','ZS','张三','IT','CEO','zhang@zhang.com','654','321','','12356','1',1,'',0),(21,'223e23','','','','','abc@sohu.com','23232','','','','',1,'',1),(22,'123151','','','1231','','abc@sohu.com','231','','1231231','','',1,'123123',0),(23,'1234124123','','123','1231','12','312@sohu.com','2312','312','312','123','11231231',1,'3123',0);
/*!40000 ALTER TABLE `think_contact` ENABLE KEYS */;

#
# Structure for table "think_customer"
#

DROP TABLE IF EXISTS `think_customer`;
CREATE TABLE `think_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT '拼音',
  `biz_license` varchar(30) NOT NULL DEFAULT '' COMMENT '营业许可',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `contact` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `fax` varchar(20) NOT NULL DEFAULT '' COMMENT '传真',
  `salesman` varchar(50) NOT NULL DEFAULT '' COMMENT '业务员',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` text,
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "think_customer"
#

/*!40000 ALTER TABLE `think_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `think_customer` ENABLE KEYS */;

#
# Structure for table "think_dept"
#

DROP TABLE IF EXISTS `think_dept`;
CREATE TABLE `think_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `dept_no` varchar(20) NOT NULL DEFAULT '',
  `dept_grade_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `short` varchar(20) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "think_dept"
#

/*!40000 ALTER TABLE `think_dept` DISABLE KEYS */;
INSERT INTO `think_dept` VALUES (1,0,'A1',5,'小微企业','小微','','',0),(2,1,'YYB',7,'运营部','运营','5','',0),(3,1,'CPB',7,'产品部','产品','4','',0),(4,6,'HR',9,'人事科','人事','','',0),(5,1,'ZJB',7,'总经办','总经','1','',0),(6,1,'GLB',7,'管理部','行政','2','',0),(7,1,'XSB',7,'销售部','销售','3','',0),(8,1,'KFB',7,'开发部','开发','2','',0),(9,7,'XS2',9,'南方区域','销售2','','',0),(10,6,'AC',9,'会计科','会计','','',0),(12,8,'KF2',9,'开发二科','开二','','',1),(13,8,'KF1',9,'开发一科','开一','','',1);
/*!40000 ALTER TABLE `think_dept` ENABLE KEYS */;

#
# Structure for table "think_dept_grade"
#

DROP TABLE IF EXISTS `think_dept_grade`;
CREATE TABLE `think_dept_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_no` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` varchar(10) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "think_dept_grade"
#

/*!40000 ALTER TABLE `think_dept_grade` DISABLE KEYS */;
INSERT INTO `think_dept_grade` VALUES (7,'DG20','部','30',0),(9,'DG40','科','50',0),(11,'DG3','123','4',0),(12,'DG3','333','3333',0),(13,'DG1','总经理','10',0);
/*!40000 ALTER TABLE `think_dept_grade` ENABLE KEYS */;

#
# Structure for table "think_doc"
#

DROP TABLE IF EXISTS `think_doc`;
CREATE TABLE `think_doc` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `folder` int(11) NOT NULL,
  `add_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

#
# Data for table "think_doc"
#

/*!40000 ALTER TABLE `think_doc` DISABLE KEYS */;
INSERT INTO `think_doc` VALUES (77,'2014-0001','新建文档','新建文档1',21,'61ea7b10c0e57f4ff8fb6bf988694faf;',1,'管理员',1392173339,1392878408,0);
/*!40000 ALTER TABLE `think_doc` ENABLE KEYS */;

#
# Structure for table "think_duty"
#

DROP TABLE IF EXISTS `think_duty`;
CREATE TABLE `think_duty` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `duty_no` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "think_duty"
#

/*!40000 ALTER TABLE `think_duty` DISABLE KEYS */;
INSERT INTO `think_duty` VALUES (14,'P001','采购员','',0,'采购员'),(15,'S001','业务员','',0,'');
/*!40000 ALTER TABLE `think_duty` ENABLE KEYS */;

#
# Structure for table "think_file"
#

DROP TABLE IF EXISTS `think_file`;
CREATE TABLE `think_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `savename` varchar(100) NOT NULL,
  `size` varchar(20) NOT NULL,
  `extension` varchar(20) NOT NULL,
  `module` varchar(20) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`,`module`)
) ENGINE=MyISAM AUTO_INCREMENT=1309 DEFAULT CHARSET=utf8;

#
# Data for table "think_file"
#

/*!40000 ALTER TABLE `think_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `think_file` ENABLE KEYS */;

#
# Structure for table "think_flow"
#

DROP TABLE IF EXISTS `think_flow`;
CREATE TABLE `think_flow` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `confirm` varchar(200) NOT NULL,
  `confirm_name` text NOT NULL,
  `consult` varchar(200) NOT NULL,
  `consult_name` text NOT NULL,
  `refer` varchar(200) NOT NULL,
  `refer_name` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `add_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `create_date` varchar(10) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `step` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `emp_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `refer_name` (`refer_name`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow"
#

/*!40000 ALTER TABLE `think_flow` DISABLE KEYS */;
INSERT INTO `think_flow` VALUES (94,'会计通讯2014-001','1234124','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部&nbsp;&nbsp;&nbsp;&nbsp;门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t1231231\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t使用人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t123123123123\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t通讯工具类别\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t（&nbsp;）固定电话&nbsp;&nbsp;（&nbsp;）移动电话&nbsp;&nbsp;（&nbsp;）其他\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t号&nbsp;&nbsp;码\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t1231412315123\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t费用（合计）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t人民币（大写）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t费用明细\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','3001|','\r\n\t\t\t\t<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr></span>\t\t\t','dept_10|','\r\n\t\t\t\t<span data=\"dept_10\" id=\"dept_10\"><nobr><b title=\"会计科\">会计科</b></nobr></span>\t\t\t','','\r\n\t\t\t\t\t\t\t','18','',1,'管理员',10,'会计科','',1392356552,0,20,0,'admin'),(95,'会计招待2014-001','招待费用报销单','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓&nbsp;&nbsp;&nbsp;&nbsp;名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t职务\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待事由\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td rowspan=\"11\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t附件\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t张\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部&nbsp;&nbsp;&nbsp;门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"10\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待对象\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待人数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t客人&nbsp;&nbsp;&nbsp;人，陪同&nbsp;&nbsp;&nbsp;人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t备注\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"6\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t日&nbsp;&nbsp;&nbsp;期\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待地点\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t餐饮费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t住宿费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t礼品礼金\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t其他费用\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"12\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t金额合计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t十\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t万\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t千\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t百\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t十\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t元\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t角\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t分\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t金额\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t（大写）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t合计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t财务审批\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门主管审批\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t财务复核\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门经理审核\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t经办人签名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t报销人签名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','3001|2001|1001|','<span data=\"3001\" id=\"3001\"><nobr><b title=\"经理3001/经理\">经理3001/经理</b></nobr><b><i class=\"icon-arrow-right\"></i></b></span><span data=\"2001\" id=\"2001\"><nobr><b title=\"总监2001/总监\">总监2001/总监</b></nobr><b><i class=\"icon-arrow-right\"></i></b></span><span data=\"1001\" id=\"1001\"><nobr><b title=\"总经理1001/总经理\">总经理1001/总经理</b></nobr></span>','','','','','19','',55,'员工5001',10,'会计科','',1392969851,0,40,0,'5001');
/*!40000 ALTER TABLE `think_flow` ENABLE KEYS */;

#
# Structure for table "think_flow_log"
#

DROP TABLE IF EXISTS `think_flow_log`;
CREATE TABLE `think_flow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL,
  `emp_no` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `step` int(11) NOT NULL,
  `result` int(11) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `comment` text NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_log"
#

/*!40000 ALTER TABLE `think_flow_log` DISABLE KEYS */;
INSERT INTO `think_flow_log` VALUES (115,94,'3001',NULL,'',21,NULL,1392356552,0,'',0),(116,95,'3001',49,'经理3001',21,1,1392969851,1392969872,'1234123145',0),(117,95,'2001',42,'总监2001',22,1,1392969872,1392969891,'1231512315123123',0),(118,95,'1001',44,'总经理1001',23,1,1392969891,1392969909,'151231512315123',0);
/*!40000 ALTER TABLE `think_flow_log` ENABLE KEYS */;

#
# Structure for table "think_flow_type"
#

DROP TABLE IF EXISTS `think_flow_type`;
CREATE TABLE `think_flow_type` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(20) NOT NULL,
  `doc_no_format` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `short` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `confirm` varchar(100) NOT NULL,
  `confirm_name` text NOT NULL,
  `consult` varchar(100) NOT NULL,
  `consult_name` text NOT NULL,
  `refer` varchar(100) NOT NULL,
  `refer_name` text NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `is_edit` tinyint(3) NOT NULL DEFAULT '0',
  `is_lock` tinyint(3) NOT NULL DEFAULT '0',
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_type"
#

/*!40000 ALTER TABLE `think_flow_type` DISABLE KEYS */;
INSERT INTO `think_flow_type` VALUES (17,'办公事务管理','{DEPT}{SHORT}{YYYY}-{###}','行政费用申请单','行政','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t费用类别\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t金&nbsp;&nbsp;&nbsp;&nbsp;额\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t用途说明\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t附件张数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t合&nbsp;&nbsp;&nbsp;&nbsp;计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t人民币（大写）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n<p>\r\n\t<br />\r\n</p>','dgp_9_2|dgp_7_3|','<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"icon-arrow-right\"></i></b></span><span data=\"dgp_7_3\" id=\"dgp_7_3\"><nobr><b title=\"部-总监\">部-总监</b></nobr></span>','dept_10|','<span data=\"dept_10\" id=\"dept_10\"><nobr><b title=\"会计科\">会计科</b></nobr></span>','','',1391697875,0,1,0,1,0),(18,'办公事务管理','{DEPT}{SHORT}{YYYY}-{###}','通讯费用报销单','通讯','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部&nbsp;&nbsp;&nbsp;&nbsp;门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t使用人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t通讯工具类别\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t（&nbsp;）固定电话&nbsp;&nbsp;（&nbsp;）移动电话&nbsp;&nbsp;（&nbsp;）其他\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t号&nbsp;&nbsp;码\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t费用（合计）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t人民币（大写）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t&nbsp;\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t费用明细\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','dgp_9_2|','<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr></span>','dept_10|','<span data=\"dept_10\" id=\"dept_10\"><nobr><b title=\"会计科\">会计科</b></nobr></span>','','',1391697983,0,1,1,0,0),(19,'办公事务管理','{DEPT}{SHORT}{YYYY}-{###}','招待费用报销单','招待','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓&nbsp;&nbsp;&nbsp;&nbsp;名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t职务\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待事由\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td rowspan=\"11\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t附件\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t张\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部&nbsp;&nbsp;&nbsp;门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"10\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待对象\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待人数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t客人&nbsp;&nbsp;&nbsp;人，陪同&nbsp;&nbsp;&nbsp;人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t备注\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"6\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t日&nbsp;&nbsp;&nbsp;期\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待地点\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t餐饮费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t住宿费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t礼品礼金\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t其他费用\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"12\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t金额合计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t十\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t万\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t千\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t百\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t十\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t元\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t角\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t分\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t金额\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t（大写）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t合计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t财务审批\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门主管审批\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t财务复核\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门经理审核\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t经办人签名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t报销人签名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','dgp_9_2|dgp_7_3|','<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"icon-arrow-right\"></i></b></span><span data=\"dgp_7_3\" id=\"dgp_7_3\"><nobr><b title=\"部-总监\">部-总监</b></nobr></span>','dept_10|','<span data=\"dept_10\" id=\"dept_10\"><nobr><b title=\"会计科\">会计科</b></nobr></span>','','',1391698060,1391699220,1,1,0,0),(20,'办公事务管理','{DEPT}{SHORT}{YYYY}-{###}','印章使用审批表','印章','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t编&nbsp;&nbsp;&nbsp;&nbsp;号\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t用章部门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t盖章时间\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t印章类别\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t盖章次数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t文件发文号\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t文件名称\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t备&nbsp;&nbsp;&nbsp;&nbsp;注\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t用章人（签章）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t批准人（签章）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','dgp_9_2|dgp_7_3|','<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"icon-arrow-right\"></i></b></span><span data=\"dgp_7_3\" id=\"dgp_7_3\"><nobr><b title=\"部-总监\">部-总监</b></nobr></span>','dept_5|','<span data=\"dept_5\" id=\"dept_5\"><nobr><b title=\"总经办\">总经办</b></nobr></span>','','',1391698224,1391699255,1,1,0,0),(21,'人事管理','{DEPT}{SHORT}{YYYY}-{###}','员工培训申请表','应聘','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t申请部门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t申请人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t培训时间\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t总时数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t培训讲师\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t需费用\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t培训地点\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t培训人员\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t培训内容\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t培训器材\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门主管审核：\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t签字：\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t主管领导批准：\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t签字：\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n<br />','dgp_9_2|dgp_7_3|','<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"icon-arrow-right\"></i></b></span><span data=\"dgp_7_3\" id=\"dgp_7_3\"><nobr><b title=\"部-总监\">部-总监</b></nobr></span>','dept_4|','<span data=\"dept_4\" id=\"dept_4\"><nobr><b title=\"人事科\">人事科</b></nobr></span>','','',1391698504,1391699270,2,1,0,0),(22,'人事管理','{DEPT}{SHORT}{YYYY}-{###}','员工请假申请单','请假','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t所属部门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t填表日期\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t请假类别\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t□事假&nbsp;&nbsp;&nbsp;&nbsp;□病假&nbsp;&nbsp;&nbsp;&nbsp;□婚假&nbsp;&nbsp;&nbsp;&nbsp;□产假&nbsp;&nbsp;&nbsp;&nbsp;□丧假&nbsp;&nbsp;&nbsp;&nbsp;□其他（请注明）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t请假事由\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t请假时间\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门负责人意见\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t人力资源部意见\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t主管副总意见\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t总经理意见\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','dgp_9_2|','<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr></span>','dept_4|','<span data=\"dept_4\" id=\"dept_4\"><nobr><b title=\"人事科\">人事科</b></nobr></span>','','',1391698587,1391699263,2,1,0,0),(23,'人事管理','{DEPT}{SHORT}{YYYY}-{###}','出差计划申请表','出差','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t出差人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t职务\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t代理人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t职务\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t签认\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t出差人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t代理人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t出差\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t地点\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"8\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t出差\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t时间\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t自&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;时起\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;时讫（共&nbsp;&nbsp;&nbsp;&nbsp;日）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t拟办\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t事项\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"18\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t主管副总批示\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门负责人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t申请人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t日期\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t起讫地点\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t交通工具\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t交通费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t住宿费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t杂费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t合计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"8\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t合&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t合计金额（大写）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t万&nbsp;&nbsp;&nbsp;&nbsp;仟&nbsp;&nbsp;&nbsp;&nbsp;佰&nbsp;&nbsp;&nbsp;&nbsp;拾&nbsp;&nbsp;&nbsp;&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;角&nbsp;&nbsp;&nbsp;&nbsp;分\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"6\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t附凭证&nbsp;&nbsp;&nbsp;&nbsp;张\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','dgp_9_2|dgp_7_3|','<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"icon-arrow-right\"></i></b></span><span data=\"dgp_7_3\" id=\"dgp_7_3\"><nobr><b title=\"部-总监\">部-总监</b></nobr></span>','dept_4|','<span data=\"dept_4\" id=\"dept_4\"><nobr><b title=\"人事科\">人事科</b></nobr></span>','','',1391698667,1391699280,2,1,0,0);
/*!40000 ALTER TABLE `think_flow_type` ENABLE KEYS */;

#
# Structure for table "think_forum"
#

DROP TABLE IF EXISTS `think_forum`;
CREATE TABLE `think_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `views` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `add_file` varchar(200) NOT NULL,
  `last_post` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "think_forum"
#

/*!40000 ALTER TABLE `think_forum` DISABLE KEYS */;
INSERT INTO `think_forum` VALUES (20,25,1,'管理员','1111111111111111111','111111111',15,0,0,'214be5e5a7cc691b19d34eb331526012;',0,1392884753,0,0);
/*!40000 ALTER TABLE `think_forum` ENABLE KEYS */;

#
# Structure for table "think_mail"
#

DROP TABLE IF EXISTS `think_mail`;
CREATE TABLE `think_mail` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `folder` int(11) NOT NULL,
  `mid` varchar(200) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `add_file` varchar(200) DEFAULT NULL,
  `from` varchar(2000) DEFAULT NULL,
  `to` varchar(2000) DEFAULT NULL,
  `reply_to` varchar(2000) DEFAULT NULL,
  `cc` varchar(2000) DEFAULT NULL,
  `read` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=1777 DEFAULT CHARSET=utf8;

#
# Data for table "think_mail"
#

/*!40000 ALTER TABLE `think_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `think_mail` ENABLE KEYS */;

#
# Structure for table "think_mail_account"
#

DROP TABLE IF EXISTS `think_mail_account`;
CREATE TABLE `think_mail_account` (
  `id` mediumint(6) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mail_name` varchar(50) NOT NULL,
  `pop3svr` varchar(50) NOT NULL,
  `smtpsvr` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `mail_pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='think_user_info';

#
# Data for table "think_mail_account"
#

/*!40000 ALTER TABLE `think_mail_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `think_mail_account` ENABLE KEYS */;

#
# Structure for table "think_mail_organize"
#

DROP TABLE IF EXISTS `think_mail_organize`;
CREATE TABLE `think_mail_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `sender_check` int(11) NOT NULL,
  `sender_option` int(11) NOT NULL,
  `sender_key` varchar(50) NOT NULL,
  `domain_check` int(100) NOT NULL,
  `domain_option` int(11) NOT NULL,
  `domain_key` varchar(50) NOT NULL,
  `recever_check` int(11) NOT NULL,
  `recever_option` int(11) NOT NULL,
  `recever_key` varchar(50) NOT NULL,
  `title_check` int(11) NOT NULL,
  `title_option` int(11) NOT NULL,
  `title_key` varchar(50) NOT NULL,
  `to` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "think_mail_organize"
#

/*!40000 ALTER TABLE `think_mail_organize` DISABLE KEYS */;
INSERT INTO `think_mail_organize` VALUES (17,1,0,0,1,'',1,1,'123456',0,1,'',0,1,'',30,0);
/*!40000 ALTER TABLE `think_mail_organize` ENABLE KEYS */;

#
# Structure for table "think_nav"
#

DROP TABLE IF EXISTS `think_nav`;
CREATE TABLE `think_nav` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `layout` tinyint(3) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`is_del`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "think_nav"
#

/*!40000 ALTER TABLE `think_nav` DISABLE KEYS */;
INSERT INTO `think_nav` VALUES (1,'首页','/','1',0,1,'小微OA_小微oa_小微OA办公自动化_小微OA系统_小微OA软件-SMEOA_PHP开源OA系统_OA系统定制开发_OA系统下载','小微oa,小微OA办公自动化,小微OA系统,小微OA软件,oa办公系统,oa系统,协同,OA系统,小微OA,小微oa,小微OA,小微OA系统,PHP开源OA系统,免费OA系统,OA系统下载,简单易用,审批灵活,移动办公,源码开源,免费下载','让工作更轻松快乐,想了解更多小微OA,小微OA为您服务,为小微企业量身定制OA系统,响应试设计支持手机、平板,定制开发满足小微企业个性需求,为小微企业提供个性化的手机移动办公解决方案','doc-68',0),(2,'功能特点','/feature/','2',0,1,'小微OA_小微oa_小微OA办公自动化_小微OA系统_小微OA软件-SMEOA_PHP开源OA系统_OA系统定制开发_OA系统下载','小微oa,小微OA办公自动化,小微OA系统,小微OA软件,oa办公系统,oa系统,协同,OA系统,小微OA,小微oa,小微OA,小微OA系统,PHP开源OA系统,免费OA系统,OA系统下载,简单易用,审批灵活,移动办公,源码开源,免费下载','让工作更轻松快乐,想了解更多小微OA,小微OA为您服务,为小微企业量身定制OA系统,响应试设计支持手机、平板,定制开发满足小微企业个性需求,为小微企业提供个性化的手机移动办公解决方案','doc-67',0),(3,'源码下载','/download/','3',0,1,'小微OA_小微oa_小微OA办公自动化_小微OA系统_小微OA软件-SMEOA_PHP开源OA系统_OA系统定制开发_OA系统下载','小微oa,小微OA办公自动化,小微OA系统,小微OA软件,oa办公系统,oa系统,协同,OA系统,小微OA,小微oa,小微OA,小微OA系统,PHP开源OA系统,免费OA系统,OA系统下载,简单易用,审批灵活,移动办公,源码开源,免费下载','让工作更轻松快乐,想了解更多小微OA,小微OA为您服务,为小微企业量身定制OA系统,响应试设计支持手机、平板,定制开发满足小微企业个性需求,为小微企业提供个性化的手机移动办公解决方案','doc-69',0),(4,'帮助文档','/guide/','4',0,1,'小微OA_小微oa_小微OA办公自动化_小微OA系统_小微OA软件-SMEOA_PHP开源OA系统_OA系统定制开发_OA系统下载','小微oa,小微OA办公自动化,小微OA系统,小微OA软件,oa办公系统,oa系统,协同,OA系统,小微OA,小微oa,小微OA,小微OA系统,PHP开源OA系统,免费OA系统,OA系统下载,简单易用,审批灵活,移动办公,源码开源,免费下载','让工作更轻松快乐,想了解更多小微OA,小微OA为您服务,为小微企业量身定制OA系统,响应试设计支持手机、平板,定制开发满足小微企业个性需求,为小微企业提供个性化的手机移动办公解决方案','doc-70',0),(5,'商业服务','/service/','5',0,1,'小微OA_小微oa_小微OA办公自动化_小微OA系统_小微OA软件-SMEOA_PHP开源OA系统_OA系统定制开发_OA系统下载','小微oa,小微OA办公自动化,小微OA系统,小微OA软件,oa办公系统,oa系统,协同,OA系统,小微OA,小微oa,小微OA,小微OA系统,PHP开源OA系统,免费OA系统,OA系统下载,简单易用,审批灵活,移动办公,源码开源,免费下载','让工作更轻松快乐,想了解更多小微OA,小微OA为您服务,为小微企业量身定制OA系统,响应试设计支持手机、平板,定制开发满足小微企业个性需求,为小微企业提供个性化的手机移动办公解决方案','doc-71',0),(6,'立即体验','//demo.smeoa.com','6',0,1,NULL,NULL,NULL,NULL,0),(7,'合作伙伴','/partner/','',8,1,'小微OA_小微oa_小微OA办公自动化_小微OA系统_小微OA软件-SMEOA_PHP开源OA系统_OA系统定制开发_OA系统下载','小微oa,小微OA办公自动化,小微OA系统,小微OA软件,oa办公系统,oa系统,协同,OA系统,小微OA,小微oa,小微OA,小微OA系统,PHP开源OA系统,免费OA系统,OA系统下载,简单易用,审批灵活,移动办公,源码开源,免费下载','让工作更轻松快乐,想了解更多小微OA,小微OA为您服务,为小微企业量身定制OA系统,响应试设计支持手机、平板,定制开发满足小微企业个性需求,为小微企业提供个性化的手机移动办公解决方案','doc-72',0),(8,'隐藏页面','','99',0,1,'','','','',1),(9,'关于我们','/about/','',8,1,'小微OA_小微oa_小微OA办公自动化_小微OA系统_小微OA软件-SMEOA_PHP开源OA系统_OA系统定制开发_OA系统下载','小微oa,小微OA办公自动化,小微OA系统,小微OA软件,oa办公系统,oa系统,协同,OA系统,小微OA,小微oa,小微OA,小微OA系统,PHP开源OA系统,免费OA系统,OA系统下载,简单易用,审批灵活,移动办公,源码开源,免费下载','让工作更轻松快乐,想了解更多小微OA,小微OA为您服务,为小微企业量身定制OA系统,响应试设计支持手机、平板,定制开发满足小微企业个性需求,为小微企业提供个性化的手机移动办公解决方案','doc-73',0);
/*!40000 ALTER TABLE `think_nav` ENABLE KEYS */;

#
# Structure for table "think_node"
#

DROP TABLE IF EXISTS `think_node`;
CREATE TABLE `think_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `url` varchar(200) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sub_folder` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`is_del`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

#
# Data for table "think_node"
#

/*!40000 ALTER TABLE `think_node` DISABLE KEYS */;
INSERT INTO `think_node` VALUES (83,'公告',0,'##notice','icon-bell-alt','NoticeFolder','','7',0),(84,'管理',0,'user/index','icon-cogs','','','999',0),(85,'邮件',0,'mail/folder?fid=inbox','icon-envelope-alt','','','1',0),(87,'流程',0,'flow/index','icon-pencil','','','2',0),(88,'文档',0,'##doc','icon-file-alt','DocFolder','','3',0),(91,'日程',0,'schedule/index','icon-calendar','','','4',0),(94,'职位',0,'position/index',NULL,NULL,'','',1),(97,'部门',0,'dept/index',NULL,NULL,'','',1),(100,'写信',0,'mail/add',NULL,'','','1',85),(101,'收件箱',0,'mail/folder?fid=inbox','','','','3',85),(102,'邮件设置',0,'','','','','9',85),(104,'垃圾箱',0,'mail/folder?fid=spambox','','','','5',85),(105,'发件箱',0,'mail/folder?fid=outbox','','','','6',85),(106,'已删除',0,'mail/folder?fid=delbox','','','','4',85),(107,'草稿箱',0,'mail/folder?fid=darftbox','','','','7',85),(108,'邮件帐户设置',0,'mail_account/index',NULL,'','','1',102),(110,'公司信息管理',0,'',NULL,NULL,'','1',84),(112,'权限管理',0,'',NULL,NULL,'','3',84),(113,'系统设定',0,'',NULL,NULL,'','4',84),(114,'系统参数设置',0,'system_config/index','','','','1',113),(115,'组织图',0,'dept/index','','','','1',110),(116,'员工登记',0,'user/index',NULL,'','','5',110),(118,'权限组管理',0,'role/index','','','','1',112),(119,'权限设置',0,'role/node','','','','2',112),(120,'权限分配',0,'role/user','','','','3',112),(121,'菜单管理',0,'node/index','','','','1',113),(122,'职级',0,'rank/index',NULL,'','','3',110),(123,'职位',0,'position/index',NULL,'','','2',110),(124,'文件夹设置',0,'mail_folder/index',NULL,'','','2',102),(125,'联系人',0,'contact/index',NULL,'','','1',157),(126,'文档搜索',0,'doc/index',NULL,'','','1',88),(127,'文档库管理',0,'doc_folder/index','','','','C1',88),(137,'论坛',0,'##forum','icon-comments-alt','ForumFolder','','3',0),(138,'公告管理',0,'notice_folder/index','','','','4',83),(139,'最新主题',0,'forum/index','','','','',137),(140,'按月查看',0,'schedule/index',NULL,'','','1',91),(141,'日程查询',0,'schedule/search',NULL,'','','2',91),(142,'按日查看',0,'schedule/day_view',NULL,'','','2',91),(143,'邮件分类',0,'mail_organize/index',NULL,'','','',102),(144,'新建',0,'flow/index','','','','1',87),(146,'流程管理',0,'flow_type/index','','','','9',87),(147,'待审批',0,'flow/folder?fid=confirm','','','','3',87),(148,'已办理',0,'flow/folder?fid=finish','','','','3',87),(149,'草稿箱',0,'flow/folder?fid=darft','','','','2',87),(150,'已提交',0,'flow/folder?fid=submit','','','','2',87),(151,'收信',0,'mail/folder?fid=receve',NULL,'','','2',85),(152,'待办',0,'todo/index','icon-tasks','','','4',0),(153,'部门级别',0,'dept_grade/index',NULL,'','','4',110),(156,'客户',0,'customer/index',NULL,'','','2',157),(157,'人脉',0,'contact/index','icon-group','','','5',0),(158,'供应商',0,'supplier/index',NULL,'','','3',157),(169,'职员',0,'staff/index',NULL,'','','',157),(177,'我的文件夹',0,'##mail','','MailFolder','','8',85),(178,'自助',0,'','icon-search','','','',0),(179,'工资查询',0,'udf_salary/index','','','','',178),(180,'报销查询',0,'udf_expense/index','','','','',178),(181,'公告搜索',0,'notice/index','','','','',83),(182,'日志',0,'work_log/index','icon-book','','','',0),(183,'论坛管理',0,'forum_folder/index','','','','',137);
/*!40000 ALTER TABLE `think_node` ENABLE KEYS */;

#
# Structure for table "think_notice"
#

DROP TABLE IF EXISTS `think_notice`;
CREATE TABLE `think_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_no` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `folder` int(11) NOT NULL DEFAULT '0',
  `add_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

#
# Data for table "think_notice"
#

/*!40000 ALTER TABLE `think_notice` DISABLE KEYS */;
INSERT INTO `think_notice` VALUES (24,'2013-0001','sssss','ssssssssssssssssssssssssss',15,'',1,'管理员',1366874793,0,0),(25,'2013-0002','xxxxxx','xxxxxxxxxxxxxxxxxxxxxx',15,'',1,'管理员',1367735751,0,0),(26,'2013-0003','q','qqqqqqqqqqqqq',15,'',1,'管理员',1367735757,0,0),(27,'2013-0004','1','111111111111111',15,'',1,'管理员',1370508661,0,0),(28,'2013-0005','33333','333333333333333333333',15,'',1,'管理员',1370508667,0,0),(29,'2013-0006','333','3333333333333333333',15,'',1,'管理员',1370508673,0,0),(30,'2013-0007','3222222222','22222222222222222222',15,'',1,'管理员',1370508678,0,0),(31,'2013-0008','XXXXXXXXXXXXXXXXXXX','SSSSSSSSSSSSSSS',15,'',1,'管理员',1370508706,0,0),(32,'2013-0009','ZZZZZZZZZZZZZ','ZZZZZZZZZZZZZZZZZZ',15,'',1,'管理员',1370508714,0,0),(33,'2013-0010','CCCCCC','CCCCCCCCCCCCCCCCCCCCC',15,'',1,'管理员',1370508723,0,0),(34,'2013-0011','DDDDDDDD','DDDDDDDDDDDDDDDDDDDDD',15,'',1,'管理员',1370508728,0,0),(35,'2013-0012','FFFFFFFFFF','FFFFFFFFFFFFFFFFF',15,'',1,'管理员',1370508734,0,0),(36,'2013-0013','33333333','333333333333333333',15,'',1,'管理员',1370508785,0,0),(37,'2013-0014','333333333','3333333333333333333',15,'',1,'管理员',1370508791,0,0),(38,'2013-0015','3333333333','33333333333333333333',15,'',1,'管理员',1370508799,0,0),(39,'2013-0016','333333333','33333333333333333333',15,'',1,'管理员',1370508805,0,0),(40,'2013-0017','333333333333','333333333333333333333333333',15,'',1,'管理员',1370508812,0,0),(41,'2013-0018','公告 1','1公告',29,'',1,'管理员',1373937632,0,0),(42,'2013-0019','QQQQQQQQ','AAAAAAAAAAAAAAAAAAAAQQQQQQQQQQQQQQQQQQ',29,'',1,'管理员',1374031714,1375155796,0),(43,'2013-0020','岗位轮换 XXX部 部长 担任 XX部 ','岗位轮换 XXX部 部长 担任 XX部 部长',29,'747;',1,'管理员',1374031720,1383230652,0),(45,'2013-0022','XXX晋升为XXXX X月X日开始生效','XXX晋升为XXXX X月X日开始生效',28,'617;',1,'管理员',1375156032,1376634004,0),(46,'2013-0023','1234123','41123123',28,'',1,'管理员',1383896478,0,0),(47,'2013-0024','2222222','22222222222222222222222',28,'',1,'管理员',1383898012,0,0),(48,'2013-0025','1234567','234234623426235',28,'',1,'管理员',1383898426,0,0),(49,'2013-0025','1111','1111111111',26,'827;',1,'管理员',1384830291,1387975571,0);
/*!40000 ALTER TABLE `think_notice` ENABLE KEYS */;

#
# Structure for table "think_position"
#

DROP TABLE IF EXISTS `think_position`;
CREATE TABLE `think_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_no` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` varchar(10) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "think_position"
#

/*!40000 ALTER TABLE `think_position` DISABLE KEYS */;
INSERT INTO `think_position` VALUES (1,'PG30','主管','5',0),(2,'PG20','经理','4',0),(3,'PG10','总监','3',0),(4,'PG2','副总','2',0),(5,'PG1','总经理','1',0),(6,'PG40','助理','6',0);
/*!40000 ALTER TABLE `think_position` ENABLE KEYS */;

#
# Structure for table "think_post"
#

DROP TABLE IF EXISTS `think_post`;
CREATE TABLE `think_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `add_file` varchar(200) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

#
# Data for table "think_post"
#

/*!40000 ALTER TABLE `think_post` DISABLE KEYS */;
INSERT INTO `think_post` VALUES (37,9,'','1234123123',1,'管理员','',1,1374029462,0),(38,9,'','123123123123',1,'管理员','',1,1374029878,0),(39,9,'','asdfasdf',1,'管理员','',0,1376880653,0),(40,9,'','123123121111111111111',1,'管理员','',0,1376880661,0),(41,9,'','333333333333333',1,'管理员','',1,1376880668,0),(42,13,'','<p>\r\n\t回复主题\r\n</p>',2,'演示','',0,1379406480,0),(43,13,'','回复巴巴变',2,'演示','',0,1379406497,0),(44,12,'','asdfsdfas',1,'管理员','',0,1380548052,0),(45,13,'','23423423424',1,'管理员','',0,1383230442,0),(46,13,'','babababbab',1,'管理员','',0,1383230452,0),(47,15,'','<span style=\"color:#393939;font-family:\'Microsoft YaHei\', Arial, sans-serif, simsun;font-size:14px;line-height:25.171875px;white-space:normal;background-color:#FFFFFF;\">66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666</span>',1,'管理员','',0,1384743914,0),(48,19,'','1232145123123',1,'管理员','ba03aefe857940bd9f8c290a013677fc;',0,1392881119,0);
/*!40000 ALTER TABLE `think_post` ENABLE KEYS */;

#
# Structure for table "think_push"
#

DROP TABLE IF EXISTS `think_push`;
CREATE TABLE `think_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `status` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=860 DEFAULT CHARSET=utf8;

#
# Data for table "think_push"
#

/*!40000 ALTER TABLE `think_push` DISABLE KEYS */;
/*!40000 ALTER TABLE `think_push` ENABLE KEYS */;

#
# Structure for table "think_rank"
#

DROP TABLE IF EXISTS `think_rank`;
CREATE TABLE `think_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_no` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` varchar(10) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "think_rank"
#

/*!40000 ALTER TABLE `think_rank` DISABLE KEYS */;
INSERT INTO `think_rank` VALUES (1,'RG40','总监','',0),(2,'RG30','经理','',0),(3,'RG20','主管','',0),(4,'RG10','助理','',1);
/*!40000 ALTER TABLE `think_rank` ENABLE KEYS */;

#
# Structure for table "think_recent"
#

DROP TABLE IF EXISTS `think_recent`;
CREATE TABLE `think_recent` (
  `user_id` int(11) NOT NULL,
  `recent` varchar(2000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_recent"
#

/*!40000 ALTER TABLE `think_recent` DISABLE KEYS */;
INSERT INTO `think_recent` VALUES (1,'jzyin@qq.com|jzyin@qq.com;jzyin@sohu.com|jzyin@sohu.com;管理员 / 主管 |smeoa@qq.com;smeoa@qq.com|smeoa@qq.com;cn86shichang@foxmail.com|cn86shichang@foxmail.com;');
/*!40000 ALTER TABLE `think_recent` ENABLE KEYS */;

#
# Structure for table "think_relation"
#

DROP TABLE IF EXISTS `think_relation`;
CREATE TABLE `think_relation` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `relation_id` int(11) NOT NULL DEFAULT '0',
  `relation` varchar(20) NOT NULL DEFAULT '',
  KEY `row_id` (`row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_relation"
#

/*!40000 ALTER TABLE `think_relation` DISABLE KEYS */;
INSERT INTO `think_relation` VALUES (17,31,'Course|Video'),(16,29,'Course|Video'),(16,28,'Course|Video'),(14,29,'Course|Video'),(14,28,'Course|Video'),(14,27,'Course|Video'),(14,4,'Course|Position'),(14,3,'Course|Position'),(14,2,'Course|Position'),(14,10,'Course|Dept'),(14,6,'Course|Dept'),(14,5,'Course|Dept'),(13,29,'Course|Video'),(13,28,'Course|Video'),(13,27,'Course|Video'),(13,4,'Course|Position'),(13,3,'Course|Position'),(13,2,'Course|Position'),(13,10,'Course|Dept'),(13,6,'Course|Dept'),(13,5,'Course|Dept'),(17,30,'Course|Video'),(17,28,'Course|Video'),(24,30,'Course|Video'),(24,31,'Course|Video'),(22,32,'Course|Video'),(23,31,'Course|Video'),(21,32,'Course|Video'),(21,31,'Course|Video'),(21,30,'Course|Video'),(22,31,'Course|Video');
/*!40000 ALTER TABLE `think_relation` ENABLE KEYS */;

#
# Structure for table "think_role"
#

DROP TABLE IF EXISTS `think_role`;
CREATE TABLE `think_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pid` smallint(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`sort`),
  KEY `status` (`is_del`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "think_role"
#

/*!40000 ALTER TABLE `think_role` DISABLE KEYS */;
INSERT INTO `think_role` VALUES (1,'公司管理员',0,'','1',1208784792,1368507168,0),(2,'基本权限',0,'','2',1215496283,1368507164,0),(7,'测试组',0,'','2',1254325787,1368507159,0),(8,'VIP1',NULL,'','',1384997867,0,0);
/*!40000 ALTER TABLE `think_role` ENABLE KEYS */;

#
# Structure for table "think_role_duty"
#

DROP TABLE IF EXISTS `think_role_duty`;
CREATE TABLE `think_role_duty` (
  `role_id` smallint(6) unsigned NOT NULL,
  `duty_id` smallint(6) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_role_duty"
#

/*!40000 ALTER TABLE `think_role_duty` DISABLE KEYS */;
INSERT INTO `think_role_duty` VALUES (1,14),(1,15),(2,14),(2,15);
/*!40000 ALTER TABLE `think_role_duty` ENABLE KEYS */;

#
# Structure for table "think_role_node"
#

DROP TABLE IF EXISTS `think_role_node`;
CREATE TABLE `think_role_node` (
  `role_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `write` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_role_node"
#

/*!40000 ALTER TABLE `think_role_node` DISABLE KEYS */;
INSERT INTO `think_role_node` VALUES (2,136,NULL,NULL,NULL),(2,137,1,1,1),(2,135,NULL,NULL,NULL),(2,83,1,1,1),(1,94,NULL,NULL,NULL),(1,97,NULL,NULL,NULL),(1,98,NULL,NULL,NULL),(1,99,NULL,NULL,NULL),(1,69,NULL,NULL,NULL),(1,6,NULL,NULL,NULL),(1,2,NULL,NULL,NULL),(1,7,NULL,NULL,NULL),(1,131,1,1,1),(1,130,NULL,NULL,NULL),(1,127,1,1,1),(1,133,NULL,NULL,NULL),(1,132,NULL,NULL,NULL),(1,126,1,1,1),(2,152,1,1,1),(1,183,1,1,1),(1,135,NULL,NULL,NULL),(1,136,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,138,1,1,1),(1,134,NULL,NULL,NULL),(2,125,1,1,1),(2,103,NULL,NULL,NULL),(2,126,1,1,1),(2,88,1,1,1),(2,133,NULL,NULL,NULL),(2,130,NULL,NULL,NULL),(2,169,1,1,1),(7,124,NULL,NULL,NULL),(7,108,NULL,NULL,NULL),(7,102,NULL,NULL,NULL),(7,104,NULL,NULL,NULL),(7,107,NULL,NULL,NULL),(7,106,NULL,NULL,NULL),(7,105,NULL,NULL,NULL),(7,101,NULL,NULL,NULL),(7,100,NULL,NULL,NULL),(7,125,NULL,NULL,NULL),(1,152,NULL,NULL,NULL),(1,142,NULL,NULL,NULL),(1,141,NULL,NULL,NULL),(2,134,NULL,NULL,NULL),(2,158,1,1,1),(2,156,1,1,1),(2,132,NULL,NULL,NULL),(2,150,NULL,NULL,NULL),(2,124,1,1,1),(2,108,1,1,1),(2,103,NULL,NULL,NULL),(2,157,1,1,1),(1,140,NULL,NULL,NULL),(1,91,NULL,NULL,NULL),(1,91,NULL,NULL,NULL),(2,143,1,1,1),(2,102,NULL,NULL,NULL),(2,104,NULL,NULL,NULL),(2,107,NULL,NULL,NULL),(2,106,NULL,NULL,NULL),(2,105,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,109,NULL,NULL,NULL),(2,101,1,1,1),(2,151,NULL,NULL,NULL),(2,100,NULL,NULL,NULL),(2,85,NULL,NULL,NULL),(2,147,NULL,NULL,NULL),(2,149,NULL,NULL,NULL),(2,148,NULL,NULL,NULL),(2,144,1,1,1),(2,87,1,1,1),(2,142,NULL,NULL,NULL),(2,141,NULL,NULL,NULL),(2,140,1,1,1),(2,91,1,1,1),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,103,NULL,NULL,NULL),(1,109,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,163,NULL,NULL,NULL),(1,158,1,1,1),(1,170,NULL,NULL,NULL),(1,164,NULL,NULL,NULL),(1,114,1,1,1),(1,146,1,1,1),(1,121,1,1,1),(1,177,1,1,1),(1,188,NULL,NULL,NULL),(1,113,NULL,NULL,NULL),(1,155,NULL,NULL,NULL),(1,154,1,1,1),(1,120,NULL,NULL,NULL),(1,119,NULL,NULL,NULL),(1,118,1,1,1),(1,112,NULL,NULL,NULL),(1,116,1,1,1),(1,111,NULL,NULL,NULL),(1,153,1,1,1),(1,156,1,1,1),(1,122,1,1,1),(1,123,1,1,1),(1,115,1,1,1),(1,150,NULL,NULL,NULL),(1,149,NULL,NULL,NULL),(1,148,NULL,NULL,NULL),(1,147,NULL,NULL,NULL),(1,144,1,1,1),(1,124,1,1,1),(1,108,1,1,1),(1,143,1,1,1),(1,102,NULL,NULL,NULL),(1,104,NULL,NULL,NULL),(1,107,NULL,NULL,NULL),(1,106,NULL,NULL,NULL),(1,105,NULL,NULL,NULL),(1,101,1,1,1),(1,151,NULL,NULL,NULL),(1,125,1,1,1),(1,168,NULL,NULL,NULL),(1,162,NULL,NULL,NULL),(1,166,NULL,NULL,NULL),(1,161,NULL,NULL,NULL),(1,171,NULL,NULL,NULL),(1,169,1,1,1),(1,165,NULL,NULL,NULL),(1,174,NULL,NULL,NULL),(1,172,NULL,NULL,NULL),(1,173,NULL,NULL,NULL),(1,160,NULL,NULL,NULL),(1,175,NULL,NULL,NULL),(1,186,NULL,NULL,NULL),(1,185,NULL,NULL,NULL),(1,139,1,1,1),(1,182,1,1,1),(1,181,1,1,1),(1,180,1,1,1),(1,179,1,1,1),(1,178,NULL,NULL,NULL),(1,184,NULL,NULL,NULL),(1,176,NULL,NULL,NULL),(1,110,NULL,NULL,NULL),(1,194,NULL,NULL,NULL),(1,193,NULL,NULL,NULL),(1,187,NULL,NULL,NULL),(1,100,NULL,NULL,NULL),(1,85,NULL,NULL,NULL),(1,87,1,1,1),(1,88,NULL,NULL,NULL),(1,157,1,1,1),(1,167,NULL,NULL,NULL),(1,83,NULL,NULL,NULL),(1,128,NULL,NULL,NULL),(1,192,NULL,NULL,NULL),(1,191,NULL,NULL,NULL),(1,190,NULL,NULL,NULL),(1,189,NULL,NULL,NULL),(1,84,1,1,1),(1,195,NULL,NULL,NULL),(1,199,NULL,NULL,NULL),(1,213,NULL,NULL,NULL),(1,198,NULL,NULL,NULL),(1,197,NULL,NULL,NULL),(1,229,NULL,NULL,NULL),(1,228,NULL,NULL,NULL),(1,227,NULL,NULL,NULL),(1,226,NULL,NULL,NULL),(1,225,NULL,NULL,NULL),(1,224,NULL,NULL,NULL),(1,223,NULL,NULL,NULL),(1,222,NULL,NULL,NULL),(1,221,NULL,NULL,NULL),(1,220,NULL,NULL,NULL),(1,219,NULL,NULL,NULL),(1,217,NULL,NULL,NULL),(1,218,NULL,NULL,NULL),(1,216,NULL,NULL,NULL),(1,215,NULL,NULL,NULL),(1,214,NULL,NULL,NULL),(1,196,NULL,NULL,NULL),(1,200,NULL,NULL,NULL),(1,201,NULL,NULL,NULL),(1,202,NULL,NULL,NULL),(1,203,NULL,NULL,NULL),(1,204,NULL,NULL,NULL),(1,205,NULL,NULL,NULL),(1,206,NULL,NULL,NULL),(1,207,NULL,NULL,NULL),(1,208,NULL,NULL,NULL),(1,209,NULL,NULL,NULL),(1,210,NULL,NULL,NULL),(1,211,NULL,NULL,NULL),(1,212,NULL,NULL,NULL),(1,137,NULL,NULL,NULL),(2,179,NULL,1,NULL),(2,178,NULL,NULL,NULL),(2,180,NULL,1,NULL);
/*!40000 ALTER TABLE `think_role_node` ENABLE KEYS */;

#
# Structure for table "think_role_user"
#

DROP TABLE IF EXISTS `think_role_user`;
CREATE TABLE `think_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_role_user"
#

/*!40000 ALTER TABLE `think_role_user` DISABLE KEYS */;
INSERT INTO `think_role_user` VALUES (4,'27'),(4,'26'),(5,'31'),(3,'22'),(1,'55'),(1,'4'),(1,'3'),(1,'35'),(1,'36'),(1,'54'),(2,'3'),(1,'53'),(7,'36'),(1,'2'),(1,'52'),(1,'51'),(1,'50'),(2,'2'),(7,'2'),(1,'49'),(1,'48'),(1,'44'),(1,'43'),(1,'42'),(1,'41'),(1,'1'),(1,'56'),(1,'57'),(1,'58'),(1,'59'),(1,'60'),(1,'61'),(1,'62');
/*!40000 ALTER TABLE `think_role_user` ENABLE KEYS */;

#
# Structure for table "think_schedule"
#

DROP TABLE IF EXISTS `think_schedule`;
CREATE TABLE `think_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `content` text,
  `location` varchar(50) DEFAULT '',
  `priority` int(11) DEFAULT NULL,
  `actor` varchar(200) DEFAULT '',
  `user_id` int(11) DEFAULT '0',
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `add_file` varchar(200) DEFAULT '',
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

#
# Data for table "think_schedule"
#

/*!40000 ALTER TABLE `think_schedule` DISABLE KEYS */;
INSERT INTO `think_schedule` VALUES (43,'新建事项','','123123',3,'',1,'2013-03-01','05:00:00','2013-03-01','05:00:00','',0),(44,'qqqqqqqqqqqqqq','','',3,'',1,'2013-04-25','05:00:00','2013-03-13','05:00:00','',0),(45,'看看日程中文样式效果','','',3,'',1,'2013-05-07','08:00:00','2013-05-07','05:00:00','',0),(46,'123456','xxx','1234',3,'管理员 / 总经理 ✕|undefined;演示 / 部长 ✕|undefined;员工 / 经理1 ✕|undefined;',1,'2013-07-03','05:00:00','2013-07-18','05:00:00','',0),(47,'123','123123','123',3,'',1,'2013-08-15','05:00:00','2013-08-15','05:00:00','',0),(48,'234','','',3,'',1,'2013-08-15','05:00:00','2013-08-16','05:00:00','',0),(49,'456','','234234',3,'',1,'2013-08-15','05:00:00','2013-08-15','05:00:00','',0),(50,'5677','','',3,'',1,'2013-08-15','05:00:00','2013-08-30','05:00:00','',0),(51,'123456','114474','',3,'',1,'2013-08-15','05:00:00','2013-08-31','05:00:00','',0),(52,'123352435','3234234234','2342342',3,'',1,'2013-08-15','05:00:00','2013-08-15','05:00:00','',0),(53,'给幼儿园老师送礼','','',4,'',1,'2013-09-12','05:00:00','2013-09-21','05:00:00','',0),(54,'给幼儿园老师送礼','给幼儿园老师送礼','',5,'',1,'2013-09-12','05:00:00','2013-09-21','05:00:00','',0),(55,'123123','2312312312','',3,'XX企业|undefined;管理员 / 主管 |undefined;演示 / 总监 |undefined;员工 / 副总 |undefined;',1,'2013-09-03','05:00:00','2013-09-12','05:00:00','',0),(56,'\t主题','','',2,'',2,'2013-09-19','05:00:00','2013-09-19','05:00:00','',0),(57,'12123','1231231','1',3,'',1,'2013-09-28','05:00:00','2013-09-30','05:00:00','',0),(58,'123123','123123','123',3,'',1,'2013-09-12','05:00:00','2013-09-25','05:00:00','',0),(59,'34134','','',2,'',1,'2013-09-12','05:00:00','2013-09-25','05:00:00','',0),(60,'123123','','',2,'',1,'2013-09-12','05:00:00','2013-09-25','05:00:00','',0),(61,'123123','','',1,'',1,'2013-09-12','05:00:00','2013-09-18','05:00:00','',0),(62,'12312','23123','123',3,'',1,'2013-09-11','05:00:00','2013-09-03','05:00:00','',0),(63,'下午开会','<span style=\"white-space:nowrap;\">下午开会</span>','',3,'',1,'2013-11-12','05:00:00','2013-11-12','05:00:00','',0),(64,'1231','123123123','123',3,'',42,'2013-11-13','05:00:00','2013-11-15','05:00:00','',0),(65,'12314512313','','',3,'',1,'2014-02-18','05:00:00','2014-02-18','05:00:00','1044;',0);
/*!40000 ALTER TABLE `think_schedule` ENABLE KEYS */;

#
# Structure for table "think_supplier"
#

DROP TABLE IF EXISTS `think_supplier`;
CREATE TABLE `think_supplier` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `letter` varchar(50) DEFAULT '',
  `short` varchar(30) DEFAULT '',
  `account` varchar(20) DEFAULT '',
  `tax_no` varchar(20) DEFAULT '',
  `payment` varchar(20) DEFAULT NULL,
  `contact` varchar(20) NOT NULL DEFAULT '',
  `office_tel` varchar(20) DEFAULT NULL,
  `mobile_tel` varchar(20) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `im` varchar(20) DEFAULT '',
  `address` varchar(50) DEFAULT '',
  `user_id` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` text,
  `fax` varchar(255) DEFAULT NULL,
  `user_name` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "think_supplier"
#

/*!40000 ALTER TABLE `think_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `think_supplier` ENABLE KEYS */;

#
# Structure for table "think_system_config"
#

DROP TABLE IF EXISTS `think_system_config`;
CREATE TABLE `think_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(255) DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_config"
#

/*!40000 ALTER TABLE `think_system_config` DISABLE KEYS */;
INSERT INTO `think_system_config` VALUES (1,'SYSTEM_NAME','系统名称','小微企业信息化',0),(7,'UPLOAD_FILE_TYPE','上传文件类型','doc,docx,xls,xlsx,ppt,pptx,pdf,gif,png,tif,zip,rar,jpg,jpeg,txt',0);
/*!40000 ALTER TABLE `think_system_config` ENABLE KEYS */;

#
# Structure for table "think_system_folder"
#

DROP TABLE IF EXISTS `think_system_folder`;
CREATE TABLE `think_system_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `admin` varchar(200) NOT NULL,
  `write` varchar(200) NOT NULL,
  `read` varchar(200) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_folder"
#

/*!40000 ALTER TABLE `think_system_folder` DISABLE KEYS */;
INSERT INTO `think_system_folder` VALUES (21,0,'DocFolder','公司制度','管理员/主管|admin;','','','A1',0,''),(22,0,'DocFolder','公司表格','','','','A3',0,''),(23,0,'DocFolder','系统使用手册','','','管理员/主管|admin;','A2',0,''),(25,0,'ForumFolder','员工之家','演示 / 总监 |demo;员工 / 副总 |member;管理员 / 主管 |admin;','','XX企业|dept_1;','',0,''),(26,0,'NoticeFolder','人事令','管理员 / 总经理 |admin;','','','',0,''),(27,0,'ForumFolder','CCC','','','','',0,''),(28,0,'NoticeFolder','培训通知','管理员 / 主管 |admin;','','','',0,''),(29,0,'NoticeFolder','放假通知','','','','',0,''),(33,0,'ForumFolder','ABC','','','','',0,'');
/*!40000 ALTER TABLE `think_system_folder` ENABLE KEYS */;

#
# Structure for table "think_system_tag"
#

DROP TABLE IF EXISTS `think_system_tag`;
CREATE TABLE `think_system_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_tag"
#

/*!40000 ALTER TABLE `think_system_tag` DISABLE KEYS */;
INSERT INTO `think_system_tag` VALUES (11,0,'Video','所属科室','11',''),(12,11,'Video','外科系统','12',''),(13,11,'Video','内科系统','13',''),(14,12,'Video','普通外科','14',''),(15,12,'Video','肛肠科','15',''),(16,11,'Video','专科中心','16',''),(17,11,'Video','医技辅助','17',''),(18,12,'Video','肝胆外科','18',''),(19,12,'Video','器官移植','19',''),(20,12,'Video','心血管外科','20',''),(21,12,'Video','显微外科','21',''),(22,12,'Video','胸外科','22',''),(23,12,'Video','泌尿生殖','23',''),(24,12,'Video','神经外科','24',''),(25,12,'Video','烧伤外科','25',''),(26,13,'Video','普通内科','26',''),(27,13,'Video','心血管内科','27',''),(28,13,'Video','呼吸内科','28',''),(29,13,'Video','消化内科','29',''),(30,13,'Video','肾内科','30',''),(31,13,'Video','血液科','31',''),(32,13,'Video','神经内科','32',''),(33,13,'Video','心理、精神科','33',''),(34,13,'Video','内分泌科','34',''),(35,13,'Video','感染传染','35',''),(36,16,'Video','妇产科','36',''),(37,16,'Video','儿科','37',''),(38,16,'Video','口腔科','38',''),(39,16,'Video','骨科','39',''),(40,16,'Video','皮肤病与性病科','40',''),(41,16,'Video','眼科','41',''),(42,16,'Video','耳鼻咽喉科','42',''),(43,16,'Video','肿瘤及核医学','43',''),(44,16,'Video','中医及中西医结合','44',''),(45,16,'Video','麻醉科','45',''),(46,16,'Video','美容整形','46',''),(47,17,'Video','门、急诊，ICU','47',''),(48,17,'Video','医学影像','48',''),(49,17,'Video','护理','49',''),(50,17,'Video','检验科','50',''),(51,17,'Video','康复理疗科','51',''),(52,17,'Video','药剂科','52',''),(53,17,'Video','信息科','53',''),(54,17,'Video','医院管理','54',''),(55,17,'Video','基础教学','55',''),(56,17,'Video','其他','56',''),(57,0,'Customer','123','',''),(58,0,'Supplier','123','',''),(59,0,'Doc','123123','123123',''),(60,0,'Doc','123123','',''),(61,0,'Doc','abc','',''),(62,0,'Customer','2345','',''),(63,0,'Customer','qqqqqq','',''),(64,0,'Customer','22222','',''),(65,0,'Customer','22222','','');
/*!40000 ALTER TABLE `think_system_tag` ENABLE KEYS */;

#
# Structure for table "think_system_tag_data"
#

DROP TABLE IF EXISTS `think_system_tag_data`;
CREATE TABLE `think_system_tag_data` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  KEY `row_id` (`row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_system_tag_data"
#

/*!40000 ALTER TABLE `think_system_tag_data` DISABLE KEYS */;
INSERT INTO `think_system_tag_data` VALUES (18,58,'Supplier'),(29,14,'Video'),(18,57,'Customer'),(29,46,'Video'),(30,46,'Video'),(30,47,'Video'),(30,56,'Video'),(64,59,'Doc'),(64,60,'Doc'),(64,61,'Doc'),(65,61,'Doc'),(33,14,'Video'),(18,62,'Customer');
/*!40000 ALTER TABLE `think_system_tag_data` ENABLE KEYS */;

#
# Structure for table "think_todo"
#

DROP TABLE IF EXISTS `think_todo`;
CREATE TABLE `think_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `end_date` varchar(10) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `add_file` varchar(200) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "think_todo"
#

/*!40000 ALTER TABLE `think_todo` DISABLE KEYS */;
INSERT INTO `think_todo` VALUES (11,'邮件整理时显示名称错误','',1,'2014-02-19',2,'',3,2),(12,'日历今天样式颜色','日历今天样式颜色',1,'2013-11-02',3,'',3,1),(13,'12312','123123',2,'3123123',3,'',1,1),(14,'12312','123123123123123123',2,'3123123',3,'',0,NULL),(15,'待办事项确认','待办事项确认',2,'',3,'',0,NULL),(16,'新建待办事项','123',2,'',3,'',2,3),(17,'新建待办事项1','新建待办事项',2,'2013-09-19',3,'',1,2),(18,'新建待办事项','123',2,'2013-09-19',3,'',1,NULL),(19,'优先级高','12312123',1,'2013-09-26',5,'1070;1071;',2,1),(21,'事项优先级低','',1,'2013-10-06',1,'',3,2);
/*!40000 ALTER TABLE `think_todo` ENABLE KEYS */;

#
# Structure for table "think_udf_expense"
#

DROP TABLE IF EXISTS `think_udf_expense`;
CREATE TABLE `think_udf_expense` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL DEFAULT '',
  `B` varchar(20) DEFAULT '',
  `C` varchar(20) DEFAULT '',
  `D` varchar(20) DEFAULT '',
  `E` varchar(20) DEFAULT '',
  `F` varchar(20) DEFAULT '',
  `G` varchar(20) DEFAULT '',
  `H` varchar(20) DEFAULT '',
  `I` varchar(20) DEFAULT '',
  `J` varchar(20) DEFAULT '',
  `K` varchar(20) DEFAULT '',
  `L` varchar(20) DEFAULT '',
  `M` varchar(20) DEFAULT '',
  `N` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_expense"
#

/*!40000 ALTER TABLE `think_udf_expense` DISABLE KEYS */;
INSERT INTO `think_udf_expense` VALUES (152,'1003','201310','张三','业招待费','1500','500','5','','','','','','',''),(153,'1003','201310','张三','通行费','','','','','','','','','',''),(154,'1003','201310','张三','交通费','','','','','','','','','',''),(155,'1003','201310','李四','业招待费','1500','500','5','','','','','','',''),(157,'1003','201310','李四','交通费','','','','','','','','','','');
/*!40000 ALTER TABLE `think_udf_expense` ENABLE KEYS */;

#
# Structure for table "think_udf_salary"
#

DROP TABLE IF EXISTS `think_udf_salary`;
CREATE TABLE `think_udf_salary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL DEFAULT '',
  `B` varchar(20) DEFAULT '',
  `C` varchar(20) DEFAULT '',
  `D` varchar(20) DEFAULT '',
  `E` varchar(20) DEFAULT '',
  `F` varchar(20) DEFAULT '',
  `G` varchar(20) DEFAULT '',
  `H` varchar(20) DEFAULT '',
  `I` varchar(20) DEFAULT '',
  `J` varchar(20) DEFAULT '',
  `K` varchar(20) DEFAULT '',
  `L` varchar(20) DEFAULT '',
  `M` varchar(20) DEFAULT '',
  `N` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_salary"
#

/*!40000 ALTER TABLE `think_udf_salary` DISABLE KEYS */;
INSERT INTO `think_udf_salary` VALUES (120,'1001','201310','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(121,'1002','201310','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(122,'1003','201310','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(123,'1004','201310','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(124,'1005','201310','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(125,'1006','201310','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(126,'1007','201310','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(127,'1008','201310','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(128,'1009','201310','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(129,'1010','201310','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(130,'1011','201310','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(131,'1012','201310','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(132,'1013','201310','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(133,'1014','201310','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(134,'1015','201310','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(135,'1016','201310','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(136,'1001','201210','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(137,'1002','201210','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(138,'1003','201210','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(139,'1004','201210','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(140,'1005','201210','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(141,'1006','201210','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(142,'1007','201210','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(143,'1008','201210','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(144,'1009','201210','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(145,'1010','201210','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(146,'1011','201210','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(147,'1012','201210','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(148,'1013','201210','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(149,'1014','201210','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(150,'1015','201210','张三','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL),(151,'1016','201210','李四','1000','500',NULL,'1500','150','100','5','50','100','2200',NULL);
/*!40000 ALTER TABLE `think_udf_salary` ENABLE KEYS */;

#
# Structure for table "think_user"
#

DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(10) NOT NULL,
  `emp_name` varchar(20) NOT NULL,
  `letter` varchar(10) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` int(8) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `duty` varchar(2000) NOT NULL,
  `office_tel` varchar(20) NOT NULL,
  `mobile_tel` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `westatus` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`emp_no`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

#
# Data for table "think_user"
#

/*!40000 ALTER TABLE `think_user` DISABLE KEYS */;
INSERT INTO `think_user` VALUES (1,'admin','管理员','GLY','21232f297a57a5a743894a0e4a801fc3',10,1,2,'male','2013-09-18','0.0.0.0',2130,'emp_pic/1.jpeg','smeoa@qq.com','1231254123123','123123','12123123',1222907803,1393294981,0,'1231512315123',1),(41,'2002','总监2002','ZJ','4ba29b9f9e5732ed33761840f4ba6c53',6,3,1,'male','2013-10-30','127.0.0.1',NULL,'','','行政，财务','','',1376896154,1392969462,0,NULL,NULL),(42,'2001','总监2001','ZJ','d0fb963ff976f9c37fc81fe03c21ea7b',8,3,1,'male','2013-10-10','0.0.0.0',NULL,'','','开发','123','12312312',1380970837,1392969455,0,NULL,NULL),(43,'2003','总监2003','ZJ','a591024321c5e2bdbd23ed35f0574dde',7,3,1,'male','0000-00-00','127.0.0.1',NULL,'emp_pic/43.jpeg','','销售','','',1381035116,1392969472,0,NULL,NULL),(44,'1001','总经理1001','ZJL','202cb962ac59075b964b07152d234b70',5,5,1,'male','0000-00-00','0.0.0.0',NULL,'','','全面管理','','',1381502796,1392969440,0,NULL,NULL),(48,'1003','副总1003','FZ','aa68c75c4a77c87f97fb686b2f068676',5,4,1,'female','0000-00-00','127.0.0.1',NULL,'','','销售，运营','','',1381503490,1392969447,0,NULL,NULL),(49,'3001','经理3001','JL','908c9a564a86426585b29f5335b619bc',10,2,2,'male','2013-10-10','0.0.0.0',NULL,'','','财务','123','12312312',1391694170,1392969482,0,NULL,NULL),(50,'3002','经理3002','JL','d806ca13ca3449af72a1ea5aedbed26a',4,2,2,'male','2013-10-10',NULL,NULL,'','','人事','123','12312312',1391694193,1392969489,0,NULL,NULL),(51,'3003','经理3003','JL','a4380923dd651c195b1631af7c829187',9,2,2,'male','2013-10-10',NULL,NULL,'','','销售-南方区域','123','12312312',1391694198,1392969496,0,NULL,NULL),(52,'3004','经理3004','JL','20479c788fb27378c2c99eadcf207e7f',3,3,2,'male','2013-10-10',NULL,NULL,'','','新产品研发','123','12312312',1391694202,1391695215,0,NULL,NULL),(53,'3005','经理3005','JL','3a61ed715ee66c48bacf237fa7bb5289',2,3,2,'male','2013-10-10',NULL,NULL,'','','电商运营','123','12312312',1391694263,1391695233,0,NULL,NULL),(54,'3006','经理3006','JL','5f268dfb0fbef44de0f668a022707b86',5,2,2,'male','2013-10-10',NULL,NULL,'','','总经理助理','123','12312312',1391694302,1391695285,0,NULL,NULL),(55,'5001','员工5001','YG','03b264c595403666634ac75d828439bc',10,1,3,'male','2013-10-10','0.0.0.0',NULL,'','','会计','123','12312312',1391694320,1391695329,0,NULL,NULL),(56,'5007','员工5007','YG','351869bde8b9d6ad1e3090bd173f600d',8,1,3,'male','2013-10-10',NULL,NULL,'','','程序员3','123','12312312',1391694335,1391695509,0,NULL,NULL),(57,'5002','员工5002','YG','415585bd389b69659223807d77a96791',10,1,3,'male','2013-10-10',NULL,NULL,'','','出纳','123','12312312',1391694413,1391695356,0,NULL,NULL),(58,'5003','员工5003','YG','240ac9371ec2671ae99847c3ae2e6384',4,1,3,'male','2013-10-10',NULL,NULL,'','','招聘，薪资管理','123','12312312',1391694420,1391695396,0,NULL,NULL),(59,'5004','员工5004','YG','3202111cf90e7c816a472aaceb72b0df',5,1,3,'male','2013-10-10',NULL,NULL,'','','负责公司日常采购','123','12312312',1391694427,1391695451,0,NULL,NULL),(60,'5005','员工5005','YG','1d6408264d31d453d556c60fe7d0459e',8,1,3,'male','2013-10-10',NULL,NULL,'','','程序员1','123','12312312',1391694435,1391695475,0,NULL,NULL),(61,'5006','员工5006','YG','2c27a260f16ad3098393cc529f391f4a',8,1,3,'male','2013-10-10',NULL,NULL,'','','程序员2','123','12312312',1391694478,1391695488,0,NULL,NULL),(62,'5008','员工5008','YG','b3848d61bbbc6207c6668a8a9e2730ed',2,1,3,'male','2013-10-10',NULL,NULL,'','','网站编辑，SEO','123','12312312',1391694489,1391695553,0,NULL,NULL);
/*!40000 ALTER TABLE `think_user` ENABLE KEYS */;

#
# Structure for table "think_user_config"
#

DROP TABLE IF EXISTS `think_user_config`;
CREATE TABLE `think_user_config` (
  `id` int(11) NOT NULL DEFAULT '0',
  `home_sort` varchar(255) DEFAULT NULL,
  `list_rows` int(11) DEFAULT '20',
  `readed_notice` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_user_config"
#

/*!40000 ALTER TABLE `think_user_config` DISABLE KEYS */;
INSERT INTO `think_user_config` VALUES (1,'11,22,13,|21,12,23,',10,'47|1383898012_46|1383896478_48|1383898426_49|1384830291_'),(49,NULL,20,NULL),(50,NULL,20,NULL),(51,NULL,20,NULL),(52,NULL,20,NULL),(53,NULL,20,NULL),(54,NULL,20,NULL),(55,NULL,20,NULL),(56,NULL,20,NULL),(57,NULL,20,NULL),(58,NULL,20,NULL),(59,NULL,20,NULL),(60,NULL,20,NULL),(61,NULL,20,NULL),(62,NULL,20,NULL);
/*!40000 ALTER TABLE `think_user_config` ENABLE KEYS */;

#
# Structure for table "think_user_folder"
#

DROP TABLE IF EXISTS `think_user_folder`;
CREATE TABLE `think_user_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "think_user_folder"
#

/*!40000 ALTER TABLE `think_user_folder` DISABLE KEYS */;
INSERT INTO `think_user_folder` VALUES (30,0,'MailFolder',1,'123','',0,'');
/*!40000 ALTER TABLE `think_user_folder` ENABLE KEYS */;

#
# Structure for table "think_user_tag"
#

DROP TABLE IF EXISTS `think_user_tag`;
CREATE TABLE `think_user_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "think_user_tag"
#

/*!40000 ALTER TABLE `think_user_tag` DISABLE KEYS */;
INSERT INTO `think_user_tag` VALUES (18,0,'Contact',1,'222222','',''),(19,0,'Contact',1,'333333','','');
/*!40000 ALTER TABLE `think_user_tag` ENABLE KEYS */;

#
# Structure for table "think_user_tag_data"
#

DROP TABLE IF EXISTS `think_user_tag_data`;
CREATE TABLE `think_user_tag_data` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  KEY `row_id` (`row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_user_tag_data"
#

/*!40000 ALTER TABLE `think_user_tag_data` DISABLE KEYS */;
INSERT INTO `think_user_tag_data` VALUES (10,19,'Contact'),(11,19,'Contact'),(9,18,'Contact');
/*!40000 ALTER TABLE `think_user_tag_data` ENABLE KEYS */;

#
# Structure for table "think_work_log"
#

DROP TABLE IF EXISTS `think_work_log`;
CREATE TABLE `think_work_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `content` text,
  `plan` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "think_work_log"
#

INSERT INTO `think_work_log` VALUES (1,1,NULL,'<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">1. 工作内容</span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\"></span>\r\n</p>','<p>\r\n\t工作计划\r\n</p>\r\n工作计划\r\n<p>\r\n\t \r\n</p>\r\n工作计划\r\n<p>\r\n\t \r\n</p>\r\n工作计划\r\n<p>\r\n\t \r\n</p>\r\n工作计划\r\n<p>\r\n\t \r\n</p>\r\n工作计划\r\n<p>\r\n\t \r\n</p>\r\n工作计划\r\n<p>\r\n\t \r\n</p>\r\n工作计划工作计划\r\n<p>\r\n\t \r\n</p>','2014-02-03','2014-02-07',0),(2,1,NULL,'<p>\r\n\t新建工作日志\r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>','<p>\r\n\t新建工作日志\r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>\r\n新建工作日志\r\n<p>\r\n\t \r\n</p>','2014-01-28','2014-02-14',0);
