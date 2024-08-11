/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t316`;
CREATE DATABASE IF NOT EXISTS `t316` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t316`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/dianyingdingpiao/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/dianyingdingpiao/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/dianyingdingpiao/upload/config3.jpg');

DROP TABLE IF EXISTS `dianying`;
CREATE TABLE IF NOT EXISTS `dianying` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `dianying_name` varchar(200) DEFAULT NULL COMMENT '电影名称  Search111 ',
  `dianying_photo` varchar(200) DEFAULT NULL COMMENT '电影照片',
  `dianying_types` int DEFAULT NULL COMMENT '电影类型 Search111',
  `zuowei_number` int DEFAULT NULL COMMENT '电影座位',
  `dianying_old_money` decimal(10,2) DEFAULT NULL COMMENT '原价 ',
  `dianying_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `zan_number` int DEFAULT NULL COMMENT '赞 ',
  `cai_number` int DEFAULT NULL COMMENT '踩 ',
  `shangxia_types` int DEFAULT NULL COMMENT '是否上架 ',
  `dianying_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `dianying_content` text COMMENT '电影简介 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='电影';

DELETE FROM `dianying`;
INSERT INTO `dianying` (`id`, `dianying_name`, `dianying_photo`, `dianying_types`, `zuowei_number`, `dianying_old_money`, `dianying_new_money`, `zan_number`, `cai_number`, `shangxia_types`, `dianying_delete`, `dianying_content`, `create_time`) VALUES
	(1, '电影名称1', 'http://localhost:8080/dianyingdingpiao/upload/1645096978456.jpg', 4, 22, 953.73, 455.46, 50, 33, 1, 1, '<p>电影简介1</p>', '2022-02-17 11:18:22'),
	(2, '电影名称2', 'http://localhost:8080/dianyingdingpiao/upload/1645096969558.jpg', 1, 22, 628.58, 191.16, 60, 254, 1, 1, '<p>电影简介2</p>', '2022-02-17 11:18:22'),
	(3, '电影名称3', 'http://localhost:8080/dianyingdingpiao/upload/1645096962159.jpg', 4, 22, 758.66, 328.49, 20, 278, 1, 1, '<p>电影简介3</p>', '2022-02-17 11:18:22'),
	(4, '电影名称4', 'http://localhost:8080/dianyingdingpiao/upload/1645096953965.jpg', 4, 22, 568.12, 391.81, 36, 132, 1, 1, '<p>电影简介4</p>', '2022-02-17 11:18:22'),
	(5, '电影名称5', 'http://localhost:8080/dianyingdingpiao/upload/1645096944146.jpg', 2, 22, 725.37, 220.37, 78, 381, 1, 1, '<p>电影简介5</p>', '2022-02-17 11:18:22'),
	(6, '电影名称6', 'http://localhost:8080/dianyingdingpiao/upload/1645096937254.jpg', 2, 22, 941.48, 15.70, 37, 409, 1, 1, '<p>电影简介6</p>', '2022-02-17 11:18:22');

DROP TABLE IF EXISTS `dianying_collection`;
CREATE TABLE IF NOT EXISTS `dianying_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dianying_id` int DEFAULT NULL COMMENT '电影',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `dianying_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='电影收藏';

DELETE FROM `dianying_collection`;
INSERT INTO `dianying_collection` (`id`, `dianying_id`, `yonghu_id`, `dianying_collection_types`, `insert_time`, `create_time`) VALUES
	(2, 2, 2, 1, '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(3, 3, 2, 1, '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(5, 5, 1, 1, '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(6, 6, 1, 1, '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(15, 4, 1, 1, '2022-02-17 12:20:50', '2022-02-17 12:20:50');

DROP TABLE IF EXISTS `dianying_commentback`;
CREATE TABLE IF NOT EXISTS `dianying_commentback` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dianying_id` int DEFAULT NULL COMMENT '电影',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `dianying_commentback_text` text COMMENT '评价内容',
  `reply_text` text COMMENT '回复内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='电影评价';

