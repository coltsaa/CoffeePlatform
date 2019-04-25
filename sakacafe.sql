/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : sakacafe

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-04-25 12:40:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add crontab', '6', 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES ('17', 'Can change crontab', '6', 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete crontab', '6', 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES ('19', 'Can add interval', '7', 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES ('20', 'Can change interval', '7', 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete interval', '7', 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES ('22', 'Can add periodic task', '8', 'add_periodictask');
INSERT INTO `auth_permission` VALUES ('23', 'Can change periodic task', '8', 'change_periodictask');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete periodic task', '8', 'delete_periodictask');
INSERT INTO `auth_permission` VALUES ('25', 'Can add periodic tasks', '9', 'add_periodictasks');
INSERT INTO `auth_permission` VALUES ('26', 'Can change periodic tasks', '9', 'change_periodictasks');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete periodic tasks', '9', 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES ('28', 'Can add task state', '10', 'add_taskmeta');
INSERT INTO `auth_permission` VALUES ('29', 'Can change task state', '10', 'change_taskmeta');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete task state', '10', 'delete_taskmeta');
INSERT INTO `auth_permission` VALUES ('31', 'Can add saved group result', '11', 'add_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('32', 'Can change saved group result', '11', 'change_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete saved group result', '11', 'delete_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('34', 'Can add task', '12', 'add_taskstate');
INSERT INTO `auth_permission` VALUES ('35', 'Can change task', '12', 'change_taskstate');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete task', '12', 'delete_taskstate');
INSERT INTO `auth_permission` VALUES ('37', 'Can add worker', '13', 'add_workerstate');
INSERT INTO `auth_permission` VALUES ('38', 'Can change worker', '13', 'change_workerstate');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete worker', '13', 'delete_workerstate');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 用户', '14', 'add_user');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 用户', '14', 'change_user');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 用户', '14', 'delete_user');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 地址', '15', 'add_address');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 地址', '15', 'change_address');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 地址', '15', 'delete_address');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 商品SPU', '16', 'add_goods');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 商品SPU', '16', 'change_goods');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 商品SPU', '16', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 商品图片', '17', 'add_goodsimage');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 商品图片', '17', 'change_goodsimage');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 商品图片', '17', 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 商品', '18', 'add_goodssku');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 商品', '18', 'change_goodssku');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 商品', '18', 'delete_goodssku');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 商品种类', '19', 'add_goodstype');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 商品种类', '19', 'change_goodstype');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 商品种类', '19', 'delete_goodstype');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 首页轮播商品', '20', 'add_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 首页轮播商品', '20', 'change_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 首页轮播商品', '20', 'delete_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 主页促销活动', '21', 'add_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 主页促销活动', '21', 'change_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 主页促销活动', '21', 'delete_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('64', 'Can add 主页分类展示商品', '22', 'add_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('65', 'Can change 主页分类展示商品', '22', 'change_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete 主页分类展示商品', '22', 'delete_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('67', 'Can add 订单商品', '23', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('68', 'Can change 订单商品', '23', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete 订单商品', '23', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('70', 'Can add 订单', '24', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('71', 'Can change 订单', '24', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete 订单', '24', 'delete_orderinfo');

-- ----------------------------
-- Table structure for `celery_taskmeta`
-- ----------------------------
DROP TABLE IF EXISTS `celery_taskmeta`;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_hidden_23fd02dc` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_taskmeta
-- ----------------------------

-- ----------------------------
-- Table structure for `celery_tasksetmeta`
-- ----------------------------
DROP TABLE IF EXISTS `celery_tasksetmeta`;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_hidden_593cfc24` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_tasksetmeta
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_sk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_sk_user_id` FOREIGN KEY (`user_id`) REFERENCES `sk_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-04-07 10:32:13.421910', '3', '浓缩咖啡', '1', '[{\"added\": {}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('2', '2019-04-07 10:33:06.941826', '4', '美式咖啡', '1', '[{\"added\": {}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('3', '2019-04-07 11:02:07.142318', '3', '浓缩咖啡', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('4', '2019-04-07 11:02:19.771734', '4', '美式咖啡', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('5', '2019-04-07 11:02:58.094895', '4', '美式咖啡', '2', '[]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('6', '2019-04-07 11:03:18.891277', '5', '拿铁', '1', '[{\"added\": {}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('7', '2019-04-07 11:03:36.247893', '6', '卡布奇诺', '1', '[{\"added\": {}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('8', '2019-04-07 11:03:49.928159', '7', '摩卡', '1', '[{\"added\": {}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('9', '2019-04-07 11:04:06.259765', '8', '玛琪朵', '1', '[{\"added\": {}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('10', '2019-04-07 13:08:01.962223', '1', 'Goods object', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('11', '2019-04-07 13:12:01.992212', '1', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('12', '2019-04-07 13:12:28.356477', '2', 'Goods object', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('13', '2019-04-07 13:13:32.332310', '3', 'Goods object', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('14', '2019-04-07 13:13:57.962123', '4', 'Goods object', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('15', '2019-04-07 13:14:35.128897', '5', 'Goods object', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('16', '2019-04-07 13:15:02.483440', '3', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('17', '2019-04-07 13:15:30.179928', '2', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('18', '2019-04-07 13:15:48.795980', '3', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('19', '2019-04-07 13:16:22.146942', '6', 'Goods object', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('20', '2019-04-11 13:08:05.693850', '1', 'IndexPromotionBanner object', '1', '[{\"added\": {}}]', '21', '3');
INSERT INTO `django_admin_log` VALUES ('21', '2019-04-11 13:09:14.431301', '2', 'IndexPromotionBanner object', '1', '[{\"added\": {}}]', '21', '3');
INSERT INTO `django_admin_log` VALUES ('22', '2019-04-11 13:29:26.441032', '2', 'IndexPromotionBanner object', '2', '[]', '21', '3');
INSERT INTO `django_admin_log` VALUES ('23', '2019-04-11 13:31:43.438261', '2', 'IndexPromotionBanner object', '3', '', '21', '3');
INSERT INTO `django_admin_log` VALUES ('24', '2019-04-11 13:31:43.577268', '1', 'IndexPromotionBanner object', '3', '', '21', '3');
INSERT INTO `django_admin_log` VALUES ('25', '2019-04-11 13:32:15.594007', '3', 'IndexPromotionBanner object', '1', '[{\"added\": {}}]', '21', '3');
INSERT INTO `django_admin_log` VALUES ('26', '2019-04-11 13:33:11.954796', '4', 'IndexPromotionBanner object', '1', '[{\"added\": {}}]', '21', '3');
INSERT INTO `django_admin_log` VALUES ('27', '2019-04-11 13:45:11.558666', '2', 'IndexPromotionBanner object', '3', '', '21', '3');
INSERT INTO `django_admin_log` VALUES ('28', '2019-04-11 13:45:11.779322', '1', 'IndexPromotionBanner object', '3', '', '21', '3');
INSERT INTO `django_admin_log` VALUES ('29', '2019-04-11 13:45:46.667586', '5', 'IndexPromotionBanner object', '1', '[{\"added\": {}}]', '21', '3');
INSERT INTO `django_admin_log` VALUES ('30', '2019-04-11 13:46:10.566390', '6', 'IndexPromotionBanner object', '1', '[{\"added\": {}}]', '21', '3');
INSERT INTO `django_admin_log` VALUES ('31', '2019-04-11 13:56:00.496979', '1', '浓缩咖啡', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('32', '2019-04-11 13:56:39.135636', '2', '美式咖啡', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('33', '2019-04-11 13:56:53.509295', '3', '拿铁', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('34', '2019-04-11 13:57:03.431582', '4', '卡布奇诺', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('35', '2019-04-11 13:57:14.225167', '5', '摩卡', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('36', '2019-04-11 13:57:41.026408', '6', '玛琪朵', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '19', '3');
INSERT INTO `django_admin_log` VALUES ('37', '2019-04-11 16:49:09.580146', '1', 'IndexGoodsBanner object', '1', '[{\"added\": {}}]', '20', '3');
INSERT INTO `django_admin_log` VALUES ('38', '2019-04-11 16:49:22.536923', '2', 'IndexGoodsBanner object', '1', '[{\"added\": {}}]', '20', '3');
INSERT INTO `django_admin_log` VALUES ('39', '2019-04-11 16:49:36.108501', '3', 'IndexGoodsBanner object', '1', '[{\"added\": {}}]', '20', '3');
INSERT INTO `django_admin_log` VALUES ('40', '2019-04-11 16:49:47.815618', '4', 'IndexGoodsBanner object', '1', '[{\"added\": {}}]', '20', '3');
INSERT INTO `django_admin_log` VALUES ('41', '2019-04-11 17:00:46.395928', '6', 'Goods object', '3', '', '16', '3');
INSERT INTO `django_admin_log` VALUES ('42', '2019-04-11 17:00:46.484493', '5', 'Goods object', '3', '', '16', '3');
INSERT INTO `django_admin_log` VALUES ('43', '2019-04-11 17:00:46.658613', '4', 'Goods object', '3', '', '16', '3');
INSERT INTO `django_admin_log` VALUES ('44', '2019-04-11 17:00:46.713729', '3', 'Goods object', '3', '', '16', '3');
INSERT INTO `django_admin_log` VALUES ('45', '2019-04-11 17:00:46.769841', '2', 'Goods object', '3', '', '16', '3');
INSERT INTO `django_admin_log` VALUES ('46', '2019-04-11 17:00:46.825038', '1', 'Goods object', '3', '', '16', '3');
INSERT INTO `django_admin_log` VALUES ('47', '2019-04-11 17:20:35.471072', '1', '意式特浓', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('48', '2019-04-11 17:35:17.240473', '4', '0', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('49', '2019-04-11 17:40:57.863131', '4', '0', '3', '', '22', '3');
INSERT INTO `django_admin_log` VALUES ('50', '2019-04-11 17:41:29.292161', '1', '意式特浓', '3', '', '18', '3');
INSERT INTO `django_admin_log` VALUES ('51', '2019-04-11 17:52:34.203416', '1', '浓缩咖啡', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('52', '2019-04-11 17:53:08.838215', '2', '美式咖啡', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('53', '2019-04-11 17:53:37.780184', '3', '拿铁', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('54', '2019-04-11 17:53:55.534168', '4', '卡布奇诺', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('55', '2019-04-11 17:54:13.221079', '5', '摩卡', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('56', '2019-04-11 17:54:33.501574', '6', '玛琪朵', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('57', '2019-04-11 18:02:52.276220', '1', '浓缩咖啡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('58', '2019-04-11 18:03:01.101527', '2', '美式咖啡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('59', '2019-04-11 18:03:10.312194', '3', '拿铁-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('60', '2019-04-11 18:03:18.597478', '4', '卡布奇诺-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('61', '2019-04-11 18:03:26.760935', '5', '摩卡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('62', '2019-04-11 18:03:44.006689', '6', '玛琪朵-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('63', '2019-04-11 18:04:32.078495', '1', '浓缩咖啡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('64', '2019-04-11 18:04:44.856214', '2', '美式咖啡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('65', '2019-04-11 18:04:54.667023', '3', '拿铁-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('66', '2019-04-11 18:05:04.603404', '4', '卡布奇诺-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('67', '2019-04-11 18:05:15.653544', '5', '摩卡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('68', '2019-04-11 18:05:25.113233', '6', '玛琪朵-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('69', '2019-04-11 18:05:38.293111', '5', '摩卡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('70', '2019-04-11 18:05:44.103997', '4', '卡布奇诺-品触咖啡', '2', '[]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('71', '2019-04-11 18:05:49.071438', '6', '玛琪朵-品触咖啡', '2', '[]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('72', '2019-04-11 18:05:57.270648', '5', '摩卡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('73', '2019-04-11 18:06:01.949325', '3', '拿铁-品触咖啡', '2', '[]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('74', '2019-04-11 18:07:31.717524', '2', '意式特浓', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('75', '2019-04-11 18:08:39.083768', '5', '0', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('76', '2019-04-12 03:20:20.797341', '3', '美式(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('77', '2019-04-12 03:20:44.411285', '6', '0', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('78', '2019-04-12 03:41:25.772310', '4', '美式(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('79', '2019-04-12 03:41:50.284385', '7', '1', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('80', '2019-04-12 11:51:32.800607', '5', '卡布奇诺(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('81', '2019-04-12 11:51:52.152203', '8', '0', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('82', '2019-04-12 11:54:03.468343', '6', '卡布奇诺(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('83', '2019-04-12 11:54:36.572114', '9', '1', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('84', '2019-04-12 11:55:05.362412', '9', '1', '2', '[]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('85', '2019-04-12 12:01:03.084479', '7', '提拉米苏拿铁(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('86', '2019-04-12 12:02:16.800404', '8', '提拉米苏拿铁(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('87', '2019-04-12 12:02:30.262995', '10', '0', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('88', '2019-04-12 12:02:40.989574', '11', '1', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('89', '2019-04-12 12:05:31.704770', '9', '焦糖玛琪朵(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('90', '2019-04-12 12:06:37.484188', '10', '焦糖玛琪朵(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('91', '2019-04-12 12:06:53.750871', '12', '0', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('92', '2019-04-12 12:07:06.318786', '13', '1', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('93', '2019-04-12 12:57:26.825702', '11', '摩卡(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('94', '2019-04-12 12:58:09.306443', '12', '摩卡(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('95', '2019-04-12 12:58:21.637438', '14', '0', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('96', '2019-04-12 12:58:32.662803', '15', '1', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('97', '2019-04-12 13:00:50.215470', '13', '白巧克力摩卡(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('98', '2019-04-12 13:02:09.975861', '14', '白巧克力摩卡(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('99', '2019-04-12 13:05:56.678802', '17', '白巧克力摩卡(热)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('100', '2019-04-12 13:06:12.758391', '18', '白巧克力摩卡(冰)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('101', '2019-04-12 13:11:27.032321', '15', '巧克力曲奇摩卡(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('102', '2019-04-12 13:12:33.816068', '16', '巧克力曲奇摩卡(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('103', '2019-04-12 13:39:41.306354', '17', '拿铁(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('104', '2019-04-12 13:48:08.366131', '18', '拿铁(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('105', '2019-04-12 13:49:48.407685', '19', '香草拿铁(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('106', '2019-04-12 13:50:32.020747', '20', '香草拿铁(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('107', '2019-04-12 13:50:59.899183', '19', '香草拿铁(热)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('108', '2019-04-12 13:51:16.198286', '20', '香草拿铁(冰)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('109', '2019-04-12 13:51:32.787833', '20', '香草拿铁(冰)', '2', '[{\"changed\": {\"fields\": [\"display_type\"]}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('110', '2019-04-12 13:58:23.792755', '7', '浓缩咖啡-第三渡口', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('111', '2019-04-12 13:58:46.779406', '7', '浓缩咖啡-第三渡口', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('112', '2019-04-12 14:00:14.475066', '1', '浓缩咖啡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('113', '2019-04-12 14:00:42.262580', '1', '浓缩咖啡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('114', '2019-04-12 14:00:55.887105', '2', '美式咖啡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('115', '2019-04-12 14:01:05.183750', '3', '拿铁-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('116', '2019-04-12 14:01:18.900528', '4', '卡布奇诺-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('117', '2019-04-12 14:01:27.823539', '5', '摩卡-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('118', '2019-04-12 14:01:37.949732', '6', '玛琪朵-品触咖啡', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('119', '2019-04-12 14:02:02.730286', '7', '浓缩咖啡-第三渡口', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('120', '2019-04-12 14:04:42.356236', '8', '美式咖啡-第三渡口', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('121', '2019-04-12 14:10:54.756200', '9', '拿铁-第三渡口', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('122', '2019-04-12 14:27:44.667302', '10', '卡布奇诺-第三渡口', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('123', '2019-04-12 14:35:23.797369', '11', '摩卡-第三渡口', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('124', '2019-04-12 14:35:32.284132', '10', '卡布奇诺-第三渡口', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('125', '2019-04-12 14:35:41.849531', '9', '拿铁-第三渡口', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('126', '2019-04-12 14:35:48.124592', '7', '浓缩咖啡-第三渡口', '2', '[]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('127', '2019-04-12 14:35:56.068823', '8', '美式咖啡-第三渡口', '2', '[]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('128', '2019-04-12 14:36:01.071513', '9', '拿铁-第三渡口', '2', '[]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('129', '2019-04-12 14:36:05.757345', '10', '卡布奇诺-第三渡口', '2', '[]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('130', '2019-04-12 14:37:49.707734', '12', '玛琪朵-第三渡口', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('131', '2019-04-12 15:18:37.934908', '21', '卡布奇诺(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('132', '2019-04-12 15:19:27.749927', '22', '卡布奇诺(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('133', '2019-04-12 15:19:55.779551', '21', '卡布奇诺(热)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('134', '2019-04-12 15:20:09.857760', '22', '卡布奇诺(冰)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('135', '2019-04-12 15:33:19.337825', '23', '美式咖啡(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('136', '2019-04-12 15:34:27.353028', '24', '美式咖啡(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('137', '2019-04-12 15:34:42.050978', '23', '美式咖啡(热)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('138', '2019-04-12 15:34:59.197493', '24', '美式咖啡(冰)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('139', '2019-04-12 15:59:01.560970', '25', '意式浓缩(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('140', '2019-04-12 15:59:18.431133', '25', '意式浓缩(热)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('141', '2019-04-12 16:03:58.076233', '13', '浓缩咖啡- Farmer Coffee', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('142', '2019-04-12 16:04:13.840172', '13', '浓缩咖啡-Farmer Coffee', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('143', '2019-04-12 16:04:36.701722', '13', '浓缩咖啡-Farmer Coffee', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('144', '2019-04-12 16:08:46.788223', '14', '玛琪朵-Farmer Coffee', '1', '[{\"added\": {}}]', '16', '3');
INSERT INTO `django_admin_log` VALUES ('145', '2019-04-12 16:11:09.521339', '26', '意式浓缩咖啡(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('146', '2019-04-12 16:11:58.718641', '27', '意式浓缩咖啡(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('147', '2019-04-12 16:12:24.329208', '26', '意式浓缩咖啡(热)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('148', '2019-04-12 16:12:45.259116', '27', '意式浓缩咖啡(冰)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('149', '2019-04-12 16:14:25.607100', '28', '焦糖玛琪朵(热)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('150', '2019-04-12 16:15:16.525541', '29', '焦糖玛琪朵(冰)', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('151', '2019-04-12 16:15:35.504645', '9', '焦糖玛琪朵(热)', '2', '[{\"changed\": {\"fields\": [\"sales\"]}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('152', '2019-04-12 16:16:03.045228', '28', '焦糖玛琪朵(热)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('153', '2019-04-12 16:16:16.663649', '29', '焦糖玛琪朵(冰)', '1', '[{\"added\": {}}]', '22', '3');
INSERT INTO `django_admin_log` VALUES ('154', '2019-04-15 06:38:19.051513', '30', '测试单品', '1', '[{\"added\": {}}]', '18', '3');
INSERT INTO `django_admin_log` VALUES ('155', '2019-04-15 06:43:49.980404', '30', '测试单品', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '18', '3');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'djcelery', 'crontabschedule');
INSERT INTO `django_content_type` VALUES ('7', 'djcelery', 'intervalschedule');
INSERT INTO `django_content_type` VALUES ('8', 'djcelery', 'periodictask');
INSERT INTO `django_content_type` VALUES ('9', 'djcelery', 'periodictasks');
INSERT INTO `django_content_type` VALUES ('10', 'djcelery', 'taskmeta');
INSERT INTO `django_content_type` VALUES ('11', 'djcelery', 'tasksetmeta');
INSERT INTO `django_content_type` VALUES ('12', 'djcelery', 'taskstate');
INSERT INTO `django_content_type` VALUES ('13', 'djcelery', 'workerstate');
INSERT INTO `django_content_type` VALUES ('16', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('17', 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES ('18', 'goods', 'goodssku');
INSERT INTO `django_content_type` VALUES ('19', 'goods', 'goodstype');
INSERT INTO `django_content_type` VALUES ('20', 'goods', 'indexgoodsbanner');
INSERT INTO `django_content_type` VALUES ('21', 'goods', 'indexpromotionbanner');
INSERT INTO `django_content_type` VALUES ('22', 'goods', 'indextypegoodsbanner');
INSERT INTO `django_content_type` VALUES ('23', 'order', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('24', 'order', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('15', 'user', 'address');
INSERT INTO `django_content_type` VALUES ('14', 'user', 'user');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-04-07 08:45:03.922079');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-04-07 08:45:05.869035');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-04-07 08:45:12.956612');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-04-07 08:45:14.164104');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-04-07 08:45:14.225817');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-04-07 08:45:14.292215');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-04-07 08:45:14.359486');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-04-07 08:45:14.420442');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-04-07 08:45:14.480091');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2019-04-07 08:45:14.547672');
INSERT INTO `django_migrations` VALUES ('11', 'user', '0001_initial', '2019-04-07 08:45:24.387805');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2019-04-07 08:45:28.687911');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2019-04-07 08:45:28.833473');
INSERT INTO `django_migrations` VALUES ('14', 'djcelery', '0001_initial', '2019-04-07 08:45:43.623408');
INSERT INTO `django_migrations` VALUES ('15', 'goods', '0001_initial', '2019-04-07 08:46:00.459162');
INSERT INTO `django_migrations` VALUES ('16', 'order', '0001_initial', '2019-04-07 08:46:02.042691');
INSERT INTO `django_migrations` VALUES ('17', 'order', '0002_auto_20190407_1644', '2019-04-07 08:46:12.381109');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2019-04-07 08:46:13.520391');
INSERT INTO `django_migrations` VALUES ('19', 'goods', '0002_remove_indexgoodsbanner_sku', '2019-04-11 16:46:38.628432');
INSERT INTO `django_migrations` VALUES ('20', 'goods', '0003_auto_20190412_0106', '2019-04-11 17:06:47.744428');
INSERT INTO `django_migrations` VALUES ('21', 'goods', '0004_auto_20190412_0147', '2019-04-11 17:47:32.847589');
INSERT INTO `django_migrations` VALUES ('22', 'goods', '0005_goodssku_goods', '2019-04-11 18:00:09.099429');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_crontabschedule`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_crontabschedule`;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_crontabschedule
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_intervalschedule`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_intervalschedule`;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_intervalschedule
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_periodictask`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictask`;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` (`crontab_id`),
  KEY `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` (`interval_id`),
  CONSTRAINT `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictask
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_periodictasks`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictasks`;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictasks
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_taskstate`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_taskstate`;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_state_53543be4` (`state`),
  KEY `djcelery_taskstate_name_8af9eded` (`name`),
  KEY `djcelery_taskstate_tstamp_4c3f93a1` (`tstamp`),
  KEY `djcelery_taskstate_hidden_c3905e57` (`hidden`),
  KEY `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_taskstate
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_workerstate`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_workerstate`;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_last_heartbeat_4539b544` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_workerstate
-- ----------------------------

-- ----------------------------
-- Table structure for `sk_address`
-- ----------------------------
DROP TABLE IF EXISTS `sk_address`;
CREATE TABLE `sk_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sk_address_user_id_bc5e47c1_fk_sk_user_id` (`user_id`),
  CONSTRAINT `sk_address_user_id_bc5e47c1_fk_sk_user_id` FOREIGN KEY (`user_id`) REFERENCES `sk_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_address
-- ----------------------------
INSERT INTO `sk_address` VALUES ('1', '2019-04-12 03:46:33.180535', '2019-04-12 03:46:33.180535', '0', '亮', '广东省', '13666666666', '1', '6');
INSERT INTO `sk_address` VALUES ('2', '2019-04-12 03:46:55.889258', '2019-04-12 03:46:55.889258', '0', '亮', '福建省', '13666666666', '0', '6');
INSERT INTO `sk_address` VALUES ('3', '2019-04-12 13:54:17.194170', '2019-04-12 13:54:17.194170', '0', '亮', '广东省', '13666666666', '1', '3');
INSERT INTO `sk_address` VALUES ('4', '2019-04-16 14:51:58.346650', '2019-04-16 14:51:58.347151', '0', '亮', '广州市', '13666666666', '0', '3');
INSERT INTO `sk_address` VALUES ('5', '2019-04-17 17:49:54.853705', '2019-04-17 17:49:54.853705', '0', '亮', '广州市', '11111111111', '1', '12');

-- ----------------------------
-- Table structure for `sk_goods`
-- ----------------------------
DROP TABLE IF EXISTS `sk_goods`;
CREATE TABLE `sk_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_goods
-- ----------------------------
INSERT INTO `sk_goods` VALUES ('1', '2019-04-11 17:52:33.972250', '2019-04-12 14:00:42.249070', '0', '浓缩咖啡-品触咖啡', '<p><strong><span style=\"font-size: 10px;\">品触咖啡音乐书屋（5.0）（堂食）</span></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span style=\"font-size: 10px;\">松江区鼓浪路550号一区一楼13-15号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Espresso</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">意式浓缩，是指将研磨得很细的咖啡粉，用高温热水及高压，在短时间内萃取出少量的咖啡液体。7-8g的咖啡粉，使用88-92℃的压力急速萃取出25-30毫升的浓缩咖啡。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">口味浓烈、余韵甘甜的意式浓缩被称为&rdquo;咖啡之魂&ldquo;，是最常见的咖啡类型的基础。一小杯Espresso（被称为一个shot），基本在25-30毫升。最好三口之内喝完。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">（意式浓缩）</span></p>\r\n<p>&nbsp;</p>');
INSERT INTO `sk_goods` VALUES ('2', '2019-04-11 17:53:08.825705', '2019-04-12 14:00:55.878576', '0', '美式咖啡-品触咖啡', '<p><strong><span style=\"font-size: 10px;\">品触咖啡音乐书屋（5.0）（堂食）</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"font-size: 10px;\">松江区鼓浪路550号一区一楼13-15号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Amweicano</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">1份Espresso+2份水</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">关键词：水</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">&ldquo;美式咖啡&rdquo;的名称来源有一个很流行但未经证实的说话，&rdquo;二战&ldquo;期间在欧洲的美国军人无法适应当地的浓缩咖啡，就有了加水冲淡后饮用的习惯。随着美国咖啡连锁店的普及，如今美式咖啡变成了工作日早餐最主要的饮料之一。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">（美式咖啡）</span></p>');
INSERT INTO `sk_goods` VALUES ('3', '2019-04-11 17:53:37.766174', '2019-04-12 14:01:05.171242', '0', '拿铁-品触咖啡', '<p><strong><span style=\"font-size: 10px;\">品触咖啡音乐书屋（5.0）（堂食）</span></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span style=\"font-size: 10px;\">松江区鼓浪路550号一区一楼13-15号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Cafe Latte</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">1份Espresso+1.5份热牛奶+0.5份奶泡</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">关键词：大量牛奶</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">Latte在意大利语中是牛奶的意思，它是意式浓缩咖啡与牛奶的精典混合。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">（拿铁）</span></p>');
INSERT INTO `sk_goods` VALUES ('4', '2019-04-11 17:53:55.522661', '2019-04-12 14:01:18.885016', '0', '卡布奇诺-品触咖啡', '<p><strong><span style=\"font-size: 10px;\">品触咖啡音乐书屋（5.0）（堂食）</span></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span style=\"font-size: 10px;\">松江区鼓浪路550号一区一楼13-15号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Cappuccino</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">1份Espresso+0.5份热牛奶+1.5份奶泡</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">关键词：大量奶泡</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">Cappuccino这个名字，让人联想起身着棕色长跑、头戴白色小尖帽的教会僧侣，而僧侣们的装束正是叫\"Cappuccino\"。相比牛奶，奶泡的质地更为细腻绵密，这让卡布奇诺喝起来更甜，口感更醇厚。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">（卡布奇诺）</span></p>');
INSERT INTO `sk_goods` VALUES ('5', '2019-04-11 17:54:13.206568', '2019-04-12 14:01:27.812532', '0', '摩卡-品触咖啡', '<p><strong><span style=\"font-size: 10px;\">品触咖啡音乐书屋（5.0）（堂食）</span></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>松江区鼓浪路550号一区一楼13-15号</strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Cafe Mocha</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">1份Espresso+1份热牛奶+0.5份巧克力酱+0.5份鲜奶油</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">关键词：糖浆、巧克力</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">拿铁咖啡若加了糖浆、巧克力等，就变成了味道更为温暖甜美的摩卡咖啡。糖浆与巧克力等酱类的不同种类与分享的组合，为摩卡咖啡带来了更多的变化，例如焦糖摩卡（焦糖酱）、斑马摩卡（巧克力酱和白巧克力酱）等。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">（摩卡咖啡）</span></p>');
INSERT INTO `sk_goods` VALUES ('6', '2019-04-11 17:54:33.488567', '2019-04-12 14:01:37.936221', '0', '玛琪朵-品触咖啡', '<p><strong><span style=\"font-size: 10px;\">品触咖啡音乐书屋（5.0）（堂食）</span></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span style=\"font-size: 10px;\">松江区鼓浪路550号一区一楼13-15号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Macchiato</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">1份Espresso+0.5份奶泡</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">关键词：小杯</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">Macchiato在意大利语中是\"标记\"的意思。与拿铁咖啡相比，玛奇朵使用的是容量更小的咖啡杯，只在咖啡的表层加一层奶泡而没有再加牛奶，喝起来奶香只停留在唇边，咖啡的味道不会被牛奶稀释。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">（玛奇朵）</span></p>');
INSERT INTO `sk_goods` VALUES ('7', '2019-04-12 13:58:23.780246', '2019-04-12 14:35:48.113583', '0', '浓缩咖啡-第三渡口', '<p><strong><span style=\"font-size: 10px;\">第三渡口（5.0）（堂食）</span></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span style=\"font-size: 10px;\">文汇路338弄210号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">每个咖啡馆的经典款，也是其它花式咖啡的基础。</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">一般来说espresso就是很小很小的一杯，在30毫升左右，味苦，表面漂浮着一层厚厚的咖啡油脂。</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">在意大利语中，espresso是&ldquo;为你现煮&rdquo;的意思，其工艺也就是通过短时间急速萃取的方式。</span></p>');
INSERT INTO `sk_goods` VALUES ('8', '2019-04-12 14:04:42.348231', '2019-04-12 14:35:56.057315', '0', '美式咖啡-第三渡口', '<p><strong><span style=\"font-size: 10px;\">第三渡口（5.0）（堂食）</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"font-size: 10px;\">文汇路338弄210号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">美式咖啡其实就是兑了大半杯白开水的Espresso，一般水与咖啡的比例是2:1。</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">采用的是滴滤式咖啡壶冲泡。</span></p>');
INSERT INTO `sk_goods` VALUES ('9', '2019-04-12 14:10:54.747182', '2019-04-12 14:36:01.058502', '0', '拿铁-第三渡口', '<p><strong>第三渡口（5.0）（堂食）</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"font-size: 10px;\">文汇路338弄210号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">拿铁是Espresso和牛奶的经典结合，牛奶与咖啡的比例一般控制在1.5:1。</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">在咖啡的顶端还会加上一些奶泡，优秀的咖啡师还能为你呈现出漂亮的拉花。</span></p>\r\n<p>&nbsp;</p>');
INSERT INTO `sk_goods` VALUES ('10', '2019-04-12 14:27:44.654793', '2019-04-12 14:36:05.745838', '0', '卡布奇诺-第三渡口', '<p><strong>第三渡口（5.0）（堂食）</strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span style=\"font-size: 10px;\">文汇路338弄210号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">以等量的浓缩咖啡和蒸汽泡沫牛奶混合的意大利咖啡。</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">咖啡的颜色就像卡布奇诺教会的修士在深褐色的外衣上覆上一条头巾一样，咖啡因此得名。</span></p>');
INSERT INTO `sk_goods` VALUES ('11', '2019-04-12 14:35:23.787860', '2019-04-12 14:35:23.787860', '0', '摩卡-第三渡口', '<p><strong><span style=\"font-size: 10px;\">第三渡口（5.0）（堂食）</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"font-size: 10px;\">文汇路338弄210号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">最古老的咖啡，是由意大利浓缩咖啡、巧克力酱、鲜奶油和牛奶混合而成，</span>摩卡得名于有名的摩卡港。</p>\r\n<p>&nbsp;</p>\r\n<p>其独特之甘，酸，苦味，极为优雅。为一般高级人士所喜爱的优良品种。</p>\r\n<p>&nbsp;</p>\r\n<p>普通皆单品饮用。饮之润滑可口。醇味历久不退。</p>\r\n<p>&nbsp;</p>\r\n<p>若调配综合咖啡，更是一种理想的品种。</p>\r\n<p>&nbsp;</p>');
INSERT INTO `sk_goods` VALUES ('12', '2019-04-12 14:37:49.648643', '2019-04-12 14:37:49.648643', '0', '玛琪朵-第三渡口', '<p><strong><span style=\"font-size: 10px;\">第三渡口（5.0）（堂食）</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"font-size: 10px;\">文汇路338弄210号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">香浓热牛奶上加入浓缩咖啡、香草，最后淋上纯正焦糖而成。</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">&ldquo;Caramel&rdquo;就是焦糖的意思。焦糖玛琪朵就是加了焦糖的Macchiato，代表&ldquo;甜蜜的印记&rdquo;。</span></p>');
INSERT INTO `sk_goods` VALUES ('13', '2019-04-12 16:03:58.063725', '2019-04-12 16:04:36.692717', '0', '浓缩咖啡-Farmer Coffee', '<p><strong>Farmer Coffee（5.0）（堂食）</strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span style=\"font-size: 10px;\">文汇路166弄1楼22号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Espresso</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">意式浓缩，是指将研磨得很细的咖啡粉，用高温热水及高压，在短时间内萃取出少量的咖啡液体。7-8g的咖啡粉，使用88-92℃的压力急速萃取出25-30毫升的浓缩咖啡。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">口味浓烈、余韵甘甜的意式浓缩被称为&rdquo;咖啡之魂&ldquo;，是最常见的咖啡类型的基础。一小杯Espresso（被称为一个shot），基本在25-30毫升。最好三口之内喝完。</span></p>\r\n<p><span style=\"font-size: 10px;\">&nbsp;</span></p>\r\n<p><span style=\"font-size: 10px;\">（意式浓缩）</span></p>');
INSERT INTO `sk_goods` VALUES ('14', '2019-04-12 16:08:46.777715', '2019-04-12 16:08:46.777715', '0', '玛琪朵-Farmer Coffee', '<p><strong><span style=\"font-size: 10px;\">Farmer Coffee（5.0）（堂食）</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"font-size: 10px;\">文汇路166弄1楼22号</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Macchiato</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 10px;\">Macchiato的成分是1份浓缩咖啡+0.5份奶泡（牛奶和奶沫混合的最终形态），此种咖啡比较女性化，看起来像是缩小版的卡布其诺。它们最大的区别，除了马琪朵的分量是卡布其诺的三分之一外，它Espresso上面只加一层奶泡而没有再加牛奶，所以喝起来奶香只停留在唇边而已，浓缩咖啡的味道并不会被牛奶稀释。</span></p>\r\n<p>&nbsp;</p>');

-- ----------------------------
-- Table structure for `sk_goods_sku`
-- ----------------------------
DROP TABLE IF EXISTS `sk_goods_sku`;
CREATE TABLE `sk_goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sk_goods_sku_category_id_e259e862_fk_sk_goods_type_id` (`category_id`),
  KEY `sk_goods_sku_goods_id_c5beca79_fk_sk_goods_id` (`goods_id`),
  CONSTRAINT `sk_goods_sku_category_id_e259e862_fk_sk_goods_type_id` FOREIGN KEY (`category_id`) REFERENCES `sk_goods_type` (`id`),
  CONSTRAINT `sk_goods_sku_goods_id_c5beca79_fk_sk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `sk_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_goods_sku
-- ----------------------------
INSERT INTO `sk_goods_sku` VALUES ('1', '2019-04-11 18:07:29.809171', '2019-04-11 18:07:29.809171', '0', '意式特浓', '浓缩咖啡Espresso', '20.00', '30ml', 'goods/Espresso01_Xp3Xgcs.jpg', '10', '1', '1', '1', '1');
INSERT INTO `sk_goods_sku` VALUES ('3', '2019-04-12 03:20:18.509478', '2019-04-12 03:20:18.509978', '0', '美式(热)', '美式咖啡Amweicano', '22.00', '12oz', 'goods/Americano01.jpg', '10', '1', '1', '2', '2');
INSERT INTO `sk_goods_sku` VALUES ('4', '2019-04-12 03:41:25.622705', '2019-04-12 03:41:25.623207', '0', '美式(冰)', '美式咖啡Amweicano', '22.00', '12oz', 'goods/Americano02.jpg', '10', '2', '1', '2', '2');
INSERT INTO `sk_goods_sku` VALUES ('5', '2019-04-12 11:51:32.555951', '2019-04-12 11:51:32.556452', '0', '卡布奇诺(热)', '卡布奇诺Cappuccino', '25.00', '12oz', 'goods/Cappuccino01.jpg', '9', '2', '1', '4', '4');
INSERT INTO `sk_goods_sku` VALUES ('6', '2019-04-12 11:54:03.304070', '2019-04-12 11:54:03.304070', '0', '卡布奇诺(冰)', '卡布奇诺Cappuccino', '25.00', '12oz', 'goods/Cappuccino02.jpg', '10', '2', '1', '4', '4');
INSERT INTO `sk_goods_sku` VALUES ('7', '2019-04-12 12:01:02.982907', '2019-04-12 12:01:02.982907', '0', '提拉米苏拿铁(热)', '拿铁Latte+提拉米苏奶泡', '28.00', '12oz', 'goods/Latte05.jpg', '8', '5', '1', '3', '3');
INSERT INTO `sk_goods_sku` VALUES ('8', '2019-04-12 12:02:16.632284', '2019-04-12 12:02:16.632284', '0', '提拉米苏拿铁(冰)', '拿铁Latte+提拉米苏奶泡', '28.00', '12oz', 'goods/Latte06.jpg', '9', '3', '1', '3', '3');
INSERT INTO `sk_goods_sku` VALUES ('9', '2019-04-12 12:05:31.449591', '2019-04-12 16:15:35.404575', '0', '焦糖玛琪朵(热)', '焦糖玛琪朵Caramel Macchiato', '32.00', '12oz', 'goods/Caramel_Macchiato01.jpg', '10', '3', '1', '6', '6');
INSERT INTO `sk_goods_sku` VALUES ('10', '2019-04-12 12:06:37.323575', '2019-04-12 12:06:37.323575', '0', '焦糖玛琪朵(冰)', '焦糖玛琪朵Caramel Macchiato', '32.00', '12oz', 'goods/Caramel_Macchiato02.jpg', '10', '2', '1', '6', '6');
INSERT INTO `sk_goods_sku` VALUES ('11', '2019-04-12 12:57:26.624039', '2019-04-12 12:57:26.624039', '0', '摩卡(热)', '摩卡Mocha', '32.00', '12oz', 'goods/Mocha05.jpg', '10', '1', '1', '5', '5');
INSERT INTO `sk_goods_sku` VALUES ('12', '2019-04-12 12:58:09.221869', '2019-04-12 12:58:09.221869', '0', '摩卡(冰)', '摩卡Mocha', '32.00', '12oz', 'goods/Mocha04.jpg', '10', '2', '1', '5', '5');
INSERT INTO `sk_goods_sku` VALUES ('13', '2019-04-12 13:00:50.059860', '2019-04-12 13:00:50.059860', '0', '白巧克力摩卡(热)', '摩卡Mocha+白巧克力酱', '32.00', '12oz', 'goods/Mocha01.jpg', '9', '3', '1', '5', '5');
INSERT INTO `sk_goods_sku` VALUES ('14', '2019-04-12 13:02:09.651214', '2019-04-12 13:02:09.651214', '0', '白巧克力摩卡(冰)', '摩卡Mocha+白巧克力酱', '32.00', '12oz', 'goods/Mocha02.jpg', '10', '2', '1', '5', '5');
INSERT INTO `sk_goods_sku` VALUES ('15', '2019-04-12 13:11:25.026755', '2019-04-12 13:11:25.026755', '0', '巧克力曲奇摩卡(热)', '摩卡Mocha+巧克力曲奇', '32.00', '12oz', 'goods/Mocha06.jpg', '10', '1', '1', '5', '5');
INSERT INTO `sk_goods_sku` VALUES ('16', '2019-04-12 13:12:33.688477', '2019-04-12 13:12:33.688477', '0', '巧克力曲奇摩卡(冰)', '摩卡Mocha+巧克力曲奇', '32.00', '12oz', 'goods/Mocha03.jpg', '10', '2', '1', '5', '5');
INSERT INTO `sk_goods_sku` VALUES ('17', '2019-04-12 13:39:41.167262', '2019-04-12 13:39:41.167262', '0', '拿铁(热)', '拿铁Latte', '25.00', '12oz', 'goods/Latte01.jpg', '8', '3', '1', '3', '3');
INSERT INTO `sk_goods_sku` VALUES ('18', '2019-04-12 13:48:08.269563', '2019-04-12 13:48:08.269563', '0', '拿铁(冰)', '拿铁Latte', '25.00', '12oz', 'goods/Latte02.jpg', '10', '1', '1', '3', '3');
INSERT INTO `sk_goods_sku` VALUES ('19', '2019-04-12 13:49:48.148519', '2019-04-12 13:49:48.148519', '0', '香草拿铁(热)', '拿铁Latte+香草奶泡', '28.00', '12oz', 'goods/Latte03.jpg', '10', '3', '1', '3', '3');
INSERT INTO `sk_goods_sku` VALUES ('20', '2019-04-12 13:50:31.927171', '2019-04-12 13:50:31.927171', '0', '香草拿铁(冰)', '拿铁Latte+香草奶泡', '28.00', '12oz', 'goods/Latte04.jpg', '6', '8', '1', '3', '3');
INSERT INTO `sk_goods_sku` VALUES ('21', '2019-04-12 15:18:36.342034', '2019-04-12 15:18:36.342034', '0', '卡布奇诺(热)', '卡布奇诺Cappuccino', '19.00', '12oz', 'goods/Cappuccino03.jpg', '10', '1', '1', '4', '10');
INSERT INTO `sk_goods_sku` VALUES ('22', '2019-04-12 15:19:27.653358', '2019-04-12 15:19:27.653358', '0', '卡布奇诺(冰)', '卡布奇诺Cappuccino', '22.00', '12oz', 'goods/Cappuccino04.jpg', '10', '2', '1', '4', '10');
INSERT INTO `sk_goods_sku` VALUES ('23', '2019-04-12 15:33:18.676083', '2019-04-12 15:33:18.676083', '0', '美式咖啡(热)', '美式咖啡Amweicano', '15.00', '12oz', 'goods/Americano03.jpg', '10', '1', '1', '2', '8');
INSERT INTO `sk_goods_sku` VALUES ('24', '2019-04-12 15:34:27.062814', '2019-04-12 15:34:27.062814', '0', '美式咖啡(冰)', '美式咖啡Amweicano', '18.00', '12oz', 'goods/Americano04.jpg', '10', '1', '1', '2', '8');
INSERT INTO `sk_goods_sku` VALUES ('25', '2019-04-12 15:59:01.459898', '2019-04-12 15:59:01.459898', '0', '意式浓缩(热)', '浓缩咖啡Espresso', '12.00', '30ml', 'goods/Espresso02.jpg', '10', '1', '1', '1', '7');
INSERT INTO `sk_goods_sku` VALUES ('26', '2019-04-12 16:11:09.422769', '2019-04-12 16:11:09.422769', '0', '意式浓缩咖啡(热)', '浓缩咖啡Espresso', '18.00', '30ml', 'goods/Espresso03.jpg', '10', '1', '1', '1', '13');
INSERT INTO `sk_goods_sku` VALUES ('27', '2019-04-12 16:11:58.586975', '2019-04-12 16:11:58.586975', '0', '意式浓缩咖啡(冰)', '浓缩咖啡Espresso', '18.00', '30ml', 'goods/Espresso04.jpg', '10', '2', '1', '1', '13');
INSERT INTO `sk_goods_sku` VALUES ('28', '2019-04-12 16:14:25.474006', '2019-04-12 16:14:25.474006', '0', '焦糖玛琪朵(热)', '焦糖玛琪朵Caramel Macchiato', '26.00', '12oz', 'goods/Caramel_Macchiato03.jpg', '10', '1', '1', '6', '14');
INSERT INTO `sk_goods_sku` VALUES ('29', '2019-04-12 16:15:16.136267', '2019-04-12 16:15:16.136267', '0', '焦糖玛琪朵(冰)', '焦糖玛琪朵Caramel Macchiato', '26.00', '12oz', 'goods/Caramel_Macchiato04.jpg', '10', '1', '1', '6', '14');
INSERT INTO `sk_goods_sku` VALUES ('30', '2019-04-15 06:38:16.253418', '2019-04-15 06:43:49.752178', '0', '测试单品', '测试单品', '0.10', '12oz', 'goods/x.jpg', '6', '4', '1', '4', '10');

-- ----------------------------
-- Table structure for `sk_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `sk_goods_type`;
CREATE TABLE `sk_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_goods_type
-- ----------------------------
INSERT INTO `sk_goods_type` VALUES ('1', '2019-04-07 10:32:13.341351', '2019-04-11 13:56:00.479465', '0', '浓缩咖啡', '咖啡', 'type/1.png');
INSERT INTO `sk_goods_type` VALUES ('2', '2019-04-07 10:33:06.926812', '2019-04-11 13:56:38.403914', '0', '美式咖啡', '咖啡', 'type/2.png');
INSERT INTO `sk_goods_type` VALUES ('3', '2019-04-07 11:03:18.877268', '2019-04-11 13:56:53.470675', '0', '拿铁', '咖啡', 'type/3.png');
INSERT INTO `sk_goods_type` VALUES ('4', '2019-04-07 11:03:36.234404', '2019-04-11 13:57:03.281961', '0', '卡布奇诺', '咖啡', 'type/4.png');
INSERT INTO `sk_goods_type` VALUES ('5', '2019-04-07 11:03:49.900027', '2019-04-11 13:57:14.067116', '0', '摩卡', '咖啡', 'type/5.png');
INSERT INTO `sk_goods_type` VALUES ('6', '2019-04-07 11:04:06.244755', '2019-04-11 13:57:41.007894', '0', '玛琪朵', '咖啡', 'type/6.png');

-- ----------------------------
-- Table structure for `sk_index_banner`
-- ----------------------------
DROP TABLE IF EXISTS `sk_index_banner`;
CREATE TABLE `sk_index_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_index_banner
-- ----------------------------
INSERT INTO `sk_index_banner` VALUES ('1', '2019-04-11 16:49:09.177580', '2019-04-11 16:49:09.177580', '0', 'banner/slide.jpg', '0');
INSERT INTO `sk_index_banner` VALUES ('2', '2019-04-11 16:49:22.525413', '2019-04-11 16:49:22.525413', '0', 'banner/slide02.jpg', '1');
INSERT INTO `sk_index_banner` VALUES ('3', '2019-04-11 16:49:36.077977', '2019-04-11 16:49:36.077977', '0', 'banner/slide03.jpg', '2');
INSERT INTO `sk_index_banner` VALUES ('4', '2019-04-11 16:49:47.797605', '2019-04-11 16:49:47.797605', '0', 'banner/slide04.jpg', '3');

-- ----------------------------
-- Table structure for `sk_index_promotion`
-- ----------------------------
DROP TABLE IF EXISTS `sk_index_promotion`;
CREATE TABLE `sk_index_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(256) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_index_promotion
-- ----------------------------
INSERT INTO `sk_index_promotion` VALUES ('1', '2019-04-11 13:45:46.353601', '2019-04-11 13:45:46.353601', '0', 'n46aw-1', 'http://www.nogizaka46.com/', 'banner/adv01.jpg', '0');
INSERT INTO `sk_index_promotion` VALUES ('2', '2019-04-11 13:46:10.499129', '2019-04-11 13:46:10.499129', '0', 'n46aw-2', 'http://www.nogizaka46.com/', 'banner/adv02.jpg', '1');

-- ----------------------------
-- Table structure for `sk_index_type_goods`
-- ----------------------------
DROP TABLE IF EXISTS `sk_index_type_goods`;
CREATE TABLE `sk_index_type_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sk_index_type_goods_category_id_345f3546_fk_sk_goods_type_id` (`category_id`),
  KEY `sk_index_type_goods_sku_id_c2962e34_fk_sk_goods_sku_id` (`sku_id`),
  CONSTRAINT `sk_index_type_goods_category_id_345f3546_fk_sk_goods_type_id` FOREIGN KEY (`category_id`) REFERENCES `sk_goods_type` (`id`),
  CONSTRAINT `sk_index_type_goods_sku_id_c2962e34_fk_sk_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `sk_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_index_type_goods
-- ----------------------------
INSERT INTO `sk_index_type_goods` VALUES ('5', '2019-04-11 18:08:39.074264', '2019-04-11 18:08:39.074765', '0', '1', '0', '1', '1');
INSERT INTO `sk_index_type_goods` VALUES ('6', '2019-04-12 03:20:44.400777', '2019-04-12 03:20:44.400777', '0', '1', '0', '2', '3');
INSERT INTO `sk_index_type_goods` VALUES ('7', '2019-04-12 03:41:50.259868', '2019-04-12 03:41:50.260368', '0', '1', '1', '2', '4');
INSERT INTO `sk_index_type_goods` VALUES ('8', '2019-04-12 11:51:52.137196', '2019-04-12 11:51:52.137196', '0', '1', '0', '4', '5');
INSERT INTO `sk_index_type_goods` VALUES ('9', '2019-04-12 11:54:36.558100', '2019-04-12 11:55:05.352404', '0', '1', '1', '4', '6');
INSERT INTO `sk_index_type_goods` VALUES ('10', '2019-04-12 12:02:30.252981', '2019-04-12 12:02:30.252981', '0', '1', '0', '3', '7');
INSERT INTO `sk_index_type_goods` VALUES ('11', '2019-04-12 12:02:40.977565', '2019-04-12 12:02:40.977565', '0', '1', '1', '3', '8');
INSERT INTO `sk_index_type_goods` VALUES ('12', '2019-04-12 12:06:53.743367', '2019-04-12 12:06:53.743367', '0', '1', '0', '6', '9');
INSERT INTO `sk_index_type_goods` VALUES ('13', '2019-04-12 12:07:06.311281', '2019-04-12 12:07:06.311281', '0', '1', '1', '6', '10');
INSERT INTO `sk_index_type_goods` VALUES ('14', '2019-04-12 12:58:21.626431', '2019-04-12 12:58:21.626931', '0', '1', '0', '5', '11');
INSERT INTO `sk_index_type_goods` VALUES ('15', '2019-04-12 12:58:32.653797', '2019-04-12 12:58:32.653797', '0', '1', '1', '5', '12');
INSERT INTO `sk_index_type_goods` VALUES ('17', '2019-04-12 13:05:56.614265', '2019-04-12 13:05:56.614265', '0', '1', '2', '5', '13');
INSERT INTO `sk_index_type_goods` VALUES ('18', '2019-04-12 13:06:12.750887', '2019-04-12 13:06:12.750887', '0', '1', '3', '5', '14');
INSERT INTO `sk_index_type_goods` VALUES ('19', '2019-04-12 13:50:59.885673', '2019-04-12 13:50:59.885673', '0', '1', '2', '3', '19');
INSERT INTO `sk_index_type_goods` VALUES ('20', '2019-04-12 13:51:16.191781', '2019-04-12 13:51:32.779328', '0', '1', '4', '3', '20');
INSERT INTO `sk_index_type_goods` VALUES ('21', '2019-04-12 15:19:55.751010', '2019-04-12 15:19:55.751010', '0', '1', '2', '4', '21');
INSERT INTO `sk_index_type_goods` VALUES ('22', '2019-04-12 15:20:09.842248', '2019-04-12 15:20:09.842248', '0', '1', '3', '4', '22');
INSERT INTO `sk_index_type_goods` VALUES ('23', '2019-04-12 15:34:42.040971', '2019-04-12 15:34:42.040971', '0', '1', '2', '2', '23');
INSERT INTO `sk_index_type_goods` VALUES ('24', '2019-04-12 15:34:59.187987', '2019-04-12 15:34:59.187987', '0', '1', '3', '2', '24');
INSERT INTO `sk_index_type_goods` VALUES ('25', '2019-04-12 15:59:18.420125', '2019-04-12 15:59:18.420125', '0', '1', '1', '1', '25');
INSERT INTO `sk_index_type_goods` VALUES ('26', '2019-04-12 16:12:24.319701', '2019-04-12 16:12:24.319701', '0', '1', '2', '1', '26');
INSERT INTO `sk_index_type_goods` VALUES ('27', '2019-04-12 16:12:45.247608', '2019-04-12 16:12:45.247608', '0', '1', '3', '1', '27');
INSERT INTO `sk_index_type_goods` VALUES ('28', '2019-04-12 16:16:03.037723', '2019-04-12 16:16:03.037723', '0', '1', '2', '6', '28');
INSERT INTO `sk_index_type_goods` VALUES ('29', '2019-04-12 16:16:16.652641', '2019-04-12 16:16:16.652641', '0', '1', '3', '6', '29');

-- ----------------------------
-- Table structure for `sk_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `sk_order_goods`;
CREATE TABLE `sk_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sk_order_goods_order_id_cd088a4e_fk_sk_order_info_order_id` (`order_id`),
  KEY `sk_order_goods_sku_id_4f74affc_fk_sk_goods_sku_id` (`sku_id`),
  CONSTRAINT `sk_order_goods_order_id_cd088a4e_fk_sk_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `sk_order_info` (`order_id`),
  CONSTRAINT `sk_order_goods_sku_id_4f74affc_fk_sk_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `sk_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_order_goods
-- ----------------------------
INSERT INTO `sk_order_goods` VALUES ('1', '2019-04-12 13:54:31.802927', '2019-04-12 13:54:31.802927', '0', '1', '25.00', '', '201904122154313', '5');
INSERT INTO `sk_order_goods` VALUES ('2', '2019-04-12 13:54:31.805930', '2019-04-12 13:54:31.805930', '0', '1', '28.00', '', '201904122154313', '20');
INSERT INTO `sk_order_goods` VALUES ('3', '2019-04-15 06:45:18.940666', '2019-04-15 06:45:18.940666', '0', '1', '0.10', '', '201904151445173', '30');
INSERT INTO `sk_order_goods` VALUES ('4', '2019-04-15 06:51:47.592195', '2019-04-15 07:21:19.248746', '0', '1', '0.10', '好喝！', '201904151451433', '30');
INSERT INTO `sk_order_goods` VALUES ('5', '2019-04-15 14:14:36.390714', '2019-04-15 14:25:50.956222', '0', '1', '0.10', '好喝的！', '201904152214353', '30');
INSERT INTO `sk_order_goods` VALUES ('6', '2019-04-15 14:14:36.403222', '2019-04-15 14:25:51.018885', '0', '1', '28.00', 'nice！', '201904152214353', '20');
INSERT INTO `sk_order_goods` VALUES ('7', '2019-04-15 14:23:06.706494', '2019-04-15 14:23:06.706494', '0', '1', '32.00', '', '201904152223063', '13');
INSERT INTO `sk_order_goods` VALUES ('8', '2019-04-15 14:23:06.711012', '2019-04-15 14:23:06.711012', '0', '1', '28.00', '', '201904152223063', '7');
INSERT INTO `sk_order_goods` VALUES ('9', '2019-04-15 14:23:07.061485', '2019-04-15 14:23:07.061485', '0', '1', '28.00', '', '201904152223063', '20');
INSERT INTO `sk_order_goods` VALUES ('10', '2019-04-16 15:09:24.444106', '2019-04-16 15:09:24.444106', '0', '1', '28.00', '', '201904162309233', '8');
INSERT INTO `sk_order_goods` VALUES ('11', '2019-04-16 15:15:20.748593', '2019-04-16 15:18:58.379876', '0', '1', '0.10', '好喝！！', '201904162315203', '30');
INSERT INTO `sk_order_goods` VALUES ('12', '2019-04-17 18:34:46.231641', '2019-04-17 18:34:46.231641', '0', '1', '28.00', '', '2019041802344612', '20');
INSERT INTO `sk_order_goods` VALUES ('13', '2019-04-17 18:34:46.239647', '2019-04-17 18:34:46.239647', '0', '1', '28.00', '', '2019041802344612', '7');
INSERT INTO `sk_order_goods` VALUES ('14', '2019-04-20 04:53:41.042223', '2019-04-20 04:55:15.346091', '0', '2', '25.00', '好喝', '201904201253403', '17');

-- ----------------------------
-- Table structure for `sk_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `sk_order_info`;
CREATE TABLE `sk_order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transit_price` decimal(10,2) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `trade_no` varchar(128) NOT NULL,
  `addr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `sk_order_info_addr_id_7e14e6f7_fk_sk_address_id` (`addr_id`),
  KEY `sk_order_info_user_id_75ecb1e0_fk_sk_user_id` (`user_id`),
  CONSTRAINT `sk_order_info_addr_id_7e14e6f7_fk_sk_address_id` FOREIGN KEY (`addr_id`) REFERENCES `sk_address` (`id`),
  CONSTRAINT `sk_order_info_user_id_75ecb1e0_fk_sk_user_id` FOREIGN KEY (`user_id`) REFERENCES `sk_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_order_info
-- ----------------------------
INSERT INTO `sk_order_info` VALUES ('2019-04-12 13:54:31.789921', '2019-04-12 13:54:31.806929', '0', '201904122154313', '3', '2', '53.00', '10.00', '1', '', '3', '3');
INSERT INTO `sk_order_info` VALUES ('2019-04-15 06:45:17.992687', '2019-04-15 06:45:19.918956', '0', '201904151445173', '3', '1', '0.10', '10.00', '1', '', '3', '3');
INSERT INTO `sk_order_info` VALUES ('2019-04-15 06:51:43.705115', '2019-04-15 07:21:19.338998', '0', '201904151451433', '3', '1', '0.10', '0.00', '5', '2019041522001481741000011267', '3', '3');
INSERT INTO `sk_order_info` VALUES ('2019-04-15 14:14:35.909540', '2019-04-15 14:25:51.062728', '0', '201904152214353', '3', '2', '28.10', '10.00', '5', '2019041522001481741000013107', '3', '3');
INSERT INTO `sk_order_info` VALUES ('2019-04-15 14:23:06.529774', '2019-04-15 14:23:07.062486', '0', '201904152223063', '3', '3', '88.00', '10.00', '1', '', '3', '3');
INSERT INTO `sk_order_info` VALUES ('2019-04-16 15:09:23.594140', '2019-04-16 15:09:24.850837', '0', '201904162309233', '3', '1', '28.00', '10.00', '1', '', '3', '3');
INSERT INTO `sk_order_info` VALUES ('2019-04-16 15:15:20.734083', '2019-04-16 15:18:58.481318', '0', '201904162315203', '3', '1', '0.10', '10.00', '5', '2019041622001481741000015997', '3', '3');
INSERT INTO `sk_order_info` VALUES ('2019-04-17 18:34:46.165083', '2019-04-17 18:34:46.241149', '0', '2019041802344612', '2', '2', '56.00', '10.00', '1', '', '5', '12');
INSERT INTO `sk_order_info` VALUES ('2019-04-20 04:53:40.700102', '2019-04-20 04:55:15.445159', '0', '201904201253403', '3', '2', '50.00', '10.00', '5', '2019042022001481741000017251', '4', '3');

-- ----------------------------
-- Table structure for `sk_user`
-- ----------------------------
DROP TABLE IF EXISTS `sk_user`;
CREATE TABLE `sk_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_user
-- ----------------------------
INSERT INTO `sk_user` VALUES ('3', 'pbkdf2_sha256$36000$9v1yUEVXB5dW$PKi5ngBtgeE3EKRakhWmlL4cfZ0GCIxyeJrz1jsQQWc=', '2019-04-20 04:50:43.334599', '1', 'ryo', '', '', 'ostantares@gmail.com', '1', '1', '2019-04-07 10:15:03.634519', '2019-04-07 10:15:03.700066', '2019-04-07 10:15:03.700066', '0');
INSERT INTO `sk_user` VALUES ('6', 'pbkdf2_sha256$36000$pTXmFlotbaqS$Gc/U5mZD2mqTIJ/1nNVxEJqf7UnmL32MP4f1x0q9fg4=', '2019-04-15 17:23:12.765331', '0', 'uncle3', '', '', '1069512584@qq.com', '0', '1', '2019-04-07 12:35:30.014397', '2019-04-07 12:35:30.060430', '2019-04-07 12:36:10.445593', '0');
INSERT INTO `sk_user` VALUES ('9', 'pbkdf2_sha256$36000$mLqBUWnDixFn$gfsZYGkzT9v6H508WaZGQUzah1p3px+iS3ZHA0CS9NQ=', '2019-04-12 03:59:16.383583', '0', 'aunt6', '', '', '3192865951@qq.com', '0', '1', '2019-04-12 03:56:50.693572', '2019-04-12 03:56:50.753615', '2019-04-12 03:58:04.507840', '0');
INSERT INTO `sk_user` VALUES ('10', 'pbkdf2_sha256$36000$mk9JuODceKxQ$t4H048OH9/T4Khnx3TxKJSW9C4J0a80N6BIRRQFVHPw=', '2019-04-14 06:45:06.523495', '0', 'uncle', '', '', '1069512584@qq.com', '0', '1', '2019-04-14 06:42:38.128169', '2019-04-14 06:42:38.209249', '2019-04-14 06:44:45.097425', '0');
INSERT INTO `sk_user` VALUES ('12', 'pbkdf2_sha256$36000$qENAqsmw8Jqc$Vq2C7JxINujc28DCJ6HRz1mosCJvZjsbUFzN/w5hweY=', '2019-04-20 02:27:19.625838', '0', 'uncle2', '', '', '1069512584@qq.com', '0', '1', '2019-04-17 16:55:32.596051', '2019-04-17 16:55:32.660596', '2019-04-17 16:56:37.222349', '0');

-- ----------------------------
-- Table structure for `sk_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `sk_user_groups`;
CREATE TABLE `sk_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sk_user_groups_user_id_group_id_b6d84fec_uniq` (`user_id`,`group_id`),
  KEY `sk_user_groups_group_id_9689041b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `sk_user_groups_group_id_9689041b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `sk_user_groups_user_id_ef3ce706_fk_sk_user_id` FOREIGN KEY (`user_id`) REFERENCES `sk_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `sk_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `sk_user_user_permissions`;
CREATE TABLE `sk_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sk_user_user_permissions_user_id_permission_id_973e011f_uniq` (`user_id`,`permission_id`),
  KEY `sk_user_user_permiss_permission_id_9a3ce81f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `sk_user_user_permiss_permission_id_9a3ce81f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `sk_user_user_permissions_user_id_f8ac5012_fk_sk_user_id` FOREIGN KEY (`user_id`) REFERENCES `sk_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sk_user_user_permissions
-- ----------------------------
