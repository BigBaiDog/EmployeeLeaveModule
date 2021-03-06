-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-12-24 19:51:59
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `project`
--

-- --------------------------------------------------------

--
-- 表的结构 `elm_calendar`
--

CREATE TABLE `elm_calendar` (
  `c_id` int(11) NOT NULL COMMENT '日历编号',
  `workdate` date DEFAULT NULL COMMENT '日历',
  `week` varchar(255) DEFAULT NULL COMMENT '星期',
  `holiday` varchar(255) DEFAULT NULL COMMENT '状态',
  `status` varchar(255) DEFAULT NULL COMMENT '名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `elm_calendar`
--

INSERT INTO `elm_calendar` (`c_id`, `workdate`, `week`, `holiday`, `status`) VALUES
(2, '2020-12-02', '3', '工作日', '1'),
(3, '2020-12-03', '4', '工作日', '1'),
(4, '2020-12-04', '5', '工作日', '1'),
(5, '2020-12-05', '6', '周末', '0'),
(6, '2020-12-06', '0', '周末', '0'),
(7, '2020-12-07', '1', '工作日', '1'),
(8, '2020-12-08', '2', '工作日', '1'),
(9, '2020-12-09', '3', '工作日', '1'),
(10, '2020-12-10', '4', '工作日', '1'),
(11, '2020-12-11', '5', '工作日', '1'),
(12, '2020-12-12', '6', '周末', '0'),
(13, '2020-12-13', '0', '周末', '0'),
(14, '2020-12-14', '1', '工作日', '1'),
(15, '2020-12-15', '2', '工作日', '1'),
(16, '2020-12-16', '3', '工作日', '1'),
(17, '2020-12-17', '4', '工作日', '1'),
(18, '2020-12-18', '5', '工作日', '1'),
(19, '2020-12-19', '6', '周末', '0'),
(20, '2020-12-20', '0', '周末', '0'),
(21, '2020-12-21', '1', '工作日', '1'),
(22, '2020-12-22', '2', '工作日', '1'),
(23, '2020-12-23', '3', '工作日', '1'),
(24, '2020-12-24', '4', '工作日', '1'),
(25, '2020-12-25', '5', '工作日', '1'),
(26, '2020-12-26', '6', '周末', '0'),
(27, '2020-12-27', '0', '周末', '0'),
(28, '2020-12-28', '1', '工作日', '1'),
(29, '2020-12-29', '2', '工作日', '1'),
(30, '2020-12-30', '3', '工作日', '1'),
(31, '2020-12-31', '4', '工作日', '1'),
(32, '2021-01-01', '5', '元旦', '0'),
(33, '2021-01-02', '6', '周末', '0'),
(34, '2021-01-03', '0', '周末', '0'),
(35, '2021-01-04', '1', '工作日', '1'),
(36, '2021-01-05', '2', '工作日', '1'),
(37, '2021-01-06', '3', '工作日', '1'),
(38, '2021-01-07', '4', '工作日', '1'),
(39, '2021-01-08', '5', '工作日', '1'),
(40, '2021-01-09', '6', '周末', '0'),
(41, '2021-01-10', '0', '周末', '0'),
(42, '2021-01-11', '1', '工作日', '1'),
(43, '2021-01-12', '2', '工作日', '1'),
(44, '2021-01-13', '3', '工作日', '1'),
(45, '2021-01-14', '4', '工作日', '1'),
(46, '2021-01-15', '5', '工作日', '1'),
(47, '2021-01-16', '6', '周末', '0'),
(48, '2021-01-17', '0', '周末', '0'),
(49, '2021-01-18', '1', '工作日', '1'),
(50, '2021-01-19', '2', '工作日', '1'),
(51, '2021-01-20', '3', '工作日', '1'),
(52, '2021-01-21', '4', '工作日', '1'),
(53, '2021-01-22', '5', '工作日', '1'),
(54, '2021-01-23', '6', '周末', '0'),
(55, '2021-01-24', '0', '周末', '0'),
(56, '2021-01-25', '1', '工作日', '1'),
(57, '2021-01-26', '2', '工作日', '1'),
(58, '2021-01-27', '3', '工作日', '1'),
(59, '2021-01-28', '4', '工作日', '1'),
(60, '2021-01-29', '5', '工作日', '1'),
(61, '2021-01-30', '6', '周末', '0'),
(62, '2021-01-31', '0', '周末', '0'),
(63, '2021-02-01', '1', '工作日', '1'),
(64, '2021-02-02', '2', '工作日', '1'),
(65, '2021-02-03', '3', '工作日', '1'),
(66, '2021-02-04', '4', '工作日', '1'),
(67, '2021-02-05', '5', '工作日', '1'),
(68, '2021-02-06', '6', '周末', '0'),
(69, '2021-02-07', '0', '春节调班', '1'),
(70, '2021-02-08', '1', '工作日', '1'),
(71, '2021-02-09', '2', '工作日', '1'),
(72, '2021-02-10', '3', '工作日', '1'),
(73, '2021-02-11', '4', '除夕', '0'),
(74, '2021-02-12', '5', '春节', '0'),
(75, '2021-02-13', '6', '初二', '0'),
(76, '2021-02-14', '0', '初三', '0'),
(77, '2021-02-15', '1', '初四', '0'),
(78, '2021-02-16', '2', '初五', '0'),
(79, '2021-02-17', '3', '初六', '0'),
(80, '2021-02-18', '4', '工作日', '1'),
(81, '2021-02-19', '5', '工作日', '1'),
(82, '2021-02-20', '6', '春节调班', '1'),
(83, '2021-02-21', '0', '周末', '0'),
(84, '2021-02-22', '1', '工作日', '1'),
(85, '2021-02-23', '2', '工作日', '1'),
(86, '2021-02-24', '3', '工作日', '1'),
(87, '2021-02-25', '4', '工作日', '1'),
(88, '2021-02-26', '5', '工作日', '1'),
(89, '2021-02-27', '6', '周末', '0'),
(90, '2021-02-28', '0', '周末', '0'),
(1, '2020-12-01', '2', '工作日', '1');

-- --------------------------------------------------------

--
-- 表的结构 `elm_leave`
--

CREATE TABLE `elm_leave` (
  `l_id` int(11) NOT NULL COMMENT '假条编号',
  `u_id` int(11) NOT NULL COMMENT '申请人工号',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假原因',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `enddate` date DEFAULT NULL COMMENT '结束日期',
  `time` datetime DEFAULT NULL COMMENT '申请时间',
  `days` int(10) UNSIGNED DEFAULT NULL COMMENT '请假天数',
  `isagree` int(10) DEFAULT '0' COMMENT '是否同意'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `elm_leave`
--

INSERT INTO `elm_leave` (`l_id`, `u_id`, `reason`, `startdate`, `enddate`, `time`, `days`, `isagree`) VALUES
(47, 2017134329, '我想去演唱会', '2020-12-29', '2020-12-30', '2020-12-24 19:47:35', 2, 0),
(44, 2017134329, '测试', '2020-12-24', '2020-12-27', '2020-12-24 18:50:46', 2, -2),
(46, 2017134329, '请假看电影', '2021-01-08', '2021-01-08', '2020-12-24 18:52:28', 1, 1),
(43, 2048, '我是老板', '2020-12-25', '2020-12-31', '2020-12-24 18:49:03', 5, 1),
(42, 996, '就是不想上班', '2020-12-28', '2020-12-28', '2020-12-24 18:48:30', 1, -1),
(41, 111, '结婚旅游去咯', '2021-01-14', '2021-01-20', '2020-12-24 18:47:42', 5, 0),
(40, 111, '我老婆结婚啦', '2021-01-08', '2021-01-11', '2020-12-24 18:47:10', 2, 1),
(39, 8520, '我明天会肚子痛', '2020-12-25', '2020-12-25', '2020-12-24 18:46:06', 1, 0),
(38, 800, '世界这么大，我想去看看', '2020-12-28', '2021-01-08', '2020-12-24 18:45:08', 9, 0);

-- --------------------------------------------------------

--
-- 表的结构 `elm_record`
--

CREATE TABLE `elm_record` (
  `r_id` int(11) NOT NULL,
  `l_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `elm_record`
--

INSERT INTO `elm_record` (`r_id`, `l_id`, `u_id`, `c_id`) VALUES
(67, 40, 111, 39),
(68, 40, 111, 42),
(69, 43, 2048, 25),
(70, 43, 2048, 28),
(74, 46, 2017134329, 39),
(71, 43, 2048, 29),
(72, 43, 2048, 30),
(73, 43, 2048, 31);

-- --------------------------------------------------------

--
-- 表的结构 `elm_user`
--

CREATE TABLE `elm_user` (
  `u_id` int(11) NOT NULL COMMENT '工号',
  `name` varchar(255) NOT NULL COMMENT '名字',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `ismanager` int(10) UNSIGNED DEFAULT '0' COMMENT '是否为经理'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `elm_user`
--

INSERT INTO `elm_user` (`u_id`, `name`, `password`, `ismanager`) VALUES
(2017134329, '冯宏远', '123456', 0),
(800, '西奥', '123456', 0),
(2048, '张经理', 'admin', 1),
(100, '小米', '123456', 0),
(8520, '小欧', '123456', 0),
(111, '维尼', '123456', 0),
(996, '橘子', '123456', 0);

--
-- 转储表的索引
--

--
-- 表的索引 `elm_calendar`
--
ALTER TABLE `elm_calendar`
  ADD PRIMARY KEY (`c_id`);

--
-- 表的索引 `elm_leave`
--
ALTER TABLE `elm_leave`
  ADD PRIMARY KEY (`l_id`);

--
-- 表的索引 `elm_record`
--
ALTER TABLE `elm_record`
  ADD PRIMARY KEY (`r_id`);

--
-- 表的索引 `elm_user`
--
ALTER TABLE `elm_user`
  ADD PRIMARY KEY (`u_id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `elm_calendar`
--
ALTER TABLE `elm_calendar`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日历编号', AUTO_INCREMENT=91;

--
-- 使用表AUTO_INCREMENT `elm_leave`
--
ALTER TABLE `elm_leave`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '假条编号', AUTO_INCREMENT=48;

--
-- 使用表AUTO_INCREMENT `elm_record`
--
ALTER TABLE `elm_record`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
