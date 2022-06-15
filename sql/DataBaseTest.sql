/*
 Navicat Premium Data Transfer

 Source Server         : connectTest
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : DataBaseTest

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 13/06/2022 22:05:03
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
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`) VALUES (1, '青哥哥的文章标题', '# 我是青哥哥\n## 我是青哥哥2号\n\n::: hljs-center\n\n***++~~==我是那个哥哥==~~++***\n\n:::\n\n> 我是青哥哥的引用\n\n我是B站：程序员青戈\n\n[百度](https://www.baidu.com)\n\n```java\nclass Hello {\n  public static void main(String[] args) {\n    System.out.pringln(\"Hello 青哥哥\");\n  }\n}\n\n```\n\n![搜狗截图20220129174103.png](http://localhost:9090/file/8567a00d2bf740e0a63794baf600cec3.png)\n\n\n', '程序员青戈', '2022-03-22 19:22:58');
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`) VALUES (2, '青哥哥文章2号', '青哥哥文章2号\n\n青哥哥文章2号\n\n青哥哥文章2号\n\n![QQ图片20220307194920.png](http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png)', '程序员青戈', '2022-03-22 19:22:58');
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
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `score` int DEFAULT NULL COMMENT '学分',
  `times` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上课时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '是否开课',
  `teacher_id` int DEFAULT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`id`, `name`, `score`, `times`, `state`, `teacher_id`) VALUES (1, '大学物理', 10, '40', 0, 17);
INSERT INTO `course` (`id`, `name`, `score`, `times`, `state`, `teacher_id`) VALUES (2, '高等数学', 10, '45', NULL, 16);
INSERT INTO `course` (`id`, `name`, `score`, `times`, `state`, `teacher_id`) VALUES (3, '大学英语', 10, '30', NULL, 16);
COMMIT;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `password` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `id_card_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证照片',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `email` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `city` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `sex` tinyint DEFAULT NULL,
  `bank_card` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `role` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '管理员、商家、用户',
  `license` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '商家营业执照img转二进制存储',
  `register_checked` tinyint DEFAULT NULL COMMENT 'register_checked',
  `avatar` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT 'image转二进制',
  `simple_info` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `wechat` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `address` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `shopping_points` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '购物积分(100减1元)',
  `balance` double DEFAULT NULL COMMENT '账户余额',
  `level` int DEFAULT NULL COMMENT '卖家等级',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of person
-- ----------------------------
BEGIN;
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (1, 'admin', '123456', NULL, 'longdengy', '1888000', '123@cc.com', 'Beijing', 1, '12345678', 'ROLE_ADMIN', '证书图片', 1, '头像图片', NULL, 'LL464050079', 'China', '300', 5000, 100);
INSERT INTO `person` (`user_id`, `username`, `password`, `id_card_img`, `name`, `phone`, `email`, `city`, `sex`, `bank_card`, `role`, `license`, `register_checked`, `avatar`, `simple_info`, `wechat`, `address`, `shopping_points`, `balance`, `level`) VALUES (2, 'ldy', '123456', NULL, 'ldy', '166889', '456@cc.com', 'Qingdao', 1, '1234567', 'ROLE_USER', '证书图片', 1, '头像图片', NULL, 'LL123', 'China', '100', 43492, 10);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `business_id` int DEFAULT NULL COMMENT '卖家的userId',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sort` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类',
  `size` double DEFAULT NULL COMMENT '尺寸',
  `img` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT 'img转二进制存',
  `stock_num` int DEFAULT NULL COMMENT '库存数量',
  `history_sale_num` int DEFAULT NULL COMMENT '历史销量',
  `purchase_num` int DEFAULT NULL COMMENT '购买人数',
  `score` int DEFAULT NULL COMMENT '评分',
  `is_delete` tinyint DEFAULT NULL COMMENT '是否删除该商品',
  `deal_style` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '交易方式',
  `favorable_rate` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '好评率',
  `is_enable` tinyint DEFAULT NULL COMMENT '是否上架在售',
  `is_checked` tinyint DEFAULT NULL COMMENT '是否通过审核',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` (`product_id`, `business_id`, `name`, `price`, `sort`, `size`, `img`, `stock_num`, `history_sale_num`, `purchase_num`, `score`, `is_delete`, `deal_style`, `favorable_rate`, `is_enable`, `is_checked`) VALUES (1, 2, '手机', 2199, '电子', 4, 'https://img30.360buyimg.com/babel/s1580x830_jfs/t1/109361/24/22897/74054/621ede58E099d37e3/f12730c81df6046a.jpg!cc_1580x830.webp', 591, 109, 109, 5, 0, '二手商城', '100', 1, 1);
INSERT INTO `product` (`product_id`, `business_id`, `name`, `price`, `sort`, `size`, `img`, `stock_num`, `history_sale_num`, `purchase_num`, `score`, `is_delete`, `deal_style`, `favorable_rate`, `is_enable`, `is_checked`) VALUES (2, 2, '电脑', 7899, '电子', 5, 'https://img30.360buyimg.com/babel/s1580x830_jfs/t1/109361/24/22897/74054/621ede58E099d37e3/f12730c81df6046a.jpg!cc_1580x830.webp', 999, 50, 50, 5, 0, '线下', '100', 1, 1);
INSERT INTO `product` (`product_id`, `business_id`, `name`, `price`, `sort`, `size`, `img`, `stock_num`, `history_sale_num`, `purchase_num`, `score`, `is_delete`, `deal_style`, `favorable_rate`, `is_enable`, `is_checked`) VALUES (3, 2, '洗衣机', 9999, '电子', 3, 'https://img30.360buyimg.com/babel/s1580x830_jfs/t1/109361/24/22897/74054/621ede58E099d37e3/f12730c81df6046a.jpg!cc_1580x830.webp', 100, 10, 10, 5, 0, '线下', '100', 1, 1);
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
  `seller_evaluate` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '卖家对客户评价',
  `is_cart` tinyint DEFAULT NULL COMMENT '是否在购物车',
  `create_time` bigint DEFAULT NULL COMMENT '订单创建时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase_relationship
-- ----------------------------
BEGIN;
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (1, 1, 1, 2, '物品很好', 5, '商家很好', 'FINISHED', 1654952273060, 5, '客户很好', 0, 1654952273040);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (2, 1, 2, 2, '电脑很好', 2, '商家很好', 'FINISHED', 1654952273060, 5, '客户态度好', 0, 1654952273060);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (3, 1, 3, 2, '洗衣机很好', 1, '商家服务好', 'FINISHED', 1655031727771, 4, '顾客态度好', 0, 1654952273060);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (4, 1, 2, 2, '电脑还是很好', 1, '商家很好', 'FINISHED', 1655038659051, 5, '爱顾客', 0, 1655031727771);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (5, 1, 1, 2, NULL, 1, NULL, 'RECEIVED', 1655053482082, NULL, NULL, 0, 1655053423169);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (6, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655053711660);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (8, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054402151);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (9, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054470945);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (10, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054521987);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (11, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054550725);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (12, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054559698);
INSERT INTO `purchase_relationship` (`order_id`, `user_id`, `product_id`, `business_id`, `user_evaluate`, `count`, `seller_attitude`, `deliver_state`, `received_time`, `score`, `seller_evaluate`, `is_cart`, `create_time`) VALUES (13, 1, 1, 2, NULL, 1, NULL, 'WAIT_FOR_RECEIVING', NULL, NULL, NULL, 0, 1655054581070);
COMMIT;

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_course
-- ----------------------------
BEGIN;
INSERT INTO `student_course` (`student_id`, `course_id`) VALUES (28, 1);
INSERT INTO `student_course` (`student_id`, `course_id`) VALUES (28, 2);
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
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (17, '649002da71c8473db39892b4a758f875.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 1, 0);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (18, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 1, 0);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (19, 'Java3年经验开发个人简历模板.doc', 'doc', 47, 'http://localhost:9090/file/0e020e1337474a93ba3b43a75b2890ee.doc', '9ace4fac24420f85c753aa663009edb4', 1, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (20, '1626102561055-2.jpg', 'jpg', 24, 'http://localhost:9090/file/cd379f381364482aaad0d6ffb7209d3d.jpg', 'adb0481b283645af3809e3d8a1bdb294', 1, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (21, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (22, '1622536738094-7.jpg', 'jpg', 12, 'http://localhost:9090/file/ad5946fe27c14508ac796115f6465826.jpg', '35977e7dc2159a734f3c81de460e4b8d', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (23, '用户信息 (1).xlsx', 'xlsx', 3, 'http://localhost:9090/file/02f70e07e69045c38b4748283ffeeabb.xlsx', '687f150737c967e74cfd6fa9ec981589', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (24, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (25, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (26, '6.jpg', 'jpg', 30, 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (27, '9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'jpg', 30, 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (28, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 1, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (29, '1641024983532cf (1).png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (30, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (31, 'QQ截图20211214232106.jpg', 'jpg', 30, 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (32, 'boot.jpg', 'jpg', 11, 'http://localhost:9090/file/657d7054d7864bd7a0aaba9e44f7924e.jpg', '2ab82ad78ff081665ee90f8cb38b45db', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (33, 'QQ图片20210828212629.gif', 'gif', 188, 'http://localhost:9090/file/e5512c68a5614135a12064afa66c67e5.gif', 'ce524058758a83c046b97c66ddcb8a83', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (34, 'vite.jpg', 'jpg', 27, 'http://localhost:9090/file/782f20b37b8b4a158c5e13a07fe826d5.jpg', 'c67bab9c32968cd0cda3e1608286b0d9', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (35, 'mp.jpg', 'jpg', 32, 'http://localhost:9090/file/650e8330e78b4fed8fb0c1d866684b5d.jpg', 'cb887a9d64563352edce80cf50296cc5', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (36, 'qq音乐.png', 'png', 445, 'http://localhost:9090/file/461504596ec040729776b674ddec88d3.png', '793fd534fa705475eb3358f68c87ec68', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (37, 'QQ截图20211214232106.jpg', 'jpg', 30, 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (38, 'boot.jpg', 'jpg', 11, 'http://localhost:9090/file/657d7054d7864bd7a0aaba9e44f7924e.jpg', '2ab82ad78ff081665ee90f8cb38b45db', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (39, 'QQ截图20211214232106.jpg', 'jpg', 30, 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', 1, 0);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (40, 'v1.mp4', 'mp4', 47484, 'http://localhost:9090/file/a22c9d62ef0648db86b9766bb14d742a.mp4', '3dda54bc1a07bd9112bfb381c20b4867', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (41, '搜狗截图20220129174103.png', 'png', 56, 'http://localhost:9090/file/8567a00d2bf740e0a63794baf600cec3.png', '050df6119399582fda666834870608d7', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (42, 'QQ图片20220307194920.png', 'png', 100, 'http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png', '0f1337b5c0ebf68f67718fcf42d1322f', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (43, 'QQ图片20220307194920.png', 'png', 100, 'http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png', '0f1337b5c0ebf68f67718fcf42d1322f', 0, 1);
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
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (2, '数据报表', '/dashbord', 'el-icon-s-marketing', '11', NULL, 'Dashbord', 100);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, 4, 'File', 304);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (9, '请作者喝杯咖啡', '/donate', 'el-icon-coffee\r\n', NULL, NULL, 'Donate', 200);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (39, '课程管理', '/course', 'el-icon-menu', NULL, NULL, 'Course', 201);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (40, '高德地图', '/map', 'el-icon-house', NULL, NULL, 'Map', 999);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (41, '文章管理', '/article', 'el-icon-menu', NULL, NULL, 'Article', 999);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (2, '学生', '学生', 'ROLE_STUDENT');
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (3, '老师', '老师', 'ROLE_TEACHER');
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
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (1, 'admin', 'admin', '程序员青戈', 'admin@qq.com', '13988997788', '安徽合肥1', '2022-01-22 21:10:27', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'ROLE_ADMIN');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (16, '222', '123', '甄姬好大', '2', '2', '2', '2022-02-26 22:10:14', NULL, 'ROLE_TEACHER');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (17, '333', '123', '我是三三哦豁', '3', '3', '3', '2022-02-26 22:10:18', 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', 'ROLE_TEACHER');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (18, 'nzz', '123', '哪吒', '2', '2', '2', '2022-03-29 16:59:44', '', 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (19, 'yss', '123', '亚瑟', '3', '3', '3', '2022-04-29 16:59:44', '', 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (20, 'lxx', '123', '李信', '2', '2', '2', '2022-05-29 17:12:04', '2', 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (25, 'sir', '123', '安琪拉', NULL, NULL, NULL, '2022-06-08 17:00:47', NULL, 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (26, 'err', NULL, '妲己', '11', '1', '1', '2022-07-08 17:20:01', NULL, 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (28, 'ddd', '123', 'ddd', '', '', '', '2022-11-09 10:41:07', 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (29, 'ffff', '123', NULL, NULL, NULL, NULL, '2022-12-10 11:53:31', NULL, 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (30, 'fei', '123', '张飞', NULL, NULL, NULL, '2022-06-10 13:36:37', NULL, 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (31, '张飞', '123', NULL, NULL, NULL, NULL, '2022-06-10 13:36:49', NULL, 'ROLE_STUDENT');
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
