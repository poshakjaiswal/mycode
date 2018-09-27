/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : golf_zs

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2018-09-27 15:52:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ef_account
-- ----------------------------
DROP TABLE IF EXISTS `ef_account`;
CREATE TABLE `ef_account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(11) NOT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `balance` double(10,2) DEFAULT NULL COMMENT '余额',
  `is_alive` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '锁（1解锁 2锁定）',
  `zs_balance` double(12,2) DEFAULT '0.00',
  `sr_balance` double(12,2) DEFAULT '0.00',
  `cz_balance` double(12,2) DEFAULT '0.00',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户账户表-4';

-- ----------------------------
-- Table structure for ef_activity
-- ----------------------------
DROP TABLE IF EXISTS `ef_activity`;
CREATE TABLE `ef_activity` (
  `activity_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(30) DEFAULT NULL,
  `state` tinyint(3) DEFAULT NULL COMMENT '0 开 1 关',
  `type_one` tinyint(10) DEFAULT NULL COMMENT '0 注册送优惠券 1商城下单送券',
  `type_two` tinyint(10) DEFAULT NULL COMMENT 'one_type=''0'' two_type=''0''(送券)',
  `description` varchar(255) DEFAULT NULL,
  `begin_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `reserved2` varchar(20) DEFAULT NULL,
  `reserved3` varchar(20) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ef_activity_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ef_activity_coupon`;
