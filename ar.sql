/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.57 : Database - ar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ar` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ar`;

/*Table structure for table `activity` */

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `act_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '活动标识',
  `act_name` varchar(20) NOT NULL COMMENT '活动名称',
  `act_place` varchar(50) NOT NULL COMMENT '活动地点',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `act_desc` text NOT NULL COMMENT '活动描述',
  `act_num` int(4) NOT NULL COMMENT '活动人数',
  `sign_num` int(4) DEFAULT NULL COMMENT '报名人数',
  `interests` int(4) DEFAULT NULL COMMENT '感兴趣数',
  `leader_name` varchar(10) NOT NULL COMMENT '负责人姓名',
  `leader_phone` varchar(30) NOT NULL COMMENT '负责人联系方式',
  `origin_id` int(8) NOT NULL COMMENT '活动所属组织标识',
  `user_id` int(8) NOT NULL COMMENT '活动创建者标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`act_id`) USING BTREE,
  KEY `FK_ACTIVITY_USERID` (`user_id`) USING BTREE,
  KEY `FK_ACTIVITY_ORIGINID` (`origin_id`) USING BTREE,
  CONSTRAINT `FK_ACTIVITY_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACTIVITY_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `activity` */

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `addr_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '地址标识',
  `province` varchar(10) NOT NULL COMMENT '省份',
  `city` varchar(10) NOT NULL COMMENT '城市',
  `district` varchar(10) NOT NULL COMMENT '区域',
  `detail` varchar(50) NOT NULL COMMENT '详细地址',
  `zip_code` char(6) DEFAULT NULL COMMENT '邮编',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  PRIMARY KEY (`addr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `address` */

insert  into `address`(`addr_id`,`province`,`city`,`district`,`detail`,`zip_code`,`create_time`,`state`,`state_time`) values (1,'陕西','汉中','汉台','陕西理工大学','221000','2020-03-22 00:04:40','A','2020-03-22 00:04:40');

/*Table structure for table `album` */

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `album_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '相册标识',
  `album_name` varchar(20) NOT NULL COMMENT '相册名称',
  `album_desc` varchar(200) DEFAULT NULL COMMENT '相册描述，少于200字符',
  `cover_image` varchar(255) NOT NULL COMMENT '相册封面图片路径',
  `interests` int(4) DEFAULT '0' COMMENT '感兴趣数',
  `origin_id` int(8) NOT NULL COMMENT '相册所属组织标识',
  `user_id` int(8) NOT NULL COMMENT '相册创建者标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`album_id`) USING BTREE,
  KEY `FK_ALBUM_USERID` (`user_id`) USING BTREE,
  KEY `FK_ALBUM_ORIGINID` (`origin_id`) USING BTREE,
  CONSTRAINT `FK_ALBUM_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`),
  CONSTRAINT `FK_ALBUM_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `album` */

insert  into `album`(`album_id`,`album_name`,`album_desc`,`cover_image`,`interests`,`origin_id`,`user_id`,`create_time`,`state`,`state_time`,`exp1`,`exp2`) values (1,'第十届飞思卡尔','一起参加比赛的日子','assets/images/photos/media2.png',0,8,2,'2020-03-29 21:46:24','A','2020-03-29 21:46:24','',NULL),(2,'单片机设计大赛','51单片机好有意思','assets/images/photos/media6.png',0,8,3,'2020-03-29 21:46:24','A','2020-03-29 21:46:24',NULL,NULL),(3,'院校联赛','走出校门，比试比试','assets/images/photos/media4.png',0,8,4,'2020-03-29 21:46:24','A','2020-03-29 21:46:24',NULL,NULL),(4,'汉江之旅','玩耍','assets/images/example/ablum-cover/media-audio.png',0,8,5,'2020-03-29 21:46:24','A','2020-03-29 21:46:24',NULL,NULL),(5,'全国大学生电子设计大赛','省赛','assets/images/example/ablum-cover/media-audio.png',0,8,34,'2020-03-29 21:46:24','A','2020-03-29 21:46:24',NULL,NULL),(15,'adsf','','/ar/pic/upload//2017/05/10/73723bd1-9892-49ce-9388-0a8c16b4017c.png',0,14,2,'2020-03-29 21:46:24','A','2020-03-29 21:46:24',NULL,NULL),(16,'毕业典礼','','/ar/pic/upload//2017/05/11/cd8a188d-1eea-4386-9859-2e74e7402f1e.png',0,14,5,'2020-03-29 21:46:24','A','2020-03-29 21:46:24',NULL,NULL),(17,'出游','','/ar/pic/upload//2017/05/12/d9985656-128e-4321-b887-d4c6b7827688.jpg',0,14,5,'2020-03-29 21:46:24','A','2020-03-29 21:46:24',NULL,NULL);

/*Table structure for table `album_image` */

DROP TABLE IF EXISTS `album_image`;

