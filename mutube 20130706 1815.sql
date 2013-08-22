-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.25


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema yotube
--

CREATE DATABASE IF NOT EXISTS yotube;
USE yotube;

--
-- Definition of table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) NOT NULL,
  `videoid` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `userid` (`userid`),
  KEY `videoid` (`videoid`),
  CONSTRAINT `videoid` FOREIGN KEY (`videoid`) REFERENCES `video` (`videoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


--
-- Definition of table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `likeid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) NOT NULL,
  `videoid` int(11) NOT NULL,
  PRIMARY KEY (`likeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`likeid`,`userid`,`videoid`) VALUES 
 (1,'swena@gmail.com',5),
 (6,'swena@gmail.com',8);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;


--
-- Definition of table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE `subscription` (
  `subsid` varchar(50) NOT NULL,
  `userid` varchar(100) NOT NULL,
  PRIMARY KEY (`subsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription`
--

/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(100) NOT NULL,
  `subsid` varchar(50) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(1) NOT NULL,
  `location` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `no_of_subs` int(50) NOT NULL,
  `no_of_uploads` int(11) NOT NULL,
  `image` varchar(10000) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `subsid` (`subsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userid`,`subsid`,`usertype`,`password`,`birthday`,`gender`,`location`,`nationality`,`no_of_subs`,`no_of_uploads`,`image`) VALUES 
 ('abhoja@gmail.com','abhoja','admin','61d4d3b3c416faedb390a5a61d062cb5','1992-06-02','m','dubai','american',0,2,'abhoja.JPG'),
 ('admin@yahoo.com','admin','admin','81dc9bdb52d04dc20036dbd8313ed055','1992-05-03','m','dubai','american',0,0,'admin.jpg'),
 ('ayushi@gmail.com','ayushi','user','29c65f781a1068a41f735e1b092546de','1992-05-03','f','india','indian',0,2,'ayushi.jpg'),
 ('prags@gmail.com','pragati','user','3c24ca7afbc8766f1acb7d67893ec16d','1993-02-05','f','other','other',0,2,'pragati.jpg'),
 ('swena@gmail.com','swena','user','2708c3704f3c6a7b3a9e685289b412aa','1991-08-03','f','india','indian',0,3,'swena.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `videoid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `time_of_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `duration` varchar(50) NOT NULL,
  `no_of_views` int(11) NOT NULL,
  `no_of_likes` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `no_of_comments` int(11) NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `videourl` varchar(100) NOT NULL,
  PRIMARY KEY (`videoid`),
  UNIQUE KEY `title` (`title`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` (`videoid`,`title`,`description`,`userid`,`time_of_upload`,`duration`,`no_of_views`,`no_of_likes`,`category`,`no_of_comments`,`comment_status`,`videourl`) VALUES 
 (8,'rabbit','rabbit and the buterfly','prags@gmail.com','2013-07-08 00:39:58','00',27,3,'Pets & Animals',0,0,'rabbit.mp4'),
 (9,'try flv','ho jaa yaar','swena@gmail.com','2013-07-08 00:17:46','00',3,0,'Film & Animation',0,0,'try flv.flv'),
 (10,'bikes','must watch it','abhoja@gmail.com','2013-07-08 00:32:28','00',1,0,'Sports',0,0,'bikes.mp4'),
 (11,'animate it!!','a perfect animation mavie','abhoja@gmail.com','2013-07-08 00:33:46','00',0,0,'Film & Animation',0,0,'animate it!!.mp4'),
 (12,'Movie','song from a nice movie','ayushi@gmail.com','2013-07-08 00:45:11','00',4,0,'Entertainment',0,0,'Movie.mp4'),
 (13,'wildlife','a watch to nature','ayushi@gmail.com','2013-07-08 00:42:46','00',1,0,'Pets & Animals',0,0,'wildlife.wmv'),
 (14,'animation','another animation movie','prags@gmail.com','2013-07-08 00:42:36','00',1,0,'Film & Animation',0,0,'animation.2 Morphing Animation Projects.mp4'),
 (15,'animation 3','perfect example for animation','swena@gmail.com','2013-07-08 00:42:30','00',1,0,'Film & Animation',0,0,'animation 3.mp4'),
 (16,'picture','something different','swena@gmail.com','2013-07-08 00:39:54','00',1,0,'Entertainment',0,0,'picture.mp4');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
