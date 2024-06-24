/*
 Navicat MySQL Data Transfer

 Source Server         : mysql57
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : localhost:3306
 Source Schema         : db_newswebsite

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 01/03/2023 00:52:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add article', 7, 'add_article');
INSERT INTO `auth_permission` VALUES (26, 'Can change article', 7, 'change_article');
INSERT INTO `auth_permission` VALUES (27, 'Can delete article', 7, 'delete_article');
INSERT INTO `auth_permission` VALUES (28, 'Can view article', 7, 'view_article');
INSERT INTO `auth_permission` VALUES (29, 'Can add category', 8, 'add_category');
INSERT INTO `auth_permission` VALUES (30, 'Can change category', 8, 'change_category');
INSERT INTO `auth_permission` VALUES (31, 'Can delete category', 8, 'delete_category');
INSERT INTO `auth_permission` VALUES (32, 'Can view category', 8, 'view_category');
INSERT INTO `auth_permission` VALUES (33, 'Can add user profile', 9, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (34, 'Can change user profile', 9, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user profile', 9, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (36, 'Can view user profile', 9, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (37, 'Can add comment', 10, 'add_comment');
INSERT INTO `auth_permission` VALUES (38, 'Can change comment', 10, 'change_comment');
INSERT INTO `auth_permission` VALUES (39, 'Can delete comment', 10, 'delete_comment');
INSERT INTO `auth_permission` VALUES (40, 'Can view comment', 10, 'view_comment');
INSERT INTO `auth_permission` VALUES (41, 'Can add best', 11, 'add_best');
INSERT INTO `auth_permission` VALUES (42, 'Can change best', 11, 'change_best');
INSERT INTO `auth_permission` VALUES (43, 'Can delete best', 11, 'delete_best');
INSERT INTO `auth_permission` VALUES (44, 'Can view best', 11, 'view_best');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$260000$op3m8VZROHIQTurKUVcCvH$MQYx/L5OGHBsqTjMngr8RRNKJ9vSsLqxex4IvEZawJ4=', '2023-02-28 16:48:34.338987', 1, 'bhml', '', '', '19645645@qq.com', 1, 1, '2023-02-24 16:14:52.799362');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$260000$IGBOw5sRHHjbgu8nLSZ8GC$MkcYFIpwFhtKHyN6YFfU1czsOP23S0Nki9lNsDmb+Y8=', '2023-02-28 13:11:00.608597', 0, 'james', '', '', '192645645@qq.com', 0, 1, '2023-02-28 13:10:24.874379');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$260000$mMWKp8mF2JCgCjoPUVWpSN$DdjOFfL4V5vmWZeNdVoU5s/C9lnRzFisbh2BR0Pr7iM=', '2023-02-28 16:12:19.207474', 0, '冻鱼大侠', '', '', '15315523152@qq.com', 0, 1, '2023-02-28 14:57:50.785871');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$260000$CdxawgInSGZwMCkada4Kms$OWWIdlVkhsEV4yZwa61T7KHUVbNoaSnk26rkUR6vZt4=', '2023-02-28 15:45:07.583046', 1, 'admin', '', '', '', 1, 1, '2023-02-28 15:44:42.300302');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-02-24 16:15:29.043805', '1', '热点新闻', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-02-24 16:15:39.652921', '2', 'NBA', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (3, '2023-02-24 16:15:50.957672', '3', '军事', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (4, '2023-02-24 16:42:49.262714', '1', '您最喜欢的NBA球星是？', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-02-24 16:43:28.247747', '1', 'bhml', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-02-24 16:43:56.211844', '1', '首页推荐-您最喜欢的NBA球星是？', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (7, '2023-02-24 16:49:48.010799', '2', '最喜欢的编程语言？', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (8, '2023-02-27 10:01:48.180305', '2', '最喜欢的编程语言？', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-02-27 10:01:48.214493', '1', '您最喜欢的NBA球星是？', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-02-27 10:09:12.402279', '3', '戴表狂飙！利拉德71+6+6刷爆纪录 13记三分历史第2', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-02-27 10:09:25.566380', '2', '今日热闻-戴表狂飙！利拉德71+6+6刷爆纪录 13记三分历史第2', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-02-27 10:12:47.875010', '4', '范德彪已成湖人第三巨头！百回合能赢33.5分 年薪仅排第230位', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-02-27 10:13:00.274106', '3', '首页推荐-范德彪已成湖人第三巨头！百回合能赢33.5分 年薪仅排第230位', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (14, '2023-02-27 14:14:10.073018', '5', '阿里确定淘宝2023年五大战略，价格力在今年会更被重视', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (15, '2023-02-27 14:14:37.058462', '4', '小编推荐-阿里确定淘宝2023年五大战略，价格力在今年会更被重视', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (16, '2023-02-27 14:46:28.106802', '6', '汤神32分勇士末节逆转森林狼 3连发球失误险葬送胜局', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (17, '2023-02-27 14:46:48.454589', '5', '小编推荐-汤神32分勇士末节逆转森林狼 3连发球失误险葬送胜局', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (18, '2023-02-28 12:49:47.719310', '1', 'bhml: 你好撒打发', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (19, '2023-02-28 15:09:54.354951', '7', '一周年！去年世界最大运输机安-225被摧毁', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (20, '2023-02-28 15:12:09.943080', '6', '军事-首页推荐-一周年！去年世界最大运输机安-225被摧毁', 1, '[{\"added\": {}}]', 11, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'newswebsite', 'article');
INSERT INTO `django_content_type` VALUES (11, 'newswebsite', 'best');
INSERT INTO `django_content_type` VALUES (8, 'newswebsite', 'category');
INSERT INTO `django_content_type` VALUES (10, 'newswebsite', 'comment');
INSERT INTO `django_content_type` VALUES (9, 'newswebsite', 'userprofile');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-02-24 16:12:27.141491');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-02-24 16:12:33.695462');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-02-24 16:12:35.244850');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-02-24 16:12:35.269835');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-24 16:12:35.319648');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-02-24 16:12:35.907601');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-02-24 16:12:36.584563');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-02-24 16:12:37.133836');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-02-24 16:12:37.163855');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-02-24 16:12:37.685260');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-02-24 16:12:37.708932');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-24 16:12:37.737966');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-02-24 16:12:38.158052');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-24 16:12:38.739510');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-02-24 16:12:39.147352');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-02-24 16:12:39.454479');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-24 16:12:40.331273');
INSERT INTO `django_migrations` VALUES (18, 'newswebsite', '0001_initial', '2023-02-24 16:12:44.188107');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2023-02-24 16:12:44.950976');
INSERT INTO `django_migrations` VALUES (20, 'newswebsite', '0002_auto_20230225_0033', '2023-02-24 16:33:16.198778');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3pwg4lbdear5bs6woxki9thh5xr30wjl', '.eJxVjEEOgjAQRe_StWmoHWbApXvOQKYzxaKmTSisjHdXEha6_e-9_zIjb2satxqXcVZzMWdz-t0CyyPmHeid861YKXld5mB3xR602qFofF4P9-8gcU3fmiI5IaeAIUjAjhsFaXvHgspEPZF4AUBi8KpTJG0APUvbBSeKk3l_APeHOJk:1pWzky:iwx4ETaH8sFLm8vqT376nN-sKzveUWC9bhTvu5VHgPE', '2023-03-14 13:11:00.672588');
INSERT INTO `django_session` VALUES ('llqlkgjb3hcjanlhbzhkchnuefqladun', '.eJxVjMEOgjAQRP-lZ9N0S6GtR-98Q7PdXSxqIKFwMv67kHDQ0yTz3sxbJdzWkrYqSxpZXRWoy2-XkZ4yHYAfON1nTfO0LmPWh6JPWnU_s7xup_t3ULCWfS04iPXgDECDtnMeMRhH7R40-EjWAXE0PmTmCBwgx468FWlaMg1H9fkC5N03-g:1pX39W:YpYCrUdOszRjlklCwLoZla8xgqDXBbRKkTuhn8N30wc', '2023-03-14 16:48:34.403049');
INSERT INTO `django_session` VALUES ('w20gptfsugqal0hpivdlaxaw6h79ntn2', '.eJxVjMEOgjAQRP-lZ9N0S6GtR-98Q7PdXSxqIKFwMv67kHDQ0yTz3sxbJdzWkrYqSxpZXRWoy2-XkZ4yHYAfON1nTfO0LmPWh6JPWnU_s7xup_t3ULCWfS04iPXgDECDtnMeMRhH7R40-EjWAXE0PmTmCBwgx468FWlaMg1H9fkC5N03-g:1pWZon:zYZrb5o010EX_BKCiNtMtXhoDZ3i6fKCcvGK8CDmKV4', '2023-03-13 09:29:13.420231');

-- ----------------------------
-- Table structure for newswebsite_article
-- ----------------------------
DROP TABLE IF EXISTS `newswebsite_article`;
CREATE TABLE `newswebsite_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `abstract` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish_time` datetime(6) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `newswebsite_article_category_id_e8393868_fk_newswebsi`(`category_id`) USING BTREE,
  CONSTRAINT `newswebsite_article_category_id_e8393868_fk_newswebsi` FOREIGN KEY (`category_id`) REFERENCES `newswebsite_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newswebsite_article
-- ----------------------------
INSERT INTO `newswebsite_article` VALUES (3, '戴表狂飙！利拉德71+6+6刷爆纪录 13记三分历史第2', '戴表狂飙！利拉德71+6+6刷爆纪录 13记三分历史第2', '利拉德，71分，历史新高', '北京时间2月27日，开拓者在主场大胜火箭，达米安-利拉德上演精彩得分秀，38投22中，三分球22中13，罚球14投全中砍下71分（以及6篮板6助攻），创造生涯新高，追平米切尔成NBA现役单场得分王，命中13记三分仅次于汤普森排名历史第2。这是他第五次砍下60+，超越了乔丹哈登的4次，仅次于张伯伦和科比。71分也是火箭队史最高的对手得分纪录。', '2023-02-27 10:07:36.000000', 'article_image/lilarde.jpg', 'bhml', 'author_avatar/avatar2.png', 'NBA记者', 2);
INSERT INTO `newswebsite_article` VALUES (4, '范德彪已成湖人第三巨头！百回合能赢33.5分 年薪仅排第230位', '范德彪已成湖人第三巨头！百回合能赢33.5分 年薪仅排第230位', '范德彪，湖人，NBA', '北京时间2月27日，湖人击败独行侠，完成27分大逆转，而被球迷们称为“范德彪”、“彪哥”的范德比尔特成为翻盘功臣，他拿下15分17篮板4抢断，成功限制了东契奇。在他对位东契奇的情况下，这位独行侠的当家球星只有7投2中的表现。越来越多人认可，范德比尔特已经成为湖人的第三巨头！\r\n\r\n洛杉矶记者Law Murray在社媒上写道：“JV（范德比尔特）是湖人最重要的引援……不是拉塞尔，不是八村垒，不是比斯利，不是其他任何人。把托斯卡诺-安德森升级为范德比尔特，让湖人的那个位置提升了一个档次。”\r\n\r\n范德比尔特的最大价值，体现在篮板和防守上。这场比赛，抢下17个篮板，其中8个前场篮板平了生涯纪录。他对东契奇的防守，也极具威慑力，比赛中，东契奇多次面对范德比尔特出手不中。数据显示，东契奇生涯对阵范德比尔特的比赛，场均只有21.8分，投篮命中率43.4%，三分命中率29.4%，作为对比，东契奇生涯场均数据是27.5分，投篮命中率46.6%，三分命中率33.9%。', '2023-02-27 10:11:34.000000', 'article_image/fdb.jpg', 'bhml', 'author_avatar/avatar2_9ZHN6bs.png', 'NBA记者', 2);
INSERT INTO `newswebsite_article` VALUES (5, '阿里确定淘宝2023年五大战略，价格力在今年会更被重视', '阿里确定淘宝2023年五大战略，价格力在今年会更被重视', '阿里巴巴', '《晚点 LatePost》独家获悉，阿里的管理层们近期确定了淘宝今年的五大战略，分别是直播、私域、内容化、本地零售和价格力。阿里的员工们在内部将它们称为五大战役。\r\n\r\n目前，这五个战略如何展开在核心管理层已经有了初步方案，但尚未最终确认。多位阿里员工表示，只知道有这五个战役，但他们都不清楚具体策略。\r\n\r\n此外，《晚点 LatePost》还获悉，淘宝内部已经明确指出，今年相比 GMV 增长，更重要的指标是 DAU 增长。根据 QuestMobile 的数据，过去一年（2022 年 2 月 - 2023 年 1 月），拼多多 App 的月均日活跃用户数已经稳定超过了手淘 App。\r\n\r\n不过，对阿里来说，今天要关心的早已不是一个简单的数据指标，而是如何维持技术、商业机制和经营管理的先进性。\r\n\r\n三年前，阿里是电商领域的绝对第一，如今这家公司的处境已经大不相同 —— 它的竞争对手环伺，看上去比它更有战斗力和野心，而它自己各方面的增速都在放缓甚至减少。\r\n\r\n阿里巴巴董事局主席兼 CEO 张勇在去年底的组织调整中说阿里要从 “定” 到 “进”，在内部，他还会强调要从 “守” 到 “进”。\r\n\r\n今年阿里、京东都在以更激进的姿态来迎战更年轻的竞争对手，它们不再通过打造一个新产品（淘特、京喜）来局部反击竞争对手，而是选择用主站正面迎敌。\r\n\r\n从三年前的绝对第一，到如今的对手环伺\r\n\r\n2019 年 11 月 15 日，阿里巴巴第二次赴港上市，张勇发了自己就任集团董事局主席后的第一封致股东信，他描述了 20 岁阿里的新起点，和升级后的愿景 —— 阿里要成为一家活 102 年的 “好” 公司。\r\n\r\n那一年全年，拼多多 GMV（商品成交额）刚到 1 万亿元，不过是阿里中国零售 GMV 的 15%。当时抖音则是阿里的合作伙伴，为淘宝带去客流。\r\n\r\n到了 2022 年 7 月，张勇在致股东信中说，面对巨大的不确定性，阿里 “必须比这个时代变化得更快”。\r\n\r\n三年新冠疫情让大量消费转移到线上，也让后来者有了赶超的机会。\r\n\r\n根据《晚点 LatePost》从分析师和相关公司内部获得的测算数据，拼多多 2022 年 GMV 超过 3 万亿元、抖音电商 GMV 接近 1.5 万亿元。两家公司的 GMV 已经相当于阿里国内电商业务的 50% 以上。\r\n\r\n根据 QuestMobile 的数据，2021 年 2 月 12 日，大年初一，拼多多 App 的日活跃用户数首次超越手淘 App（不过只持续了两天）—— 拼多多 2.59 亿，手淘 2.37 亿。而在过去的一年里，拼多多的月均日活已经稳定超过了手淘，今年 1 月双方有大约 3000 万的差距。\r\n\r\n截至 2020 年底，拼多多年度活跃买家数 7.884 亿，首次超过同期阿里在中国零售市场的 7.79 亿。不过，2021 年全年，拼多多（8.69 亿）又被阿里反超（8.82 亿）。\r\n\r\n同时，由于抖音电商的持续增长，2022 年一季度，字节跳动的广告收入超过阿里成为中国第一。\r\n\r\n年轻的竞争对手们正在快速长大，对于阿里来说，更严峻的是，它最核心的收入来源 —— 以淘宝、天猫为主的国内电商广告和佣金收入已经持续下滑 —— 去年四季度这部分收入减少 9%，再往前两个季度，降幅分别是 6.5% 和 10%。\r\n\r\n阿里习惯给自己的各个业务都设计一个动物形象。过去很多年，在阿里的动物园里，始终是靠淘宝和天猫赚来的钱，养着一群亏损的小动物们，现在当这个支柱带来的收入开始变少，减亏成了其他业务单元最重要的事情，在阿里 2021 年开始推行经营责任制的背景下，它们还要尽快学会自力更生。\r\n\r\n随着物流、支付等各种基础设施的普及，有流量的公司就可以做电商。对商家来说，多平台经营已经是事实，张勇曾在上季度电话会上表示，阿里这个平台的最大门槛是已经形成帮助商家持续经营的方法论，不过这本就是阿里一直以来都在做且最擅长的地方。\r\n\r\n从 “守” 到 “进”，对于阿里这家曾经擅长作战、喜欢打仗的公司，“守” 并不是它的常态，但受制于疫情、监管、自身发展阶段等因素，去年一年，阿里都在对内积极调整，强调用户体验；到 2023 年，随着五大战略的明确，阿里终于有机会主动进攻，去打破这种状态了。\r\n\r\n“进” 是什么意思？据多位阿里员工的转述，张勇在公司内部向大家解释，阿里的所有业务所在的战场都是高度市场化的，面临高强度的竞争，“进” 是一种常态，静止不动就意味着退，“我们别无选择，只有往前进。”\r\n\r\n到最后，张勇说，“股价 300 美元的时候，我们知道自己远非完美，最低跌到 60 多美元时，我们也不是一无是处。”\r\n\r\n价格力不是新词，但在今年会更被重视\r\n\r\n2022 年，淘宝天猫的主要经营方向是 “从交易走向消费”，阿里在 2023 年的工作重点将依然延续该方向，进一步提高淘宝天猫的用户体验和客户价值，主要包括三个方面：\r\n\r\n加强用户黏性和时长，提供消费的丰富度，直播、私域、内容化三个战略都是其中的手段；\r\n\r\n提升商品性价比，包括市场机制的设计、各类营销产品，淘特农产品、工厂货直达消费者的业务模式突破，今年新提出的价格力战略将聚焦于此；\r\n\r\n本地零售战略，通过本地供给和本地物流履约，配合淘鲜达、淘菜菜等去做高频刚需、日用品必需品的即时需求。\r\n\r\n《晚点 LatePost》获悉，“价格力” 将由邹衍负责执行。邹衍此前在淘特担任产品负责人，今年 2 月，他被调任至大淘宝的平台发展中心，向该中心负责人王明强汇报。一位了解情况的阿里人士称，邹衍的角色类似于 “价格力” 这个战役的 PM（项目经理），一方面负责输入此前淘特积累的低价供给和服务下沉人群的做法，另一方面负责对接大淘宝的各个业务中心。\r\n\r\n某种程度上，“价格力” 战略也是当前竞争的产物。可以确定的是，围绕价格的战役将是 2023 年电商平台之间竞争的重点。\r\n\r\n2016 年前后，摆在阿里电商面前的有两条路，消费升级和下沉市场，阿里选择了前者。过去几年，拼多多快速崛起，阿里意识到了威胁，用淘特这个业务来主攻下沉市场，试图从局部业务来反击拼多多，但并没有遏制住拼多多的长大。现在，阿里对内把 “价格力” 列为今年的五大战略之一，试图用性价比贯彻整个平台，用主站淘宝 App 来迎战。\r\n\r\n同样面临年轻对手威胁、收入增长放缓的京东正在全力备战，去年 11 月京东集团董事局主席刘强东强势回归后，京东零售内部在今年初确定了要集中力量推行低价战略的共识。\r\n\r\n最近的一个动作就是上线 “百亿补贴” 频道，直接对标拼多多，范围将覆盖全品类，自营和第三方商家都将参与其中，如果用户发现京东百亿补贴的商品价格高于外网，可获得双倍赔付。\r\n\r\n低价是刘强东过去多年一直强调的事情，在他眼里，低价是 “京东过去成功最重要的武器，以后也是唯一基础性武器”。\r\n\r\n刘强东把零售业务的客户体验分成 “价格、品质和服务” 三大要素，品质和服务毫无疑问是京东的核心竞争力，但刘强东在内部直言，京东已经让一些消费者有了越来越贵的印象，他认为品质和服务是两个 “0”，低价才是那个 “1”，失去了低价优势，其它一切所谓的竞争优势都会归零。\r\n\r\n相比京东直截了当的低价，一位阿里人士称，他们所说的 “价格力” 指的不是简单低价，而是高品质下的好的性价比。\r\n\r\n这种观点在刚刚过去的 2022 年四季度电话会上也得到了印证，张勇被问及如何看待同行的低价补贴竞争，他赞同价格是十分重要的客户体验，但张勇认为纵观历史，仅通过低价补贴和低水平竞争无法改变局面，“只有技术和商业机制创新，才能真正让商家把最好的商品和价格给到消费者，形成正循环。”\r\n\r\n价格力、直播、私域、内容化、本地零售 —— 都不是阿里内部的新词了。而在被确定为大淘宝的五大战略之后，它们在今年将会以更积极的姿态做出更多改变。\r\n\r\n2021 年在程道放接手淘宝直播后，这一业务进入战略防守期，重心放在了建设更有保障的商品池上，这也为第二年主播和机构们选择淘宝直播增加了一个重要筹码。\r\n\r\n淘宝直播是整个淘系在 2022 年增长最快的业务之一。去年双十一前夕，淘宝直播先后从抖音手里抢来了交个朋友、遥望、无忧传媒、东方甄选等抖音上的头部 MCN 机构，这被内部视为阿里在去年面向对手为数不多的一场漂亮的反击战。\r\n\r\n早在 2020 年底，淘宝 App 进行了一次产品大改版，最主要的变化之一就是将商家私域的重要阵地 “微淘” 升级为 “订阅”，成为帮助商家把私域和公域流量串联起来的枢纽，“订阅” 与 “推荐” 并列组成淘宝首页的两大频道，左右滑屏即可切换。\r\n\r\n淘宝的公域流量集中在首页的 “推荐” 页，由平台掌控流量分配，根据用户平时的点击行为进行个性化推荐；相对的，私域指商家在淘宝里可以自己控制流量的地方，包括 “订阅” 页、店铺和详情页、群聊等，都是商家运营粉丝和会员的重要阵地。\r\n\r\n《晚点 LatePost》了解到，阿里目前正在进行天猫旗舰店的升级尝试，目前仍在讨论当中，大方向是改变过去以货架为主的单一店铺形态，旗舰店作为商家私域的重要阵地，品牌会员的建设将是此次升级的一个重点。\r\n\r\n而 2022 年戴珊上任中国数字商业板块大总裁后，她就把内容化战略摆在了重要位置。\r\n\r\n去年 2 月，大淘宝成立了专门的内容化小组，成员由副总裁级别的各业务负责人组成。整个 2022 年，大淘宝在内容上进行了各种尝试，包括首页增加短视频比重、搜索结果呈现短视频内容、行业运营与淘宝直播合作引入具有内容能力的达人等。\r\n\r\n今年 “内容化” 继续被列为战略重点之一，大淘宝产品相关的业务部门也在同期调整了组织架构，比如 “逛逛” 与首页推荐业务合并，由一人统一把控。未来更多原来在 “逛逛” 频道的内容会出现在首页信息流中。\r\n\r\n“本地零售” 也不是一个陌生的词。2020 年 5 月，我们就报道过阿里内部正高度关注以 “天猫超市 + 淘鲜达 + 盒马” 为首的同城零售战场。如今，因为更完善的仓储建设和更大规模的配送团队，原本以配送时效划分的同城零售和本地零售，界限已经越来越模糊。\r\n\r\n疫情让人们意识到一座城市里本地即时配送商品的重要性，受益于此，《晚点 LatePost》了解到，美团闪购业务在 2022 年超进度达成了 GMV 目标。\r\n\r\n这也引发了阿里内部的反思。一位阿里人士向我们转述，过去阿里的主体业务是 “空中一张网，销售无边界”，通过疫情，阿里深刻意识到了互联网没有边界，但骑手和电动车（的配送距离）有边界，“我们要抓住这些动态的东西，很多领域不是阿里已经做好了，而是连碰都没碰。”\r\n\r\n这家依然是中国电商市场的最大公司，可能的机会在于如何提高不同消费品类的渗透，创造新的消费主题，人口结构变化后关注过去没有服务好的银发人群，张勇也曾在内部向员工们表示，这些问题比 GMV、用户份额更重要。\r\n\r\n在上个月的 “老逍果汁会” 上 —— 张勇和阿里员工的面对面问答活动 —— 他强调，整个阿里平台是一个复杂的经济系统。\r\n\r\n“今天迫切需要在顶层用庖丁解牛的方法，找到根源，系统性地解题，而不是说只用一个指标，如果只是讨论这个层面的问题，永远解不了题。” 张勇说。\r\n\r\n而如何解题，24 万阿里人和市场都已经等待多时。', '2023-02-27 14:10:35.000000', 'article_image/alibaba.jpg', 'bhml2', 'author_avatar/avatar4.png', 'bhml2', 1);
INSERT INTO `newswebsite_article` VALUES (6, '汤神32分勇士末节逆转森林狼 3连发球失误险葬送胜局', '汤神32分勇士末节逆转森林狼 3连发球失误险葬送胜局', '勇士，汤普森', 'NBA常规赛继续进行，金州勇士队（31胜30负）延续胜势。汤普森得到32分，迪文琴佐得到21分和8个篮板，他们率队第四节发力打出一波20-3高潮完成逆转，最终勇士队在主场以109-104战胜明尼苏达森林狼队（31胜32负）。勇士队拿到2连胜，森林狼队遭遇3连败。勇士最后时刻接连3次发球失误，险些葬送胜利。\r\n\r\n勇士队的汤普森得到32分、5个篮板和4次助攻，迪文琴佐得到21分、8个篮板和5次助攻，普尔得到15分和4次助攻，库明加得到13分和5个篮板，卢尼得到12分和17个篮板。森林狼队的里德得到30分和9个篮板，安德森得到12分、9个篮板和5次助攻，爱德华兹19投5中，得到12分、5个篮板和7次助攻，麦克丹尼尔斯得到12分，沃克得到10分和4个篮板。\r\n\r\n勇士队的格林再次休战。森林狼队开赛后反客为主，先拿7分领跑。勇士队还击4分，里德连得7分，森林狼队以14-4领先。卢尼打3分暂时止血，森林狼队又得6分扩大优势。汤普森追回5分，里德三分还击，普尔跳投命中，格林三分中的，他们率队连追9分，首节还有3分20秒时勇士队以22-26落后。里德和麦克劳夫林各中三分稳住局面，勇士队又追3分，沃克转身跳投命中，首节结束时森林狼队以34-25领先9分。\r\n\r\n第二节开始后两队各得几分，迪文琴佐和卢尼拿下4分，勇士队把差距缩小到5分。康利三分还击稳住领先位置，普尔和迪文琴佐联手5分，勇士队在半场前4分55秒时以43-46落后。之后双方交替得分，加扎两罚全中，半场前1分20秒时森林狼队以57-52领先。库明加篮下打进，汤普森保持手感又拿5分，勇士队连得7分结束第二节，他们以59-57反超2分进入半场休息。\r\n\r\n勇士队的汤普森上半场得到12分，迪文琴佐得到11分，卢尼得到10分和8个篮板，普尔得到10分；森林狼队的里德得到22分和7个篮板。\r\n\r\n第三节开始后两队拉锯几个回合，安德森和康利各中三分，森林狼队以71-67重新领跑。库明加跳投还击，麦克丹尼尔斯三分回应，汤普森连取5分，勇士队以74-76落后。之后双方又各得几分，沃克底角投中三分，森林狼队以87-78领先9分结束第三节。\r\n\r\n里弗斯用三分球揭开第四节大幕，鲍德温投中三分率队连追6分，里弗斯回敬三分，森林狼队以94-84领先10分。迪文琴佐突然爆发，独取7分，汤普森也贡献5分，他们联手打出12-2的反击高潮，第四节还有4分45秒时勇士队追成96平。99平后迪文琴佐和汤普森各中三分，他们率队连得8分拉开领跑。\r\n\r\n爱德华兹三分中的，兰姆发球失误，安德森扣篮得手，森林狼队追至104-107。勇士队请求暂停，汤普森被康利抢断，麦克劳夫林错失扳平三分，兰姆拿到篮板，第四节还有8.7秒时勇士队请求暂停。迪文琴佐险些被抢断，裁判吹了争球，迪文琴佐把球拨给汤普森，森林狼队只能选择犯规战术，普尔两罚全中，勇士队领先5分。里德三分不中，森林狼队以104-109落败。\r\n\r\n森林狼队首发阵容：康利、爱德华兹、麦克丹尼尔斯、安德森、里德\r\n\r\n勇士队首发阵容：普尔、迪文琴佐、汤普森、库明加、卢尼', '2023-02-27 14:45:17.000000', 'article_image/tom.jpg', 'bhml', 'author_avatar/avatar1.png', 'NBA记者', 2);
INSERT INTO `newswebsite_article` VALUES (7, '一周年！去年世界最大运输机安-225被摧毁', '一周年！去年世界最大运输机安-225被摧毁', '军事，运输机', '去年的2月27日，在俄乌冲突爆发的第三天，由乌克兰安东诺夫公司运营的，全球仅有一架的超级运输机安-225“梦想”，在战火中被摧毁。安-225的离去，象征着一个大国曾经光荣与梦想的终结，也代表了一个紧张、对峙、却也充满了人类智慧、充满了理想主义、星辰大海的时代的结束。', '2023-02-28 15:06:44.000000', 'article_image/jinshi1.jpg', '战地记者', 'author_avatar/avatar3.png', '军事类记者', 3);

-- ----------------------------
-- Table structure for newswebsite_best
-- ----------------------------
DROP TABLE IF EXISTS `newswebsite_best`;
CREATE TABLE `newswebsite_best`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `select_reason` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `select_article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `newswebsite_best_select_article_id_fc125519_fk_newswebsi`(`select_article_id`) USING BTREE,
  CONSTRAINT `newswebsite_best_select_article_id_fc125519_fk_newswebsi` FOREIGN KEY (`select_article_id`) REFERENCES `newswebsite_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newswebsite_best
-- ----------------------------
INSERT INTO `newswebsite_best` VALUES (2, '今日热闻', 3);
INSERT INTO `newswebsite_best` VALUES (3, '首页推荐', 4);
INSERT INTO `newswebsite_best` VALUES (4, '小编推荐', 5);
INSERT INTO `newswebsite_best` VALUES (5, '小编推荐', 6);
INSERT INTO `newswebsite_best` VALUES (6, '首页推荐', 7);

-- ----------------------------
-- Table structure for newswebsite_category
-- ----------------------------
DROP TABLE IF EXISTS `newswebsite_category`;
CREATE TABLE `newswebsite_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newswebsite_category
-- ----------------------------
INSERT INTO `newswebsite_category` VALUES (1, '热点新闻');
INSERT INTO `newswebsite_category` VALUES (2, 'NBA');
INSERT INTO `newswebsite_category` VALUES (3, '军事');
INSERT INTO `newswebsite_category` VALUES (4, '社会');

-- ----------------------------
-- Table structure for newswebsite_comment
-- ----------------------------
DROP TABLE IF EXISTS `newswebsite_comment`;
CREATE TABLE `newswebsite_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `words` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `belong_article_id` int(11) NOT NULL,
  `belong_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `newswebsite_comment_belong_article_id_5316f321_fk_newswebsi`(`belong_article_id`) USING BTREE,
  INDEX `newswebsite_comment_belong_user_id_4f825a3a_fk_auth_user_id`(`belong_user_id`) USING BTREE,
  CONSTRAINT `newswebsite_comment_belong_article_id_5316f321_fk_newswebsi` FOREIGN KEY (`belong_article_id`) REFERENCES `newswebsite_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `newswebsite_comment_belong_user_id_4f825a3a_fk_auth_user_id` FOREIGN KEY (`belong_user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newswebsite_comment
-- ----------------------------
INSERT INTO `newswebsite_comment` VALUES (2, '利拉德yyds,利拉德时间', '2023-02-28 15:02:41.576767', 3, 3);
INSERT INTO `newswebsite_comment` VALUES (3, '湖人总冠军！', '2023-02-28 16:08:09.682070', 4, 3);

-- ----------------------------
-- Table structure for newswebsite_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `newswebsite_userprofile`;
CREATE TABLE `newswebsite_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `belong_to_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `belong_to_id`(`belong_to_id`) USING BTREE,
  CONSTRAINT `newswebsite_userprofile_belong_to_id_36959b58_fk_auth_user_id` FOREIGN KEY (`belong_to_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newswebsite_userprofile
-- ----------------------------
INSERT INTO `newswebsite_userprofile` VALUES (1, 'avatar/avatar5.png', 1);
INSERT INTO `newswebsite_userprofile` VALUES (2, 'avatar/avatar2.png', 2);
INSERT INTO `newswebsite_userprofile` VALUES (3, 'avatar/avatar4.png', 3);

SET FOREIGN_KEY_CHECKS = 1;
