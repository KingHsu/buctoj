/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : oj

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 06/07/2024 11:01:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `stu_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班级',
  `stu_ac_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ac账户名',
  `stu_cf_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cf账户名',
  `stu_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户登录密码',
  `stu_man` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为管理员',
  `stu_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学号',
  `stu_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录用户名',
  PRIMARY KEY (`stu_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '田帅华', '2105', 't2021210481', 'BUCTTSH', '123456', '0', '2021210481', 'aa');
INSERT INTO `student` VALUES ('10', '洪枢适', '2111', 'tlopex', 'Tlopex', '123456', '0', '2021042153', 'bb');
INSERT INTO `student` VALUES ('11', '曾朴凡', '2001', 'zpf', 'zpf666', '123456', '0', '2021205648', 'cc');
INSERT INTO `student` VALUES ('12', '梁凯星', '2004', 'liangkaixing', 'liangdaye', '123456', '0', '2021050643', 'dd');
INSERT INTO `student` VALUES ('13', '巴同学', '2004', 'empathy117', 'empathy117', '123456', '0', '2021050123', 'ee');
INSERT INTO `student` VALUES ('14', '陈柯舟', '1906', 'disloss', 'disloss', '123456', '0', '2021060485', 'qq');
INSERT INTO `student` VALUES ('15', '黄东琦', '2102', '2021040048', 'Vanthoci', '123456', '0', '2021040568', 'www');
INSERT INTO `student` VALUES ('16', '李佩峰', '2001', 'buctAI2001lpf', 'buctAI2001lipeifeng', '123456', '0', '2021040532', 'rr');
INSERT INTO `student` VALUES ('17', '李腾飞', '1906', 'LetMeFly', 'LetMeFly', '123456', '0', '2021040125', 'tt');
INSERT INTO `student` VALUES ('18', '刘祥睿', '2104', 'xsysgrandfather', 'xushuyu-s-grandfather', '123456', '0', '2021040136', 'yy');
INSERT INTO `student` VALUES ('19', '邱若昕', '2106', 'waiiting', 'waiiting', '123456', '0', '2021041111', 'uu');
INSERT INTO `student` VALUES ('2', '常泽星', '2105', 'ZxChang', 'xiaopengyou', '123456', '0', '2021040142', 'ii');
INSERT INTO `student` VALUES ('20', '闫阳旭', '1901', 'code__learner', 'code__learner', '123456', '0', '2021040156', 'oo');
INSERT INTO `student` VALUES ('21', '曾梓勋', '2007', 'ZZXzzx0_0', 'CleverXun', '123456', '0', '2021040785', 'ppp');
INSERT INTO `student` VALUES ('3', '范露曦', '2105', 'lucyvan', 'langa', '123456', '0', '2021040532', 'aaa');
INSERT INTO `student` VALUES ('4', '张占文', '2105', 'BUCTZZW', '1710252529', '123456', '0', '2021040742', 'ss');
INSERT INTO `student` VALUES ('5', '许舜清', '2105', 'XSQ', 'XSQ', '123456', '0', '2021040154', 'dd');
INSERT INTO `student` VALUES ('6', '郭力玮', '2105', 'happen', 'happen', '123456', '0', '2021040732', 'fff');
INSERT INTO `student` VALUES ('60', '徐康灵', '2104', 'kang', 'cleverkang', '123456', '1', '2021040047', 'admin01');
INSERT INTO `student` VALUES ('61', 'jzy', '2104', 'jjzy', 'zzyy', '123456', '1', '2021040049', 'admin02');
INSERT INTO `student` VALUES ('7', '杨济泽', '2105', 'Yangjize', 'kukuZe', '123456', '0', '2021040025', 'ggg');
INSERT INTO `student` VALUES ('8', '刘洋滔', '2105', 'DragonBingling', '', '123456', '0', '2021040078', 'hh');
INSERT INTO `student` VALUES ('9', '杨泽忠', '2105', 'yzzupup', 'yzzupup', '123456', '0', '2021040098', 'jj');

SET FOREIGN_KEY_CHECKS = 1;
