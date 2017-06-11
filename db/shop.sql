/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-06-11 15:10:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin', '管理员', 'admin');
INSERT INTO `account` VALUES ('2', 'user', '客服A', 'user');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `hot` tinyint(1) DEFAULT '0',
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '男士休闲', '1', '1');
INSERT INTO `category` VALUES ('2', '女士休闲', '1', '1');
INSERT INTO `category` VALUES ('3', '儿童休闲', '1', '2');
INSERT INTO `category` VALUES ('4', '老人休闲', '0', '2');

-- ----------------------------
-- Table structure for forder
-- ----------------------------
DROP TABLE IF EXISTS `forder`;
CREATE TABLE `forder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` double(8,2) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201407021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forder
-- ----------------------------
INSERT INTO `forder` VALUES ('201407013', 'bb', '123', '备注', '2016-04-19 21:08:15', '200.30', '1000', '广州天河区', '1', '1');
INSERT INTO `forder` VALUES ('201407014', '小刚', '18027364651', '输入留言信息', '2016-04-20 21:29:08', '0.01', '', '', '1', '1');
INSERT INTO `forder` VALUES ('201407015', '小刚', '18027364651', '输入留言信息', '2016-04-24 20:27:13', '0.01', '', '', '1', '1');
INSERT INTO `forder` VALUES ('201407016', '小刚', '18027364651', '输入留言信息', '2016-04-25 20:52:51', '0.01', '', '', '1', '1');
INSERT INTO `forder` VALUES ('201407017', '小刚', '18027364651', '输入留言信息', '2016-04-25 21:50:28', '0.01', '', '', '1', '1');
INSERT INTO `forder` VALUES ('201407018', '小刚', '18027364651', '输入留言信息', '2016-04-25 21:58:30', '0.02', '', '', '1', '1');
INSERT INTO `forder` VALUES ('201407019', '小刚', '18027364651', '输入留言信息', '2016-04-25 22:51:38', '0.01', '', '', '1', '1');
INSERT INTO `forder` VALUES ('201407020', '小刚', '18027364651', '输入留言信息', '2016-04-25 22:53:41', '0.01', '', '', '1', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `remark` longtext,
  `xremark` longtext,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commend` tinyint(1) DEFAULT NULL,
  `open` tinyint(1) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '圣得西服', '0.01', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '1');
INSERT INTO `product` VALUES ('2', '罗蒙西服', '0.01', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '1');
INSERT INTO `product` VALUES ('3', '衫衫西服', '0.01', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '1');
INSERT INTO `product` VALUES ('4', '金利来西服', '0.01', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '1');
INSERT INTO `product` VALUES ('5', '韩版女装', '199.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '2');
INSERT INTO `product` VALUES ('6', '雪地靴', '299.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '2');
INSERT INTO `product` VALUES ('7', '欧版女装', '0.01', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '2');
INSERT INTO `product` VALUES ('8', '女款手套', '4999.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '2');
INSERT INTO `product` VALUES ('9', '佳能单反机', '3998.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '3');
INSERT INTO `product` VALUES ('10', '金士顿优盘', '299.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '3');
INSERT INTO `product` VALUES ('11', '日立硬盘', '599.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '3');
INSERT INTO `product` VALUES ('12', '大水牛机箱', '399.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '3');
INSERT INTO `product` VALUES ('13', '电脑桌', '150.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '4');
INSERT INTO `product` VALUES ('14', '老板椅', '199.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '4');
INSERT INTO `product` VALUES ('15', '空调', '3599.00', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '4');
INSERT INTO `product` VALUES ('16', '电视', '0.01', 'test.jpg', '这里是简单介绍', '这里是详细介绍', '2016-04-19 21:08:14', '1', '1', '4');

-- ----------------------------
-- Table structure for sorder
-- ----------------------------
DROP TABLE IF EXISTS `sorder`;
CREATE TABLE `sorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sorder
-- ----------------------------
INSERT INTO `sorder` VALUES ('1', '空调', '200.00', '1', '201407013', '15');
INSERT INTO `sorder` VALUES ('2', '电视', '0.30', '1', '201407013', '16');
INSERT INTO `sorder` VALUES ('3', '圣得西服', '0.01', '1', '201407014', '1');
INSERT INTO `sorder` VALUES ('4', '圣得西服', '0.01', '1', '201407015', '1');
INSERT INTO `sorder` VALUES ('5', '圣得西服', '0.01', '1', '201407016', '1');
INSERT INTO `sorder` VALUES ('6', '圣得西服', '0.01', '2', '201407018', '1');
INSERT INTO `sorder` VALUES ('7', '圣得西服', '0.01', '1', '201407019', '1');
INSERT INTO `sorder` VALUES ('8', '圣得西服', '0.01', '1', '201407020', '1');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', '未支付');
INSERT INTO `status` VALUES ('2', '已支付');
INSERT INTO `status` VALUES ('3', '配送中');
INSERT INTO `status` VALUES ('4', '订单完成');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user', '小刚', 'user', '男', '18027364651', 'soft03_test@sina.com');
INSERT INTO `user` VALUES ('2', 'user2', '小琴', 'user2', '女', '18027364651', 'soft03_test@sina.com');
