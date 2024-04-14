/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : acp

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 14/04/2024 01:29:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` bigint NULL DEFAULT NULL COMMENT '被回复人id',
  `qid` bigint NULL DEFAULT NULL COMMENT '问题id',
  `answer_id` bigint NULL DEFAULT NULL COMMENT '回复人id',
  `answer_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回复内容',
  `is_adopt` tinyint(1) NULL DEFAULT 0 COMMENT '是否采纳（0未采纳，1采纳）',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (1, 2, 9, 1, '22222222222', 0, 1, '2024-02-04 13:35:16', '2024-02-04 13:36:55');
INSERT INTO `answer` VALUES (2, 1, 10, 1, '啊啊啊啊啊啊啊啊啊啊啊啊啊', 0, 0, '2024-02-04 13:35:55', '2024-03-10 21:39:14');
INSERT INTO `answer` VALUES (3, 2, 9, 1, '333333333333333', 1, 0, '2024-02-04 13:39:22', '2024-02-04 13:40:10');
INSERT INTO `answer` VALUES (4, 1, 19, 2, '555555555555555555555', 1, 0, '2024-02-04 13:40:36', '2024-02-04 13:49:29');
INSERT INTO `answer` VALUES (5, 2, 9, 3, 'nanqu', 0, 0, '2024-02-22 16:29:27', '2024-02-22 16:29:27');
INSERT INTO `answer` VALUES (6, 1, 10, 3, '??', 1, 0, '2024-02-22 16:29:42', '2024-03-10 21:39:15');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `image_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, '首页', 'http://127.0.0.1:9000/xdh-bucket/20240222/a253bfbd109c4ee6834e8f574a05ae27default.png', 1, '2024-01-05 17:17:03', '2024-02-22 16:49:18');
INSERT INTO `banner` VALUES (9, '2', 'http://127.0.0.1:9000/xdh-bucket/20240115/9217e0fb32d9408287315fb1030ba531logo.png', 1, '2024-01-15 17:54:19', '2024-02-22 16:49:13');
INSERT INTO `banner` VALUES (10, '3', 'http://127.0.0.1:9000/xdh-bucket/20240115/44b6d9a8a8e341da9c939e845dc11b27origin-back.png', 1, '2024-01-15 17:54:29', '2024-02-22 16:46:37');
INSERT INTO `banner` VALUES (11, '55', 'http://127.0.0.1:9000/xdh-bucket/20240222/3b751d0028bf47ada6ce61da157a78dcback1.png', 1, '2024-02-22 16:36:46', '2024-02-22 16:36:53');
INSERT INTO `banner` VALUES (12, '4444444', 'http://127.0.0.1:9000/xdh-bucket/20240222/f33a16df43084a24bf1366ed90b8d138origin-back.png', 1, '2024-02-22 16:43:10', '2024-02-22 16:46:36');
INSERT INTO `banner` VALUES (13, '2222222222', 'http://127.0.0.1:9000/xdh-bucket/20240222/45958d8e214248d894823174f16e485eback1.png', 1, '2024-02-22 16:49:24', '2024-02-22 16:52:53');
INSERT INTO `banner` VALUES (14, '3333333333', 'http://127.0.0.1:9000/xdh-bucket/20240222/ad1f19b9e93546e5810ba6c69535333cdefault.png', 1, '2024-02-22 16:49:30', '2024-02-22 16:52:53');
INSERT INTO `banner` VALUES (15, '4444444', 'http://127.0.0.1:9000/xdh-bucket/20240222/45f2b11bd9b14d29925466c47a810728logo.png', 1, '2024-02-22 16:49:40', '2024-02-22 16:52:48');
INSERT INTO `banner` VALUES (16, '5555555555', 'http://127.0.0.1:9000/xdh-bucket/20240222/e1f2e0abb65b4b2b9e5c426216d7fcd6origin-back.png', 1, '2024-02-22 16:49:47', '2024-02-22 16:52:46');
INSERT INTO `banner` VALUES (17, '1111111', 'http://127.0.0.1:9000/xdh-bucket/20240222/cf3ce306496d4666ad5f191fef5127d3default.png', 1, '2024-02-22 16:52:59', '2024-02-22 16:55:30');
INSERT INTO `banner` VALUES (18, '2222222', 'http://127.0.0.1:9000/xdh-bucket/20240222/aeabf8446d13427787ed711a01853496default.png', 0, '2024-02-22 16:55:38', '2024-02-22 16:55:38');
INSERT INTO `banner` VALUES (19, '444444', 'http://127.0.0.1:9000/xdh-bucket/20240222/a883eb0cd5ab49af8a41a95d1d7e3330back1.png', 0, '2024-02-22 16:57:20', '2024-02-22 16:57:20');
INSERT INTO `banner` VALUES (20, '22222222', 'http://127.0.0.1:9000/xdh-bucket/20240222/16a02e0da79e4d33a779e303ad7c0671back1.png', 1, '2024-02-22 16:58:11', '2024-02-22 17:03:26');
INSERT INTO `banner` VALUES (21, '33333333', 'http://127.0.0.1:9000/xdh-bucket/20240222/459a6b59d9ae4df7bccc3eb0cbc7eeecback1.png', 1, '2024-02-22 17:00:35', '2024-02-22 17:03:23');
INSERT INTO `banner` VALUES (22, '66666666', 'http://127.0.0.1:9000/xdh-bucket/20240222/747fbc6202fc4d6dbc9ac57f9d5a3a6adefault.png', 1, '2024-02-22 17:00:50', '2024-02-22 17:03:26');
INSERT INTO `banner` VALUES (23, '5555555555', 'http://127.0.0.1:9000/xdh-bucket/20240222/bc6896ffff0e400896211ac9f0abfcb2default.png', 1, '2024-02-22 17:01:49', '2024-02-22 17:03:21');
INSERT INTO `banner` VALUES (24, '22222222', 'http://127.0.0.1:9000/xdh-bucket/20240222/c944b8ec18fb48f895ede80057580185back1.png', 0, '2024-02-22 17:05:23', '2024-02-22 17:05:23');
INSERT INTO `banner` VALUES (25, '4444444', 'http://127.0.0.1:9000/xdh-bucket/20240222/36086bfa743d4daf845ac91ec59d9fc4logo.png', 0, '2024-02-22 17:05:36', '2024-02-22 17:05:36');
INSERT INTO `banner` VALUES (26, '2211', 'http://127.0.0.1:9000/xdh-bucket/20240222/26f859b948544b2f927efbe106d1001aback1.png', 0, '2024-02-22 17:06:15', '2024-02-22 17:06:15');
INSERT INTO `banner` VALUES (27, '212', 'http://127.0.0.1:9000/xdh-bucket/20240222/0732e1cded9249d780e8a0536d4c2324default.png', 1, '2024-02-22 17:09:33', '2024-02-22 17:09:54');
INSERT INTO `banner` VALUES (28, '33', 'http://127.0.0.1:9000/xdh-bucket/20240222/4c40f8f1d2a041ed86f83f1901bebceelogo.png', 1, '2024-02-22 17:09:38', '2024-02-22 17:09:52');
INSERT INTO `banner` VALUES (29, '44', 'http://127.0.0.1:9000/xdh-bucket/20240222/5f952130087f4543a054f06fbd2712b8origin-back.png', 1, '2024-02-22 17:09:43', '2024-02-22 17:09:52');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学院名称',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '信息科学与工程学院', 0, '2024-01-02 18:15:23', '2024-01-03 15:18:12');
INSERT INTO `college` VALUES (2, '机电与自动化学院', 0, '2024-01-03 15:17:50', '2024-01-03 15:18:02');
INSERT INTO `college` VALUES (3, '城市建设学院', 0, '2024-01-15 18:23:46', '2024-01-15 18:23:46');
INSERT INTO `college` VALUES (17, 'GO', 1, '2024-02-22 16:37:36', '2024-02-22 17:15:33');
INSERT INTO `college` VALUES (18, 'GOGO', 0, '2024-02-22 19:01:51', '2024-02-22 19:01:51');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint NULL DEFAULT NULL COMMENT '用户id',
  `did` bigint NULL DEFAULT NULL COMMENT '文章id',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '评论内容',
  `up` int NULL DEFAULT 0 COMMENT '点赞数',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `COM_USER_ID`(`uid` ASC) USING BTREE,
  INDEX `COM_DISCUSS_ID`(`did` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (3, 2, 2, '322222222222222222', 0, 1, '2024-01-24 20:16:45', '2024-01-24 20:17:43');
INSERT INTO `comment` VALUES (4, 2, 3, '2222222222222222', 0, 1, '2024-01-24 20:17:00', '2024-01-24 20:19:01');
INSERT INTO `comment` VALUES (5, 2, 1, '1111111111111111', 0, 1, '2024-01-24 20:29:51', '2024-01-24 20:30:29');
INSERT INTO `comment` VALUES (6, 2, 6, '111111111111111111', 0, 1, '2024-01-24 20:30:04', '2024-01-24 20:30:29');
INSERT INTO `comment` VALUES (7, 2, 7, '33333333333333333333', 0, 1, '2024-01-24 20:30:12', '2024-01-24 20:30:41');
INSERT INTO `comment` VALUES (8, 1, 8, '3333333333333333333', 0, 1, '2024-02-04 13:50:12', '2024-02-04 13:52:07');
INSERT INTO `comment` VALUES (9, 1, 8, '333333333333333333344444444444', 0, 1, '2024-02-04 13:50:28', '2024-02-04 13:52:07');
INSERT INTO `comment` VALUES (10, 1, 8, '333333333333333333344444444444444444444444444444444', 0, 1, '2024-02-04 13:50:35', '2024-02-04 13:52:07');
INSERT INTO `comment` VALUES (11, 1, 8, '333333333333333', 0, 1, '2024-02-04 14:00:34', '2024-02-21 22:39:33');
INSERT INTO `comment` VALUES (12, 1, 8, '33333333333333344444444444444', 0, 1, '2024-02-04 14:00:37', '2024-02-21 22:18:45');
INSERT INTO `comment` VALUES (13, 1, 8, '3333333333333334444444444444444444444444444', 1, 1, '2024-02-04 14:00:59', '2024-02-21 21:53:17');
INSERT INTO `comment` VALUES (14, 3, 8, '怎么睡哦', 1, 1, '2024-02-18 17:09:50', '2024-02-21 21:55:04');
INSERT INTO `comment` VALUES (15, 3, 10, '6666666666666666', 1, 1, '2024-02-22 16:29:08', '2024-02-22 17:29:05');

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint NULL DEFAULT NULL COMMENT '用户id',
  `tid` bigint NULL DEFAULT NULL COMMENT '标签id',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `cover` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章封面',
  `up` int NULL DEFAULT 0 COMMENT '点赞数',
  `down` int UNSIGNED NULL DEFAULT 0 COMMENT '踩次数',
  `is_audit` tinyint(1) NULL DEFAULT 0 COMMENT '是否审核通过（0审核中，1通过，2未通过）',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `DIS_USER_ID`(`uid` ASC) USING BTREE,
  INDEX `DIS_CREATETIME`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES (1, 2, 1, '1', 'adadadasss', 'http://127.0.0.1:9000/xdh-bucket/20240124/8c3d2aecb33c4d0bbeb342ac3d7928felogo.png', 0, 0, 1, 1, '2024-01-24 17:30:33', '2024-01-24 20:30:29');
INSERT INTO `discuss` VALUES (2, 1, 7, 'ad', 'sssssssssssssssssssssssssssssssss', 'http://127.0.0.1:9000/xdh-bucket/20240124/aa0ba552d00542faa350e471db6b7f04default.png', 0, 0, 1, 1, '2024-01-24 17:48:32', '2024-01-24 20:17:43');
INSERT INTO `discuss` VALUES (3, 2, 6, '111111', '111111111111111111111', 'http://127.0.0.1:9000/xdh-bucket/20240124/cc27a224e8a542eca15066635a407cb5back1.png', 0, 0, 1, 1, '2024-01-24 18:29:17', '2024-01-24 20:19:01');
INSERT INTO `discuss` VALUES (4, 1, 1, '222222', '1111111111111111111', 'http://127.0.0.1:9000/xdh-bucket/20240124/af02ba86bc4749f6920bea9cb76f1e49logo.png', 0, 0, 1, 1, '2024-01-24 18:29:32', '2024-01-24 20:28:25');
INSERT INTO `discuss` VALUES (5, 1, 6, '12', '0000000000000000', 'http://127.0.0.1:9000/xdh-bucket/20240124/940d68dc2f0e48a788c487847e340021logo.png', 0, 0, 1, 1, '2024-01-24 19:58:28', '2024-01-24 20:28:23');
INSERT INTO `discuss` VALUES (6, 2, 1, '1111111111', '1111111111111111111111111', 'http://127.0.0.1:9000/xdh-bucket/20240124/21f02307a5e04aa2953a110ca8c48972default.png', 0, 0, 1, 1, '2024-01-24 20:29:01', '2024-01-24 20:30:29');
INSERT INTO `discuss` VALUES (7, 2, 1, '22222222222222222', '2222222222222222222222222', 'http://127.0.0.1:9000/xdh-bucket/20240124/15876987928147aca916d4e9cd2d2345logo.png', 0, 0, 1, 1, '2024-01-24 20:29:10', '2024-01-24 20:30:47');
INSERT INTO `discuss` VALUES (8, 2, 6, '3', '22222222222222222222', 'http://127.0.0.1:9000/xdh-bucket/20240124/c6a2f68d188b4aec8cb03ab6493219d8default.png', 2, 1, 2, 1, '2024-01-24 20:47:14', '2024-02-21 22:39:33');
INSERT INTO `discuss` VALUES (9, 2, 1, '2', '11111111111111', 'http://127.0.0.1:9000/xdh-bucket/20240221/c6646f2f21c04b058287181778d142a3logo.png', 0, 0, 0, 1, '2024-02-21 22:35:36', '2024-02-21 22:39:41');
INSERT INTO `discuss` VALUES (10, 1, 7, '23', '3333333333333332', 'http://127.0.0.1:9000/xdh-bucket/20240221/41334bbc4dd1440cb8db1cd601cfba88logo.png', 0, 0, 1, 1, '2024-02-21 22:35:54', '2024-02-22 17:29:05');
INSERT INTO `discuss` VALUES (11, 1, 6, '22', '22222222222222', 'http://127.0.0.1:9000/xdh-bucket/20240222/6da34439893e43a19dd40f6b94dedf77default.png', 0, 0, 0, 1, '2024-02-22 17:29:16', '2024-02-22 17:29:45');
INSERT INTO `discuss` VALUES (12, 2, 6, '2', '3333333333', 'http://127.0.0.1:9000/xdh-bucket/20240222/3682c54db4b04b04aaf311cdb4326559logo.png', 0, 0, 0, 1, '2024-02-22 17:29:28', '2024-02-22 17:29:49');
INSERT INTO `discuss` VALUES (13, 2, 10, '231', '313131', 'http://127.0.0.1:9000/xdh-bucket/20240222/83c1f72e20d84f7d84c92d039a5edf94origin-back.png', 0, 0, 0, 1, '2024-02-22 17:29:41', '2024-02-22 17:29:49');
INSERT INTO `discuss` VALUES (14, 2, 6, '111', '11111111111111111', 'http://127.0.0.1:9000/xdh-bucket/20240222/fc45dfe6c2b442099240de592ab8dfe9logo.png', 0, 0, 1, 0, '2024-02-22 17:29:58', '2024-03-10 22:06:00');
INSERT INTO `discuss` VALUES (15, 2, 6, '1', '3333333333333333', 'http://127.0.0.1:9000/xdh-bucket/20240222/367ccbd0f99c4b03b3a0ea68516d6471logo.png', 0, 0, 1, 0, '2024-02-22 17:30:10', '2024-03-10 21:42:00');
INSERT INTO `discuss` VALUES (16, 1, 6, '222', '3333333333333', 'http://127.0.0.1:9000/xdh-bucket/20240225/7e52460e99a742e4afc971df5a7de823default.png', 0, 0, 1, 0, '2024-02-25 22:53:09', '2024-03-08 22:55:25');
INSERT INTO `discuss` VALUES (17, 1, 6, 'ada', '333333333333333', 'http://127.0.0.1:9000/xdh-bucket/20240225/3b34ec855cea41a1b5824eacd7533ff7back1.png', 0, 0, 1, 0, '2024-02-25 22:53:40', '2024-02-28 16:02:49');
INSERT INTO `discuss` VALUES (18, 1, 14, '23', '21312啊', 'http://127.0.0.1:9000/xdh-bucket/20240308/ba12c22b08724c839b88b70bc054fa13origin-back.png', 0, 0, 1, 0, '2024-03-08 22:54:42', '2024-03-08 22:55:27');

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` bigint NULL DEFAULT NULL COMMENT '用户id',
  `tid` bigint NULL DEFAULT NULL COMMENT '标签id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '动态内容',
  `up` int NULL DEFAULT 0 COMMENT '点赞数',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES (6, 2, 1, '今天心情不错', 0, 1, '2024-01-15 00:28:44', '2024-01-24 18:33:11');