CREATE TABLE `album_image` (
  `album_id` int(8) NOT NULL,
  `image_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  KEY `FK_ALBUM_IMAGE_ALBUMID` (`album_id`) USING BTREE,
  KEY `FK_ALBUM_IMAGE_IMAGEID` (`image_id`) USING BTREE,
  CONSTRAINT `FK_ALBUM_IMAGE_ALBUMID` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ALBUM_IMAGE_IMAGEID` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `album_image` */

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `atta_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件标识',
  `atta_type` varchar(20) NOT NULL COMMENT '附件类型',
  `atta_name` varchar(32) NOT NULL COMMENT '附件名称',
  `is_remote` char(1) NOT NULL COMMENT '是否远程文件',
  `file_size` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `file_path` varchar(255) NOT NULL COMMENT '文件路径',
  `downloads` int(4) NOT NULL COMMENT '下载次数',
  `create_time` datetime NOT NULL COMMENT '上传时间',
  `exp_time` datetime DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`atta_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `attachment` */

/*Table structure for table `attachment_info` */

DROP TABLE IF EXISTS `attachment_info`;

CREATE TABLE `attachment_info` (
  `attachment_id` int(11) NOT NULL COMMENT '附件标识',
  `info_id` int(11) NOT NULL COMMENT '附主信息标识',
  KEY `FK_ATTACHMENT_ATTA_ATTACHMENTID` (`attachment_id`) USING BTREE,
  KEY `FK_ATTACHMENT_INFO_INFOID` (`info_id`) USING BTREE,
  CONSTRAINT `FK_ATTACHMENT_ATTA_ATTACHMENTID` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`atta_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ATTACHMENT_INFO_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `attachment_info` */

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏标识',
  `create_time` datetime NOT NULL,
  `info_id` int(11) NOT NULL,
  `user_id` int(8) NOT NULL,
  `state` char(2) NOT NULL,
  `state_time` datetime DEFAULT NULL,
  PRIMARY KEY (`collect_id`) USING BTREE,
  KEY `FK_COLLECT_USERID` (`user_id`) USING BTREE,
  KEY `FK_COLLECT_INFOID` (`info_id`) USING BTREE,
  CONSTRAINT `FK_COLLECT_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`),
  CONSTRAINT `FK_COLLECT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `collect` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论标识',
  `content` varchar(500) NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `user_id` int(8) NOT NULL COMMENT '评论人标识',
  `info_id` int(11) NOT NULL COMMENT '信息标识',
  PRIMARY KEY (`comment_id`) USING BTREE,
  KEY `FK_COMMENT_USERID` (`user_id`) USING BTREE,
  KEY `FK_COMMENT_INFOID` (`info_id`) USING BTREE,
  CONSTRAINT `FK_COMMENT_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`),
  CONSTRAINT `FK_COMMENT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `comment` */

insert  into `comment`(`comment_id`,`content`,`create_time`,`user_id`,`info_id`) values (22,'抢沙发','2020-01-01 11:49:24',4,12),(23,'我来喽','2020-01-01 11:55:58',4,8),(24,'hhha ','2020-01-01 15:25:52',4,14),(25,'哈哈','2020-01-01 15:29:12',4,14),(26,'呵呵呵你们','2020-01-01 15:32:27',4,14),(27,'再来一次','2020-01-01 15:48:56',4,14),(28,'可以了吧','2020-01-01 15:55:07',4,14),(29,'阿桑福德恭喜发财','2020-01-01 16:09:48',4,16),(30,'考查课自行车vj','2020-01-01 16:37:42',4,20),(31,'hehhe','2020-01-01 17:40:58',4,20),(32,'我来了','2020-01-01 21:33:56',2,20),(33,'回复 2楼  陈两：你说的不错哦','2020-01-01 21:34:11',2,20),(34,'1楼','2021-02-10 20:12:37',3,29),(36,'3楼','2021-02-10 20:13:21',3,29),(37,'4楼','2021-02-10 21:10:39',4,29),(38,'5楼','2021-02-10 21:10:57',5,29),(39,'6楼','2021-02-10 21:11:11',6,29),(40,'7楼','2021-02-10 21:11:27',4,29),(42,'9楼','2021-02-10 21:11:53',3,29),(43,'10楼','2021-02-10 21:12:05',4,29),(44,'11楼','2021-02-10 21:12:19',5,29),(45,'12楼','2021-02-10 21:12:29',6,29),(46,'13楼','2021-02-10 21:12:41',3,29),(47,'14楼','2021-02-10 21:12:54',2,29),(48,'15楼','2021-02-10 21:13:10',4,29),(49,'16楼','2021-02-10 21:13:23',5,29),(50,'17楼','2021-02-10 21:13:37',6,29),(51,'18楼','2021-02-10 21:13:51',2,29),(52,'19楼','2021-02-10 21:14:09',3,29),(53,'20楼','2021-02-10 21:14:23',4,29),(54,'21楼','2021-02-10 21:14:35',5,29),(55,'22楼','2021-02-10 21:14:46',6,29),(57,'作为自发、非盈利性活动平台，羽毛球俱乐部活动收取的相关费用只用于支付场租、购羽毛球、交流赛等各项支出。作为自发集体活动，组织方只负责召集、联络工作。凡参加活动的人员，均视为具有完全独立民事行为能力人，须对自身的安全及健康状况负责。活动中所发生的意外，俱乐部不承担任何法律连带责任。以任何形式参加本俱乐部为主体召集的活动，都将被视为同意以上免责声明，如有异议切勿参加，以免造成不必要的法律纠纷。俱乐部成员间私下发起、开展相关活动所产生的一切后果，亦与俱乐部无关。','2021-02-10 23:19:55',2,29),(58,'抢一楼','2021-02-10 23:24:05',2,28),(59,'回复 #9 珍妮：回复一下试试','2021-02-10 23:38:43',2,29),(60,'2楼也是我的','2021-02-11 10:00:12',2,28),(61,'再盖一楼','2021-02-12 19:25:59',4,29),(62,'盖一楼','2021-02-23 14:40:03',2,34),(63,'再来一楼','2021-02-23 14:40:25',2,34),(64,'三楼来了','2021-02-23 15:44:08',2,34),(65,'hehe','2021-02-25 14:30:16',2,33),(66,'爱上的风格','2021-02-25 16:22:53',2,34),(67,'zailiyilou','2021-02-25 16:43:42',2,34),(68,'呵呵','2021-02-25 16:44:31',2,15),(69,'第二楼','2021-02-25 16:47:53',2,15),(70,'评论一下','2021-02-28 14:17:51',262,29),(71,'来一发','2021-02-28 12:19:18',309,28),(72,'冒泡','2021-02-28 14:33:29',119,29),(73,'抢楼了','2021-03-03 21:51:24',125,58),(74,'回复 #2 布莱克：','2021-03-05 17:53:23',5,34),(75,'很不錯的帖子','2021-03-08 16:22:18',5,29),(76,'uds','2021-03-11 23:58:23',304,77),(77,'回复 #1 陈雷雷：的液体v','2021-03-11 23:58:34',304,77),(78,'sdsg','2021-03-17 15:33:55',2,84),(79,'盖楼了','2021-03-17 15:39:27',2,93),(80,'盖楼了','2021-03-17 15:42:09',2,93),(81,'盖楼了','2021-03-17 15:42:45',2,85),(82,'再来一层','2021-03-17 15:53:05',2,85),(83,'再来一发','2021-03-18 08:41:52',2,93),(84,'抢沙发','2021-03-18 08:43:30',2,67),(85,'要工作了','2021-03-18 13:48:52',154,94),(87,'盖楼了','2021-03-18 14:31:43',4,91),(89,'二楼抢沙发','2021-03-19 17:26:25',271,91),(90,'思念是一种毒药','2021-03-19 17:29:25',271,78),(91,'蹭热度','2021-03-19 17:35:07',271,23),(92,'系统不错','2021-03-19 23:08:51',268,97),(93,'值得表扬','2021-03-19 23:08:58',268,97),(94,'克隆空间','2021-03-19 23:14:27',268,106),(95,'的','2021-04-13 22:43:21',2,28);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `dict_value` varchar(20) NOT NULL COMMENT '字典值，固定，不可变',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名',
  `remark` varchar(200) DEFAULT NULL COMMENT '字典备注',
  PRIMARY KEY (`dict_value`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `dictionary` */

insert  into `dictionary`(`dict_value`,`dict_name`,`remark`) values ('at','相册类型','album type, 相册的分类， 班级相册，校友组织分类'),('in','消息类型','information的类型，新闻/班级动态/帖子/校友动态/捐赠信息/系统留言'),('it','图片类型',''),('ny','[是]/[否] 字段填写','根据字典值 dictdata 显示 是/否'),('ot','组织类型','班级/校友组织  等团体的类型'),('r','角色定义','role definition, 定义站内各个用户的角色'),('sex','性别','性别属性，1：男；0：女。'),('state','数据的状态',''),('t','消息主题','帖子主题[主题帖、话题帖、IT]'),('tf','置顶处理','top flag');

/*Table structure for table `dictionary_data` */

DROP TABLE IF EXISTS `dictionary_data`;

CREATE TABLE `dictionary_data` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `dict_value` varchar(20) NOT NULL,
  `dictdata_name` varchar(50) NOT NULL,
  `dictdata_value` varchar(20) NOT NULL,
  `is_fixed` char(1) NOT NULL COMMENT ' 0不固定，1固定；固定就不能再去修改了',
  `is_cancel` char(1) DEFAULT NULL COMMENT '取消标识',
  `parent_id` int(8) DEFAULT NULL COMMENT '父节点，作为简单的树形结构',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_DICTIONARYDATA_DICTVALUE` (`dict_value`) USING BTREE,
  CONSTRAINT `FK_DICTIONARYDATA_DICTVALUE` FOREIGN KEY (`dict_value`) REFERENCES `dictionary` (`dict_value`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `dictionary_data` */

insert  into `dictionary_data`(`id`,`dict_value`,`dictdata_name`,`dictdata_value`,`is_fixed`,`is_cancel`,`parent_id`) values (4,'state','正常','A','1',NULL,NULL),(5,'state','删除','X','1',NULL,NULL),(6,'state','异常','E','1',NULL,NULL),(25,'ny','否','0','1',NULL,NULL),(26,'ny','是','1','1',NULL,NULL),(31,'tf','置顶','1','1',NULL,NULL),(32,'tf','不置顶','0','1',NULL,NULL),(84,'state','未审核','D','1',NULL,NULL),(85,'state','已审核','S','1',NULL,NULL),(89,'ot','班级','C','1',NULL,NULL),(90,'t','旅游','t','1',NULL,NULL),(91,'t','就业','j','1',NULL,NULL),(92,'t','研讨','yt','1',NULL,NULL),(93,'in','班级动态','CI','1',NULL,NULL),(94,'sex','男','1','1',NULL,NULL),(95,'sex','女','0','1',NULL,NULL),(96,'in','校园服务','SS','1',NULL,NULL),(97,'ot','学院','INS','1',NULL,NULL),(99,'in','论坛帖子','BBS','1',NULL,NULL),(102,'ot','院系分会','orgi','1',NULL,NULL),(103,'ot','社团分会','orgm','1',NULL,NULL),(104,'ot','学生协会','orgu','1',NULL,NULL),(105,'ot','校友组织','OI','1',NULL,NULL),(106,'in','班级留言','CM','1',NULL,NULL),(107,'in','校友组织留言','OM','1',NULL,NULL),(108,'it','相册图片','AI','1',NULL,NULL),(109,'it','头像','PI','1',NULL,NULL),(110,'it','信息图片','II','1',NULL,NULL),(111,'in','校友新闻','AN','1',NULL,NULL),(112,'t','毕业','gra','1',NULL,NULL),(113,'t','工作','job','1',NULL,NULL),(114,'t','校友','an','1',NULL,NULL),(115,'state','冻结','E','1',NULL,NULL);

/*Table structure for table `grade` */

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `grade_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '年级标识',
  `grade_value` char(4) NOT NULL COMMENT '年级值',
  `class_num` int(4) NOT NULL COMMENT '班级数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `grade` */

insert  into `grade`(`grade_id`,`grade_value`,`class_num`,`create_time`,`state`,`state_time`) values (1,'2012',3,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(2,'2013',2,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(3,'2014',1,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(4,'2015',1,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(5,'2016',1,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(6,'2011',3,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(7,'2010',6,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(8,'2009',7,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(9,'2020',8,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(10,'2019',3,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(11,'2018',12,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(12,'2017',2,'2020-03-29 21:46:24','A','2020-03-29 21:46:24');

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片标识',
  `image_name` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `is_remote` char(1) DEFAULT NULL COMMENT '是否远程文件',
  `image_size` varchar(5) DEFAULT NULL COMMENT '图片大小',
  `image_path` varchar(255) NOT NULL COMMENT '图片路径',
  `image_type` varchar(20) DEFAULT NULL COMMENT '图片类型，图文信息的图片/头像/相册图片',
  `is_thumb` char(1) DEFAULT NULL COMMENT '是否生成缩略图',
  `thumb_path` varchar(255) DEFAULT NULL COMMENT '缩略图路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`image_id`) USING BTREE,
  KEY `image_id` (`image_id`,`image_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `image` */

insert  into `image`(`image_id`,`image_name`,`is_remote`,`image_size`,`image_path`,`image_type`,`is_thumb`,`thumb_path`,`create_time`,`state`,`state_time`) values (1,'snut.png',NULL,NULL,'assets/images/logo/snut.png',NULL,NULL,NULL,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(2,'nan.png',NULL,NULL,'assets/images/logo/nan.png',NULL,NULL,NULL,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(3,'nv.png',NULL,NULL,'assets/images/logo/nv.png',NULL,NULL,NULL,'2020-03-29 21:46:24','A','2020-03-29 21:46:24'),(4,NULL,NULL,NULL,'/ar-res/pic/portrait/user6.png',NULL,NULL,NULL,'2020-03-29 21:46:24','A','2020-03-29 21:46:24');

/*Table structure for table `information` */

DROP TABLE IF EXISTS `information`;

CREATE TABLE `information` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息标识',
  `info_title` varchar(50) DEFAULT '' COMMENT '信息标题',
  `content` text NOT NULL COMMENT '内容',
  `theme` varchar(20) DEFAULT '' COMMENT '主题',
  `thumb_image` varchar(255) DEFAULT '' COMMENT '图文信息缩略图',
  `views` int(4) DEFAULT '0' COMMENT '浏览量',
  `comments` int(4) DEFAULT '0' COMMENT '评论数',
  `loves` int(4) DEFAULT '0' COMMENT '分享次数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_top` char(1) NOT NULL DEFAULT '0' COMMENT '指定标志位',
  `info_type` varchar(20) NOT NULL COMMENT '信息类型',
  `user_id` int(8) NOT NULL COMMENT '信息发布者标识',
  `origin_id` int(8) DEFAULT NULL COMMENT '发布信息的组织',
  `state` char(2) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `FK_INFORMATION_USERID` (`user_id`) USING BTREE,
  KEY `FK_INFORMATION_ORIGINID` (`origin_id`) USING BTREE,
  CONSTRAINT `FK_INFORMATION_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_INFORMATION_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `information` */

insert  into `information`(`info_id`,`info_title`,`content`,`theme`,`thumb_image`,`views`,`comments`,`loves`,`create_time`,`is_top`,`info_type`,`user_id`,`origin_id`,`state`,`state_time`) values (1,'刚找到工作，不容易','作为一名当代大学生，我十分骄傲地找到了一份门卫的工作，从此以后，我的人生也就扬帆起航了','tr','/img/info/blog1.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',4,1,'A','2020-03-29 21:47:24'),(2,'我是个逗逼','我是个逗逼',NULL,'/img/info/c245b47c-f52f-4337-86df-004f0e4a269a.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',2,1,'A','2020-03-29 21:47:24'),(3,'再试试吧','再试试吧',NULL,'/img/info/2e6d2a47-da2c-4a82-8bfc-7b236d859b0c.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',3,1,'A','2020-03-29 21:47:24'),(6,'今天阳光明媚，带着媳','今天阳光明媚，带着媳妇儿出去春游了，春风和煦，时光静好，生活难得的惬意',NULL,'/img/info/331580e0-71ca-4fe5-973e-4c5ca3c23d24.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',5,1,'A','2020-03-29 21:47:24'),(7,'哈哈','哈哈',NULL,'',0,0,0,'2020-03-29 21:46:24','0','CI',6,1,'A','2020-03-29 21:47:24'),(8,'多个方面呢，就好vjhbv','多个方面呢，就好vjhbv',NULL,'/img/info/ce0f7497-cae2-472a-abba-f7a3c1727613.png',0,1,0,'2020-03-29 21:46:24','0','CI',4,1,'A','2020-03-29 21:47:24'),(9,'哈哈，这就是帅气的我','哈哈，这就是帅气的我',NULL,'/img/info/154e714d-ba5d-4d02-a158-a19d03eb9855.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',7,1,'A','2020-03-29 21:47:24'),(10,'呵呵呵','呵呵呵',NULL,'/img/info/c15ddfde-ae9e-4fdc-93bc-616cb91dbfb0.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',4,1,'A','2020-03-29 21:47:24'),(11,'和S科学家离开vsk','和S科学家离开vskcvcmkccb',NULL,'/img/info/c6cd32a4-e979-49a6-975e-ac3343637c91.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',9,1,'A','2020-03-29 21:47:24'),(12,'双方的股份回购名','双方的股份回购名',NULL,NULL,0,1,0,'2020-03-29 21:46:24','0','CI',4,1,'A','2020-03-29 21:47:24'),(13,'你说我人品怎么样\r\n还可以吧','你说我人品怎么样\r\n还可以吧',NULL,'/img/info/e7f8430a-9973-4319-ad74-8efd30a6f1ac.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',9,1,'A','2020-03-29 21:47:24'),(14,'奥德赛vhasild','奥德赛vhasildj oaiSJl c ASDlL  jlkzdj flkzj 就 ｌｊ　ｌｊ　ｓｄｌｊｆｚｓｌｊ　ｆｄｊ　ｆｌ　ｊ　ｌｊ　ｌｊｌ　ｉｌｕ　ｉｊｊｊｋｋＯＬ　ＪＯ　ｏ　ｋ就开始离开家阿隆索飞机乘客来说ｖｊｌ路径 SJDcLDS',NULL,NULL,0,5,0,'2020-03-29 21:46:24','0','CI',4,1,'A','2020-03-29 21:47:24'),(15,'谔谔同花顺俄而是是忽','谔谔同花顺俄而是是忽然怀念和健康　看空间就',NULL,NULL,0,2,0,'2020-03-29 21:46:24','0','CI',123,2,'A','2020-03-29 21:47:24'),(16,'iwoqujsqAK;L','iwoqujsqAK;L',NULL,NULL,0,1,0,'2020-03-29 21:46:24','0','CI',4,1,'A','2020-03-29 21:47:24'),(17,'爱克发haskfhds.j快来','爱克发haskfhds.j快来',NULL,NULL,0,0,0,'2020-03-29 21:46:24','0','CI',4,1,'A','2020-03-29 21:47:24'),(18,'恶搞无法打败你后悔','恶搞无法打败你后悔',NULL,NULL,0,0,0,'2020-03-29 21:46:24','0','CI',21,1,'A','2020-03-29 21:47:24'),(19,'快点放假萨拉丁福利激发机卡分离','快点放假萨拉丁福利激发机卡分离',NULL,NULL,0,0,0,'2020-03-29 21:46:24','0','CI',4,1,'A','2020-03-29 21:47:24'),(20,'uyjumntbsrvsc','uyjumntbsrvsc',NULL,'/img/info/c09cf1d4-37a0-427f-8c9c-bd2d28c0f2f8.jpg',0,4,0,'2020-03-29 21:46:24','0','CI',123,1,'A','2020-03-29 21:47:24'),(21,NULL,'black在这留言',NULL,NULL,0,0,0,'2020-03-29 21:46:24','0','CM',2,3,'A','2020-03-29 21:47:24'),(22,NULL,'留言测试',NULL,NULL,0,0,0,'2020-03-29 21:46:24','0','CM',2,3,'A','2020-03-29 21:47:24'),(23,'厉害了我的哥','厉害了我的哥',NULL,NULL,2,1,0,'2020-03-29 21:46:24','0','CI',2,4,'A','2020-03-29 21:47:24'),(24,'我是一个梦想家','我是一个梦想家',NULL,NULL,0,0,0,'2020-03-29 21:46:24','0','CI',2,3,'A','2020-03-29 21:47:24'),(25,NULL,'我来了，让我听到你们的声音',NULL,NULL,0,0,0,'2020-03-29 21:46:24','0','CM',2,4,'A','2020-03-29 21:47:24'),(26,'校园行指南','校园行指南校园行指南校园行指南校园行指南',NULL,NULL,5,9,0,'2020-03-29 21:46:24','0','SS',1,1,'A','2020-03-29 21:47:24'),(27,'走进校园','走进校园走进校园走进校园走进校园走进校园',NULL,NULL,3,8,0,'2020-03-29 21:46:24','0','SS',1,1,'A','2020-03-29 21:47:24'),(28,'校友论坛规章制度','严格遵守','AZ',NULL,37,4,2,'2020-03-29 21:46:24','0','BBS',1,NULL,'A','2020-03-29 21:47:24'),(29,'欢天喜地的校庆','欢天喜地的校庆欢天喜地的校庆欢天喜地的校庆\n欢天喜地的校庆\n欢天喜地的校庆\n欢天喜地的校庆\n欢天喜地的校庆\n欢天喜地的校庆\n欢天喜地的校庆\n欢天喜地的校庆','ZA','/ar/pic/upload/2017/05/18/ac4f40f3-d68c-49ea-a8d2-b56a7ff328d4.jpg',327,29,30,'2020-03-29 21:46:24','0','BBS',2,NULL,'A','2020-03-29 21:47:24'),(32,'','DEBUG测试','','',0,0,0,'2020-03-29 21:46:24','0','CM',2,3,'A','2020-03-29 21:47:24'),(33,'出现BUG了，好烦啊','出现BUG了，好烦啊','','',0,1,0,'2020-03-29 21:46:24','0','CI',2,3,'A','2020-03-29 21:47:24'),(34,'智能车协会公告','不能闷骚','','',73,6,2,'2020-03-29 21:46:24','1','OI',2,8,'A','2020-03-29 21:47:24'),(41,'Come On Baby Go','Let me hear you say','','',10,0,0,'2020-03-29 21:46:24','0','OI',2,8,'A','2020-03-29 21:47:24'),(42,'','留言测试','','',0,0,0,'2020-03-29 21:46:24','0','OM',2,8,'X','2020-03-29 21:47:24'),(43,'','ceshi2','','',0,0,0,'2020-03-29 21:46:24','0','OM',2,8,'A','2020-03-29 21:47:24'),(44,'','第一个留言 ----black','','',0,0,0,'2020-03-29 21:46:24','0','CM',2,2,'A','2020-03-29 21:47:24'),(45,'','自动糊班级是一个神奇的存在','','',0,0,0,'2020-03-29 21:46:24','0','CM',4,4,'A','2020-03-29 21:47:24'),(46,'周一下午班级聚会','周一下午班级聚会','','',0,0,0,'2020-03-29 21:46:24','0','CI',4,2,'A','2020-03-29 21:47:24'),(47,'班级严禁摆摊','班级严禁摆摊班级严禁摆摊班级严禁摆摊班级严禁摆摊','','',0,0,0,'2020-03-29 21:46:24','0','CI',4,2,'A','2020-03-29 21:47:24'),(48,'我是逗逼','呵呵呵','','',0,0,0,'2020-03-29 21:46:24','0','CI',5,3,'A','2020-03-29 21:47:24'),(49,'','董亮亮回班级来看看了','','',0,0,0,'2020-03-29 21:46:24','0','CM',4,3,'A','2020-03-29 21:47:24'),(50,'贺一飞前来报到','我是一个大太阳，浑身充满正能量','','',0,0,0,'2020-03-29 21:46:24','0','CI',262,2,'A','2020-03-29 21:47:24'),(51,'班级聚会','不V鼓鼓囊囊 vc大发慈悲不vs的是谁发的号码你不单纯I度噢迪接啊爱看哦我剖大家来看但判断是否刚才V会比较','','',0,0,0,'2020-03-29 21:46:24','0','OI',262,8,'A','2020-03-29 21:47:24'),(52,'','官方公会很高  对方vc是的浮现出V没机会故事大全二手房的规划和郭德纲方便改变中断过ds fg','','',0,0,0,'2020-03-29 21:46:24','0','OM',262,8,'A','2020-03-29 21:47:24'),(53,'我的学院我做主','还记得在信电学院的青葱岁月。','','',0,0,0,'2020-03-29 21:46:24','0','OI',122,7,'A','2020-03-29 21:47:24'),(54,'哈哈，开心的大学生活','开心的不要不要的','','',3,0,0,'2020-03-29 21:46:24','1','OI',122,7,'A','2020-03-29 21:47:24'),(55,'','我来也','','',0,0,0,'2020-03-29 21:46:24','0','OM',122,7,'A','2020-03-29 21:47:24'),(56,'','小杰来报道','','',0,0,0,'2020-03-29 21:46:24','0','OM',125,7,'A','2020-03-29 21:47:24'),(57,'','哈哈','','',0,0,0,'2020-03-29 21:46:24','0','OM',6,8,'A','2020-03-29 21:47:24'),(58,'新帖子，冒个泡','猫跑了，冒泡了','','',10,1,1,'2020-03-29 21:46:24','1','BBS',119,NULL,'A','2020-03-29 21:47:24'),(59,'爱玩了','的说法不V你那边','','',0,0,0,'2020-03-29 21:46:24','0','OI',119,8,'A','2020-03-29 21:47:24'),(60,'呵呵','地超看到法国不能发生的','','',0,0,0,'2020-03-29 21:46:24','0','OI',119,8,'A','2020-03-29 21:47:24'),(61,'啊师傅规范化','阿尔法狗好呢','','',1,0,0,'2020-03-29 21:46:24','0','OI',119,8,'A','2020-03-29 21:47:24'),(62,'','哈啊哈','','',0,0,0,'2020-03-29 21:46:24','0','CM',122,2,'A','2020-03-29 21:47:24'),(63,'快乐的日子','哥好久没跟你告白','','/ar/pic/info/1ebe4dbe-1eff-4176-861c-ca4ff746cfbb.png',0,0,1,'2020-03-29 21:46:24','0','CI',122,2,'A','2020-03-29 21:47:24'),(64,'','留言了','','',0,0,0,'2020-03-29 21:46:24','0','CM',122,4,'A','2020-03-29 21:47:24'),(65,'到此一游','我来了','','',0,0,0,'2020-03-29 21:46:24','0','CI',122,4,'A','2020-03-29 21:47:24'),(66,'','我是逗逼','','',0,0,0,'2020-03-29 21:46:24','0','OM',5,8,'A','2020-03-29 21:47:24'),(67,'新帖发一枚','喜欢上了工作','','',6,1,1,'2020-03-29 21:46:24','0','BBS',125,NULL,'A','2020-03-29 21:47:24'),(68,'第一发','第一条动态消息','','',0,0,0,'2020-03-29 21:46:24','0','CI',5,14,'A','2020-03-29 21:47:24'),(69,'','逗逼到此一游','','',0,0,0,'2020-03-29 21:46:24','0','CM',5,14,'A','2020-03-29 21:47:24'),(70,'Come On Baby Go','一起嗨过的日子','','',0,0,0,'2020-03-29 21:46:24','1','CI',5,2,'A','2020-03-29 21:47:24'),(71,'士大夫','士大夫但是个','','',0,0,0,'2020-03-29 21:46:24','0','CI',2,14,'A','2020-03-29 21:47:24'),(72,'春游','开心的不要不要的！','','/ar/pic/upload//2017/05/09/882269c8-8897-46d7-83ca-a1377ba74845.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',5,14,'A','2020-03-29 21:47:24'),(73,'秋游了','开心的不行啊','','/ar/pic/upload//2017/05/10/3c45fc59-2257-4227-9843-c08d1b16be19.jpg',0,0,0,'2020-03-29 21:46:24','0','CI',5,14,'A','2020-03-29 21:47:24'),(74,'夏令营了','水水的，开开心心！','','/ar/pic/upload//2017/05/10/ca2bebf0-ed27-4b5c-81dd-fa19dc5db16d.jpg',1,0,0,'2020-03-29 21:46:24','0','CI',5,14,'A','2020-03-29 21:47:24'),(75,'毕业了','毕业好开心','','/ar/pic/upload//2017/05/11/bd1a8b98-a18c-4be4-8c55-58d5389c74f2.jpg',6,0,5,'2020-03-29 21:46:24','0','CI',35,14,'A','2020-03-29 21:47:24'),(76,'毕设答辩','答辩好激动啊','','/ar/pic/upload//2017/05/11/0b1918fd-5ffe-40c2-aa21-1f8413031144.jpg',20,1,6,'2020-03-29 21:46:24','1','CI',35,14,'A','2020-03-29 21:47:24'),(77,'工作好累','毕业之后即将参加工作，好累啊','','/ar/pic/upload//2017/05/11/04a403ad-a722-407e-b712-a507549afa9e.jpg',9,2,1,'2020-03-29 21:46:24','0','CI',304,14,'A','2020-03-29 21:47:24'),(78,'毕业季，回忆我们一起走过的大学四年','风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁','','/ar/pic/upload//2017/05/09/882269c8-8897-46d7-83ca-a1377ba74845.jpg',44,26,23,'2020-03-29 21:46:24','0','BBS',2,NULL,'A','2020-03-29 21:47:24'),(81,'陕西理工大学成功举办 --------','恭喜陕西理工大学 ****----恭喜陕西理工大学 ****----恭喜陕西理工大学 ****----恭喜陕西理工大学 ****----\r\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----','','/ar_portal_war/assets/images/logo/title-logo.jpg',68,3245,24,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(82,'恭喜陕西理工大学 ****----','恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----\n恭喜陕西理工大学 ****----恭喜陕西理工大学 ****----恭喜陕西理工大学 ****----恭喜陕西理工大学 ****----','','/ar_portal_war/assets/images/logo/title-logo.jpg',223,2349,124,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(83,'我校成功承办2021年 ***','我校成功承办2021年 ***\r\n我校成功承办2021年 ***我校成功承办2021年 **\r\n我校成功承办2021年 ***\r\n我校成功承办2021年 ***\n我校成功承办2021年 ***\n我校成功承办2021年 ***\n我校成功承办2021年 ***我校成功承办2021年 ***我校成功承办2021年 ***','','/ar_portal_war/assets/images/logo/title-logo.jpg',12,2345,123,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(84,'宁波市招聘-----','宁波市招聘-----\n宁波市招聘-----\n宁波市招聘-----\n宁波市招聘-----\n宁波市招聘-----\n宁波市招聘-----\n宁波市招聘-----\n宁波市招聘-----\n宁波市招聘-----\n宁波市招聘-----','','/ar_portal_war/assets/images/logo/title-logo.jpg',237,248,124,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(85,'我校举办运动会','我校举办运动会我校举办运动会我校举办运动会\n我校举办运动会\n我校举办运动会\n我校举办运动会\n我校举办运动会\n我校举办运动会我校举办运动会','','/ar_portal_war/assets/images/logo/title-logo.jpg',23436,2367,25,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(86,'我校举行“五四”升旗仪式','我校举行“五四”升旗仪式','','/ar_portal_war/assets/images/logo/title-logo.jpg',237,49,24,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(88,'去汉中敬老院看望','陕西理工大学成功举办 --------去汉中敬老院看望去汉中敬老院看望去汉中敬老院看望去汉中敬老院看望\n去汉中敬老院看望\n去汉中敬老院看望\n去汉中敬老院看望\n去汉中敬老院看望\n','','',0,0,0,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(89,'陕西理工大学成功举办 --------','陕西理工大学成功举办 --------','','',0,0,0,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(90,'陕西理工大学成功举办 --------','陕西理工大学成功举办 --------','','',1,1,0,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(91,'陕西理工大学成功举办 --------','陕西理工大学成功举办 --------陕西理工大学成功举办 --------陕西理工大学成功举办 --------陕西理工大学成功举办 --------','','',16,2,0,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(92,'陕西理工大学成功举办 --------','陕西理工大学成功举办 --------陕西理工大学成功举办 --------陕西理工大学成功举办 --------\n陕西理工大学成功举办 --------\n陕西理工大学成功举办 --------\n陕西理工大学成功举办 --------\n陕西理工大学成功举办 --------\n陕西理工大学成功举办 --------\n陕西理工大学成功举办 --------陕西理工大学成功举办 --------陕西理工大学成功举办 --------\n陕西理工大学成功举办 --------\n','','',0,0,0,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(93,'陕西理工大学成功举办 --------','陕西理工大学成功举办 --------陕西理工大学成功举办 --------陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------陕西理工大学成功举办 --------陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n','','',9,10,6,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(94,'陕西理工大学举办-------','陕西理工大学举办-------陕西理工大学举办-------陕西理工大学举办-------陕西理工大学举办-------陕西理工大学举办-------陕西理工大学举办-------陕西理工大学举办-------陕西理工大学举办-------','','',6,1,0,'2020-03-29 21:46:24','0','BBS',154,NULL,'A','2020-03-29 21:47:24'),(97,'陕西理工大学成功举办 --------','陕西理工大学成功举办 --------陕西理工大学成功举办 --------陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------陕西理工大学成功举办 --------陕西理工大学成功举办 --------\r\n陕西理工大学成功举办 --------\r\n','','',9,2,2,'2020-03-29 21:46:24','0','AN',1,NULL,'A','2020-03-29 21:47:24'),(98,'毕业旅行','额外热无热无','','',0,0,0,'2020-03-29 21:46:24','0','CI',271,14,'A','2020-03-29 21:47:24'),(99,'','士大夫是否大声道','','',0,0,0,'2020-03-29 21:46:24','0','CM',271,14,'A','2020-03-29 21:47:24'),(100,'','万哥来也','','',0,0,0,'2020-03-29 21:46:24','0','OM',271,7,'A','2020-03-29 21:47:24'),(101,'','万哥来也','','',0,0,0,'2020-03-29 21:46:24','0','OM',271,7,'A','2020-03-29 21:47:24'),(102,'','来也','','',0,0,0,'2020-03-29 21:46:24','0','OM',271,7,'A','2020-03-29 21:47:24'),(103,'','来玩玩','','',0,0,0,'2020-03-29 21:46:24','0','CM',271,2,'A','2020-03-29 21:47:24'),(104,'毕设答辩','明天第三方','','',0,0,0,'2020-03-29 21:46:24','0','CI',268,14,'A','2020-03-29 21:47:24'),(105,'','都比到此一游','','',0,0,0,'2020-03-29 21:46:24','0','CM',268,14,'A','2020-03-29 21:47:24'),(106,'答辩','士大夫都是的','','',6,1,1,'2020-03-29 21:46:24','0','BBS',268,NULL,'A','2020-03-29 21:47:24');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志标识',
  `operator` varchar(100) DEFAULT NULL COMMENT '操作员:id+account+email',
  `oper_name` varchar(100) DEFAULT NULL COMMENT '操作名称',
  `oper_params` varchar(255) DEFAULT NULL COMMENT '操作参数',
  `oper_result` varchar(100) DEFAULT NULL COMMENT '操作结果',
  `result_msg` varchar(500) DEFAULT NULL COMMENT '结果信息',
  `oper_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `log` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言标识',
  `title` varchar(20) NOT NULL COMMENT '留言标题',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `sender_id` int(8) NOT NULL COMMENT '留言人标识',
  `receiver_id` int(8) NOT NULL COMMENT '留言接收人标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`msg_id`) USING BTREE,
  KEY `FK_MESSAGE_SENDER` (`sender_id`) USING BTREE,
  KEY `FK_MESSAGE_RECEIVER` (`receiver_id`) USING BTREE,
  CONSTRAINT `FK_MESSAGE_RECEIVER` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_MESSAGE_SENDER` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `message` */

/*Table structure for table `origin` */

DROP TABLE IF EXISTS `origin`;

CREATE TABLE `origin` (
  `origin_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '组织标识',
  `origin_name` varchar(20) NOT NULL COMMENT '组织名称',
  `origin_type` varchar(20) NOT NULL COMMENT '组织类型',
  `origin_desc` varchar(500) DEFAULT NULL COMMENT '组织描述',
  `origin_grade` char(4) DEFAULT NULL,
  `members` int(4) NOT NULL DEFAULT '0' COMMENT '成员数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `mgr_id` int(8) NOT NULL,
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`origin_id`) USING BTREE,
  KEY `FK_ORIGIN_MGRID` (`mgr_id`) USING BTREE,
  CONSTRAINT `FK_ORIGIN_MGRID` FOREIGN KEY (`mgr_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `origin` */

insert  into `origin`(`origin_id`,`origin_name`,`origin_type`,`origin_desc`,`origin_grade`,`members`,`create_time`,`mgr_id`,`state`,`state_time`,`exp1`,`exp2`) values (1,'陕西理工大学','INS','','',240,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(2,'19计本01','C',NULL,'2019',5,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(3,'19计本02','C','计算机科学与技术','2019',4,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(4,'19计本03','C',NULL,'2019',6,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(5,'数计学院','INS',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(6,'校友总会','org','理工学院校友总会',NULL,1,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(7,'理工工程学院分会','orgi','理工工程学院分会',NULL,6,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(8,'科学协会','orgm','科技引领时代',NULL,8,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(9,'音乐协会','orgm','音乐协会',NULL,1,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(10,'计算机协会','orgm','计算机协会',NULL,1,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(11,'轮滑社','orgm','在这光滑的地面上摩擦',NULL,1,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(12,'手机协会','orgm','手机协会',NULL,2,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(13,'学习部','orgu','督促松弛的同学学习，是我们的目的',NULL,2,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(14,'19计算机2','D','活力四射的班级吗','2013',7,'2020-03-29 21:46:24',4,'A','2020-03-29 21:47:24',NULL,NULL),(15,'物理学院分会','orgi',NULL,NULL,1,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(16,'马克思学院分会','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(17,'化学学院分会','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(18,'美术学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(19,'体育学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(20,'机电学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(21,'自动化学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(22,'人文学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(23,'外国语学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(24,'艺术学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(25,'数学与物理科学学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(26,'机电工程学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(27,'食品工程学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(28,'管理学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(29,'马克思主义学院','orgi',NULL,NULL,0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(30,'14通信','C','','2013',0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(31,'15通信','C','','2013',0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(32,'14计算机','C','','2014',0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(33,'19通信','C','','2015',0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(34,'16通信','C','','2016',0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(35,'17通信','C','','2017',0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL),(36,'17计算机','C','','2017',0,'2020-03-29 21:46:24',1,'A','2020-03-29 21:47:24',NULL,NULL);

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复标识',
  `content` varchar(500) NOT NULL COMMENT '回复内容',
  `create_time` datetime NOT NULL COMMENT '回复时间',
  `user_id` int(8) NOT NULL COMMENT '回复人标识',
  `msg_id` int(11) NOT NULL COMMENT '留言标识',
  PRIMARY KEY (`reply_id`) USING BTREE,
  KEY `FK_REPLY_USERID` (`user_id`) USING BTREE,
  KEY `FK_REPLY_MSGID` (`msg_id`) USING BTREE,
  CONSTRAINT `FK_REPLY_MSGID` FOREIGN KEY (`msg_id`) REFERENCES `message` (`msg_id`),
  CONSTRAINT `FK_REPLY_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `reply` */

/*Table structure for table `right` */

DROP TABLE IF EXISTS `right`;

CREATE TABLE `right` (
  `right_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '权限标识',
  `right_name` varchar(20) DEFAULT NULL COMMENT '权限名',
  `right_pos` int(4) NOT NULL COMMENT '权限位',
  `right_code` bigint(64) NOT NULL COMMENT '权限码',
  `right_URL` varchar(200) NOT NULL COMMENT '权限路径',
  `is_public` char(1) NOT NULL COMMENT '是否公共资源',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`right_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `right` */

insert  into `right`(`right_id`,`right_name`,`right_pos`,`right_code`,`right_URL`,`is_public`,`state`,`state_time`) values (1,'未命名',0,1,'/cm','0','A','2017-05-14 20:44:33'),(2,'未命名',0,2,'/cm/deleteClass','0','A','2017-05-14 20:44:33'),(3,'未命名',0,4,'/cm/queryClass','0','A','2017-05-14 20:44:33'),(4,'未命名',0,8,'/cm/excepClass','0','A','2017-05-14 20:44:33'),(5,'未命名',0,16,'/cm/recoverClass','0','A','2017-05-14 20:44:33'),(6,'未命名',0,32,'/cm/removeClass','0','A','2017-05-14 20:44:34'),(7,'未命名',0,64,'/crm','0','A','2017-05-14 20:44:34'),(8,'未命名',0,128,'/dict/getAllDicts','0','A','2017-05-14 20:44:34'),(9,'未命名',0,256,'/dict/updateDict','0','A','2017-05-14 20:44:34'),(10,'未命名',0,512,'/dict/deleteDict','0','A','2017-05-14 20:44:34'),(11,'未命名',0,1024,'/dict/queryDicts','0','A','2017-05-14 20:44:34'),(12,'未命名',0,2048,'/dict/indexDict','0','A','2017-05-14 20:44:34'),(13,'未命名',0,4096,'/dict/addDict','0','A','2017-05-14 20:44:34'),(14,'未命名',0,8192,'/dict/addDictSubmit','0','A','2017-05-14 20:44:34'),(15,'未命名',0,16384,'/dict/updateDictSubmit','0','A','2017-05-14 20:44:34'),(16,'未命名',0,32768,'/dictData/queryDictData','0','A','2017-05-14 20:44:34'),(17,'未命名',0,65536,'/dictData/indexDictData','0','A','2017-05-14 20:44:34'),(18,'未命名',0,131072,'/dictData/addDictData','0','A','2017-05-14 20:44:34'),(19,'未命名',0,262144,'/dictData/addDictDataSubmit','0','A','2017-05-14 20:44:34'),(20,'未命名',0,524288,'/flat/createFlat','0','A','2017-05-14 20:44:34'),(21,'未命名',0,1048576,'/flat/createFlatSubmit','0','A','2017-05-14 20:44:34'),(22,'未命名',0,2097152,'/job/recoverJob','0','A','2017-05-14 20:44:34'),(23,'未命名',0,4194304,'/job/createJob','0','A','2017-05-14 20:44:34'),(24,'未命名',0,8388608,'/job/deleteJob','0','A','2017-05-14 20:44:34'),(25,'未命名',0,16777216,'/job/setTopJob','0','A','2017-05-14 20:44:34'),(26,'未命名',0,33554432,'/job/auditJobs','0','A','2017-05-14 20:44:34'),(27,'未命名',0,67108864,'/job/auditJob','0','A','2017-05-14 20:44:34'),(28,'未命名',0,134217728,'/job/queryJobs','0','A','2017-05-14 20:44:34'),(29,'未命名',0,268435456,'/job/removeJobs','0','A','2017-05-14 20:44:34'),(30,'未命名',0,536870912,'/job/deleteJobs','0','A','2017-05-14 20:44:34'),(31,'未命名',0,1073741824,'/job/cancelTopJob','0','A','2017-05-14 20:44:34'),(32,'未命名',0,2147483648,'/job/removeJob','0','A','2017-05-14 20:44:34'),(33,'未命名',0,4294967296,'/job/recoverJobs','0','A','2017-05-14 20:44:34'),(34,'未命名',0,8589934592,'/job/detailJob','0','A','2017-05-14 20:44:34'),(35,'未命名',0,17179869184,'/job','0','A','2017-05-14 20:44:34'),(36,'未命名',0,34359738368,'/job/createJobSubmit','0','A','2017-05-14 20:44:34'),(37,'未命名',0,68719476736,'/manage','0','A','2017-05-14 20:44:34'),(38,'未命名',0,137438953472,'/error/{errCode}','0','A','2017-05-14 20:44:34'),(39,'未命名',0,274877906944,'/manage/welcome','0','A','2017-05-14 20:44:34'),(40,'未命名',0,549755813888,'/right/queryRights','0','A','2017-05-14 20:44:34'),(41,'未命名',0,1099511627776,'/right/updateRight','0','A','2017-05-14 20:44:34'),(42,'未命名',0,2199023255552,'/right/addRight','0','A','2017-05-14 20:44:34'),(43,'未命名',0,4398046511104,'/right/indexRight','0','A','2017-05-14 20:44:34'),(44,'未命名',0,8796093022208,'/right/scanAddRights','0','A','2017-05-14 20:44:34'),(45,'未命名',0,17592186044416,'/right/updateRightSubmit','0','A','2017-05-14 20:44:34'),(46,'班级录',0,35184372088832,'/class','1','A','2017-05-14 20:44:34'),(47,'班级录-查询班级',0,70368744177664,'/class/queryClasses','1','A','2017-05-14 20:44:34'),(48,'班级录',0,140737488355328,'/class/outlineClass','1','A','2017-05-14 20:44:34'),(49,'未命名',0,281474976710656,'/classroom/member','0','A','2017-05-14 20:44:34'),(50,'未命名',0,562949953421312,'/classroom/message','0','A','2017-05-14 20:44:34'),(51,'班级录-班级主页',0,1125899906842624,'/classroom','1','A','2017-05-14 20:44:34'),(52,'未命名',0,2251799813685248,'/classroom/directory','0','A','2017-05-14 20:44:34'),(53,'未命名',0,4503599627370496,'/classroom/info','0','A','2017-05-14 20:44:34'),(54,'未命名',0,9007199254740992,'/classroom/description','0','A','2017-05-14 20:44:34'),(55,'未命名',0,18014398509481984,'/classroom/setDescription','0','A','2017-05-14 20:44:34'),(56,'未命名',0,36028797018963968,'/classroom/album/update','0','A','2017-05-14 20:44:34'),(57,'未命名',0,72057594037927936,'/classroom/album/delete','0','A','2017-05-14 20:44:34'),(58,'未命名',0,144115188075855872,'/classroom/album/image','0','A','2017-05-14 20:44:34'),(59,'未命名',0,288230376151711744,'/classroom/album','0','A','2017-05-14 20:44:35'),(60,'未命名',0,576460752303423488,'/classroom/album/save','0','A','2017-05-14 20:44:35'),(61,'未命名',0,1152921504606846976,'/classroom/joinClass','0','A','2017-05-14 20:44:35'),(62,'未命名',1,1,'/classroom/album/add','0','A','2017-05-14 20:44:35'),(63,'未命名',1,2,'/classroom/infoSide','0','A','2017-05-14 20:44:35'),(64,'未命名',1,4,'/classroom/album/edit','0','A','2017-05-14 20:44:35'),(65,'未命名',1,8,'/classroom/commentInfo','0','A','2017-05-14 20:44:35'),(66,'未命名',1,16,'/classroom/infoDetail','0','A','2017-05-14 20:44:35'),(67,'未命名',1,32,'/classroom/album/image/upload','0','A','2017-05-14 20:44:35'),(68,'未命名',1,64,'/classroom/album/cover','0','A','2017-05-14 20:44:35'),(69,'未命名',1,128,'/classroom/album/upload','0','A','2017-05-14 20:44:35'),(70,'未命名',1,256,'/classroom/album/image/delete','0','A','2017-05-14 20:44:35'),(71,'未命名',1,512,'/classroom/publishClassInfo','0','A','2017-05-14 20:44:35'),(72,'未命名',1,1024,'/classroom/publishClassMessage','0','A','2017-05-14 20:44:35'),(73,'未命名',1,2048,'/classroom/infoCommentList','0','A','2017-05-14 20:44:35'),(74,'未命名',1,4096,'/forum','0','A','2017-05-14 20:44:35'),(75,'未命名',1,8192,'/post/add','0','A','2017-05-14 20:44:35'),(76,'未命名',1,16384,'/post/save','0','A','2017-05-14 20:44:35'),(77,'未命名',1,32768,'/post/delete','0','A','2017-05-14 20:44:35'),(78,'未命名',1,65536,'/post/comment','0','A','2017-05-14 20:44:35'),(79,'未命名',1,131072,'/post/detail','0','A','2017-05-14 20:44:35'),(80,'未命名',1,262144,'/post/deleteComment','0','A','2017-05-14 20:44:35'),(81,'未命名',1,524288,'/post/commentList','0','A','2017-05-14 20:44:35'),(82,'未命名',1,1048576,'/post/love','0','A','2017-05-14 20:44:35'),(83,'未命名',1,2097152,'/login/val','1','A','2017-05-14 20:44:35'),(84,'未命名',1,4194304,'/login/validate','1','A','2017-05-14 20:44:35'),(85,'未命名',1,8388608,'/login/logout','1','A','2017-05-14 20:44:35'),(86,'未命名',1,16777216,'/login','1','A','2017-05-14 20:44:35'),(87,'未命名',1,33554432,'/index','0','A','2017-05-14 20:44:35'),(88,'未命名',1,67108864,'/download','0','A','2017-05-14 20:44:35'),(89,'未命名',1,134217728,'/my/account','0','A','2017-05-14 20:44:35'),(90,'未命名',1,268435456,'/my/class','0','A','2017-05-14 20:44:35'),(91,'未命名',1,536870912,'/my','0','A','2017-05-14 20:44:35'),(92,'未命名',1,1073741824,'/my/forum','0','A','2017-05-14 20:44:35'),(93,'未命名',1,2147483648,'/my/recruit','0','A','2017-05-14 20:44:35'),(94,'未命名',1,4294967296,'/my/resume','0','A','2017-05-14 20:44:35'),(95,'未命名',1,8589934592,'/my/resume/delete','0','A','2017-05-14 20:44:35'),(96,'未命名',1,17179869184,'/my/resume/update','0','A','2017-05-14 20:44:35'),(97,'未命名',1,34359738368,'/my/resume/detail','0','A','2017-05-14 20:44:35'),(98,'未命名',1,68719476736,'/my/resume/postResume','0','A','2017-05-14 20:44:35'),(99,'未命名',1,137438953472,'/my/resume/edit','0','A','2017-05-14 20:44:35'),(100,'未命名',1,274877906944,'/my/resume/addResume','0','A','2017-05-14 20:44:35'),(101,'未命名',1,549755813888,'/my/resume/addResumeSubmit','0','A','2017-05-14 20:44:35'),(102,'未命名',1,1099511627776,'/my/profile/basic','0','A','2017-05-14 20:44:35'),(103,'未命名',1,2199023255552,'/my/profile/detail','0','A','2017-05-14 20:44:35'),(104,'未命名',1,4398046511104,'/my/profile/portrait','0','A','2017-05-14 20:44:35'),(105,'未命名',1,8796093022208,'/my/profile/job','0','A','2017-05-14 20:44:35'),(106,'未命名',1,17592186044416,'/ta/show','0','A','2017-05-14 20:44:35'),(107,'未命名',1,35184372088832,'/news','0','A','2017-05-14 20:44:35'),(108,'未命名',1,70368744177664,'/org','0','A','2017-05-14 20:44:35'),(109,'未命名',1,140737488355328,'/org/union','0','A','2017-05-14 20:44:35'),(110,'未命名',1,281474976710656,'/org/mass','0','A','2017-05-14 20:44:35'),(111,'未命名',1,562949953421312,'/org/outline','0','A','2017-05-14 20:44:35'),(112,'未命名',1,1125899906842624,'/org/institute','0','A','2017-05-14 20:44:35'),(113,'未命名',1,2251799813685248,'/orgroom/member','0','A','2017-05-14 20:44:35'),(114,'未命名',1,4503599627370496,'/orgroom/message','0','A','2017-05-14 20:44:35'),(115,'未命名',1,9007199254740992,'/orgroom','0','A','2017-05-14 20:44:35'),(116,'未命名',1,18014398509481984,'/orgroom/directory','0','A','2017-05-14 20:44:36'),(117,'未命名',1,36028797018963968,'/orgroom/info','0','A','2017-05-14 20:44:36'),(118,'未命名',1,72057594037927936,'/orgroom/deleteInfo','0','A','2017-05-14 20:44:36'),(119,'未命名',1,144115188075855872,'/orgroom/album/image','0','A','2017-05-14 20:44:36'),(120,'未命名',1,288230376151711744,'/orgroom/album','0','A','2017-05-14 20:44:36'),(121,'未命名',1,576460752303423488,'/orgroom/loveInfo','0','A','2017-05-14 20:44:36'),(122,'未命名',1,1152921504606846976,'/orgroom/joinOrigin','0','A','2017-05-14 20:44:36'),(123,'未命名',2,1,'/orgroom/infoSide','0','A','2017-05-14 20:44:36'),(124,'未命名',2,2,'/orgroom/commentInfo','0','A','2017-05-14 20:44:36'),(125,'未命名',2,4,'/orgroom/infoDetail','0','A','2017-05-14 20:44:36'),(126,'未命名',2,8,'/orgroom/publishInfo','0','A','2017-05-14 20:44:36'),(127,'未命名',2,16,'/orgroom/infoCommentList','0','A','2017-05-14 20:44:36'),(128,'未命名',2,32,'/orgroom/publishMessage','0','A','2017-05-14 20:44:36'),(129,'未命名',2,64,'/recruit','0','A','2017-05-14 20:44:36'),(130,'未命名',2,128,'/recruit/addRecruit','0','A','2017-05-14 20:44:36'),(131,'未命名',2,256,'/recruit/detailRecruit','0','A','2017-05-14 20:44:36'),(132,'未命名',2,512,'/recruit/addRecruitSubmit','0','A','2017-05-14 20:44:36'),(133,'未命名',2,1024,'/recruit/recruitSuccess','0','A','2017-05-14 20:44:36'),(134,'未命名',2,2048,'/unit/selectUnit','0','A','2017-05-14 20:44:36'),(135,'未命名',2,4096,'/unit/addUnit','0','A','2017-05-14 20:44:36'),(136,'未命名',2,8192,'/unit/addUnitSubmit','0','A','2017-05-14 20:44:36'),(137,'未命名',2,16384,'/service','0','A','2017-05-14 20:44:36'),(138,'未命名',2,32768,'/service/school','0','A','2017-05-14 20:44:36'),(139,'未命名',2,65536,'/info/add','0','A','2017-05-18 21:33:06'),(140,'未命名',2,131072,'/info/save','0','A','2017-05-18 21:33:06'),(141,'未命名',2,262144,'/info','0','A','2017-05-18 21:33:06'),(142,'未命名',2,524288,'/info/update','0','A','2017-05-18 21:33:06'),(143,'未命名',2,1048576,'/info/queryInfo','0','A','2017-05-18 21:33:06'),(144,'未命名',2,2097152,'/my/account/password/update','0','A','2017-05-18 21:33:07'),(145,'未命名',2,4194304,'/my/account/password','0','A','2017-05-18 21:33:07'),(146,'未命名',2,8388608,'/my/account/email','0','A','2017-05-18 21:33:07'),(147,'未命名',2,16777216,'/my/account/email/update','0','A','2017-05-18 21:33:07'),(148,'未命名',2,33554432,'/my/forum/delete','0','A','2017-05-18 21:33:07'),(149,'未命名',2,67108864,'/my/recruit/delete','0','A','2017-05-18 21:33:07'),(150,'未命名',2,134217728,'/my/resume/cancel','0','A','2017-05-18 21:33:07'),(151,'未命名',2,268435456,'/my/resume/posted','0','A','2017-05-18 21:33:07'),(152,'未命名',2,536870912,'/my/profile/job/add','0','A','2017-05-18 21:33:07'),(153,'未命名',2,1073741824,'/my/profile/job/delete.action','0','A','2017-05-18 21:33:07'),(154,'未命名',2,2147483648,'/my/profile/portrait/upload.action','0','A','2017-05-18 21:33:07'),(155,'未命名',2,4294967296,'/my/profile/basic/update','0','A','2017-05-18 21:33:07'),(156,'未命名',2,8589934592,'/news/comment','0','A','2017-05-18 21:33:07'),(157,'未命名',2,17179869184,'/news/detail','0','A','2017-05-18 21:33:07'),(158,'未命名',2,34359738368,'/news/commentList','0','A','2017-05-18 21:33:07'),(159,'未命名',2,68719476736,'/news/outline','0','A','2017-05-18 21:33:07'),(160,'未命名',2,137438953472,'/info/delete','0','A','2017-05-19 16:52:07'),(161,'未命名',2,274877906944,'/origin/add','0','A','2017-05-19 16:52:07'),(162,'未命名',2,549755813888,'/origin/member','0','A','2017-05-19 16:52:07'),(163,'未命名',2,1099511627776,'/origin/save','0','A','2017-05-19 16:52:07'),(164,'未命名',2,2199023255552,'/origin','0','A','2017-05-19 16:52:08'),(165,'未命名',2,4398046511104,'/origin/update','0','A','2017-05-19 16:52:08'),(166,'未命名',2,8796093022208,'/origin/home','0','A','2017-05-19 16:52:08'),(167,'未命名',2,17592186044416,'/origin/queryOrigin','0','A','2017-05-19 16:52:08');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '角色标识',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `role_value` char(5) NOT NULL COMMENT '角色值',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`,`role_value`,`create_time`,`state`,`state_time`) values (1,'管理员','GA','2021-03-09 22:39:45','A','2021-03-19 22:39:51'),(2,'普通用户','CU','2021-03-09 22:40:25','A','2021-03-19 22:40:30'),(3,'组织管理员','OA','2021-03-09 22:40:54','A','2021-03-19 22:40:58'),(4,'班级管理员','CA','2021-03-09 22:41:13','A','2021-03-19 22:41:16');

/*Table structure for table `role_right` */

DROP TABLE IF EXISTS `role_right`;

CREATE TABLE `role_right` (
  `role_id` int(8) NOT NULL COMMENT '角色标识',
  `right_id` int(8) NOT NULL COMMENT '权限标识',
  KEY `FK_ROLE_RIGHT_ROLEID` (`role_id`) USING BTREE,
  KEY `FK_ROLE_RIGHT_RIGHTID` (`right_id`) USING BTREE,
  CONSTRAINT `FK_ROLE_RIGHT_RIGHTID` FOREIGN KEY (`right_id`) REFERENCES `right` (`right_id`),
  CONSTRAINT `FK_ROLE_RIGHT_ROLEID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `role_right` */

/*Table structure for table `share` */

DROP TABLE IF EXISTS `share`;

CREATE TABLE `share` (
  `user_id` int(8) NOT NULL COMMENT '分享者标识',
  `info_id` int(11) NOT NULL COMMENT '信息标识',
  `create_time` datetime NOT NULL COMMENT '分享时间',
  `where` varchar(20) NOT NULL,
  KEY `FK_SHARE_USERID` (`user_id`) USING BTREE,
  KEY `FK_SHARE_INFOID` (`info_id`) USING BTREE,
  CONSTRAINT `FK_SHARE_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`),
  CONSTRAINT `FK_SHARE_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `share` */

/*Table structure for table `subscription` */

DROP TABLE IF EXISTS `subscription`;

CREATE TABLE `subscription` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订阅标识',
  `create_time` datetime NOT NULL COMMENT '订阅时间',
  `info_type` varchar(20) NOT NULL COMMENT '订阅的信息类型',
  `is_email` char(1) NOT NULL COMMENT '是否邮箱订阅',
  `user_id` int(8) NOT NULL COMMENT '订阅者标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`sub_id`) USING BTREE,
  KEY `FK_SUBSCRIPTION_USERID` (`user_id`) USING BTREE,
  CONSTRAINT `FK_SUBSCRIPTION_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `subscription` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account` varchar(16) NOT NULL COMMENT '用户帐号',
  `password` varchar(32) NOT NULL DEFAULT '25D55AD283AA400AF464C76D713C07AD' COMMENT '用户密码',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `true_name` varchar(10) NOT NULL COMMENT '校友姓名',
  `introduce` varchar(255) NOT NULL DEFAULT '--这个人很懒，什么也没留下' COMMENT '个人简介',
  `image_id` int(8) NOT NULL DEFAULT '1' COMMENT '头像图片标识',
  `is_admin` char(1) NOT NULL DEFAULT '0' COMMENT '管理员标识',
  `state` char(2) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `FK_USER_IMAGEID` (`image_id`) USING BTREE,
  CONSTRAINT `FK_USER_IMAGEID` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `user` */

insert  into `user`(`user_id`,`account`,`password`,`email`,`true_name`,`introduce`,`image_id`,`is_admin`,`state`,`state_time`,`create_time`) values (1,'admin','25D55AD283AA400AF464C76D713C07AD',NULL,'管理员','--这人很懒，什么也没留下',2,'1','A','2021-04-09 15:40:29','2019-12-23 15:01:42'),(2,'123','25D55AD283AA400AF464C76D713C07AD','zhangsan@qq.com','张三','你好，我是张三。',2,'0','A','2021-04-09 15:40:31','2020-01-05 22:53:27'),(3,'1918042068','25D55AD283AA400AF464C76D713C07AD',NULL,'闫东','这人很懒，什么也没留下',2,'0','A','2021-04-09 15:40:34','2020-01-14 13:17:33'),(4,'1918052138','25D55AD283AA400AF464C76D713C07AD',NULL,'李四','这人很懒，什么也没留下',2,'0','A','2021-04-09 15:40:38','2020-01-26 15:09:15'),(5,'1918052140','25D55AD283AA400AF464C76D713C07AD',NULL,'缑浩浩','这人很懒，什么也没留下',2,'0','A','2021-04-09 15:40:40','2020-01-26 15:38:48'),(6,'1918052141','25D55AD283AA400AF464C76D713C07AD',NULL,'沈亚东','这人很懒，什么也没留下',2,'0','A','2020-02-05 17:24:50','2020-01-26 15:38:48'),(7,'1918052101','202CB962AC59075B964B07152D234B70',NULL,'Black先生','这人很懒，什么也没留下',2,'0','A','2021-04-02 22:35:38','2021-03-23 22:35:28'),(8,'1918052102','25D55AD283AA400AF464C76D713C07AD',NULL,'颜健','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(9,'1918052103','25D55AD283AA400AF464C76D713C07AD',NULL,'张娜','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(10,'1918052104','25D55AD283AA400AF464C76D713C07AD',NULL,'杨燕','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(11,'1918052105','25D55AD283AA400AF464C76D713C07AD',NULL,'张艳','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(12,'1918052106','25D55AD283AA400AF464C76D713C07AD',NULL,'何泽慧','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(13,'1918052107','25D55AD283AA400AF464C76D713C07AD',NULL,'赵六','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(14,'1918052108','25D55AD283AA400AF464C76D713C07AD',NULL,'于成东','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(15,'1918052109','25D55AD283AA400AF464C76D713C07AD',NULL,'潘峰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(16,'191804221','25D55AD283AA400AF464C76D713C07AD',NULL,'韦杰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(17,'191804222','25D55AD283AA400AF464C76D713C07AD',NULL,'范亚雷','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(18,'191804223','25D55AD283AA400AF464C76D713C07AD',NULL,'jack','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(19,'191804224','25D55AD283AA400AF464C76D713C07AD',NULL,'杜昊鸿','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(20,'191804225','25D55AD283AA400AF464C76D713C07AD',NULL,'林山河','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(21,'1918042216','25D55AD283AA400AF464C76D713C07AD',NULL,'李波','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(22,'1918042217','25D55AD283AA400AF464C76D713C07AD',NULL,'颜嘉欣','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(23,'1918042218','25D55AD283AA400AF464C76D713C07AD',NULL,'刘跃波','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(24,'1918052101','25D55AD283AA400AF464C76D713C07AD',NULL,'肖飞','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(25,'1918042201','25D55AD283AA400AF464C76D713C07AD',NULL,'刘强','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(26,'1918052103','25D55AD283AA400AF464C76D713C07AD',NULL,'赵东栋','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(27,'1918052105','25D55AD283AA400AF464C76D713C07AD',NULL,'郑文传','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(28,'1918052106','25D55AD283AA400AF464C76D713C07AD',NULL,'石进远','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(29,'1918052107','25D55AD283AA400AF464C76D713C07AD',NULL,'戴永政','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(30,'1918052118','25D55AD283AA400AF464C76D713C07AD',NULL,'陈冲','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(31,'1918052119','25D55AD283AA400AF464C76D713C07AD',NULL,'左文滔','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(32,'1918052130','25D55AD283AA400AF464C76D713C07AD',NULL,'司兴健','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(34,'1918052102','25D55AD283AA400AF464C76D713C07AD',NULL,'吉波','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:41'),(35,'1918052133','25D55AD283AA400AF464C76D713C07AD',NULL,'王明轩','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(36,'1918052134','25D55AD283AA400AF464C76D713C07AD',NULL,'张彪','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(37,'1918052135','25D55AD283AA400AF464C76D713C07AD',NULL,'许恒','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(38,'1918052136','25D55AD283AA400AF464C76D713C07AD',NULL,'李琪','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(39,'1918052137','25D55AD283AA400AF464C76D713C07AD',NULL,'严志麟','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(40,'1918052138','25D55AD283AA400AF464C76D713C07AD',NULL,'徐澔','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(41,'1918052139','25D55AD283AA400AF464C76D713C07AD',NULL,'沙淘金','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(42,'1918052140','25D55AD283AA400AF464C76D713C07AD',NULL,'滕珂','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(43,'1918052141','25D55AD283AA400AF464C76D713C07AD',NULL,'计宗佑','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(44,'1918052142','25D55AD283AA400AF464C76D713C07AD',NULL,'谢海庆','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(45,'1918052143','25D55AD283AA400AF464C76D713C07AD',NULL,'凌立章','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(46,'1918052144','25D55AD283AA400AF464C76D713C07AD',NULL,'张加涛','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(47,'1918052145','25D55AD283AA400AF464C76D713C07AD',NULL,'张杰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(48,'1918052146','25D55AD283AA400AF464C76D713C07AD',NULL,'陆亚洲','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(49,'1918052147','25D55AD283AA400AF464C76D713C07AD',NULL,'李凌飞','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(50,'1918052148','25D55AD283AA400AF464C76D713C07AD',NULL,'周亮亮','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(51,'1918052149','25D55AD283AA400AF464C76D713C07AD',NULL,'吴庆业','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(52,'1918052150','25D55AD283AA400AF464C76D713C07AD',NULL,'刘明明','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(53,'1918052151','25D55AD283AA400AF464C76D713C07AD',NULL,'李帅','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(54,'1918052152','25D55AD283AA400AF464C76D713C07AD',NULL,'周东东','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(55,'1918052153','25D55AD283AA400AF464C76D713C07AD',NULL,'魏庭胜','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(56,'1918052154','25D55AD283AA400AF464C76D713C07AD',NULL,'蔡志鹏','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(57,'1918052155','25D55AD283AA400AF464C76D713C07AD',NULL,'吴小康','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(58,'1918052156','25D55AD283AA400AF464C76D713C07AD',NULL,'孟永乐','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(59,'1918052157','25D55AD283AA400AF464C76D713C07AD',NULL,'田小彤','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(60,'1918052158','25D55AD283AA400AF464C76D713C07AD',NULL,'汪保旭','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(61,'1918052159','25D55AD283AA400AF464C76D713C07AD',NULL,'臧家宾','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(62,'1918052160','25D55AD283AA400AF464C76D713C07AD',NULL,'洪伟韬','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:00:42'),(118,'191804222','25D55AD283AA400AF464C76D713C07AD',NULL,'宋雪莹','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(119,'191804221','25D55AD283AA400AF464C76D713C07AD',NULL,'刘敏','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(120,'191804223','25D55AD283AA400AF464C76D713C07AD',NULL,'徐香','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(121,'191804224','25D55AD283AA400AF464C76D713C07AD',NULL,'冯敏','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(122,'191804225','25D55AD283AA400AF464C76D713C07AD',NULL,'缑浩','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(123,'1918042216','25D55AD283AA400AF464C76D713C07AD',NULL,'倪宇惠','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(124,'1918042217','25D55AD283AA400AF464C76D713C07AD',NULL,'沈咪','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(125,'1918042218','25D55AD283AA400AF464C76D713C07AD',NULL,'夏杰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(126,'1918042219','25D55AD283AA400AF464C76D713C07AD',NULL,'张艺馨','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(127,'1918042210','25D55AD283AA400AF464C76D713C07AD',NULL,'姜娟','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(128,'1918042211','25D55AD283AA400AF464C76D713C07AD',NULL,'崔政霞','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(129,'191804222','25D55AD283AA400AF464C76D713C07AD',NULL,'周梦莹','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(130,'191804223','25D55AD283AA400AF464C76D713C07AD',NULL,'丁甜甜','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(131,'191804224','25D55AD283AA400AF464C76D713C07AD',NULL,'黄虚虚','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(132,'191804225','25D55AD283AA400AF464C76D713C07AD',NULL,'杨孟婧','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(133,'1918042216','25D55AD283AA400AF464C76D713C07AD',NULL,'冯曦瑾','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(134,'1918042217','25D55AD283AA400AF464C76D713C07AD',NULL,'时贝贝','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(135,'1918042218','25D55AD283AA400AF464C76D713C07AD',NULL,'胡璐','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(136,'1918042219','25D55AD283AA400AF464C76D713C07AD',NULL,'孟颖','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(137,'1918042220','25D55AD283AA400AF464C76D713C07AD',NULL,'钟清华','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(138,'1918042221','25D55AD283AA400AF464C76D713C07AD',NULL,'周永鹏','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(139,'1918042222','25D55AD283AA400AF464C76D713C07AD',NULL,'彭涛','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(140,'1918042223','25D55AD283AA400AF464C76D713C07AD',NULL,'孙俊','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(141,'1918042224','25D55AD283AA400AF464C76D713C07AD',NULL,'朱家熠','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(142,'1918042225','25D55AD283AA400AF464C76D713C07AD',NULL,'张春昊','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(143,'1918042226','25D55AD283AA400AF464C76D713C07AD',NULL,'陈键','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(144,'1918042227','25D55AD283AA400AF464C76D713C07AD',NULL,'谈子杰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(145,'1918042228','25D55AD283AA400AF464C76D713C07AD',NULL,'陆元凯','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(146,'1918042229','25D55AD283AA400AF464C76D713C07AD',NULL,'曹彦文','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(147,'1918042231','25D55AD283AA400AF464C76D713C07AD',NULL,'钱东培','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(148,'1918042232','25D55AD283AA400AF464C76D713C07AD',NULL,'章豪杰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(149,'1918042233','25D55AD283AA400AF464C76D713C07AD',NULL,'王安户','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(150,'1918042234','25D55AD283AA400AF464C76D713C07AD',NULL,'于孝文','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(151,'1918042235','25D55AD283AA400AF464C76D713C07AD',NULL,'孔冰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(152,'1918042236','25D55AD283AA400AF464C76D713C07AD',NULL,'沈成','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(153,'1918042237','25D55AD283AA400AF464C76D713C07AD',NULL,'吴智超','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(154,'1918042238','25D55AD283AA400AF464C76D713C07AD',NULL,'jack','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(155,'1918042239','25D55AD283AA400AF464C76D713C07AD',NULL,'唐旺','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(156,'1918042240','25D55AD283AA400AF464C76D713C07AD',NULL,'王项韬','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(157,'1918042241','25D55AD283AA400AF464C76D713C07AD',NULL,'毛稳','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(158,'1918042242','25D55AD283AA400AF464C76D713C07AD',NULL,'胡大伟','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(159,'1918042243','25D55AD283AA400AF464C76D713C07AD',NULL,'张青','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(160,'1918042244','25D55AD283AA400AF464C76D713C07AD',NULL,'周仁朋','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(161,'1918042246','25D55AD283AA400AF464C76D713C07AD',NULL,'赵玉吉','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(162,'1918042247','25D55AD283AA400AF464C76D713C07AD',NULL,'薛凤凯','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(163,'1918042248','25D55AD283AA400AF464C76D713C07AD',NULL,'李彬','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(164,'1918042249','25D55AD283AA400AF464C76D713C07AD',NULL,'王见远','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(165,'1918042250','25D55AD283AA400AF464C76D713C07AD',NULL,'张萌萌','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(166,'1918042251','25D55AD283AA400AF464C76D713C07AD',NULL,'周宇超','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(167,'1918042252','25D55AD283AA400AF464C76D713C07AD',NULL,'郭啸','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(168,'1918042253','25D55AD283AA400AF464C76D713C07AD',NULL,'陈凯顺','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(169,'1918042254','25D55AD283AA400AF464C76D713C07AD',NULL,'孟珂','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(170,'1918042255','25D55AD283AA400AF464C76D713C07AD',NULL,'廖凯','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(171,'1918042256','25D55AD283AA400AF464C76D713C07AD',NULL,'樊佳卫','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(172,'1918042257','25D55AD283AA400AF464C76D713C07AD',NULL,'姜鹏程','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(173,'1918042258','25D55AD283AA400AF464C76D713C07AD',NULL,'陈中康','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(174,'1918042259','25D55AD283AA400AF464C76D713C07AD',NULL,'刘磊','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(175,'1918042260','25D55AD283AA400AF464C76D713C07AD',NULL,'李壮','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:04:38'),(231,'1918052101','25D55AD283AA400AF464C76D713C07AD',NULL,'陈傲娟','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(232,'1918052102','25D55AD283AA400AF464C76D713C07AD',NULL,'袁路路','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(233,'1918052103','25D55AD283AA400AF464C76D713C07AD',NULL,'闫雨','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(234,'1918052104','25D55AD283AA400AF464C76D713C07AD',NULL,'赵莉','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(235,'1918052105','25D55AD283AA400AF464C76D713C07AD',NULL,'谢佳慧','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(236,'1918052106','25D55AD283AA400AF464C76D713C07AD',NULL,'董倩','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(237,'1918052107','25D55AD283AA400AF464C76D713C07AD',NULL,'赵缘','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(238,'1918052108','25D55AD283AA400AF464C76D713C07AD',NULL,'吴楠','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(239,'1918052109','25D55AD283AA400AF464C76D713C07AD',NULL,'张叶','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(240,'1918042210','25D55AD283AA400AF464C76D713C07AD',NULL,'薛玉淋','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(241,'1918042211','25D55AD283AA400AF464C76D713C07AD',NULL,'周颖','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(242,'1918042212','25D55AD283AA400AF464C76D713C07AD',NULL,'侯文静','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(243,'1918042213','25D55AD283AA400AF464C76D713C07AD',NULL,'郝天威','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(244,'1918042214','25D55AD283AA400AF464C76D713C07AD',NULL,'戴运来','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(245,'1918042215','25D55AD283AA400AF464C76D713C07AD',NULL,'赵一沣','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(246,'1918042216','25D55AD283AA400AF464C76D713C07AD',NULL,'刘杰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(247,'1918042217','25D55AD283AA400AF464C76D713C07AD',NULL,'是旸明','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(248,'1918042218','25D55AD283AA400AF464C76D713C07AD',NULL,'施圣洁','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(249,'1918042219','25D55AD283AA400AF464C76D713C07AD',NULL,'王凯','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(250,'1918052120','25D55AD283AA400AF464C76D713C07AD',NULL,'姜可','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(251,'1918052121','25D55AD283AA400AF464C76D713C07AD',NULL,'杨健','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(252,'1918052122','25D55AD283AA400AF464C76D713C07AD',NULL,'夏辉','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(253,'1918052123','25D55AD283AA400AF464C76D713C07AD',NULL,'徐洋洋','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(254,'1918052124','25D55AD283AA400AF464C76D713C07AD',NULL,'王维','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(255,'1918052125','25D55AD283AA400AF464C76D713C07AD',NULL,'赵江麟','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(256,'1918052126','25D55AD283AA400AF464C76D713C07AD',NULL,'吴健','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(257,'1918052127','25D55AD283AA400AF464C76D713C07AD',NULL,'吴焰峰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(258,'1918052128','25D55AD283AA400AF464C76D713C07AD',NULL,'姜凌峰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(259,'1918052129','25D55AD283AA400AF464C76D713C07AD',NULL,'任越','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(260,'1918052130','25D55AD283AA400AF464C76D713C07AD',NULL,'顾余祥','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(261,'1918052131','25D55AD283AA400AF464C76D713C07AD',NULL,'张兴刚','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(262,'1918052133','25D55AD283AA400AF464C76D713C07AD',NULL,'贺一飞','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(263,'1918052134','25D55AD283AA400AF464C76D713C07AD',NULL,'徐盼','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(264,'1918052135','25D55AD283AA400AF464C76D713C07AD',NULL,'叶浪','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(265,'1918052136','25D55AD283AA400AF464C76D713C07AD',NULL,'尤煜明','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(266,'1918052137','25D55AD283AA400AF464C76D713C07AD',NULL,'王五','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-20 14:14:03'),(268,'1918042063','25D55AD283AA400AF464C76D713C07AD',NULL,'缑浩','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 14:14:03'),(271,'1918052142','25D55AD283AA400AF464C76D713C07AD',NULL,'李四','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(272,'1918052143','25D55AD283AA400AF464C76D713C07AD',NULL,'顾朋朋','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(273,'1918052144','25D55AD283AA400AF464C76D713C07AD',NULL,'陈天瑶','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-17 14:14:03'),(274,'1918052146','25D55AD283AA400AF464C76D713C07AD',NULL,'沈东扬','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(275,'1918052147','25D55AD283AA400AF464C76D713C07AD',NULL,'陈超','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-18 14:14:03'),(276,'1918052149','25D55AD283AA400AF464C76D713C07AD',NULL,'时波','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-16 14:14:03'),(277,'1918042231','25D55AD283AA400AF464C76D713C07AD',NULL,'杨诚','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(278,'1918042232','25D55AD283AA400AF464C76D713C07AD',NULL,'潘佳玲','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(279,'1918042233','25D55AD283AA400AF464C76D713C07AD',NULL,'钱冬芳','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(280,'1918042234','25D55AD283AA400AF464C76D713C07AD',NULL,'周洁','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(281,'1918042235','25D55AD283AA400AF464C76D713C07AD',NULL,'徐洁','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(282,'1918042236','25D55AD283AA400AF464C76D713C07AD',NULL,'花梦晴','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(283,'1918042237','25D55AD283AA400AF464C76D713C07AD',NULL,'李倩倩','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(284,'1918042238','25D55AD283AA400AF464C76D713C07AD',NULL,'张叶强','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(285,'1918042239','25D55AD283AA400AF464C76D713C07AD',NULL,'许雪','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(286,'1918042240','25D55AD283AA400AF464C76D713C07AD',NULL,'徐瑶','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(287,'1918042241','25D55AD283AA400AF464C76D713C07AD',NULL,'李桂馨','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(288,'1918042242','25D55AD283AA400AF464C76D713C07AD',NULL,'田威威','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(289,'1918042243','25D55AD283AA400AF464C76D713C07AD',NULL,'张金闯','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(290,'1918042244','25D55AD283AA400AF464C76D713C07AD',NULL,'郭泽权','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(291,'1918042245','25D55AD283AA400AF464C76D713C07AD',NULL,'高慎佳','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(292,'1918042246','25D55AD283AA400AF464C76D713C07AD',NULL,'陈路路','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(293,'1918042247','25D55AD283AA400AF464C76D713C07AD',NULL,'郭旭','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(294,'1918042248','25D55AD283AA400AF464C76D713C07AD',NULL,'董自信','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(295,'1918042249','25D55AD283AA400AF464C76D713C07AD',NULL,'陈维炜','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(296,'1918042250','25D55AD283AA400AF464C76D713C07AD',NULL,'魏星亮','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(297,'1918042221','25D55AD283AA400AF464C76D713C07AD',NULL,'陈万生','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(298,'1918042222','25D55AD283AA400AF464C76D713C07AD',NULL,'孟晨宇','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(299,'1918042223','25D55AD283AA400AF464C76D713C07AD',NULL,'邢俊杰','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(300,'1918042224','25D55AD283AA400AF464C76D713C07AD',NULL,'刘仁春','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(301,'1918042225','25D55AD283AA400AF464C76D713C07AD',NULL,'蔡志丹','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(302,'1918042226','25D55AD283AA400AF464C76D713C07AD',NULL,'郝志远','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(303,'1918042227','25D55AD283AA400AF464C76D713C07AD',NULL,'宋文成','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(304,'1918042228','25D55AD283AA400AF464C76D713C07AD',NULL,'陈雷雷','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(305,'1918042229','25D55AD283AA400AF464C76D713C07AD',NULL,'汪龙波','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(306,'1918042230','25D55AD283AA400AF464C76D713C07AD',NULL,'李溪海','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(307,'1918042231','25D55AD283AA400AF464C76D713C07AD',NULL,'曹硕','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(308,'1918042220','25D55AD283AA400AF464C76D713C07AD',NULL,'周文阳','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(309,'1918042233','25D55AD283AA400AF464C76D713C07AD',NULL,'刘嘉','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(310,'1918042234','25D55AD283AA400AF464C76D713C07AD',NULL,'王生辉','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(311,'1918042235','25D55AD283AA400AF464C76D713C07AD',NULL,'卢嘉贵','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(312,'1918042236','25D55AD283AA400AF464C76D713C07AD',NULL,'周文利','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(313,'1918042237','25D55AD283AA400AF464C76D713C07AD',NULL,'倪钧','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(314,'1918042238','25D55AD283AA400AF464C76D713C07AD',NULL,'周尚','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(315,'1918042239','25D55AD283AA400AF464C76D713C07AD',NULL,'杜聪','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(316,'1918042240','25D55AD283AA400AF464C76D713C07AD',NULL,'徐德立','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(317,'1918042241','25D55AD283AA400AF464C76D713C07AD',NULL,'史锋','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(318,'1918042242','25D55AD283AA400AF464C76D713C07AD',NULL,'王鸣一','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(319,'1918042243','25D55AD283AA400AF464C76D713C07AD',NULL,'张仁伟','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(320,'1918042244','25D55AD283AA400AF464C76D713C07AD',NULL,'姚焱舒','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(321,'1918042245','25D55AD283AA400AF464C76D713C07AD',NULL,'黄河','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(322,'1918042246','25D55AD283AA400AF464C76D713C07AD',NULL,'尹轩宇','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(323,'1918042247','25D55AD283AA400AF464C76D713C07AD',NULL,'管庆刚','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(324,'1918042248','25D55AD283AA400AF464C76D713C07AD',NULL,'贺山燕','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17'),(325,'1918042249','25D55AD283AA400AF464C76D713C07AD',NULL,'梁尚','--这个人很懒，什么也没留下',2,'0','A',NULL,'2021-04-19 12:18:17');

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_info_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户信息标识',
  `sex` char(1) DEFAULT NULL,
  `age` smallint(3) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq',
  `microblog` varchar(20) DEFAULT NULL COMMENT '微博',
  `wechat` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL COMMENT '住址',
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  `exp1` varchar(100) DEFAULT NULL COMMENT '扩展字段1',
  `exp2` varchar(100) DEFAULT NULL COMMENT '扩展字段2',
  PRIMARY KEY (`user_info_id`) USING BTREE,
  KEY `FK_USER_USERINFO` (`user_id`) USING BTREE,
  CONSTRAINT `FK_USER_USERINFO` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `user_info` */

insert  into `user_info`(`user_info_id`,`sex`,`age`,`birthday`,`phone`,`email`,`qq`,`microblog`,`wechat`,`address`,`user_id`,`state`,`state_time`,`exp1`,`exp2`) values (1,'1',24,'1997-02-19 08:51:31','15112312231','123456@qq.com','123456','123','123','陕西省西安市',3,'A','2021-02-19 08:52:56',NULL,NULL),(2,'1',23,NULL,'15112312231','333333@190.com','333333','333','张三','陕西省汉中市汉台区',2,'A','2021-02-27 20:19:13',NULL,NULL);

/*Table structure for table `user_job` */

DROP TABLE IF EXISTS `user_job`;

CREATE TABLE `user_job` (
  `job_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户工作标识',
  `job_name` varchar(30) NOT NULL COMMENT '工作名称',
  `job_unit` varchar(30) NOT NULL COMMENT '工作单位',
  `start_time` datetime DEFAULT NULL COMMENT '就职时间',
  `end_time` datetime DEFAULT NULL COMMENT '离职时间',
  `job_date` varchar(30) NOT NULL COMMENT '工作时间',
  `job_desc` varchar(200) DEFAULT NULL COMMENT '工作描述',
  `isPublic` char(1) DEFAULT '0' COMMENT '工作信息是否公开',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  KEY `FK_USER_USERJOB` (`user_id`) USING BTREE,
  CONSTRAINT `FK_USER_USERJOB` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `user_job` */

insert  into `user_job`(`job_id`,`job_name`,`job_unit`,`start_time`,`end_time`,`job_date`,`job_desc`,`isPublic`,`create_time`,`user_id`,`state`,`state_time`) values (1,'HTML','SKY公司',NULL,NULL,'2021.4 - 至今',NULL,'0','2017-05-16 08:11:07',2,'A','2017-05-16 08:11:57'),(2,'后台系统','sky公司',NULL,NULL,'2020.10 - 2021.4',NULL,'0','2017-05-16 08:17:39',2,'A','2017-05-16 08:17:43');

/*Table structure for table `user_origin` */

DROP TABLE IF EXISTS `user_origin`;

CREATE TABLE `user_origin` (
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `origin_id` int(8) NOT NULL COMMENT '组织标识',
  `create_time` datetime NOT NULL COMMENT '加入时间',
  `state` char(2) NOT NULL COMMENT '加入状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  KEY `FK_USER_ORIGIN_USERID` (`user_id`) USING BTREE,
  KEY `FK_USER_ORIGIN_ORIGINID` (`origin_id`) USING BTREE,
  CONSTRAINT `FK_USER_ORIGIN_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_ORIGIN_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `user_origin` */

insert  into `user_origin`(`user_id`,`origin_id`,`create_time`,`state`,`state_time`) values (4,1,'2019-12-18 22:51:36','A','2019-12-18 22:51:45'),(2,1,'2020-01-01 22:22:20','A','2020-01-01 22:22:20'),(4,3,'2020-12-27 23:17:52','A','2020-12-27 23:17:52'),(1,2,'2020-12-28 00:30:45','A','2020-12-28 00:30:45'),(2,4,'2021-01-28 15:38:44','A','2021-01-28 15:38:44'),(2,8,'2021-02-17 15:47:57','A','2021-02-17 15:48:02'),(2,9,'2021-02-17 15:48:24','A','2021-02-17 15:48:31'),(2,10,'2021-02-17 15:48:49','A','2021-02-17 15:48:51'),(2,11,'2021-02-17 15:49:06','A','2021-02-17 15:49:10'),(3,8,'2021-02-17 15:49:38','A','2021-02-17 15:49:46'),(4,8,'2021-02-17 15:50:33','A','2021-02-17 15:50:38'),(5,6,'2021-02-17 15:51:33','A','2021-02-17 15:51:39'),(6,7,'2021-02-17 15:51:49','A','2021-02-17 15:51:55'),(7,12,'2021-02-17 15:52:10','A','2021-02-17 15:52:15'),(3,13,'2021-02-17 15:52:26','A','2021-02-17 15:52:31'),(2,7,'2021-02-18 21:17:50','A','2021-02-18 21:17:50'),(4,4,'2021-02-25 16:53:30','A','2021-02-25 16:53:30'),(5,3,'2021-02-25 17:24:55','A','2021-02-25 17:24:55'),(4,3,'2021-02-28 13:25:56','A','2021-02-28 13:25:56'),(262,2,'2021-02-28 14:15:31','A','2021-02-28 14:15:31'),(122,7,'2021-02-28 22:16:14','A','2021-02-28 22:16:14'),(6,8,'2021-02-28 12:19:59','A','2021-02-28 12:19:59'),(119,8,'2021-02-28 14:33:42','A','2021-02-28 14:33:42'),(118,8,'2021-02-28 17:10:11','A','2021-02-28 17:10:11'),(122,2,'2021-03-03 20:26:36','A','2021-03-03 20:26:36'),(122,12,'2021-03-03 21:04:18','A','2021-03-03 21:04:18'),(122,4,'2021-03-03 21:19:57','A','2021-03-03 21:19:57'),(5,8,'2021-03-03 21:37:24','A','2021-03-03 21:37:24'),(125,8,'2021-03-03 22:40:31','A','2021-03-03 22:40:31'),(5,14,'2021-03-03 23:54:42','A','2021-03-03 23:54:42'),(5,4,'2021-03-05 13:31:19','A','2021-03-05 13:31:19'),(5,2,'2021-03-05 13:31:56','A','2021-03-05 13:31:56'),(2,14,'2021-03-06 10:35:53','A','2021-03-06 10:35:53'),(5,13,'2021-03-11 20:03:42','A','2021-03-11 20:03:42'),(5,7,'2021-03-11 20:36:13','A','2021-03-11 20:36:13'),(304,14,'2021-03-11 22:19:44','A','2021-03-11 22:19:44'),(4,14,'2021-03-17 10:07:52','A','2021-03-17 10:07:52'),(3,14,'2021-03-17 10:09:21','A','2021-03-17 10:09:21'),(6,3,'2021-03-17 12:37:27','A','2021-03-17 12:37:27'),(13,14,'2021-03-19 17:22:47','A','2021-03-19 17:22:47'),(271,7,'2021-03-19 17:30:46','A','2021-03-19 17:30:46'),(266,4,'2021-03-19 17:34:42','A','2021-03-19 17:34:42'),(271,2,'2021-03-19 17:41:25','A','2021-03-19 17:41:25'),(268,14,'2021-03-19 23:06:54','A','2021-03-19 23:06:54'),(268,7,'2021-03-19 23:09:08','A','2021-03-19 23:09:08'),(3,4,'2021-03-19 23:13:04','A','2021-03-19 23:13:04'),(2,15,'2023-01-09 20:55:13','A','2023-01-09 20:55:13');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `role_id` int(8) NOT NULL COMMENT '角色标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  KEY `FK_USER_ID` (`user_id`) USING BTREE,
  KEY `FK_ROLE_ID` (`role_id`) USING BTREE,
  CONSTRAINT `FK_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
