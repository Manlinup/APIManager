/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : api_manage

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 03/07/2019 19:20:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '接口编号',
  `aid` int(11) NULL DEFAULT 0 COMMENT '接口分类id',
  `num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口编号',
  `url` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名',
  `des` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口描述',
  `parameter` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数{所有的主求参数,以json格式在此存放}',
  `memo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `re` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回值',
  `lasttime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '提后操作时间',
  `lastuid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '最后修改uid',
  `isdel` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '{0:正常,1:删除}',
  `type` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `ord` int(11) NULL DEFAULT 0 COMMENT '排序(值越大,越靠前)',
  `status` tinyint(1) NOT NULL COMMENT '1 待开发，2待对接，3对接完毕',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api
-- ----------------------------
INSERT INTO `api` VALUES (1, 2, '000', 'http://api.xxx.com', '会员注册', '会员注册调用此接口', 'a:5:{s:4:\"name\";a:3:{i:0;s:10:\"login_name\";i:1;s:8:\"password\";i:2;s:5:\"email\";}s:9:\"paramType\";a:3:{i:0;s:3:\"int\";i:1;s:3:\"int\";i:2;s:3:\"int\";}s:4:\"type\";a:3:{i:0;s:1:\"Y\";i:1;s:1:\"Y\";i:2;s:1:\"N\";}s:7:\"default\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:3:\"des\";a:3:{i:0;s:9:\"登录名\";i:1;s:6:\"密码\";i:2;s:12:\"用户邮箱\";}}', '', '{\r\n    &quot;status&quot;: 1, \r\n    &quot;info&quot;: &quot;注册成功&quot;, \r\n    &quot;data&quot;: {\r\n        &quot;uid&quot;: &quot;20&quot;\r\n    }\r\n}', 1562137649, 1, 0, 'POST', 2, 3);
INSERT INTO `api` VALUES (2, 2, '001', 'http://api.xxx.com', '会员登录', '会员登录调用此接口', 'a:4:{s:4:\"name\";a:3:{i:0;s:10:\"login_name\";i:1;s:5:\"email\";i:2;s:8:\"password\";}s:4:\"type\";a:3:{i:0;s:1:\"Y\";i:1;s:1:\"Y\";i:2;s:1:\"Y\";}s:7:\"default\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:3:\"des\";a:3:{i:0;s:30:\"登录名与邮箱二选其一\";i:1;s:30:\"邮箱与登录名二选其一\";i:2;s:6:\"密码\";}}', 'login_name 与 email 二选其一', '{\r\n    &quot;status&quot;: 1, \r\n    &quot;info&quot;: &quot;登录成功&quot;, \r\n    &quot;data&quot;: [ ]\r\n}', 1435576729, 1, 0, 'POST', 1, 2);

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户',
  `aid` int(11) NULL DEFAULT NULL COMMENT '接口分类权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表 - 若用户为普通管理员时，读此表获取权限' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate`  (
  `aid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `cdesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `isdel` int(11) NULL DEFAULT 0 COMMENT '是否删除{0:正常,1删除}',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cate
-- ----------------------------
INSERT INTO `cate` VALUES (1, '分类一', '第一个测试分类', 0, 0, 1435575162);
INSERT INTO `cate` VALUES (2, '分类二', '第二个测试分类', 1, 0, 1435575185);
INSERT INTO `cate` VALUES (3, '111', '111', 1, 0, 1562135373);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nice_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `login_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `last_time` int(11) NULL DEFAULT 0 COMMENT '最近登录时间',
  `login_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `isdel` int(11) NULL DEFAULT 0 COMMENT '{0正常,1:删除}',
  `issuper` int(11) NULL DEFAULT 0 COMMENT '{0:普通管理员,1超级管理员}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1562133016, 'c33367701511b4f6020ec61ded352059', 0, 1);
INSERT INTO `user` VALUES (2, 'root', 'root', 1435575693, 'e10adc3949ba59abbe56e057f20f883e', 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