INSERT INTO `dynamic` VALUES (7, 1, 1, 'dadaada', 0, 1, '2024-01-24 17:59:34', '2024-01-24 18:33:11');
INSERT INTO `dynamic` VALUES (8, 1, 6, '1111111111111111111', 0, 1, '2024-01-24 18:34:20', '2024-01-24 18:34:46');
INSERT INTO `dynamic` VALUES (9, 1, 1, '222222222222222222222', 0, 1, '2024-01-24 18:34:24', '2024-01-24 18:34:50');
INSERT INTO `dynamic` VALUES (10, 1, 1, '3333333333333333333333333', 0, 1, '2024-01-24 18:34:30', '2024-01-24 18:34:50');
INSERT INTO `dynamic` VALUES (11, 1, 1, '666666666666666666666', 0, 1, '2024-01-24 18:34:37', '2024-01-24 18:34:53');
INSERT INTO `dynamic` VALUES (12, 1, 1, 'ssssssssssssssssssssssss', 0, 1, '2024-02-04 13:48:17', '2024-02-28 16:36:27');
INSERT INTO `dynamic` VALUES (13, 1, 6, '3333333333', 0, 0, '2024-02-28 16:12:06', '2024-02-28 16:12:06');
INSERT INTO `dynamic` VALUES (14, 1, 6, '2222222222', 0, 0, '2024-03-08 22:55:00', '2024-03-08 22:55:00');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '公告内容1', 1, '2024-01-19 10:00:00', '2024-02-22 17:14:23');
INSERT INTO `notice` VALUES (2, '公告内容2', 1, '2024-01-19 11:00:00', '2024-02-22 17:14:23');
INSERT INTO `notice` VALUES (3, '公告内容3', 1, '2024-01-19 12:00:00', '2024-01-19 12:00:00');
INSERT INTO `notice` VALUES (4, '公告内容4', 1, '2024-01-19 13:00:00', '2024-02-22 17:14:15');
INSERT INTO `notice` VALUES (5, '公告内容5', 1, '2024-01-19 14:00:00', '2024-01-19 14:00:00');
INSERT INTO `notice` VALUES (6, '公告内容6', 1, '2024-01-19 15:00:00', '2024-02-22 16:38:59');
INSERT INTO `notice` VALUES (7, '公告内容7', 1, '2024-01-19 16:00:00', '2024-02-22 17:14:20');
INSERT INTO `notice` VALUES (8, '公告内容8', 1, '2024-01-19 17:00:00', '2024-01-19 17:00:00');
INSERT INTO `notice` VALUES (9, '公告内容9', 1, '2024-01-19 18:00:00', '2024-02-22 17:14:13');
INSERT INTO `notice` VALUES (10, '公告内容10', 1, '2024-01-19 19:00:00', '2024-02-22 16:38:50');
INSERT INTO `notice` VALUES (11, '公告内容11', 1, '2024-01-19 20:00:00', '2024-01-19 20:00:00');
INSERT INTO `notice` VALUES (12, '公告内容12', 1, '2024-01-19 21:00:00', '2024-02-22 17:14:12');
INSERT INTO `notice` VALUES (13, '公告内容13', 1, '2024-01-19 22:00:00', '2024-02-22 17:15:05');
INSERT INTO `notice` VALUES (14, '公告内容14', 1, '2024-01-19 23:00:00', '2024-01-19 23:00:00');
INSERT INTO `notice` VALUES (15, '公告内容15', 1, '2024-01-20 00:00:00', '2024-02-22 17:10:12');
INSERT INTO `notice` VALUES (16, '公告内容16', 1, '2024-01-20 01:00:00', '2024-02-22 16:42:01');
INSERT INTO `notice` VALUES (17, '公告内容17', 1, '2024-01-20 02:00:00', '2024-01-20 02:00:00');
INSERT INTO `notice` VALUES (18, '公告内容18', 1, '2024-01-20 03:00:00', '2024-02-22 16:41:55');
INSERT INTO `notice` VALUES (19, '公告内容19', 1, '2024-01-20 04:00:00', '2024-02-22 17:14:57');
INSERT INTO `notice` VALUES (20, '公告内容20', 1, '2024-01-20 05:00:00', '2024-01-20 05:00:00');
INSERT INTO `notice` VALUES (21, '22222222222', 1, '2024-02-22 17:14:30', '2024-02-22 17:15:01');
INSERT INTO `notice` VALUES (22, '22222222222333333333', 1, '2024-02-22 17:14:32', '2024-02-22 17:15:05');
INSERT INTO `notice` VALUES (23, '22222222222333333333333333333', 1, '2024-02-22 17:14:35', '2024-02-22 17:15:05');
INSERT INTO `notice` VALUES (24, '22222222222333333333333333333444444444444444', 1, '2024-02-22 17:14:48', '2024-02-22 17:15:08');
INSERT INTO `notice` VALUES (25, '22222222222333333333333333333444444444444444555555555555555', 0, '2024-02-22 17:14:51', '2024-02-22 17:14:51');
INSERT INTO `notice` VALUES (26, '22222222222333333333333333333444444444444444555555555555555222222222222222222222222', 0, '2024-02-22 17:14:53', '2024-02-22 17:14:53');
INSERT INTO `notice` VALUES (27, '2222222222233333333333333333344444444444444455555555555555522222222222222222222222222222222222222', 1, '2024-02-22 17:14:55', '2024-02-22 17:15:08');
INSERT INTO `notice` VALUES (28, '2222222222233333333333312222222222222222', 0, '2024-02-22 17:15:11', '2024-03-08 22:34:22');

