/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 100307
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 100307
 File Encoding         : 65001

 Date: 02/07/2019 14:33:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标名称',
  `menuname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单或功能按钮名',
  `pid` bigint(20) DEFAULT NULL COMMENT '菜单或按钮父id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单跳转地址',
  `parent_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单的父id集合',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型:菜单-menu 功能按钮-button',
  `permission` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限标识',
  `createBy` bigint(20) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updateDate` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `status` int(1) NOT NULL COMMENT '是否可用 0-可用 1-冻结',
  `leav` int(1) DEFAULT NULL COMMENT '菜单层级',
  PRIMARY KEY (`menuid`) USING BTREE,
  UNIQUE INDEX `UK_it5rxmk1ooxgl7twdctf9ybyv`(`menuname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, '系统管理', NULL, NULL, NULL, 'menu', NULL, NULL, '2019-06-25 14:48:26', NULL, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (2, NULL, '用户管理', 1, NULL, '1', 'menu', 'user:view', NULL, '2019-06-25 14:49:08', NULL, NULL, 0, 2);
INSERT INTO `sys_menu` VALUES (3, NULL, '业务管理', NULL, NULL, NULL, 'menu', NULL, NULL, '2019-06-25 14:49:55', NULL, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (4, NULL, '菜单管理', 1, 'sysMenu/toMenuList', '1', 'menu', 'menu:view', NULL, '2019-06-27 21:35:26', NULL, NULL, 0, 2);
INSERT INTO `sys_menu` VALUES (17, '', '角色管理', 1, '', '1/1', 'menu', '', NULL, '2019-07-01 23:14:45', NULL, NULL, 0, 2);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `createBy` bigint(255) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updateDate` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `status` int(1) DEFAULT NULL COMMENT '可用状态 0-可用 1-冻结',
  PRIMARY KEY (`roleid`) USING BTREE,
  UNIQUE INDEX `UK_i9pr8bguukn9jq8f6j9p98mci`(`rolename`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (3, '系统管理员', '测试的新增角色', NULL, '2019-06-24 16:21:31', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `rid` bigint(20) NOT NULL,
  `mid` bigint(20) NOT NULL,
  INDEX `FK5grhomnyrb2nkm20ee7a2iv92`(`mid`) USING BTREE,
  INDEX `FK5pc0747orubmrx2oe86newexy`(`rid`) USING BTREE,
  CONSTRAINT `FK5grhomnyrb2nkm20ee7a2iv92` FOREIGN KEY (`mid`) REFERENCES `sys_menu` (`menuid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5pc0747orubmrx2oe86newexy` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `age` int(11) NOT NULL COMMENT '年龄',
  `birthday` datetime(0) DEFAULT NULL COMMENT '生日',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录密码',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `tell` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `createBy` bigint(20) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updateDate` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `status` int(1) DEFAULT NULL COMMENT '可用状态 0-可用 1-冻结',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `UK_61ln5j8r2b9pbwi8ayje7no4k`(`loginname`) USING BTREE,
  UNIQUE INDEX `UK_ra3h3urndw7javl9rwg14dili`(`tell`) USING BTREE,
  UNIQUE INDEX `UK_ahtq5ew3v0kt1n7hf1sgp7p8l`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'sjz', 30, '1990-02-02 17:56:43', NULL, 'lzl', 'KdYcVBQYGMt9FZnPuGPgIaqujACBU4rpbXB7JzWuazQ=', '男', '18000001111', '李智伦', 1, '2019-06-24 17:57:31', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `uid` bigint(20) NOT NULL,
  `rid` bigint(20) NOT NULL,
  INDEX `FK73pkd5v8ckvmrx2grvpg26ks1`(`rid`) USING BTREE,
  INDEX `FKput17v9wwg8wiukw8ykroaaag`(`uid`) USING BTREE,
  CONSTRAINT `FK73pkd5v8ckvmrx2grvpg26ks1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKput17v9wwg8wiukw8ykroaaag` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 3);

SET FOREIGN_KEY_CHECKS = 1;