CREATE TABLE `ef_activity_coupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `coupon_num` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ef_area_dic
-- ----------------------------
DROP TABLE IF EXISTS `ef_area_dic`;
CREATE TABLE `ef_area_dic` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '区域名称',
  `areaNo` varchar(255) DEFAULT NULL COMMENT '区域编号',
  `parent` bigint(255) DEFAULT NULL COMMENT '父级区域',
  `isActivated` int(11) NOT NULL DEFAULT '1' COMMENT '0:未激活 1:已激活',
  `isTradingArea` int(11) DEFAULT NULL COMMENT '是否是商圈(0:不是 1:是)',
  `isHot` int(1) NOT NULL COMMENT '(0:不是 1：是)',
  `level` int(11) DEFAULT NULL COMMENT '区域级别(0:国家级 1:省级 2:市级 3:县/区)',
  `isChina` int(1) DEFAULT '1' COMMENT '1:国内 2：国外',
  `pinyin` varchar(10) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `createdBy` bigint(11) DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `modifiedBy` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3692 DEFAULT CHARSET=utf8 COMMENT='区域字典表';

-- ----------------------------
-- Table structure for ef_authentication
-- ----------------------------
DROP TABLE IF EXISTS `ef_authentication`;
CREATE TABLE `ef_authentication` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL COMMENT '用户主键(教练，球童，服务经理)',
  `qiuhui_id` int(20) DEFAULT NULL COMMENT '球会id',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '认证类型：(1.球童 2.教练 3.服务经理)',
  `create_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否认证 (1.生效，2.失效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='球童,教练,服务经理认证记录表';

-- ----------------------------
-- Table structure for ef_back
-- ----------------------------
DROP TABLE IF EXISTS `ef_back`;
CREATE TABLE `ef_back` (
  `back_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account_id_from` int(11) NOT NULL COMMENT '资金来源账户',
  `account_id_to` int(11) NOT NULL COMMENT '资金流向账户',
  `money` double(10,2) DEFAULT NULL COMMENT '退款金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `apply_id` int(11) NOT NULL COMMENT '退款申请表id',
  PRIMARY KEY (`back_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='退款记录表-8';

-- ----------------------------
-- Table structure for ef_back_money_apply
-- ----------------------------
DROP TABLE IF EXISTS `ef_back_money_apply`;
CREATE TABLE `ef_back_money_apply` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `money` double(10,2) DEFAULT NULL COMMENT '退款金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '退款状态 （处理中 已完成）',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='退款申请表-9';

-- ----------------------------
-- Table structure for ef_balance_add
-- ----------------------------
DROP TABLE IF EXISTS `ef_balance_add`;
CREATE TABLE `ef_balance_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL COMMENT '发放金额',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `money_type` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '余额类型 1 可以提现余额 2 不可提现月',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='余额派发表';

-- ----------------------------
-- Table structure for ef_banner
-- ----------------------------
DROP TABLE IF EXISTS `ef_banner`;
CREATE TABLE `ef_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '广告标题',
  `url` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  `sorting` int(2) DEFAULT NULL COMMENT '排列顺序',
  `grouping` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '分组(0首页 1订场 3 球童 2教练 4赛事)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='广告横幅-3';

-- ----------------------------
-- Table structure for ef_by_black
-- ----------------------------
DROP TABLE IF EXISTS `ef_by_black`;
CREATE TABLE `ef_by_black` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(12) DEFAULT NULL,
  `by_black_id` bigint(12) DEFAULT NULL,
  `black_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_calendar
-- ----------------------------
DROP TABLE IF EXISTS `ef_calendar`;
CREATE TABLE `ef_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `c_date` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '日期',
  `c_week` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '周几',
  `c_status` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '状态（0平日 1假日 2节日）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='万年历';

-- ----------------------------
-- Table structure for ef_cashback
-- ----------------------------
DROP TABLE IF EXISTS `ef_cashback`;
CREATE TABLE `ef_cashback` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `maxnum` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '最大值',
  `minnum` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '最小值',
  `create_user` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_userid` int(30) DEFAULT NULL COMMENT '创建人id',
  `modify_user` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_userid` int(30) DEFAULT NULL COMMENT '修改人id',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `proportion` int(200) DEFAULT NULL COMMENT '返现比例',
  `remark` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='充值返现';

-- ----------------------------
-- Table structure for ef_cashback_log
-- ----------------------------
DROP TABLE IF EXISTS `ef_cashback_log`;
CREATE TABLE `ef_cashback_log` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `modify_userid` int(30) DEFAULT NULL COMMENT '修改人id',
  `old_maxnum` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '更改前的返现最大值',
  `old_minnum` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '更改前的返现最小值',
  `new_maxnum` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '更改后的返现最大值',
  `new_minnum` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '更改后的返现最小值',
  `old_proportion` int(200) DEFAULT NULL COMMENT '更改前的返现比例',
  `new_proportion` int(200) DEFAULT NULL COMMENT '更改后的返现比例',
  `create_userid` int(30) DEFAULT NULL COMMENT '创建人id',
  `cashback_id` int(30) DEFAULT NULL COMMENT '充值返现表主键',
  `old_remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '更新前的备注',
  `new_remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '更新后的备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='充值返现记录日志';

-- ----------------------------
-- Table structure for ef_club_item
-- ----------------------------
DROP TABLE IF EXISTS `ef_club_item`;
CREATE TABLE `ef_club_item` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `club_id` bigint(12) DEFAULT NULL COMMENT '球会商家id',
  `settle_item` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '可结算项or地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_coach_course
-- ----------------------------
DROP TABLE IF EXISTS `ef_coach_course`;
CREATE TABLE `ef_coach_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coach_id` int(11) DEFAULT NULL COMMENT '教练Id',
  `img_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '课程图片',
  `course_num` int(11) DEFAULT NULL COMMENT '课程数（存放课程的次数）',
  `course_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '课程名称',
  `introduce` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '课程介绍',
  `site_id` int(11) DEFAULT NULL COMMENT '球场id',
  `price` double(10,2) DEFAULT NULL COMMENT '价格',
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '课程状态（1.有效 0无效）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `recommend` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐（1是 2否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='教练课程表';

-- ----------------------------
-- Table structure for ef_coach_order
-- ----------------------------
DROP TABLE IF EXISTS `ef_coach_order`;
CREATE TABLE `ef_coach_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '⁯id',
  `coach_id` int(11) DEFAULT NULL COMMENT '教练id',
  `qiuHui_id` int(11) DEFAULT NULL COMMENT '球会id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单主表id',
  `play_date` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '打球日期',
  `play_time` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '开球时间',
  `coach_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '教练姓名',
  `play_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '打球人姓名',
  `qiuHui_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '球会名称',
  `contacts_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预约教练表';

-- ----------------------------
-- Table structure for ef_collect
-- ----------------------------
DROP TABLE IF EXISTS `ef_collect`;
CREATE TABLE `ef_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(11) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL COMMENT '产品id（填写场地 教练 球童 球队 赛事 商家 商城 旅游id）',
  `collect_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '收藏类型(1场地 2.教练 3.球童 4.从业人员 5.赛事 6.商家 7.商城 8.旅游)(收藏类型(1场地 2.教练 3.球童 4.从业人员 5.赛事 6.商家 7.商城 8.旅游,9,普通用户 10.球会,11.客户经理))',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注（数据库1.7版本新增字段，用来保存关注后给用户添加备注）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='收藏表-14';

-- ----------------------------
-- Table structure for ef_comments
-- ----------------------------
DROP TABLE IF EXISTS `ef_comments`;
CREATE TABLE `ef_comments` (
  `comments_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `product_id` int(11) DEFAULT NULL COMMENT '产品id（场地 教练 球童 球队 赛事 商家 商城 旅游）',
  `comments_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '类型（1场地 2.教练 3.球童 4.球队 5.赛事 6.商家 7.商城 8.旅游）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `praise_num` int(11) DEFAULT NULL COMMENT '点赞次数',
  `content` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '逻辑删除 (1. 已删除 0.未删除)',
  PRIMARY KEY (`comments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表-16';

-- ----------------------------
-- Table structure for ef_consumption_after_setting_ticket
-- ----------------------------
DROP TABLE IF EXISTS `ef_consumption_after_setting_ticket`;
CREATE TABLE `ef_consumption_after_setting_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `scenario` int(11) DEFAULT NULL COMMENT '场景（1.场地 2.教练 3.球童 4.球队 5.赛事 6.商家 7.商城 8.旅游）',
  `allocation` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '配置',
  `enable` int(11) DEFAULT '1' COMMENT '是否启用（1启用 2停用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='消费后设置发放优惠券表-26.2';

-- ----------------------------
-- Table structure for ef_contest
-- ----------------------------
DROP TABLE IF EXISTS `ef_contest`;
CREATE TABLE `ef_contest` (
  `contest_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '赛事id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `contest_name` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '赛事名称',
  `round` int(8) DEFAULT '1' COMMENT '轮数',
  `description` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '赛事描述',
  `begin_time` datetime DEFAULT NULL COMMENT '比赛开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '比赛结束时间',
  PRIMARY KEY (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='赛事表';

-- ----------------------------
-- Table structure for ef_contest_ranks
-- ----------------------------
DROP TABLE IF EXISTS `ef_contest_ranks`;
CREATE TABLE `ef_contest_ranks` (
  `ranks_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '球队id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `introduction` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '队伍简介',
  `contest_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '赛事id',
  `ranks_name` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '队伍名称',
  PRIMARY KEY (`ranks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_contest_record
-- ----------------------------
DROP TABLE IF EXISTS `ef_contest_record`;
CREATE TABLE `ef_contest_record` (
  `record_id` int(8) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `round` int(8) NOT NULL DEFAULT '1' COMMENT '轮数',
  `group_id` int(8) NOT NULL COMMENT '组id',
  `hole` int(8) NOT NULL,
  `par` int(8) DEFAULT NULL,
  `score` int(8) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='赛事成绩表';

-- ----------------------------
-- Table structure for ef_course_order
-- ----------------------------
DROP TABLE IF EXISTS `ef_course_order`;
CREATE TABLE `ef_course_order` (
  `course_order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程订单id',
  `order_id` bigint(50) DEFAULT NULL COMMENT '订单主表id',
  `coach_id` int(11) DEFAULT NULL COMMENT '教练id',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `coach_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '教练名字',
  `course_num` int(11) DEFAULT NULL COMMENT '课程次数',
  `course_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '课程名字',
  `site_id` int(11) DEFAULT NULL COMMENT '球场id',
  `site_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '球场名字',
  `reserve_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预约人名字',
  `contacts_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `tick_id` int(11) DEFAULT NULL COMMENT '优惠券ID',
  `course_time` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '上课时间',
  `course_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '上课日期',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建用户',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`course_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_course_sign
-- ----------------------------
DROP TABLE IF EXISTS `ef_course_sign`;
CREATE TABLE `ef_course_sign` (
  `sign_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(11) DEFAULT NULL COMMENT '课程id',
  `stu_id` bigint(11) DEFAULT NULL COMMENT '学员id',
  `caoch_id` bigint(11) DEFAULT NULL COMMENT '教练id',
  `coach_sign_stauts` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '教练签到状态(0 未签到 1 已签到 2 不可签到)',
  `sign_num` bigint(11) DEFAULT NULL COMMENT '学员签到记录',
  `stu_sign_stauts` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学员签到状态(0 未签到 1 已签到 2 不可签到)',
  `stu_sign_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '学员签到日期',
  `coach_sign_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '教练签到日期',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_debit_record
-- ----------------------------
DROP TABLE IF EXISTS `ef_debit_record`;
CREATE TABLE `ef_debit_record` (
  `debit_record_id` bigint(12) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(12) DEFAULT NULL COMMENT '用户账户id',
  `user_id` bigint(12) DEFAULT NULL COMMENT '用户id',
  `cz_balance` double(12,2) DEFAULT NULL COMMENT '充值余额',
  `sr_balance` double(12,2) DEFAULT NULL COMMENT '收入余额',
  `zs_balance` double(12,2) DEFAULT NULL COMMENT '赠送余额',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `pay_form` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '支付形式(0 支付 1 转账)',
  `ping_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '（本地orderNo）//ping生成id',
  `channel` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`debit_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `ef_dynamic`;
CREATE TABLE `ef_dynamic` (
  `dynamic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '发布人id',
  `img_url` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址',
  `video_url` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '视频地址',
  `dynamic_jw` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发动态时的经、纬度',
  `lng` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发动态的经度',
  `lat` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发动态的纬度',
  `fabulous_num` int(11) DEFAULT '0' COMMENT '点赞数',
  `share_num` int(11) DEFAULT '0' COMMENT '分享数',
  `forward_num` int(11) DEFAULT '0' COMMENT '评论数',
  `gift_num` int(11) DEFAULT '0' COMMENT '礼物数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `content` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '内容',
  `share_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分享地址',
  `is_del` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '逻辑删除（1.已删除 2未删除）',
  `reserved1` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '是否精选   1是  0否',
  `reserved2` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '城市（发动态时所在城市名称）',
  `reserved3` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片宽高',
  `reserved4` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段4',
  `reserved5` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段5',
  PRIMARY KEY (`dynamic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='圈子动态表-28';

-- ----------------------------
-- Table structure for ef_dynamic_comment
-- ----------------------------
DROP TABLE IF EXISTS `ef_dynamic_comment`;
CREATE TABLE `ef_dynamic_comment` (
  `dynamic_com_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `comments_user_id` int(11) NOT NULL COMMENT '评论者ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复者ID',
  `dynamic_id` int(11) NOT NULL COMMENT '动态ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `content` varchar(1111) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `is_del` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '逻辑删除（1已删除 2未删除）',
  PRIMARY KEY (`dynamic_com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='圈子动态评论表-31';

-- ----------------------------
-- Table structure for ef_dynamic_praise
-- ----------------------------
DROP TABLE IF EXISTS `ef_dynamic_praise`;
CREATE TABLE `ef_dynamic_praise` (
  `dynamic_praise_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `dynamic_id` int(11) NOT NULL COMMENT '圈子动态ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_alive` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '是否取消（1取消 2未取消  备注：预留）',
  PRIMARY KEY (`dynamic_praise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='圈子动态点赞表-32';

-- ----------------------------
-- Table structure for ef_flow
-- ----------------------------
DROP TABLE IF EXISTS `ef_flow`;
CREATE TABLE `ef_flow` (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `money` double(10,2) DEFAULT NULL COMMENT '流水金额',
  `sequence_number` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流水号',
  `flow_type` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '类型 (2222充值 1111订单支付 3333提现 4444赠送5555退回6666佣金7777奖金8888红包退款',
  `balance` double(10,2) DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流水表-11';

-- ----------------------------
-- Table structure for ef_freeze
-- ----------------------------
DROP TABLE IF EXISTS `ef_freeze`;
CREATE TABLE `ef_freeze` (
  `freeze_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `account_id` int(11) NOT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `balance` double(10,2) DEFAULT NULL COMMENT '冻结金额',
  `account_type` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '账户类型（p个人 m商家）',
  `is_alive` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '锁（1解锁 2锁定）',
  PRIMARY KEY (`freeze_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='资金冻结表-5';

-- ----------------------------
-- Table structure for ef_get_hope_msg
-- ----------------------------
DROP TABLE IF EXISTS `ef_get_hope_msg`;
CREATE TABLE `ef_get_hope_msg` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `hope_id` bigint(12) DEFAULT NULL COMMENT '愿望id',
  `consignee` varchar(20) DEFAULT NULL COMMENT '收货人',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `waybill_no` varchar(40) DEFAULT NULL COMMENT '运单号',
  `company` varchar(55) DEFAULT NULL COMMENT '快递公司',
  `send_type` varchar(16) NOT NULL DEFAULT '''0''' COMMENT '0未发货 1已发货',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_gift
-- ----------------------------
DROP TABLE IF EXISTS `ef_gift`;
CREATE TABLE `ef_gift` (
  `gift_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gift_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '礼物名称',
  `gift_img` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '礼物图片',
  `gift_integral` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '礼物积分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `is_alive` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '是否有效（1.有效 2无效）',
  `reserved1` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段1',
  `reserved2` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段2',
  `reserved3` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段3',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='礼物表-30';

-- ----------------------------
-- Table structure for ef_gift_give
-- ----------------------------
DROP TABLE IF EXISTS `ef_gift_give`;
CREATE TABLE `ef_gift_give` (
  `gift_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL COMMENT '赠送者id',
  `dynamic_id` int(11) DEFAULT NULL COMMENT '动态ID',
  `gift_id` int(11) DEFAULT NULL COMMENT '礼物ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reciever_id` int(11) DEFAULT NULL COMMENT '礼物接受者id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '群id',
  PRIMARY KEY (`gift_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='礼物赠送关系表-30.1';

-- ----------------------------
-- Table structure for ef_group
-- ----------------------------
DROP TABLE IF EXISTS `ef_group`;
CREATE TABLE `ef_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rongLianYunGroupId` varchar(255) NOT NULL COMMENT '群id',
  `qiuHuiId` bigint(20) DEFAULT NULL COMMENT '球会id',
  `qunName` varchar(255) DEFAULT NULL COMMENT '群名称',
  `userId` int(11) DEFAULT NULL COMMENT '群管理员id',
  `permission` varchar(255) DEFAULT NULL COMMENT '//群申请加入模式 // 0：默认直接加入 //1需要身份验证 //2私有群组    缺省0',
  `declared` varchar(255) DEFAULT NULL COMMENT '群公告',
  `groupCreateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '群城里时间',
  `groupModifyTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '群修改时间',
  `del` varchar(255) DEFAULT NULL COMMENT '是否删除(1 删除 0 未删除)',
  `createUser` int(11) DEFAULT NULL COMMENT '创建人id',
  `modifyUser` int(11) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`,`rongLianYunGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_hope
-- ----------------------------
DROP TABLE IF EXISTS `ef_hope`;
CREATE TABLE `ef_hope` (
  `hope_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户表ID',
  `hope_state` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '心愿状态（1未完成 2完成 3失效）',
  `hope_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '类型（1场地 2商品）',
  `product_id` int(11) DEFAULT NULL COMMENT '产品id(球场,商品)',
  `hope_money` double(10,2) DEFAULT '0.00' COMMENT '订单金额（总金额）',
  `every_hope_money` double(10,2) DEFAULT NULL COMMENT '实现愿望每份金额',
  `hope_real_money` double(10,2) DEFAULT '0.00' COMMENT '已实现金额',
  `begin_date` date DEFAULT NULL COMMENT '开球日期',
  `begin_time` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '开球时间',
  `prduct_rule` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品规格（前端拼接好字符串传入后台',
  `hope_content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '愿望内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reserved1` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段1(修改为愿望图片)',
  `reserved2` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段2(修改为愿望名称)',
  `reserved3` datetime DEFAULT NULL COMMENT '预留字段3(修改为失效日期)',
  `reserved4` datetime DEFAULT NULL COMMENT '预留字段4(领取时间)',
  `realize_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '实现时间',
  `get_stauts` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '领取状态(0,未领取 1，已领取 2，已过期)',
  `site_order_stauts` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`hope_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='心愿表-29';

-- ----------------------------
-- Table structure for ef_hope_order
-- ----------------------------
DROP TABLE IF EXISTS `ef_hope_order`;
CREATE TABLE `ef_hope_order` (
  `hope_order_id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(12) DEFAULT NULL,
  `user_id` bigint(12) DEFAULT NULL,
  `hope_id` bigint(12) DEFAULT NULL,
  `pay_money` double(12,0) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`hope_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_hope_record
-- ----------------------------
DROP TABLE IF EXISTS `ef_hope_record`;
CREATE TABLE `ef_hope_record` (
  `hope_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID（付款者）',
  `hope_id` int(11) DEFAULT NULL COMMENT '心愿id',
  `pay_money` double(10,2) DEFAULT NULL COMMENT '支付金额',
  `pay_state` double(10,2) DEFAULT NULL COMMENT '支付状态(1已支付 2成功 3失败 4未支付)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reserved1` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段1',
  `reserved2` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段2',
  `reserved3` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段3',
  PRIMARY KEY (`hope_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='心愿实现记录表-29.1';

-- ----------------------------
-- Table structure for ef_hotcity
-- ----------------------------
DROP TABLE IF EXISTS `ef_hotcity`;
CREATE TABLE `ef_hotcity` (
  `hotcity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hotcity` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '城市名',
  PRIMARY KEY (`hotcity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='热门城市-24';

-- ----------------------------
-- Table structure for ef_img
-- ----------------------------
DROP TABLE IF EXISTS `ef_img`;
CREATE TABLE `ef_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `img_title` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '图片标题',
  `img_url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '图片url',
  `img_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '图片类别(1场地 2.教练 3.球童 4.球队 5.赛事 6.商家 7.商城 8.旅游 )',
  `product_id` int(11) NOT NULL COMMENT '产品id（场地 商品 球童 教练）',
  `sorting` int(2) DEFAULT NULL COMMENT '排列顺序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图库表-15';

-- ----------------------------
-- Table structure for ef_infrom_msg
-- ----------------------------
DROP TABLE IF EXISTS `ef_infrom_msg`;
CREATE TABLE `ef_infrom_msg` (
  `infrom_id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '通知人id',
  `user_id` bigint(15) DEFAULT NULL COMMENT '操作人id',
  `read_unread` varchar(255) DEFAULT NULL COMMENT '1 已读 0 未读',
  `infrom_type` varchar(255) DEFAULT NULL COMMENT '通知类型 1 会员认证 2邀请码 3订场订单 4预约球童订单 5预约教练订单 6预约课程订单 7商城订单 8奖励金 9个人提现 10商家提现 11面对面支付 12愿望 13红包退款 14送礼 ',
  `msg_type` varchar(255) DEFAULT NULL COMMENT '消息类型 会员认证(1 成功 2 失败)  订场订单(3 确认成功 4退订)  预约球童(5 成功提交订单 6接收 7不接收 8取消预约)  预约教练(9成功支付订单 10接收 11不接收 12取消预约 13确认赴约)  预约课程(14成功支付 15接收 16不接收 17取消预约 18上课签到 19课时费)  商城订单(20发货 21退货 22 退款 23退款审核未通过) 奖励金额(24 绑定专属码人 25奖励) 面对面支付(26向教练结算 27给球童小费) ',
  `product_id` bigint(15) DEFAULT NULL COMMENT '产品id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user` varchar(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL COMMENT '接收消息的人',
  `reserve2` varchar(255) DEFAULT NULL COMMENT 'title',
  `reserve3` varchar(255) DEFAULT NULL COMMENT 'content',
  `reserve4` varchar(255) DEFAULT NULL COMMENT 'url',
  `reserve5` varchar(255) DEFAULT NULL COMMENT '图标url',
  PRIMARY KEY (`infrom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_integral
-- ----------------------------
DROP TABLE IF EXISTS `ef_integral`;
CREATE TABLE `ef_integral` (
  `integral_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分表id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `score_total` int(11) DEFAULT NULL COMMENT '总积分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_alive` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '有效（1有效 2失效）',
  PRIMARY KEY (`integral_id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='积分表-26.3';

-- ----------------------------
-- Table structure for ef_integral_record
-- ----------------------------
DROP TABLE IF EXISTS `ef_integral_record`;
CREATE TABLE `ef_integral_record` (
  `integral_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `score` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '积分变动 例如+100 or -100',
  `proportion` int(11) DEFAULT NULL COMMENT '积分变动比例',
  `alteration_note` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '更改说明 "xxx修改积分""充值送积分""签到送积分""使用积分"',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`integral_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='积分记录表-26.4';

-- ----------------------------
-- Table structure for ef_integral_rule
-- ----------------------------
DROP TABLE IF EXISTS `ef_integral_rule`;
CREATE TABLE `ef_integral_rule` (
  `irid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(11) DEFAULT NULL COMMENT '类型 1.充值送积分 2消费送积分 3签到送积分规则',
  `proportion` int(11) DEFAULT NULL COMMENT '积分规则（比例 or 规则）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `is_alive` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '有效（1有效 2失效）',
  PRIMARY KEY (`irid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='积分规则表-26.5';

-- ----------------------------
-- Table structure for ef_jiaoyi_huizong
-- ----------------------------
DROP TABLE IF EXISTS `ef_jiaoyi_huizong`;
CREATE TABLE `ef_jiaoyi_huizong` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `type` int(12) DEFAULT NULL COMMENT '交易类型(1-订单支付 2-预存充值 3-退款 4-提现 5-收入 6-教练结算 7-打赏球童 8-买单 9-支持愿望 10- 发红包 11-赠送  12-其他 13-红包退款 14单次课程费)',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `out_in` int(12) DEFAULT NULL COMMENT '进出(1 进 2 出)',
  `money` double(12,2) DEFAULT NULL COMMENT '金额',
  `state` varchar(64) COLLATE utf8_bin DEFAULT '2' COMMENT '该笔金额是否已提现  1已提现 2未提现',
  `order_no` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `channel` varchar(24) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_member
-- ----------------------------
DROP TABLE IF EXISTS `ef_member`;
CREATE TABLE `ef_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户id',
  `member_ level` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '会员级别（默认1）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='会员表-18';

-- ----------------------------
-- Table structure for ef_member_approve
-- ----------------------------
DROP TABLE IF EXISTS `ef_member_approve`;
CREATE TABLE `ef_member_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `realname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '真实姓名',
  `phone_number` varchar(125) COLLATE utf8_bin DEFAULT NULL COMMENT '认证电话',
  `member_card` varchar(125) COLLATE utf8_bin DEFAULT NULL COMMENT '会员卡号',
  `club_id` int(11) DEFAULT NULL COMMENT '球会id',
  `approve_status` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '认证状态（0未认证 1认证成功）',
  `approve_img_up` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '正面照',
  `approve_img_down` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '替换为身份证号',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '原因',
  `over_time` datetime DEFAULT NULL COMMENT '有效期',
  `approve_time` datetime DEFAULT NULL COMMENT '审批时间',
  `lifelong` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0:终身1：不是终身',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='球场会员认证表';

-- ----------------------------
-- Table structure for ef_member_rule
-- ----------------------------
DROP TABLE IF EXISTS `ef_member_rule`;
CREATE TABLE `ef_member_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '中文解释（ps:会员等级1）',
  `leave` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '会员等级',
  `money` double(10,2) DEFAULT NULL COMMENT '最低充值金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='会员规则表-19';

-- ----------------------------
-- Table structure for ef_merchant_order
-- ----------------------------
DROP TABLE IF EXISTS `ef_merchant_order`;
CREATE TABLE `ef_merchant_order` (
  `merchant_order_id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '商家订单详情id',
  `order_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '订单编号',
  `merchant_id` bigint(12) DEFAULT NULL COMMENT '商家ID',
  `ticket_id` bigint(12) DEFAULT NULL,
  `create_user` bigint(12) DEFAULT NULL,
  `merchant_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商家名字',
  `contacts_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `pay_money` double(12,0) DEFAULT NULL COMMENT '实付金额',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更改时间',
  `old_money` double DEFAULT NULL COMMENT '原始金额',
  `discounts_money` double DEFAULT NULL COMMENT '优惠金额',
  `channel` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式 （balance wx alipay）',
  PRIMARY KEY (`merchant_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_order
-- ----------------------------
DROP TABLE IF EXISTS `ef_order`;
CREATE TABLE `ef_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account_id` int(11) NOT NULL COMMENT '用户账户表id',
  `order_no` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '订单编号（显示到页面）',
  `order_state` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '订单状态（1.待支付 2.支付完成 3.退款中 4.退款完成 5.订单完成 6.处理中 7.待确认 8.同意 9.取消 10.拒绝 11.待评价）',
  `ping_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ping++支付的订单号',
  `order_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '类型(1场地 2.教练 3.球童 4.球队 5.赛事 6.商家 7.商城 8.旅游 9.课程)',
  `order_moeny` double(10,2) DEFAULT NULL COMMENT '实付金额（总金额）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '逻辑删除 (1. 已删除 0.未删除)',
  `coupon_amount` double(10,2) DEFAULT NULL COMMENT '优惠金额',
  `amount` double(10,2) DEFAULT NULL COMMENT '原始金额',
  `ticket_id` int(20) DEFAULT NULL COMMENT '优惠劵id',
  `channel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表-12';

-- ----------------------------
-- Table structure for ef_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `ef_photo_album`;
CREATE TABLE `ef_photo_album` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '相册表id',
  `photo_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '图片类型（1.教练 2.球童 3.普通用户 ）',
  `photo_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='相册---保存用户上传的照片';

-- ----------------------------
-- Table structure for ef_platformworktime
-- ----------------------------
DROP TABLE IF EXISTS `ef_platformworktime`;
CREATE TABLE `ef_platformworktime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sTime` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '平台的上班时间',
  `xTime` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '平台的下班时间',
  `beforeHours` double DEFAULT NULL COMMENT '上班几小时后的订场可以接',
  `createTime` date DEFAULT NULL,
  `modifyTime` date DEFAULT NULL,
  `createUser` int(11) DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `position` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '位职',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_poundage
-- ----------------------------
DROP TABLE IF EXISTS `ef_poundage`;
CREATE TABLE `ef_poundage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_type` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型（1用户 2教练 3球童 4客户经理 5球会 6门店商家 7球会商家）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者',
  `day` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '每笔钱数可在day（天）后提现',
  `point` int(8) DEFAULT NULL COMMENT '服务费（%）',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='手续费参数表';

-- ----------------------------
-- Table structure for ef_praise
-- ----------------------------
DROP TABLE IF EXISTS `ef_praise`;
CREATE TABLE `ef_praise` (
  `praise_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户id',
  `comments_id` int(11) DEFAULT NULL COMMENT '评论表id',
  PRIMARY KEY (`praise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='点赞表-22';

-- ----------------------------
-- Table structure for ef_price_modify
-- ----------------------------
DROP TABLE IF EXISTS `ef_price_modify`;
CREATE TABLE `ef_price_modify` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` int(11) DEFAULT NULL COMMENT '产品id（被修改对象的 id）',
  `old_price` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改前价格',
  `new_price` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改后价格',
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '类型(0球场 1商品)',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='价格修改记录表';

-- ----------------------------
-- Table structure for ef_product_score
-- ----------------------------
DROP TABLE IF EXISTS `ef_product_score`;
CREATE TABLE `ef_product_score` (
  `product_score_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `product_type` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '产品类型(1场地 2.教练 3.球童 4.球队 5.赛事 6.商家 7.商城 8.旅游 9.课程)\r\n评分归属（1场地 2.教练 3.球童 4.球队 5.赛事 6.商家 7.商城 8.旅游 9.课程）',
  `attr_id` int(11) DEFAULT NULL COMMENT '具体评分属性',
  `score` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '具体评分属性的评',
  `comments_id` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`product_score_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='产品评分表-23';

-- ----------------------------
-- Table structure for ef_qiuhuicontrol_qiutong
-- ----------------------------
DROP TABLE IF EXISTS `ef_qiuhuicontrol_qiutong`;
CREATE TABLE `ef_qiuhuicontrol_qiutong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `qiuHuiId` int(11) DEFAULT NULL COMMENT '球会id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='球会管理球童表（如果存在球会id则可以管理球童）';

-- ----------------------------
-- Table structure for ef_qiutong_order
-- ----------------------------
DROP TABLE IF EXISTS `ef_qiutong_order`;
CREATE TABLE `ef_qiutong_order` (
  `qiutong_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `qiutong_id` int(11) DEFAULT NULL COMMENT '球童id',
  `qiuHui_id` int(11) DEFAULT NULL COMMENT '球会id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单主表id',
  `play_date` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '开球日期',
  `play_time` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '开球时间',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '球童姓名',
  `play_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '打球人姓名',
  `qiuHui_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '球会名称',
  `contacts_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`qiutong_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预约球童表';

-- ----------------------------
-- Table structure for ef_quanzi_news
-- ----------------------------
DROP TABLE IF EXISTS `ef_quanzi_news`;
CREATE TABLE `ef_quanzi_news` (
  `nsid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` int(11) NOT NULL COMMENT '类型（1.评论提示 2.点赞提示）',
  `comment_user_id` int(11) NOT NULL COMMENT '评论人ID',
  `dynamic_id` int(11) NOT NULL COMMENT '被评论动态ID',
  `reciever_id` int(11) NOT NULL COMMENT '被评论人（消息接收方）ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_read` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '是否已读（1未读 2已读 3已清除）',
  `reserved1` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段1',
  `reserved2` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段2',
  `reserved3` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段3',
  PRIMARY KEY (`nsid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='圈子通知消息提示表-27';

-- ----------------------------
-- Table structure for ef_ranks_group
-- ----------------------------
DROP TABLE IF EXISTS `ef_ranks_group`;
CREATE TABLE `ef_ranks_group` (
  `group_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '组id',
  `ranks_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '队伍id',
  `group_name` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '队伍名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='组表';

-- ----------------------------
-- Table structure for ef_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ef_recharge`;
CREATE TABLE `ef_recharge` (
  `recharge_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account_id` int(11) NOT NULL COMMENT '账户表id',
  `money` double(10,2) DEFAULT NULL COMMENT '充值金额',
  `state` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '充值状态 （待支付 处理中 已完成 异常啦）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `flow_id` int(11) NOT NULL COMMENT '流水表id',
  `order_no` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '本地单号',
  `ping_recharge_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ping充值单号',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `channel` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`recharge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='充值记录表-6';

-- ----------------------------
-- Table structure for ef_report
-- ----------------------------
DROP TABLE IF EXISTS `ef_report`;
CREATE TABLE `ef_report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '举报用户ID',
  `bereported_user_id` int(11) NOT NULL COMMENT '被举报用户ID',
  `type` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '类型（1球童 2教练 3商家 4用户）',
  `cause` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '举报原因',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `handle_state` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '''0''' COMMENT '处理状态 0未处理 1已处理',
  `handle_explain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '处理描述',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='举报记录表';

-- ----------------------------
-- Table structure for ef_reward
-- ----------------------------
DROP TABLE IF EXISTS `ef_reward`;
CREATE TABLE `ef_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型(2教练 3球童 4从业人员 8门店店员)',
  `create_time` datetime DEFAULT NULL,
  `reward` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '奖励比例',
  `section_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段 区间比例',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='奖励比例设定表';

-- ----------------------------
-- Table structure for ef_score
-- ----------------------------
DROP TABLE IF EXISTS `ef_score`;
CREATE TABLE `ef_score` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `oder_id` int(11) NOT NULL COMMENT '订单id',
  `attr_id` int(11) DEFAULT NULL COMMENT '具体评分属性',
  `score` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '具体评分属性的评分',
  PRIMARY KEY (`score_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='会员规则表-21';

-- ----------------------------
-- Table structure for ef_score_attr
-- ----------------------------
DROP TABLE IF EXISTS `ef_score_attr`;
CREATE TABLE `ef_score_attr` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr_nam` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '评分属性',
  `attr_ascription` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '评分归属（1场地 2.教练 3.球童 4.球队 5.赛事 6.商家 7.商城 8.旅游 9.课程）',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评分属性表-20';

-- ----------------------------
-- Table structure for ef_send_ticket
-- ----------------------------
DROP TABLE IF EXISTS `ef_send_ticket`;
CREATE TABLE `ef_send_ticket` (
  `ticket_zz_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '优惠券转赠ID',
  `ticket_id` bigint(20) DEFAULT NULL COMMENT '优惠券ID(用户优惠券表主id)',
  `user_id` bigint(20) DEFAULT NULL COMMENT '优惠券发放者',
  `reciever_id` bigint(20) DEFAULT NULL COMMENT '优惠券接受者',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `send_type` varchar(255) DEFAULT NULL COMMENT '发放类型（1.个人到个人  2.群里发放）',
  PRIMARY KEY (`ticket_zz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_share
-- ----------------------------
DROP TABLE IF EXISTS `ef_share`;
CREATE TABLE `ef_share` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `share_user_id` int(11) NOT NULL COMMENT '分享用户的ID',
  `share_type` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '分享方式（1QQ 2微信 3微博）',
  `share_dynamic_id` int(11) NOT NULL COMMENT '分享动态ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='圈子动态分享表-33';

-- ----------------------------
-- Table structure for ef_site
-- ----------------------------
DROP TABLE IF EXISTS `ef_site`;
CREATE TABLE `ef_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site_model` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球场模式',
  `site_create_time` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '建立时间',
  `site_area` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球场面积',
  `green_grass_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '果岭草种',
  `site_param` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球场数据',
  `site_designer` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '设计师',
  `fairway_length` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球道长度',
  `fairway_grass_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球道草种',
  `site_address` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球场地址',
  `site_city` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '所在城市',
  `site_phone` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球场电话',
  `site_introduction` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '球场简介',
  `service1` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务1',
  `service2` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务2',
  `service3` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务3',
  `service4` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务4',
  `service5` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务5',
  `service6` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务6',
  `service7` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务7',
  `service8` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务8',
  `service9` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '服务9',
  `shelves_time` datetime DEFAULT NULL COMMENT '上架时间',
  `shelf_time` datetime DEFAULT NULL COMMENT '下架时间',
  `sales_volume` int(11) DEFAULT NULL COMMENT '销量',
  `weekdays_ef_member_price` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '平日价',
  `weekdays_site_member_price` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '球场会员价（不区分平日假日和特惠日，价格常年固定）',
  `weekdays_customer_price` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '非会员价（平日）废除',
  `holiday_ef_member_price` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '平台会员价（假日）',
  `holiday_site_member_price` varchar(64) COLLATE utf8_bin DEFAULT '‘0’' COMMENT '球场会员价（假日）废除',
  `holiday_customer_price` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '非会员价（假日）废除',
  `tehuiri_price` varchar(64) COLLATE utf8_bin DEFAULT '0.0' COMMENT '平台会员(特惠日价格)',
  `tehuiri` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '特惠日(每周一到周五中的一天)',
  `reserve_explain` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '预约说明',
  `cancel_explain` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '取消通知说明',
  `site_remarks` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `site_jw` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '场地经纬',
  `reserve1` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '经度',
  `reserve2` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '维度',
  `reserve3` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '备用字段3 上下架状态（1上架 2下架）',
  `reserve4` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备用字段4(球场名称)',
  `reserve5` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '备用字段5(是否推荐 1.推荐，2.取消推荐)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `qiuhui_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '所属球会的id',
  `cash` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '是否现付 1是0否',
  `member_cost_price` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '会员成本价',
  `tehuiri_cost_price` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '特惠日嘉宾成本价',
  `holiday_cost_price` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '假日嘉宾成本价',
  `guest_cost_price` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '平日嘉宾成本价',
  `sort` tinyint(12) DEFAULT '3' COMMENT '球场排序字段',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='场地表-17';

-- ----------------------------
-- Table structure for ef_siteimg
-- ----------------------------
DROP TABLE IF EXISTS `ef_siteimg`;
CREATE TABLE `ef_siteimg` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '图片名称',
  `url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '图片保存地址',
  `type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '图片类别(1场地 2.教练 3.球童 4.球队 5.赛事 6.商家 7.商城 8.旅游 )',
  `product_id` int(11) DEFAULT NULL COMMENT '产品id（场地 商品 球童 教练）',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `create_user` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `modify_user` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1421 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_site_order
-- ----------------------------
DROP TABLE IF EXISTS `ef_site_order`;
CREATE TABLE `ef_site_order` (
  `site_order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site_id` int(11) DEFAULT NULL COMMENT '球场id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单主表id',
  `play_date` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '打球日期',
  `play_time` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '开球时间',
  `play_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '打球人姓名',
  `contacts_phone` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `site_member_number` int(11) DEFAULT NULL COMMENT '球场会员人数',
  `ef_member_number` int(11) DEFAULT NULL COMMENT '平台会员人数',
  `guest_number` int(11) DEFAULT NULL COMMENT '嘉宾人数',
  `customer_number` int(11) DEFAULT NULL COMMENT '非会员人数',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ticket_id` int(11) DEFAULT NULL COMMENT '优惠券id',
  `weekdays_ef_member_price` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '平台会员价（平日）',
  `weekdays_site_member_price` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球场会员价（平日）',
  `weekdays_customer_price` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '非会员价（平日）',
  `holiday_ef_member_price` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '平台会员价（假日）',
  `holiday_site_member_price` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '球场会员价（假日）',
  `holiday_customer_price` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '非会员价（假日）',
  `pay_money` double(10,2) DEFAULT NULL COMMENT '应支付价格',
  `real_pay_money` double(10,2) DEFAULT NULL COMMENT '实际支付价格',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`site_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='球场订单详情表-13';

-- ----------------------------
-- Table structure for ef_site_order_cost
-- ----------------------------
DROP TABLE IF EXISTS `ef_site_order_cost`;
CREATE TABLE `ef_site_order_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_order_id` int(11) DEFAULT NULL,
  `tax` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '发票税额',
  `other_cost` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '其他成本',
  `sum_cost` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '总成本',
  `gross_profit` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '毛利润',
  `special_cost` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '特殊成本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_site_order_log
-- ----------------------------
DROP TABLE IF EXISTS `ef_site_order_log`;
CREATE TABLE `ef_site_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_order_id` int(11) DEFAULT NULL,
  `teetime_change_date` datetime DEFAULT NULL COMMENT 'teetime修改时间',
  `teetime_change_user` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT 'teetime修改人',
  `teetime_change_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'teetime修改人',
  `unsubscribe_change_date` datetime DEFAULT NULL,
  `unsubscribe_change_user` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '退订操作人',
  `unsubscribe_change_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '退订原因',
  `subscribe_change_date` datetime DEFAULT NULL COMMENT '拒绝退订时间',
  `subscribe_change_user` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '拒绝退订操作人',
  `subscribe_change_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '拒绝退订原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='场地订单日志表';

-- ----------------------------
-- Table structure for ef_site_order_td
-- ----------------------------
DROP TABLE IF EXISTS `ef_site_order_td`;
CREATE TABLE `ef_site_order_td` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site_order_id` int(11) DEFAULT NULL,
  `member_td_number` int(11) DEFAULT NULL COMMENT '会员退订人数',
  `guest_td_number` int(11) DEFAULT NULL COMMENT '嘉宾退订人数',
  `refund_money` double(11,2) DEFAULT NULL COMMENT '退款金额',
  `real_money` double(11,2) DEFAULT NULL COMMENT '实收金额',
  `td_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '退订原因',
  `order_no` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订场订单退订信息表';

-- ----------------------------
-- Table structure for ef_site_price
-- ----------------------------
DROP TABLE IF EXISTS `ef_site_price`;
CREATE TABLE `ef_site_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site_id` int(11) DEFAULT NULL COMMENT '球场id',
  `c_date` datetime DEFAULT NULL COMMENT '日期',
  `c_year` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '年',
  `c_month` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '月',
  `c_day` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '日',
  `c_week` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '周几',
  `price` int(11) DEFAULT '0' COMMENT '价格',
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '类型（0平日 1假日 2节日）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `cost_price` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '成本价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37258 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='球场价格日历表';

-- ----------------------------
-- Table structure for ef_system_pay
-- ----------------------------
DROP TABLE IF EXISTS `ef_system_pay`;
CREATE TABLE `ef_system_pay` (
  `sys_pay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '付款用户ID',
  `take_id` int(11) DEFAULT NULL COMMENT '收款用户ID',
  `money` double(10,2) DEFAULT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `type` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '类型（1球童 2教练 3商家 4门店）',
  `state` varchar(54) COLLATE utf8_bin DEFAULT NULL COMMENT '状态（1已支付 2支付失败 3支付成功）',
  `order_no` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '单号',
  `channel` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`sys_pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统支付记录表（向亿方对公账户支付）-34';

-- ----------------------------
-- Table structure for ef_system_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ef_system_transfer`;
CREATE TABLE `ef_system_transfer` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `amount` double(255,0) DEFAULT NULL COMMENT '金额(分)',
  `time_transferred` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '支付完成时间',
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '付款状态',
  `recipient` bigint(15) DEFAULT NULL COMMENT '收款者id',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `transaction_no` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '第三方生成流水号',
  `order_no` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '本地订单号',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_ticket
-- ----------------------------
DROP TABLE IF EXISTS `ef_ticket`;
CREATE TABLE `ef_ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `money` double(10,2) DEFAULT NULL COMMENT '面额减免上限',
  `discount` double DEFAULT '1' COMMENT '折扣',
  `conditions` int(255) DEFAULT '0' COMMENT '使用条件（默认0）',
  `type` int(255) DEFAULT NULL COMMENT '优惠券类型（1.折扣 2.满减或现金）',
  `attribution` int(255) DEFAULT '1' COMMENT '优惠券归属（1.通用 2.场地 3.教练 4.球童 5.球队 6.赛事 7.商家 8.商城 9.旅游 0.课程）',
  `product_id` int(64) DEFAULT '0',
  `is_public` tinyint(255) DEFAULT '0' COMMENT '是否为公用优惠券(1.公用 2.个人)',
  `effective_date` int(11) DEFAULT NULL COMMENT '失效天数',
  `effective_time` datetime DEFAULT NULL COMMENT '生效日期',
  `expiry_time` datetime DEFAULT NULL COMMENT '失效日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `ticket_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `discount_money` double DEFAULT NULL COMMENT '折扣上限',
  `has_door` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '有无门槛（1是0否）',
  `door_money` double DEFAULT NULL COMMENT '门槛金额',
  `special_money` double DEFAULT NULL COMMENT '优惠金额',
  `ticket_num` int(40) DEFAULT NULL COMMENT '优惠劵数量',
  `back_cash` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '是否全额退款(是 1，否 0)',
  `is_grant` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '是否已发放（1是，0否）',
  `is_due` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '优惠劵是否使用（0，过期，1已使用 ，2未使用）',
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='优惠券表-26';

-- ----------------------------
-- Table structure for ef_trading
-- ----------------------------
DROP TABLE IF EXISTS `ef_trading`;
CREATE TABLE `ef_trading` (
  `trading_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(11) NOT NULL COMMENT '用户id',
  `money` double(10,2) DEFAULT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  PRIMARY KEY (`trading_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='交易记录表-10';

-- ----------------------------
-- Table structure for ef_tuihuoaddress
-- ----------------------------
DROP TABLE IF EXISTS `ef_tuihuoaddress`;
CREATE TABLE `ef_tuihuoaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shouHuoRenName` varchar(20) NOT NULL COMMENT '用户退货的收货人',
  `shuoHuoRenPhone` varchar(20) NOT NULL COMMENT '用户退货的收货人电话',
  `shouHuoProvince` varchar(20) DEFAULT '' COMMENT '收货省',
  `shuoHuoCity` varchar(20) DEFAULT '' COMMENT '收货市',
  `shuoHuoRegion` varchar(50) DEFAULT '' COMMENT '收货区',
  `shuoHuoAddr` varchar(100) NOT NULL COMMENT '包括省市区以及具体的地址的地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_user_bank
-- ----------------------------
DROP TABLE IF EXISTS `ef_user_bank`;
CREATE TABLE `ef_user_bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `bank_phone` varchar(255) NOT NULL COMMENT '银行卡预留手机号',
  `bank_card` varchar(255) NOT NULL COMMENT '银行卡号',
  `ider_name` varchar(255) NOT NULL COMMENT '持卡人姓名',
  `id_number` varchar(255) NOT NULL COMMENT '证件号',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_user` bigint(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL COMMENT '开户行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ef_user_feedback`;
CREATE TABLE `ef_user_feedback` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(12) DEFAULT NULL,
  `user_feedback` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '反馈内容',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ef_user_group
-- ----------------------------
DROP TABLE IF EXISTS `ef_user_group`;
CREATE TABLE `ef_user_group` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `rongLianYunGroupId` varchar(255) NOT NULL COMMENT '群id',
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_user_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `ef_user_shipping_address`;
CREATE TABLE `ef_user_shipping_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `address` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地址',
  `phone_number` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人电话',
  `consignee` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_default` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '默认地址(默认标识)',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户配送信息表-2';

-- ----------------------------
-- Table structure for ef_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `ef_user_sign`;
CREATE TABLE `ef_user_sign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '签到表id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '签到者id',
  `signcount` int(11) DEFAULT '0' COMMENT '连续签到次数',
  `count` int(11) DEFAULT '0' COMMENT '签到次数',
  `lastModifyTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `signHistoy` varchar(500) DEFAULT NULL COMMENT '签到历史时间 以逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ef_user_ticket
-- ----------------------------
DROP TABLE IF EXISTS `ef_user_ticket`;
CREATE TABLE `ef_user_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ticket_id` int(11) DEFAULT NULL COMMENT '优惠券id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `state` int(255) DEFAULT NULL COMMENT '状态（1.未发放 2.未到期 3.未使用 4.已使用,5已失效）',
  `effective_time` datetime DEFAULT NULL COMMENT '生效日期',
  `expiry_time` datetime DEFAULT NULL COMMENT '失效日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `product_id` bigint(64) DEFAULT NULL COMMENT '场地',
  `merchant_id` bigint(64) DEFAULT '0' COMMENT '商家id 所有商家通用id就是0',
  `shopping_id` bigint(64) DEFAULT '0' COMMENT '商城id 所有商品通用id为0',
  `coach_id` bigint(64) DEFAULT NULL COMMENT '教练id 选择通用默认id0',
  `course_id` int(50) DEFAULT '0' COMMENT '课程id 选择全平台默认为0',
  `location` int(64) DEFAULT NULL COMMENT '归属地 优惠券归属（1.通用 2.场地 3.教练 4.球童 5.球队 6.赛事 7.商家 8.商城 9.旅游 0.课程）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=982 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='优惠券关系表-26.1';

-- ----------------------------
-- Table structure for ef_violations_record
-- ----------------------------
DROP TABLE IF EXISTS `ef_violations_record`;
CREATE TABLE `ef_violations_record` (
  `v_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `violations_num` int(11) DEFAULT NULL COMMENT '违规次数',
  `Discontinue_start` datetime DEFAULT NULL COMMENT '本次封停开始时间',
  `Discontinue_stop` datetime DEFAULT NULL COMMENT '本次封停结束时间',
  PRIMARY KEY (`v_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违规记录表-25';

-- ----------------------------
-- Table structure for ef_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `ef_withdrawal`;
CREATE TABLE `ef_withdrawal` (
  `Withdrawal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account_id` int(11) NOT NULL COMMENT '账户表id',
  `money` double(10,2) DEFAULT NULL COMMENT '金额',
  `state` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '提现状态 (提现中 已完成 异常啦)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `flow_id` int(11) DEFAULT NULL COMMENT '流水表id',
  `order_no` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `real_moey` double(10,2) DEFAULT NULL COMMENT '实际提现金额',
  `service_charge` double(12,4) DEFAULT NULL COMMENT '手续费',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bank_card` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '银行卡',
  `ider_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '持卡人姓名',
  `ping_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ping 提现id',
  `bank_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '开户行',
  PRIMARY KEY (`Withdrawal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='提现记录表-7';

-- ----------------------------
-- Table structure for ef_work_type
-- ----------------------------
DROP TABLE IF EXISTS `ef_work_type`;
CREATE TABLE `ef_work_type` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(12) DEFAULT NULL COMMENT '事件操作者id',
  `type` varchar(255) DEFAULT NULL COMMENT '事件类型(1 点赞 2 评论 3 回复 4 分享 5礼物)',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `read_unread` varchar(20) DEFAULT NULL COMMENT '1已读 0未读',
  `create_time` datetime DEFAULT NULL,
  `big_type` varchar(255) DEFAULT NULL COMMENT '1 圈子消息 2 系统消息 （废弃）',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id(预约消息等需要用到)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eop_app
-- ----------------------------
DROP TABLE IF EXISTS `eop_app`;
CREATE TABLE `eop_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `app_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `descript` longtext COLLATE utf8_bin,
  `deployment` int(11) DEFAULT '1',
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `authorizationcode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `installuri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_access
-- ----------------------------
DROP TABLE IF EXISTS `es_access`;
CREATE TABLE `es_access` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `page` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `access_time` int(11) DEFAULT NULL,
  `stay_time` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT '0',
  `membername` varchar(255) COLLATE utf8_bin DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_account_log
-- ----------------------------
DROP TABLE IF EXISTS `es_account_log`;
CREATE TABLE `es_account_log` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) DEFAULT NULL,
  `user_money` decimal(20,2) DEFAULT NULL,
  `frozen_money` decimal(20,2) DEFAULT NULL,
  `rank_points` int(9) DEFAULT NULL,
  `pay_points` decimal(20,2) DEFAULT NULL,
  `friend_points` decimal(20,2) DEFAULT NULL,
  `change_time` bigint(20) DEFAULT NULL,
  `change_desc` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `change_type` int(8) DEFAULT NULL,
  `frozen_friend_points` int(10) DEFAULT NULL,
  `add_credit_account_money` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `ind_account_log` (`user_id`,`change_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_activity
-- ----------------------------
DROP TABLE IF EXISTS `es_activity`;
CREATE TABLE `es_activity` (
  `activity_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `range_type` smallint(1) DEFAULT NULL,
  `activity_type` smallint(1) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_activity_copy
-- ----------------------------
DROP TABLE IF EXISTS `es_activity_copy`;
CREATE TABLE `es_activity_copy` (
  `activity_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `range_type` smallint(1) DEFAULT NULL,
  `activity_type` smallint(1) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_activity_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_activity_detail`;
CREATE TABLE `es_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `full_money` decimal(20,2) DEFAULT NULL,
  `minus_value` decimal(20,2) DEFAULT NULL,
  `point_value` int(10) DEFAULT NULL,
  `is_full_minus` smallint(1) DEFAULT '0',
  `is_free_ship` smallint(1) DEFAULT '0',
  `is_send_point` smallint(1) DEFAULT '0',
  `is_send_gift` smallint(1) DEFAULT '0',
  `is_send_bonus` smallint(1) DEFAULT '0',
  `gift_id` int(10) DEFAULT NULL,
  `bonus_id` int(10) DEFAULT NULL,
  `is_discount` smallint(1) DEFAULT '0',
  `discount_value` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_activity_gift
-- ----------------------------
DROP TABLE IF EXISTS `es_activity_gift`;
CREATE TABLE `es_activity_gift` (
  `gift_id` int(10) NOT NULL AUTO_INCREMENT,
  `gift_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gift_price` decimal(20,2) DEFAULT NULL,
  `gift_img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gift_type` smallint(1) DEFAULT NULL,
  `actual_store` int(10) DEFAULT NULL,
  `enable_store` int(10) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_activity_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_activity_goods`;
CREATE TABLE `es_activity_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_adcolumn
-- ----------------------------
DROP TABLE IF EXISTS `es_adcolumn`;
CREATE TABLE `es_adcolumn` (
  `acid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `width` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `height` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `anumber` bigint(20) DEFAULT NULL,
  `atype` int(11) DEFAULT NULL,
  `arule` bigint(20) DEFAULT NULL,
  `disabled` varchar(5) COLLATE utf8_bin DEFAULT 'false',
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_admintheme
-- ----------------------------
DROP TABLE IF EXISTS `es_admintheme`;
CREATE TABLE `es_admintheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  `themename` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `author` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `framemode` int(6) DEFAULT '0',
  `deleteflag` int(6) DEFAULT '0',
  `thumb` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `es_adminuser`;
CREATE TABLE `es_adminuser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` int(6) DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userno` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userdept` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  `founder` int(8) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_admin_logs
-- ----------------------------
DROP TABLE IF EXISTS `es_admin_logs`;
CREATE TABLE `es_admin_logs` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `operator_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `log_detail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `log_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7259 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_adv
-- ----------------------------
DROP TABLE IF EXISTS `es_adv`;
CREATE TABLE `es_adv` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `acid` bigint(20) DEFAULT NULL,
  `atype` int(11) DEFAULT NULL,
  `begintime` bigint(20) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `isclose` int(11) DEFAULT NULL,
  `attachment` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `atturl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `aname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clickcount` int(11) DEFAULT '0',
  `linkman` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `disabled` varchar(5) COLLATE utf8_bin DEFAULT 'false',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_advance_logs
-- ----------------------------
DROP TABLE IF EXISTS `es_advance_logs`;
CREATE TABLE `es_advance_logs` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL,
  `money` decimal(20,2) NOT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mtime` bigint(20) NOT NULL,
  `payment_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `order_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `paymethod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `import_money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `explode_money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `member_advance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `shop_advance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `disabled` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_agent
-- ----------------------------
DROP TABLE IF EXISTS `es_agent`;
CREATE TABLE `es_agent` (
  `agentid` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(6) DEFAULT '0',
  `zip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ww` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `msn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_card` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bank_account` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bank_username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bank_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bank_city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `shop_url` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `state` int(6) DEFAULT '0',
  `dateline` int(10) DEFAULT NULL,
  PRIMARY KEY (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_agent_transfer
-- ----------------------------
DROP TABLE IF EXISTS `es_agent_transfer`;
CREATE TABLE `es_agent_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `memberid` int(10) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `is_transfer` int(8) DEFAULT NULL,
  `blank_account` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `blank_username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `blank_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `blank_city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `apply_time` int(11) DEFAULT NULL,
  `transfer_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_allocation_item
-- ----------------------------
DROP TABLE IF EXISTS `es_allocation_item`;
CREATE TABLE `es_allocation_item` (
  `allocationid` int(10) NOT NULL AUTO_INCREMENT,
  `itemid` int(10) DEFAULT NULL,
  `orderid` int(10) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `productid` int(10) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `other` longtext COLLATE utf8_bin,
  `iscmpl` int(8) DEFAULT '0',
  PRIMARY KEY (`allocationid`),
  KEY `es_allocation_item` (`orderid`,`itemid`,`depotid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_article
-- ----------------------------
DROP TABLE IF EXISTS `es_article`;
CREATE TABLE `es_article` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  `create_time` bigint(20) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_article_cat
-- ----------------------------
DROP TABLE IF EXISTS `es_article_cat`;
CREATE TABLE `es_article_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_auth_action
-- ----------------------------
DROP TABLE IF EXISTS `es_auth_action`;
CREATE TABLE `es_auth_action` (
  `actid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `objvalue` longtext COLLATE utf8_bin,
  `choose` int(11) DEFAULT NULL,
  PRIMARY KEY (`actid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_bonus_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_bonus_goods`;
CREATE TABLE `es_bonus_goods` (
  `rel_id` int(10) NOT NULL AUTO_INCREMENT,
  `bonus_type_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_bonus_type
-- ----------------------------
DROP TABLE IF EXISTS `es_bonus_type`;
CREATE TABLE `es_bonus_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `type_money` decimal(10,2) DEFAULT NULL,
  `send_type` int(8) DEFAULT NULL,
  `min_amount` decimal(10,2) DEFAULT NULL,
  `max_amount` decimal(10,2) DEFAULT NULL,
  `send_start_date` int(11) DEFAULT NULL,
  `send_end_date` int(11) DEFAULT NULL,
  `use_start_date` int(11) DEFAULT NULL,
  `use_end_date` int(11) DEFAULT NULL,
  `min_goods_amount` decimal(10,2) DEFAULT NULL,
  `recognition` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `create_num` int(10) DEFAULT NULL,
  `use_num` int(10) DEFAULT '0',
  `received_num` int(10) DEFAULT '0',
  `belong` int(10) DEFAULT '0',
  `can_be_edit` smallint(1) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_brand
-- ----------------------------
DROP TABLE IF EXISTS `es_brand`;
CREATE TABLE `es_brand` (
  `brand_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `keywords` longtext COLLATE utf8_bin,
  `brief` longtext COLLATE utf8_bin,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT '0',
  `letter` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `ind_brand` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_cart
-- ----------------------------
DROP TABLE IF EXISTS `es_cart`;
CREATE TABLE `es_cart` (
  `cart_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(9) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `itemtype` int(8) DEFAULT '0',
  `num` int(8) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `session_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `addon` longtext COLLATE utf8_bin,
  `activity_id` int(10) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `is_check` int(1) DEFAULT '0',
  `is_change` int(1) DEFAULT '0',
  `activity_end_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `ind_cart_sessionid` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_comments
-- ----------------------------
DROP TABLE IF EXISTS `es_comments`;
CREATE TABLE `es_comments` (
  `comment_id` int(8) NOT NULL AUTO_INCREMENT,
  `for_comment_id` int(8) DEFAULT NULL,
  `object_id` int(8) NOT NULL,
  `object_type` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'ask',
  `author_id` int(8) DEFAULT NULL,
  `author` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `levelname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mem_read_status` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  `adm_read_status` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  `time` bigint(20) DEFAULT NULL,
  `lastreply` bigint(20) DEFAULT NULL,
  `reply_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `acomment` longtext COLLATE utf8_bin,
  `ip` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `display` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  `p_index` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `disabled` varchar(5) COLLATE utf8_bin DEFAULT 'false',
  `commenttype` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_component
-- ----------------------------
DROP TABLE IF EXISTS `es_component`;
CREATE TABLE `es_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `componentid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `install_state` int(8) DEFAULT '0',
  `enable_state` int(8) DEFAULT '0',
  `version` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `javashop_version` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `error_message` longtext COLLATE utf8_bin,
  `sort_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_coupons
-- ----------------------------
DROP TABLE IF EXISTS `es_coupons`;
CREATE TABLE `es_coupons` (
  `cpns_id` int(8) NOT NULL AUTO_INCREMENT,
  `cpns_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cpns_sn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cpns_status` varchar(1) COLLATE utf8_bin DEFAULT '1',
  `cpns_type` varchar(1) COLLATE utf8_bin DEFAULT '1',
  `disabled` varchar(5) COLLATE utf8_bin DEFAULT 'false',
  `can_give` int(8) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `member_id_start` int(10) DEFAULT NULL,
  `member_id_end` int(10) DEFAULT NULL,
  `reg_time_start` int(10) DEFAULT NULL,
  `reg_time_end` int(10) DEFAULT NULL,
  `lv_ids` longtext COLLATE utf8_bin,
  `lv_names` longtext COLLATE utf8_bin,
  `end_time` int(11) DEFAULT NULL,
  `cat_ids` longtext COLLATE utf8_bin,
  `cat_names` longtext COLLATE utf8_bin,
  `goods_price` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `discount_price` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `remark` longtext COLLATE utf8_bin,
  `allcat` int(8) DEFAULT '0',
  PRIMARY KEY (`cpns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_data_cat
-- ----------------------------
DROP TABLE IF EXISTS `es_data_cat`;
CREATE TABLE `es_data_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  `model_id` int(8) DEFAULT NULL,
  `if_audit` int(2) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `detail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `descript` longtext COLLATE utf8_bin,
  `tositemap` int(8) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_data_field
-- ----------------------------
DROP TABLE IF EXISTS `es_data_field`;
CREATE TABLE `es_data_field` (
  `field_id` int(8) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `english_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  `data_size` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `show_form` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `show_value` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `model_id` int(8) DEFAULT NULL,
  `save_value` longtext COLLATE utf8_bin,
  `is_validate` int(8) DEFAULT NULL,
  `taxis` int(4) DEFAULT NULL,
  `dict_id` int(8) DEFAULT NULL,
  `is_show` int(8) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_data_model
-- ----------------------------
DROP TABLE IF EXISTS `es_data_model`;
CREATE TABLE `es_data_model` (
  `model_id` int(8) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `english_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `brief` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `if_audit` int(8) DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_delivery
-- ----------------------------
DROP TABLE IF EXISTS `es_delivery`;
CREATE TABLE `es_delivery` (
  `delivery_id` int(8) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `order_id` int(8) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `ship_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_protect` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `protect_price` decimal(20,2) DEFAULT NULL,
  `logi_id` int(8) DEFAULT NULL,
  `logi_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logi_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ship_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `region` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ship_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ship_zip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ship_tel` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ship_mobile` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ship_email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` longtext COLLATE utf8_bin,
  `create_time` bigint(20) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logi_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `ind_deliver_orderid` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_delivery_item
-- ----------------------------
DROP TABLE IF EXISTS `es_delivery_item`;
CREATE TABLE `es_delivery_item` (
  `item_id` int(8) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `sn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `num` int(8) DEFAULT NULL,
  `itemtype` int(8) DEFAULT '0',
  `order_itemid` int(10) DEFAULT NULL,
  `depotId` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ind_delivery_item` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_depot
-- ----------------------------
DROP TABLE IF EXISTS `es_depot`;
CREATE TABLE `es_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `choose` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_depot_user
-- ----------------------------
DROP TABLE IF EXISTS `es_depot_user`;
CREATE TABLE `es_depot_user` (
  `userid` int(10) NOT NULL,
  `depotid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_dly_area
-- ----------------------------
DROP TABLE IF EXISTS `es_dly_area`;
CREATE TABLE `es_dly_area` (
  `area_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_dly_center
-- ----------------------------
DROP TABLE IF EXISTS `es_dly_center`;
CREATE TABLE `es_dly_center` (
  `dly_center_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `address` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `province` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `region` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `zip` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `uname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cellphone` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `memo` longtext COLLATE utf8_bin,
  `disabled` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  `choose` varchar(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`dly_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_dly_type
-- ----------------------------
DROP TABLE IF EXISTS `es_dly_type`;
CREATE TABLE `es_dly_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `protect` int(8) DEFAULT NULL,
  `protect_rate` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `has_cod` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `min_price` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `detail` longtext COLLATE utf8_bin,
  `corp_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `is_same` int(8) DEFAULT '0',
  `config` longtext COLLATE utf8_bin,
  `expressions` longtext COLLATE utf8_bin,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_dly_type_area
-- ----------------------------
DROP TABLE IF EXISTS `es_dly_type_area`;
CREATE TABLE `es_dly_type_area` (
  `type_id` int(8) DEFAULT NULL,
  `area_id_group` longtext COLLATE utf8_bin,
  `area_name_group` longtext COLLATE utf8_bin,
  `expressions` longtext COLLATE utf8_bin,
  `has_cod` int(8) DEFAULT NULL,
  `config` longtext COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_email_list
-- ----------------------------
DROP TABLE IF EXISTS `es_email_list`;
CREATE TABLE `es_email_list` (
  `email_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_success` int(8) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  `error_num` int(6) DEFAULT NULL,
  `last_send` int(11) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_express_platform
-- ----------------------------
DROP TABLE IF EXISTS `es_express_platform`;
CREATE TABLE `es_express_platform` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `is_open` int(8) DEFAULT NULL,
  `config` longtext COLLATE utf8_bin,
  `code` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_favorite
-- ----------------------------
DROP TABLE IF EXISTS `es_favorite`;
CREATE TABLE `es_favorite` (
  `favorite_id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `favorite_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_floor
-- ----------------------------
DROP TABLE IF EXISTS `es_floor`;
CREATE TABLE `es_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  `style` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `cat_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `guid_cat_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `goods_ids` longtext COLLATE utf8_bin,
  `props` longtext COLLATE utf8_bin,
  `brand_ids` longtext COLLATE utf8_bin,
  `adv_ids` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_flow_log
-- ----------------------------
DROP TABLE IF EXISTS `es_flow_log`;
CREATE TABLE `es_flow_log` (
  `flow_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `visit_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_freeoffer
-- ----------------------------
DROP TABLE IF EXISTS `es_freeoffer`;
CREATE TABLE `es_freeoffer` (
  `fo_id` int(8) NOT NULL AUTO_INCREMENT,
  `fo_category_id` int(8) DEFAULT NULL,
  `fo_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `publishable` int(6) DEFAULT '0',
  `recommend` int(6) DEFAULT '1',
  `sorder` int(6) DEFAULT NULL,
  `limit_purchases` int(6) DEFAULT NULL,
  `startdate` bigint(20) DEFAULT NULL,
  `enddate` bigint(20) DEFAULT NULL,
  `lv_ids` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `synopsis` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `list_thumb` longtext COLLATE utf8_bin,
  `pic` longtext COLLATE utf8_bin,
  `score` int(8) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `repertory` int(8) DEFAULT NULL,
  `descript` longtext COLLATE utf8_bin,
  `disabled` int(6) DEFAULT '0',
  PRIMARY KEY (`fo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_freeoffer_category
-- ----------------------------
DROP TABLE IF EXISTS `es_freeoffer_category`;
CREATE TABLE `es_freeoffer_category` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `publishable` int(6) DEFAULT '0',
  `sorder` int(10) DEFAULT NULL,
  `disabled` int(6) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_freeze_point
-- ----------------------------
DROP TABLE IF EXISTS `es_freeze_point`;
CREATE TABLE `es_freeze_point` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `memberid` int(10) DEFAULT NULL,
  `childid` int(10) DEFAULT NULL,
  `point` int(10) DEFAULT NULL,
  `mp` int(10) DEFAULT NULL,
  `orderid` int(10) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `es_freeze_point_index` (`memberid`,`type`),
  KEY `es_freeze_point_index1` (`orderid`,`dateline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_friends_link
-- ----------------------------
DROP TABLE IF EXISTS `es_friends_link`;
CREATE TABLE `es_friends_link` (
  `link_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(8) DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_gnotify
-- ----------------------------
DROP TABLE IF EXISTS `es_gnotify`;
CREATE TABLE `es_gnotify` (
  `gnotify_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT 'ready',
  `send_time` bigint(20) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `disabled` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  `remark` longtext COLLATE utf8_bin,
  PRIMARY KEY (`gnotify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_goods`;
CREATE TABLE `es_goods` (
  `goods_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `sn` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `unit` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `market_enable` int(8) DEFAULT NULL,
  `brief` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `intro` longtext COLLATE utf8_bin,
  `price` decimal(20,2) DEFAULT NULL,
  `cost` decimal(20,2) DEFAULT NULL,
  `mktprice` decimal(20,2) DEFAULT NULL,
  `params` longtext COLLATE utf8_bin,
  `specs` longtext COLLATE utf8_bin,
  `have_spec` int(8) DEFAULT NULL,
  `adjuncts` longtext COLLATE utf8_bin,
  `create_time` bigint(20) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL,
  `view_count` int(10) DEFAULT NULL,
  `buy_count` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  `point` int(8) DEFAULT NULL,
  `page_title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `meta_keywords` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `p20` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p19` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p18` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p17` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p16` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p15` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p14` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p13` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p12` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p11` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p10` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p9` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p8` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p7` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p6` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p5` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sord` int(10) DEFAULT '0',
  `have_field` int(8) DEFAULT '0',
  `grade` int(10) DEFAULT '0',
  `goods_comment` longtext COLLATE utf8_bin,
  `is_pack` int(8) DEFAULT '0',
  `thumbnail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `big` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `small` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `original` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `carriage` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `reduction` double(8,0) NOT NULL DEFAULT '0' COMMENT ' 优惠标记    1.返优惠券  2.返现金',
  `credit` double(8,0) NOT NULL DEFAULT '0' COMMENT '额度',
  PRIMARY KEY (`goods_id`),
  KEY `ind_goods_cat_id` (`cat_id`),
  KEY `ind_goods_brand_id` (`brand_id`),
  KEY `ind_goods_name` (`name`),
  KEY `ind_goods_sn` (`sn`),
  KEY `ind_goods_other` (`goods_type`,`disabled`,`market_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_adjunct
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_adjunct`;
CREATE TABLE `es_goods_adjunct` (
  `adjunct_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `adjunct_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `min_num` int(10) DEFAULT NULL,
  `max_num` int(10) DEFAULT NULL,
  `set_price` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `items` longtext COLLATE utf8_bin,
  PRIMARY KEY (`adjunct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_articles
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_articles`;
CREATE TABLE `es_goods_articles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `articleid` int(10) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_cat`;
CREATE TABLE `es_goods_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `goods_count` int(8) DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `list_show` varchar(1) COLLATE utf8_bin DEFAULT '1',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `ind_goods_cat_parentid` (`parent_id`),
  KEY `ind_goods_cat_order` (`cat_order`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_complex
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_complex`;
CREATE TABLE `es_goods_complex` (
  `goods_1` int(8) NOT NULL,
  `goods_2` int(8) NOT NULL,
  `manual` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `rate` int(8) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_depot
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_depot`;
CREATE TABLE `es_goods_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `iscmpl` int(8) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `es_goods_room_goods_index2` (`depotid`,`iscmpl`),
  KEY `es_goods_room_goods_index1` (`goodsid`,`depotid`)
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_field
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_field`;
CREATE TABLE `es_goods_field` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `english_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pluginid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `config` longtext COLLATE utf8_bin,
  `add_time` bigint(20) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `is_validate` int(8) DEFAULT NULL,
  `field_sort` int(10) DEFAULT NULL,
  `is_show` int(8) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_gallery`;
CREATE TABLE `es_goods_gallery` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `small` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `big` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `original` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tiny` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isdefault` int(11) DEFAULT '0',
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2598 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_lv_price
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_lv_price`;
CREATE TABLE `es_goods_lv_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `lvid` int(10) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_snapshot`;
CREATE TABLE `es_goods_snapshot` (
  `snapshot_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `edit_time` bigint(20) DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `sn` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `unit` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `market_enable` int(8) DEFAULT NULL,
  `brief` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `intro` longtext COLLATE utf8_bin,
  `price` decimal(20,2) DEFAULT NULL,
  `cost` decimal(20,2) DEFAULT NULL,
  `mktprice` decimal(20,2) DEFAULT NULL,
  `params` longtext COLLATE utf8_bin,
  `specs` longtext COLLATE utf8_bin,
  `have_spec` int(8) DEFAULT NULL,
  `adjuncts` longtext COLLATE utf8_bin,
  `create_time` bigint(20) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL,
  `view_count` int(10) DEFAULT NULL,
  `buy_count` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  `point` int(8) DEFAULT NULL,
  `page_title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `meta_keywords` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `p20` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p19` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p18` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p17` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p16` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p15` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p14` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p13` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p12` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p11` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p10` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p9` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p8` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p7` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p6` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p5` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `p1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sord` int(10) DEFAULT '0',
  `have_field` int(8) DEFAULT '0',
  `grade` int(10) DEFAULT '0',
  `goods_comment` longtext COLLATE utf8_bin,
  `is_pack` int(8) DEFAULT '0',
  `thumbnail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `big` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `small` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `original` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `carriage` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`snapshot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_snapshot_gallery
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_snapshot_gallery`;
CREATE TABLE `es_goods_snapshot_gallery` (
  `img_id` int(11) DEFAULT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `small` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `big` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `original` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tiny` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isdefault` int(11) DEFAULT '0',
  `sort` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_spec`;
CREATE TABLE `es_goods_spec` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_id` int(8) DEFAULT NULL,
  `spec_value_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_spec_goods_index` (`goods_id`),
  KEY `ind_spec_goods_value` (`spec_id`,`spec_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71438 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_type`;
CREATE TABLE `es_goods_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `props` longtext COLLATE utf8_bin,
  `params` longtext COLLATE utf8_bin,
  `disabled` int(8) DEFAULT NULL,
  `is_physical` int(8) DEFAULT NULL,
  `have_prop` int(8) DEFAULT NULL,
  `have_parm` int(8) DEFAULT NULL,
  `join_brand` int(8) DEFAULT NULL,
  `have_field` int(8) DEFAULT '0',
  `join_spec` int(8) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_group_buy_count
-- ----------------------------
DROP TABLE IF EXISTS `es_group_buy_count`;
CREATE TABLE `es_group_buy_count` (
  `ruleid` int(10) NOT NULL AUTO_INCREMENT,
  `groupid` int(10) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  PRIMARY KEY (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `es_guestbook`;
CREATE TABLE `es_guestbook` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  `parentid` int(8) DEFAULT NULL,
  `dateline` bigint(20) DEFAULT NULL,
  `issubject` int(8) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_helpcenter
-- ----------------------------
DROP TABLE IF EXISTS `es_helpcenter`;
CREATE TABLE `es_helpcenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `lastmodified` bigint(20) DEFAULT NULL,
  `hit` bigint(20) DEFAULT NULL,
  `able_time` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cat_id` int(10) DEFAULT NULL,
  `is_commend` int(11) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT '0',
  `page_title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `page_keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `page_description` longtext COLLATE utf8_bin,
  `site_code` int(11) DEFAULT '100000',
  `siteidlist` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `ind_helpcenter_catid` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_hot_keyword
-- ----------------------------
DROP TABLE IF EXISTS `es_hot_keyword`;
CREATE TABLE `es_hot_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `lastmodified` bigint(20) DEFAULT NULL,
  `hit` bigint(20) DEFAULT NULL,
  `able_time` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `is_commend` int(11) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT '0',
  `page_title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `page_keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `page_description` longtext COLLATE utf8_bin,
  `site_code` int(11) DEFAULT '100000',
  `siteidlist` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hot_searchword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_index_item
-- ----------------------------
DROP TABLE IF EXISTS `es_index_item`;
CREATE TABLE `es_index_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_limitbuy
-- ----------------------------
DROP TABLE IF EXISTS `es_limitbuy`;
CREATE TABLE `es_limitbuy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_index` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_limitbuy_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_limitbuy_goods`;
CREATE TABLE `es_limitbuy_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `limitbuyid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_logi_company
-- ----------------------------
DROP TABLE IF EXISTS `es_logi_company`;
CREATE TABLE `es_logi_company` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member
-- ----------------------------
DROP TABLE IF EXISTS `es_member`;
CREATE TABLE `es_member` (
  `member_id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` int(10) DEFAULT NULL,
  `parentid` int(10) DEFAULT '0',
  `lv_id` int(8) DEFAULT NULL,
  `uname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `regtime` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `birthday` bigint(20) DEFAULT NULL,
  `advance` decimal(20,2) DEFAULT '0.00',
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `town_id` int(10) DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `region` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `town` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `point` int(10) DEFAULT '0',
  `mp` int(10) DEFAULT '0',
  `QQ` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `msn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `remark` longtext COLLATE utf8_bin,
  `lastlogin` bigint(20) DEFAULT '1280629569',
  `is_agent` int(8) DEFAULT '0',
  `logincount` int(10) DEFAULT '0',
  `is_cheked` int(8) DEFAULT '0',
  `registerip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `recommend_point_state` int(8) DEFAULT '0',
  `last_send_email` int(10) DEFAULT NULL,
  `info_full` int(8) DEFAULT '0',
  `find_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `face` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `midentity` int(8) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `ind_member_uname` (`uname`,`email`),
  KEY `ind_member_lvid` (`lv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member_address
-- ----------------------------
DROP TABLE IF EXISTS `es_member_address`;
CREATE TABLE `es_member_address` (
  `addr_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `town_id` int(10) DEFAULT NULL,
  `region` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `town` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `def_addr` int(10) DEFAULT '0',
  `isDel` int(10) DEFAULT '0',
  `shipAddressName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `ind_mem_addr` (`member_id`,`isDel`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member_bonus
-- ----------------------------
DROP TABLE IF EXISTS `es_member_bonus`;
CREATE TABLE `es_member_bonus` (
  `bonus_id` int(8) NOT NULL AUTO_INCREMENT,
  `bonus_type_id` int(10) DEFAULT NULL,
  `bonus_sn` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `used_time` bigint(20) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `emailed` int(8) DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `binding` int(10) DEFAULT NULL,
  `member_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `order_sn` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `type_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `bonus_type` int(8) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `used` int(2) DEFAULT '0',
  PRIMARY KEY (`bonus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member_comment
-- ----------------------------
DROP TABLE IF EXISTS `es_member_comment`;
CREATE TABLE `es_member_comment` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateline` bigint(20) DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `reply` longtext COLLATE utf8_bin,
  `replytime` bigint(20) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT NULL,
  `replystatus` int(8) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `is_top` int(8) NOT NULL DEFAULT '0',
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member_comment_gallery
-- ----------------------------
DROP TABLE IF EXISTS `es_member_comment_gallery`;
CREATE TABLE `es_member_comment_gallery` (
  `img_id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) DEFAULT NULL,
  `original` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member_coupon
-- ----------------------------
DROP TABLE IF EXISTS `es_member_coupon`;
CREATE TABLE `es_member_coupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpnsid` int(10) DEFAULT NULL,
  `memberid` int(10) DEFAULT NULL,
  `used` int(8) DEFAULT NULL,
  `get_time` int(11) DEFAULT NULL,
  `cpns_sn` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cpns_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cat_ids` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `cat_names` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `goods_price` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `discount_price` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `allcat` int(8) DEFAULT '0',
  `end_time` int(11) DEFAULT NULL,
  `can_give` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_member_coupon` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member_lv
-- ----------------------------
DROP TABLE IF EXISTS `es_member_lv`;
CREATE TABLE `es_member_lv` (
  `lv_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `default_lv` int(8) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `point` int(10) DEFAULT '0',
  PRIMARY KEY (`lv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member_lv_discount
-- ----------------------------
DROP TABLE IF EXISTS `es_member_lv_discount`;
CREATE TABLE `es_member_lv_discount` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `lv_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `es_ind_mem_lv_dis` (`lv_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_member_order_item
-- ----------------------------
DROP TABLE IF EXISTS `es_member_order_item`;
CREATE TABLE `es_member_order_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `commented` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `comment_time` bigint(20) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_member_order_item_index` (`member_id`,`goods_id`,`order_id`,`item_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_menu
-- ----------------------------
DROP TABLE IF EXISTS `es_menu`;
CREATE TABLE `es_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sorder` int(11) DEFAULT '50',
  `menutype` int(11) DEFAULT NULL,
  `datatype` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `selected` int(6) DEFAULT '0',
  `deleteflag` int(6) DEFAULT '0',
  `canexp` int(6) DEFAULT '0',
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `icon_hover` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_display` int(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_message
-- ----------------------------
DROP TABLE IF EXISTS `es_message`;
CREATE TABLE `es_message` (
  `msg_id` int(8) NOT NULL AUTO_INCREMENT,
  `for_id` int(8) NOT NULL DEFAULT '0',
  `msg_from` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'anonymous',
  `from_id` int(8) DEFAULT '0',
  `from_type` int(5) NOT NULL DEFAULT '0',
  `to_id` int(8) NOT NULL DEFAULT '0',
  `msg_to` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `to_type` int(5) NOT NULL DEFAULT '0',
  `unread` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `folder` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'inbox',
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8_bin NOT NULL,
  `message` longtext COLLATE utf8_bin NOT NULL,
  `rel_order` bigint(20) DEFAULT '0',
  `date_line` bigint(20) NOT NULL DEFAULT '0',
  `is_sec` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'true',
  `del_status` varchar(1) COLLATE utf8_bin DEFAULT '0',
  `disabled` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  `msg_ip` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `msg_type` varchar(7) COLLATE utf8_bin NOT NULL DEFAULT 'default',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_message_bg
-- ----------------------------
DROP TABLE IF EXISTS `es_message_bg`;
CREATE TABLE `es_message_bg` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_content` longtext COLLATE utf8_bin NOT NULL,
  `msg_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `member_ids` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `adminuser_id` int(10) NOT NULL,
  `send_time` bigint(20) NOT NULL,
  `send_type` int(10) NOT NULL,
  `adminuser_name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_message_front
-- ----------------------------
DROP TABLE IF EXISTS `es_message_front`;
CREATE TABLE `es_message_front` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_content` longtext COLLATE utf8_bin NOT NULL,
  `msg_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `member_id` int(10) NOT NULL,
  `adminuser_id` int(10) NOT NULL,
  `send_time` bigint(20) NOT NULL,
  `is_delete` int(10) NOT NULL,
  `is_read` int(10) NOT NULL,
  `adminuser_name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_order
-- ----------------------------
DROP TABLE IF EXISTS `es_order`;
CREATE TABLE `es_order` (
  `order_id` int(8) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `pay_status` int(8) DEFAULT NULL,
  `ship_status` int(8) DEFAULT NULL,
  `shipping_id` int(8) DEFAULT NULL,
  `shipping_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `shipping_area` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `payment_id` int(8) DEFAULT NULL,
  `payment_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `payment_account` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `paymoney` decimal(20,2) DEFAULT '0.00' COMMENT '已支付金额',
  `goods` longtext COLLATE utf8_bin,
  `create_time` bigint(20) DEFAULT NULL,
  `ship_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ship_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ship_zip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ship_email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ship_mobile` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ship_tel` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ship_day` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ship_time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_protect` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `protect_price` decimal(20,2) DEFAULT NULL,
  `goods_amount` decimal(20,2) DEFAULT NULL,
  `shipping_amount` decimal(20,2) DEFAULT NULL,
  `order_amount` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `goods_num` int(8) DEFAULT NULL,
  `gainedpoint` int(10) DEFAULT '0',
  `consumepoint` int(10) DEFAULT '0',
  `remark` longtext COLLATE utf8_bin,
  `disabled` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `discount` decimal(20,2) DEFAULT NULL,
  `imported` int(8) DEFAULT '0',
  `pimported` int(8) DEFAULT '0',
  `complete_time` int(11) DEFAULT '0',
  `cancel_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `signing_time` int(10) DEFAULT NULL,
  `the_sign` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `allocation_time` int(10) DEFAULT NULL,
  `ship_provinceid` int(10) DEFAULT NULL,
  `ship_cityid` int(10) DEFAULT NULL,
  `ship_regionid` int(10) DEFAULT NULL,
  `ship_townid` int(10) DEFAULT NULL,
  `sale_cmpl` int(8) DEFAULT NULL,
  `sale_cmpl_time` int(11) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `admin_remark` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `need_pay_money` decimal(20,2) DEFAULT NULL,
  `ship_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address_id` int(10) DEFAULT NULL,
  `items_json` longtext COLLATE utf8_bin,
  `logi_id` int(10) DEFAULT NULL,
  `logi_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gift_id` int(10) DEFAULT '0',
  `bonus_id` int(10) DEFAULT '0',
  `act_discount` decimal(20,2) DEFAULT NULL,
  `activity_point` int(10) DEFAULT '0',
  `is_cancel` int(10) DEFAULT '0',
  `is_online` int(10) DEFAULT '0',
  `receipt_content` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `receipt_title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `receipt_duty` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `receipt_type` int(10) DEFAULT NULL,
  `receipt` int(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `ind_order_sn` (`sn`),
  KEY `ind_order_state` (`status`,`pay_status`,`ship_status`),
  KEY `ind_order_memberid` (`member_id`),
  KEY `ind_order_term` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_order_bonus
-- ----------------------------
DROP TABLE IF EXISTS `es_order_bonus`;
CREATE TABLE `es_order_bonus` (
  `ob_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bonus_id` int(10) DEFAULT NULL,
  `bonus_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bonus_money` decimal(20,2) DEFAULT NULL,
  `use_start_date` bigint(20) DEFAULT NULL,
  `use_end_date` bigint(20) DEFAULT NULL,
  `min_goods_amount` decimal(20,2) DEFAULT NULL,
  `send_type` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`ob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_order_gift
-- ----------------------------
DROP TABLE IF EXISTS `es_order_gift`;
CREATE TABLE `es_order_gift` (
  `og_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gift_id` int(10) DEFAULT NULL,
  `gift_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gift_price` decimal(20,2) DEFAULT NULL,
  `gift_img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gift_type` smallint(1) DEFAULT NULL,
  `gift_status` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`og_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_order_items
-- ----------------------------
DROP TABLE IF EXISTS `es_order_items`;
CREATE TABLE `es_order_items` (
  `item_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `num` int(8) DEFAULT NULL,
  `ship_num` int(8) DEFAULT NULL,
  `sn` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `image` longtext COLLATE utf8_bin,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `gainedpoint` int(10) DEFAULT '0',
  `addon` longtext COLLATE utf8_bin,
  `state` int(8) DEFAULT '0',
  `change_goods_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `change_goods_id` int(8) DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `snapshot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `es_order_item` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_order_log
-- ----------------------------
DROP TABLE IF EXISTS `es_order_log`;
CREATE TABLE `es_order_log` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `op_id` int(8) DEFAULT NULL,
  `op_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `message` longtext COLLATE utf8_bin,
  `op_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `ind_order_log` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_order_meta
-- ----------------------------
DROP TABLE IF EXISTS `es_order_meta`;
CREATE TABLE `es_order_meta` (
  `metaid` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(10) DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_bin,
  PRIMARY KEY (`metaid`),
  KEY `es_ind_orderex_orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_order_pmt
-- ----------------------------
DROP TABLE IF EXISTS `es_order_pmt`;
CREATE TABLE `es_order_pmt` (
  `pmt_id` int(8) DEFAULT NULL,
  `order_id` int(8) DEFAULT NULL,
  `pmt_amount` decimal(20,2) DEFAULT NULL,
  `pmt_describe` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_page
-- ----------------------------
DROP TABLE IF EXISTS `es_page`;
CREATE TABLE `es_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `page_html` longtext COLLATE utf8_bin,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_payment_cfg
-- ----------------------------
DROP TABLE IF EXISTS `es_payment_cfg`;
CREATE TABLE `es_payment_cfg` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `config` longtext COLLATE utf8_bin,
  `biref` longtext COLLATE utf8_bin,
  `pay_fee` decimal(20,2) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pay_img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_online` int(8) DEFAULT '1',
  `is_retrace` int(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_payment_detail`;
CREATE TABLE `es_payment_detail` (
  `detail_id` int(8) NOT NULL AUTO_INCREMENT,
  `payment_id` int(8) DEFAULT NULL,
  `pay_money` decimal(20,2) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `admin_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_payment_logs
-- ----------------------------
DROP TABLE IF EXISTS `es_payment_logs`;
CREATE TABLE `es_payment_logs` (
  `payment_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `pay_method` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `pay_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `remark` longtext COLLATE utf8_bin,
  `type` int(8) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `admin_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `paymoney` decimal(20,2) DEFAULT '0.00',
  `market_point` decimal(20,2) DEFAULT '0.00',
  `credit` decimal(20,2) DEFAULT '0.00',
  `trasaction_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `ind_pay_log` (`order_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_pmt_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_pmt_goods`;
CREATE TABLE `es_pmt_goods` (
  `pmt_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_pmt_member_lv
-- ----------------------------
DROP TABLE IF EXISTS `es_pmt_member_lv`;
CREATE TABLE `es_pmt_member_lv` (
  `pmt_id` int(8) DEFAULT NULL,
  `lv_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_point_history
-- ----------------------------
DROP TABLE IF EXISTS `es_point_history`;
CREATE TABLE `es_point_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(9) NOT NULL,
  `point` int(10) NOT NULL,
  `time` bigint(20) NOT NULL,
  `reason` varchar(50) COLLATE utf8_bin NOT NULL,
  `related_id` bigint(20) DEFAULT NULL,
  `type` int(8) NOT NULL,
  `operator` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `point_type` int(8) DEFAULT '0',
  `mp` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_ponit_history` (`member_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_print_tmpl
-- ----------------------------
DROP TABLE IF EXISTS `es_print_tmpl`;
CREATE TABLE `es_print_tmpl` (
  `prt_tmpl_id` int(10) NOT NULL AUTO_INCREMENT,
  `prt_tmpl_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `shortcut` varchar(5) COLLATE utf8_bin DEFAULT 'false',
  `disabled` varchar(5) COLLATE utf8_bin DEFAULT 'false',
  `prt_tmpl_width` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '100',
  `prt_tmpl_height` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '100',
  `prt_tmpl_data` longtext COLLATE utf8_bin,
  `bgimage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`prt_tmpl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_product
-- ----------------------------
DROP TABLE IF EXISTS `es_product`;
CREATE TABLE `es_product` (
  `product_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `store` int(8) DEFAULT '0',
  `enable_store` int(8) DEFAULT '0',
  `price` decimal(20,2) DEFAULT NULL,
  `specs` longtext COLLATE utf8_bin,
  `cost` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `is_pack` int(8) DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `ind_product_goodsid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12650 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_product_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `es_product_snapshot`;
CREATE TABLE `es_product_snapshot` (
  `snapshot_id` int(11) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `store` int(8) DEFAULT '0',
  `enable_store` int(8) DEFAULT '0',
  `price` decimal(20,2) DEFAULT NULL,
  `specs` longtext COLLATE utf8_bin,
  `cost` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `is_pack` int(8) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_product_store
-- ----------------------------
DROP TABLE IF EXISTS `es_product_store`;
CREATE TABLE `es_product_store` (
  `storeid` int(8) NOT NULL AUTO_INCREMENT,
  `goodsid` int(8) DEFAULT NULL,
  `productid` int(8) DEFAULT NULL,
  `depotid` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  PRIMARY KEY (`storeid`),
  KEY `ind_product_store_proid` (`productid`),
  KEY `ind_product_store_roomid` (`depotid`)
) ENGINE=InnoDB AUTO_INCREMENT=3138 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_promotion
-- ----------------------------
DROP TABLE IF EXISTS `es_promotion`;
CREATE TABLE `es_promotion` (
  `pmt_id` int(8) NOT NULL AUTO_INCREMENT,
  `pmts_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `pmta_id` int(8) DEFAULT NULL,
  `pmt_time_begin` bigint(20) DEFAULT NULL,
  `pmt_time_end` bigint(20) DEFAULT NULL,
  `order_money_from` decimal(20,2) NOT NULL DEFAULT '0.00',
  `order_money_to` decimal(20,2) NOT NULL DEFAULT '9999999.00',
  `seq` int(3) NOT NULL DEFAULT '0',
  `pmt_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `pmt_belong` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `pmt_bond_type` varchar(1) COLLATE utf8_bin NOT NULL,
  `pmt_describe` longtext COLLATE utf8_bin,
  `pmt_solution` longtext COLLATE utf8_bin,
  `pmt_ifcoupon` int(3) NOT NULL DEFAULT '1',
  `pmt_update_time` bigint(20) DEFAULT '0',
  `pmt_basic_type` varchar(5) COLLATE utf8_bin DEFAULT 'goods',
  `disabled` varchar(5) COLLATE utf8_bin DEFAULT 'false',
  `pmt_ifsale` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'true',
  `pmt_distype` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_promotion_activity
-- ----------------------------
DROP TABLE IF EXISTS `es_promotion_activity`;
CREATE TABLE `es_promotion_activity` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `enable` int(8) DEFAULT NULL,
  `begin_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `brief` longtext COLLATE utf8_bin,
  `disabled` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_receipt
-- ----------------------------
DROP TABLE IF EXISTS `es_receipt`;
CREATE TABLE `es_receipt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_bin DEFAULT '',
  `content` varchar(50) COLLATE utf8_bin DEFAULT '',
  `is_default` smallint(1) DEFAULT '0',
  `add_time` bigint(20) DEFAULT NULL,
  `duty` varchar(50) COLLATE utf8_bin DEFAULT '',
  `type` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_receipt_content
-- ----------------------------
DROP TABLE IF EXISTS `es_receipt_content`;
CREATE TABLE `es_receipt_content` (
  `contentid` int(10) NOT NULL AUTO_INCREMENT,
  `receipt_content` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_refund
-- ----------------------------
DROP TABLE IF EXISTS `es_refund`;
CREATE TABLE `es_refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sellback_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `refund_time` bigint(20) DEFAULT NULL,
  `refund_money` decimal(20,2) DEFAULT NULL,
  `refund_way` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `return_account` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `sndto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `member_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `refund_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `refund_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `txn_time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_refund_logs
-- ----------------------------
DROP TABLE IF EXISTS `es_refund_logs`;
CREATE TABLE `es_refund_logs` (
  `refund_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT NULL,
  `pay_method` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `pay_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `account` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `op_user` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `remark` longtext COLLATE utf8_bin,
  `create_time` bigint(20) DEFAULT NULL,
  `txn_time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`refund_id`),
  KEY `es_ind_refund_log` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_regions
-- ----------------------------
DROP TABLE IF EXISTS `es_regions`;
CREATE TABLE `es_regions` (
  `region_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_region_id` int(10) DEFAULT NULL,
  `region_path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `region_grade` int(8) DEFAULT NULL,
  `local_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `zipcode` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cod` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53108 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_returns_order
-- ----------------------------
DROP TABLE IF EXISTS `es_returns_order`;
CREATE TABLE `es_returns_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ordersn` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `memberid` int(10) DEFAULT NULL,
  `state` int(6) DEFAULT NULL,
  `goodsns` longtext COLLATE utf8_bin,
  `type` int(6) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `photo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `refuse_reason` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `apply_reason` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_role
-- ----------------------------
DROP TABLE IF EXISTS `es_role`;
CREATE TABLE `es_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rolememo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `es_role_auth`;
CREATE TABLE `es_role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `authid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_second_half_activity_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_second_half_activity_detail`;
CREATE TABLE `es_second_half_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_sellback_goodslist
-- ----------------------------
DROP TABLE IF EXISTS `es_sellback_goodslist`;
CREATE TABLE `es_sellback_goodslist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(8) DEFAULT NULL,
  `recid` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `ship_num` int(8) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `return_num` int(8) DEFAULT NULL,
  `storage_num` int(8) DEFAULT '0',
  `goods_remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `goods_sn` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `goods_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `goods_image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `spec_json` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `return_type` int(8) DEFAULT NULL,
  `item_type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_sellback_list
-- ----------------------------
DROP TABLE IF EXISTS `es_sellback_list`;
CREATE TABLE `es_sellback_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(10) DEFAULT NULL,
  `tradeno` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `tradestatus` int(8) DEFAULT NULL,
  `ordersn` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `regoperator` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `regtime` bigint(20) DEFAULT NULL,
  `alltotal_pay` decimal(20,2) DEFAULT NULL,
  `apply_alltotal` decimal(20,2) DEFAULT NULL,
  `goodslist` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `seller_remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `finance_remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `sndto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `adr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `refund_way` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `total` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `return_account` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  `confirm_time` bigint(20) DEFAULT NULL,
  `gift_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_sellback_log
-- ----------------------------
DROP TABLE IF EXISTS `es_sellback_log`;
CREATE TABLE `es_sellback_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `recid` int(10) DEFAULT NULL,
  `logtime` bigint(20) DEFAULT NULL,
  `logdetail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_settings
-- ----------------------------
DROP TABLE IF EXISTS `es_settings`;
CREATE TABLE `es_settings` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cfg_value` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `cfg_group` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_showcase
-- ----------------------------
DROP TABLE IF EXISTS `es_showcase`;
CREATE TABLE `es_showcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `flag` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_single_reduction_activity_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_single_reduction_activity_detail`;
CREATE TABLE `es_single_reduction_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `single_reduction_value` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_site
-- ----------------------------
DROP TABLE IF EXISTS `es_site`;
CREATE TABLE `es_site` (
  `siteid` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `themeid` int(11) DEFAULT NULL,
  `sitelevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_site_menu
-- ----------------------------
DROP TABLE IF EXISTS `es_site_menu`;
CREATE TABLE `es_site_menu` (
  `menuid` int(8) NOT NULL AUTO_INCREMENT,
  `parentid` int(8) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_sms_platform
-- ----------------------------
DROP TABLE IF EXISTS `es_sms_platform`;
CREATE TABLE `es_sms_platform` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `is_open` int(8) DEFAULT NULL,
  `config` longtext COLLATE utf8_bin,
  `code` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_smtp
-- ----------------------------
DROP TABLE IF EXISTS `es_smtp`;
CREATE TABLE `es_smtp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_send_time` bigint(20) DEFAULT NULL,
  `send_count` int(11) DEFAULT '0',
  `max_count` int(11) DEFAULT NULL,
  `mail_from` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `port` int(10) DEFAULT '0',
  `open_ssl` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_specification
-- ----------------------------
DROP TABLE IF EXISTS `es_specification`;
CREATE TABLE `es_specification` (
  `spec_id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `spec_show_type` int(8) DEFAULT NULL,
  `spec_type` int(8) DEFAULT NULL,
  `spec_memo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `spec_order` int(8) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_spec_values
-- ----------------------------
DROP TABLE IF EXISTS `es_spec_values`;
CREATE TABLE `es_spec_values` (
  `spec_value_id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_id` int(8) DEFAULT NULL,
  `spec_value` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `spec_image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `spec_order` int(8) DEFAULT NULL,
  `spec_type` int(8) DEFAULT NULL,
  `inherent_or_add` int(8) DEFAULT NULL,
  PRIMARY KEY (`spec_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=843 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_store_log
-- ----------------------------
DROP TABLE IF EXISTS `es_store_log`;
CREATE TABLE `es_store_log` (
  `logid` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `productid` int(10) DEFAULT NULL,
  `goodsname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `depot_type` int(8) DEFAULT NULL,
  `op_type` int(2) DEFAULT '0',
  `num` int(10) DEFAULT NULL,
  `enable_store` int(10) DEFAULT '0',
  `remark` longtext COLLATE utf8_bin,
  `dateline` int(10) DEFAULT NULL,
  `userid` int(10) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `ind_store_log_goodsid` (`goodsid`,`productid`),
  KEY `ind_store_log_depot` (`op_type`,`depotid`)
) ENGINE=InnoDB AUTO_INCREMENT=1259 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_style
-- ----------------------------
DROP TABLE IF EXISTS `es_style`;
CREATE TABLE `es_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_top_style` int(11) DEFAULT NULL,
  `is_default_style` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_subject
-- ----------------------------
DROP TABLE IF EXISTS `es_subject`;
CREATE TABLE `es_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `goods_ids` longtext COLLATE utf8_bin,
  `picture_path` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_tags
-- ----------------------------
DROP TABLE IF EXISTS `es_tags`;
CREATE TABLE `es_tags` (
  `tag_id` int(8) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rel_count` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT '0',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_tag_rel
-- ----------------------------
DROP TABLE IF EXISTS `es_tag_rel`;
CREATE TABLE `es_tag_rel` (
  `tag_id` int(8) DEFAULT NULL,
  `rel_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL,
  KEY `ind_tag_rel_1` (`tag_id`,`rel_id`),
  KEY `ind_tag_rel_2` (`ordernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_tag_relb
-- ----------------------------
DROP TABLE IF EXISTS `es_tag_relb`;
CREATE TABLE `es_tag_relb` (
  `tag_id` int(8) DEFAULT NULL,
  `rel_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_theme
-- ----------------------------
DROP TABLE IF EXISTS `es_theme`;
CREATE TABLE `es_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `themename` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `thumb` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_themeuri
-- ----------------------------
DROP TABLE IF EXISTS `es_themeuri`;
CREATE TABLE `es_themeuri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `themeid` int(11) DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `pagename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `sitemaptype` int(11) DEFAULT '0',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `httpcache` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_transaction_record
-- ----------------------------
DROP TABLE IF EXISTS `es_transaction_record`;
CREATE TABLE `es_transaction_record` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `goods_num` int(10) DEFAULT NULL,
  `rog_time` bigint(20) DEFAULT NULL,
  `uname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `index_goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_type_brand
-- ----------------------------
DROP TABLE IF EXISTS `es_type_brand`;
CREATE TABLE `es_type_brand` (
  `type_id` int(8) DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_type_spec
-- ----------------------------
DROP TABLE IF EXISTS `es_type_spec`;
CREATE TABLE `es_type_spec` (
  `type_id` int(8) DEFAULT NULL,
  `spec_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_url_server
-- ----------------------------
DROP TABLE IF EXISTS `es_url_server`;
CREATE TABLE `es_url_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_user_role
-- ----------------------------
DROP TABLE IF EXISTS `es_user_role`;
CREATE TABLE `es_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for es_warn_num
-- ----------------------------
DROP TABLE IF EXISTS `es_warn_num`;
CREATE TABLE `es_warn_num` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `warn_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for red_package
-- ----------------------------
DROP TABLE IF EXISTS `red_package`;
CREATE TABLE `red_package` (
  `id` varchar(255) NOT NULL COMMENT '大红包ID',
  `money_amount` int(12) DEFAULT NULL COMMENT '红包金额',
  `count` int(12) DEFAULT NULL COMMENT '红包个数',
  `user_id` bigint(12) DEFAULT NULL COMMENT '红包发送者',
  `send_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发红包时间',
  `qun_id` varchar(30) DEFAULT NULL COMMENT '群ID',
  `content` varchar(255) DEFAULT NULL COMMENT '红包祝福语',
  `state` int(12) DEFAULT NULL COMMENT '是否有效',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for small_red_package
-- ----------------------------
DROP TABLE IF EXISTS `small_red_package`;
CREATE TABLE `small_red_package` (
  `big_red_package_id` varchar(255) NOT NULL COMMENT '大红包ID',
  `xiangci` int(12) DEFAULT NULL COMMENT '小红包项次',
  `receiver_id` int(11) DEFAULT NULL COMMENT '抢红包者ID',
  `receive_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `small_money_amount` double DEFAULT NULL COMMENT '小红包金额',
  `has_qiang` int(11) DEFAULT NULL COMMENT '分配标记(0:未分配  1:已分配)',
  `best` int(11) DEFAULT NULL COMMENT '是否为手气最佳(0:非 1:最佳)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_permission
-- ----------------------------
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='(权限)URL地址许可表';

-- ----------------------------
-- Table structure for u_role
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='(权限)角色表';

-- ----------------------------
-- Table structure for u_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='(权限)角色许可表';

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id(user_id)',
  `nickname` varchar(20) DEFAULT '未设置' COMMENT '（后）用户昵称（前后共有字段）',
  `account` varchar(128) DEFAULT NULL COMMENT '（后）登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '（后）密码',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间（前后共有字段）',
  `last_login_time` datetime DEFAULT NULL COMMENT '（后）最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '（后）1:有效，0:禁止登录',
  `user_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户名(手机号)',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户手机号',
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微信标识',
  `qq_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'qq标识',
  `weibo_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微博标识',
  `password_login` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码（md5）',
  `password_pay` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支付密码（md5）',
  `rec_exclusive_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '推荐人的专属码',
  `subjection_id` bigint(20) DEFAULT NULL COMMENT '屢属球会id',
  `exclusive_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '专属码',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '这个人很懒，还没有签名。' COMMENT '自我描述',
  `ball_age` int(11) DEFAULT '0' COMMENT '球龄',
  `realname` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '真实姓名',
  `id_card_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `bank_card_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '银行卡卡号',
  `bank_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属银行',
  `region` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地区（上次登陆）',
  `gender` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '性别 1男 0女',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `head_portrait_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '头像地址url',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `user_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '用户类型（1用户 2教练 3球童 4从业人员 5球会 6门店 7球会商家 8门店电源）',
  `user_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '用户状态（1正常 2冻结）',
  `is_alive` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '用户锁（1解锁 2锁定）',
  `cha_dian` varchar(32) DEFAULT '0' COMMENT '差点（表示技术水平高低）',
  `recommend` varchar(16) DEFAULT '2' COMMENT '是否推荐（1是 2否）',
  `grade` varchar(255) DEFAULT NULL COMMENT '练教等级',
  `vip` varchar(16) DEFAULT '0' COMMENT 'vip等级',
  `use_pay` double(10,2) DEFAULT '0.00' COMMENT '下场费（教练专用）',
  `score` varchar(11) DEFAULT '0' COMMENT '18洞最好成绩（教练专用）',
  `lat` varchar(255) DEFAULT NULL COMMENT '上次登录纬度',
  `lng` varchar(255) DEFAULT NULL COMMENT '上次登录经度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COMMENT='(后台+前台)用户表-1';

-- ----------------------------
-- Table structure for u_user_role
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='(权限)用户角色分配表';

-- ----------------------------
-- Procedure structure for update_caddie_order_status
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_caddie_order_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_caddie_order_status`()
BEGIN
 
update ef_order set order_state='10'
 
where order_id in (SELECT order_id from ef_qiutong_order eqo where DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%s')>=DATE_FORMAT(CONCAT(eqo.play_date,' ',eqo.play_time),'%Y-%m-%d %H:%i:%s'));
 
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for update_caddie_order_status_event
-- ----------------------------
DROP EVENT IF EXISTS `update_caddie_order_status_event`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `update_caddie_order_status_event` ON SCHEDULE EVERY 1 SECOND STARTS '2018-08-02 10:52:03' ON COMPLETION PRESERVE ENABLE DO begin
 
call update_caddie_order_status();
 
end
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
