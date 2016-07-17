/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21 : Database - xjusha
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xjusha` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xjusha`;

/*Table structure for table `_appointment` */

DROP TABLE IF EXISTS `_appointment`;

CREATE TABLE `_appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `isFinished` bit(1) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `demands_id` int(11) DEFAULT NULL,
  `appointment_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `FK_stwdudnbshccux8kl4t1g2fy9` (`user_id`),
  KEY `FK_imhsyd5f3om76dry6rek9usc0` (`demands_id`),
  CONSTRAINT `FK_imhsyd5f3om76dry6rek9usc0` FOREIGN KEY (`demands_id`) REFERENCES `_demands` (`demands_id`),
  CONSTRAINT `FK_stwdudnbshccux8kl4t1g2fy9` FOREIGN KEY (`user_id`) REFERENCES `_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `_appointment` */

insert  into `_appointment`(`appointment_id`,`isFinished`,`start_time`,`finish_time`,`user_id`,`demands_id`,`appointment_num`) values (1,'\0','2016-03-03 19:17:41',NULL,1,3,'20160303191741'),(2,'\0','2016-03-03 20:24:13',NULL,1,3,'20160303202413'),(3,'\0','2016-03-03 20:33:04',NULL,1,2,'20160303203304'),(4,'\0','2016-03-03 20:35:14',NULL,1,2,'20160303203514'),(5,'\0','2016-03-07 15:42:11',NULL,1,2,'20160307154211'),(6,'\0','2016-03-13 13:58:15',NULL,3,3,'2016031301581408'),(7,'\0','2016-03-13 13:58:36',NULL,3,3,'2016031301583672'),(8,'\0','2016-07-16 17:09:42',NULL,3,2,'2016071605094193');

/*Table structure for table `_demands` */

DROP TABLE IF EXISTS `_demands`;

CREATE TABLE `_demands` (
  `demands_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expressNumber` varchar(255) DEFAULT NULL,
  `powertyArea` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`demands_id`),
  KEY `FK_fdj7on7kxhsxafbk65av9ydre` (`user_id`),
  CONSTRAINT `FK_fdj7on7kxhsxafbk65av9ydre` FOREIGN KEY (`user_id`) REFERENCES `_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `_demands` */

insert  into `_demands`(`demands_id`,`title`,`description`,`expressNumber`,`powertyArea`,`status`,`user_id`) values (2,'四川地震灾区需要帐篷','这里是四川汶川县，灾民需要大量的帐篷用以安置他们，请物资捐助者尽快捐助，谢谢大家!',NULL,'四川省',1,1),(3,'唐山大地震','唐山发生大地震，需要大量康师傅红烧牛肉面',NULL,'河北省',2,1);

/*Table structure for table `_donation` */

DROP TABLE IF EXISTS `_donation`;

CREATE TABLE `_donation` (
  `donation_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`donation_id`),
  KEY `FK_g9y298r8bulybjh9tf591vfkr` (`item_id`),
  KEY `FK_iim841dia41ir5hcg008a2qiq` (`appointment_id`),
  CONSTRAINT `FK_g9y298r8bulybjh9tf591vfkr` FOREIGN KEY (`item_id`) REFERENCES `_item` (`item_id`),
  CONSTRAINT `FK_iim841dia41ir5hcg008a2qiq` FOREIGN KEY (`appointment_id`) REFERENCES `_appointment` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `_donation` */

insert  into `_donation`(`donation_id`,`account`,`item_id`,`appointment_id`) values (1,10,6,1),(2,5,5,1),(3,4,7,2),(4,2,6,2),(5,3,5,2),(6,10,3,3),(7,5,4,3),(8,4,3,4),(9,15,4,4),(10,9,3,5),(11,13,4,5),(12,94,7,6),(13,38,6,6),(14,52,5,6),(15,1,7,7),(16,5,3,8),(17,4,4,8);

/*Table structure for table `_item` */

DROP TABLE IF EXISTS `_item`;

CREATE TABLE `_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `item_description` varchar(255) DEFAULT NULL,
  `item_totalNum` int(11) DEFAULT NULL,
  `item_receiveNum` int(11) DEFAULT NULL,
  `item_reservationNum` int(11) DEFAULT NULL,
  `demands_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_nyrme32r8mtom5rgk5h7lg4sl` (`demands_id`),
  CONSTRAINT `FK_nyrme32r8mtom5rgk5h7lg4sl` FOREIGN KEY (`demands_id`) REFERENCES `_demands` (`demands_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `_item` */

insert  into `_item`(`item_id`,`item_name`,`item_description`,`item_totalNum`,`item_receiveNum`,`item_reservationNum`,`demands_id`) values (3,'帐篷','帐篷是一种生活用品',50,0,28,2),(4,'锅','用来做饭的',60,0,37,2),(5,'洗脸盆','用来做饭的',60,0,60,3),(6,'帐篷','帐篷是一种生活用品',50,0,50,3),(7,'洋娃娃','用来安慰小朋友',99,0,99,3);

/*Table structure for table `_user` */

DROP TABLE IF EXISTS `_user`;

CREATE TABLE `_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `isVolunteer` bit(1) DEFAULT NULL,
  `regist_datetime` datetime NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `_user` */

insert  into `_user`(`user_id`,`username`,`password`,`nickname`,`active`,`isVolunteer`,`regist_datetime`,`address`,`telephone`) values (1,'Giraffe','6615219','长颈鹿','','','2016-03-01 17:00:54','天津市红桥区','18002137253'),(2,'zoey','qwertyuiop','lj','','\0','2016-03-01 18:27:56','河北工业大学','010-2345678'),(3,'zhangboming111','6615219','你爸爸','','\0','2016-03-13 13:55:51','天津市','18002137253');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
