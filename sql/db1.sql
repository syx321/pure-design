/*
 Navicat Premium Data Transfer

 Source Server         : chenlong
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : tdb1

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 22/06/2022 00:14:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_change
-- ----------------------------
DROP TABLE IF EXISTS `account_change`;
CREATE TABLE `account_change` (
  `user_id` int NOT NULL,
  `recharge_record` double DEFAULT NULL COMMENT '充值记录',
  `consume_record` double DEFAULT NULL COMMENT '消费记录',
  `income_record` double DEFAULT NULL COMMENT '货款到账',
  `time` bigint DEFAULT NULL COMMENT '记录时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of account_change
-- ----------------------------
BEGIN;
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, 2000, NULL, NULL, 1654952273060);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, 500, NULL, NULL, 1654952273060);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, 3000, NULL, NULL, 1654952273060);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, 500, NULL, NULL, 1654952273060);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, NULL, NULL, 9999, 1655031727771);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, NULL, NULL, 7899, 1655037770369);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, NULL, NULL, 7899, 1655038083281);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, NULL, NULL, 7899, 1655038659051);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, NULL, NULL, 2199, 1655053482082);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, 2199, NULL, 1655054402141);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, NULL, 2199, 1655054402145);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, 2199, NULL, 1655054470936);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, NULL, 2199, 1655054470938);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, 2199, NULL, 1655054521972);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, NULL, 2199, 1655054521977);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, 2199, NULL, 1655054550712);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, NULL, NULL, 2199, 1655054550716);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, 2199, NULL, 1655054559681);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, NULL, NULL, 2199, 1655054559692);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (1, NULL, 2199, NULL, 1655054581063);
INSERT INTO `account_change` (`user_id`, `recharge_record`, `consume_record`, `income_record`, `time`) VALUES (2, NULL, NULL, 2199, 1655054581066);
COMMIT;

-- ----------------------------
-- Table structure for business_product
-- ----------------------------
DROP TABLE IF EXISTS `business_product`;
CREATE TABLE `business_product` (
  `user_id` int DEFAULT '1',
  `product_id` int DEFAULT '1' COMMENT '商家持有的物品'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of business_product
-- ----------------------------
BEGIN;
INSERT INTO `business_product` (`user_id`, `product_id`) VALUES (2, NULL);
INSERT INTO `business_product` (`user_id`, `product_id`) VALUES (2, 1);
INSERT INTO `business_product` (`user_id`, `product_id`) VALUES (2, 2);
INSERT INTO `business_product` (`user_id`, `product_id`) VALUES (2, 3);
COMMIT;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `id_card_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证照片',
  `name` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `sex` tinyint DEFAULT NULL,
  `bank_card` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT '管理员、商家、用户',
  `license` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT '商家营业执照img转二进制存储',
  `register_checked` tinyint DEFAULT NULL COMMENT 'register_checked',
  `avatar` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT 'image转二进制',
  `simple_info` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `wechat` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `shopping_points` int DEFAULT NULL COMMENT '购物积分(100减1元)',
  `balance` double DEFAULT NULL COMMENT '账户余额',
  `level` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT '卖家等级',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of person
-- ----------------------------
BEGIN;
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (1, 'admin', '123456', NULL, 'longdengy', '1888000', '123@cc.com', 'Beijing', 1, '12345678', 'ROLE_ADMIN', '证书图片', 0, 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', NULL, 'LL464050079', 'China', 300, 0, NULL);
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (2, 'ldy', '123456', NULL, 'ldy', '166889', '456@cc.com', 'Qingdao', 1, '1234567', 'ROLE_USER', '证书图片', 1, '头像图片', NULL, 'LL123', 'China', 100, 0, 'LEVEL_5');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (3, 'buss', '123', NULL, NULL, '213', '', '', 0, '21321123', 'ROLE_BUSINESS', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (4, 'admin2', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE_ADMIN', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (33, 'uwrong', '123', NULL, NULL, '21312', '325sf', 'sdvf', 1, '12326571', 'ROLE_USER', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (34, 'uwrong12', '123', NULL, NULL, '21312', '325sf', 'sdvf', 1, '12326571', 'ROLE_USER', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (35, 'uwrong3', '123', NULL, NULL, '213123', '213123', '', 1, '2131', 'ROLE_USER', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (36, 'bwrong1', '123', '', NULL, '123123', '', '', 0, '', 'ROLE_BUSINESS', '', 1, NULL, NULL, NULL, NULL, NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (37, 'bsuc', '123', 'https://s3.bmp.ovh/imgs/2022/06/13/4617f1003dbcddf1.jpeg', NULL, '123123', 'bsuc@qq.com 2222', '', 0, '', 'ROLE_USER', 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', 0, 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', '我是bsuc 2222', 'bsuc_wechat 2222', 'china/beijing 2222', NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (39, 'uwrong14', '123', NULL, NULL, '21312', '325sf', NULL, NULL, NULL, 'ROLE_USER', NULL, 0, '', 'xzxcz', 'sadasd', 'sdasdasd', NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (41, 'uwrong16', '123', '231232', '2231312', '21312 front change1', '325sf front change1', '213123', 22, '2131', 'ROLE_USER', NULL, 0, NULL, 'xzxcz', 'sadasd', 'sdasdasd front change1', NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (50, 'bsuc1', '123', 'https://s3.bmp.ovh/imgs/2022/06/13/4617f1003dbcddf1.jpeg', NULL, '123123', 'bsuc@qq.com 2222', '', 0, '', 'ROLE_BUSINESS', 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', 1, 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', '我是bsuc 2222', 'bsuc_wechat 2222', 'china/beijing 2222', NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (51, 'bsuc2', '123', 'https://s3.bmp.ovh/imgs/2022/06/13/4617f1003dbcddf1.jpeg', NULL, '123123', 'bsuc@qq.com 2222', '', 0, '', 'ROLE_BUSINESS', 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', 0, 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', '我是bsuc 2222', 'bsuc_wechat 2222', 'china/beijing 2222', NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (52, 'bsuc4', '123', 'https://s3.bmp.ovh/imgs/2022/06/13/4617f1003dbcddf1.jpeg', NULL, '123123', 'bsuc@qq.com 2222', '', 0, '', 'ROLE_BUSINESS', 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', 0, 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', '我是bsuc 2222', 'bsuc_wechat 2222', 'china/beijing 2222', NULL, 0, 'LEVEL_1');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (53, 'bsuc3', '123', 'https://s3.bmp.ovh/imgs/2022/06/13/4617f1003dbcddf1.jpeg', NULL, '123123', 'bsuc@qq.com 2222', '', 0, '', 'ROLE_BUSINESS', 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', 0, 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', '我是bsuc 2222', 'bsuc_wechat 2222', 'china/beijing 2222', NULL, 0, 'LEVEL_3');
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (54, 'bsuc34', '123', 'https://s3.bmp.ovh/imgs/2022/06/13/4617f1003dbcddf1.jpeg', NULL, 'ssss', 'ssss', NULL, 0, NULL, 'ROLE_BUSINESS', 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', 0, 'https://s3.bmp.ovh/imgs/2022/06/14/203889e7d6940128.jpeg', NULL, NULL, 'sss', NULL, 0, 'LEVEL_2');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `business_id` int DEFAULT NULL COMMENT '卖家的userId',
  `name` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类',
  `size` double DEFAULT NULL COMMENT '尺寸',
  `img` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT 'img转二进制存',
  `stock_num` int DEFAULT NULL COMMENT '库存数量',
  `history_sale_num` int DEFAULT NULL COMMENT '历史销量',
  `purchase_num` int DEFAULT NULL COMMENT '购买人数',
  `score` int DEFAULT NULL COMMENT '评分',
  `is_delete` tinyint DEFAULT NULL COMMENT '是否删除该商品',
  `deal_style` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT '交易方式',
  `favorable_rate` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT '好评率',
  `is_enable` tinyint DEFAULT NULL COMMENT '是否上架在售',
  `is_checked` tinyint DEFAULT NULL COMMENT '是否通过审核',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` (`product_id`, `business_id`, `name`, `price`, `sort`, `size`, `img`, `stock_num`, `history_sale_num`, `purchase_num`, `score`, `is_delete`, `deal_style`, `favorable_rate`, `is_enable`, `is_checked`) VALUES (1, 2, '手机', 2199, '电子', 4, 'https://img30.360buyimg.com/babel/s1580x830_jfs/t1/109361/24/22897/74054/621ede58E099d37e3/f12730c81df6046a.jpg!cc_1580x830.webp', 591, 109, 109, 5, 0, '二手商城', '100', 1, 1);
INSERT INTO `product` (`product_id`, `business_id`, `name`, `price`, `sort`, `size`, `img`, `stock_num`, `history_sale_num`, `purchase_num`, `score`, `is_delete`, `deal_style`, `favorable_rate`, `is_enable`, `is_checked`) VALUES (2, 2, '电脑', 7899, '电子', 5, 'https://img30.360buyimg.com/babel/s1580x830_jfs/t1/109361/24/22897/74054/621ede58E099d37e3/f12730c81df6046a.jpg!cc_1580x830.webp', 999, 50, 50, 5, 0, '线下', '100', 1, 1);
INSERT INTO `product` (`product_id`, `business_id`, `name`, `price`, `sort`, `size`, `img`, `stock_num`, `history_sale_num`, `purchase_num`, `score`, `is_delete`, `deal_style`, `favorable_rate`, `is_enable`, `is_checked`) VALUES (3, 2, '洗衣机', 9999, '电子', 3, 'https://img30.360buyimg.com/babel/s1580x830_jfs/t1/109361/24/22897/74054/621ede58E099d37e3/f12730c81df6046a.jpg!cc_1580x830.webp', 100, 10, 10, 5, 0, '线下', '100', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for purchase_relationship
-- ----------------------------
DROP TABLE IF EXISTS `purchase_relationship`;
CREATE TABLE `purchase_relationship` (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `business_id` int DEFAULT NULL COMMENT '卖家id',
  `user_evaluate` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `count` int DEFAULT NULL COMMENT '购买数量',
  `seller_attitude` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT '商家服务态度',
  `deliver_state` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT '交易状态',
  `received_time` bigint DEFAULT NULL COMMENT '拿时间戳算收货时长',
  `score` int DEFAULT NULL COMMENT '本次交易评分',
  `seller_evaluate` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL COMMENT '卖家对客户评价',
  `is_cart` tinyint DEFAULT NULL COMMENT '是否在购物车',
  `create_time` bigint DEFAULT NULL COMMENT '订单创建时间',
  `total` double DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase_relationship
-- ----------------------------
BEGIN;
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (1, 1, 1, 2, '物品很好', 5, '商家很好', 'FINISHED', 1654952273060, 5, '客户很好', 0, 1654952273040, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (2, 1, 2, 2, '电脑很好', 2, '商家很好', 'FINISHED', 1654952273060, 5, '客户态度好', 0, 1654952273060, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (3, 1, 3, 2, '洗衣机很好', 1, '商家服务好', 'FINISHED', 1655031727771, 4, '顾客态度好', 0, 1654952273060, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (4, 1, 2, 2, '电脑还是很好', 1, '商家很好', 'FINISHED', 1655038659051, 5, '爱顾客', 0, 1655031727771, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (5, 1, 1, 2, NULL, 1, NULL, 'RECEIVED', 1655053482082, NULL, NULL, 0, 1655053423169, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (6, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655053711660, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (8, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054402151, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (9, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054470945, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (10, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054521987, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (11, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054550725, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (12, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054559698, NULL);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`, `total`) VALUES (13, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054581070, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (6, '商家管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (7, '商品管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (4, '用户', '用户', 'ROLE_USER');
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (5, '商家', '商家', 'ROLE_BUSINESS');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 5);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 7);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 8);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 9);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 39);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 40);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 41);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 39);
COMMIT;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `user_id` int DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时间',
  `pid` int DEFAULT NULL COMMENT '父id',
  `origin_id` int DEFAULT NULL COMMENT '最上级评论id',
  `article_id` int DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
BEGIN;
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', 1, '2022-03-22 20:00:00', NULL, NULL, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (2, '123', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (5, '回复内容', 1, '2022-03-22 21:01:00', NULL, NULL, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (6, '4444', 1, '2022-03-22 21:03:15', 4, 4, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (7, '5555', 1, '2022-03-22 21:04:11', 4, 4, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (8, '444444', 1, '2022-03-22 21:29:55', 7, 7, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (9, '5555', 1, '2022-03-22 21:30:04', 7, 7, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (10, '666', 1, '2022-03-22 21:34:05', 7, 4, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (11, '甄姬真的好大好大！！', 16, '2022-03-22 21:38:26', 10, 4, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (13, '哈哈哈哈，我是ddd', 28, '2022-03-22 21:46:01', 12, 12, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (14, '我是李信，我很萌', 20, '2022-03-22 21:46:48', 13, 12, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (15, '我在回复ddd', 20, '2022-03-22 21:47:03', 13, 12, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (16, '我是李信', 20, '2022-03-22 21:48:19', 4, 4, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (17, '33333', 20, '2022-03-22 21:48:42', 5, 5, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (19, '我是李信嗯嗯嗯', 20, '2022-03-22 21:49:21', 1, 1, 1);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (21, '哈哈哈 我是ddd', 28, '2022-03-22 21:50:04', 20, 1, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
