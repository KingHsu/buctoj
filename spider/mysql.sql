/*
 Navicat Premium Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : acm

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 03/07/2024 14:52:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for atcoder
-- ----------------------------
DROP TABLE IF EXISTS `atcoder`;
CREATE TABLE `atcoder`  (
  `ac_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `ac_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `ac_contest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '比赛名称',
  `ac_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排名',
  `ac_performance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表现',
  `ac_newRating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新积分',
  `ac_diff` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '积分变化',
  `ac_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '比赛次数',
  `ac_maxRating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最高积分',
  PRIMARY KEY (`ac_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of atcoder
-- ----------------------------
INSERT INTO `atcoder` VALUES ('2021040048', '2022-05-29 23:00:00+0900', 'AtCoder Regular Contest 141', '629', '1595', '1317', '+39', '24', '1317');
INSERT INTO `atcoder` VALUES ('buctAI2001lpf', '2022-03-20 22:40:00+0900', 'AtCoder Beginner Contest 244', '6397', '41', '628', '-83', '26', '763');
INSERT INTO `atcoder` VALUES ('BUCTZZW', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '4708', '440', '213', '+33', '4', '213');
INSERT INTO `atcoder` VALUES ('code__learner', '2022-03-12 22:40:00+0900', 'AtCoder Beginner Contest 243', '1440', '1289', '910', '+56', '20', '910');
INSERT INTO `atcoder` VALUES ('disloss', '2021-11-13 22:40:00+0900', 'KEYENCE Programming Contest 2021 (AtCoder Beginner Contest 227)', '4949', '97', '537', '-61', '22', '598');
INSERT INTO `atcoder` VALUES ('DragonBingling', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '3030', '-', '-', '-', '6', '219');
INSERT INTO `atcoder` VALUES ('empathy117', '2022-06-19 23:00:00+0900', 'AtCoder Regular Contest 142', '1951', '-', '-', '-', '63', '1452');
INSERT INTO `atcoder` VALUES ('happen', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '5452', '287', '83', '+29', '4', '83');
INSERT INTO `atcoder` VALUES ('LetMeFly', '2022-05-15 23:00:00+0900', 'AtCoder Regular Contest 140', '1582', '273', '725', '-43', '71', '1091');
INSERT INTO `atcoder` VALUES ('liangkaixing', '2022-06-04 22:40:00+0900', 'AtCoder Beginner Contest 254', '8343', '-', '-', '-', '54', '1302');
INSERT INTO `atcoder` VALUES ('lucyvan', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '3444', '714', '285', '+89', '4', '285');
INSERT INTO `atcoder` VALUES ('t2021210481', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '4673', '445', '127', '+40', '4', '127');
INSERT INTO `atcoder` VALUES ('tlopex', '2022-06-11 22:40:00+0900', 'Aising Programming Contest 2022（AtCoder Beginner Contest 255）', '7787', '-', '-', '-', '33', '1134');
INSERT INTO `atcoder` VALUES ('waiiting', '2022-05-29 23:00:00+0900', 'AtCoder Regular Contest 141', '1571', '-', '-', '-', '15', '905');
INSERT INTO `atcoder` VALUES ('XSQ', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '2776', '868', '143', '+87', '4', '143');
INSERT INTO `atcoder` VALUES ('xsysgrandfather', '2022-06-04 22:40:00+0900', 'AtCoder Beginner Contest 254', '7595', '-', '-', '-', '26', '1133');
INSERT INTO `atcoder` VALUES ('Yangjize', '2022-06-19 23:00:00+0900', 'AtCoder Regular Contest 142', '1951', '-', '-', '-', '3', '30');
INSERT INTO `atcoder` VALUES ('yzzupup', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '2088', '1053', '808', '+35', '19', '873');
INSERT INTO `atcoder` VALUES ('zpf', '2022-05-14 22:40:00+0900', 'Panasonic Programming Contest 2022(AtCoder Beginner Contest 251)', '7125', '38', '535', '-86', '18', '621');
INSERT INTO `atcoder` VALUES ('ZxChang', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '3738', '649', '118', '+66', '4', '118');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_0', '2022-06-19 23:00:00+0900', 'AtCoder Regular Contest 142', '1951', '-', '-', '-', '58', '1304');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_01', '2022-10-01 22:40:00+0900', 'KYOCERA Programming Contest 2022（AtCoder Beginner Contest 271）', '6846', '-', '-', '-', '58', '1304');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_02', '2022-10-15 22:40:00+0900', 'Panasonic Programming Contest 2022(AtCoder Beginner Contest 273)', '403', '1854', '1540', '+40', '-', '1344');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_03', '2022-10-29 22:40:00+0900', 'AtCoder Beginner Contest 275', '119', '2400', '1662', '+122', '32', '1466');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_04', '2022-11-05 22:40:00+0900', 'AtCoder Beginner Contest 276', '238', '2114', '1716', '+54', '43', '1520');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_05', '2023-04-09 22:40:00+0900', 'AtCoder Beginner Contest 297', '6684', '-', '-', '-', '5', '1520');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_06', '2023-05-20 22:40:00+0900', 'TOYOTA MOTOR CORPORATION Programming Contest 2023#2 (AtCoder Beginner Contest 302)', '7509', '-', '-', '-', '2', '1520');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_07', '2023-10-14 22:40:00+0900', 'Japan Registry Services (JPRS) Programming Contest 2023 (AtCoder Beginner Contest 324)', '10800', '-', '-', '-', '3', '1520');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_08', '2023-10-28 22:40:00+0900', 'Panasonic Programming Contest 2023（AtCoder Beginner Contest 326）', '9755', '-', '-', '-', '8', '1520');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_09', '2023-12-09 23:00:00+0900', 'estie Programming Contest 2023 (AtCoder Regular Contest 169)', '1711', '-', '-', '-', '4', '1520');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_00', '2024-01-06 22:40:00+0900', 'AtCoder Beginner Contest 335 (Sponsored by Mynavi)', '10288', '-', '-', '-', '11', '1520');

-- ----------------------------
-- Table structure for codeforces
-- ----------------------------
DROP TABLE IF EXISTS `codeforces`;
CREATE TABLE `codeforces`  (
  `cf_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `cf_contest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比赛名称',
  `cf_contest_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '比赛名称id',
  `cf_rank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比赛的排名',
  `cf_old_rating` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧积分',
  `cf_new_rating` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最新积分',
  `cf_sum_contest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与比赛的总数',
  `cf_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`cf_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of codeforces
-- ----------------------------
INSERT INTO `codeforces` VALUES ('1710252529', 'Codeforces Round #604 (Div. 2)', '1265', '1769', '1561', '1551', '13', '2019-12-06 00:35:00');
INSERT INTO `codeforces` VALUES ('buctAI2001lipeifeng', 'Codeforces Round #789 (Div. 2)', '1678', '147', '1524', '1692', '46', '2022-05-09 00:35:00');
INSERT INTO `codeforces` VALUES ('CleverXun', 'Codeforces Round #789 (Div. 2)', '1678', '39', '1830', '1969', '46', '2022-05-09 00:35:00');
INSERT INTO `codeforces` VALUES ('code__learner', 'Codeforces Round #788 (Div. 2)', '1670', '774', '1693', '1721', '65', '2022-05-07 00:35:00');
INSERT INTO `codeforces` VALUES ('disloss', 'Codeforces Round #791 (Div. 2)', '1679', '2633', '1404', '1406', '61', '2022-05-14 19:35:00');
INSERT INTO `codeforces` VALUES ('empathy117', 'Codeforces Round #789 (Div. 2)', '1678', '109', '1731', '1848', '85', '2022-05-09 00:35:00');
INSERT INTO `codeforces` VALUES ('happen', 'Codeforces Round #545 (Div. 2)', '1138', '1319', '1247', '1308', '9', '2019-03-08 19:35:00');
INSERT INTO `codeforces` VALUES ('langa', 'Codeforces Round #560 (Div. 3)', '1165', '2817', '1389', '1331', '17', '2019-05-15 00:35:00');
INSERT INTO `codeforces` VALUES ('LetMeFly', 'Codeforces Round #791 (Div. 2)', '1679', '2340', '1602', '1566', '99', '2022-05-14 19:35:00');
INSERT INTO `codeforces` VALUES ('liangdaye', 'Codeforces Round #789 (Div. 1)', '1677', '607', '1947', '1936', '56', '2022-05-09 00:35:00');
INSERT INTO `codeforces` VALUES ('Tlopex', 'Educational Codeforces Round 128 (Rated for Div. 2)', '1680', '459', '1834', '1866', '61', '2022-05-14 00:35:00');
INSERT INTO `codeforces` VALUES ('Vanthoci', 'Codeforces Round #791 (Div. 2)', '1679', '443', '1767', '1811', '24', '2022-05-14 19:35:00');
INSERT INTO `codeforces` VALUES ('waiiting', 'Codeforces Round #796 (Div. 2)', '1688', '736', '1674', '1709', '27', '2022-06-04 00:35:00');
INSERT INTO `codeforces` VALUES ('xiaopengyou', 'Educational Codeforces Round 50 (Rated for Div. 2)', '1036', '2682', '1421', '1392', '16', '2018-09-08 00:35:00');
INSERT INTO `codeforces` VALUES ('xushuyu-s-grandfather', 'Codeforces Round #796 (Div. 2)', '1688', '983', '1732', '1734', '36', '2022-06-04 00:35:00');
INSERT INTO `codeforces` VALUES ('zpf666', 'Educational Codeforces Round 128 (Rated for Div. 2)', '1680', '400', '1578', '1691', '38', '2022-05-14 00:35:00');
INSERT INTO `codeforces` VALUES ('Vanthoci0', 'Codeforces Round 905 (Div. 2)', '1950', '394', '1767', '1760', '5', '2023-10-22 14-5-0');
INSERT INTO `codeforces` VALUES ('Vanthoci1', 'Codeforces Round 902 (Div. 1, based on COMPFEST 15 - Final Round)', '1957', '696', '1760', '1753', '2', '2023-10-8 12-5-0');
INSERT INTO `codeforces` VALUES ('Vanthoci2', 'Codeforces Round 893 (Div. 2)', '1963', '340', '1753', '1796', '3', '2023-8-15 17-35-0');
INSERT INTO `codeforces` VALUES ('Vanthoci3', 'Codeforces Round 892 (Div. 2)', '1920', '247', '1796', '1882', '4', '2023-8-12 17-35-0');
INSERT INTO `codeforces` VALUES ('Vanthoci4', 'Codeforces Round 890 (Div. 2) supported by Constructor Institute', '1834', '347', '1882', '1976', '4', '2023-8-5 17-35-0');
INSERT INTO `codeforces` VALUES ('Vanthoci5', 'Codeforces Round 889 (Div. 2)', '1740', '4828', '1976', '1860', '2', '2023-7-29 17-35-0');
INSERT INTO `codeforces` VALUES ('Vanthoci6', 'Educational Codeforces Round 152 (Rated for Div. 2)', '1856', '278', '1860', '1950', '4', '2023-7-27 17-35-0');
INSERT INTO `codeforces` VALUES ('Vanthoci7', 'Codeforces Round 861 (Div. 2)', '1766', '1203', '1950', '1915', '2', '2023-3-29 12-5-0');
INSERT INTO `codeforces` VALUES ('Vanthoci8', 'Codeforces Round 858 (Div. 2)', '1801', '442', '1915', '1968', '3', '2023-3-18 15-5-0');
INSERT INTO `codeforces` VALUES ('Vanthoci9', 'Codeforces Round 857 (Div. 2)', '1748', '809', '1968', '1940', '3', '2023-3-9 12-35-0');




-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_ac_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_cf_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stu_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '田帅华', '2105', 't2021210481', 'BUCTTSH');
INSERT INTO `student` VALUES ('10', '洪枢适', '2111', 'tlopex', 'Tlopex');
INSERT INTO `student` VALUES ('11', '曾朴凡', '2001', 'zpf', 'zpf666');
INSERT INTO `student` VALUES ('12', '梁凯星', '2004', 'liangkaixing', 'liangdaye');
INSERT INTO `student` VALUES ('13', '巴同学', '2004', 'empathy117', 'empathy117');
INSERT INTO `student` VALUES ('14', '陈柯舟', '1906', 'disloss', 'disloss');
INSERT INTO `student` VALUES ('15', '黄东琦', '2102', '2021040048', 'Vanthoci');
INSERT INTO `student` VALUES ('16', '李佩峰', '2001', 'buctAI2001lpf', 'buctAI2001lipeifeng');
INSERT INTO `student` VALUES ('17', '李腾飞', '1906', 'LetMeFly', 'LetMeFly');
INSERT INTO `student` VALUES ('18', '刘祥睿', '2104', 'xsysgrandfather', 'xushuyu-s-grandfather');
INSERT INTO `student` VALUES ('19', '邱若昕', '2106', 'waiiting', 'waiiting');
INSERT INTO `student` VALUES ('2', '常泽星', '2105', 'ZxChang', 'xiaopengyou');
INSERT INTO `student` VALUES ('20', '闫阳旭', '1901', 'code__learner', 'code__learner');
INSERT INTO `student` VALUES ('21', '曾梓勋', '2007', 'ZZXzzx0_0', 'CleverXun');
INSERT INTO `student` VALUES ('3', '范露曦', '2105', 'lucyvan', 'langa');
INSERT INTO `student` VALUES ('4', '张占文', '2105', 'BUCTZZW', '1710252529');
INSERT INTO `student` VALUES ('5', '许舜清', '2105', 'XSQ', 'XSQ');
INSERT INTO `student` VALUES ('6', '郭力玮', '2105', 'happen', 'happen');
INSERT INTO `student` VALUES ('7', '杨济泽', '2105', 'Yangjize', 'kukuZe');
INSERT INTO `student` VALUES ('8', '刘洋滔', '2105', 'DragonBingling', '');
INSERT INTO `student` VALUES ('9', '杨泽忠', '2105', 'yzzupup', 'yzzupup');

SET FOREIGN_KEY_CHECKS = 1;
