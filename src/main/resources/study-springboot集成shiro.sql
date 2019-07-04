/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.41 : Database - study
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`study` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `study`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` varchar(20) NOT NULL COMMENT '会员编号',
  `customer_name` varchar(20) NOT NULL COMMENT '会员名称',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '状态：1-正常；2-冻结；3-不可用',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `updated_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员表';

/*Data for the table `customer` */

LOCK TABLES `customer` WRITE;

insert  into `customer`(`id`,`customer_id`,`customer_name`,`password`,`phone_number`,`email`,`status`,`create_date`,`updated_date`) values (1,'abc123456','abc','e10adc3949ba59abbe56e057f20f883e','13412345678','abc@163.com','1','2019-02-21 10:16:35','2019-02-21 10:16:35'),(2,'asd123456','ssd','e10adc3949ba59abbe56e057f20f883e','13412345679','asd@163.com','1','2019-02-21 10:16:35','2019-02-21 10:16:35'),(3,'qwe123456','qwe','e10adc3949ba59abbe56e057f20f883e','13412345632','qwe@163.com','1','2019-02-21 10:16:35','2019-02-21 10:16:35'),(4,'zxc123456','zxc','e10adc3949ba59abbe56e057f20f883e','13412345622','zxc@163.com','1','2019-02-21 10:16:35','2019-02-21 10:16:35');

UNLOCK TABLES;

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(20) NOT NULL COMMENT '权限名称',
  `permission` varchar(50) NOT NULL COMMENT '权限字符串，如employees:create,employees:update,employees:delete',
  `type` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '权限类型：0-目录；1-菜单；2-按钮',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态：0-不可用；1-可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='权限表';

/*Data for the table `sys_permission` */

LOCK TABLES `sys_permission` WRITE;

insert  into `sys_permission`(`id`,`parent_id`,`name`,`permission`,`type`,`url`,`status`) values (1,NULL,'会员管理','customer','0','/customer','1'),(2,1,'会员列表','customer:list','1','/customer/list','1'),(3,1,'会员等级','customer:level','1','/customer/level','1'),(4,2,'查看会员','customer:view','2','/customer/view','1'),(5,2,'添加会员','customer:add','2','/customer/add','1'),(6,2,'修改会员','customer:update','2','/customer/update','1'),(7,2,'删除会员','customer:delete','2','/customer/delete','1'),(8,NULL,'商品管理','product','0','/product','1'),(9,8,'商品列表','product:list','1','/product/list','1'),(10,8,'商品分类','product:category','1','/product/category','1'),(11,8,'商品回收站','product:recycle','1','/product/recycle','1'),(12,9,'添加商品','product:add','2','/product/add','1'),(13,9,'修改商品','product:update','2','/product/update','1'),(14,9,'删除商品','product:delete','2','/product/delete','1'),(15,NULL,'订单管理','order','0','/order','1'),(16,15,'订单列表','order:list','1','/order/list','1'),(17,16,'查看订单','order:view','2','/order/view','1'),(18,16,'修改订单','order:update','2','/order/update','1'),(19,16,'删除订单','order:delete','2','/order/delete','1');

UNLOCK TABLES;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role` varchar(20) NOT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态：0-不可用；1-可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

LOCK TABLES `sys_role` WRITE;

insert  into `sys_role`(`id`,`role`,`description`,`status`) values (1,'manager','管理员','1'),(2,'producter','生产员','1'),(3,'salesman','销售员','1');

UNLOCK TABLES;

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `role_id` int(11) NOT NULL COMMENT '角色表主键',
  `permission_id` int(11) NOT NULL COMMENT '权限表主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

/*Data for the table `sys_role_permission` */

LOCK TABLES `sys_role_permission` WRITE;

insert  into `sys_role_permission`(`role_id`,`permission_id`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(3,15),(3,16),(3,17),(3,18),(3,19);

UNLOCK TABLES;

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '加密盐值',
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '状态：1-正常；2-冻结；3-不可用',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `updated_date` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

LOCK TABLES `sys_user` WRITE;

insert  into `sys_user`(`id`,`username`,`password`,`salt`,`status`,`create_date`,`updated_date`) values (1,'admin','f6a93fb80dccf33119610712eb41a3cb','admin#123456','1','2019-02-19 03:02:27','2019-02-20 17:56:56'),(2,'product','47d7920d1af0a48c3ad9a4897009bd5c','product#123456','1','2019-02-19 03:02:27','2019-02-20 18:00:25'),(3,'sale','866ff773736059bbbd48e89676712c59','sale#123456','1','2019-02-20 17:59:49','2019-02-20 17:59:49');

UNLOCK TABLES;

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户表主键',
  `role_id` int(11) NOT NULL COMMENT '角色表主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `sys_user_role` */

LOCK TABLES `sys_user_role` WRITE;

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,2),(3,3);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
