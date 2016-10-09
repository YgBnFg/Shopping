/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.12-log : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `name` varchar(20) NOT NULL,
  `password` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`name`,`password`) values ('123',1412),('ybf',5215222);

/*Table structure for table `authors` */

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `authorID` int(11) NOT NULL AUTO_INCREMENT,
  `authorname` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `authors` */

insert  into `authors`(`authorID`,`authorname`,`phone`,`address`) values (1,'张三','13578659228','中山路'),(2,'李四','13578659228','昌北'),(3,'王二','13578659228','八一'),(4,'杨','13578659228','青山路'),(5,'黄','13578659228','桥南路');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookcode` char(20) NOT NULL,
  `ISBN` char(20) DEFAULT NULL,
  `bookname` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `publisherdate` date DEFAULT NULL,
  PRIMARY KEY (`bookcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`bookcode`,`ISBN`,`bookname`,`price`,`publisher`,`publisherdate`) values ('1',NULL,'数据库',60,NULL,NULL),('2',NULL,'数据结构',50,NULL,NULL),('3',NULL,'c++',100,NULL,NULL),('4',NULL,'java',30,NULL,NULL),('5',NULL,'c#',49,NULL,NULL),('6',NULL,'.net',38,NULL,NULL),('7',NULL,'汇编',89,NULL,NULL);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(30) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `salesvolume` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`goodsname`,`price`,`number`,`salesvolume`) values (1,'数据结构',30.5,85,15);

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `saleID` varchar(40) NOT NULL,
  `bookcode` char(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `summoney` float DEFAULT NULL,
  PRIMARY KEY (`saleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sales` */

insert  into `sales`(`saleID`,`bookcode`,`price`,`num`,`summoney`) values ('529687f2-1da0-11e6-add3-dc0ea1d2ccd0','1',10,10,100),('529cb635-1da0-11e6-add3-dc0ea1d2ccd0','2',1,10,10),('52a2ac4b-1da0-11e6-add3-dc0ea1d2ccd0','3',1,12,13),('52a88f50-1da0-11e6-add3-dc0ea1d2ccd0','4',1,14,14),('52af712a-1da0-11e6-add3-dc0ea1d2ccd0','5',1,15,16),('52b48b1a-1da0-11e6-add3-dc0ea1d2ccd0','5',30,15,450),('52ba3ee8-1da0-11e6-add3-dc0ea1d2ccd0','1',10,10,100),('52c7e32e-1da0-11e6-add3-dc0ea1d2ccd0','1',10,10,200),('52d15bc9-1da0-11e6-add3-dc0ea1d2ccd0','6',50,13,650);

/*Table structure for table `tablename1` */

DROP TABLE IF EXISTS `tablename1`;

CREATE TABLE `tablename1` (
  `23434rwe` int(11) DEFAULT NULL,
  `asfaf` varchar(20) DEFAULT NULL,
  `sadgfaerg` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tablename1` */

insert  into `tablename1`(`23434rwe`,`asfaf`,`sadgfaerg`) values (1241241,NULL,NULL),(12412412,NULL,NULL),(1241241,NULL,NULL),(1,'asffa',NULL);

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(45) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`id`,`name`,`password`,`realname`,`sex`,`tel`) values (1,'5215','123','465411','man','1321654');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
