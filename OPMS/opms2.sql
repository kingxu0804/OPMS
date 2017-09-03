/*
Navicat MySQL Data Transfer

Source Server         : opms
Source Server Version : 50703
Source Host           : 112.74.206.18:3306
Source Database       : opms2

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-09-03 13:41:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pms_albums`
-- ----------------------------
DROP TABLE IF EXISTS `pms_albums`;
CREATE TABLE `pms_albums` (
  `albumid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `picture` varchar(255) DEFAULT '' COMMENT 'Picture',
  `keywords` varchar(2550) DEFAULT '' COMMENT '关键词',
  `summary` varchar(255) DEFAULT '',
  `viewnum` int(10) DEFAULT '0' COMMENT '阅读数',
  `comtnum` int(10) DEFAULT '0' COMMENT '评论数',
  `laudnum` int(10) DEFAULT '0' COMMENT '赞数',
  `created` datetime DEFAULT NULL COMMENT '图片上传时间',
  `status` int(1) DEFAULT '1' COMMENT '状态: 1发布0屏蔽',
  PRIMARY KEY (`albumid`),
  KEY `INDEX_TCVS` (`userid`,`title`,`viewnum`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='相册表';

-- ----------------------------
-- Records of pms_albums
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_albums_comment`
-- ----------------------------
DROP TABLE IF EXISTS `pms_albums_comment`;
CREATE TABLE `pms_albums_comment` (
  `comtid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `albumid` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  PRIMARY KEY (`comtid`),
  KEY `INDEX_UKCS` (`userid`,`albumid`,`created`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='相册评论表';

-- ----------------------------
-- Records of pms_albums_comment
-- ----------------------------
INSERT INTO `pms_albums_comment` VALUES ('23456', '1468915433602979028', '170808163820711', 'sdfghjk', '2017-08-16 11:20:41', '1');
INSERT INTO `pms_albums_comment` VALUES ('170809205043602', '1461312703628858832', '170808163820711', 'ceshiwo', '2017-08-09 20:50:43', '1');

-- ----------------------------
-- Table structure for `pms_albums_laud`
-- ----------------------------
DROP TABLE IF EXISTS `pms_albums_laud`;
CREATE TABLE `pms_albums_laud` (
  `laudid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `albumid` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  PRIMARY KEY (`laudid`),
  KEY `INDEX_UKCS` (`userid`,`albumid`,`created`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='相册点赞表';

-- ----------------------------
-- Records of pms_albums_laud
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_businesstrips`
-- ----------------------------
DROP TABLE IF EXISTS `pms_businesstrips`;
CREATE TABLE `pms_businesstrips` (
  `businesstripid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `destinations` varchar(50) NOT NULL COMMENT '目的地',
  `starteds` varchar(200) DEFAULT NULL COMMENT '开始日期',
  `endeds` varchar(200) DEFAULT NULL COMMENT '结束日期',
  `days` int(4) DEFAULT NULL COMMENT '天数',
  `reason` varchar(500) DEFAULT NULL COMMENT '出差事由',
  `picture` varchar(100) DEFAULT NULL COMMENT '1同',
  `result` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `status` int(1) DEFAULT '1' COMMENT '1草稿2正常发布',
  `approverids` varchar(200) DEFAULT NULL COMMENT '审批人串',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`businesstripid`),
  KEY `INDEX_URSC` (`userid`,`result`,`status`,`created`,`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出差表';

-- ----------------------------
-- Records of pms_businesstrips
-- ----------------------------
INSERT INTO `pms_businesstrips` VALUES ('32525245', '1467191338628906628', '西安', '2017-08-08', '2017-08-15', '14', '核查项目', null, null, '1', '', '2017-08-03 10:47:53', '2017-08-06 09:06:46');
INSERT INTO `pms_businesstrips` VALUES ('1460111834487943780', '1467191338628906628', '覆盖', '2017-08-07', '2017-08-09', null, null, null, null, '1', '', '2017-08-06 10:58:13', null);
INSERT INTO `pms_businesstrips` VALUES ('1460152194691584975', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:27', '2017-08-06 09:07:08');
INSERT INTO `pms_businesstrips` VALUES ('1460274896498308673', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:01:51', null);
INSERT INTO `pms_businesstrips` VALUES ('1460276255870119536', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1460376034133001853', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:01:52', null);
INSERT INTO `pms_businesstrips` VALUES ('1460380339891332775', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:19', null);
INSERT INTO `pms_businesstrips` VALUES ('1460428576149312346', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1460522062606210548', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1460619378460637006', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1460655634327556968', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:04:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1460759678374846676', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:27', null);
INSERT INTO `pms_businesstrips` VALUES ('1460765178498881896', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:26', null);
INSERT INTO `pms_businesstrips` VALUES ('1460809879028295394', '1467191338628906628', '大佛寺', '2017-08-06', '2017-08-07', '2', '是否鬼斧神工的感受到', '', null, '1', '', '2017-08-06 10:44:51', null);
INSERT INTO `pms_businesstrips` VALUES ('1460815014603422358', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:02:08', null);
INSERT INTO `pms_businesstrips` VALUES ('1460821577172910642', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:11:56', null);
INSERT INTO `pms_businesstrips` VALUES ('1460942616694307002', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:04:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1460943254339213770', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1461130387346730843', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1461197492740097414', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:18:03', null);
INSERT INTO `pms_businesstrips` VALUES ('1461206707120255405', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:25', null);
INSERT INTO `pms_businesstrips` VALUES ('1461252229097916640', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:28', null);
INSERT INTO `pms_businesstrips` VALUES ('1461272814165561061', '1467191338628906628', '村上,镇上,发送到', '2017-08-04,2017-08-04,2017-08-04', '2017-08-04,2017-08-05,2017-08-05', '2', '村里骑电动，阿萨是否', 'C:\\fakepath\\302035.jpg', null, '2', ',103185182969827328,1467191338628906628', '2017-08-04 15:23:41', '2017-08-05 21:55:36');
INSERT INTO `pms_businesstrips` VALUES ('1461311428367958907', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1461339362545156565', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:27', null);
INSERT INTO `pms_businesstrips` VALUES ('1461347566011082541', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1461445081109285340', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:35', null);
INSERT INTO `pms_businesstrips` VALUES ('1461510385920590665', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:01:49', null);
INSERT INTO `pms_businesstrips` VALUES ('1461534992410741490', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:28', null);
INSERT INTO `pms_businesstrips` VALUES ('1461604840343020578', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1461621508708731692', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:11:57', null);
INSERT INTO `pms_businesstrips` VALUES ('1461644981307614782', '1467191338628906628', '都更改', '2017-08-09', '2017-08-10', null, null, null, null, '1', '', '2017-08-06 10:51:56', null);
INSERT INTO `pms_businesstrips` VALUES ('1461700864889221675', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:19', null);
INSERT INTO `pms_businesstrips` VALUES ('1461716491787778056', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:14:48', null);
INSERT INTO `pms_businesstrips` VALUES ('1461810345144920368', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:16', null);
INSERT INTO `pms_businesstrips` VALUES ('1461821824900518817', '1467191338628906628', '大是大非', '2017-08-09', '2017-08-10', '3', '发大发', '', null, '1', ',103185182969827328', '2017-08-05 22:00:07', null);
INSERT INTO `pms_businesstrips` VALUES ('1461827134384176475', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', null, null, null, null, '1', '', '2017-08-06 10:58:00', null);
INSERT INTO `pms_businesstrips` VALUES ('1461895462825535815', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:11:57', null);
INSERT INTO `pms_businesstrips` VALUES ('1461910846526473295', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:26', null);
INSERT INTO `pms_businesstrips` VALUES ('1461933542369078120', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:25', null);
INSERT INTO `pms_businesstrips` VALUES ('1461953848008807664', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:04:13', null);
INSERT INTO `pms_businesstrips` VALUES ('1462067809599002620', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:20', null);
INSERT INTO `pms_businesstrips` VALUES ('1462082329668590885', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1462179596184798680', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:14:47', null);
INSERT INTO `pms_businesstrips` VALUES ('1462317692788364023', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:02:08', null);
INSERT INTO `pms_businesstrips` VALUES ('1462375454387184295', '1467191338628906628', '胜多负少', '2017-08-06', '2017-08-07', '3', '电放费', '', null, '1', '', '2017-08-05 22:03:10', null);
INSERT INTO `pms_businesstrips` VALUES ('1462508225292313992', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1462511408436102214', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:20', null);
INSERT INTO `pms_businesstrips` VALUES ('1462665520766852071', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:34:05', null);
INSERT INTO `pms_businesstrips` VALUES ('1462684508085880981', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:17', null);
INSERT INTO `pms_businesstrips` VALUES ('1462779145647598496', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1462811158473654278', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:14:48', null);
INSERT INTO `pms_businesstrips` VALUES ('1462859799625321141', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1462919576850612918', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:04:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1462919806807232653', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:19', null);
INSERT INTO `pms_businesstrips` VALUES ('1462922355588913252', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:18:03', null);
INSERT INTO `pms_businesstrips` VALUES ('1462991584467092667', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:20', null);
INSERT INTO `pms_businesstrips` VALUES ('1463071883330659203', '1467191338628906628', '电风扇地方', '2017-08-01', '2017-08-01', '1', '电风扇地方', '', null, '1', '', '2017-08-05 21:53:43', null);
INSERT INTO `pms_businesstrips` VALUES ('1463117021563039736', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1463208049928405950', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:14:47', null);
INSERT INTO `pms_businesstrips` VALUES ('1463216753343040009', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1463269520255315439', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:21', null);
INSERT INTO `pms_businesstrips` VALUES ('1463437871732884252', '1467191338628906628', '胜多负少', '2017-08-06', '2017-08-07', '3', '电放费', '', null, '1', '', '2017-08-05 22:03:09', null);
INSERT INTO `pms_businesstrips` VALUES ('1463463676586524380', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:02:08', null);
INSERT INTO `pms_businesstrips` VALUES ('1463496195962767606', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:33:43', null);
INSERT INTO `pms_businesstrips` VALUES ('1463510695491649621', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:26', null);
INSERT INTO `pms_businesstrips` VALUES ('1463524711204504558', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:21', null);
INSERT INTO `pms_businesstrips` VALUES ('1463579556327217334', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:15:57', null);
INSERT INTO `pms_businesstrips` VALUES ('1463782965064954529', '1467191338628906628', '大佛寺', '2017-08-06', '2017-08-07', '2', '是否鬼斧神工的感受到', '', null, '1', '', '2017-08-06 10:45:00', null);
INSERT INTO `pms_businesstrips` VALUES ('1463864020172061195', '1467191338628906628', '电风扇地方', '2017-08-01', '2017-08-01', '1', '电风扇地方', '', null, '1', '', '2017-08-05 21:53:45', null);
INSERT INTO `pms_businesstrips` VALUES ('1463900188471717405', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:21', null);
INSERT INTO `pms_businesstrips` VALUES ('1463934475422469118', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:33:44', null);
INSERT INTO `pms_businesstrips` VALUES ('1463998458635579536', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:17', null);
INSERT INTO `pms_businesstrips` VALUES ('1464177484614866158', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:17', null);
INSERT INTO `pms_businesstrips` VALUES ('1464272971726514915', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:20', null);
INSERT INTO `pms_businesstrips` VALUES ('1464308767186286978', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:21', null);
INSERT INTO `pms_businesstrips` VALUES ('1464315207693347789', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:19', null);
INSERT INTO `pms_businesstrips` VALUES ('1464342139449924149', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:33:43', null);
INSERT INTO `pms_businesstrips` VALUES ('1464379253372402620', '1467191338628906628', '上大佛寺的', '2017-08-07', '2017-08-08', '3', '胜多负少', '', null, '1', '', '2017-08-06 10:41:55', null);
INSERT INTO `pms_businesstrips` VALUES ('1464451238884279913', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1464590182717354738', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1464623993784484627', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:17', null);
INSERT INTO `pms_businesstrips` VALUES ('1464696177375452001', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:21', null);
INSERT INTO `pms_businesstrips` VALUES ('1464707031611485232', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:11:56', null);
INSERT INTO `pms_businesstrips` VALUES ('1464806463186505697', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:18:03', null);
INSERT INTO `pms_businesstrips` VALUES ('1464902229632655161', '1467191338628906628', '说的', '2017-08-06', '2017-08-07', '3', '上大佛寺的', '', null, '1', '', '2017-08-06 10:46:55', null);
INSERT INTO `pms_businesstrips` VALUES ('1464923562524911088', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:32', null);
INSERT INTO `pms_businesstrips` VALUES ('1464961287705992709', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:27', null);
INSERT INTO `pms_businesstrips` VALUES ('1465148432071053491', '1467191338628906628', '胜多负少', '2017-08-06', '2017-08-07', '3', '电放费', '', null, '1', '', '2017-08-05 22:03:10', null);
INSERT INTO `pms_businesstrips` VALUES ('1465220449513912166', '1467191338628906628', '覆盖', '2017-08-07', '2017-08-09', '4', '设定格式的个', '', null, '1', '', '2017-08-06 10:51:38', null);
INSERT INTO `pms_businesstrips` VALUES ('1465270026246465919', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1465294720249069141', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:20', null);
INSERT INTO `pms_businesstrips` VALUES ('1465427853401763475', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1465441035381187420', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:27', null);
INSERT INTO `pms_businesstrips` VALUES ('1465495576684707995', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1465501019028365366', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:34:05', null);
INSERT INTO `pms_businesstrips` VALUES ('1465519201726785473', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:27', null);
INSERT INTO `pms_businesstrips` VALUES ('1465686652153989116', '1467191338628906628', '胜多负少', '2017-08-06', '2017-08-07', '3', '电放费', '', null, '1', '', '2017-08-05 22:03:09', null);
INSERT INTO `pms_businesstrips` VALUES ('1465691868321773837', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:11:55', null);
INSERT INTO `pms_businesstrips` VALUES ('1465718658616605926', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:02:08', null);
INSERT INTO `pms_businesstrips` VALUES ('1465786081016168416', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:11:56', null);
INSERT INTO `pms_businesstrips` VALUES ('1465863076525560003', '1467191338628906628', '发送到v', '2017-08-10', '2017-08-11', '2', '电风扇地方', '', null, '1', ',103185182969827328', '2017-08-05 22:00:32', null);
INSERT INTO `pms_businesstrips` VALUES ('1465918963957925394', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1466399505135569952', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1466413537760931754', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:34', null);
INSERT INTO `pms_businesstrips` VALUES ('1466418955624424801', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1466485327897175483', '1467191338628906628', '胜多负少', '2017-08-06', '2017-08-07', '3', '电放费', '', null, '1', '', '2017-08-05 22:03:09', null);
INSERT INTO `pms_businesstrips` VALUES ('1466490903038782962', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:11:57', null);
INSERT INTO `pms_businesstrips` VALUES ('1466538093487875223', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:01:51', null);
INSERT INTO `pms_businesstrips` VALUES ('1466583210820410583', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1466644704492794008', '1467191338628906628', '我单位', '2017-08-05', '2017-08-06', '1', '上大佛寺的噶舒服', '', null, '1', '', '2017-08-05 21:43:29', null);
INSERT INTO `pms_businesstrips` VALUES ('1466734682794272237', '1467191338628906628', '大佛寺', '2017-08-06', '2017-08-07', '2', '是否鬼斧神工的感受到', '', null, '1', '', '2017-08-06 10:44:47', null);
INSERT INTO `pms_businesstrips` VALUES ('1466803930180846454', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:15:57', null);
INSERT INTO `pms_businesstrips` VALUES ('1466827817862081736', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:12:13', null);
INSERT INTO `pms_businesstrips` VALUES ('1466948002441990872', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', '', '2017-08-05 22:16:14', null);
INSERT INTO `pms_businesstrips` VALUES ('1466954428052300225', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1467077699308003597', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', '', '2017-08-05 22:16:14', null);
INSERT INTO `pms_businesstrips` VALUES ('1467083197648796911', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:14:48', null);
INSERT INTO `pms_businesstrips` VALUES ('1467103723214381541', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:02:09', null);
INSERT INTO `pms_businesstrips` VALUES ('1467312187298092237', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:18:03', null);
INSERT INTO `pms_businesstrips` VALUES ('1467498935359803673', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:15:58', null);
INSERT INTO `pms_businesstrips` VALUES ('1467537986300787280', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:05:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1467583310715745356', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:15:57', null);
INSERT INTO `pms_businesstrips` VALUES ('1467625568091434574', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1467737710331744727', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1467737953978227028', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:04:14', null);
INSERT INTO `pms_businesstrips` VALUES ('1467799903230104868', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1467922421473538284', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:21', null);
INSERT INTO `pms_businesstrips` VALUES ('1467958286642297271', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1468002073406408898', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:22', null);
INSERT INTO `pms_businesstrips` VALUES ('1468179797828351150', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:34:26', null);
INSERT INTO `pms_businesstrips` VALUES ('1468295413605227003', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:01:47', null);
INSERT INTO `pms_businesstrips` VALUES ('1468366656216659369', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:35', null);
INSERT INTO `pms_businesstrips` VALUES ('1468391288837417188', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:01:51', null);
INSERT INTO `pms_businesstrips` VALUES ('1468397720187657008', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:21', null);
INSERT INTO `pms_businesstrips` VALUES ('1468502583902357105', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 08:57:57', null);
INSERT INTO `pms_businesstrips` VALUES ('1468529112538724234', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:24', null);
INSERT INTO `pms_businesstrips` VALUES ('1468648284946762577', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1468744310777781316', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1468761961190683954', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:19', null);
INSERT INTO `pms_businesstrips` VALUES ('1468835013160718674', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:28', null);
INSERT INTO `pms_businesstrips` VALUES ('1468855373805023490', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:38', null);
INSERT INTO `pms_businesstrips` VALUES ('1468924770936738072', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:23:00', null);
INSERT INTO `pms_businesstrips` VALUES ('1468942031012003742', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', '', '2017-08-05 22:16:14', null);
INSERT INTO `pms_businesstrips` VALUES ('1468987830203959607', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:15:58', null);
INSERT INTO `pms_businesstrips` VALUES ('1469022274746673585', '1467191338628906628', '胜多负少', '2017-08-06', '2017-08-07', '3', '电放费', '', null, '1', '', '2017-08-05 22:03:09', null);
INSERT INTO `pms_businesstrips` VALUES ('1469056075375159830', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1469079635169076417', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:27', null);
INSERT INTO `pms_businesstrips` VALUES ('1469083537237139761', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:18', null);
INSERT INTO `pms_businesstrips` VALUES ('1469139949293959375', '1467191338628906628', '胜多负少', '2017-08-06', '2017-08-07', '3', '电放费', '', null, '1', '', '2017-08-05 22:03:08', null);
INSERT INTO `pms_businesstrips` VALUES ('1469203011357011329', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1469254474495556607', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:18:02', null);
INSERT INTO `pms_businesstrips` VALUES ('1469271378906112230', '1467191338628906628', '', '2017-08-09', '', null, '', '', null, '1', '', '2017-08-05 22:14:48', null);
INSERT INTO `pms_businesstrips` VALUES ('1469315064025147276', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:27:37', null);
INSERT INTO `pms_businesstrips` VALUES ('1469335956861616771', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:17', null);
INSERT INTO `pms_businesstrips` VALUES ('1469344634629608254', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:18:03', null);
INSERT INTO `pms_businesstrips` VALUES ('1469434437018307715', '1467191338628906628', '大佛寺', '2017-08-07', '2017-08-09', '2', 'vsdgds', '', null, '1', '', '2017-08-05 22:01:51', null);
INSERT INTO `pms_businesstrips` VALUES ('1469474521530192473', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:11:56', null);
INSERT INTO `pms_businesstrips` VALUES ('1469625259097660871', '1467191338628906628', 'etw', '2017-08-09', '2017-08-10', '3', 'fgdg', '', null, '1', '', '2017-08-05 22:35:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1469630137547973077', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-05 22:33:44', null);
INSERT INTO `pms_businesstrips` VALUES ('1469715580445924851', '1467191338628906628', '大佛寺', '2017-08-06', '2017-08-07', '2', '是否鬼斧神工的感受到', '', null, '1', '', '2017-08-06 10:46:39', null);
INSERT INTO `pms_businesstrips` VALUES ('1469764931330885923', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:23', null);
INSERT INTO `pms_businesstrips` VALUES ('1469790402329380565', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:28', null);
INSERT INTO `pms_businesstrips` VALUES ('1469847355173210613', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:27', null);
INSERT INTO `pms_businesstrips` VALUES ('1469906876625836814', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:19', null);
INSERT INTO `pms_businesstrips` VALUES ('1469939209739306556', '1467191338628906628', '', '', '', null, '', '', null, '1', '', '2017-08-06 09:42:34', null);
INSERT INTO `pms_businesstrips` VALUES ('1469997194999246115', '1467191338628906628', '水电费的说法', '2017-08-09', '2017-08-09', '1', '摄氏度是否', '', null, '1', ',1467191338628906628', '2017-08-05 22:16:19', null);

-- ----------------------------
-- Table structure for `pms_businesstrips_approver`
-- ----------------------------
DROP TABLE IF EXISTS `pms_businesstrips_approver`;
CREATE TABLE `pms_businesstrips_approver` (
  `approverid` bigint(20) NOT NULL,
  `businesstripid` bigint(20) DEFAULT NULL COMMENT '出差表ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '审批人Userid',
  `summary` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`approverid`),
  KEY `INDEX_LUSC` (`businesstripid`,`userid`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出差审批人表';

-- ----------------------------
-- Records of pms_businesstrips_approver
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_checkworks`
-- ----------------------------
DROP TABLE IF EXISTS `pms_checkworks`;
CREATE TABLE `pms_checkworks` (
  `checkid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `clock` time DEFAULT NULL COMMENT '打卡时间',
  `type` int(1) DEFAULT NULL COMMENT '1正常2迟到3早退4加班',
  `ip` varchar(20) DEFAULT NULL,
  `created` date DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`checkid`),
  KEY `INDEX_UTC` (`userid`,`type`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤打卡表';

-- ----------------------------
-- Records of pms_checkworks
-- ----------------------------
INSERT INTO `pms_checkworks` VALUES ('10000000001', '1464908736964868544', '07:57:21', '1', '127.0.0.1', '2017-07-28');
INSERT INTO `pms_checkworks` VALUES ('17080215344477', '1464908736964868544', '08:34:44', '2', '127.0.0.1', '2017-08-02');
INSERT INTO `pms_checkworks` VALUES ('17080413102876', '1464908736964868544', '13:10:29', '2', '127.0.0.1', '2017-08-04');
INSERT INTO `pms_checkworks` VALUES ('17080615282963', '1464908736964868544', '15:28:29', '2', '127.0.0.1', '2017-08-06');
INSERT INTO `pms_checkworks` VALUES ('17080719010863', '1464908736964868544', '19:00:42', '2', '127.0.0.1', '2017-08-07');
INSERT INTO `pms_checkworks` VALUES ('170728171717390', '1464908736964868544', '17:17:17', '4', '127.0.0.1', '2017-07-28');
INSERT INTO `pms_checkworks` VALUES ('170729202275434', '1464908736964868544', '07:09:45', '1', '127.0.0.1', '2017-07-29');
INSERT INTO `pms_checkworks` VALUES ('170730100443436', '1464908736964868544', '10:04:43', '2', '127.0.0.1', '2017-07-30');
INSERT INTO `pms_checkworks` VALUES ('170730100567219', '1464908736964868544', '16:11:07', '3', '127.0.0.1', '2017-07-30');
INSERT INTO `pms_checkworks` VALUES ('170731214803635', '1464908736964868544', '07:48:02', '1', '127.0.0.1', '2017-07-31');
INSERT INTO `pms_checkworks` VALUES ('170731222106547', '1464908736964868544', '22:21:05', '4', '127.0.0.1', '2017-07-31');
INSERT INTO `pms_checkworks` VALUES ('170802155659620', '1464908736964868544', '15:57:00', '3', '127.0.0.1', '2017-08-02');
INSERT INTO `pms_checkworks` VALUES ('170803103049615', '1464908736964868544', '10:30:48', '2', '127.0.0.1', '2017-08-03');
INSERT INTO `pms_checkworks` VALUES ('170804132036641', '1464908736964868544', '13:20:36', '3', '127.0.0.1', '2017-08-04');
INSERT INTO `pms_checkworks` VALUES ('170805172253525', '1464908736964868544', '17:22:53', '2', '127.0.0.1', '2017-08-05');
INSERT INTO `pms_checkworks` VALUES ('170805200822416', '1464908736964868544', '20:08:23', '4', '127.0.0.1', '2017-08-05');
INSERT INTO `pms_checkworks` VALUES ('170806155327588', '1464908736964868544', '15:53:28', '3', '127.0.0.1', '2017-08-06');
INSERT INTO `pms_checkworks` VALUES ('170806223116685', '1461312703628858832', '22:31:16', '2', '127.0.0.1', '2017-08-06');
INSERT INTO `pms_checkworks` VALUES ('170807193802547', '1465774726292743771', '19:38:02', '2', '127.0.0.1', '2017-08-07');
INSERT INTO `pms_checkworks` VALUES ('170807193835223', '1465774726292743771', '19:38:35', '4', '127.0.0.1', '2017-08-07');

-- ----------------------------
-- Table structure for `pms_departs`
-- ----------------------------
DROP TABLE IF EXISTS `pms_departs`;
CREATE TABLE `pms_departs` (
  `departid` bigint(20) NOT NULL COMMENT '部门ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  PRIMARY KEY (`departid`),
  KEY `INDEX_NS` (`name`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of pms_departs
-- ----------------------------
INSERT INTO `pms_departs` VALUES ('1462290164626094232', '运营部', '运营部运营部运营部运营部运dfgsgsdgd', '2');
INSERT INTO `pms_departs` VALUES ('1462290199274575028', '市场部', '前端销售，后端销售，商务组', '1');
INSERT INTO `pms_departs` VALUES ('1462290127694985332', '研发部', '研发部，GO组，PHP组，UI组', '1');
INSERT INTO `pms_departs` VALUES ('1462290228639093428', '行政部', '日常后勤，人事', '1');
INSERT INTO `pms_departs` VALUES ('1462290248393045132', '财务部', '掌管经济大权', '1');
INSERT INTO `pms_departs` VALUES ('1465611154090252951', '人事部', '人事分配', '1');

-- ----------------------------
-- Table structure for `pms_expenses`
-- ----------------------------
DROP TABLE IF EXISTS `pms_expenses`;
CREATE TABLE `pms_expenses` (
  `expenseid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `amounts` varchar(10) NOT NULL COMMENT '报销金额json',
  `types` varchar(200) DEFAULT NULL COMMENT '明细类型json',
  `contents` varchar(1000) DEFAULT NULL COMMENT '明细json',
  `total` varchar(8) DEFAULT NULL COMMENT '总金额',
  `picture` varchar(100) DEFAULT NULL COMMENT '1同',
  `result` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `status` int(1) DEFAULT '1' COMMENT '1草稿2正常发布',
  `approverids` varchar(200) DEFAULT NULL COMMENT '审批人串',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`expenseid`),
  KEY `INDEX_UTRSC` (`userid`,`types`,`result`,`status`,`created`,`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销表';

-- ----------------------------
-- Records of pms_expenses
-- ----------------------------
INSERT INTO `pms_expenses` VALUES ('31641813', '1467191338628906628', '45', '什么东西', '20', '202', null, null, '2', '2525535', '2017-07-31 20:35:20', null);
INSERT INTO `pms_expenses` VALUES ('1460146775613621260', '1467191338628906628', '5', '5', '56', '5', '', null, '1', ',103185182969827328', '2017-08-05 20:30:22', '2017-08-06 09:48:11');
INSERT INTO `pms_expenses` VALUES ('1460290696029470718', '1467191338628906628', '3,432', '43,供电公司', '十多个地方,手动阀', '435', '', null, '1', ',65140463652311040', '2017-08-05 19:54:09', '2017-08-05 21:55:19');
INSERT INTO `pms_expenses` VALUES ('1461803109720963289', '1467191338628906628', '662,7711', '66,7723', '66113,11122双方父', '8373', '', null, '1', ',103185182969827328', '2017-08-04 16:36:13', '2017-08-06 10:22:55');
INSERT INTO `pms_expenses` VALUES ('1462151518500866883', '1467191338628906628', '3', '3343', '3', '3', '', null, '1', '', '2017-08-05 20:19:18', null);
INSERT INTO `pms_expenses` VALUES ('1462238907065827045', '1467191338628906628', '2', '2', '2', '2', '', null, '1', '', '2017-08-05 20:25:08', null);
INSERT INTO `pms_expenses` VALUES ('1462583229997050742', '1467191338628906628', '3', '3', '3', '3', '', null, '1', ',103185182969827328', '2017-08-05 20:19:57', null);
INSERT INTO `pms_expenses` VALUES ('1462650022190653627', '1467191338628906628', '34', '鬼地方个地方', 'SD敢达', '34', '', null, '1', '', '2017-08-05 19:55:36', null);
INSERT INTO `pms_expenses` VALUES ('1463341557348355231', '1467191338628906628', '100', '报销类型', '报销明细', '100', 'C:\\fakepath\\300296.jpg', null, '1', ',103185182969827328', '2017-08-05 20:06:18', null);
INSERT INTO `pms_expenses` VALUES ('1463860889975830512', '1467191338628906628', '1', '2', '3', '100', '', null, '2', ',65140463652311040', '2017-08-03 21:03:21', '2017-08-03 21:52:11');
INSERT INTO `pms_expenses` VALUES ('1464694130283036696', '1464908736964868544', '1,2', '1,2', '1,3', '3', '', null, '2', ',103185182969827328', '2017-08-07 10:15:10', '2017-08-07 10:15:21');
INSERT INTO `pms_expenses` VALUES ('1464976049673259402', '1467191338628906628', '3,22,1', '3,22,1', '3,22,1', '26', '', null, '2', '', '2017-08-03 21:35:51', '2017-08-04 15:36:04');
INSERT INTO `pms_expenses` VALUES ('1465368921439736160', '1467191338628906628', '6', '6', '6', '6', '', null, '1', '', '2017-08-06 10:57:40', null);
INSERT INTO `pms_expenses` VALUES ('1465379618345028016', '1467191338628906628', '4', '4', '4', '4', '', null, '1', '', '2017-08-05 21:39:23', null);
INSERT INTO `pms_expenses` VALUES ('1465525796599819286', '1467191338628906628', '3', '3', '4', '3', '', null, '1', '', '2017-08-05 20:20:35', null);
INSERT INTO `pms_expenses` VALUES ('1465529697096958786', '1467191338628906628', '23', '32', '23', '23', '', null, '1', '', '2017-08-05 20:15:24', null);
INSERT INTO `pms_expenses` VALUES ('1465550936341470138', '1467191338628906628', '7', '7', '7', '7', '', null, '1', '', '2017-08-05 20:32:00', null);
INSERT INTO `pms_expenses` VALUES ('1466244919728391948', '1467191338628906628', '55', '55', '55', '55', '', null, '1', '', '2017-08-05 20:24:34', null);
INSERT INTO `pms_expenses` VALUES ('1466572326512398776', '1467191338628906628', '3', '3', '3', '3', '', null, '1', '', '2017-08-06 10:25:54', null);
INSERT INTO `pms_expenses` VALUES ('1466784611229535642', '1467191338628906628', '5,6', '5,6', '5,6', '11', '', null, '1', ',102414050503168000', '2017-08-05 20:23:20', null);
INSERT INTO `pms_expenses` VALUES ('1466823433854989490', '1467191338628906628', '25,62', '采购,采购', '鸡蛋,火腿', '87', '', null, '2', ',102414050503168000', '2017-08-03 21:14:02', '2017-08-04 15:36:11');
INSERT INTO `pms_expenses` VALUES ('1466902277963574028', '1467191338628906628', '1', '1', '1', '1', '', null, '1', '', '2017-08-05 20:11:46', null);
INSERT INTO `pms_expenses` VALUES ('1467095050219251002', '1467191338628906628', '324', '电风扇地方', '三分大赛的', '324', '', null, '1', '', '2017-08-05 20:13:59', null);
INSERT INTO `pms_expenses` VALUES ('1467154477301895209', '1467191338628906628', '2', '232', '2', '2', '', null, '1', '', '2017-08-05 20:18:06', null);
INSERT INTO `pms_expenses` VALUES ('1467597055443761322', '1467191338628906628', '2', '232', '2', '2', '', null, '1', '', '2017-08-03 22:24:29', null);
INSERT INTO `pms_expenses` VALUES ('1468448634401731474', '1467191338628906628', '4', '4', '4', '4', '', null, '1', ',65140463652311040', '2017-08-03 21:37:18', null);
INSERT INTO `pms_expenses` VALUES ('1469324082862882308', '1467191338628906628', '3', '3', '3', '3', '', null, '1', '', '2017-08-05 20:28:11', null);
INSERT INTO `pms_expenses` VALUES ('1469670972683809916', '1467191338628906628', '5', '5', '5', '5', '', null, '1', '', '2017-08-05 20:21:22', null);
INSERT INTO `pms_expenses` VALUES ('1469833411276533249', '1467191338628906628', '', '', '', '0', '', null, '1', '', '2017-08-06 09:53:20', null);

-- ----------------------------
-- Table structure for `pms_expenses_approver`
-- ----------------------------
DROP TABLE IF EXISTS `pms_expenses_approver`;
CREATE TABLE `pms_expenses_approver` (
  `approverid` bigint(20) NOT NULL,
  `expenseid` bigint(20) DEFAULT NULL COMMENT '报销表ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '审批人Userid',
  `summary` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`approverid`),
  KEY `INDEX_LUSC` (`expenseid`,`userid`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销审批人表';

-- ----------------------------
-- Records of pms_expenses_approver
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_goouts`
-- ----------------------------
DROP TABLE IF EXISTS `pms_goouts`;
CREATE TABLE `pms_goouts` (
  `gooutid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '请假人',
  `started` datetime DEFAULT NULL COMMENT '开始时间',
  `ended` datetime DEFAULT NULL COMMENT '结束时间',
  `hours` float DEFAULT NULL COMMENT '外出小时数',
  `reason` varchar(500) DEFAULT NULL COMMENT '原因',
  `picture` varchar(100) DEFAULT NULL COMMENT '图片',
  `result` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `status` int(1) DEFAULT '1' COMMENT '1草稿2正常发布',
  `approverids` varchar(200) DEFAULT NULL COMMENT '审批人串',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`gooutid`),
  KEY `INDEX_UTC` (`userid`,`created`,`changed`,`result`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外出表';

-- ----------------------------
-- Records of pms_goouts
-- ----------------------------
INSERT INTO `pms_goouts` VALUES ('315461315', '1467191338628906628', '2017-08-05 12:08:13', '2017-08-05 15:08:17', '6', '出去吃饭', null, null, '2', null, '2017-08-05 11:09:06', null);
INSERT INTO `pms_goouts` VALUES ('1460565645933661153', '1467191338628906628', '2017-08-05 14:25:00', '2017-08-05 18:40:00', '4', '朋友来了，陪一下', '', null, '1', ',103185182969827328', '2017-08-05 14:49:08', '2017-08-05 15:53:41');
INSERT INTO `pms_goouts` VALUES ('1463830015673878902', '1467191338628906628', '2017-08-10 14:30:00', '2017-08-08 14:20:00', '3', '大幅度发送', '', null, '2', ',1469024587469707428', '2017-08-05 14:50:57', null);

-- ----------------------------
-- Table structure for `pms_goouts_approver`
-- ----------------------------
DROP TABLE IF EXISTS `pms_goouts_approver`;
CREATE TABLE `pms_goouts_approver` (
  `approverid` bigint(20) NOT NULL,
  `gooutid` bigint(20) DEFAULT NULL COMMENT '请假表ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '审批人Userid',
  `summary` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`approverid`),
  KEY `INDEX_LUSC` (`gooutid`,`userid`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外出审批人表';

-- ----------------------------
-- Records of pms_goouts_approver
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_groups`
-- ----------------------------
DROP TABLE IF EXISTS `pms_groups`;
CREATE TABLE `pms_groups` (
  `groupid` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL COMMENT '组名称',
  `summary` varchar(500) DEFAULT NULL COMMENT '组描述',
  `created` datetime(6) DEFAULT NULL,
  `changed` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`groupid`),
  KEY `INDEX_NCC` (`name`,`created`,`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组成员表';

-- ----------------------------
-- Records of pms_groups
-- ----------------------------
INSERT INTO `pms_groups` VALUES ('170808161527618', '研发部门经理', '拥有研发部的管理权限', '2017-08-08 16:16:03.000000', null);
INSERT INTO `pms_groups` VALUES ('170808165725664', '行政部门经理', '拥有行政部的管理权限\n', '2017-08-08 16:58:03.000000', null);
INSERT INTO `pms_groups` VALUES ('170808165858288', '行政', ' 拥有普通行政员工权限', '2017-08-08 16:59:34.000000', null);
INSERT INTO `pms_groups` VALUES ('170812094702973', '人事部门经理', '负责人事管理的一切事物', '2017-08-12 09:47:31.000000', null);
INSERT INTO `pms_groups` VALUES ('37623600177483776', '管理员', '系统管理员', null, '2017-08-08 15:39:45.000000');
INSERT INTO `pms_groups` VALUES ('1468755197309162133', '其他', '普通员工', null, null);
INSERT INTO `pms_groups` VALUES ('1468755197309162134', '产品', '产品经理', null, null);
INSERT INTO `pms_groups` VALUES ('1468755197309162135', '研发', '技术人员', null, null);
INSERT INTO `pms_groups` VALUES ('1468755197309162136', '高层管理', '公司高层', null, null);

-- ----------------------------
-- Table structure for `pms_groups_permission`
-- ----------------------------
DROP TABLE IF EXISTS `pms_groups_permission`;
CREATE TABLE `pms_groups_permission` (
  `id` bigint(20) NOT NULL,
  `groupid` bigint(20) DEFAULT NULL,
  `permissionid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_GP` (`groupid`,`permissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组权限表';

-- ----------------------------
-- Records of pms_groups_permission
-- ----------------------------
INSERT INTO `pms_groups_permission` VALUES ('1464104946921180054', '170808161527618', '41969113630773248');
INSERT INTO `pms_groups_permission` VALUES ('1466341556967553246', '170808161527618', '41969192357859328');
INSERT INTO `pms_groups_permission` VALUES ('1468413167775223759', '170808161527618', '41969252499984384');
INSERT INTO `pms_groups_permission` VALUES ('1460237449979643617', '170808161527618', '41976726762295296');
INSERT INTO `pms_groups_permission` VALUES ('1463719170489882996', '170808161527618', '41976831846387712');
INSERT INTO `pms_groups_permission` VALUES ('1465078846798820353', '170808161527618', '41976904223297536');
INSERT INTO `pms_groups_permission` VALUES ('1467930924780538140', '170808161527618', '41977259501817856');
INSERT INTO `pms_groups_permission` VALUES ('1461220075280155404', '170808161527618', '41977400967303168');
INSERT INTO `pms_groups_permission` VALUES ('1465197241263081936', '170808161527618', '41977528792911872');
INSERT INTO `pms_groups_permission` VALUES ('1468986370069229620', '170808161527618', '41977654831747072');
INSERT INTO `pms_groups_permission` VALUES ('1462452790712168959', '170808161527618', '41977734154424320');
INSERT INTO `pms_groups_permission` VALUES ('1461434945123250285', '170808161527618', '41977922247987200');
INSERT INTO `pms_groups_permission` VALUES ('1462355542349933835', '170808161527618', '41978045921234944');
INSERT INTO `pms_groups_permission` VALUES ('1462009623200957785', '170808161527618', '41978134387494912');
INSERT INTO `pms_groups_permission` VALUES ('1460176587471606484', '170808161527618', '41978216994312192');
INSERT INTO `pms_groups_permission` VALUES ('1462278863520924806', '170808161527618', '41978289807429632');
INSERT INTO `pms_groups_permission` VALUES ('1464044875633575196', '170808161527618', '41978468690300928');
INSERT INTO `pms_groups_permission` VALUES ('1467966438659871959', '170808161527618', '41978566618910720');
INSERT INTO `pms_groups_permission` VALUES ('1468908124875778952', '170808161527618', '41978664295862272');
INSERT INTO `pms_groups_permission` VALUES ('1463056574985639374', '170808161527618', '41978754309820416');
INSERT INTO `pms_groups_permission` VALUES ('1469846076012458820', '170808161527618', '41980651519348736');
INSERT INTO `pms_groups_permission` VALUES ('1464828335415209719', '170808161527618', '41980770788577280');
INSERT INTO `pms_groups_permission` VALUES ('1464493254419685129', '170808161527618', '42334265874059264');
INSERT INTO `pms_groups_permission` VALUES ('1462670397035038000', '170808161527618', '42334379363536896');
INSERT INTO `pms_groups_permission` VALUES ('1462600956915998880', '170808161527618', '42334463782293504');
INSERT INTO `pms_groups_permission` VALUES ('1467600809434963761', '170808161527618', '42334539376234496');
INSERT INTO `pms_groups_permission` VALUES ('1466429815888437289', '170808161527618', '42334628953985024');
INSERT INTO `pms_groups_permission` VALUES ('1464311027878726538', '170808161527618', '42334838946009088');
INSERT INTO `pms_groups_permission` VALUES ('1461786510436783847', '170808161527618', '42334976082972672');
INSERT INTO `pms_groups_permission` VALUES ('1463803294372836999', '170808161527618', '42335081259339776');
INSERT INTO `pms_groups_permission` VALUES ('1467246207491796795', '170808161527618', '42335209235943424');
INSERT INTO `pms_groups_permission` VALUES ('1466950133260609105', '170808161527618', '42335311539212288');
INSERT INTO `pms_groups_permission` VALUES ('1465833516009597897', '170808161527618', '42335402681438208');
INSERT INTO `pms_groups_permission` VALUES ('1460654572693819262', '170808161527618', '42335721133969408');
INSERT INTO `pms_groups_permission` VALUES ('1469247953374152941', '170808161527618', '42335817183531008');
INSERT INTO `pms_groups_permission` VALUES ('1465619349843866236', '170808161527618', '42335940605120512');
INSERT INTO `pms_groups_permission` VALUES ('1460204155424732756', '170808161527618', '42336024805773312');
INSERT INTO `pms_groups_permission` VALUES ('1465068800078819450', '170808161527618', '42336123501940736');
INSERT INTO `pms_groups_permission` VALUES ('1462805451765013029', '170808161527618', '42336206301696000');
INSERT INTO `pms_groups_permission` VALUES ('1463573127883036571', '170808161527618', '42336271770587136');
INSERT INTO `pms_groups_permission` VALUES ('1464766866746927715', '170808161527618', '42336347972702208');
INSERT INTO `pms_groups_permission` VALUES ('1464704858190814326', '170808161527618', '42336433490366464');
INSERT INTO `pms_groups_permission` VALUES ('1466881082652990548', '170808161527618', '42336599123431424');
INSERT INTO `pms_groups_permission` VALUES ('1463890068961775720', '170808161527618', '42336697060429824');
INSERT INTO `pms_groups_permission` VALUES ('1466637970820916282', '170808161527618', '42336773992353792');
INSERT INTO `pms_groups_permission` VALUES ('1468812243008527450', '170808161527618', '42336853726072832');
INSERT INTO `pms_groups_permission` VALUES ('1461159307701480776', '170808161527618', '42336946441162752');
INSERT INTO `pms_groups_permission` VALUES ('1464735550577203896', '170808161527618', '42337029878452224');
INSERT INTO `pms_groups_permission` VALUES ('1462576772065574141', '170808161527618', '42337132236247040');
INSERT INTO `pms_groups_permission` VALUES ('1467350267368753049', '170808161527618', '42337204650905600');
INSERT INTO `pms_groups_permission` VALUES ('1460114532350369060', '170808161527618', '42337301711294464');
INSERT INTO `pms_groups_permission` VALUES ('1466299314371660131', '170808161527618', '42337378299285504');
INSERT INTO `pms_groups_permission` VALUES ('1462349921479015451', '170808161527618', '42337629286436864');
INSERT INTO `pms_groups_permission` VALUES ('1463368914277932854', '170808161527618', '42337745028255744');
INSERT INTO `pms_groups_permission` VALUES ('1461792125446517124', '170808161527618', '42337817904287744');
INSERT INTO `pms_groups_permission` VALUES ('1466166943233198859', '170808161527618', '42338384647032832');
INSERT INTO `pms_groups_permission` VALUES ('1469622654678962280', '170808161527618', '42338452590563328');
INSERT INTO `pms_groups_permission` VALUES ('1461853791640107199', '170808161527618', '42338538640904192');
INSERT INTO `pms_groups_permission` VALUES ('1465388435084862381', '170808161527618', '42338630085120000');
INSERT INTO `pms_groups_permission` VALUES ('1464755626115209034', '170808161527618', '42338743775924224');
INSERT INTO `pms_groups_permission` VALUES ('1463619108971670538', '170808161527618', '42338936218980352');
INSERT INTO `pms_groups_permission` VALUES ('1467437692574370314', '170808161527618', '42339022474842112');
INSERT INTO `pms_groups_permission` VALUES ('1465855769045893182', '170808161527618', '42339129958076416');
INSERT INTO `pms_groups_permission` VALUES ('1464497798385446699', '170808161527618', '42339223352643584');
INSERT INTO `pms_groups_permission` VALUES ('1461883874612985481', '170808161527618', '64738735329120256');
INSERT INTO `pms_groups_permission` VALUES ('1460424754167808059', '170808161527618', '64739027659526144');
INSERT INTO `pms_groups_permission` VALUES ('1469825055677479188', '170808161527618', '64739308640145408');
INSERT INTO `pms_groups_permission` VALUES ('1466494026309590867', '170808161527618', '64739380002033664');
INSERT INTO `pms_groups_permission` VALUES ('1468247909508580576', '170808161527618', '64739571354570752');
INSERT INTO `pms_groups_permission` VALUES ('1466654749614482764', '170808161527618', '64739781774413824');
INSERT INTO `pms_groups_permission` VALUES ('1462282549711825159', '170808161527618', '64739963341639680');
INSERT INTO `pms_groups_permission` VALUES ('1469456277571890894', '170808161527618', '64740034804191232');
INSERT INTO `pms_groups_permission` VALUES ('1467494388180585688', '170808161527618', '64740129687736320');
INSERT INTO `pms_groups_permission` VALUES ('1469968757309440820', '170808161527618', '64740203201302528');
INSERT INTO `pms_groups_permission` VALUES ('1462774256452237797', '170808161527618', '64740359808225280');
INSERT INTO `pms_groups_permission` VALUES ('1464190392554273214', '170808161527618', '64809905348939776');
INSERT INTO `pms_groups_permission` VALUES ('1465409820924142989', '170808161527618', '64815327690625024');
INSERT INTO `pms_groups_permission` VALUES ('1460251491911219597', '170808161527618', '65140829198487552');
INSERT INTO `pms_groups_permission` VALUES ('1468413805680222133', '170808161527618', '65140900749119488');
INSERT INTO `pms_groups_permission` VALUES ('1463703215245804869', '170808165725664', '41980651519348736');
INSERT INTO `pms_groups_permission` VALUES ('1460879935321283952', '170808165725664', '41980770788577280');
INSERT INTO `pms_groups_permission` VALUES ('1467484853440744192', '170808165725664', '42334265874059264');
INSERT INTO `pms_groups_permission` VALUES ('1464892560769915555', '170808165725664', '42334379363536896');
INSERT INTO `pms_groups_permission` VALUES ('1463161430906644534', '170808165725664', '42334463782293504');
INSERT INTO `pms_groups_permission` VALUES ('1467818161307297784', '170808165725664', '42334539376234496');
INSERT INTO `pms_groups_permission` VALUES ('1467479800127868026', '170808165725664', '42334838946009088');
INSERT INTO `pms_groups_permission` VALUES ('1468717020127026940', '170808165725664', '42334976082972672');
INSERT INTO `pms_groups_permission` VALUES ('1465126597307243440', '170808165725664', '42335081259339776');
INSERT INTO `pms_groups_permission` VALUES ('1467245543165155777', '170808165725664', '42335209235943424');
INSERT INTO `pms_groups_permission` VALUES ('1466628498600795994', '170808165725664', '42335402681438208');
INSERT INTO `pms_groups_permission` VALUES ('1463347486393084686', '170808165725664', '42335721133969408');
INSERT INTO `pms_groups_permission` VALUES ('1464092961704542193', '170808165725664', '42335817183531008');
INSERT INTO `pms_groups_permission` VALUES ('1462110705277360361', '170808165725664', '42335940605120512');
INSERT INTO `pms_groups_permission` VALUES ('1460971710004167149', '170808165725664', '42336123501940736');
INSERT INTO `pms_groups_permission` VALUES ('1464429042136731230', '170808165725664', '42336206301696000');
INSERT INTO `pms_groups_permission` VALUES ('1466014440189607985', '170808165725664', '42336271770587136');
INSERT INTO `pms_groups_permission` VALUES ('1465235670897859314', '170808165725664', '42336347972702208');
INSERT INTO `pms_groups_permission` VALUES ('1461627510144039370', '170808165725664', '42336599123431424');
INSERT INTO `pms_groups_permission` VALUES ('1462024210153741596', '170808165725664', '42336697060429824');
INSERT INTO `pms_groups_permission` VALUES ('1462080657580349915', '170808165725664', '42336773992353792');
INSERT INTO `pms_groups_permission` VALUES ('1460413229498727453', '170808165725664', '42336853726072832');
INSERT INTO `pms_groups_permission` VALUES ('1468083378442131917', '170808165725664', '42337029878452224');
INSERT INTO `pms_groups_permission` VALUES ('1464874269299284667', '170808165725664', '42337132236247040');
INSERT INTO `pms_groups_permission` VALUES ('1468036011572494036', '170808165725664', '42337204650905600');
INSERT INTO `pms_groups_permission` VALUES ('1468746944896915902', '170808165725664', '42337301711294464');
INSERT INTO `pms_groups_permission` VALUES ('1466218498133706344', '170808165725664', '42337629286436864');
INSERT INTO `pms_groups_permission` VALUES ('1463276756803264853', '170808165725664', '42337745028255744');
INSERT INTO `pms_groups_permission` VALUES ('1464855845955161540', '170808165725664', '42337817904287744');
INSERT INTO `pms_groups_permission` VALUES ('1466478916301473127', '170808165725664', '42338384647032832');
INSERT INTO `pms_groups_permission` VALUES ('1463003234275542902', '170808165725664', '42338452590563328');
INSERT INTO `pms_groups_permission` VALUES ('1465318547541893194', '170808165725664', '42338538640904192');
INSERT INTO `pms_groups_permission` VALUES ('1462857086104752160', '170808165725664', '42338630085120000');
INSERT INTO `pms_groups_permission` VALUES ('1461348032458610538', '170808165725664', '42338743775924224');
INSERT INTO `pms_groups_permission` VALUES ('1468691944795433898', '170808165725664', '42354812125188096');
INSERT INTO `pms_groups_permission` VALUES ('1464992836165662559', '170808165725664', '42354905771413112');
INSERT INTO `pms_groups_permission` VALUES ('1460998041451853257', '170808165725664', '42354988550197248');
INSERT INTO `pms_groups_permission` VALUES ('1468709008402257128', '170808165725664', '42355171505737728');
INSERT INTO `pms_groups_permission` VALUES ('1464857457397296982', '170808165725664', '42355325336031232');
INSERT INTO `pms_groups_permission` VALUES ('1464509786073273425', '170808165725664', '42355402511224832');
INSERT INTO `pms_groups_permission` VALUES ('1462131846934990123', '170808165725664', '42355510552301568');
INSERT INTO `pms_groups_permission` VALUES ('1463629115304266712', '170808165725664', '42355596724277248');
INSERT INTO `pms_groups_permission` VALUES ('1462660819175917289', '170808165725664', '42355693625282560');
INSERT INTO `pms_groups_permission` VALUES ('1464410383675620216', '170808165725664', '42355773019262976');
INSERT INTO `pms_groups_permission` VALUES ('1468928142393994703', '170808165725664', '42355862622179328');
INSERT INTO `pms_groups_permission` VALUES ('1463609270579963769', '170808165725664', '42355935212998656');
INSERT INTO `pms_groups_permission` VALUES ('1466634241119661121', '170808165725664', '42356020873269248');
INSERT INTO `pms_groups_permission` VALUES ('1466324420626451920', '170808165725664', '42356198170693632');
INSERT INTO `pms_groups_permission` VALUES ('1465501649627089246', '170808165725664', '42356266030338048');
INSERT INTO `pms_groups_permission` VALUES ('1462172442057582993', '170808165725664', '64059892574457856');
INSERT INTO `pms_groups_permission` VALUES ('1461626616881999698', '170808165725664', '64059999378214912');
INSERT INTO `pms_groups_permission` VALUES ('1460560646100981246', '170808165725664', '64060145163833344');
INSERT INTO `pms_groups_permission` VALUES ('1462204012527676111', '170808165725664', '64060216546693120');
INSERT INTO `pms_groups_permission` VALUES ('1467498737209688787', '170808165725664', '64060546483228672');
INSERT INTO `pms_groups_permission` VALUES ('1465239810105482166', '170808165725664', '64060742327865344');
INSERT INTO `pms_groups_permission` VALUES ('1466072958275454601', '170808165725664', '64060871856361472');
INSERT INTO `pms_groups_permission` VALUES ('1466803603877927544', '170808165725664', '64060949748781056');
INSERT INTO `pms_groups_permission` VALUES ('1465407974144256628', '170808165725664', '64061137204809728');
INSERT INTO `pms_groups_permission` VALUES ('1467228897180153399', '170808165725664', '64061220927311872');
INSERT INTO `pms_groups_permission` VALUES ('1466352200830382090', '170808165725664', '64061290498232320');
INSERT INTO `pms_groups_permission` VALUES ('1469921573082597869', '170808165725664', '64061357862948864');
INSERT INTO `pms_groups_permission` VALUES ('1469113708856383536', '170808165725664', '64738735329120256');
INSERT INTO `pms_groups_permission` VALUES ('1461202567325082437', '170808165725664', '65140829198487552');
INSERT INTO `pms_groups_permission` VALUES ('1465375194880669914', '170808165725664', '65140900749119488');
INSERT INTO `pms_groups_permission` VALUES ('1463556013461145406', '170812094702973', '42338936218980352');
INSERT INTO `pms_groups_permission` VALUES ('1468333638359157725', '170812094702973', '42354812125188096');
INSERT INTO `pms_groups_permission` VALUES ('1469454597145208995', '170812094702973', '42354905771413112');
INSERT INTO `pms_groups_permission` VALUES ('1468225225797539126', '170812094702973', '42354988550197248');
INSERT INTO `pms_groups_permission` VALUES ('1463773353873210077', '170812094702973', '42355171505737728');
INSERT INTO `pms_groups_permission` VALUES ('1467766412041019861', '170812094702973', '42355325336031232');
INSERT INTO `pms_groups_permission` VALUES ('1464280901655934323', '170812094702973', '42355402511224832');
INSERT INTO `pms_groups_permission` VALUES ('1464452841333255789', '170812094702973', '42355510552301568');
INSERT INTO `pms_groups_permission` VALUES ('1460287400911322035', '170812094702973', '42355596724277248');
INSERT INTO `pms_groups_permission` VALUES ('1462558560913679618', '170812094702973', '42355693625282560');
INSERT INTO `pms_groups_permission` VALUES ('1462604815565181202', '170812094702973', '42355773019262976');
INSERT INTO `pms_groups_permission` VALUES ('1463377309906091034', '170812094702973', '42355862622179328');
INSERT INTO `pms_groups_permission` VALUES ('1466750823777962997', '170812094702973', '42355935212998656');
INSERT INTO `pms_groups_permission` VALUES ('1461064686117404287', '170812094702973', '42356020873269248');
INSERT INTO `pms_groups_permission` VALUES ('1469164203898520815', '170812094702973', '42356198170693632');
INSERT INTO `pms_groups_permission` VALUES ('1466501123215457684', '170812094702973', '42356266030338048');
INSERT INTO `pms_groups_permission` VALUES ('1464951041130207901', '170812094702973', '64059892574457856');
INSERT INTO `pms_groups_permission` VALUES ('1466259846883485853', '170812094702973', '64059999378214912');
INSERT INTO `pms_groups_permission` VALUES ('1460056971289674807', '170812094702973', '64060145163833344');
INSERT INTO `pms_groups_permission` VALUES ('1460593990685453916', '170812094702973', '64060216546693120');
INSERT INTO `pms_groups_permission` VALUES ('1469509141495302988', '170812094702973', '64060546483228672');
INSERT INTO `pms_groups_permission` VALUES ('1460887346792383447', '170812094702973', '64060742327865344');
INSERT INTO `pms_groups_permission` VALUES ('1460594049751858142', '170812094702973', '64060871856361472');
INSERT INTO `pms_groups_permission` VALUES ('1468426818836084165', '170812094702973', '64060949748781056');
INSERT INTO `pms_groups_permission` VALUES ('1468033203280577548', '170812094702973', '64061137204809728');
INSERT INTO `pms_groups_permission` VALUES ('1467471615645466333', '170812094702973', '64061220927311872');
INSERT INTO `pms_groups_permission` VALUES ('1467831658036567722', '170812094702973', '64061290498232320');
INSERT INTO `pms_groups_permission` VALUES ('1462634405737558200', '170812094702973', '64061357862948864');
INSERT INTO `pms_groups_permission` VALUES ('1466540536904470781', '37623600177483776', '41969113630773248');
INSERT INTO `pms_groups_permission` VALUES ('1464246863888001778', '37623600177483776', '41969192357859328');
INSERT INTO `pms_groups_permission` VALUES ('1461289405178595753', '37623600177483776', '41969252499984384');
INSERT INTO `pms_groups_permission` VALUES ('1463588427473893486', '37623600177483776', '41976726762295296');
INSERT INTO `pms_groups_permission` VALUES ('1461389142480471167', '37623600177483776', '41976831846387712');
INSERT INTO `pms_groups_permission` VALUES ('1464144035608795245', '37623600177483776', '41976904223297536');
INSERT INTO `pms_groups_permission` VALUES ('1461328573835289888', '37623600177483776', '41977259501817856');
INSERT INTO `pms_groups_permission` VALUES ('1469319872981161586', '37623600177483776', '41977400967303168');
INSERT INTO `pms_groups_permission` VALUES ('1469826819306386213', '37623600177483776', '41977528792911872');
INSERT INTO `pms_groups_permission` VALUES ('1463718051956135303', '37623600177483776', '41977654831747072');
INSERT INTO `pms_groups_permission` VALUES ('1466531624092493252', '37623600177483776', '41977734154424320');
INSERT INTO `pms_groups_permission` VALUES ('1468068210796922734', '37623600177483776', '41977922247987200');
INSERT INTO `pms_groups_permission` VALUES ('1469169486338351608', '37623600177483776', '41978045921234944');
INSERT INTO `pms_groups_permission` VALUES ('1469866431842297234', '37623600177483776', '41978134387494912');
INSERT INTO `pms_groups_permission` VALUES ('1461019879695010891', '37623600177483776', '41978216994312192');
INSERT INTO `pms_groups_permission` VALUES ('1465321135256181855', '37623600177483776', '41978289807429632');
INSERT INTO `pms_groups_permission` VALUES ('1465727150395547411', '37623600177483776', '41978468690300928');
INSERT INTO `pms_groups_permission` VALUES ('1461002681061525076', '37623600177483776', '41978566618910720');
INSERT INTO `pms_groups_permission` VALUES ('1463938405544639279', '37623600177483776', '41978664295862272');
INSERT INTO `pms_groups_permission` VALUES ('1460535504430498617', '37623600177483776', '41978754309820416');
INSERT INTO `pms_groups_permission` VALUES ('1468134221428437901', '37623600177483776', '41980651519348736');
INSERT INTO `pms_groups_permission` VALUES ('1469175226694912774', '37623600177483776', '41980770788577280');
INSERT INTO `pms_groups_permission` VALUES ('1469664484065593692', '37623600177483776', '42334265874059264');
INSERT INTO `pms_groups_permission` VALUES ('1466878257560257724', '37623600177483776', '42334379363536896');
INSERT INTO `pms_groups_permission` VALUES ('1466404036945781699', '37623600177483776', '42334463782293504');
INSERT INTO `pms_groups_permission` VALUES ('1462940494561217626', '37623600177483776', '42334539376234496');
INSERT INTO `pms_groups_permission` VALUES ('1467132382807907812', '37623600177483776', '42334628953985024');
INSERT INTO `pms_groups_permission` VALUES ('1465558316917837788', '37623600177483776', '42334838946009088');
INSERT INTO `pms_groups_permission` VALUES ('1465024522760333625', '37623600177483776', '42334976082972672');
INSERT INTO `pms_groups_permission` VALUES ('1464269389861178216', '37623600177483776', '42335081259339776');
INSERT INTO `pms_groups_permission` VALUES ('1461146446910315528', '37623600177483776', '42335209235943424');
INSERT INTO `pms_groups_permission` VALUES ('1467529212676550123', '37623600177483776', '42335311539212288');
INSERT INTO `pms_groups_permission` VALUES ('1461690429063151087', '37623600177483776', '42335402681438208');
INSERT INTO `pms_groups_permission` VALUES ('1460397227333636797', '37623600177483776', '42335721133969408');
INSERT INTO `pms_groups_permission` VALUES ('1467687486625420585', '37623600177483776', '42335817183531008');
INSERT INTO `pms_groups_permission` VALUES ('1468086445101620141', '37623600177483776', '42335940605120512');
INSERT INTO `pms_groups_permission` VALUES ('1460837476654416884', '37623600177483776', '42336024805773312');
INSERT INTO `pms_groups_permission` VALUES ('1462182715442103988', '37623600177483776', '42336123501940736');
INSERT INTO `pms_groups_permission` VALUES ('1464302559836867585', '37623600177483776', '42336206301696000');
INSERT INTO `pms_groups_permission` VALUES ('1466385221218692525', '37623600177483776', '42336271770587136');
INSERT INTO `pms_groups_permission` VALUES ('1468236241422383770', '37623600177483776', '42336347972702208');
INSERT INTO `pms_groups_permission` VALUES ('1460954746379034580', '37623600177483776', '42336433490366464');
INSERT INTO `pms_groups_permission` VALUES ('1467848013948711872', '37623600177483776', '42336599123431424');
INSERT INTO `pms_groups_permission` VALUES ('1468298860564896762', '37623600177483776', '42336697060429824');
INSERT INTO `pms_groups_permission` VALUES ('1466096021754790170', '37623600177483776', '42336773992353792');
INSERT INTO `pms_groups_permission` VALUES ('1469851969582290810', '37623600177483776', '42336853726072832');
INSERT INTO `pms_groups_permission` VALUES ('1462465292571410011', '37623600177483776', '42336946441162752');
INSERT INTO `pms_groups_permission` VALUES ('1469210844660730489', '37623600177483776', '42337029878452224');
INSERT INTO `pms_groups_permission` VALUES ('1468991866985948336', '37623600177483776', '42337132236247040');
INSERT INTO `pms_groups_permission` VALUES ('1468335731670047010', '37623600177483776', '42337204650905600');
INSERT INTO `pms_groups_permission` VALUES ('1466339414427180848', '37623600177483776', '42337301711294464');
INSERT INTO `pms_groups_permission` VALUES ('1467662861033149176', '37623600177483776', '42337378299285504');
INSERT INTO `pms_groups_permission` VALUES ('1460286882343712904', '37623600177483776', '42337629286436864');
INSERT INTO `pms_groups_permission` VALUES ('1467541342201919088', '37623600177483776', '42337745028255744');
INSERT INTO `pms_groups_permission` VALUES ('1469673908039543614', '37623600177483776', '42337817904287744');
INSERT INTO `pms_groups_permission` VALUES ('1462003849735165867', '37623600177483776', '42338384647032832');
INSERT INTO `pms_groups_permission` VALUES ('1460695242958521260', '37623600177483776', '42338452590563328');
INSERT INTO `pms_groups_permission` VALUES ('1463108495782038880', '37623600177483776', '42338538640904192');
INSERT INTO `pms_groups_permission` VALUES ('1465830179974693233', '37623600177483776', '42338630085120000');
INSERT INTO `pms_groups_permission` VALUES ('1469089560749696104', '37623600177483776', '42338743775924224');
INSERT INTO `pms_groups_permission` VALUES ('1460222373884693809', '37623600177483776', '42338936218980352');
INSERT INTO `pms_groups_permission` VALUES ('1460203129039029504', '37623600177483776', '42339022474842112');
INSERT INTO `pms_groups_permission` VALUES ('1461059008865425195', '37623600177483776', '42339129958076416');
INSERT INTO `pms_groups_permission` VALUES ('1467835923882340678', '37623600177483776', '42339223352643584');
INSERT INTO `pms_groups_permission` VALUES ('1460497453741260373', '37623600177483776', '42354812125188096');
INSERT INTO `pms_groups_permission` VALUES ('1467475950983541708', '37623600177483776', '42354905771413112');
INSERT INTO `pms_groups_permission` VALUES ('1461937627698005541', '37623600177483776', '42354988550197248');
INSERT INTO `pms_groups_permission` VALUES ('1460216288566193307', '37623600177483776', '42355171505737728');
INSERT INTO `pms_groups_permission` VALUES ('1460058082011689974', '37623600177483776', '42355325336031232');
INSERT INTO `pms_groups_permission` VALUES ('1464651192468489153', '37623600177483776', '42355402511224832');
INSERT INTO `pms_groups_permission` VALUES ('1462390987717576466', '37623600177483776', '42355510552301568');
INSERT INTO `pms_groups_permission` VALUES ('1467558350165789497', '37623600177483776', '42355596724277248');
INSERT INTO `pms_groups_permission` VALUES ('1464240659430261852', '37623600177483776', '42355693625282560');
INSERT INTO `pms_groups_permission` VALUES ('1466550299336811440', '37623600177483776', '42355773019262976');
INSERT INTO `pms_groups_permission` VALUES ('1467905687382055131', '37623600177483776', '42355862622179328');
INSERT INTO `pms_groups_permission` VALUES ('1469475502528993113', '37623600177483776', '42355935212998656');
INSERT INTO `pms_groups_permission` VALUES ('1462997902910831853', '37623600177483776', '42356020873269248');
INSERT INTO `pms_groups_permission` VALUES ('1464182428055113858', '37623600177483776', '42356198170693632');
INSERT INTO `pms_groups_permission` VALUES ('1469443184161586448', '37623600177483776', '42356266030338048');
INSERT INTO `pms_groups_permission` VALUES ('1462685954508925758', '37623600177483776', '64059892574457856');
INSERT INTO `pms_groups_permission` VALUES ('1464026831179490262', '37623600177483776', '64059999378214912');
INSERT INTO `pms_groups_permission` VALUES ('1461106738001021846', '37623600177483776', '64060145163833344');
INSERT INTO `pms_groups_permission` VALUES ('1469632319322493931', '37623600177483776', '64060216546693120');
INSERT INTO `pms_groups_permission` VALUES ('1466836515032056476', '37623600177483776', '64060546483228672');
INSERT INTO `pms_groups_permission` VALUES ('1465526788853252341', '37623600177483776', '64060742327865344');
INSERT INTO `pms_groups_permission` VALUES ('1469277873348230750', '37623600177483776', '64060871856361472');
INSERT INTO `pms_groups_permission` VALUES ('1463163058352687785', '37623600177483776', '64060949748781056');
INSERT INTO `pms_groups_permission` VALUES ('1466715431648197304', '37623600177483776', '64061137204809728');
INSERT INTO `pms_groups_permission` VALUES ('1465438873879044024', '37623600177483776', '64061220927311872');
INSERT INTO `pms_groups_permission` VALUES ('1463308328811359166', '37623600177483776', '64061290498232320');
INSERT INTO `pms_groups_permission` VALUES ('1465371789108298509', '37623600177483776', '64061357862948864');
INSERT INTO `pms_groups_permission` VALUES ('1467416944662849506', '37623600177483776', '64738735329120256');
INSERT INTO `pms_groups_permission` VALUES ('1464879115710351470', '37623600177483776', '64739027659526144');
INSERT INTO `pms_groups_permission` VALUES ('1465178752902450784', '37623600177483776', '64739308640145408');
INSERT INTO `pms_groups_permission` VALUES ('1460854732196351735', '37623600177483776', '64739380002033664');
INSERT INTO `pms_groups_permission` VALUES ('1461292821639229386', '37623600177483776', '64739571354570752');
INSERT INTO `pms_groups_permission` VALUES ('1465094348419592832', '37623600177483776', '64739781774413824');
INSERT INTO `pms_groups_permission` VALUES ('1460017507809537864', '37623600177483776', '64739963341639680');
INSERT INTO `pms_groups_permission` VALUES ('1460711457556066570', '37623600177483776', '64740034804191232');
INSERT INTO `pms_groups_permission` VALUES ('1468164155039882035', '37623600177483776', '64740129687736320');
INSERT INTO `pms_groups_permission` VALUES ('1465573477688251490', '37623600177483776', '64740203201302528');
INSERT INTO `pms_groups_permission` VALUES ('1469617927026733603', '37623600177483776', '64740359808225280');
INSERT INTO `pms_groups_permission` VALUES ('1464452786043378520', '37623600177483776', '64809905348939776');
INSERT INTO `pms_groups_permission` VALUES ('1463058798615467931', '37623600177483776', '64815327690625024');
INSERT INTO `pms_groups_permission` VALUES ('1468840141754991760', '37623600177483776', '65140829198487552');
INSERT INTO `pms_groups_permission` VALUES ('1468834381945200918', '37623600177483776', '65140900749119488');
INSERT INTO `pms_groups_permission` VALUES ('1461027846249450600', '1468755197309162133', '41980651519348736');
INSERT INTO `pms_groups_permission` VALUES ('1469902540046865400', '1468755197309162133', '42334265874059264');
INSERT INTO `pms_groups_permission` VALUES ('1465869706495503221', '1468755197309162133', '42334379363536896');
INSERT INTO `pms_groups_permission` VALUES ('1462403140094972406', '1468755197309162133', '42334463782293504');
INSERT INTO `pms_groups_permission` VALUES ('1466119913935524886', '1468755197309162133', '42334539376234496');
INSERT INTO `pms_groups_permission` VALUES ('1460454115609394865', '1468755197309162133', '42334838946009088');
INSERT INTO `pms_groups_permission` VALUES ('1466963037395953650', '1468755197309162133', '42334976082972672');
INSERT INTO `pms_groups_permission` VALUES ('1463359692344866863', '1468755197309162133', '42335081259339776');
INSERT INTO `pms_groups_permission` VALUES ('1467113887917834546', '1468755197309162133', '42335209235943424');
INSERT INTO `pms_groups_permission` VALUES ('1469588893217613450', '1468755197309162133', '42335402681438208');
INSERT INTO `pms_groups_permission` VALUES ('1462673157320739839', '1468755197309162133', '42335721133969408');
INSERT INTO `pms_groups_permission` VALUES ('1463470755298629920', '1468755197309162133', '42335817183531008');
INSERT INTO `pms_groups_permission` VALUES ('1469913572635017284', '1468755197309162133', '42335940605120512');
INSERT INTO `pms_groups_permission` VALUES ('1461118666439497521', '1468755197309162133', '42336123501940736');
INSERT INTO `pms_groups_permission` VALUES ('1461078641679221652', '1468755197309162133', '42336206301696000');
INSERT INTO `pms_groups_permission` VALUES ('1465905089678282493', '1468755197309162133', '42336271770587136');
INSERT INTO `pms_groups_permission` VALUES ('1466863416627998897', '1468755197309162133', '42336347972702208');
INSERT INTO `pms_groups_permission` VALUES ('1469220887346369038', '1468755197309162133', '42336599123431424');
INSERT INTO `pms_groups_permission` VALUES ('1465202086812505810', '1468755197309162133', '42336697060429824');
INSERT INTO `pms_groups_permission` VALUES ('1466530421831227967', '1468755197309162133', '42336773992353792');
INSERT INTO `pms_groups_permission` VALUES ('1467321980037359633', '1468755197309162133', '42336853726072832');
INSERT INTO `pms_groups_permission` VALUES ('1468354203243538126', '1468755197309162133', '42337029878452224');
INSERT INTO `pms_groups_permission` VALUES ('1465707179152031578', '1468755197309162133', '42337132236247040');
INSERT INTO `pms_groups_permission` VALUES ('1460273453866978666', '1468755197309162133', '42337204650905600');
INSERT INTO `pms_groups_permission` VALUES ('1464705101834077793', '1468755197309162133', '42337301711294464');
INSERT INTO `pms_groups_permission` VALUES ('1469654151714678561', '1468755197309162133', '42337629286436864');
INSERT INTO `pms_groups_permission` VALUES ('1463774670806285534', '1468755197309162133', '42337745028255744');
INSERT INTO `pms_groups_permission` VALUES ('1469496153118810391', '1468755197309162133', '42337817904287744');
INSERT INTO `pms_groups_permission` VALUES ('1461453741129877173', '1468755197309162133', '42338384647032832');
INSERT INTO `pms_groups_permission` VALUES ('1463270713260580408', '1468755197309162133', '42338452590563328');
INSERT INTO `pms_groups_permission` VALUES ('1465980065611509674', '1468755197309162133', '42338538640904192');
INSERT INTO `pms_groups_permission` VALUES ('1469679085566959173', '1468755197309162133', '42338630085120000');
INSERT INTO `pms_groups_permission` VALUES ('1460087804331705976', '1468755197309162133', '42338743775924224');
INSERT INTO `pms_groups_permission` VALUES ('1461219180215672613', '1468755197309162133', '64738735329120256');
INSERT INTO `pms_groups_permission` VALUES ('1462760980639621022', '1468755197309162133', '65140829198487552');
INSERT INTO `pms_groups_permission` VALUES ('1468744702668171838', '1468755197309162133', '65140900749119488');
INSERT INTO `pms_groups_permission` VALUES ('1464971708906432230', '1468755197309162134', '41977400967303168');
INSERT INTO `pms_groups_permission` VALUES ('1463724409859971604', '1468755197309162134', '41977528792911872');
INSERT INTO `pms_groups_permission` VALUES ('1465291422037613830', '1468755197309162134', '41977654831747072');
INSERT INTO `pms_groups_permission` VALUES ('1469951265929676101', '1468755197309162134', '41980651519348736');
INSERT INTO `pms_groups_permission` VALUES ('1461855867066254554', '1468755197309162134', '42334265874059264');
INSERT INTO `pms_groups_permission` VALUES ('1465217174343506585', '1468755197309162134', '42334379363536896');
INSERT INTO `pms_groups_permission` VALUES ('1465069286869923103', '1468755197309162134', '42334463782293504');
INSERT INTO `pms_groups_permission` VALUES ('1465472238330660405', '1468755197309162134', '42334539376234496');
INSERT INTO `pms_groups_permission` VALUES ('1463791684542000423', '1468755197309162134', '42334838946009088');
INSERT INTO `pms_groups_permission` VALUES ('1467506727311041366', '1468755197309162134', '42334976082972672');
INSERT INTO `pms_groups_permission` VALUES ('1463947316784039380', '1468755197309162134', '42335081259339776');
INSERT INTO `pms_groups_permission` VALUES ('1460761978416316768', '1468755197309162134', '42335209235943424');
INSERT INTO `pms_groups_permission` VALUES ('1460622400965020148', '1468755197309162134', '42335402681438208');
INSERT INTO `pms_groups_permission` VALUES ('1462292842803567277', '1468755197309162134', '42335721133969408');
INSERT INTO `pms_groups_permission` VALUES ('1467420807514852985', '1468755197309162134', '42335817183531008');
INSERT INTO `pms_groups_permission` VALUES ('1465285949039605646', '1468755197309162134', '42335940605120512');
INSERT INTO `pms_groups_permission` VALUES ('1465652907695127178', '1468755197309162134', '42336123501940736');
INSERT INTO `pms_groups_permission` VALUES ('1467934072864373245', '1468755197309162134', '42336206301696000');
INSERT INTO `pms_groups_permission` VALUES ('1468307877238885368', '1468755197309162134', '42336271770587136');
INSERT INTO `pms_groups_permission` VALUES ('1469519544595167821', '1468755197309162134', '42336347972702208');
INSERT INTO `pms_groups_permission` VALUES ('1461741244883854639', '1468755197309162134', '42336599123431424');
INSERT INTO `pms_groups_permission` VALUES ('1461282809406554706', '1468755197309162134', '42336697060429824');
INSERT INTO `pms_groups_permission` VALUES ('1462479054105461325', '1468755197309162134', '42336773992353792');
INSERT INTO `pms_groups_permission` VALUES ('1468366862123370627', '1468755197309162134', '42336853726072832');
INSERT INTO `pms_groups_permission` VALUES ('1462343368235707992', '1468755197309162134', '42337029878452224');
INSERT INTO `pms_groups_permission` VALUES ('1466557543618178596', '1468755197309162134', '42337132236247040');
INSERT INTO `pms_groups_permission` VALUES ('1465422848701821466', '1468755197309162134', '42337204650905600');
INSERT INTO `pms_groups_permission` VALUES ('1468017939391474781', '1468755197309162134', '42337301711294464');
INSERT INTO `pms_groups_permission` VALUES ('1462359385878477026', '1468755197309162134', '42337629286436864');
INSERT INTO `pms_groups_permission` VALUES ('1467668539827381663', '1468755197309162134', '42337745028255744');
INSERT INTO `pms_groups_permission` VALUES ('1462464132820875861', '1468755197309162134', '42337817904287744');
INSERT INTO `pms_groups_permission` VALUES ('1467376540468225496', '1468755197309162134', '42338384647032832');
INSERT INTO `pms_groups_permission` VALUES ('1461277062894713025', '1468755197309162134', '42338452590563328');
INSERT INTO `pms_groups_permission` VALUES ('1466121822105825548', '1468755197309162134', '42338538640904192');
INSERT INTO `pms_groups_permission` VALUES ('1469797648017499072', '1468755197309162134', '42338630085120000');
INSERT INTO `pms_groups_permission` VALUES ('1464662414108949282', '1468755197309162134', '42338743775924224');
INSERT INTO `pms_groups_permission` VALUES ('1461401359241583111', '1468755197309162134', '64738735329120256');
INSERT INTO `pms_groups_permission` VALUES ('1468661296182478398', '1468755197309162134', '65140829198487552');
INSERT INTO `pms_groups_permission` VALUES ('1468858516280141229', '1468755197309162134', '65140900749119488');
INSERT INTO `pms_groups_permission` VALUES ('1462453457717997754', '1468755197309162135', '41969113630773248');
INSERT INTO `pms_groups_permission` VALUES ('1462534205517877100', '1468755197309162135', '41969113630773248');
INSERT INTO `pms_groups_permission` VALUES ('1460633137921454529', '1468755197309162135', '41969252499984384');
INSERT INTO `pms_groups_permission` VALUES ('1463216362726759377', '1468755197309162135', '41969252499984384');
INSERT INTO `pms_groups_permission` VALUES ('1465473655315289914', '1468755197309162135', '41976726762295296');
INSERT INTO `pms_groups_permission` VALUES ('1467120743069947618', '1468755197309162135', '41976726762295296');
INSERT INTO `pms_groups_permission` VALUES ('1460201653934323123', '1468755197309162135', '41977259501817856');
INSERT INTO `pms_groups_permission` VALUES ('1461618912194736492', '1468755197309162135', '41977259501817856');
INSERT INTO `pms_groups_permission` VALUES ('1464551301695851785', '1468755197309162135', '41977734154424320');
INSERT INTO `pms_groups_permission` VALUES ('1467465809917758442', '1468755197309162135', '41977734154424320');
INSERT INTO `pms_groups_permission` VALUES ('1468104347707073169', '1468755197309162135', '41977922247987200');
INSERT INTO `pms_groups_permission` VALUES ('1469695238741880516', '1468755197309162135', '41977922247987200');
INSERT INTO `pms_groups_permission` VALUES ('1464972418268165615', '1468755197309162135', '41978045921234944');
INSERT INTO `pms_groups_permission` VALUES ('1469685584393943556', '1468755197309162135', '41978045921234944');
INSERT INTO `pms_groups_permission` VALUES ('1461012541730673982', '1468755197309162135', '41978134387494912');
INSERT INTO `pms_groups_permission` VALUES ('1464617199458201001', '1468755197309162135', '41978134387494912');
INSERT INTO `pms_groups_permission` VALUES ('1463459967363599371', '1468755197309162135', '41978216994312192');
INSERT INTO `pms_groups_permission` VALUES ('1465476236104815997', '1468755197309162135', '41978216994312192');
INSERT INTO `pms_groups_permission` VALUES ('1460523994140248112', '1468755197309162135', '41978289807429632');
INSERT INTO `pms_groups_permission` VALUES ('1466473856763370692', '1468755197309162135', '41978289807429632');
INSERT INTO `pms_groups_permission` VALUES ('1465541584801014246', '1468755197309162135', '41978468690300928');
INSERT INTO `pms_groups_permission` VALUES ('1468825718675577989', '1468755197309162135', '41978468690300928');
INSERT INTO `pms_groups_permission` VALUES ('1464435978971738396', '1468755197309162135', '41978566618910720');
INSERT INTO `pms_groups_permission` VALUES ('1469397060971343279', '1468755197309162135', '41978566618910720');
INSERT INTO `pms_groups_permission` VALUES ('1464964980756469533', '1468755197309162135', '41978664295862272');
INSERT INTO `pms_groups_permission` VALUES ('1466547353271156695', '1468755197309162135', '41978664295862272');
INSERT INTO `pms_groups_permission` VALUES ('1462966712596235658', '1468755197309162135', '41978754309820416');
INSERT INTO `pms_groups_permission` VALUES ('1465315131538308240', '1468755197309162135', '41978754309820416');
INSERT INTO `pms_groups_permission` VALUES ('1460524802804461267', '1468755197309162135', '41980651519348736');
INSERT INTO `pms_groups_permission` VALUES ('1468753397940132760', '1468755197309162135', '41980651519348736');
INSERT INTO `pms_groups_permission` VALUES ('1460077959942055603', '1468755197309162135', '42334265874059264');
INSERT INTO `pms_groups_permission` VALUES ('1465367484918045405', '1468755197309162135', '42334265874059264');
INSERT INTO `pms_groups_permission` VALUES ('1464492044242215726', '1468755197309162135', '42334379363536896');
INSERT INTO `pms_groups_permission` VALUES ('1468127238313818604', '1468755197309162135', '42334379363536896');
INSERT INTO `pms_groups_permission` VALUES ('1464706560297398238', '1468755197309162135', '42334463782293504');
INSERT INTO `pms_groups_permission` VALUES ('1467088910892587721', '1468755197309162135', '42334463782293504');
INSERT INTO `pms_groups_permission` VALUES ('1461936373675978764', '1468755197309162135', '42334539376234496');
INSERT INTO `pms_groups_permission` VALUES ('1465283933861088472', '1468755197309162135', '42334539376234496');
INSERT INTO `pms_groups_permission` VALUES ('1466457290485434894', '1468755197309162135', '42334838946009088');
INSERT INTO `pms_groups_permission` VALUES ('1469845671056064916', '1468755197309162135', '42334838946009088');
INSERT INTO `pms_groups_permission` VALUES ('1461651608973459215', '1468755197309162135', '42334976082972672');
INSERT INTO `pms_groups_permission` VALUES ('1461799861233303913', '1468755197309162135', '42334976082972672');
INSERT INTO `pms_groups_permission` VALUES ('1461544297664348809', '1468755197309162135', '42335081259339776');
INSERT INTO `pms_groups_permission` VALUES ('1462398053522775952', '1468755197309162135', '42335081259339776');
INSERT INTO `pms_groups_permission` VALUES ('1462486450323063357', '1468755197309162135', '42335209235943424');
INSERT INTO `pms_groups_permission` VALUES ('1462533908400402430', '1468755197309162135', '42335209235943424');
INSERT INTO `pms_groups_permission` VALUES ('1463227384620395156', '1468755197309162135', '42335402681438208');
INSERT INTO `pms_groups_permission` VALUES ('1463368919445253957', '1468755197309162135', '42335402681438208');
INSERT INTO `pms_groups_permission` VALUES ('1461690565786800748', '1468755197309162135', '42335721133969408');
INSERT INTO `pms_groups_permission` VALUES ('1462304646313855160', '1468755197309162135', '42335721133969408');
INSERT INTO `pms_groups_permission` VALUES ('1466106012231946419', '1468755197309162135', '42335817183531008');
INSERT INTO `pms_groups_permission` VALUES ('1467426992728828710', '1468755197309162135', '42335817183531008');
INSERT INTO `pms_groups_permission` VALUES ('1461643045026285690', '1468755197309162135', '42335940605120512');
INSERT INTO `pms_groups_permission` VALUES ('1461794407075036603', '1468755197309162135', '42335940605120512');
INSERT INTO `pms_groups_permission` VALUES ('1461478993550716752', '1468755197309162135', '42336123501940736');
INSERT INTO `pms_groups_permission` VALUES ('1462323718387911281', '1468755197309162135', '42336206301696000');
INSERT INTO `pms_groups_permission` VALUES ('1465357359412123171', '1468755197309162135', '42336206301696000');
INSERT INTO `pms_groups_permission` VALUES ('1462252163439201874', '1468755197309162135', '42336271770587136');
INSERT INTO `pms_groups_permission` VALUES ('1463059485632803310', '1468755197309162135', '42336271770587136');
INSERT INTO `pms_groups_permission` VALUES ('1467590154367865926', '1468755197309162135', '42336347972702208');
INSERT INTO `pms_groups_permission` VALUES ('1466893058825616245', '1468755197309162135', '42336599123431424');
INSERT INTO `pms_groups_permission` VALUES ('1469096630365963673', '1468755197309162135', '42336599123431424');
INSERT INTO `pms_groups_permission` VALUES ('1464966513133880862', '1468755197309162135', '42336697060429824');
INSERT INTO `pms_groups_permission` VALUES ('1465648200329319491', '1468755197309162135', '42336697060429824');
INSERT INTO `pms_groups_permission` VALUES ('1466692719029426761', '1468755197309162135', '42336773992353792');
INSERT INTO `pms_groups_permission` VALUES ('1468648221895083385', '1468755197309162135', '42336773992353792');
INSERT INTO `pms_groups_permission` VALUES ('1462375257415344910', '1468755197309162135', '42336853726072832');
INSERT INTO `pms_groups_permission` VALUES ('1464219787365054708', '1468755197309162135', '42336853726072832');
INSERT INTO `pms_groups_permission` VALUES ('1466288154172671129', '1468755197309162135', '42337029878452224');
INSERT INTO `pms_groups_permission` VALUES ('1468896466717422997', '1468755197309162135', '42337029878452224');
INSERT INTO `pms_groups_permission` VALUES ('1463345803206457327', '1468755197309162135', '42337132236247040');
INSERT INTO `pms_groups_permission` VALUES ('1469658345885823182', '1468755197309162135', '42337132236247040');
INSERT INTO `pms_groups_permission` VALUES ('1464181807954775224', '1468755197309162135', '42337204650905600');
INSERT INTO `pms_groups_permission` VALUES ('1469015321424881514', '1468755197309162135', '42337204650905600');
INSERT INTO `pms_groups_permission` VALUES ('1460401385551380142', '1468755197309162135', '42337301711294464');
INSERT INTO `pms_groups_permission` VALUES ('1469916728826529389', '1468755197309162135', '42337301711294464');
INSERT INTO `pms_groups_permission` VALUES ('1460786373433984771', '1468755197309162135', '42337629286436864');
INSERT INTO `pms_groups_permission` VALUES ('1463551518993104267', '1468755197309162135', '42337629286436864');
INSERT INTO `pms_groups_permission` VALUES ('1460404527755498889', '1468755197309162135', '42337745028255744');
INSERT INTO `pms_groups_permission` VALUES ('1465838162638217817', '1468755197309162135', '42337745028255744');
INSERT INTO `pms_groups_permission` VALUES ('1465865450497578405', '1468755197309162135', '42337817904287744');
INSERT INTO `pms_groups_permission` VALUES ('1466881765401269207', '1468755197309162135', '42337817904287744');
INSERT INTO `pms_groups_permission` VALUES ('1463952377360566179', '1468755197309162135', '42338384647032832');
INSERT INTO `pms_groups_permission` VALUES ('1464070353862647452', '1468755197309162135', '42338452590563328');
INSERT INTO `pms_groups_permission` VALUES ('1469402446828587414', '1468755197309162135', '42338538640904192');
INSERT INTO `pms_groups_permission` VALUES ('1463495099103853736', '1468755197309162135', '42338630085120000');
INSERT INTO `pms_groups_permission` VALUES ('1460752878922693544', '1468755197309162135', '42338743775924224');
INSERT INTO `pms_groups_permission` VALUES ('1463750830506376414', '1468755197309162135', '64738735329120256');
INSERT INTO `pms_groups_permission` VALUES ('1465631243795554234', '1468755197309162135', '64738735329120256');
INSERT INTO `pms_groups_permission` VALUES ('1461339793256093460', '1468755197309162135', '64739027659526144');
INSERT INTO `pms_groups_permission` VALUES ('1461997664005350971', '1468755197309162135', '64739027659526144');
INSERT INTO `pms_groups_permission` VALUES ('1460018927642805710', '1468755197309162135', '64739308640145408');
INSERT INTO `pms_groups_permission` VALUES ('1468010379172236099', '1468755197309162135', '64739308640145408');
INSERT INTO `pms_groups_permission` VALUES ('1466579715502511278', '1468755197309162135', '64739380002033664');
INSERT INTO `pms_groups_permission` VALUES ('1468500918990738686', '1468755197309162135', '64739380002033664');
INSERT INTO `pms_groups_permission` VALUES ('1461201612518979959', '1468755197309162135', '64739571354570752');
INSERT INTO `pms_groups_permission` VALUES ('1464727998497700064', '1468755197309162135', '64739571354570752');
INSERT INTO `pms_groups_permission` VALUES ('1460791091295828657', '1468755197309162135', '64739781774413824');
INSERT INTO `pms_groups_permission` VALUES ('1461792136899994728', '1468755197309162135', '64739781774413824');
INSERT INTO `pms_groups_permission` VALUES ('1461093378660279610', '1468755197309162135', '64739963341639680');
INSERT INTO `pms_groups_permission` VALUES ('1462122014823402459', '1468755197309162135', '64739963341639680');
INSERT INTO `pms_groups_permission` VALUES ('1462924699569667588', '1468755197309162135', '64740034804191232');
INSERT INTO `pms_groups_permission` VALUES ('1464055221889432067', '1468755197309162135', '64740034804191232');
INSERT INTO `pms_groups_permission` VALUES ('1463750052040845947', '1468755197309162135', '64740129687736320');
INSERT INTO `pms_groups_permission` VALUES ('1468382431092727914', '1468755197309162135', '64740129687736320');
INSERT INTO `pms_groups_permission` VALUES ('1464756814083766622', '1468755197309162135', '64740203201302528');
INSERT INTO `pms_groups_permission` VALUES ('1465863031450826747', '1468755197309162135', '64740203201302528');
INSERT INTO `pms_groups_permission` VALUES ('1461327337285599848', '1468755197309162135', '64740359808225280');
INSERT INTO `pms_groups_permission` VALUES ('1462448029826401751', '1468755197309162135', '64740359808225280');
INSERT INTO `pms_groups_permission` VALUES ('1463004003348989128', '1468755197309162135', '64809905348939776');
INSERT INTO `pms_groups_permission` VALUES ('1468009026775538923', '1468755197309162135', '64809905348939776');
INSERT INTO `pms_groups_permission` VALUES ('1465843579626199194', '1468755197309162135', '64815327690625024');
INSERT INTO `pms_groups_permission` VALUES ('1465892258433146563', '1468755197309162135', '64815327690625024');
INSERT INTO `pms_groups_permission` VALUES ('1461150702069173886', '1468755197309162135', '65140829198487552');
INSERT INTO `pms_groups_permission` VALUES ('1461228120584482202', '1468755197309162135', '65140829198487552');
INSERT INTO `pms_groups_permission` VALUES ('1467253000229119363', '1468755197309162135', '65140900749119488');
INSERT INTO `pms_groups_permission` VALUES ('1461272179843384677', '1468755197309162136', '41969113630773248');
INSERT INTO `pms_groups_permission` VALUES ('1462572497202811911', '1468755197309162136', '41969192357859328');
INSERT INTO `pms_groups_permission` VALUES ('1467358399050670382', '1468755197309162136', '41969252499984384');
INSERT INTO `pms_groups_permission` VALUES ('1462439603378814831', '1468755197309162136', '41976726762295296');
INSERT INTO `pms_groups_permission` VALUES ('1465446874465370937', '1468755197309162136', '41976831846387712');
INSERT INTO `pms_groups_permission` VALUES ('1465299403508468227', '1468755197309162136', '41976904223297536');
INSERT INTO `pms_groups_permission` VALUES ('1460946547487047644', '1468755197309162136', '41977259501817856');
INSERT INTO `pms_groups_permission` VALUES ('1465196825415096724', '1468755197309162136', '41977400967303168');
INSERT INTO `pms_groups_permission` VALUES ('1462937885170074616', '1468755197309162136', '41977528792911872');
INSERT INTO `pms_groups_permission` VALUES ('1464697334329832720', '1468755197309162136', '41977654831747072');
INSERT INTO `pms_groups_permission` VALUES ('1466604835136567122', '1468755197309162136', '41977734154424320');
INSERT INTO `pms_groups_permission` VALUES ('1467987899343743127', '1468755197309162136', '41977922247987200');
INSERT INTO `pms_groups_permission` VALUES ('1462877977408065183', '1468755197309162136', '41978045921234944');
INSERT INTO `pms_groups_permission` VALUES ('1469624702327839259', '1468755197309162136', '41978134387494912');
INSERT INTO `pms_groups_permission` VALUES ('1468379035625979937', '1468755197309162136', '41978216994312192');
INSERT INTO `pms_groups_permission` VALUES ('1468758491165821692', '1468755197309162136', '41978289807429632');
INSERT INTO `pms_groups_permission` VALUES ('1466244015642324958', '1468755197309162136', '41978468690300928');
INSERT INTO `pms_groups_permission` VALUES ('1467409044599658811', '1468755197309162136', '41978566618910720');
INSERT INTO `pms_groups_permission` VALUES ('1461733513571496090', '1468755197309162136', '41978664295862272');
INSERT INTO `pms_groups_permission` VALUES ('1464372881989362854', '1468755197309162136', '41978754309820416');
INSERT INTO `pms_groups_permission` VALUES ('1461685991561855197', '1468755197309162136', '41980651519348736');
INSERT INTO `pms_groups_permission` VALUES ('1464510096474152388', '1468755197309162136', '41980770788577280');
INSERT INTO `pms_groups_permission` VALUES ('1464818021575393997', '1468755197309162136', '42334265874059264');
INSERT INTO `pms_groups_permission` VALUES ('1469255297027135310', '1468755197309162136', '42334379363536896');
INSERT INTO `pms_groups_permission` VALUES ('1467967712555838202', '1468755197309162136', '42334463782293504');
INSERT INTO `pms_groups_permission` VALUES ('1466258462366587915', '1468755197309162136', '42334539376234496');
INSERT INTO `pms_groups_permission` VALUES ('1468739543730589690', '1468755197309162136', '42334628953985024');
INSERT INTO `pms_groups_permission` VALUES ('1460376905439336331', '1468755197309162136', '42334838946009088');
INSERT INTO `pms_groups_permission` VALUES ('1464741303933422481', '1468755197309162136', '42334976082972672');
INSERT INTO `pms_groups_permission` VALUES ('1463235922526176881', '1468755197309162136', '42335081259339776');
INSERT INTO `pms_groups_permission` VALUES ('1464287753700779348', '1468755197309162136', '42335209235943424');
INSERT INTO `pms_groups_permission` VALUES ('1466773019910005440', '1468755197309162136', '42335311539212288');
INSERT INTO `pms_groups_permission` VALUES ('1467875906373361387', '1468755197309162136', '42335402681438208');
INSERT INTO `pms_groups_permission` VALUES ('1469569270528866184', '1468755197309162136', '42335721133969408');
INSERT INTO `pms_groups_permission` VALUES ('1466091813568622658', '1468755197309162136', '42335817183531008');
INSERT INTO `pms_groups_permission` VALUES ('1468953643936801682', '1468755197309162136', '42335940605120512');
INSERT INTO `pms_groups_permission` VALUES ('1464494118813827059', '1468755197309162136', '42336024805773312');
INSERT INTO `pms_groups_permission` VALUES ('1469128954312781885', '1468755197309162136', '42336123501940736');
INSERT INTO `pms_groups_permission` VALUES ('1461400577985008205', '1468755197309162136', '42336206301696000');
INSERT INTO `pms_groups_permission` VALUES ('1460848826163961282', '1468755197309162136', '42336271770587136');
INSERT INTO `pms_groups_permission` VALUES ('1460248016004199957', '1468755197309162136', '42336347972702208');
INSERT INTO `pms_groups_permission` VALUES ('1465161261624850148', '1468755197309162136', '42336433490366464');
INSERT INTO `pms_groups_permission` VALUES ('1465486730269689221', '1468755197309162136', '42336599123431424');
INSERT INTO `pms_groups_permission` VALUES ('1461382012341726066', '1468755197309162136', '42336697060429824');
INSERT INTO `pms_groups_permission` VALUES ('1467644589193396408', '1468755197309162136', '42336773992353792');
INSERT INTO `pms_groups_permission` VALUES ('1468593427793298885', '1468755197309162136', '42336853726072832');
INSERT INTO `pms_groups_permission` VALUES ('1464615012882682031', '1468755197309162136', '42336946441162752');
INSERT INTO `pms_groups_permission` VALUES ('1468141902874216753', '1468755197309162136', '42337029878452224');
INSERT INTO `pms_groups_permission` VALUES ('1467026336794851825', '1468755197309162136', '42337132236247040');
INSERT INTO `pms_groups_permission` VALUES ('1465178335379560349', '1468755197309162136', '42337204650905600');
INSERT INTO `pms_groups_permission` VALUES ('1460591363153475049', '1468755197309162136', '42337301711294464');
INSERT INTO `pms_groups_permission` VALUES ('1460699601078429104', '1468755197309162136', '42337378299285504');
INSERT INTO `pms_groups_permission` VALUES ('1463496801793467399', '1468755197309162136', '42337629286436864');
INSERT INTO `pms_groups_permission` VALUES ('1468446815387200690', '1468755197309162136', '42337745028255744');
INSERT INTO `pms_groups_permission` VALUES ('1466939862394956995', '1468755197309162136', '42337817904287744');
INSERT INTO `pms_groups_permission` VALUES ('1461733045273963832', '1468755197309162136', '42338384647032832');
INSERT INTO `pms_groups_permission` VALUES ('1460307827278801063', '1468755197309162136', '42338452590563328');
INSERT INTO `pms_groups_permission` VALUES ('1461804968057397619', '1468755197309162136', '42338538640904192');
INSERT INTO `pms_groups_permission` VALUES ('1462223253665233257', '1468755197309162136', '42338630085120000');
INSERT INTO `pms_groups_permission` VALUES ('1468867798357805131', '1468755197309162136', '42338743775924224');
INSERT INTO `pms_groups_permission` VALUES ('1461665498275128285', '1468755197309162136', '42338936218980352');
INSERT INTO `pms_groups_permission` VALUES ('1469948098921755002', '1468755197309162136', '42339022474842112');
INSERT INTO `pms_groups_permission` VALUES ('1464211475476061978', '1468755197309162136', '42339129958076416');
INSERT INTO `pms_groups_permission` VALUES ('1461100109854579147', '1468755197309162136', '42339223352643584');
INSERT INTO `pms_groups_permission` VALUES ('1460657176296473467', '1468755197309162136', '42354812125188096');
INSERT INTO `pms_groups_permission` VALUES ('1464755673640784830', '1468755197309162136', '42354905771413112');
INSERT INTO `pms_groups_permission` VALUES ('1469606409931072648', '1468755197309162136', '42354988550197248');
INSERT INTO `pms_groups_permission` VALUES ('1466731488071319796', '1468755197309162136', '42355171505737728');
INSERT INTO `pms_groups_permission` VALUES ('1461386820915304104', '1468755197309162136', '42355325336031232');
INSERT INTO `pms_groups_permission` VALUES ('1468492035714174404', '1468755197309162136', '42355402511224832');
INSERT INTO `pms_groups_permission` VALUES ('1462053533518989272', '1468755197309162136', '42355510552301568');
INSERT INTO `pms_groups_permission` VALUES ('1462055270381245534', '1468755197309162136', '42355596724277248');
INSERT INTO `pms_groups_permission` VALUES ('1460732287418203946', '1468755197309162136', '42355693625282560');
INSERT INTO `pms_groups_permission` VALUES ('1468968966031327272', '1468755197309162136', '42355773019262976');
INSERT INTO `pms_groups_permission` VALUES ('1463497617068756969', '1468755197309162136', '42355862622179328');
INSERT INTO `pms_groups_permission` VALUES ('1460706091527628258', '1468755197309162136', '42355935212998656');
INSERT INTO `pms_groups_permission` VALUES ('1468457941433062588', '1468755197309162136', '42356020873269248');
INSERT INTO `pms_groups_permission` VALUES ('1462314153690270388', '1468755197309162136', '42356198170693632');
INSERT INTO `pms_groups_permission` VALUES ('1461556020705672607', '1468755197309162136', '42356266030338048');
INSERT INTO `pms_groups_permission` VALUES ('1462672396691045092', '1468755197309162136', '64059892574457856');
INSERT INTO `pms_groups_permission` VALUES ('1461703597703510980', '1468755197309162136', '64059999378214912');
INSERT INTO `pms_groups_permission` VALUES ('1462135401764163936', '1468755197309162136', '64060145163833344');
INSERT INTO `pms_groups_permission` VALUES ('1468905861353819359', '1468755197309162136', '64060216546693120');
INSERT INTO `pms_groups_permission` VALUES ('1468546598790581804', '1468755197309162136', '64060546483228672');
INSERT INTO `pms_groups_permission` VALUES ('1462953366410565897', '1468755197309162136', '64060742327865344');
INSERT INTO `pms_groups_permission` VALUES ('1463539640475030652', '1468755197309162136', '64060871856361472');
INSERT INTO `pms_groups_permission` VALUES ('1468990615363631881', '1468755197309162136', '64060949748781056');
INSERT INTO `pms_groups_permission` VALUES ('1465090342197816525', '1468755197309162136', '64061137204809728');
INSERT INTO `pms_groups_permission` VALUES ('1467470649096155409', '1468755197309162136', '64061220927311872');
INSERT INTO `pms_groups_permission` VALUES ('1468249235797834236', '1468755197309162136', '64061290498232320');
INSERT INTO `pms_groups_permission` VALUES ('1461084970326805735', '1468755197309162136', '64061357862948864');
INSERT INTO `pms_groups_permission` VALUES ('1463914794194723714', '1468755197309162136', '64738735329120256');
INSERT INTO `pms_groups_permission` VALUES ('1460543536488052786', '1468755197309162136', '64739027659526144');
INSERT INTO `pms_groups_permission` VALUES ('1463148710034753182', '1468755197309162136', '64739308640145408');
INSERT INTO `pms_groups_permission` VALUES ('1466568817976598421', '1468755197309162136', '64739380002033664');
INSERT INTO `pms_groups_permission` VALUES ('1460736618936881649', '1468755197309162136', '64739571354570752');
INSERT INTO `pms_groups_permission` VALUES ('1468075027116275746', '1468755197309162136', '64739781774413824');
INSERT INTO `pms_groups_permission` VALUES ('1464062972084544178', '1468755197309162136', '64739963341639680');
INSERT INTO `pms_groups_permission` VALUES ('1468658622288406332', '1468755197309162136', '64740034804191232');
INSERT INTO `pms_groups_permission` VALUES ('1466446682673185385', '1468755197309162136', '64740129687736320');
INSERT INTO `pms_groups_permission` VALUES ('1467088599665222438', '1468755197309162136', '64740203201302528');
INSERT INTO `pms_groups_permission` VALUES ('1466732745085896640', '1468755197309162136', '64740359808225280');
INSERT INTO `pms_groups_permission` VALUES ('1464924839524278931', '1468755197309162136', '64809905348939776');
INSERT INTO `pms_groups_permission` VALUES ('1461263992535420892', '1468755197309162136', '64815327690625024');
INSERT INTO `pms_groups_permission` VALUES ('1463080685754515783', '1468755197309162136', '65140829198487552');
INSERT INTO `pms_groups_permission` VALUES ('1467080302666271280', '1468755197309162136', '65140900749119488');

-- ----------------------------
-- Table structure for `pms_groups_user`
-- ----------------------------
DROP TABLE IF EXISTS `pms_groups_user`;
CREATE TABLE `pms_groups_user` (
  `id` bigint(20) NOT NULL,
  `groupid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_GU` (`groupid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组成员';

-- ----------------------------
-- Records of pms_groups_user
-- ----------------------------
INSERT INTO `pms_groups_user` VALUES ('1468805131164126180', '170808161527618', '1462211970061533193');
INSERT INTO `pms_groups_user` VALUES ('1467612601064460587', '170808161527618', '1466279879512435266');
INSERT INTO `pms_groups_user` VALUES ('1460026119512085242', '170808165725664', '1462156364634602320');
INSERT INTO `pms_groups_user` VALUES ('1465530946166231822', '170808165725664', '1467191338628906628');
INSERT INTO `pms_groups_user` VALUES ('1467181730763353920', '170808165725664', '1467830594111128822');
INSERT INTO `pms_groups_user` VALUES ('1465746928887174680', '170808165858288', '1461157223500299818');
INSERT INTO `pms_groups_user` VALUES ('1462553922011244961', '170808165858288', '1468915433602979028');
INSERT INTO `pms_groups_user` VALUES ('1466629484625621583', '170808165858288', '1469024587469707428');
INSERT INTO `pms_groups_user` VALUES ('1465068682628219649', '170812094702973', '1469898966963122920');
INSERT INTO `pms_groups_user` VALUES ('1462290164626094200', '37623600177483776', '1468140265954907628');
INSERT INTO `pms_groups_user` VALUES ('1468623278710614169', '1468755197309162135', '1464457307598458960');
INSERT INTO `pms_groups_user` VALUES ('1462111859493876944', '1468755197309162135', '1468749771763614096');

-- ----------------------------
-- Table structure for `pms_knowledges`
-- ----------------------------
DROP TABLE IF EXISTS `pms_knowledges`;
CREATE TABLE `pms_knowledges` (
  `knowid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `sortid` int(20) DEFAULT NULL COMMENT '分类ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `tag` varchar(100) DEFAULT NULL COMMENT '标签',
  `summary` varchar(255) DEFAULT NULL COMMENT '简介',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `content` text COMMENT '正文',
  `viewnum` int(10) DEFAULT '0' COMMENT '浏览数',
  `comtnum` int(10) DEFAULT '0' COMMENT '评论数',
  `laudnum` int(10) DEFAULT '0' COMMENT '赞数',
  `ispublis` int(1) DEFAULT '1' COMMENT '1发布2草稿',
  `status` int(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  `created` varchar(20) DEFAULT NULL,
  `changed` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`knowid`),
  KEY `INDEX_UALL` (`userid`,`sortid`,`title`,`tag`,`viewnum`,`ispublis`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='知识分享表';

-- ----------------------------
-- Records of pms_knowledges
-- ----------------------------
INSERT INTO `pms_knowledges` VALUES ('1708071353226', '2322434', '1', '33333', 'thg', 'sghg', 'hfh', null, 'hdjg', '6', '1', '0', '1', '1', '2017-08-07 13:53:19', null);
INSERT INTO `pms_knowledges` VALUES ('1708070937535', '2322434', '2', 'ewfrg', 'dgdfg', 'fgfb', 'rgdfg', null, 'dfgf', '0', '0', '0', '1', '1', '2017-08-07 09:37:31', null);
INSERT INTO `pms_knowledges` VALUES ('1708071432879', '2322434', '2', 'rgtrh', 'gdfh', 'dgfh', 'dgfdgh', null, 'dhgfh', '0', '0', '0', '1', '1', '2017-08-07 14:32:23', null);
INSERT INTO `pms_knowledges` VALUES ('170807151544233', '1464908736964868544', '3', '财务标题', '财务标签', '哈哈哈。。。', 'www.baidou.com', null, '嘿嘿嘿。。', '0', '0', '0', '1', '1', '2017-08-07 15:15:44', null);
INSERT INTO `pms_knowledges` VALUES ('1708131710364', '1468140265954907628', '5', 'dvxfvxfv', 'dfvfdxvf', 'fvfxb', 'fdvdfv', null, 'dfvfb', '0', '0', '0', '1', '1', '2017-08-13 17:10:22', null);

-- ----------------------------
-- Table structure for `pms_knowledges_comment`
-- ----------------------------
DROP TABLE IF EXISTS `pms_knowledges_comment`;
CREATE TABLE `pms_knowledges_comment` (
  `comtid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `knowid` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created` varchar(20) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  PRIMARY KEY (`comtid`),
  KEY `INDEX_UKCS` (`userid`,`knowid`,`created`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='知识评论表';

-- ----------------------------
-- Records of pms_knowledges_comment
-- ----------------------------
INSERT INTO `pms_knowledges_comment` VALUES ('20170807200331317', null, '1708071353226', '东方红国静', '2017-08-07 20:03:31', '1');

-- ----------------------------
-- Table structure for `pms_knowledges_laud`
-- ----------------------------
DROP TABLE IF EXISTS `pms_knowledges_laud`;
CREATE TABLE `pms_knowledges_laud` (
  `laudid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `knowid` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  PRIMARY KEY (`laudid`),
  KEY `INDEX_UKCS` (`userid`,`knowid`,`created`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='知识点赞表';

-- ----------------------------
-- Records of pms_knowledges_laud
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_knowledges_sort`
-- ----------------------------
DROP TABLE IF EXISTS `pms_knowledges_sort`;
CREATE TABLE `pms_knowledges_sort` (
  `sortid` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(1) DEFAULT '1' COMMENT '1显示，0屏蔽',
  PRIMARY KEY (`sortid`),
  KEY `INDEX_NS` (`name`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='知识分享分类表';

-- ----------------------------
-- Records of pms_knowledges_sort
-- ----------------------------
INSERT INTO `pms_knowledges_sort` VALUES ('1', '企业文化', null, null);
INSERT INTO `pms_knowledges_sort` VALUES ('2', '管理知识', null, null);
INSERT INTO `pms_knowledges_sort` VALUES ('3', '财务知识', null, null);
INSERT INTO `pms_knowledges_sort` VALUES ('4', '技术分享', null, null);
INSERT INTO `pms_knowledges_sort` VALUES ('5', '服务器', null, null);
INSERT INTO `pms_knowledges_sort` VALUES ('6', '市场营销', null, null);
INSERT INTO `pms_knowledges_sort` VALUES ('7', '运营', null, null);
INSERT INTO `pms_knowledges_sort` VALUES ('8', '随笔', null, null);

-- ----------------------------
-- Table structure for `pms_leaves`
-- ----------------------------
DROP TABLE IF EXISTS `pms_leaves`;
CREATE TABLE `pms_leaves` (
  `leaveid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '请假人',
  `type` int(1) DEFAULT NULL COMMENT '1事假2病假3年假4调休5婚假6产假7陪产假8路途假9其他',
  `started` date DEFAULT NULL COMMENT '开始时间',
  `ended` date DEFAULT NULL COMMENT '结束时间',
  `days` int(4) DEFAULT NULL COMMENT '请假天数',
  `reason` varchar(500) DEFAULT NULL COMMENT '原因',
  `picture` varchar(100) DEFAULT NULL COMMENT '图片',
  `result` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `status` int(1) DEFAULT '1' COMMENT '1草稿2正常发布',
  `approverids` varchar(200) DEFAULT NULL COMMENT '审批人串',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`leaveid`),
  KEY `INDEX_UTC` (`userid`,`type`,`created`,`changed`,`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假表';

-- ----------------------------
-- Records of pms_leaves
-- ----------------------------
INSERT INTO `pms_leaves` VALUES ('2525223', '1467191338628906628', '4', '2017-07-26', '2017-07-27', '1', '世界很大，一定要走出去lkkkkkkkkkk', null, null, '2', null, '2017-07-26 19:42:04', '2017-07-11 19:02:14');
INSERT INTO `pms_leaves` VALUES ('234234234', '1467191338628906628', '2', '2017-07-17', '2017-08-04', '5', '很久没休息，需要休息', 'ApprovalPicture/qj1461859916746799278.jpg', null, '1', '1121,1122,1213,', '2017-08-06 16:26:53', null);
INSERT INTO `pms_leaves` VALUES ('17072822300081', '1467191338628906628', '5', '2017-07-28', '2017-08-05', '7', '要结婚了，需要请假！', '302311.jpg', null, '1', ',1468140265954907628', '2017-08-06 16:19:44', null);
INSERT INTO `pms_leaves` VALUES ('17073011263041', '1467191338628906628', '2', '2017-07-30', '2017-08-01', '2', '大佛寺多福多寿', '', null, '2', ',1467191338628906628', '2017-08-06 20:24:21', null);
INSERT INTO `pms_leaves` VALUES ('170728211036390', '1467191338628906628', '3', '2017-07-28', '2017-07-07', '1', '请假，不需要什么理由', '', null, '2', ',1468140265954907628,1469024587469707428,2125454545', '2017-08-06 20:24:27', null);
INSERT INTO `pms_leaves` VALUES ('170728211635157', '1467191338628906628', '2', '2017-07-28', '2017-07-07', '10', '请假事件太长了吧 ，干脆离职', 'ApprovalPicture/qj1461524375223440511.jpg', null, '1', ',102414050503168000', '2017-08-06 16:23:48', null);
INSERT INTO `pms_leaves` VALUES ('170728212010209', '1467191338628906628', '8', '2017-07-28', '2017-07-29', '1', '想回家了，请让本人回家', 'ApprovalPicture/qj1469217811011053188.jpg', null, '1', ',1468140265954907628', '2017-08-06 16:22:06', null);
INSERT INTO `pms_leaves` VALUES ('170731154712340', '1467191338628906628', '9', '2017-07-31', '2017-08-01', '1', '嘎嘎嘎嘎嘎', '0衬衫蓝底_mr1477722968540.jpg', null, '1', ',1468140265954907628,102414050503168000', '2017-08-06 20:24:29', null);
INSERT INTO `pms_leaves` VALUES ('170731160144947', '1467191338628906628', '4', '2017-07-31', '2017-07-12', '2', '水电费水电费水电费是否', '300408.jpg', null, '1', ',1467191338628906628,65140463652311040', '2017-08-06 20:24:32', null);
INSERT INTO `pms_leaves` VALUES ('170731160453407', '1467191338628906628', '4', '2017-07-31', '2017-08-05', '5', '休息嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻', '300408.jpg', null, '1', ',1467191338628906628', '2017-08-06 20:24:35', null);
INSERT INTO `pms_leaves` VALUES ('170731195912160', '1467191338628906628', '3', '2017-07-31', '2017-08-18', '18', '请假请假请假请假请假请假请假', '', null, '1', ',1467191338628906628', '2017-07-31 19:59:12', null);
INSERT INTO `pms_leaves` VALUES ('1463472957998307556', '1467191338628906628', '6', '2017-08-07', '2017-09-02', '3434', '地方上大佛寺的个', '', null, '1', '', '2017-08-06 20:23:41', null);
INSERT INTO `pms_leaves` VALUES ('1463605752418561832', '1464908736964868544', '6', '2017-08-09', '2017-08-15', '34', 'sdfsgfs', '', null, '1', '', '2017-08-08 11:08:18', null);
INSERT INTO `pms_leaves` VALUES ('1464008665355701493', '1464908736964868544', '2', '2017-08-07', '2017-08-08', '1', '东方闪电发生过', '', null, '2', ',65140463652311040', '2017-08-07 10:05:14', null);
INSERT INTO `pms_leaves` VALUES ('1464103311589753393', '1467191338628906628', '3', '2017-08-06', '2017-08-09', '3332', '说的啥多', '302514.jpg', null, '1', '', '2017-08-06 16:20:00', null);
INSERT INTO `pms_leaves` VALUES ('1464912470794736771', '1465774726292743771', '1', '2017-08-07', '2017-08-09', '2', 'fsdgder', '', null, '1', '', '2017-08-07 19:50:29', null);
INSERT INTO `pms_leaves` VALUES ('1465228882548245689', '1465774726292743771', '4', '2017-08-07', '2017-08-17', '12', 'fdgd', '', null, '2', '', '2017-08-07 19:54:52', null);
INSERT INTO `pms_leaves` VALUES ('1467079065342235201', '1467191338628906628', '3', '2017-08-06', '2017-09-02', '31', '东方闪电大纲', '', null, '1', ',65140463652311040', '2017-08-06 20:25:09', null);
INSERT INTO `pms_leaves` VALUES ('1467719053922149976', '1467191338628906628', '1', '2017-08-06', '2017-08-07', '111111', '餐vvsd', 'ApprovalPicture/qj1464486336282400482.jpg', null, '1', '', '2017-08-06 16:10:30', null);
INSERT INTO `pms_leaves` VALUES ('1468330491589557883', '1465774726292743771', '2', '2017-08-09', '2017-08-17', '30', 'fsrefr', '', null, '2', ',1467191338628906628,1468915433602979028,65140463652311040', '2017-08-07 19:53:56', null);
INSERT INTO `pms_leaves` VALUES ('1469253814874292031', '1467191338628906628', '2', '2017-08-07', '2017-08-10', '3', '递四方速递', '302514.jpg', null, '1', '', '2017-08-06 16:06:36', null);

-- ----------------------------
-- Table structure for `pms_leaves_approver`
-- ----------------------------
DROP TABLE IF EXISTS `pms_leaves_approver`;
CREATE TABLE `pms_leaves_approver` (
  `approverid` bigint(20) NOT NULL,
  `leaveid` bigint(20) DEFAULT NULL COMMENT '请假表ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '审批人Userid',
  `summary` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`approverid`),
  KEY `INDEX_LUSC` (`leaveid`,`userid`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假审批人表';

-- ----------------------------
-- Records of pms_leaves_approver
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_messages`
-- ----------------------------
DROP TABLE IF EXISTS `pms_messages`;
CREATE TABLE `pms_messages` (
  `msgid` bigint(20) NOT NULL COMMENT '消息ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '接收消息的人',
  `touserid` bigint(20) DEFAULT NULL COMMENT '发布消息的人',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型1评论2赞3审批',
  `subtype` tinyint(3) DEFAULT NULL COMMENT '11知识评论12相册评论21知识赞22相册赞31请假审批32加班33报销34出差35外出36物品',
  `title` varchar(200) DEFAULT NULL COMMENT '消息主题',
  `url` varchar(200) DEFAULT NULL COMMENT '相关的事件 的路径',
  `view` tinyint(1) DEFAULT '1' COMMENT '1未看，2已看',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 消息表';

-- ----------------------------
-- Records of pms_messages
-- ----------------------------
INSERT INTO `pms_messages` VALUES ('66618325785907200', '1461312703628858832', '1469024587469707428', '4', '31', '去审批处理', '/leave/approval/66618286464307200', '1', null);
INSERT INTO `pms_messages` VALUES ('66626417378463744', '1461312703628858832', '1461312703628858832', '1', '11', 'OPMS 1.2 版本更新发布', '/knowledge/66618679508340736', '1', null);
INSERT INTO `pms_messages` VALUES ('66639445431947264', '1461312703628858832', '1461312703628858832', '1', '12', '油菜花', '/album/66621262012616704', '1', null);
INSERT INTO `pms_messages` VALUES ('1461027403293621010', '1464457307598458960', '1468140265954907628', '4', '4', 'hgf', 'NoticeDetail?noticeid=170813143133558', '1', '2017-08-13 14:32:05');
INSERT INTO `pms_messages` VALUES ('1461399501504168376', '1462211970061533193', '1468140265954907628', '4', '4', 'hgf', 'NoticeDetail?noticeid=170813143133558', '1', '2017-08-13 14:32:05');
INSERT INTO `pms_messages` VALUES ('1461415826012184738', '1468140265954907628', '1468140265954907628', '4', '4', 'fds', 'NoticeDetail?noticeid=170812112108747', '1', '2017-08-12 11:21:22');
INSERT INTO `pms_messages` VALUES ('1461465478718960664', '1468140265954907628', '1468140265954907628', '4', '4', 'fdshdsgds', 'NoticeDetail?noticeid=170813144706777', '1', '2017-08-13 14:47:15');
INSERT INTO `pms_messages` VALUES ('1462127393050402234', '1464457307598458960', '1468140265954907628', '4', '4', 'fdshdsgds', 'NoticeDetail?noticeid=170813144706777', '1', '2017-08-13 14:47:15');
INSERT INTO `pms_messages` VALUES ('1462173373045253373', '1468749771763614096', '1468140265954907628', '4', '4', 'fdshdsgds', 'NoticeDetail?noticeid=170813144706777', '1', '2017-08-13 14:47:15');
INSERT INTO `pms_messages` VALUES ('1462272706423786877', '1464457307598458960', '1468140265954907628', '4', '4', 'gfsd', 'NoticeDetail?noticeid=170813143651960', '1', '2017-08-13 14:37:31');
INSERT INTO `pms_messages` VALUES ('1462789186425259937', '1468749771763614096', '1468140265954907628', '4', '4', 'fdsa', 'NoticeDetail?noticeid=170813113356427', '1', '2017-08-13 11:34:04');
INSERT INTO `pms_messages` VALUES ('1462978663226025204', '1462211970061533193', '1468140265954907628', '4', '4', 'fd', 'NoticeDetail?noticeid=170812111214301', '1', '2017-08-12 11:12:20');
INSERT INTO `pms_messages` VALUES ('1463034075770266401', '1468140265954907628', '1468140265954907628', '4', '4', 'hgf', 'NoticeDetail?noticeid=170813143133558', '1', '2017-08-13 14:32:05');
INSERT INTO `pms_messages` VALUES ('1463594531114301506', '1464457307598458960', '1468140265954907628', '4', '4', 'fds', 'NoticeDetail?noticeid=170812112108747', '1', '2017-08-12 11:21:22');
INSERT INTO `pms_messages` VALUES ('1463929675961895716', '1462211970061533193', '1468140265954907628', '4', '4', 'gfsd', 'NoticeDetail?noticeid=170813143651960', '1', '2017-08-13 14:37:31');
INSERT INTO `pms_messages` VALUES ('1464773286760220319', '1466279879512435266', '1468140265954907628', '4', '4', 'fdsa', 'NoticeDetail?noticeid=170813113356427', '1', '2017-08-13 11:34:04');
INSERT INTO `pms_messages` VALUES ('1465011335469031508', '1464457307598458960', '1468140265954907628', '4', '4', 'fdsa', 'NoticeDetail?noticeid=170813113356427', '1', '2017-08-13 11:34:04');
INSERT INTO `pms_messages` VALUES ('1465180545064288929', '1468140265954907628', '1468140265954907628', '4', '4', 'fdsa', 'NoticeDetail?noticeid=170813113356427', '1', '2017-08-13 11:34:04');
INSERT INTO `pms_messages` VALUES ('1465829988604869494', '1466279879512435266', '1468140265954907628', '4', '4', 'ert', 'NoticeDetail?noticeid=170813144301605', '1', '2017-08-13 14:43:34');
INSERT INTO `pms_messages` VALUES ('1465849203278524083', '1462211970061533193', '1468140265954907628', '4', '4', 'fdshdsgds', 'NoticeDetail?noticeid=170813144706777', '1', '2017-08-13 14:47:15');
INSERT INTO `pms_messages` VALUES ('1465882745283589474', '1466279879512435266', '1468140265954907628', '4', '4', 'hgf', 'NoticeDetail?noticeid=170813143133558', '1', '2017-08-13 14:32:05');
INSERT INTO `pms_messages` VALUES ('1465889828453267923', '1464457307598458960', '1468140265954907628', '4', '4', 'ert', 'NoticeDetail?noticeid=170813144301605', '1', '2017-08-13 14:43:34');
INSERT INTO `pms_messages` VALUES ('1466200213461666938', '1468749771763614096', '1468140265954907628', '4', '4', 'fds', 'NoticeDetail?noticeid=170812112108747', '1', '2017-08-12 11:21:22');
INSERT INTO `pms_messages` VALUES ('1466244099235011985', '1466279879512435266', '1468140265954907628', '4', '4', 'gfsd', 'NoticeDetail?noticeid=170813143651960', '1', '2017-08-13 14:37:31');
INSERT INTO `pms_messages` VALUES ('1467309966781072286', '1466279879512435266', '1468140265954907628', '4', '4', 'fds', 'NoticeDetail?noticeid=170812112108747', '1', '2017-08-12 11:21:22');
INSERT INTO `pms_messages` VALUES ('1467492588139556150', '1462211970061533193', '1468140265954907628', '4', '4', 'fds', 'NoticeDetail?noticeid=170812112108747', '1', '2017-08-12 11:21:22');
INSERT INTO `pms_messages` VALUES ('1468263864985644492', '1466279879512435266', '1468140265954907628', '4', '4', 'fdshdsgds', 'NoticeDetail?noticeid=170813144706777', '1', '2017-08-13 14:47:15');
INSERT INTO `pms_messages` VALUES ('1468580075899458526', '1468749771763614096', '1468140265954907628', '4', '4', 'ert', 'NoticeDetail?noticeid=170813144301605', '1', '2017-08-13 14:43:34');
INSERT INTO `pms_messages` VALUES ('1469263176628592892', '1462211970061533193', '1468140265954907628', '4', '4', 'ert', 'NoticeDetail?noticeid=170813144301605', '1', '2017-08-13 14:43:34');
INSERT INTO `pms_messages` VALUES ('1469550667532616184', '1468140265954907628', '1468140265954907628', '4', '4', 'ert', 'NoticeDetail?noticeid=170813144301605', '1', '2017-08-13 14:43:34');
INSERT INTO `pms_messages` VALUES ('1469979889931625748', '1462211970061533193', '1468140265954907628', '4', '4', 'fdsa', 'NoticeDetail?noticeid=170813113356427', '1', '2017-08-13 11:34:04');

-- ----------------------------
-- Table structure for `pms_notices`
-- ----------------------------
DROP TABLE IF EXISTS `pms_notices`;
CREATE TABLE `pms_notices` (
  `noticeid` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `created` datetime(6) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '1：正常2：屏蔽',
  PRIMARY KEY (`noticeid`),
  KEY `INDEX_TCS` (`title`,`created`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告通知表';

-- ----------------------------
-- Records of pms_notices
-- ----------------------------
INSERT INTO `pms_notices` VALUES ('170812112108747', 'fds', 'fds', '2017-08-12 11:21:00.000000', '1');
INSERT INTO `pms_notices` VALUES ('170813113356427', 'fdsa', 'gfd', '2017-08-13 11:34:00.000000', '1');
INSERT INTO `pms_notices` VALUES ('170813144301605', 'ert', 'sdgh', '2017-08-13 14:43:00.000000', '1');
INSERT INTO `pms_notices` VALUES ('170813144706777', 'fdshdsgds', 'fdshfdsgdsf', '2017-08-13 14:47:00.000000', '1');
INSERT INTO `pms_notices` VALUES ('66623026262708224', '2017清明放假通知', '2017清明放假通知，连续放6天（2017-04-01至2017-04-06），请各部门注意~', null, '1');
INSERT INTO `pms_notices` VALUES ('66623026262708225', '10.1放假通知', '各部门注意，本次放假多放10天，共17天！', null, '1');

-- ----------------------------
-- Table structure for `pms_oagoods`
-- ----------------------------
DROP TABLE IF EXISTS `pms_oagoods`;
CREATE TABLE `pms_oagoods` (
  `oagoodid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `purpose` varchar(100) DEFAULT NULL COMMENT '物品用途',
  `names` varchar(8) NOT NULL COMMENT '物品名称串',
  `quantitys` varchar(200) DEFAULT NULL COMMENT '数量串',
  `content` varchar(1000) DEFAULT NULL COMMENT '详情',
  `picture` varchar(100) DEFAULT NULL COMMENT '1同',
  `result` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `status` int(1) DEFAULT '1' COMMENT '1草稿2正常发布',
  `approverids` varchar(200) DEFAULT NULL COMMENT '审批人串',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`oagoodid`),
  KEY `INDEX_UNRSC` (`userid`,`names`,`result`,`status`,`created`,`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品领用表';

-- ----------------------------
-- Records of pms_oagoods
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_oagoods_approver`
-- ----------------------------
DROP TABLE IF EXISTS `pms_oagoods_approver`;
CREATE TABLE `pms_oagoods_approver` (
  `approverid` bigint(20) NOT NULL,
  `oagoodid` bigint(20) DEFAULT NULL COMMENT '物品领用表ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '审批人Userid',
  `summary` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`approverid`),
  KEY `INDEX_LUSC` (`oagoodid`,`userid`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销审批人表';

-- ----------------------------
-- Records of pms_oagoods_approver
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_overtimes`
-- ----------------------------
DROP TABLE IF EXISTS `pms_overtimes`;
CREATE TABLE `pms_overtimes` (
  `overtimeid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '请假人',
  `started` datetime DEFAULT NULL COMMENT '开始时间',
  `ended` datetime DEFAULT NULL COMMENT '结束时间',
  `longtime` int(4) DEFAULT NULL COMMENT '加班时长',
  `holiday` int(1) DEFAULT NULL COMMENT '节假日1是2否',
  `way` int(1) DEFAULT NULL COMMENT '核算方式1调休，2加班费',
  `reason` varchar(500) DEFAULT NULL COMMENT '原因',
  `result` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `status` int(1) DEFAULT '1' COMMENT '1草稿2正常发布',
  `approverids` varchar(200) DEFAULT NULL COMMENT '审批人串',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`overtimeid`),
  KEY `INDEX_UTC` (`userid`,`longtime`,`created`,`changed`,`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加班表';

-- ----------------------------
-- Records of pms_overtimes
-- ----------------------------
INSERT INTO `pms_overtimes` VALUES ('1462855075301824023', '1467191338628906628', '2017-07-26 14:50:00', '2017-07-12 19:50:00', '2', '1', '1', '长沙分身乏术', null, '1', null, null, null);
INSERT INTO `pms_overtimes` VALUES ('1465371692944965782', '1467191338628906628', '2017-07-31 10:50:00', '2017-07-31 15:50:00', '5', '2', '1', '加班加班加班加班加班', null, '2', null, null, null);
INSERT INTO `pms_overtimes` VALUES ('1465543634807903803', '1467191338628906628', '2017-08-01 05:25:00', '2017-08-07 08:40:00', '3', '1', '1', '水电费大是', null, '1', '', null, '2017-08-06 10:30:27');
INSERT INTO `pms_overtimes` VALUES ('1465928837569228973', '1467191338628906628', '2017-07-10 13:25:00', '2017-07-24 13:20:00', '4', '1', '1', '时光飞逝工时费', null, '2', null, null, null);
INSERT INTO `pms_overtimes` VALUES ('1467823945590866514', '1467191338628906628', '2017-08-02 01:00:00', '2017-08-02 06:00:00', '5', '2', '2', '加班不需要理由', null, '1', null, null, null);
INSERT INTO `pms_overtimes` VALUES ('1468584296387760386', '1467191338628906628', '2017-07-24 18:25:00', '2017-07-24 19:35:00', '2', '1', '2', '加班加班加班加班加班加班加班', null, '1', '', null, null);
INSERT INTO `pms_overtimes` VALUES ('1468955428576936431', '1467191338628906628', '2017-08-06 08:25:00', '2017-08-06 08:25:00', '2', '2', '2', '对方的说法给', null, '1', null, '2017-08-06 10:30:00', null);
INSERT INTO `pms_overtimes` VALUES ('1469394880150910763', '1467191338628906628', '2017-08-02 02:00:00', '2017-08-02 07:00:00', '3', '2', '1', '没有理由', null, '1', '', null, '2017-08-02 15:41:01');

-- ----------------------------
-- Table structure for `pms_overtimes_approver`
-- ----------------------------
DROP TABLE IF EXISTS `pms_overtimes_approver`;
CREATE TABLE `pms_overtimes_approver` (
  `approverid` bigint(20) NOT NULL,
  `overtimeid` bigint(20) DEFAULT NULL COMMENT '加班表ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '审批人Userid',
  `summary` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` int(1) DEFAULT NULL COMMENT '1同意2拒绝',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`approverid`),
  KEY `INDEX_LUSC` (`overtimeid`,`userid`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加班审批人表';

-- ----------------------------
-- Records of pms_overtimes_approver
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `pms_permissions`;
CREATE TABLE `pms_permissions` (
  `permissionid` bigint(20) NOT NULL,
  `parentid` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '中文名称',
  `ename` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `icon` varchar(20) DEFAULT NULL,
  `nav` int(1) DEFAULT '0' COMMENT '1是0否导航',
  `type` int(1) DEFAULT '0' COMMENT '0不显示1显示',
  `weight` int(4) DEFAULT '0',
  PRIMARY KEY (`permissionid`),
  KEY `INDEX_PNETW` (`parentid`,`name`,`ename`,`type`,`weight`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of pms_permissions
-- ----------------------------
INSERT INTO `pms_permissions` VALUES ('41965474417741824', '0', '我的主页', 'my', 'home', '1', '1', '99');
INSERT INTO `pms_permissions` VALUES ('41969010140516352', '0', '项目管理', 'project', 'book', '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41969113630773248', '41969010140516352', '项目列表', 'project-manage', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41969192357859328', '41969010140516352', '添加项目', 'project-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41969252499984384', '41969010140516352', '编辑项目', 'project-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41976726762295296', '41969010140516352', '团队列表', 'project-team', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41976831846387712', '41969010140516352', '添加团队', 'team-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41976904223297536', '41969010140516352', '团队删除', 'team-delete', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41977259501817856', '41969010140516352', '需求列表', 'project-need', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41977400967303168', '41969010140516352', '添加需求', 'need-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41977528792911872', '41969010140516352', '编辑需求', 'need-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41977654831747072', '41969010140516352', '删除需求', 'need-delete', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41977734154424320', '41969010140516352', '需求查看', 'need-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41977922247987200', '41969010140516352', '任务列表', 'project-task', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41978045921234944', '41969010140516352', '添加任务', 'task-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41978134387494912', '41969010140516352', '编辑任务', 'task-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41978216994312192', '41969010140516352', '任务删除', 'task-delete', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41978289807429632', '41969010140516352', '任务查看', 'task-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41978468690300928', '41969010140516352', 'Bug列表', '-fs', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41978566618910720', '41969010140516352', '提Bug', 'test-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41978664295862272', '41969010140516352', '编辑Bug', 'test-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41978754309820416', '41969010140516352', 'Bug查看', 'test-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41980436594823168', '0', '考勤管理', 'checkwork', 'tasks', '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41980651519348736', '41980436594823168', '我的考勤', 'checkwork-manage', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('41980770788577280', '41980436594823168', '全部考勤', 'checkwork-all', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42334086215241728', '0', '审批管理', 'approval', 'suitcase', '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42334265874059264', '42334086215241728', '请假', 'leave-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42334379363536896', '42334086215241728', '申请请假', 'leave-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42334463782293504', '42334086215241728', '编辑请假', 'leave-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42334539376234496', '42334086215241728', '请假查看', 'leave-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42334628953985024', '42334086215241728', '审批请假', 'leave-approval', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42334838946009088', '42334086215241728', '加班', 'overtime-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42334976082972672', '42334086215241728', '申请加班', 'overtime-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42335081259339776', '42334086215241728', '编辑加班', 'overtime-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42335209235943424', '42334086215241728', '查看加班', 'overtime-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42335311539212288', '42334086215241728', '审批加班', 'overtime-approval', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42335402681438208', '42334086215241728', '报销', 'expense-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42335721133969408', '42334086215241728', '申请报销', 'expense-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42335817183531008', '42334086215241728', '编辑报销', 'expense-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42335940605120512', '42334086215241728', '报销查看', 'expense-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336024805773312', '42334086215241728', '审批报销', 'expense-approval', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336123501940736', '42334086215241728', '出差', 'businesstrip-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336206301696000', '42334086215241728', '申请出差', 'businesstrip-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336271770587136', '42334086215241728', '编辑出差', 'businesstrip-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336347972702208', '42334086215241728', '出差查看', 'businesstrip-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336433490366464', '42334086215241728', '审批出差', 'businesstrip-approval', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336599123431424', '42334086215241728', '外出', 'goout-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336697060429824', '42334086215241728', '申请外出', 'goout-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336773992353792', '42334086215241728', '编辑外出', 'goout-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336853726072832', '42334086215241728', '外出查看', 'goout-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42336946441162752', '42334086215241728', '审批外出', 'goout-approval', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337029878452224', '42334086215241728', '物品', 'oagood-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337132236247040', '42334086215241728', '申请物品', 'oagood-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337204650905600', '42334086215241728', '编辑物品', 'oagood-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337301711294464', '42334086215241728', '物品查看', 'oagood-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337378299285504', '42334086215241728', '审批物品', 'oagood-approval', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337482720677888', '0', '知识分享', 'knowledge', 'tasks', '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337629286436864', '42337482720677888', '知识列表', 'knowledge-manage', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337745028255744', '42337482720677888', '发布知识', 'knowledge-add', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42337817904287744', '42337482720677888', '编辑知识', 'knowledge-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42338272126439424', '0', '员工相册', 'album', 'plane', '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42338384647032832', '42338272126439424', '相册列表', 'album-manage', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42338452590563328', '42338272126439424', '上传相片', 'album-upload', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42338538640904192', '42338272126439424', '编辑相片', 'album-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42338630085120000', '42338272126439424', '查看相册', 'album-view', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42338743775924224', '42338272126439424', '相册删除', 'album-delete', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42338841398349824', '0', '简历管理', 'resume', 'laptop', '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42338936218980352', '42338841398349824', '简历列表', 'resume-manage', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42339022474842112', '42338841398349824', '添加简历', 'resume-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42339129958076416', '42338841398349824', '编辑简历', 'resume-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42339223352643584', '42338841398349824', '删除简历', 'resume-delete', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42354722958479360', '0', '组织管理', 'user', 'user', '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42354812125188096', '42354722958479360', '用户列表', 'user-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42354905771413112', '42354722958479360', '添加用户', 'user-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42354988550197248', '42354722958479360', '编辑用户', 'user-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355171505737728', '42354722958479360', '部门列表', 'department-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355325336031232', '42354722958479360', '添加部门', 'department-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355402511224832', '42354722958479360', '编辑部门', 'department-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355510552301568', '42354722958479360', '职称列表', 'position-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355596724277248', '42354722958479360', '添加职称', 'position-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355693625282560', '42354722958479360', '编辑职称', 'position-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355773019262976', '42354722958479360', '公告列表', 'notice-manage', null, '1', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355862622179328', '42354722958479360', '添加公告', 'notice-add', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42355935212998656', '42354722958479360', '编辑公告', 'notice-edit', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42356020873269248', '42354722958479360', '删除公告', 'notice-delete', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42356198170693632', '42354722958479360', '消息列表', 'message-manage', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('42356266030338048', '42354722958479360', '删除消息', 'message-delete', null, '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64059892574457856', '42354722958479360', '组管理', 'group-manage', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64059999378214912', '42354722958479360', '添加组', 'group-add', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64060145163833344', '42354722958479360', '编辑组', 'group-edit', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64060216546693120', '42354722958479360', '删除组', 'group-delete', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64060546483228672', '42354722958479360', '组权限', 'group-permission', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64060742327865344', '42354722958479360', '组成员', 'group-user', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64060871856361472', '42354722958479360', '添加组成员', 'group-user-add', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64060949748781056', '42354722958479360', '删除组成员', 'group-user-delete', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64061137204809728', '42354722958479360', '权限管理', 'permission-manage', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64061220927311872', '42354722958479360', '添加权限', 'permission-add', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64061290498232320', '42354722958479360', '编辑权限', 'permission-edit', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64061357862948864', '42354722958479360', '删除权限', 'permission-delete', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64738735329120256', '42337482720677888', '知识删除', 'knowledge-delete', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64739027659526144', '41969010140516352', '文档列表', 'project-doc', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64739308640145408', '41969010140516352', '文档编辑', 'doc-edit', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64739380002033664', '41969010140516352', '文档添加', 'doc-add', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64739571354570752', '41969010140516352', '文档删除', 'doc-delete', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64739781774413824', '41969010140516352', '文档查看', 'doc-view', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64739963341639680', '41969010140516352', '版本列表', 'project-version', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64740034804191232', '41969010140516352', '版本编辑', 'version-edit', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64740129687736320', '41969010140516352', '版本添加', 'version-add', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64740203201302528', '41969010140516352', '版本删除', 'version-delete', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64740359808225280', '41969010140516352', '版本查看', 'version-view', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64809905348939776', '41969010140516352', '批量添加任务', 'task-batch-add', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('64815327690625024', '41969010140516352', '任务克隆', 'task-clone', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('65140829198487552', '42337482720677888', '知识查看', 'knowledge-view', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('65140900749119488', '42338272126439424', '相册查看', 'album-view', '', '0', '0', '0');
INSERT INTO `pms_permissions` VALUES ('1463352174853959138', null, 'gf', 'sdfg', 'dsfg', '0', '0', '0');

-- ----------------------------
-- Table structure for `pms_positions`
-- ----------------------------
DROP TABLE IF EXISTS `pms_positions`;
CREATE TABLE `pms_positions` (
  `positionid` bigint(20) NOT NULL COMMENT '职称ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  PRIMARY KEY (`positionid`),
  KEY `INDEX_NS` (`name`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of pms_positions
-- ----------------------------
INSERT INTO `pms_positions` VALUES ('1462292006260420932', '总经理', '管理公司日常事务', '1');
INSERT INTO `pms_positions` VALUES ('1462292041515367932', '部门经理', '负责部门事务', '1');
INSERT INTO `pms_positions` VALUES ('1462292053049130632', '主管', '管理公司日常事务', '1');
INSERT INTO `pms_positions` VALUES ('1462292065226423828', '组长', '管理公司日常事务', '1');
INSERT INTO `pms_positions` VALUES ('1462292078258175728', '员工', '公司员工', '1');

-- ----------------------------
-- Table structure for `pms_projects`
-- ----------------------------
DROP TABLE IF EXISTS `pms_projects`;
CREATE TABLE `pms_projects` (
  `projectid` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '创建人',
  `name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `aliasname` varchar(100) DEFAULT NULL COMMENT '项目别名代号',
  `started` datetime DEFAULT NULL COMMENT '开始时间',
  `ended` datetime DEFAULT NULL COMMENT '结束时间',
  `projectdescribe` text COMMENT '描述',
  `created` datetime DEFAULT NULL COMMENT '添加日期',
  `status` int(1) DEFAULT '1' COMMENT '1挂起中,2延期中,3进行中,4结束',
  `projuserid` bigint(20) DEFAULT NULL COMMENT '项目负责人',
  `produserid` bigint(20) DEFAULT NULL COMMENT '产品负责人',
  `testuserid` bigint(20) DEFAULT NULL COMMENT '测试负责人',
  `publuserid` bigint(20) DEFAULT NULL COMMENT '发布负责人',
  PRIMARY KEY (`projectid`),
  KEY `INDEX_UNCS` (`userid`,`name`,`created`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Records of pms_projects
-- ----------------------------
INSERT INTO `pms_projects` VALUES ('20170731111548454', '1467191338628906628', '当然是SDG', 'x学后感', '2017-06-03 00:00:00', '2017-07-19 00:00:00', 'DFGS', '2017-07-26 00:00:00', '2', '1467173303180539777', '1467173303180539777', '1467173303180539777', '1467173303180539777');
INSERT INTO `pms_projects` VALUES ('20170731110933804', '1467191338628906628', 'opms项目2', 'My', '2017-01-11 00:00:00', '2017-07-11 00:00:00', 'fghfd', null, '2', '20170731110933804', null, null, null);
INSERT INTO `pms_projects` VALUES ('20170731111548453', '1467191338628906628', 'opms项目管理', 'my', '2017-03-01 00:00:00', '2017-07-19 00:00:00', 'hhgfhjgfdfsd', null, '1', null, null, null, null);
INSERT INTO `pms_projects` VALUES ('20170731111548470', '1467191338628906628', 'opms项目2', 'df', '2017-02-11 00:00:00', '2017-07-11 00:00:00', 'cxv', null, '1', null, null, null, null);
INSERT INTO `pms_projects` VALUES ('66565031935873024', '1467191338628906628', 'FDG', 'SDGFS', '2017-02-28 00:00:00', '2017-07-11 00:00:00', 'GFHGF', null, '1', null, null, null, null);
INSERT INTO `pms_projects` VALUES ('20170731113700901', '1467191338628906628', 'FDG1', 'SDGFS', '2017-03-28 00:00:00', '2017-07-11 00:00:00', 'GFHGF', null, '1', null, null, null, null);
INSERT INTO `pms_projects` VALUES ('20170806194213443', '1467191338628906628', '符合国家的计划根', '上的风格大方的规', '2017-04-11 00:00:00', '2017-07-11 00:00:00', '上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费上的风格大方的规划法规规定丧葬费', null, '1', null, null, null, null);
INSERT INTO `pms_projects` VALUES ('201708071932216', '1464908736964868544', '跟帅哥', '具有太突然', '2017-08-10 00:00:00', '2017-08-11 00:00:00', '二个如果', null, '4', null, null, null, null);
INSERT INTO `pms_projects` VALUES ('20170813144953321', '1468140265954907628', 'opms', 'opms管理系统', '2017-07-11 00:00:00', '2017-07-11 00:00:00', 'opms管理系统opms管理系统opms管理系统opms管理系统opms管理系统opms管理系统', null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for `pms_projects_needs`
-- ----------------------------
DROP TABLE IF EXISTS `pms_projects_needs`;
CREATE TABLE `pms_projects_needs` (
  `needsid` bigint(20) NOT NULL,
  `projectid` bigint(20) DEFAULT NULL COMMENT '项目ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '创建人',
  `name` varchar(100) DEFAULT NULL COMMENT '需求名称',
  `description` text COMMENT '描述',
  `acceptid` bigint(20) DEFAULT NULL COMMENT '指派人userid',
  `source` int(2) DEFAULT '0' COMMENT '来源1客户,2用户,3产品经理,4市场,5客服,6竞争对手,7合作伙伴,8开发人员,9测试人员,10其他',
  `acceptance` text COMMENT '验收标准',
  `level` int(1) DEFAULT '4' COMMENT '优先级1,2,3,4',
  `tasktime` int(4) DEFAULT NULL COMMENT '预计工时',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  `stage` int(1) unsigned DEFAULT '1' COMMENT '1未开始,2已计划,3已立项,4研发中,5研发完毕,6测试中,7测试完毕,8已验收,9已发布',
  `status` int(1) DEFAULT '1' COMMENT '1草稿，2激活，3已变更，4待关闭，5已关闭',
  PRIMARY KEY (`needsid`),
  KEY `INDEX_PUNC` (`projectid`,`userid`,`name`,`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目需求表';

-- ----------------------------
-- Records of pms_projects_needs
-- ----------------------------
INSERT INTO `pms_projects_needs` VALUES ('66563530584756224', '20170731111548454', '1467173303180539777', '添加功能2', 'adsuasdaf', '1468140265954907628', '1', '的完全带我飞是否', '3', '4', 'D:\\Program Files\\Tomcat 7.0\\wtpwebapps\\OPMS\\needFile\\', '2017-07-19 11:13:23', '2017-08-07 15:44:31', '1', '1');
INSERT INTO `pms_projects_needs` VALUES ('20170805201436917', '20170731111548454', '1467173303180539777', '1141', '                        的服务 \r\n\r\n福娃付完费', '1461312703628858832', '1', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 法无法哇', '1', '3', 'D:\\Program Files (x86)\\apache-tomcat-7.0.54\\webapps\\OPMS\\needFile\\', '2017-08-05 20:14:36', '2017-08-06 20:26:26', '1', '1');
INSERT INTO `pms_projects_needs` VALUES ('20170806111716208', '20170731110933804', '1467173303180539777', 'fdsf', 'fdsf', '1461312703628858832', '1', '32', '1', '2', 'D:\\Program Files (x86)\\apache-tomcat-7.0.54\\webapps\\OPMS\\needFile\\', '2017-08-06 11:17:16', '2017-08-06 11:17:16', '1', '1');
INSERT INTO `pms_projects_needs` VALUES ('20170806112406874', '20170731110933804', '1461312703628858832', 'dwad2', 'dwad', null, '1', '', '1', '0', 'D:\\Program Files (x86)\\apache-tomcat-7.0.54\\webapps\\OPMS\\needFile\\', '2017-08-06 11:24:06', '2017-08-06 11:27:30', '1', '1');
INSERT INTO `pms_projects_needs` VALUES ('20170806205056852', '66562760133054464', '1461312703628858832', '大时代无无', '大蛇丸哇', '1467790786634901134', '2', '', '1', '2', 'D:\\Program Files (x86)\\apache-tomcat-7.0.54\\webapps\\OPMS\\needFile\\', '2017-08-06 20:50:56', '2017-08-06 20:50:56', '2', '1');

-- ----------------------------
-- Table structure for `pms_projects_task`
-- ----------------------------
DROP TABLE IF EXISTS `pms_projects_task`;
CREATE TABLE `pms_projects_task` (
  `taskid` bigint(20) NOT NULL,
  `needsid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '创建人',
  `projectid` bigint(20) DEFAULT NULL COMMENT '项目ID',
  `acceptid` bigint(20) DEFAULT NULL COMMENT '任务接受人ID',
  `ccid` varchar(100) DEFAULT NULL COMMENT '抄送给',
  `completeid` bigint(20) DEFAULT NULL COMMENT '完成者id',
  `name` varchar(100) DEFAULT NULL COMMENT '任务名称',
  `description` text COMMENT '描述',
  `note` text COMMENT '备注',
  `type` int(1) DEFAULT '8' COMMENT '任务类型1设计,2开发,3测试,4研究,5讨论,6界面,7事务,8其他',
  `level` int(1) DEFAULT '4' COMMENT '优先级1,2,3,4',
  `tasktime` int(4) DEFAULT NULL COMMENT '预计工时',
  `ended` date DEFAULT NULL COMMENT '截止日期',
  `started` date DEFAULT NULL COMMENT '预计开始时间',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件',
  `created` date DEFAULT NULL,
  `changed` date DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1未开始,2进行中,3已完成,4已暂停,5已取消,6已关闭',
  `closeid` bigint(20) DEFAULT NULL COMMENT '关闭者ID',
  `cancelid` bigint(20) DEFAULT NULL COMMENT '取消者ID',
  PRIMARY KEY (`taskid`),
  KEY `INDEX_NSPACS` (`needsid`,`userid`,`projectid`,`acceptid`,`created`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目需求任务表';

-- ----------------------------
-- Records of pms_projects_task
-- ----------------------------
INSERT INTO `pms_projects_task` VALUES ('20170805201436917', '20170806205056852', '1461312703628858832', '20170731111548454', '1467191338628906628', '', null, '思维导图版本', '思维导图版本设计', '', '4', '1', '6', '2017-08-02', null, '', null, null, '3', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('66563530584756224', '20170805201436917', '1467173303180539777', '20170731111548454', '1467191338628906628', '', null, '思维导图确认修订讨论', '', '', '4', '1', '5', '2017-08-02', null, '', null, null, '3', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('20170806111716208', '20170805201436917', '1467173303180539777', '20170731111548454', '1461312703628858832', '', null, 'UI - 用户登录', '', '', '1', '2', '5', null, null, '', null, null, '2', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('20170806111716209', '20170806205056852', '1467173303180539777', '20170731111548454', '1461312703628858832', '', null, 'UI - 用户注册', '', '', '1', '2', '3', null, null, '', null, null, '1', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('66565031851986944', '20170806205056852', '1467173303180539777', '20170731111548454', '1461312703628858832', '', null, 'UI - 用户忘记密码', '', '', '1', '3', '3', null, null, '', null, null, '1', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('66565031935873024', '20170805201436917', '1461312703628858832', '20170731111548454', '1468140265954907628', '', null, 'Front - 项目管理', '', '', '6', '3', '4', null, null, '', null, null, '2', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('66565032053313536', '20170805201436917', '1461312703628858832', '20170731111548454', '1468140265954907628', '', null, 'Front - 发布项目', '', '', '6', '3', '5', null, null, '', null, null, '1', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('66565032137199616', '20170806172941115', '1461312703628858832', '20170731111548454', '1468140265954907628', '', null, 'Front - 项目详情', '', '', '6', '3', '2', null, null, '', null, null, '1', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('66565032304971776', '20170806111716208', '1461312703628858832', '20170731111548454', '1468140265954907628', '', null, '后端 - 项目管理开发', '', '', '2', '3', '2', null, null, '', null, null, '1', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('66565032388857856', '20170806111716208', '1461312703628858832', '20170731113700901', '1468140265954907628', '', null, '后端 - 项目管理添加编辑', '', '', '2', '3', '8', null, null, '', null, null, '1', '0', '0');
INSERT INTO `pms_projects_task` VALUES ('20170807154608374', '66563530584756224', '1464908736964868544', null, null, '1468140265954907628', null, 'dwadaw', '', '', '3', null, '0', null, null, null, '2017-08-07', '2017-08-07', '1', null, null);
INSERT INTO `pms_projects_task` VALUES ('20170807155106401', '20170805201436917', '1464908736964868544', '20170731111548454', null, '1468140265954907628', null, 'dawd', '', '', '2', null, '0', null, null, 'D:\\Program Files\\Tomcat 7.0\\wtpwebapps\\OPMS\\uploadFile\\', '2017-08-07', '2017-08-07', '1', null, null);
INSERT INTO `pms_projects_task` VALUES ('20170807160203961', '20170805201436917', '1464908736964868544', '20170731111548454', null, '1468140265954907628', null, '大娃娃', '', '', '4', null, '0', null, null, 'D:\\Program Files\\Tomcat 7.0\\wtpwebapps\\OPMS\\uploadFile\\', '2017-08-07', '2017-08-07', '1', null, null);

-- ----------------------------
-- Table structure for `pms_projects_team`
-- ----------------------------
DROP TABLE IF EXISTS `pms_projects_team`;
CREATE TABLE `pms_projects_team` (
  `id` bigint(20) NOT NULL,
  `projectid` bigint(20) DEFAULT NULL COMMENT '项目ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '成员ID',
  `created` date DEFAULT NULL,
  `jointime` date DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`),
  KEY `INDEX_PU` (`projectid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目成员表';

-- ----------------------------
-- Records of pms_projects_team
-- ----------------------------
INSERT INTO `pms_projects_team` VALUES ('20170731111548454', '20170731111548454', '1466279879512435266', '2017-07-28', '2017-07-27');
INSERT INTO `pms_projects_team` VALUES ('66562826440806401', '1468915433602979028', '1464908736964868544', '2017-08-06', '2017-08-06');
INSERT INTO `pms_projects_team` VALUES ('66562826440806402', '20170731111548453', '1466279879512435266', '2017-08-06', '2017-08-06');
INSERT INTO `pms_projects_team` VALUES ('66562826440806403', '20170731111548454', '1467790786634901134', '2017-08-06', '2017-08-06');

-- ----------------------------
-- Table structure for `pms_projects_test`
-- ----------------------------
DROP TABLE IF EXISTS `pms_projects_test`;
CREATE TABLE `pms_projects_test` (
  `testid` bigint(20) NOT NULL,
  `taskid` bigint(20) DEFAULT NULL,
  `needsid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '创建人',
  `projectid` bigint(20) DEFAULT NULL COMMENT '项目ID',
  `acceptid` bigint(20) DEFAULT NULL COMMENT '任务接受人ID',
  `completeid` bigint(20) DEFAULT NULL COMMENT '完成者uid',
  `ccid` bigint(20) DEFAULT NULL COMMENT '抄送者',
  `name` varchar(100) DEFAULT NULL COMMENT 'bug名称',
  `bugdesc` text COMMENT '描述',
  `level` int(1) DEFAULT '4' COMMENT '优先级1,2,3,4',
  `os` varchar(20) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(20) DEFAULT NULL COMMENT '浏览器',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件',
  `completed` datetime DEFAULT NULL COMMENT '解决日期',
  `created` datetime NOT NULL,
  `changed` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '解决方案:1设计如此,2重复Bug,3外部原因,4已解决,5无法重现,6延期处理,7不予解决',
  PRIMARY KEY (`testid`),
  KEY `INDEX_TNUPAC` (`taskid`,`needsid`,`userid`,`projectid`,`acceptid`,`created`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目任务bug表';

-- ----------------------------
-- Records of pms_projects_test
-- ----------------------------
INSERT INTO `pms_projects_test` VALUES ('1000012555', '66565031201869824', '66563530584756224', '2322434', '20170731110933804', '1468915433602979028', null, '1468140265954907628', 'bug', '', '4', 'windows', 'ie10', 'OPMS20170804150555192.docx', '2017-08-17 15:57:44', '2017-07-31 15:53:17', '2017-08-04 15:05:55', '5');
INSERT INTO `pms_projects_test` VALUES ('100001256', '66565031201869824', '20170806111716208', '2322434', '20170731110933804', '1468915433602979028', null, '1467790786634901134', 'bug', '', '4', 'windows', 'ie8', null, null, '2017-07-31 15:58:40', null, '1');
INSERT INTO `pms_projects_test` VALUES ('20170805112230522', '66565031201869824', '66563530584756224', '2322434', '20170731110933804', '1468140265954907600', null, '1468140265954907628', '国际化', '', '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805112230431.doc', null, '2017-08-05 11:22:30', null, '1');
INSERT INTO `pms_projects_test` VALUES ('20170805113029103', '66565031201869824', '66563530584756224', '2322434', '20170731110933804', '1468140265954907600', null, '1468140265954907628', '程序', 'XVGDF', '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805113029340.docx', null, '2017-08-05 11:30:29', null, '3');
INSERT INTO `pms_projects_test` VALUES ('20170805113502885', '66565031700992000', '20170805201436917', '2322434', '20170731110933804', '1461312703628859000', null, '1468140265954907628', '呈现出', null, '1', 'windows', 'ie', null, null, '2017-08-05 11:35:02', '2017-08-06 15:15:35', '2');
INSERT INTO `pms_projects_test` VALUES ('20170806185345723', '66565030916657150', '66563530584756224', '2322434', '66562760133054464', '1461312703628858832', null, '1461312703628858832', 'dss', '', '1', 'windows', 'ie', null, null, '2017-08-06 18:53:45', null, '5');
INSERT INTO `pms_projects_test` VALUES ('20170805114241784', '66565031700992000', '20170805201436917', '2322434', '20170731110933804', '1461312703628858832', null, '1468140265954907628', '在电饭锅', null, '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805114241898.doc', null, '2017-08-05 11:42:41', null, '3');
INSERT INTO `pms_projects_test` VALUES ('20170805114829882', '66565031700992000', '20170805201436917', '2322434', '20170731110933804', '1461312703628858832', null, null, '电饭锅', null, '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805114829474.doc', null, '2017-08-05 11:48:29', null, '5');
INSERT INTO `pms_projects_test` VALUES ('2017080511504814', '66565031700992000', '20170805201436917', '2322434', '20170731110933804', '1461312703628858832', null, null, '分工会尽快', null, '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805115048732.doc', null, '2017-08-05 11:50:48', null, '7');
INSERT INTO `pms_projects_test` VALUES ('20170805115903316', '66565031935873024', '20170805201436917', '2322434', '20170731110933804', '1461312703628858832', null, null, 'VB半年没见', null, '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805115903406.doc', null, '2017-08-05 11:59:03', null, '5');
INSERT INTO `pms_projects_test` VALUES ('20170805143938594', '66565031935873024', '20170806111716208', '2322434', '2322434', '1461312703628858832', null, '1461312703628858832', '发这个', null, '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805143938379.docx', null, '2017-08-05 14:39:38', null, '6');
INSERT INTO `pms_projects_test` VALUES ('20170805145527464', '66565031935873024', '20170806111716208', '2322434', '2322434', '1461312703628858832', null, null, null, null, '4', null, null, null, null, '2017-08-05 14:55:27', null, '2');
INSERT INTO `pms_projects_test` VALUES ('20170805144748549', '66565031935873024', '20170806111716208', '2322434', '2322434', '1461312703628858832', null, '1468140265954907628', '发的', null, '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805144748406.doc', null, '2017-08-05 14:47:48', null, '3');
INSERT INTO `pms_projects_test` VALUES ('20170805150122430', '66565031935873024', '20170806111716208', '2322434', '2322434', '1461312703628858832', null, null, null, null, '4', null, null, null, null, '2017-08-05 15:01:22', null, '1');
INSERT INTO `pms_projects_test` VALUES ('20170805153514351', '66565031935873024', '20170806111716208', '2322434', '2322434', '1461312703628858832', null, '1461312703628858832', '的说法', null, '1', 'windows', 'ie', 'D:/javacode/MyOPMS/WebRoot/attachment/OPMS20170805153514729.docx', null, '2017-08-05 15:35:14', null, '3');
INSERT INTO `pms_projects_test` VALUES ('20170806110009146', '66565031935873024', null, '2322434', null, null, null, null, 'fdy', null, '1', 'windows', 'ie', null, null, '2017-08-06 11:00:09', null, '0');
INSERT INTO `pms_projects_test` VALUES ('20170806110015663', '66565031935873024', null, '2322434', null, null, null, null, 'fdy', null, '1', 'windows', 'ie', null, null, '2017-08-06 11:00:15', null, '0');
INSERT INTO `pms_projects_test` VALUES ('20170806110016937', '66565031935873024', null, '2322434', null, null, null, null, 'fdy', null, '1', 'windows', 'ie', null, null, '2017-08-06 11:00:16', null, '0');
INSERT INTO `pms_projects_test` VALUES ('20170806110016187', '66565031935873024', null, '2322434', null, null, null, null, 'fdy', null, '1', 'windows', 'ie', null, null, '2017-08-06 11:00:16', null, '0');
INSERT INTO `pms_projects_test` VALUES ('20170806110016843', '66565031935873024', null, '2322434', null, null, null, null, 'fdy', null, '1', 'windows', 'ie', null, null, '2017-08-06 11:00:16', null, '0');
INSERT INTO `pms_projects_test` VALUES ('20170807131330240', '20170806111716210', '20170806205056852', '1464908736964868544', '66562760133054464', '1461312703628858832', null, '1467790786634901134', 'DFHDF', '', '1', 'windows', 'ie', null, null, '2017-08-07 13:13:30', null, '3');

-- ----------------------------
-- Table structure for `pms_resumes`
-- ----------------------------
DROP TABLE IF EXISTS `pms_resumes`;
CREATE TABLE `pms_resumes` (
  `resumeid` bigint(20) unsigned NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `edu` int(2) DEFAULT NULL,
  `work` int(1) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT '暂无',
  `created` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1入档2通知面试3违约4录用5不录用',
  `note` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`resumeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历表';

-- ----------------------------
-- Records of pms_resumes
-- ----------------------------
INSERT INTO `pms_resumes` VALUES ('170807195904493', 'meng', '1', '2017-08-09', '4', '3', 'uploadFile\\log.txt', '2017-08-07 19:59:04', '1', 'hahahah', '18829783807');
INSERT INTO `pms_resumes` VALUES ('170807200003428', '萌', '1', '2017-08-23', '3', '3', 'uploadFile\\待完成_请假审批.pdm', '2017-08-07 20:00:03', '1', '就哈哈哈', '18829783807');
INSERT INTO `pms_resumes` VALUES ('170807200129315', '永', '1', '2017-09-06', '3', '2', 'uploadFile\\新建 Microsoft Word 文档.docx', '2017-08-07 20:01:29', '5', '哈哈哈', '18829783807');

-- ----------------------------
-- Table structure for `pms_users`
-- ----------------------------
DROP TABLE IF EXISTS `pms_users`;
CREATE TABLE `pms_users` (
  `userid` bigint(20) NOT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `status` int(1) DEFAULT '1' COMMENT '状态1正常，2屏蔽',
  PRIMARY KEY (`userid`),
  KEY `INDEX_US` (`username`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- ----------------------------
-- Records of pms_users
-- ----------------------------
INSERT INTO `pms_users` VALUES ('1461157223500299818', null, '行政-员工3', '4e4f3f0c28326edb41b084adcf8dd8b8', null, '1');
INSERT INTO `pms_users` VALUES ('1462156364634602320', null, '行政-李珍', 'ef36d1b01f0fd82077e5de909fe70d3f', null, '1');
INSERT INTO `pms_users` VALUES ('1462211970061533193', null, '研发-胡铃涛', '4a1fe90a811e99e1d3b89c439ac80f30', null, '1');
INSERT INTO `pms_users` VALUES ('1464457307598458960', null, '研发-员工2', '8fd6259a3ee81b3d9b409e3a16cacacf', null, '1');
INSERT INTO `pms_users` VALUES ('1464538925768193780', null, '市场-李彦鹏', 'c68559615cd7bf33b70ba7656f2c2723', null, '1');
INSERT INTO `pms_users` VALUES ('1466279879512435266', null, '研发-全欢欢', 'b8d09287944420b5d40208632a4a2522', null, '1');
INSERT INTO `pms_users` VALUES ('1467191338628906628', '1467191338628906628', '行政-孙文科', 'b94f24c63a73d3a90672a16e68e86cb8', '/static/img/avatar/3.jpg', '1');
INSERT INTO `pms_users` VALUES ('1467830594111128822', null, '行政-许康', 'ecc0d3c4b15544883af933b924650f7c', null, '1');
INSERT INTO `pms_users` VALUES ('1468140265954907628', '1468140265954907628', 'admin', '038bdaf98f2037b31f1e75b5b4c9b26e', '/static/img/avatar/2.jpg', '1');
INSERT INTO `pms_users` VALUES ('1468493446528498192', null, '运营-员工1', 'edafbf759a5c6d1b1921e48d8d6b84b6', null, '1');
INSERT INTO `pms_users` VALUES ('1468749771763614096', null, '研发-员工1', '4d2353fdba83fe5a41c6154e0c0ec439', null, '1');
INSERT INTO `pms_users` VALUES ('1468915433602979028', '1468915433602979028', '行政-员工1', 'adb21d362b53724df44f88bba2f398c2', '/static/img/avatar/1.jpg', '1');
INSERT INTO `pms_users` VALUES ('1469024587469707428', '1469024587469707428', '行政-员工2', '96641b7f875d04e628d13fbc42a446e3', '/static/img/avatar/1.jpg', '1');
INSERT INTO `pms_users` VALUES ('1469898966963122920', null, '人事-孟永飞', '33ee80545916b0c6fda897516b9af66a', null, '1');

-- ----------------------------
-- Table structure for `pms_users_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `pms_users_permissions`;
CREATE TABLE `pms_users_permissions` (
  `userid` bigint(20) NOT NULL,
  `permission` varchar(5000) DEFAULT NULL,
  `model` varchar(5000) DEFAULT NULL,
  `modelc` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表（已弃用）';

-- ----------------------------
-- Records of pms_users_permissions
-- ----------------------------
INSERT INTO `pms_users_permissions` VALUES ('1461312703628858832', 'project-manage,project-add,project-edit,project-team,team-add,team-delete,project-need,need-add,need-edit,project-task,task-add,task-edit,project-test,test-add,test-edit,checkwork-manage,checkwork-all,message-manage,message-delete,leave-manage,leave-add,leave-edit,leave-view,leave-approval,overtime-manage,overtime-add,overtime-edit,overtime-view,overtime-approval,expense-manage,expense-add,expense-edit,expense-view,expense-approval,businesstrip-manage,businesstrip-add,businesstrip-edit,businesstrip-view,businesstrip-approval,goout-manage,goout-add,goout-edit,goout-view,goout-approval,oagood-manage,oagood-add,oagood-edit,oagood-view,oagood-approval,knowledge-manage,knowledge-add,knowledge-edit,album-manage,album-upload,album-edit,resume-manage,resume-add,resume-edit,resume-delete,user-manage,user-add,user-edit,user-permission,department-manage,department-add,department-edit,position-manage,position-add,position-edit,notice-manage,notice-add,notice-edit,notice-delete', '项目管理-project-book||project-manage,考勤管理-checkwork-tasks||checkwork-list,审批管理-approval-suitcase||#,知识分享-knowledge-tasks||knowledge-list,员工相册-album-plane||album-list,简历管理-resume-laptop||resume-list,员工管理-user-user||#', '请假-approval||leave-manage,加班-approval||overtime-manage,报销-approval||expense-manage,出差-approval||businesstrip-manage,外出-approval||goout-manage,物品-approval||oagood-manage,员工-user||user-manage,部门-user||department-manage,职称-user||position-manage,公告-user||notice-manage');
INSERT INTO `pms_users_permissions` VALUES ('1467191338628906628', 'project-team,team-add,team-delete,project-need,need-add,need-edit,project-task,task-add,task-edit,project-test,test-add,test-edit,checkwork-manage,message-manage,message-delete,leave-manage,leave-add,leave-edit,leave-view,leave-approval,overtime-manage,overtime-add,overtime-edit,overtime-view,overtime-approval,expense-manage,expense-add,expense-edit,expense-view,expense-approval,businesstrip-manage,businesstrip-add,businesstrip-edit,businesstrip-view,businesstrip-approval,goout-manage,goout-add,goout-edit,goout-view,goout-approval,oagood-manage,oagood-add,oagood-edit,oagood-view,oagood-approval,knowledge-manage,knowledge-add,knowledge-edit,album-manage,album-upload,album-edit', '项目管理-project-book||project-manage,考勤管理-checkwork-tasks||checkwork-list,审批管理-approval-suitcase||#,知识分享-knowledge-tasks||knowledge-list,员工相册-album-plane||album-list', '请假-approval||leave-manage,加班-approval||overtime-manage,报销-approval||expense-manage,出差-approval||businesstrip-manage,外出-approval||goout-manage,物品-approval||oagood-manage');
INSERT INTO `pms_users_permissions` VALUES ('1468140265954907628', 'project-team,team-add,team-delete,project-need,need-add,need-edit,project-task,task-add,task-edit,project-test,test-add,test-edit,checkwork-manage,checkwork-all,message-manage,message-delete,leave-manage,leave-add,leave-edit,leave-view,leave-approval,overtime-manage,overtime-add,overtime-edit,overtime-view,overtime-approval,expense-manage,expense-add,expense-edit,expense-view,expense-approval,businesstrip-manage,businesstrip-add,businesstrip-edit,businesstrip-view,businesstrip-approval,goout-manage,goout-add,goout-edit,goout-view,goout-approval,oagood-manage,oagood-add,oagood-edit,oagood-view,oagood-approval,knowledge-manage,knowledge-add,knowledge-edit,album-manage,album-upload,album-edit', '项目管理-project-book||project-manage,考勤管理-checkwork-tasks||checkwork-list,审批管理-approval-suitcase||#,知识分享-knowledge-tasks||knowledge-list,员工相册-album-plane||album-list', '请假-approval||leave-manage,加班-approval||overtime-manage,报销-approval||expense-manage,出差-approval||businesstrip-manage,外出-approval||goout-manage,物品-approval||oagood-manage');
INSERT INTO `pms_users_permissions` VALUES ('1468915433602979028', 'project-team,team-add,team-delete,project-need,need-add,need-edit,project-task,task-add,task-edit,project-test,test-add,test-edit,leave-manage,leave-add,leave-edit,leave-view,leave-approval,overtime-manage,overtime-add,overtime-edit,overtime-view,overtime-approval,expense-manage,expense-add,expense-edit,expense-view,expense-approval,businesstrip-manage,businesstrip-add,businesstrip-edit,businesstrip-view,businesstrip-approval,goout-manage,goout-add,goout-edit,goout-view,goout-approval,oagood-manage,oagood-add,oagood-edit,oagood-view,oagood-approval,knowledge-manage,knowledge-add,knowledge-edit,album-manage,album-upload,album-edit', '项目管理-project-book||project-manage,审批管理-approval-suitcase||#,知识分享-knowledge-tasks||knowledge-list,员工相册-album-plane||album-list', '请假-approval||leave-manage,加班-approval||overtime-manage,报销-approval||expense-manage,出差-approval||businesstrip-manage,外出-approval||goout-manage,物品-approval||oagood-manage');
INSERT INTO `pms_users_permissions` VALUES ('1469024587469707428', 'project-team,team-add,team-delete,project-need,need-add,need-edit,project-task,task-add,task-edit,project-test,test-add,test-edit,leave-manage,leave-add,leave-edit,leave-view,leave-approval,overtime-manage,overtime-add,overtime-edit,overtime-view,overtime-approval,expense-manage,expense-add,expense-edit,expense-view,expense-approval,businesstrip-manage,businesstrip-add,businesstrip-edit,businesstrip-view,businesstrip-approval,goout-manage,goout-add,goout-edit,goout-view,goout-approval,oagood-manage,oagood-add,oagood-edit,oagood-view,oagood-approval,knowledge-manage,knowledge-add,knowledge-edit,album-manage,album-upload,album-edit', '项目管理-project-book||project-manage,审批管理-approval-suitcase||#,知识分享-knowledge-tasks||knowledge-list,员工相册-album-plane||album-list', '请假-approval||leave-manage,加班-approval||overtime-manage,报销-approval||expense-manage,出差-approval||businesstrip-manage,外出-approval||goout-manage,物品-approval||oagood-manage');

-- ----------------------------
-- Table structure for `pms_users_profile`
-- ----------------------------
DROP TABLE IF EXISTS `pms_users_profile`;
CREATE TABLE `pms_users_profile` (
  `userid` bigint(20) NOT NULL,
  `realname` varchar(15) DEFAULT NULL COMMENT '姓名',
  `sex` int(1) DEFAULT '1' COMMENT '1男2女',
  `birth` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `webchat` varchar(15) DEFAULT NULL COMMENT '微信号',
  `qq` varchar(15) DEFAULT NULL COMMENT 'qq号',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `emercontact` varchar(15) DEFAULT NULL COMMENT '紧急联系人',
  `emerphone` varchar(15) DEFAULT NULL COMMENT '紧急电话',
  `departid` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `positionid` bigint(20) DEFAULT NULL COMMENT '职位id',
  `lognum` int(10) DEFAULT '0' COMMENT '登录次数',
  `ip` varchar(15) DEFAULT NULL COMMENT '最近登录IP',
  `lasted` date DEFAULT NULL COMMENT '最近登录时间',
  PRIMARY KEY (`userid`),
  KEY `INDEX_RSL` (`realname`,`sex`,`lasted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详情表';

-- ----------------------------
-- Records of pms_users_profile
-- ----------------------------
INSERT INTO `pms_users_profile` VALUES ('1461157223500299818', '行政员工3', '1', '2017-08-20', 'zhiwei_94@163.com', 'zs-milu3651', '1099157192', '18735353532', '021-8412252', '九新公路', '李白', '18921353215', '1462290228639093428', '1462292078258175728', '0', null, null);
INSERT INTO `pms_users_profile` VALUES ('1462156364634602320', '李珍', '2', '2017-08-01', '1099157192@qq.com', 'zs-milu3651', '1099157192', '13435668545', '029-12345678', '九新公路', '任少龙', '18921353215', '1462290228639093428', '1462292041515367932', '15', null, '2017-08-08');
INSERT INTO `pms_users_profile` VALUES ('1462211970061533193', '胡铃涛', '1', '1997-03-05', '32175982@qq.com', '', '', '13789645373', '', '', '胡闹', '18765457757', '1462290127694985332', '1462292041515367932', '2', null, '2017-08-13');
INSERT INTO `pms_users_profile` VALUES ('1464457307598458960', '研发员工2', '1', '2017-01-24', '1099157192@qq.com', 'zs-milu3651', '1099157192', '13256547545', '029-12345678', '九新公路', '小白', '18921353215', '1462290127694985332', '1462292078258175728', '0', null, null);
INSERT INTO `pms_users_profile` VALUES ('1464538925768193780', '李彦鹏', '1', '1996-03-11', '2292816615@qq.com', '', '', '18302947528', '', '', '李元芳', '18302947528', '1462290199274575028', '1462292065226423828', '0', null, null);
INSERT INTO `pms_users_profile` VALUES ('1466279879512435266', '全欢欢', '1', '1996-07-11', '32175982@qq.com', '', '', '13565376543', '', '', '全部', '18424768493', '1462290127694985332', '1462292053049130632', '30', null, null);
INSERT INTO `pms_users_profile` VALUES ('1467191338628906628', '孙文科', '1', '1985-12-11', 'test@test1.com', 'zs-milu3651', '9035617021', '13524512532', '021-8412252', '九新公路', '孟永飞', '13524513262', '1462290228639093428', '1462292041515367932', '4', '', '2017-08-12');
INSERT INTO `pms_users_profile` VALUES ('1467830594111128822', '许康', '1', '2017-08-13', 'king4@163.com', 'zs-milu3651', '1099157192', '13892353535', '22346345235', '九新公路1111', '李白', '13524513262', '1462290228639093428', '1462292041515367932', '0', null, '2017-08-05');
INSERT INTO `pms_users_profile` VALUES ('1468140265954907628', '管理员', '1', '1994-08-11', 'cto@nahehuo.com', 'zs-milu365', '903561702', '13524396586', '021-84122521', '九新公路华西办公楼', 'lock', '13524513262', '1462290127694985332', '1462292053049130632', '272', '', '2017-08-24');
INSERT INTO `pms_users_profile` VALUES ('1468493446528498192', '运营员工1', '2', '1995-06-07', '32175982@qq.com', '', '', '17894647355', '', '', '梁耳', '18424798767', null, null, '0', null, null);
INSERT INTO `pms_users_profile` VALUES ('1468749771763614096', '研发员工1', '1', '2013-02-06', '789432175982@qq.com', '', '', '18765355673', '', '', '王昭', '18765365673', '1462290127694985332', '1462292078258175728', '2', null, '2017-08-13');
INSERT INTO `pms_users_profile` VALUES ('1468915433602979028', '行政员工1', '1', '1992-09-10', 'test@test.coma', 'zs-milu365', '903561702', '13524512531', '021-84122521', '外滩一号', 'lock', '13524513262', '1462290228639093428', '1462292078258175728', '1', '', '2017-07-03');
INSERT INTO `pms_users_profile` VALUES ('1469024587469707428', '行政员工2', '1', '1997-09-06', 'test@test.com', 'ls-milu365', '903561702', '13521234231', '021-84122521', '外滩一号', '李呀', '13524513262', '1462290228639093428', '1462292078258175728', '1', '', '2017-07-09');
INSERT INTO `pms_users_profile` VALUES ('1469898966963122920', '孟永飞', '1', '2017-01-19', '1099157192@qq.com', 'zs-milu3651', '1099157192', '15334342532', '029-12345678', '九新公路', '李白', '18921353215', '1465611154090252951', '1462292006260420932', '4', null, '2017-08-13');
