/*
SQLyog Professional v13.1.1 (32 bit)
MySQL - 10.4.25-MariaDB : Database - practitioner
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`practitioner` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `practitioner`;

/*Table structure for table `practitioner_list` */

DROP TABLE IF EXISTS `practitioner_list`;

CREATE TABLE `practitioner_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `upload` int(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `meetinglink` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT '',
  `phone` varchar(255) DEFAULT NULL,
  `rank` int(255) DEFAULT 0,
  `review` int(255) DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `role` int(11) DEFAULT 1,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;

/*Data for the table `practitioner_list` */

insert  into `practitioner_list`(`id`,`firstname`,`lastname`,`specialty`,`imageURL`,`upload`,`tags`,`meetinglink`,`address`,`city`,`zipcode`,`state`,`phone`,`rank`,`review`,`email`,`country`,`status`,`role`,`password`) values 
(205,'Nima','Farshid','Bio-Well practitioner, Reiki Master, Sound Healer, Meditation Coach','https://biohackingcongress.com/storage/users/June2023/9Q67Ebbs5rPLWWmWGZET.png',0,'Reiki, biowell, soundhealer, meditation','https://calendly.com/nimafarshid/biowell','11532 Via Lucerna Cir','Windermere','34786','FL','407-230-8179',3,5,'nima02@yahoo.com','US','active',0,'$2b$10$WZ9pp7nsSEcgglZD8W8oueFvDfSDKKY1VJ.wVWRGRKubqDlowH2UG'),
(206,'Christy','Kojak','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'565 Pioneer Road','Rexburg','83440','Idaho','(409)429-0150',0,0,'christykojak97@icloud.com','United States','pending',1,NULL),
(207,'Annete','Kozel','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','1237 Cherese Lane','BINGHAMTON','13905','New York','',NULL,NULL,'balanceannette@yahoo.com','United States','active',1,NULL),
(208,'samah','alothman','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'540 N central aveune','Glendale','91203','California','(505) 971-225',0,0,'samah.tft@gmail.com','United States','pending',1,NULL),
(209,'Colleen','Vissa','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'27 Myles Standish Drive','Carver','2330','Massachusetts','(508) 479-6235',0,0,'cvissa84@gmail.com','United States','pending',1,NULL),
(210,'Carolina','Williams','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','50 menores ave','coral gables','33134','Florida','',NULL,NULL,'maitrifulness@gmail.com','United States','active',1,NULL),
(211,'Anne','Fenwick','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','1 woodlands park villas','North Gosforth','NE13 6PR','England','07950 110497',NULL,NULL,'annefenwick24@yahoo.com','United Kingdom','active',1,NULL),
(212,'Vanessa','Realpe','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'11657 Southwest 12th Place','Davie','33325','Florida','(954) 931-9773',0,0,'vanessarealpe@hotmail.com','United States','pending',1,NULL),
(213,'Jennifer','Knippenberg','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'374 Brewster Rd','Indialantic','32903','Florida',NULL,0,0,'jennfrancine@gmail.com','United States','pending',1,NULL),
(214,'Daniela','Bartelli','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'1764 Malvern Hill Circle','Celebration','34747','Florida','(561) 235-1047',0,0,'daniela_bartelli@icloud.com','United States','pending',1,NULL),
(215,'Jami','Byrne','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'2509 Maylin Drive','Trinity','34655','Florida','(727) 967-6381',0,0,'jvlahakis80@yahoo.com','United States','pending',1,NULL),
(216,'Shannan','Victorino','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'299 NW 52nd Terrace, PHT','Boca Raton','33487','Florida','(774) 365-9192',0,0,'svictorino17@gmail.com','United States','pending',1,NULL),
(217,'Jahnvi','Patel','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'5710 Ternpark Dr','Lithia','33547','Florida','(813) 435-0031',0,0,'jahnvi.pa@gmail.com','United States','pending',1,NULL),
(218,'Zel','Rau','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'230 Legacy Ct','Naples','34110','Florida',NULL,0,0,'bekind111@yahoo.com','United States','pending',1,NULL),
(219,'Rachel','Stackpole','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'12072 72nd way','Largo','33773','Florida','(304) 692-9455',0,0,'rjstackpole@gmail.com','United States','pending',1,NULL),
(220,'Noxtak','Corp','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'2555 Northwest 102nd Avenue Suite 112','Doral','33172','Florida','(786) 405-2140',0,0,'jjml@noxtak.com','United States','pending',1,NULL),
(221,'Angela','Russo','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','4817 North East 5th St Rd','Ocala','34470','Florida','(352) 875-3063',NULL,NULL,'centeredbeautyllc@gmail.com','United States','active',1,NULL),
(222,'Carla','Chandler','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','4464 middlebrook','Orlando','32811','Florida','',NULL,NULL,'vipwht@gmail.com','United States','active',1,NULL),
(223,'Lisa Pipper','Pipper','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'16210 Dew Drop Ln','Tampa','33625','Florida','(813) 390-2090',0,0,'lisa@thesacredstylist.com','United States','pending',1,NULL),
(224,'Sahara','Rose','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'17001 Collins Avenue 4308','Sunny Isles Beach','33160','Florida','(617) 319-5903',0,0,'sr@iamsahararose.com','United States','pending',1,NULL),
(225,'Luis','Diaz','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'223 Sandlewood Trail Unit 2','Winter Park','32789','Florida','(813) 409-8566',0,0,'ladiaz18@gmail.com','United States','pending',1,NULL),
(226,'Alex','D.','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','16425 Collins Avenue Apt 1416','Sunny Isles Beach','33160','Florida','',NULL,NULL,'alexd4884@gmail.com','United States','active',1,NULL),
(227,'Marta','Cuervo de Espinal','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'10275 Collins Avenue','BallHouse','33532','Florida','(202) 230-6922',0,0,'martaluciac15@gmail.com','United States','pending',1,NULL),
(228,'Chelsa','Bruno','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'4111 Northeast 17th Terrace','Pompano Beach','33064','Florida','(516) 455-5472',0,0,'cbruno727@gmail.com','United States','pending',1,NULL),
(229,'Romina','Pederzoli','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'120 Salamanca Avenue','Coral Gables','33134','Florida','(786) 300-7799',0,0,'romipederzoli@hotmail.com','United States','pending',1,NULL),
(230,'Carolina','Williams','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','50 Menores Avenue','Coral Gables','33134','Florida','(305) 590-1894',NULL,NULL,'mindfulcaro78@gmail.com','United States','active',1,NULL),
(231,'Charles','Meyers','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','1704 East Jersey Avenue','Orlando','32806','Florida','(586) 899-4197',NULL,NULL,'s.ocampo.usa@gmail.com','United States','active',1,NULL),
(232,'Julia','Constantine','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'14 Wright Parkway Apt# 3','Fort Walton Beach','33548','Florida','(850) 865-4219',0,0,'juliaconstantine0958@gmail.com','United States','pending',1,NULL),
(233,'Kathryn','Scott','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'PO Box 3094','Tequesta','33469','Florida','(703) 980-1100',0,0,'kathryn@ekasculpture.com','United States','pending',1,NULL),
(234,'Mary','Fisher','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'940 Sandlebury Ct','Port Orange','32127','Florida','(419) 410-6434',0,0,'mhmocha@aol.com','United States','pending',1,NULL),
(235,'Jennifer','Vincent','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'98 Narvarez Ave','St Augustine','32084','Florida','(801) 673-8520',0,0,'jaigern@yahoo.com','United States','pending',1,NULL),
(236,'Joe','Woodstock','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'2424 West Tampa Bay Boulevard','Tampa','33607','Florida','(516) 849-3782',0,0,'jwoodstock0617@gmail.com','United States','pending',1,NULL),
(237,'Amber','Embers','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','190 Westhampton Drive','Palm Coast','32164','Florida','(904) 878-3893',NULL,NULL,'partners@thecosmichippie.rocks','United States','active',1,NULL),
(238,'Eugenio','Carvajal Alban','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'6910 NW 50TH ST','MIami','33195','Florida','(305) 592-0755',0,0,'eugecarv@icloud.com','United States','pending',1,NULL),
(239,'Vicki','Fairleigh','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'721 Pensacola Beach Boulevard','Pensacola Beach','32561','Florida','(850) 291-3613',0,0,'pranichealingrn@gmail.com','United States','pending',1,NULL),
(240,'Nicole','Pavich','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'2333 Brickell Avenue Suite A-1','Miami','33137','Florida','(516) 524-1342',0,0,'nicole@nextwaveholistichealth.com','United States','pending',1,NULL),
(241,'Kendra','Turner','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'551 Quail Drive','Punta Gorda','33982','Florida',NULL,0,0,'kendra@energyhugs.com','United States','pending',1,NULL),
(242,'Michael','Gumiela','Bio-Well Certified Practitioner',NULL,0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence',NULL,'8351 Southeast Magnolia Avenue','Hobe Sound','33455','Florida','(772) 215-7946',0,0,'mgumiela.biowell@gmail.com','United States','pending',1,NULL),
(243,'Andrea','Dretal','Bio-Well Certified Practitioner','',0,'biofield, chakra, sound, frequency, biorhthms, meridians, ANS, coherence','','1008 Trailmore Lane','Weston','33326','Florida','(234) 568-899',NULL,NULL,'info@westondiet.com','United States','active',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
