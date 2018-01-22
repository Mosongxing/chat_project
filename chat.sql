/*
Navicat MySQL Data Transfer

Source Server         : linux
Source Server Version : 50548
Source Host           : 192.168.1.245:3306
Source Database       : chat

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2018-01-22 14:06:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chat_message`
-- ----------------------------
DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE `chat_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `from_user_id` int(10) unsigned NOT NULL COMMENT '发送者id',
  `from_user_name` varchar(64) NOT NULL DEFAULT '' COMMENT '昵称',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接受者id',
  `content` text NOT NULL COMMENT '发送内容',
  `room_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '房间号',
  `image` varchar(64) NOT NULL DEFAULT '/image/no_pic.png' COMMENT '发送者照片',
  `time` datetime NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat_message
-- ----------------------------
INSERT INTO `chat_message` VALUES ('1', '1', '小明', '0', '这回可以了吗？', '1', '/image/timg1.jpg', '2018-01-22 09:52:20');
INSERT INTO `chat_message` VALUES ('2', '1', '小明', '0', '唉', '1', '/image/timg1.jpg', '2018-01-22 09:52:22');
INSERT INTO `chat_message` VALUES ('3', '1', '小明', '0', '字体不够大', '1', '/image/timg1.jpg', '2018-01-22 09:55:03');
INSERT INTO `chat_message` VALUES ('4', '1', '小明', '0', '水电费是否是大法师是大法师', '1', '/image/timg1.jpg', '2018-01-22 10:09:19');
INSERT INTO `chat_message` VALUES ('5', '2', '小红', '0', '来了吗？', '1', '/image/timg.jpg', '2018-01-22 10:09:36');
INSERT INTO `chat_message` VALUES ('6', '2', '小红', '0', '今天天气不错啊', '1', '/image/timg.jpg', '2018-01-22 10:09:49');
INSERT INTO `chat_message` VALUES ('7', '2', '小红', '0', '你想我了吗？', '1', '/image/timg.jpg', '2018-01-22 10:10:02');
INSERT INTO `chat_message` VALUES ('8', '1', '小明', '0', '想你妹，滚', '1', '/image/timg1.jpg', '2018-01-22 10:10:33');
INSERT INTO `chat_message` VALUES ('9', '1', '小明', '0', '居然看不到', '1', '/image/timg1.jpg', '2018-01-22 10:11:04');
INSERT INTO `chat_message` VALUES ('10', '2', '小红', '0', '刚刚掉线了', '1', '/image/timg.jpg', '2018-01-22 10:11:16');
INSERT INTO `chat_message` VALUES ('11', '1', '小明', '0', '只能一个人登陆吧', '1', '/image/timg1.jpg', '2018-01-22 10:18:05');
INSERT INTO `chat_message` VALUES ('12', '1', '小明', '0', '好像要做成这个样子才行', '1', '/image/timg1.jpg', '2018-01-22 10:18:13');
INSERT INTO `chat_message` VALUES ('13', '1', '小明', '0', '你下线了，待会重连试试看', '1', '/image/timg1.jpg', '2018-01-22 10:18:49');
INSERT INTO `chat_message` VALUES ('14', '1', '小明', '0', '嘿嘿嘿', '1', '/image/timg1.jpg', '2018-01-22 10:19:01');
INSERT INTO `chat_message` VALUES ('15', '2', '小红', '0', '可以吗？', '1', '/image/timg.jpg', '2018-01-22 10:19:32');
INSERT INTO `chat_message` VALUES ('16', '2', '小红', '0', '可以个鬼', '1', '/image/timg.jpg', '2018-01-22 10:19:38');
INSERT INTO `chat_message` VALUES ('17', '2', '小红', '0', '都他妈的服了你', '1', '/image/timg.jpg', '2018-01-22 10:19:44');
INSERT INTO `chat_message` VALUES ('18', '2', '小红', '0', '刷新重连', '1', '/image/timg.jpg', '2018-01-22 10:20:03');
INSERT INTO `chat_message` VALUES ('19', '2', '小红', '0', '问你服不服', '1', '/image/timg.jpg', '2018-01-22 10:20:09');
INSERT INTO `chat_message` VALUES ('20', '2', '小红', '0', '黑底', '1', '/image/timg.jpg', '2018-01-22 10:20:13');
INSERT INTO `chat_message` VALUES ('21', '2', '小红', '0', '我永觉得有问题', '1', '/image/timg.jpg', '2018-01-22 10:20:24');
INSERT INTO `chat_message` VALUES ('22', '2', '小红', '0', '但是又说不出来', '1', '/image/timg.jpg', '2018-01-22 10:20:35');
INSERT INTO `chat_message` VALUES ('23', '1', '小明', '0', '我现在是小李', '1', '/image/timg1.jpg', '2018-01-22 10:21:40');
INSERT INTO `chat_message` VALUES ('24', '1', '小明', '0', '握手成功了吗？', '1', '/image/timg1.jpg', '2018-01-22 10:29:29');
INSERT INTO `chat_message` VALUES ('25', '1', '小明', '0', '水电费', '1', '/image/timg1.jpg', '2018-01-22 11:31:48');
INSERT INTO `chat_message` VALUES ('26', '2', '小红', '0', ' Hhhhhs', '1', '/image/timg.jpg', '2018-01-22 11:32:07');
INSERT INTO `chat_message` VALUES ('27', '1', '小明', '0', 'h5', '1', '/image/timg1.jpg', '2018-01-22 11:32:09');
INSERT INTO `chat_message` VALUES ('28', '2', '小红', '0', 'Ddddd', '1', '/image/timg.jpg', '2018-01-22 11:32:15');
INSERT INTO `chat_message` VALUES ('29', '1', '小明', '0', '可以吧？', '1', '/image/timg1.jpg', '2018-01-22 11:32:22');
INSERT INTO `chat_message` VALUES ('30', '2', '小红', '0', 'Good', '1', '/image/timg.jpg', '2018-01-22 11:32:26');
INSERT INTO `chat_message` VALUES ('31', '1', '小明', '0', '6不6？', '1', '/image/timg1.jpg', '2018-01-22 11:32:27');
INSERT INTO `chat_message` VALUES ('32', '1', '小明', '0', '嘿嘿', '1', '/image/timg1.jpg', '2018-01-22 11:32:30');
INSERT INTO `chat_message` VALUES ('33', '2', '小红', '0', '哈哈', '1', '/image/timg.jpg', '2018-01-22 11:33:30');
INSERT INTO `chat_message` VALUES ('34', '1', '小明', '0', '成功了？', '1', '/image/timg1.jpg', '2018-01-22 11:49:02');
INSERT INTO `chat_message` VALUES ('35', '1', '小明', '0', '不会吧', '1', '/image/timg1.jpg', '2018-01-22 11:49:04');
INSERT INTO `chat_message` VALUES ('36', '1', '小明', '0', 'php是世界最好的语言', '1', '/image/timg1.jpg', '2018-01-22 11:49:40');
INSERT INTO `chat_message` VALUES ('37', '2', '小红', '0', '做人要谦虚', '1', '/image/timg.jpg', '2018-01-22 12:01:01');
INSERT INTO `chat_message` VALUES ('38', '2', '小红', '0', '你还有什么话要说？', '1', '/image/timg.jpg', '2018-01-22 12:01:39');
INSERT INTO `chat_message` VALUES ('39', '1', '小明', '0', '是吗？', '1', '/image/timg1.jpg', '2018-01-22 13:16:36');
INSERT INTO `chat_message` VALUES ('40', '1', '小明', '0', '爽不爽？', '1', '/image/timg1.jpg', '2018-01-22 13:16:54');

-- ----------------------------
-- Table structure for `chat_user`
-- ----------------------------
DROP TABLE IF EXISTS `chat_user`;
CREATE TABLE `chat_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL DEFAULT '' COMMENT '用户在群里面的昵称',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `image` varchar(255) NOT NULL DEFAULT '/image/no_pic.png' COMMENT '用户头像',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '用户签名',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  KEY `union` (`username`,`password`) USING BTREE,
  KEY `unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat_user
-- ----------------------------
INSERT INTO `chat_user` VALUES ('1', 'a', '小明', '123', '/image/timg1.jpg', '复仇者联盟', '2018-01-17 10:57:27');
INSERT INTO `chat_user` VALUES ('2', 'b', '小红', '123', '/image/timg.jpg', '正义联盟', '2018-01-18 14:54:08');
