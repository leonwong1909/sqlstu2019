/*
 Navicat Premium Data Transfer

 Source Server         : wang
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 192.168.1.52:3306
 Source Schema         : net

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 21/06/2019 14:05:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Brand` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌',
  `model` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '型号',
  `price` decimal(7, 2) NOT NULL COMMENT '价格',
  `time` date NOT NULL COMMENT '上市时间',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '国家',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phone
-- ----------------------------
INSERT INTO `phone` VALUES (1, '苹果', 'iPhone XS Max', 12299.00, '2018-09-13', 'US');
INSERT INTO `phone` VALUES (2, '苹果', 'iPhone XS', 11399.00, '2018-09-13', 'US');
INSERT INTO `phone` VALUES (3, '苹果', 'iPhone XR', 7599.00, '2018-09-13', 'US');
INSERT INTO `phone` VALUES (4, '三星', 'Galaxy S10+', 6499.00, '2019-02-20', 'KR');
INSERT INTO `phone` VALUES (5, '三星', 'Galaxy S10e', 4999.00, '2019-02-20', 'KR');
INSERT INTO `phone` VALUES (6, '华为', 'P30 pro', 5988.00, '2019-03-26', 'CN');
INSERT INTO `phone` VALUES (7, '华为', 'P30', 4788.00, '2019-03-26', 'CN');
INSERT INTO `phone` VALUES (8, '小米', 'xiaomi 9', 3699.00, '2019-05-20', 'CN');
INSERT INTO `phone` VALUES (9, '小米', 'Redmi K20', 2799.00, '2019-05-28', 'CN');

SET FOREIGN_KEY_CHECKS = 1;