-- ----------------------------
-- Table structure for origin
-- ----------------------------
DROP TABLE IF EXISTS `origin`;
CREATE TABLE `origin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` bigint NULL DEFAULT NULL COMMENT '所属学院',
  `uid` bigint NULL DEFAULT NULL COMMENT '创建人',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织名称',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织头像',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ORIGIN_NAME`(`name` ASC) USING BTREE,
  INDEX `OR_USER_ID`(`uid` ASC) USING BTREE,
  INDEX `OR_REGION_ID`(`cid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of origin
-- ----------------------------
INSERT INTO `origin` VALUES (1, 1, 2, '1234', 'http://127.0.0.1:9000/xdh-bucket/20240308/1bed137f8440431aa7413ac2287bd0f6origin-back.png', 0, '2024-03-08 22:52:02', '2024-03-08 22:54:01');
INSERT INTO `origin` VALUES (2, 3, 1, '2', 'http://127.0.0.1:9000/xdh-bucket/20240308/f8988b75e2db431bbd5491df9c0e21eadefault.png', 0, '2024-03-08 22:52:10', '2024-03-08 22:52:10');
INSERT INTO `origin` VALUES (3, 3, 1, '4', 'http://127.0.0.1:9000/xdh-bucket/20240308/31e398b712a94caca4b15d53410c84eclogo.png', 0, '2024-03-08 22:52:29', '2024-03-08 22:52:29');
INSERT INTO `origin` VALUES (4, 1, 1, '33333333', 'http://192.168.220.228:9000/xdh-bucket/20240310/9afc6e55821044cd83a9638f3c5944e4logo.png', 1, '2024-03-10 22:22:37', '2024-03-11 14:24:55');
INSERT INTO `origin` VALUES (5, 1, 1, '3333333333', 'http://192.168.220.228:9000/xdh-bucket/20240310/6e6c13735c8e4756b7d915226b60e304origin-back.png', 1, '2024-03-10 22:38:07', '2024-03-11 14:24:55');
INSERT INTO `origin` VALUES (6, 18, 1, '2455', 'http://127.0.0.1:9000/xdh-bucket/20240311/bf5b2375cc194ecd8dd76822850db336origin-back.png', 0, '2024-03-11 14:48:54', '2024-03-11 14:48:54');
INSERT INTO `origin` VALUES (7, 1, 1, '2222222224', 'http://127.0.0.1:9000/xdh-bucket/20240311/a87dff985a484aebb66735432be6e345origin-back.png', 0, '2024-03-11 14:49:08', '2024-03-11 14:49:08');
INSERT INTO `origin` VALUES (8, 2, 1, '2222222222', 'http://127.0.0.1:9000/xdh-bucket/20240311/377eb409e8b94b4ebdcbdfcbfcca64bdorigin-back.png', 0, '2024-03-11 14:49:43', '2024-03-11 14:49:43');
INSERT INTO `origin` VALUES (9, 2, 1, '44444444444', 'http://127.0.0.1:9000/xdh-bucket/20240311/78fd68e4869843e2a45ad38ed9104292origin-back.png', 0, '2024-03-11 14:51:55', '2024-03-11 14:51:55');
INSERT INTO `origin` VALUES (10, 2, 1, '444444', 'http://127.0.0.1:9000/xdh-bucket/20240311/29e85d938ab84876aa78a7df31bbc4bdorigin-back.png', 0, '2024-03-11 14:53:14', '2024-03-11 14:53:14');
INSERT INTO `origin` VALUES (11, 1, 1, '222222221111111', 'http://127.0.0.1:9000/xdh-bucket/20240311/e12e67e79ee14cae9ab06b6a9016240clogo.png', 0, '2024-03-11 14:53:43', '2024-03-11 14:53:43');
INSERT INTO `origin` VALUES (12, 2, 1, '3333333333332112', 'http://127.0.0.1:9000/xdh-bucket/20240311/64ba955a38724262bb38fac2e3043444origin-back.png', 0, '2024-03-11 14:54:10', '2024-03-11 14:54:10');
INSERT INTO `origin` VALUES (13, 2, 1, '222222221213信息', 'http://127.0.0.1:9000/xdh-bucket/20240311/f9099236f16049bb9f911c894e987000logo.png', 0, '2024-03-11 14:54:41', '2024-03-11 14:54:41');
INSERT INTO `origin` VALUES (14, 3, 1, '给', 'http://127.0.0.1:9000/xdh-bucket/20240311/8766585657a54f4691a90b30c903944dorigin-back.png', 0, '2024-03-11 14:54:50', '2024-03-11 14:54:50');
INSERT INTO `origin` VALUES (15, 3, 1, '？？？', 'http://127.0.0.1:9000/xdh-bucket/20240311/6b5eb3ce6bbf4233af0214a158037d5fback1.png', 0, '2024-03-11 14:54:58', '2024-03-11 14:54:58');
INSERT INTO `origin` VALUES (16, 2, 1, '怎么说', 'http://127.0.0.1:9000/xdh-bucket/20240311/8769d25ad27a4cc482513c2236a3fc98default.png', 0, '2024-03-11 14:55:09', '2024-03-11 14:55:09');