DELETE FROM `dianying_commentback`;
INSERT INTO `dianying_commentback` (`id`, `dianying_id`, `yonghu_id`, `dianying_commentback_text`, `reply_text`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, 1, 1, '评价内容1', '回复信息1', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(2, 2, 2, '评价内容2', '回复信息2', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(3, 3, 2, '评价内容3', '回复信息3', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(4, 4, 3, '评价内容4', '回复信息4', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(5, 5, 1, '评价内容5', '回复信息5', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(6, 6, 3, '评价内容6', '回复信息6', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(12, 6, 1, '评价内容11111', NULL, '2022-02-17 12:01:28', NULL, '2022-02-17 12:01:28'),
	(14, 4, 1, '9999', NULL, '2022-02-17 12:43:01', NULL, '2022-02-17 12:43:01');

DROP TABLE IF EXISTS `dianying_order`;
CREATE TABLE IF NOT EXISTS `dianying_order` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dianying_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `dianying_id` int DEFAULT NULL COMMENT '电影',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `buy_zuowei_number` varchar(200) DEFAULT NULL COMMENT '购买的座位 ',
  `buy_zuowei_time` date DEFAULT NULL COMMENT '购买的日期 ',
  `dianying_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格',
  `dianying_order_types` int DEFAULT NULL COMMENT '订单类型',
  `dianying_order_payment_types` int DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='电影订单';

DELETE FROM `dianying_order`;
INSERT INTO `dianying_order` (`id`, `dianying_order_uuid_number`, `dianying_id`, `yonghu_id`, `buy_zuowei_number`, `buy_zuowei_time`, `dianying_order_true_price`, `dianying_order_types`, `dianying_order_payment_types`, `insert_time`, `create_time`) VALUES
	(1, '1645098194713', 6, 1, '6,16', '2022-02-17', 31.40, 1, 1, '2022-02-17 11:43:19', '2022-02-17 11:43:19'),
	(2, '1645100366554', 6, 1, '3,4,13,14', '2022-02-17', 62.80, 1, 1, '2022-02-17 12:19:35', '2022-02-17 12:19:35'),
	(3, '1645100961241', 4, 1, '3,4,5,6,7,8', '2022-02-17', 2350.86, 1, 1, '2022-02-17 12:29:23', '2022-02-17 12:29:23');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='字典表';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'shangxia_types', '上下架', 1, '上架', NULL, NULL, '2022-02-17 11:15:24'),
	(2, 'shangxia_types', '上下架', 2, '下架', NULL, NULL, '2022-02-17 11:15:24'),
	(3, 'dianying_types', '电影类型', 1, '电影类型1', NULL, NULL, '2022-02-17 11:15:24'),
	(4, 'dianying_types', '电影类型', 2, '电影类型2', NULL, NULL, '2022-02-17 11:15:24'),
	(5, 'dianying_types', '电影类型', 3, '电影类型3', NULL, NULL, '2022-02-17 11:15:24'),
	(6, 'dianying_types', '电影类型', 4, '电影类型4', NULL, NULL, '2022-02-17 11:15:24'),
	(7, 'dianying_collection_types', '收藏表类型', 1, '收藏', NULL, NULL, '2022-02-17 11:15:24'),
	(8, 'dianying_collection_types', '收藏表类型', 2, '赞', NULL, NULL, '2022-02-17 11:15:24'),
	(9, 'dianying_collection_types', '收藏表类型', 3, '踩', NULL, NULL, '2022-02-17 11:15:24'),
	(10, 'dianying_order_types', '订单类型', 1, '已评价', NULL, NULL, '2022-02-17 11:15:24'),
	(11, 'dianying_order_types', '订单类型', 2, '退款', NULL, NULL, '2022-02-17 11:15:24'),
	(12, 'dianying_order_types', '订单类型', 3, '已支付', NULL, NULL, '2022-02-17 11:15:24'),
	(15, 'dianying_order_payment_types', '订单支付类型', 1, '现金', NULL, NULL, '2022-02-17 11:15:24'),
	(16, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-02-17 11:15:24'),
	(17, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-02-17 11:15:24'),
	(18, 'news_types', '公告信息类型', 1, '公告信息类型1', NULL, NULL, '2022-02-17 11:15:24'),
	(19, 'news_types', '公告信息类型', 2, '公告信息类型2', NULL, NULL, '2022-02-17 11:15:24'),
	(20, 'news_types', '公告信息类型', 3, '公告信息类型3', NULL, NULL, '2022-02-17 11:15:24');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告信息标题  Search111 ',
  `news_types` int DEFAULT NULL COMMENT '公告信息类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告信息图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告信息时间',
  `news_content` text COMMENT '公告信息详情',
  `news_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_types`, `news_photo`, `insert_time`, `news_content`, `news_delete`, `create_time`) VALUES
	(1, '公告信息标题1', 2, 'http://localhost:8080/dianyingdingpiao/upload/1645097052249.jpg', '2022-02-17 11:18:22', '<p>公告信息详情1</p>', 1, '2022-02-17 11:18:22'),
	(2, '公告信息标题2', 1, 'http://localhost:8080/dianyingdingpiao/upload/1645097042406.jpg', '2022-02-17 11:18:22', '<p>公告信息详情2</p>', 1, '2022-02-17 11:18:22'),
	(3, '公告信息标题3', 3, 'http://localhost:8080/dianyingdingpiao/upload/1645097034901.jpg', '2022-02-17 11:18:22', '<p>公告信息详情3</p>', 1, '2022-02-17 11:18:22'),
	(4, '公告信息标题4', 1, 'http://localhost:8080/dianyingdingpiao/upload/1645097018485.jpg', '2022-02-17 11:18:22', '<p>公告信息详情4</p>', 1, '2022-02-17 11:18:22'),
	(5, '公告信息标题5', 1, 'http://localhost:8080/dianyingdingpiao/upload/1645097009644.jpg', '2022-02-17 11:18:22', '<p>公告信息详情5</p>', 1, '2022-02-17 11:18:22'),
	(6, '公告信息标题6', 1, 'http://localhost:8080/dianyingdingpiao/upload/1645097002806.webp', '2022-02-17 11:18:22', '<p>公告信息详情6</p>', 1, '2022-02-17 11:18:22');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'admin', 'users', '管理员', '4hg7cex6j6tl1926vf1t7y3nh4w9ln6a', '2022-02-17 11:21:27', '2024-08-04 02:10:37'),
	(2, 1, 'a1', 'yonghu', '用户', 'tynnk6zq38jt632ry7717b820hmvp134', '2022-02-17 11:25:23', '2024-08-04 02:11:46');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2021-02-25 07:59:12');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账号',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名  Search111',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `yonghu_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `sex_types`, `yonghu_id_number`, `yonghu_phone`, `yonghu_photo`, `new_money`, `yonghu_delete`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', 1, '410224199610232001', '17703786901', 'http://localhost:8080/dianyingdingpiao/upload/1645097109085.jpg', 9907561.01, 1, '2022-02-17 11:18:22'),
	(2, '用户2', '123456', '用户姓名2', 2, '410224199610232002', '17703786902', 'http://localhost:8080/dianyingdingpiao/upload/1645097095834.jpg', 420.85, 1, '2022-02-17 11:18:22'),
	(3, '用户3', '123456', '用户姓名3', 1, '410224199610232003', '17703786903', 'http://localhost:8080/dianyingdingpiao/upload/1645097085441.jpg', 512.16, 1, '2022-02-17 11:18:22');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
