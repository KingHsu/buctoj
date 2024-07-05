/*
MySQL Backup
Database: oj
Backup Time: 2024-07-05 10:59:08
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `oj`.`ac_contest`;
DROP TABLE IF EXISTS `oj`.`atcoder`;
DROP TABLE IF EXISTS `oj`.`cf_contest`;
DROP TABLE IF EXISTS `oj`.`codeforces`;
DROP TABLE IF EXISTS `oj`.`student`;
DROP VIEW IF EXISTS `oj`.`table01`;
DROP VIEW IF EXISTS `oj`.`table02`;
DROP VIEW IF EXISTS `oj`.`table03`;
CREATE TABLE `ac_contest` (
  `ac_contest_id` int NOT NULL COMMENT '比赛id',
  `ac_contest` varchar(255) DEFAULT NULL COMMENT '比赛名称',
  `ac_type` varchar(255) DEFAULT NULL COMMENT '比赛类型',
  `ac_date` varchar(255) DEFAULT NULL COMMENT '比赛时间',
  `ac_time` varchar(255) DEFAULT NULL COMMENT '持续时长',
  `ac_num` varchar(255) DEFAULT NULL COMMENT '参与人数',
  PRIMARY KEY (`ac_contest_id`)
) ;
CREATE TABLE `atcoder` (
  `ac_num` varchar(255) NOT NULL COMMENT '序号',
  `ac_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `ac_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日期',
  `ac_contest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '比赛名称',
  `ac_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '排名',
  `ac_performance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表现',
  `ac_newRating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '新积分',
  `ac_diff` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '积分变化',
  `ac_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '比赛次数',
  `ac_maxRating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '最高积分',
  PRIMARY KEY (`ac_num`)
) ;
CREATE TABLE `cf_contest` (
  `cf_contest_id` int NOT NULL COMMENT 'id',
  `cf_contest` varchar(255) DEFAULT NULL COMMENT '比赛名称',
  `cf_date` varchar(255) DEFAULT NULL COMMENT '比赛时间',
  `cf_type` varchar(255) DEFAULT NULL COMMENT '比赛类型',
  `cf_time` varchar(255) DEFAULT NULL COMMENT '持续时长/h',
  `cf_num` int DEFAULT NULL COMMENT '参与人数',
  PRIMARY KEY (`cf_contest_id`)
) ;
CREATE TABLE `codeforces` (
  `cf_id` varchar(255)  NOT NULL COMMENT 'id',
  `cf_contest` varchar(255)  DEFAULT NULL COMMENT '比赛名称',
  `cf_contest_id` varchar(255)  DEFAULT NULL COMMENT '比赛名称id',
  `cf_rank` varchar(255)  DEFAULT NULL COMMENT '比赛的排名',
  `cf_old_rating` varchar(255)  DEFAULT NULL COMMENT '旧积分',
  `cf_new_rating` varchar(255)  DEFAULT NULL COMMENT '最新积分',
  `cf_sum_contest` varchar(255)  DEFAULT NULL COMMENT '参与比赛的总数',
  `cf_date` varchar(255)  DEFAULT NULL COMMENT '日期',
  `cf_num` varchar(255)  DEFAULT NULL COMMENT '序号'
) ;
CREATE TABLE `student` (
  `stu_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `stu_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '班级',
  `stu_ac_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ac账户名',
  `stu_cf_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'cf账户名',
  `stu_password` varchar(255) DEFAULT NULL COMMENT '用户登录密码',
  `stu_man` varchar(255) DEFAULT NULL COMMENT '是否为管理员',
  `stu_num` varchar(255) DEFAULT NULL COMMENT '学号',
  `stu_username` varchar(255) DEFAULT NULL COMMENT '登录用户名',
  PRIMARY KEY (`stu_no`) USING BTREE
) ;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `table01` AS select `student`.
    `stu_name` AS `stu_name`,sum(`atcoder`.`ac_count`) AS `ac_count`,sum(`codeforces`.`cf_sum_contest`) AS `cf_count`
    from ((`atcoder` join `codeforces`) join `student`) where ((`student`.`stu_ac_id` = `atcoder`.`ac_id`)
    and (`student`.`stu_cf_id` = `codeforces`.`cf_id`)) group by `student`.`stu_name`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `table02` AS
       select `student`.`stu_name` AS `stu_name`,min(`codeforces`.`cf_old_rating`) AS `cf_old_rating`,
              max(`codeforces`.`cf_new_rating`) AS `cf_new_rating` from (`codeforces` join `student`)
       where (`codeforces`.`cf_id` = `student`.`stu_cf_id`) group by `student`.`stu_name`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `table03` AS
       select sum(`atcoder`.`ac_maxRating`) AS `Sum_ac_Rating`,sum(`codeforces`.`cf_new_rating`) AS `Sum_cf_Rating`,
              `student`.`stu_class` AS `stu_class` from ((`student` join `atcoder`) join `codeforces`)
              where ((`student`.`stu_ac_id` = `atcoder`.`ac_id`) and (`student`.`stu_cf_id` = `codeforces`.`cf_id`))
              group by `student`.`stu_class`;
BEGIN;
LOCK TABLES `oj`.`ac_contest` WRITE;
DELETE FROM `oj`.`ac_contest`;
INSERT INTO `oj`.`ac_contest` (`ac_contest_id`,`ac_contest`,`ac_type`,`ac_date`,`ac_time`,`ac_num`) VALUES (1499, 'TOYOTA SYSTEMS Programming Contest 2023(AtCoder Beginner Contest 330)', 'abc', '2023/11/25 20:00:00	\r\n', '1:40:0', '2'),(1525, 'AtCoder Regular Contest 174', 'arc', '2024/3/17 20:00:00	\r\n', '2:0:0', '1'),(1526, 'Monoxer Programming Contest 2024（AtCoder Beginner Contest 345）', 'abc', '2024/3/16 20:00:00', '1:40:0', '9'),(1531, 'UNIQUE VISION Programming Contest 2024 Spring(AtCoder Beginner Contest 346)	\r\n', 'abc', '2024/3/23 20:00:00', '1:40:0', '9'),(1532, 'AtCoder Beginner Contest 347', 'abc', '2024/3/30 20:00:00', '1:40:0', '7'),(1537, 'AtCoder Beginner Contest 351', 'abc', '2024/4/27 20:00:00	\r\n', '1:40:0', '8'),(1538, 'Toyota Programming Contest 2024#4（AtCoder Beginner Contest 348）', 'abc', '2024/4/6 20:00:00', '1:40:0', '6'),(1539, 'CodeQUEEN 2024 予選 (AtCoder Beginner Contest 358)', 'abc', '2024/6/15 20:00:00', '1:40:0', '1'),(1541, 'Panasonic Programming Contest 2024（AtCoder Beginner Contest 354）	\r\n', 'abc', '2024/5/18 20:00:00', '1:40:0', '1'),(1542, 'AtCoder Regular Contest 177', 'arc', '2024/5/12 20:00:00', '2:0:0', '1'),(1545, 'Tokio Marine & Nichido Fire Insurance Programming Contest 2024（AtCoder Beginner Contest 355)', 'abc', '2024/5/25 20:00:00', '1:40:0', '1'),(1546, 'AtCoder Regular Contest 180', 'arc', '2024/6/29 20:00:00', '2:0:0', '1'),(1548, 'AtCoder Regular Contest 179', 'arc', '2024/6/2 20:00:00', '2:0:0', '1'),(1550, 'SuntoryProgrammingContest2024（AtCoder Beginner Contest 357）	\r\n', 'abc', '2024/6/8 20:00:00', '1:40:0', '2'),(1551, 'AtCoder Beginner Contest 356', 'abc', '2024/6/1 20:00:00', '1:40:0', '1'),(1552, 'AtCoder Beginner Contest 360', 'abc', '2024/6/30 20:00:00', '1:40:0', '9');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `oj`.`atcoder` WRITE;
DELETE FROM `oj`.`atcoder`;
INSERT INTO `oj`.`atcoder` (`ac_num`,`ac_id`,`ac_date`,`ac_contest`,`ac_rank`,`ac_performance`,`ac_newRating`,`ac_diff`,`ac_count`,`ac_maxRating`) VALUES ('1', '2021040048', '2022-05-29 23:00:00+0900', 'AtCoder Regular Contest 141', '629', '1595', '1317', '+39', '24', '1317'),('10', 'liangkaixing', '2022-06-04 22:40:00+0900', 'AtCoder Beginner Contest 254', '8343', '-', '-', '-', '54', '1302'),('11', 'lucyvan', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '3444', '714', '285', '+89', '4', '285'),('12', 't2021210481', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '4673', '445', '127', '+40', '4', '127'),('13', 'tlopex', '2022-06-11 22:40:00+0900', 'Aising Programming Contest 2022（AtCoder Beginner Contest 255）', '7787', '-', '-', '-', '33', '1134'),('14', 'waiiting', '2022-05-29 23:00:00+0900', 'AtCoder Regular Contest 141', '1571', '-', '-', '-', '15', '905'),('15', 'XSQ', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '2776', '868', '143', '+87', '4', '143'),('16', 'xsysgrandfather', '2022-06-04 22:40:00+0900', 'AtCoder Beginner Contest 254', '7595', '-', '-', '-', '26', '1133'),('17', 'Yangjize', '2022-06-19 23:00:00+0900', 'AtCoder Regular Contest 142', '1951', '-', '-', '-', '3', '30'),('18', 'yzzupup', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '2088', '1053', '808', '+35', '19', '873'),('19', 'zpf', '2022-05-14 22:40:00+0900', 'Panasonic Programming Contest 2022(AtCoder Beginner Contest 251)', '7125', '38', '535', '-86', '18', '621'),('2', 'buctAI2001lpf', '2022-03-20 22:40:00+0900', 'AtCoder Beginner Contest 244', '6397', '41', '628', '-83', '26', '763'),('20', 'ZxChang', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '3738', '649', '118', '+66', '4', '118'),('21', 'ZZXzzx0_0', '2022-06-19 23:00:00+0900', 'AtCoder Regular Contest 142', '1951', '-', '-', '-', '58', '1304'),('22', 'ZZXzzx0_0', '2024-01-06 22:40:00+0900', 'AtCoder Beginner Contest 335 (Sponsored by Mynavi)', '10288', '-', '-', '-', '11', '1520'),('23', 'ZZXzzx0_0', '2022-10-01 22:40:00+0900', 'KYOCERA Programming Contest 2022（AtCoder Beginner Contest 271）', '6846', '-', '-', '-', '58', '1304'),('24', 'ZZXzzx0_0', '2022-10-15 22:40:00+0900', 'Panasonic Programming Contest 2022(AtCoder Beginner Contest 273)', '403', '1854', '1540', '+40', '-', '1344'),('25', 'ZZXzzx0_0', '2022-10-29 22:40:00+0900', 'AtCoder Beginner Contest 275', '119', '2400', '1662', '+122', '32', '1466'),('26', 'ZZXzzx0_0', '2022-11-05 22:40:00+0900', 'AtCoder Beginner Contest 276', '238', '2114', '1716', '+54', '43', '1520'),('27', 'ZZXzzx0_0', '2023-04-09 22:40:00+0900', 'AtCoder Beginner Contest 297', '6684', '-', '-', '-', '5', '1520'),('28', 'ZZXzzx0_0', '2023-05-20 22:40:00+0900', 'TOYOTA MOTOR CORPORATION Programming Contest 2023#2 (AtCoder Beginner Contest 302)', '7509', '-', '-', '-', '2', '1520'),('29', 'ZZXzzx0_0', '2023-10-14 22:40:00+0900', 'Japan Registry Services (JPRS) Programming Contest 2023 (AtCoder Beginner Contest 324)', '10800', '-', '-', '-', '3', '1520'),('3', 'BUCTZZW', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '4708', '440', '213', '+33', '4', '213'),('30', 'ZZXzzx0_0', '2023-10-28 22:40:00+0900', 'Panasonic Programming Contest 2023（AtCoder Beginner Contest 326）', '9755', '-', '-', '-', '8', '1520'),('31', 'ZZXzzx0_0', '2023-12-09 23:00:00+0900', 'estie Programming Contest 2023 (AtCoder Regular Contest 169)', '1711', '-', '-', '-', '4', '1520'),('4', 'code__learner', '2022-03-12 22:40:00+0900', 'AtCoder Beginner Contest 243', '1440', '1289', '910', '+56', '20', '910'),('5', 'disloss', '2021-11-13 22:40:00+0900', 'KEYENCE Programming Contest 2021 (AtCoder Beginner Contest 227)', '4949', '97', '537', '-61', '22', '598'),('6', 'DragonBingling', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '3030', '-', '-', '-', '6', '219'),('7', 'empathy117', '2022-06-19 23:00:00+0900', 'AtCoder Regular Contest 142', '1951', '-', '-', '-', '63', '1452'),('8', 'happen', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '5452', '287', '83', '+29', '4', '83'),('9', 'LetMeFly', '2022-05-15 23:00:00+0900', 'AtCoder Regular Contest 140', '1582', '273', '725', '-43', '71', '1091');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `oj`.`cf_contest` WRITE;
DELETE FROM `oj`.`cf_contest`;
INSERT INTO `oj`.`cf_contest` (`cf_contest_id`,`cf_contest`,`cf_date`,`cf_type`,`cf_time`,`cf_num`) VALUES (1973, 'Codeforces Round 945 (Div. 2)', '2024/5/17 22:35:00', 'CF', '2:0:0', 14),(1976, 'Educational Codeforces Round 166 (Rated for Div. 2)	\r\n', '2024/5/30 22:35:00', 'ICPC', '2:0:0', 14),(1978, 'Codeforces Round 953 (Div. 2)', '2024/6/16 17:05:00', 'CF', '2:0:0', 17),(1979, 'Codeforces Round 951 (Div. 2)', '2024/6/6 22:35:00', 'CF', '2:0:0', 16),(1980, 'Codeforces Round 950 (Div. 3)', '2024/6/3 22:35:00', 'ICPC', '2:15:0', 24),(1981, 'Codeforces Round 949 (Div. 2)', '2024/5/31 18:05:00', 'CF', '2:0:0', 17),(1984, 'Codeforces Global Round 26', '2024/6/9 22:35:00', 'CF', '3:0:0', 12),(1985, 'Codeforces Round 952 (Div. 4)', '2024/6/11 22:35:00', 'ICPC', '2:30:0', 29),(1986, 'Codeforces Round 954 (Div. 3)', '2024/6/23 22:50:00', 'ICPC', '2:15:0', 26),(1987, 'EPIC Institute of Technology Round Summer 2024 (Div. 1 + Div. 2)', '2024/6/30 22:35:00', 'CF', '3:0:0', 10),(1989, 'Educational Codeforces Round 167 (Rated for Div. 2)', '2024/6/27 22:35:00', 'ICPC', '2:0:0', 12),(105172, 'The 20th Southeast University Programming Contest (Summer)', '2024/5/26 14:00:00', 'ICPC(vp)', '5:0:0', 1),(105176, '2024 Xian Jiaotong University Programming Contest', '2024/5/19 13:00:00', 'ICPC(vp)', '5:0:0', 2),(105222, 'The 2024 Sichuan Provincial Collegiate Programming Contest', '2024/6/16 09:00:00', 'ICPC(vp)', '5:0:0', 16);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `oj`.`codeforces` WRITE;
DELETE FROM `oj`.`codeforces`;
INSERT INTO `oj`.`codeforces` (`cf_id`,`cf_contest`,`cf_contest_id`,`cf_rank`,`cf_old_rating`,`cf_new_rating`,`cf_sum_contest`,`cf_date`,`cf_num`) VALUES ('1710252529', 'Codeforces Round #604 (Div. 2)', '1265', '1769', '1561', '1551', '13', '2019-12-06 00:35:00', '1'),('buctAI2001lipeifeng', 'Codeforces Round #789 (Div. 2)', '1678', '147', '1524', '1692', '46', '2022-05-09 00:35:00', '2'),('CleverXun', 'Codeforces Round #789 (Div. 2)', '1678', '39', '1830', '1969', '46', '2022-05-09 00:35:00', '3'),('code__learner', 'Codeforces Round #788 (Div. 2)', '1670', '774', '1693', '1721', '65', '2022-05-07 00:35:00', '4'),('disloss', 'Codeforces Round #791 (Div. 2)', '1679', '2633', '1404', '1406', '61', '2022-05-14 19:35:00', '5'),('empathy117', 'Codeforces Round #789 (Div. 2)', '1678', '109', '1731', '1848', '85', '2022-05-09 00:35:00', '6'),('happen', 'Codeforces Round #545 (Div. 2)', '1138', '1319', '1247', '1308', '9', '2019-03-08 19:35:00', '7'),('langa', 'Codeforces Round #560 (Div. 3)', '1165', '2817', '1389', '1331', '17', '2019-05-15 00:35:00', '8'),('LetMeFly', 'Codeforces Round #791 (Div. 2)', '1679', '2340', '1602', '1566', '99', '2022-05-14 19:35:00', '9'),('liangdaye', 'Codeforces Round #789 (Div. 1)', '1677', '607', '1947', '1936', '56', '2022-05-09 00:35:00', '10'),('Tlopex', 'Educational Codeforces Round 128 (Rated for Div. 2)', '1680', '459', '1834', '1866', '61', '2022-05-14 00:35:00', '11'),('Vanthoci', 'Codeforces Round #791 (Div. 2)', '1679', '443', '1767', '1811', '24', '2022-05-14 19:35:00', '12'),('Vanthoci', 'Codeforces Round 905 (Div. 2)', '1950', '394', '1767', '1760', '5', '2023-10-22 14:05:00', '13'),('Vanthoci', 'Codeforces Round 902 (Div. 1, based on COMPFEST 15 - Final Round)', '1957', '696', '1760', '1753', '2', '2023-10-08 12:05:00', '14'),('Vanthoci', 'Codeforces Round 893 (Div. 2)', '1963', '340', '1753', '1796', '3', '2023-08-15 17:35:00', '15'),('Vanthoci', 'Codeforces Round 892 (Div. 2)', '1920', '247', '1796', '1882', '4', '2023-08-12 17:35:00', '16'),('Vanthoci', 'Codeforces Round 890 (Div. 2) supported by Constructor Institute', '1834', '347', '1882', '1976', '4', '2023-08-05 17:35:00', '17'),('Vanthoci', 'Codeforces Round 889 (Div. 2)', '1740', '4828', '1976', '1860', '2', '2023-07-29 17:35:00', '18'),('Vanthoci', 'Educational Codeforces Round 152 (Rated for Div. 2)', '1856', '278', '1860', '1950', '4', '2023-07-27 17:35:00', '19'),('Vanthoci', 'Codeforces Round 861 (Div. 2)', '1766', '1203', '1950', '1915', '2', '2023-03-29 12:05:00', '20'),('Vanthoci', 'Codeforces Round 858 (Div. 2)', '1801', '442', '1915', '1968', '3', '2023-03-18 15:05:00', '21'),('Vanthoci', 'Codeforces Round 857 (Div. 2)', '1748', '809', '1968', '1940', '3', '2023-03-09 12:35:00', '22'),('waiiting', 'Codeforces Round #796 (Div. 2)', '1688', '736', '1674', '1709', '27', '2022-06-04 00:35:00', '23'),('xiaopengyou', 'Educational Codeforces Round 50 (Rated for Div. 2)', '1036', '2682', '1421', '1392', '16', '2018-09-08 00:35:00', '24'),('xushuyu-s-grandfather', 'Codeforces Round #796 (Div. 2)', '1688', '983', '1732', '1734', '36', '2022-06-04 00:35:00', '25'),('zpf666', 'Educational Codeforces Round 128 (Rated for Div. 2)', '1680', '400', '1578', '1691', '38', '2022-05-14 00:35:00', '26');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `oj`.`student` WRITE;
DELETE FROM `oj`.`student`;
INSERT INTO `oj`.`student` (`stu_no`,`stu_name`,`stu_class`,`stu_ac_id`,`stu_cf_id`,`stu_password`,`stu_man`,`stu_num`,`stu_username`) VALUES ('1', '田帅华', '2105', 't2021210481', 'BUCTTSH', '123456', '0', '2021210481', 'aa'),('10', '洪枢适', '2111', 'tlopex', 'Tlopex', '123456', '0', '2021042153', 'bb'),('11', '曾朴凡', '2001', 'zpf', 'zpf666', '123456', '0', '2021205648', 'cc'),('12', '梁凯星', '2004', 'liangkaixing', 'liangdaye', '123456', '0', '2021050643', 'dd'),('13', '巴同学', '2004', 'empathy117', 'empathy117', '123456', '0', '2021050123', 'ee'),('14', '陈柯舟', '1906', 'disloss', 'disloss', '123456', '0', '2021060485', 'qq'),('15', '黄东琦', '2102', '2021040048', 'Vanthoci', '123456', '0', '2021040568', 'www'),('16', '李佩峰', '2001', 'buctAI2001lpf', 'buctAI2001lipeifeng', '123456', '0', '2021040532', 'rr'),('17', '李腾飞', '1906', 'LetMeFly', 'LetMeFly', '123456', '0', '2021040125', 'tt'),('18', '刘祥睿', '2104', 'xsysgrandfather', 'xushuyu-s-grandfather', '123456', '0', '2021040136', 'yy'),('19', '邱若昕', '2106', 'waiiting', 'waiiting', '123456', '0', '2021041111', 'uu'),('2', '常泽星', '2105', 'ZxChang', 'xiaopengyou', '123456', '0', '2021040142', 'ii'),('20', '闫阳旭', '1901', 'code__learner', 'code__learner', '123456', '0', '2021040156', 'oo'),('21', '曾梓勋', '2007', 'ZZXzzx0_0', 'CleverXun', '123456', '0', '2021040785', 'ppp'),('3', '范露曦', '2105', 'lucyvan', 'langa', '123456', '0', '2021040532', 'aaa'),('4', '张占文', '2105', 'BUCTZZW', '1710252529', '123456', '0', '2021040742', 'ss'),('5', '许舜清', '2105', 'XSQ', 'XSQ', '123456', '0', '2021040154', 'dd'),('55', '管理员', '2104', 'ehgse', 'rthse', '123456', '1', '2021040046', 'kkk'),('6', '郭力玮', '2105', 'happen', 'happen', '123456', '0', '2021040732', 'fff'),('7', '杨济泽', '2105', 'Yangjize', 'kukuZe', '123456', '0', '2021040025', 'ggg'),('8', '刘洋滔', '2105', 'DragonBingling', '', '123456', '0', '2021040078', 'hh'),('9', '杨泽忠', '2105', 'yzzupup', 'yzzupup', '123456', '0', '2021040098', 'jj');
UNLOCK TABLES;
COMMIT;