-- ----------------------------
-- Table structure for origin_user
-- ----------------------------
DROP TABLE IF EXISTS `origin_user`;
CREATE TABLE `origin_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `oid` bigint NULL DEFAULT NULL COMMENT '组织id',
  `uid` bigint NULL DEFAULT NULL COMMENT '用户id',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ORU_USER_ID`(`uid` ASC) USING BTREE,
  INDEX `ORU_ORIGIN_ID`(`oid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 428 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of origin_user
-- ----------------------------
INSERT INTO `origin_user` VALUES (355, 28, 1, 1, '2024-03-08 22:45:50', '2024-03-08 22:46:15');
INSERT INTO `origin_user` VALUES (356, 33, 2, 1, '2024-03-08 22:47:31', '2024-03-08 22:47:34');
INSERT INTO `origin_user` VALUES (357, 36, 2, 0, '2024-03-08 22:50:38', '2024-03-08 22:50:38');
INSERT INTO `origin_user` VALUES (358, 1, 2, 0, '2024-03-08 22:52:02', '2024-03-08 22:52:02');
INSERT INTO `origin_user` VALUES (362, 2, 2, 0, '2024-03-08 22:52:51', '2024-03-08 22:52:51');
INSERT INTO `origin_user` VALUES (363, 3, 2, 1, '2024-03-08 22:52:57', '2024-03-08 22:52:59');
INSERT INTO `origin_user` VALUES (364, 3, 2, 0, '2024-03-08 22:53:03', '2024-03-08 22:53:03');
INSERT INTO `origin_user` VALUES (400, 4, 1, 1, '2024-03-10 22:22:37', '2024-03-11 14:24:55');
INSERT INTO `origin_user` VALUES (402, 5, 1, 1, '2024-03-10 22:38:07', '2024-03-11 14:24:55');
INSERT INTO `origin_user` VALUES (420, 7, 1, 0, '2024-03-11 14:56:57', '2024-03-11 14:56:57');
INSERT INTO `origin_user` VALUES (421, 10, 1, 0, '2024-03-11 14:56:58', '2024-03-11 14:56:58');
INSERT INTO `origin_user` VALUES (422, 11, 1, 0, '2024-03-11 14:57:00', '2024-03-11 14:57:00');
INSERT INTO `origin_user` VALUES (423, 8, 1, 0, '2024-03-11 14:57:01', '2024-03-11 14:57:01');
INSERT INTO `origin_user` VALUES (424, 3, 1, 0, '2024-03-11 14:57:02', '2024-03-11 14:57:02');
INSERT INTO `origin_user` VALUES (425, 1, 1, 0, '2024-03-11 14:57:03', '2024-03-11 14:57:03');
INSERT INTO `origin_user` VALUES (426, 6, 1, 0, '2024-03-11 14:57:05', '2024-03-11 14:57:05');
INSERT INTO `origin_user` VALUES (427, 9, 1, 0, '2024-03-11 14:57:06', '2024-03-11 14:57:06');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` bigint NULL DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` tinyint NULL DEFAULT NULL COMMENT '类型（1菜单2按钮）',
  `permission_value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '访问路径',
  `state` tinyint(1) NULL DEFAULT 0 COMMENT '状态（1禁用）',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (34, 0, '权限管理', 1, '17', '/', 0, 0, '2024-01-06 22:06:16', '2024-01-10 16:35:09');
INSERT INTO `permission` VALUES (35, 34, '角色管理', 1, '18', '/role', 0, 0, '2024-01-07 16:55:12', '2024-01-07 17:52:59');
INSERT INTO `permission` VALUES (36, 34, '权限管理', 1, '19', '/permission', 0, 0, '2024-01-07 16:55:47', '2024-01-08 16:29:14');
INSERT INTO `permission` VALUES (37, 34, '用户管理', 1, '7', '/user', 0, 0, '2024-01-07 17:01:48', '2024-01-07 17:52:41');
INSERT INTO `permission` VALUES (38, 0, '组织管理', 1, '5', '/originUser', 0, 0, '2024-01-07 17:02:52', '2024-01-08 16:21:12');
INSERT INTO `permission` VALUES (39, 38, '组织用户列表', 2, '32', '/addOriginUser', 0, 0, '2024-01-07 17:03:07', '2024-01-24 20:46:10');
INSERT INTO `permission` VALUES (40, 38, '删除学校组织', 2, '31', '/deleteOriginUser', 0, 0, '2024-01-07 17:03:11', '2024-01-24 20:45:32');
INSERT INTO `permission` VALUES (41, 38, '修改学校组织', 2, '30', '/updateOriginUser', 0, 0, '2024-01-07 17:03:12', '2024-01-24 20:46:07');
INSERT INTO `permission` VALUES (43, 0, '校友讨论管理', 1, 'a_admin', '/comment', 0, 0, '2024-01-07 17:05:16', '2024-01-07 17:21:32');
INSERT INTO `permission` VALUES (44, 43, '帖子管理', 1, '10', '/disscuss', 0, 0, '2024-01-07 17:05:19', '2024-01-10 17:44:35');
INSERT INTO `permission` VALUES (46, 43, '动态管理', 1, '0', '/dynamic', 0, 0, '2024-01-07 17:05:21', '2024-01-15 18:03:08');
INSERT INTO `permission` VALUES (47, 0, '首页管理', 1, '23', '/dashboard', 0, 0, '2024-01-07 17:09:45', '2024-01-24 15:27:49');
INSERT INTO `permission` VALUES (48, 47, '轮播图管理', 1, '2', '/banner', 0, 0, '2024-01-07 17:10:10', '2024-01-07 17:50:51');
INSERT INTO `permission` VALUES (49, 47, '公告管理', 1, '1', '/notice', 0, 0, '2024-01-07 17:10:26', '2024-01-07 17:50:39');
INSERT INTO `permission` VALUES (53, 0, '地区管理', 1, '3', '/region', 0, 0, '2024-01-08 16:20:36', '2024-01-08 16:21:00');
INSERT INTO `permission` VALUES (54, 38, '组织用户管理', 1, '25', '/originUser', 0, 0, '2024-01-08 16:21:47', '2024-01-24 20:40:26');
INSERT INTO `permission` VALUES (55, 0, '学院管理', 1, '4', '/college', 0, 0, '2024-01-08 16:22:56', '2024-01-08 16:22:56');
INSERT INTO `permission` VALUES (56, 0, '标签管理', 1, '6', '/tag', 0, 0, '2024-01-08 16:23:04', '2024-01-08 16:23:19');
INSERT INTO `permission` VALUES (57, 44, '添加帖子', 2, '9', '/addDiscuss', 0, 0, '2024-01-08 16:24:09', '2024-01-08 16:26:30');
INSERT INTO `permission` VALUES (58, 0, '评论/回复', 1, '26', '/commentOrReply/:id', 0, 0, '2024-01-08 16:25:07', '2024-01-08 16:25:22');
INSERT INTO `permission` VALUES (59, 60, '添加问题', 2, '12', '/addQuestion', 0, 0, '2024-01-08 16:25:40', '2024-01-10 17:47:57');
INSERT INTO `permission` VALUES (60, 43, '问题管理', 1, '13', '/question', 0, 0, '2024-01-08 16:25:55', '2024-01-10 17:45:24');
INSERT INTO `permission` VALUES (61, 0, '回答', 1, '27', '/answer', 0, 1, '2024-01-08 16:26:26', '2024-02-22 16:24:04');
INSERT INTO `permission` VALUES (62, 46, '添加动态', 1, '15', '/addDynamic', 0, 0, '2024-01-08 16:26:46', '2024-01-10 17:20:46');
INSERT INTO `permission` VALUES (65, 60, '问题审核', 2, '22', '/updateQuestion', 0, 0, '2024-01-10 16:25:03', '2024-02-28 17:12:13');
INSERT INTO `permission` VALUES (67, 60, '问题删除', 2, '11', '/deleteQuestion', 0, 0, '2024-01-10 17:36:43', '2024-01-10 17:36:43');
INSERT INTO `permission` VALUES (68, 44, '帖子审核', 2, '21', '/updateDiscuss', 0, 0, '2024-01-10 17:40:50', '2024-01-24 17:07:52');
INSERT INTO `permission` VALUES (69, 44, '帖子删除', 2, '8', '/deleteDiscuss', 0, 0, '2024-01-10 17:41:53', '2024-01-10 17:42:00');
INSERT INTO `permission` VALUES (71, 46, '动态删除', 2, '14', '/deleteDynamic', 0, 0, '2024-01-15 00:35:00', '2024-01-15 00:35:41');
INSERT INTO `permission` VALUES (78, 58, '删除评论或回复', 2, '16', '/delete', 0, 0, '2024-01-24 17:25:00', '2024-02-28 17:34:33');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` bigint NULL DEFAULT NULL COMMENT '用户id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '问题内容',
  `tid` bigint NULL DEFAULT NULL COMMENT '标签id',
  `is_audit` tinyint(1) NULL DEFAULT 0 COMMENT '是否审核通过（0审核中，1通过，2未通过）',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (9, 2, '到底哪里？', '学校食堂哪里好吃？', 1, 1, 1, '2024-01-15 00:28:31', '2024-02-28 17:13:36');
INSERT INTO `question` VALUES (10, 1, '123', '??????wenhao', 1, 1, 0, '2024-01-24 17:58:50', '2024-02-22 16:25:16');
INSERT INTO `question` VALUES (11, 1, '123', 'zenmohishi', 6, 0, 1, '2024-01-24 17:59:27', '2024-01-24 18:28:49');
INSERT INTO `question` VALUES (12, 1, '?????', 'dddddddddddddddddddd', 6, 0, 1, '2024-01-09 18:15:33', '2024-01-24 18:28:46');
INSERT INTO `question` VALUES (13, 1, 'adda', '????????sssssssssssssssssss', 7, 0, 1, '2024-01-24 18:00:16', '2024-01-24 18:28:46');
INSERT INTO `question` VALUES (14, 1, '1', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', 7, 0, 1, '2024-01-24 18:10:27', '2024-01-24 18:28:46');
INSERT INTO `question` VALUES (15, 1, '2', '啊啊啊啊啊啊啊啊啊啊啊啊啊', 7, 0, 1, '2024-01-24 18:10:37', '2024-01-24 18:28:46');
INSERT INTO `question` VALUES (16, 1, '3', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', 7, 0, 1, '2024-01-24 18:10:43', '2024-01-24 18:28:46');
INSERT INTO `question` VALUES (17, 1, '333333333', '22222222222222222222222222', 7, 0, 1, '2024-01-24 18:10:49', '2024-01-24 18:28:46');
INSERT INTO `question` VALUES (18, 1, '233333333333', '2222222222222222222222', 7, 0, 1, '2024-01-24 18:10:56', '2024-01-24 18:28:46');
INSERT INTO `question` VALUES (19, 1, '222222222222', '？？？？？？？？？？？？？？？？？？？？？', 6, 2, 1, '2024-02-04 13:38:55', '2024-02-21 22:18:59');
INSERT INTO `question` VALUES (20, 1, '11111111111', '444444444444444', 10, 1, 0, '2024-02-28 16:12:21', '2024-02-28 17:33:37');
INSERT INTO `question` VALUES (21, 1, '23', '33？？？', 6, 1, 0, '2024-03-08 22:54:53', '2024-03-08 22:55:20');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` bigint NULL DEFAULT NULL COMMENT '行政区编码',
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地区',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父id',
  `level_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '级别',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10003859 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (1, 420000, '湖北省', 0, '0', 0, '2024-01-03 16:35:13', '2024-01-08 17:09:10');
INSERT INTO `region` VALUES (2, 420100, '武汉市', 1, '1', 0, '2024-01-03 16:36:17', '2024-01-03 16:53:31');
INSERT INTO `region` VALUES (3, 420111, '洪山区', 2, '2', 0, '2024-01-03 16:36:43', '2024-02-27 17:37:05');
INSERT INTO `region` VALUES (10003821, 420102, '江岸区', 2, '2', 0, '2024-01-08 17:00:16', '2024-02-27 17:37:09');
INSERT INTO `region` VALUES (10003822, 420103, '江汉区', 2, '2', 0, '2024-01-08 17:01:38', '2024-02-27 17:37:01');
INSERT INTO `region` VALUES (10003841, 110000, '北京市', 0, '0', 0, '2024-01-08 17:06:30', '2024-01-08 17:09:11');
INSERT INTO `region` VALUES (10003842, 110101, '东城区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-02-27 17:36:58');
INSERT INTO `region` VALUES (10003843, 110102, '西城区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-02-27 17:36:53');
INSERT INTO `region` VALUES (10003844, 110105, '朝阳区', 10003841, '1', 1, '2024-01-08 17:06:30', '2024-02-27 17:36:52');
INSERT INTO `region` VALUES (10003845, 110106, '丰台区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-02-27 17:36:51');
INSERT INTO `region` VALUES (10003846, 110107, '石景山区', 10003841, '1', 1, '2024-01-08 17:06:30', '2024-02-27 17:36:49');
INSERT INTO `region` VALUES (10003847, 110108, '海淀区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-02-27 17:36:47');
INSERT INTO `region` VALUES (10003848, 110109, '门头沟区', 10003841, '1', 1, '2024-01-08 17:06:30', '2024-02-27 17:36:43');
INSERT INTO `region` VALUES (10003849, 110111, '房山区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:49');
INSERT INTO `region` VALUES (10003850, 110112, '通州区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:49');
INSERT INTO `region` VALUES (10003851, 110113, '顺义区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:49');
INSERT INTO `region` VALUES (10003852, 110114, '昌平区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:49');
INSERT INTO `region` VALUES (10003853, 110115, '大兴区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:49');
INSERT INTO `region` VALUES (10003854, 110116, '怀柔区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:54');
INSERT INTO `region` VALUES (10003855, 110117, '平谷区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:54');
INSERT INTO `region` VALUES (10003856, 110118, '密云区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:54');
INSERT INTO `region` VALUES (10003857, 110119, '延庆区', 10003841, '1', 0, '2024-01-08 17:06:30', '2024-01-08 17:08:54');
INSERT INTO `region` VALUES (10003858, 123, '蔡甸区', 2, '2', 0, '2024-02-22 20:24:56', '2024-02-22 20:24:56');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint NULL DEFAULT NULL COMMENT '被回复人id',
  `cid` bigint NULL DEFAULT NULL COMMENT '评论id',
  `did` bigint NULL DEFAULT NULL COMMENT '帖子id',
  `reply_id` bigint NULL DEFAULT NULL COMMENT '回复人id',
  `reply_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `up` int NULL DEFAULT 0 COMMENT '点赞数',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `REP_USER_ID`(`reply_id` ASC) USING BTREE,
  INDEX `REP_DISCUSS_ID`(`cid` ASC) USING BTREE,
  INDEX `RU_UID`(`uid` ASC) USING BTREE,
  INDEX `RD_DID`(`did` ASC) USING BTREE,
  CONSTRAINT `RC_CID` FOREIGN KEY (`cid`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RD_DID` FOREIGN KEY (`did`) REFERENCES `discuss` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RU_UID` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 2, 3, 2, 2, '11111111111', 0, 1, '2024-01-24 20:16:51', '2024-01-24 20:17:43');
INSERT INTO `reply` VALUES (2, 2, 4, 3, 2, '98999', 0, 1, '2024-01-24 20:18:45', '2024-01-24 20:19:01');
INSERT INTO `reply` VALUES (3, 2, 5, 1, 2, '222222222222', 0, 1, '2024-01-24 20:29:56', '2024-01-24 20:30:29');
INSERT INTO `reply` VALUES (4, 2, 6, 6, 2, '22222222222222222', 0, 1, '2024-01-24 20:30:06', '2024-01-24 20:30:29');
INSERT INTO `reply` VALUES (5, 2, 7, 7, 2, '44444444444444444444444', 0, 1, '2024-01-24 20:30:15', '2024-01-24 20:30:47');
INSERT INTO `reply` VALUES (6, 1, 8, 8, 1, 'sb', 0, 1, '2024-02-04 13:50:16', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (7, 1, 8, 8, 1, 'sbbbbbbbbbbbbbbb', 0, 1, '2024-02-04 13:50:21', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (8, 1, 9, 8, 1, '2222222222222', 0, 1, '2024-02-04 13:50:31', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (9, 1, 9, 8, 1, '222222222', 0, 1, '2024-02-04 13:50:56', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (11, 1, 9, 8, 1, '44444444444444444444444433333333', 0, 1, '2024-02-04 13:51:14', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (12, 1, 10, 8, 1, '', 0, 1, '2024-02-04 13:51:15', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (13, 1, 12, 8, 1, '222222222222', 0, 1, '2024-02-04 14:00:43', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (14, 1, 12, 8, 1, '22222222222222', 0, 1, '2024-02-04 14:00:54', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (15, 1, 12, 8, 1, '333333333', 1, 1, '2024-02-04 14:01:28', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (16, 1, 12, 8, 1, '4444444', 0, 1, '2024-02-04 14:01:32', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (17, 1, 13, 8, 1, '', 1, 1, '2024-02-04 14:03:10', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (18, 1, 13, 8, 1, '', 1, 1, '2024-02-04 14:03:18', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (19, 1, 13, 8, 1, '3', 1, 1, '2024-02-04 14:06:17', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (20, 1, 13, 8, 1, '4', 1, 1, '2024-02-04 14:06:21', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (21, 1, 13, 8, 1, '2', 1, 1, '2024-02-04 14:07:35', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (22, 1, 13, 8, 1, '3', 2, 1, '2024-02-04 14:09:28', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (23, 1, 13, 8, 3, '????', 1, 1, '2024-02-18 17:09:37', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (24, 1, 13, 8, 1, '2', 1, 1, '2024-02-21 16:35:26', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (25, 1, 13, 8, 1, '3', 1, 1, '2024-02-21 16:35:27', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (26, 1, 13, 8, 1, '5', 1, 1, '2024-02-21 16:35:29', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (27, 1, 13, 8, 1, '6', 1, 1, '2024-02-21 16:35:30', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (28, 1, 13, 8, 1, '7', 1, 1, '2024-02-21 16:35:32', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (29, 1, 13, 8, 1, '7', 0, 1, '2024-02-21 16:35:45', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (30, 1, 13, 8, 1, '3', 0, 1, '2024-02-21 16:35:47', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (31, 1, 13, 8, 1, '2', 0, 1, '2024-02-21 16:35:48', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (32, 1, 13, 8, 1, '23452', 0, 1, '2024-02-21 16:35:51', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (33, 1, 13, 8, 1, '4444444444444444444', 0, 1, '2024-02-21 16:35:53', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (35, 1, 13, 8, 1, '33333333333', 0, 1, '2024-02-21 16:36:02', '2024-02-21 22:39:33');
INSERT INTO `reply` VALUES (36, 1, 11, 8, 1, '333333333333', 0, 1, '2024-02-21 16:36:17', '2024-02-21 22:39:33');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_value` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色值',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '学校管理员', 's_adm', 0, '2024-01-02 18:40:57', '2024-01-05 15:39:29');
INSERT INTO `role` VALUES (2, '社长', 'a_adm', 0, '2024-01-02 18:41:03', '2024-01-12 15:52:45');
INSERT INTO `role` VALUES (3, '校友', 'stu', 0, '2024-01-03 17:01:49', '2024-01-12 15:53:28');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` bigint NULL DEFAULT NULL COMMENT '菜单id',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `RP_ROLE_ID`(`role_id` ASC) USING BTREE,
  INDEX `RP_PER_ID`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `RP_PER_ID` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RP_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 373 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (83, 1, 34, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (84, 1, 35, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (85, 1, 36, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (86, 1, 37, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (87, 1, 38, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (88, 1, 39, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (89, 1, 40, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (90, 1, 41, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (91, 1, 43, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (92, 1, 44, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (94, 1, 46, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (95, 1, 47, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (96, 1, 48, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (97, 1, 49, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (101, 1, 53, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (102, 1, 54, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (103, 1, 55, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (104, 1, 56, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (105, 1, 57, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (106, 1, 58, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (107, 1, 59, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (108, 1, 60, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (109, 1, 61, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (110, 1, 62, 0, '2024-01-08 16:38:27', '2024-01-08 16:38:27');
INSERT INTO `role_permission` VALUES (112, 1, 65, 0, '2024-01-10 18:07:15', '2024-01-10 18:07:15');
INSERT INTO `role_permission` VALUES (114, 1, 67, 0, '2024-01-10 18:07:15', '2024-01-10 18:07:15');
INSERT INTO `role_permission` VALUES (115, 1, 68, 0, '2024-01-10 18:07:15', '2024-01-10 18:07:15');
INSERT INTO `role_permission` VALUES (116, 1, 69, 0, '2024-01-10 18:07:15', '2024-01-10 18:07:15');
INSERT INTO `role_permission` VALUES (118, 1, 71, 0, '2024-01-15 00:36:30', '2024-01-15 00:36:30');
INSERT INTO `role_permission` VALUES (146, 2, 38, 0, '2024-01-24 17:05:32', '2024-01-24 17:05:32');
INSERT INTO `role_permission` VALUES (147, 2, 47, 1, '2024-01-24 17:05:52', '2024-02-28 17:48:28');
INSERT INTO `role_permission` VALUES (149, 2, 39, 0, '2024-01-24 17:06:44', '2024-01-24 17:06:44');
INSERT INTO `role_permission` VALUES (150, 2, 40, 0, '2024-01-24 17:06:48', '2024-01-24 17:06:48');
INSERT INTO `role_permission` VALUES (151, 2, 41, 0, '2024-01-24 17:06:51', '2024-01-24 17:06:51');
INSERT INTO `role_permission` VALUES (152, 2, 43, 0, '2024-01-24 17:08:21', '2024-01-24 17:08:21');
INSERT INTO `role_permission` VALUES (153, 2, 44, 0, '2024-01-24 17:08:24', '2024-01-24 17:08:24');
INSERT INTO `role_permission` VALUES (154, 2, 68, 0, '2024-01-24 17:08:29', '2024-01-24 17:08:29');
INSERT INTO `role_permission` VALUES (155, 2, 69, 0, '2024-01-24 17:08:37', '2024-01-24 17:08:37');
INSERT INTO `role_permission` VALUES (156, 2, 58, 0, '2024-01-24 17:09:16', '2024-01-24 17:09:16');
INSERT INTO `role_permission` VALUES (157, 2, 57, 0, '2024-01-24 17:09:47', '2024-01-24 17:09:47');
INSERT INTO `role_permission` VALUES (158, 2, 54, 0, '2024-01-24 17:10:17', '2024-01-24 17:10:18');
INSERT INTO `role_permission` VALUES (159, 2, 38, 0, '2024-01-24 17:10:21', '2024-01-24 17:10:21');
INSERT INTO `role_permission` VALUES (160, 2, 65, 0, '2024-01-24 17:11:15', '2024-01-24 17:11:15');
INSERT INTO `role_permission` VALUES (161, 2, 67, 0, '2024-01-24 17:11:22', '2024-01-24 17:11:22');
INSERT INTO `role_permission` VALUES (162, 2, 71, 0, '2024-01-24 17:12:39', '2024-01-24 17:12:39');
INSERT INTO `role_permission` VALUES (164, 1, 78, 0, '2024-01-24 17:29:13', '2024-01-24 17:29:13');
INSERT INTO `role_permission` VALUES (166, 2, 47, 1, '2024-01-24 20:46:41', '2024-02-28 17:48:28');
INSERT INTO `role_permission` VALUES (167, 2, 48, 1, '2024-01-24 20:46:46', '2024-02-28 17:48:45');
INSERT INTO `role_permission` VALUES (168, 2, 49, 1, '2024-01-24 20:46:50', '2024-02-28 17:48:45');
INSERT INTO `role_permission` VALUES (171, 2, 78, 0, '2024-02-28 15:57:31', '2024-02-28 15:57:31');
INSERT INTO `role_permission` VALUES (178, 2, 60, 0, '2024-02-28 16:58:30', '2024-02-28 16:58:30');
INSERT INTO `role_permission` VALUES (179, 2, 62, 0, '2024-02-28 16:58:33', '2024-02-28 16:58:36');
INSERT INTO `role_permission` VALUES (180, 2, 46, 0, '2024-02-28 17:11:21', '2024-02-28 17:11:21');
INSERT INTO `role_permission` VALUES (181, 2, 59, 0, '2024-02-28 17:12:37', '2024-02-28 17:12:37');
INSERT INTO `role_permission` VALUES (182, 2, 67, 0, '2024-02-28 17:19:02', '2024-02-28 17:19:02');
INSERT INTO `role_permission` VALUES (183, 2, 61, 0, '2024-02-28 17:35:34', '2024-02-28 17:35:34');
INSERT INTO `role_permission` VALUES (360, 3, 55, 1, '2024-02-28 21:04:14', '2024-02-28 21:04:24');
INSERT INTO `role_permission` VALUES (361, 3, 56, 1, '2024-02-28 21:04:14', '2024-02-28 21:04:24');
INSERT INTO `role_permission` VALUES (362, 3, 55, 1, '2024-02-28 21:04:27', '2024-02-28 21:04:30');
INSERT INTO `role_permission` VALUES (363, 3, 56, 1, '2024-02-28 21:04:27', '2024-02-28 21:04:30');
INSERT INTO `role_permission` VALUES (364, 3, 53, 1, '2024-02-28 21:04:34', '2024-03-08 21:51:28');
INSERT INTO `role_permission` VALUES (365, 3, 55, 1, '2024-02-28 21:04:34', '2024-03-08 21:51:28');
INSERT INTO `role_permission` VALUES (366, 3, 56, 1, '2024-02-28 21:04:34', '2024-03-08 21:51:28');
INSERT INTO `role_permission` VALUES (367, 3, 53, 1, '2024-03-08 21:51:31', '2024-03-08 21:51:35');
INSERT INTO `role_permission` VALUES (368, 3, 55, 1, '2024-03-08 21:51:31', '2024-03-08 21:51:35');
INSERT INTO `role_permission` VALUES (369, 3, 56, 1, '2024-03-08 21:51:31', '2024-03-08 21:51:35');
INSERT INTO `role_permission` VALUES (370, 3, 53, 1, '2024-03-08 21:51:37', '2024-03-08 21:51:40');
INSERT INTO `role_permission` VALUES (371, 3, 55, 1, '2024-03-08 21:51:37', '2024-03-08 21:51:40');
INSERT INTO `role_permission` VALUES (372, 3, 56, 1, '2024-03-08 21:51:37', '2024-03-08 21:51:40');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '日常', 1, '2024-01-03 15:04:28', '2024-02-22 16:37:44');
INSERT INTO `tag` VALUES (6, '组织活动', 0, '2024-01-24 17:38:03', '2024-01-24 18:51:59');
INSERT INTO `tag` VALUES (7, '二手市场', 1, '2024-01-24 17:38:13', '2024-02-22 17:16:50');
INSERT INTO `tag` VALUES (8, '日常', 1, '2024-02-22 16:37:52', '2024-02-22 17:16:49');
INSERT INTO `tag` VALUES (9, 'GO', 1, '2024-02-22 16:37:58', '2024-02-22 16:38:20');
INSERT INTO `tag` VALUES (10, '二手市场', 0, '2024-02-22 17:16:56', '2024-02-22 17:16:56');
INSERT INTO `tag` VALUES (11, '首页', 0, '2024-02-22 17:17:00', '2024-02-22 17:17:00');
INSERT INTO `tag` VALUES (12, '2', 1, '2024-02-22 17:18:02', '2024-02-22 17:18:20');
INSERT INTO `tag` VALUES (13, '3', 1, '2024-02-22 17:18:04', '2024-02-22 17:18:21');
INSERT INTO `tag` VALUES (14, '222', 0, '2024-02-22 17:18:17', '2024-02-22 17:18:17');
INSERT INTO `tag` VALUES (15, '2', 1, '2024-02-22 17:18:29', '2024-02-22 17:18:35');
INSERT INTO `tag` VALUES (16, '4', 1, '2024-02-22 17:18:31', '2024-02-22 17:18:37');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rid` bigint NULL DEFAULT NULL COMMENT '所属地区id',
  `college_id` bigint NULL DEFAULT NULL COMMENT '所属学院id',
  `admin_type` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '管理员标识(1普通用户 2学院管理员 3学校管理员)',
  `passsword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `email` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `avatar` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '校友名称',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户签名',
  `status` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 1 COMMENT '用户状态（1在校，2毕业）',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `USER_NAME`(`username` ASC) USING BTREE,
  INDEX `USER_REGION_ID`(`rid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 10003847, 18, 3, '8a705011ad167d8f9306eb0a29a55f05', 'admin@qq.com', 'http://127.0.0.1:9000/xdh-bucket/20240311/b8710ee2e3ff4994a8349dffe8a7a99eblob', '管理员', '管理员', 2, 0, '2024-01-12 16:19:20', '2024-03-11 14:59:26');
INSERT INTO `user` VALUES (2, 10003822, 1, 2, '8a705011ad167d8f9306eb0a29a55f05', '123@qq.com', 'http://127.0.0.1:9000/xdh-bucket/20240222/f86a8fdd9b49493b949c91897134888elogo.png', '校友6uk3fp', '大', 1, 0, '2024-01-12 16:28:06', '2024-02-22 20:20:28');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint NOT NULL COMMENT '校友id',
  `sex` tinyint NULL DEFAULT NULL COMMENT '校友性别（1女，2男）',
  `age` tinyint NULL DEFAULT NULL COMMENT '校友年龄',
  `birthday` date NULL DEFAULT NULL COMMENT '校友生日',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '校友邮箱',
  `qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '校友qq',
  `wechat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `microblog` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微博号',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 2, 123, '2024-02-29', '1234', 'admin@qq.com', '22222222', '管理员', '管理员', '1', 0, '2024-01-12 16:19:20', '2024-03-10 21:38:45');
INSERT INTO `user_info` VALUES (2, 1, 1, '2024-02-23', '1234', '123@qq.com', '1234', '校友6uk3fp', '大', '1', 0, '2024-01-12 16:28:06', '2024-02-22 20:20:28');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint NULL DEFAULT NULL COMMENT '权限id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除（0未删除1删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UR_USER_ID`(`user_id` ASC) USING BTREE,
  INDEX `UR_ROLE_ID`(`role_id` ASC) USING BTREE,
  CONSTRAINT `UR_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UR_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1, 0, '2024-01-12 16:22:03', '2024-02-28 17:47:19');
INSERT INTO `user_role` VALUES (2, 2, 2, 0, '2024-01-12 16:28:06', '2024-01-15 18:24:14');

SET FOREIGN_KEY_CHECKS = 1;
