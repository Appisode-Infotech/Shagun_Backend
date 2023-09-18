-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2023 at 09:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shagun`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_logo` varchar(255) NOT NULL,
  `ifsc_code` varchar(255) NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_by` varchar(255) NOT NULL,
  `modified_on` datetime NOT NULL,
  `modified_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`id`, `uid`, `bank_name`, `bank_logo`, `ifsc_code`, `account_holder_name`, `account_number`, `status`, `created_on`, `added_by`, `modified_on`, `modified_by`) VALUES
(16, 'wjkkjhgfdserty', 'ICICI', '', 'ICICI090908', 'Roop Raj Thapa', '1234567890', 1, '2023-08-04 15:50:42', 'nkbhandari95@gmail.com', '2023-08-04 21:14:37', 'nkbhandari95@gmail.com'),
(17, 'QEdAObI232VCtVBtt7fDOLkKeai1', 'ICICI', '', 'HDFC009870', 'test admin123', '1234567890', 1, '2023-09-04 06:08:12', 'admintest@gmail.com', '2023-09-14 15:13:21', 'admintest@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `bank_list`
--

CREATE TABLE `bank_list` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_logo` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_list`
--

INSERT INTO `bank_list` (`id`, `bank_name`, `bank_logo`, `status`, `created_on`) VALUES
(1, 'ICICI', 'https://assets.stickpng.com/thumbs/627ccb0a1b2e263b45696aa5.png', 1, '2023-07-22 11:17:35'),
(2, 'HDFC', 'https://e7.pngegg.com/pngimages/257/159/png-clipart-hdfc-logo-thumbnail-bank-logos-thumbnail.png', 1, '2023-07-22 11:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_vendors`
--

CREATE TABLE `delivery_vendors` (
  `id` int(11) NOT NULL,
  `delivery_vendor_name` varchar(255) NOT NULL,
  `city` int(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `lat_lng` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `gst_no` varchar(255) NOT NULL,
  `delivery_vendor_owner` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_vendors`
--

INSERT INTO `delivery_vendors` (`id`, `delivery_vendor_name`, `city`, `address`, `lat_lng`, `status`, `gst_no`, `delivery_vendor_owner`, `contact_number`, `created_by`, `created_on`) VALUES
(1, 'Raj', 11, 'Address Line 1', '123.456, 78.910', 1, 'fwg567', 'Vikas', '9865432345', 'admin', '2023-08-09 11:10:12'),
(2, 'Roop', 12, 'Address Line 2', '123.456, 78.910', 0, 'fwg567', 'Ashish', '9865982345', 'admin', '2023-08-09 11:16:17'),
(3, 'Professional Courier', 13, '4rd Cross', '', 1, 'GSTIN09897564456', 'Hong Kong', '0000000000', 'admintest@gmail.com', '2023-08-15 14:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-19 09:23:17.050924'),
(2, 'auth', '0001_initial', '2023-07-19 09:23:17.316623'),
(3, 'admin', '0001_initial', '2023-07-19 09:23:17.372616'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-19 09:23:17.386128'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-19 09:23:17.386128'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-19 09:23:17.417404'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-19 09:23:17.449934'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-19 09:23:17.464941'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-19 09:23:17.464941'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-19 09:23:17.491933'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-19 09:23:17.496441'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-19 09:23:17.496441'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-19 09:23:17.513128'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-19 09:23:17.513128'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-19 09:23:17.528186'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-19 09:23:17.543883'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-19 09:23:17.559524'),
(18, 'sessions', '0001_initial', '2023-07-19 09:23:17.575109');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1ecb0pbdo9psenej38fwr0jpucovqrrv', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qgLZw:RdpK02suMqzwUa3GWrn3vgzD5uL4M4xbPm5hW-IxvtU', '2023-09-13 16:50:32.042923'),
('1w2099n0r9juocsitrcfz2epjhnvwfpd', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjTRUYIpKC0GEnmJualKVkplmVmZDum5iZk5esn5uUo6SsUl-UWpMFmnzHSFAIiuYqVaAHEvJHY:1qhmKZ:QWHleaNtVErebVYkcw_q6Vo6W6iXS4qFNfTYrUMy_34', '2023-09-17 15:36:35.944457'),
('32kj1v97a9jkwrhjflo4ztd7pqmmymd7', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qgdis:T_KwA-3NcR4VKbBk_rW9NWQtjmksg8bR4yd1-dU4bRk', '2023-09-14 12:12:58.676469'),
('4d7ddl139v74pp5onwd6evppap5v7kkq', '.eJw1yjEKwzAMheGrlDebQocunnKC0hsYpRauqC0HyZlK754UkuXxw_u-EE-LiQ62VHspnJMo4rCVAyQj3u4BJ1h9H6XGiNDP_CbNZHK8PpVGUq-v3hDgoxuf9iHWqNLl-ZeiZQ92x28Df4wuIQ:1qhBl2:Z3tUyt8Znk2yYN-cbeloUYu5yu4_5OAQ9-AHZO9dRtA', '2023-09-16 00:33:28.595149'),
('7sx4i3tchuv7l3maolavzcwo6jbrqy61', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qh3oq:1cCqao-HbxgxNEtPfQF8kCmuqHdGAKZmzTwHuCyTB3Y', '2023-09-15 16:04:52.014742'),
('8bvfl7jv17ond2wpbp0rq2v0hhhxglbg', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qi6Tw:YKDFiZEpet6BJZVEx_V-dgZtm2BUzzNsp7QLUJ3DOjE', '2023-09-18 13:07:36.961921'),
('99adgidus9cteo3litsl8dxz2rn0lncc', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qh40a:C8-ELdxeg2O_AWtujI09z5Vo5BouLqw-QUeFZ5YMwU4', '2023-09-15 16:17:00.108403'),
('b9v64ko5agab9s9m8140ego5541rpfuh', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qe9EK:a3I990cu5Cd2ihht9k8FNkQSQKNrFLgSB_DNwEDELMc', '2023-09-07 15:15:08.030530'),
('bty9hun2nq2hecwxn78awwnm6huhr7l9', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qfzai:pBsHdfgIdprUMRfhQRLPp6PACGleWjURt8QK1MPBeqE', '2023-09-12 17:21:52.484995'),
('cwkw9902rse7gl0d8mprxtsg8iw8p0e6', '.eJw1zE0OgjAQQOGrmFlTCiQuYOVNyEjHMtpOm_6kica7CwvX78v7AOfVBWvJrCywlFSpg8oGFpDXfUcxmHi-3qxHdv0WPHQg6OnsnDw6vPzVUWIKD3a0Rt4OsJcS86J1a60vO7EYRmmc6PzoFtUWpJAUXaMLaLKehnHW46AtCTlGZXKob1RT_4wWvj9_AzyC:1qNTZG:hJ2Us6bs2qdmg_HQVjtXvC2aInF68mxj9dbVK2khXJA', '2023-08-06 07:31:50.926448'),
('eznrgkmj12yuf52kbwppd9odroymlbul', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjTRUYIpKC0GEnmJualKVkplmVmZDum5iZk5esn5uUo6SsUl-UWpMFmnzHSFAIiuYqVaAHEvJHY:1qd2M9:E44gXD9t6VHaIXAPUA45bpkksXXKp3ohLfiNxlWBW5Q', '2023-09-04 13:42:37.065134'),
('ezqjc2ykzgka5wj003r75xbs2amcow3z', 'eyJpc19sb2dnZWRfaW4iOnRydWV9:1qM3RA:c96TFYHd0QOBUpPJk2wUA1gESewXVRcpCWzcwiNxzdk', '2023-08-02 09:25:36.616398'),
('ffbymgvbfkkjzh0ungqidjj9gxay0b1r', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qhA3f:97qBDjt6MwfkrDagi-ZXTuK-wF96U-JVhbJnzaaRPQs', '2023-09-15 22:44:35.669297'),
('i5w3clubz9xaz28j3odek6bu2t4hrdcx', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qh3vJ:I0bJLbzMnPy9cD2By01x-6SLBEeL28lQRgBxLoCKW2U', '2023-09-15 16:11:33.963844'),
('iyaewcvp8jpc3yw0lc9sm42qq4sx0013', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qd2kT:8F3K9LDivumhoe4npZ6fJuBTT-Yd3pxqmdVX7FcWAig', '2023-09-04 14:07:45.245207'),
('jjdepnp1ym1wcnv3fhh0p4ne56wgchfb', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qesCX:A6oaw_2n63IZNNZ909MB9I1gyxp8q2GwSONEK4tT42I', '2023-09-09 15:16:17.047698'),
('loz3zfgt8wvgmuymebnrmn25utvh111t', '.eJw1yjEKwzAMheGrlDebQocunnKC0hsYpRauqC0HyZlK754UkuXxw_u-EE-LiQ62VHspnJMo4rCVAyQj3u4BJ1h9H6XGiNDP_CbNZHK8PpVGUq-v3hDgoxuf9iHWqNLl-ZeiZQ92x28Df4wuIQ:1qgLJO:joLEmvIbovWLov-pcgQM0rT7eu7C6axf4a7uOUFTDX8', '2023-09-13 16:33:26.036156'),
('lt6q7eq89fhuwjovfm3h0g8owancd1y8', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjTRUYIpKC0GEnmJualKVkplmVmZDum5iZk5esn5uUo6SsUl-UWpMFmnzHSFAIiuYqVaAHEvJHY:1qi6Wn:njG6Q-iRnzeLslwQtxYsV1IKx_7tp3z64pDRtJb2VmY', '2023-09-18 13:10:33.305439'),
('m9i448vdsrwc5hb9pc7ffdwop9du6lqe', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qhmDj:swSv571jwzK1zwmqIphkkg80NjI0eh5s9NQd27Ed87A', '2023-09-17 15:29:31.604872'),
('q8e9i7w72g6zmbbpbhavfyycy193k0v3', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qhPSG:N1bsLc3mRM-Qj4ME_9d0ZS8Fb6O3ZZ_eU1eco5Dovks', '2023-09-16 15:11:00.056873'),
('qpnh7cpym9xbihx6l3a22taujwsujism', '.eJw1izEOwjAMAP_iuUoYoKBM_CQKiWssxXbUpDAg_t4yMN6d7gPcYzUiLJEVwlg3nGDjAgFSEdY7SeLqsglMoEnwHw5sqy1cMTbOh32O0YL3uagzraz4xsdiOvpv9v1FnoXi5XS-zjfXlOC7A7MwKyw:1qY3Sb:xJ52WhE5vmwC93vQ4goWaAADXMQy582b2M_Qp-q64Kw', '2023-09-04 11:52:41.281572'),
('seyc4s5nf9tugfbk8oiqxywvo4o19m73', '.eJw1izEOwjAMAP_iuUoYoKBM_CQKiWssxXbUpDAg_t4yMN6d7gPcYzUiLJEVwlg3nGDjAgFSEdY7SeLqsglMoEnwHw5sqy1cMTbOh32O0YL3uagzraz4xsdiOvpv9v1FnoXi5XS-zjfXlOC7A7MwKyw:1qVsHt:mtsA-8XWsMy28_TZnTzFgepWgV8Yt2DSNNT7LKN10Kc', '2023-08-29 11:32:37.116666'),
('t03kqmr1su12tjttuex4we1xjyattjmb', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qcgOA:94Fg3IOKNk2BY28Ar-ysZOCqzjaYGn2zsS4T93naA5g', '2023-09-03 14:15:14.717696'),
('vpvhqi2otl7rbsatgnjfi8sarz82czlj', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qeb6V:N3TOucWrpY208it87js-c2ihm7MF_ytgbhTmdquH1_k', '2023-09-08 21:00:55.159204'),
('wn8nl1tqqxq4cwj8rz1a9p2yla8tgtbw', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qhcVL:kcR5fiVCpwWqDODzv5tbIikDww-zFYGgmbpKbIgVqSM', '2023-09-17 05:07:03.025485'),
('y7mt0s5krr5iqnr4jd9mne69azqr0pzu', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qglRg:NXUBbQDmqxYUyQtI-xoMqgf5EhxufYfqxxOpwqNtCAo', '2023-09-14 20:27:44.910010'),
('zrqu7ks7dlbj76y5epy1lvkf2uesazxd', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qfhJ7:OASmJqS9e_42bRV22eXzb4qBNugm4WlmEdTCIUCDwXY', '2023-09-11 21:50:29.460376');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `created_by_uid` varchar(255) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) NOT NULL,
  `event_lat_lng` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `sub_events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`sub_events`)),
  `event_date` datetime NOT NULL,
  `event_note` varchar(255) NOT NULL,
  `event_admin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`event_admin`)),
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` int(11) NOT NULL,
  `printer_id` int(11) NOT NULL,
  `approved_date_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_fee` double NOT NULL,
  `delivery_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `status`, `delivery_fee`, `delivery_address`) VALUES
(34, 'nkbhandari95@gmail.com', 11, 11, '55.5', '#A148', 'Latitude: NaN, Longitude: NaN', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-08-03 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"David Willey\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(35, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2022-08-05 13:40:00', 'dfghjk', '[{\"name\": \"Raj\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 1, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(36, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"Nirmala\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(37, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(38, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(39, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(40, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(41, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(42, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(43, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(44, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"},{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"44_9898989892\"}, {\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"44_9865231906\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(45, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(46, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(47, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(48, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(49, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(50, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(51, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(52, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(53, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(54, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(55, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(56, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(57, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(58, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 0, 55.5, 'VCNR Archade, Nelmangala'),
(59, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(60, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(61, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(62, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(63, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(64, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(65, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(66, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(67, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(68, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(69, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(70, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(71, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(72, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(73, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(74, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(75, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(76, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(77, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(78, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(79, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 0, 55.5, 'VCNR Archade, Nelmangala'),
(80, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(81, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(82, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(83, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(84, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(85, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(86, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(87, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(88, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(89, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(90, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(91, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(92, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(93, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(94, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(95, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(96, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(97, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(98, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(99, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(100, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(101, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(102, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(103, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(104, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(105, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(106, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(107, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(108, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(109, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(110, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(111, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(112, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(113, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(114, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(115, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(116, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(117, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(118, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(119, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(120, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(121, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(122, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(123, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(124, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(125, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(126, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(127, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(128, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(129, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(130, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala');
INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `status`, `delivery_fee`, `delivery_address`) VALUES
(131, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(132, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(133, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(134, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(135, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(136, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(137, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(138, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(139, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(140, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(141, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(142, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(143, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(144, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(145, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(146, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(147, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(148, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(149, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(150, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(151, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(152, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(153, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(154, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(155, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(156, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(157, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(158, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(159, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(160, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(161, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(162, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(163, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(164, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(165, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(166, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(167, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(168, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(169, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(170, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(171, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(172, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(173, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(174, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(175, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(176, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(177, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(178, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(179, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(180, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(181, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(182, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(183, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(184, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(185, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(186, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(187, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(188, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(189, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(190, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(191, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(192, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(193, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(194, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(195, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(196, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(197, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(198, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(199, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(200, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(201, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(202, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(203, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(204, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(205, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(206, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(207, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(208, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(209, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(210, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(211, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 0, 55.5, 'VCNR Archade, Nelmangala'),
(212, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.959723269238731, Longitude: 79.06150376093748', '2023-08-08 20:36:59', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-08 20:37:00\", \"end_time\": \"2023-08-08 20:37:00\"}]', '2023-08-08 20:37:00', 'event takes place at Latitude: 12.959723269238731, Longitude: 79.06150376093748', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(213, 'admin@gmail.com', 12, 11, 'munnar, Kerala', 'Kerala, India', 'Latitude: 9.964520230664933, Longitude: 76.30696132343746', '2023-08-08 21:13:12', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-12-22 21:29:00\", \"end_time\": \"2023-12-22 21:29:00\"}]', '2023-12-22 21:28:00', 'My Birthday at muunar, find the lat lng Latitude: 10.0889333, Longitude: 77.05952479999999. Sorry sorry sorry!!! moved to Kochi Latitude: 9.964520230664933, Longitude: 76.30696132343746', '[{\"name\": \"john Doe\", \"role\": \"Birthday Boy\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(214, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.9141417, Longitude: 74.8559568', '2023-08-09 14:03:27', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-12-23 12:00:00\", \"end_time\": \"2023-12-23 14:30:00\"}]', '2023-12-22 11:00:00', 'Marriage', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"214_9898989892\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(215, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.305163, Longitude: 76.65517489999999', '2023-08-09 14:03:27', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-10-12 10:15:00\", \"end_time\": \"2023-10-12 10:55:00\"}]', '2023-10-12 07:30:00', 'event note', '[]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55, 'VCNR Archade, Nelmangala'),
(216, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.42639027642552, Longitude: 75.7408463513428', '2023-08-09 14:41:50', '[{\"sub_event_name\": \"muhartam\", \"start_time\": \"2023-10-12 11:00:00\", \"end_time\": \"2023-10-12 12:00:00\"}]', '2023-10-12 10:00:00', 'Maharaja Wedding at Mysuru Palace', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"/media/images/qr_codes/qr_code.png\"}, {\"name\": \"john Doe\", \"role\": \"Bride\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"/media/images/qr_codes/qr_code.png\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(217, 'admin@gmail.com', 12, 11, '4rd Cross', '#A148', 'Latitude: 12.305163, Longitude: 76.65517489999999', '2023-08-09 15:09:25', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-10-01 11:00:00\", \"end_time\": \"2023-10-01 11:30:00\"}, {\"sub_event_name\": \"testing\", \"start_time\": \"2023-09-17 16:50:00\", \"end_time\": \"2023-09-17 16:50:00\"}]', '2023-10-01 10:30:00', '25th Birthday', '[{\"name\": \"john Doe\", \"role\": \"Birthday Boy\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/217_9865231906.png\"},{\"name\": \"David Willey\", \"role\": \"Bride\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 55, 'VCNR Archade, Nelmangala'),
(218, 'admin@gmail.com', 11, 11, 'asdfghjk', 'kjhgfdsdfg', 'Latitude: 12.2958104, Longitude: 76.6393805', '2023-08-21 17:46:40', '[{\"sub_event_name\": \"mnbvcxz\", \"start_time\": \"2023-08-21 19:11:00\", \"end_time\": \"2023-08-21 19:11:00\"}, {\"sub_event_name\": \"poiuytrew\", \"start_time\": \"2023-08-21 19:23:00\", \"end_time\": \"2023-08-21 19:23:00\"}, {\"sub_event_name\": \"oiuytremnbvc\", \"start_time\": \"2023-08-21 19:12:00\", \"end_time\": \"2023-08-21 19:12:00\"}, {\"sub_event_name\": \"oooooooooooooooooooooooo\", \"start_time\": \"2023-08-21 19:38:00\", \"end_time\": \"2023-08-21 19:39:00\"}]', '2023-09-13 19:05:00', 'mnbvcxcfgh', '[{\"name\": \"David Willey\", \"role\": \"Bride\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala'),
(219, 'admin@gmail.com', 12, 11, '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', '#A148', 'Latitude: 13.0476933, Longitude: 77.8595963', '2023-08-26 13:58:51', '[{\"sub_event_name\": \"test delivery\", \"start_time\": \"2023-09-09 13:57:00\", \"end_time\": \"2023-09-09 13:57:00\"}]', '2023-09-14 13:56:00', 'poiuytre', '[{\"name\": \"David Willey\", \"role\": \"tester\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 14, '0000-00-00 00:00:00', 1, 250, 'VCNR Archade, Nelmangala'),
(220, 'admintest@gmail.com', 12, 11, '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', 'tttt', 'Latitude: 13.0345565, Longitude: 77.52620089999999', '2023-09-14 11:40:26', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-09-14 11:53:00\", \"end_time\": \"2023-09-14 11:53:00\"}, {\"sub_event_name\": \"test2\", \"start_time\": \"2023-09-17 15:07:00\", \"end_time\": \"2023-09-17 15:07:00\"}]', '2023-09-17 11:52:00', 'my event', '[{\"name\": \"David Willey\", \"role\": \"test2\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/220_9898989892.png\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1, 450, 'VCNR Archade, Nelmangala');

-- --------------------------------------------------------

--
-- Table structure for table `events_type`
--

CREATE TABLE `events_type` (
  `id` int(11) NOT NULL,
  `event_type_name` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events_type`
--

INSERT INTO `events_type` (`id`, `event_type_name`, `status`, `created_by`) VALUES
(11, 'Marriage', 1, 'nkbhandari95@gmail.com'),
(12, 'Birthday', 1, 'nkbhandari95@gmail.com'),
(13, 'test popup edit', 1, 'admintest@gmail.com'),
(14, 'Engagement', 1, 'admintest@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `event_admin_invite`
--

CREATE TABLE `event_admin_invite` (
  `id` int(11) NOT NULL,
  `invited_by` varchar(255) NOT NULL,
  `invited_to` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_guest_invite`
--

CREATE TABLE `event_guest_invite` (
  `id` int(11) NOT NULL,
  `invited_by` varchar(255) NOT NULL,
  `invited_to` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `invite_message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_guest_invite`
--

INSERT INTO `event_guest_invite` (`id`, `invited_by`, `invited_to`, `event_id`, `status`, `created_at`, `invite_message`) VALUES
(189, 'wjkkjhgfdserty', '9738505213', 218, 0, '2023-09-18 06:00:37', 'Test view response in bulk with phone no'),
(190, 'wjkkjhgfdserty', '8660225160', 218, 0, '2023-09-18 06:02:42', 'Test view response in bulk with phone no'),
(191, 'wjkkjhgfdserty', '4567898765', 218, 0, '2023-09-18 06:02:42', 'Test view response in bulk with phone no'),
(192, 'wjkkjhgfdserty', '1224509834', 218, 0, '2023-09-18 06:02:42', 'Test view response in bulk with phone no'),
(193, 'wjkkjhgfdserty', '9898098765', 218, 0, '2023-09-18 06:02:42', 'Test view response in bulk with phone no'),
(195, 'wjkkjhgfdserty', '1111111111', 218, 0, '2023-09-18 06:03:33', 'Test view response in bulk with phone no');

-- --------------------------------------------------------

--
-- Table structure for table `greeting_cards`
--

CREATE TABLE `greeting_cards` (
  `id` int(11) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `card_image_url` varchar(255) NOT NULL,
  `card_price` double NOT NULL,
  `printer_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `greeting_cards`
--

INSERT INTO `greeting_cards` (`id`, `card_name`, `card_image_url`, `card_price`, `printer_id`, `created_on`, `status`) VALUES
(9, 'Wedding_card_blue', 'images/greeting_card/1690794699_wed2.jpg', 250, 14, '2023-07-31 09:11:39', 1),
(10, 'Invite1  ', 'images/greeting_card/1693807614_IMG-20221010-WA0000.jpg', 250, 14, '2023-09-04 06:06:54', 0),
(11, 'Invite1  ', 'images/greeting_card/1694593608_IMG-20221010-WA0000.jpg', 12235, 15, '2023-09-13 08:26:48', 1),
(12, 'Invite12', 'images/greeting_card/1694605144_IMG-20221010-WA0000.jpg', 280, 18, '2023-09-13 11:39:04', 1),
(13, 'j', 'images/greeting_card/1694690342_IMG-20221010-WA0000.jpg', 250, 15, '2023-09-14 11:19:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `city_name`, `status`, `created_by`) VALUES
(11, 'Mysore', 1, 'nkbhandari95@gmail.com'),
(12, 'Hubbali', 1, 'admintest@gmail.com'),
(13, 'Tumkur', 1, 'admintest@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `uid`, `type`, `title`, `message`, `created_on`) VALUES
(1, 'wjkkjhgfdserty', '0', 'Event Created', 'You have created a new event.', '2023-09-14 05:49:29'),
(2, 'wjkkjhgfdserty', '0', 'KYC Updated', 'Your KYC information has been updated.', '2023-09-14 05:49:29'),
(3, 'wjkkjhgfdserty', '0', 'Shagun Received', 'You have received a shagun amount.', '2023-09-14 05:49:29'),
(4, 'wjkkjhgfdserty', '0', 'Invitation', 'You have been invited to an event.', '2023-09-14 05:49:29'),
(5, 'wertyuijhgfmn', 'event', 'Event has been created', ' Event created for Marriage  on 2023-09-14 11:52:00', '2023-09-14 06:23:41'),
(6, 'wjkkjhgfdserty', 'KYC', 'KYC Completed for Sangeetha Thapa', 'KYC added for Aadhar Card:12345678987654 and PAN CARD:BARPT3925R', '2023-09-14 09:38:22'),
(7, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for None on 2023-09-17 11:52:00', '2023-09-17 09:07:23'),
(8, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for None on 2023-09-17 11:52:00', '2023-09-17 09:10:00'),
(9, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for None on 2023-09-17 11:52:00', '2023-09-17 09:11:39'),
(10, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 09:26:29'),
(11, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 09:30:00'),
(12, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 09:32:18'),
(13, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 09:37:28'),
(14, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 09:37:39'),
(15, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 09:40:22'),
(16, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 09:40:22'),
(17, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 11:13:19'),
(18, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for Birthday on 2023-09-17 11:52:00', '2023-09-17 11:13:44'),
(19, 'wertyuijhgfmn', 'event', 'Event has been created', ' Event created for Birthday on 2023-10-01 10:30:00', '2023-09-17 11:21:11'),
(20, 'poiuytrtyuiopoiuy', 'invite', 'David Willey has invited you to Marriage', 'David Willey has invited you to Marriage', '2023-09-18 06:00:37'),
(21, 'Santhosh', 'invite', 'David Willey has invited you to Marriage', 'David Willey has invited you to Marriage', '2023-09-18 06:02:42'),
(22, 'poiuytrtyuiopoiuy', 'invite', 'David Willey has invited you to Marriage', 'David Willey has invited you to Marriage', '2023-09-18 06:02:42'),
(23, 'Santhosh', 'invite', 'David Willey has invited you to Marriage', 'David Willey has invited you to Marriage', '2023-09-18 06:03:33'),
(24, 'poiuytrtyuiopoiuy', 'invite', 'David Willey has invited you to Marriage', 'David Willey has invited you to Marriage', '2023-09-18 06:03:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `transaction_id`, `status`, `created_on`) VALUES
(1, 17, 1, '2023-09-08 18:07:48'),
(2, 17, 2, '2023-09-11 18:08:06'),
(3, 17, 6, '2023-09-12 18:08:26'),
(4, 17, 3, '2023-09-13 18:08:40'),
(5, 17, 4, '2023-09-14 18:09:07'),
(6, 47, 6, '2023-09-16 07:22:58'),
(7, 46, 6, '2023-09-16 07:51:52'),
(8, 47, 6, '2023-09-16 07:56:12'),
(9, 47, 6, '2023-09-16 07:56:56'),
(10, 47, 6, '2023-09-16 07:57:56'),
(11, 45, 6, '2023-09-16 08:37:51'),
(12, 46, 6, '2023-09-16 08:42:25'),
(13, 49, 6, '2023-09-16 08:43:39'),
(14, 48, 6, '2023-09-16 08:43:39'),
(15, 55, 6, '2023-09-16 08:46:26'),
(16, 53, 6, '2023-09-16 08:46:26'),
(17, 54, 6, '2023-09-16 08:46:26'),
(18, 46, 6, '2023-09-16 08:52:59'),
(19, 45, 6, '2023-09-16 08:57:05'),
(20, 47, 6, '2023-09-16 08:57:59'),
(21, 55, 6, '2023-09-16 08:59:21'),
(22, 53, 6, '2023-09-16 10:32:17'),
(23, 53, 6, '2023-09-16 10:36:21'),
(24, 54, 6, '2023-09-16 10:36:32'),
(25, 49, 6, '2023-09-16 10:45:36'),
(26, 48, 6, '2023-09-16 10:45:36'),
(27, 55, 6, '2023-09-16 11:04:16'),
(28, 54, 6, '2023-09-16 11:04:16'),
(29, 55, 6, '2023-09-16 11:10:26'),
(30, 54, 6, '2023-09-16 11:10:26'),
(31, 55, 6, '2023-09-16 12:04:34'),
(32, 53, 6, '2023-09-16 12:04:34'),
(33, 54, 6, '2023-09-16 12:08:29'),
(34, 49, 6, '2023-09-16 12:08:29'),
(35, 48, 6, '2023-09-16 12:08:29'),
(36, 45, 6, '2023-09-16 12:21:32'),
(37, 46, 6, '2023-09-16 12:38:31'),
(38, 45, 6, '2023-09-16 13:02:15'),
(39, 46, 6, '2023-09-16 13:04:21'),
(40, 55, 6, '2023-09-16 13:14:50'),
(41, 53, 6, '2023-09-16 13:14:50'),
(42, 54, 6, '2023-09-16 13:14:50'),
(43, 55, 6, '2023-09-16 21:45:06'),
(44, 53, 6, '2023-09-16 21:45:51'),
(45, 54, 6, '2023-09-16 21:45:51'),
(46, 49, 6, '2023-09-16 21:46:00'),
(47, 48, 6, '2023-09-16 21:46:00'),
(48, 47, 6, '2023-09-16 21:46:00'),
(49, 46, 6, '2023-09-16 21:46:00'),
(50, 45, 6, '2023-09-16 21:46:00'),
(51, 55, 6, '2023-09-16 21:52:20'),
(52, 53, 6, '2023-09-16 21:52:20'),
(53, 46, 6, '2023-09-16 21:53:00'),
(54, 54, 6, '2023-09-16 21:53:23'),
(55, 49, 6, '2023-09-16 21:53:23'),
(56, 48, 6, '2023-09-16 21:53:23'),
(57, 47, 6, '2023-09-16 21:53:23'),
(58, 45, 6, '2023-09-16 21:53:23'),
(59, 0, 2, '2023-09-17 07:36:45'),
(60, 0, 3, '2023-09-17 07:37:25'),
(61, 0, 4, '2023-09-17 07:44:31'),
(62, 0, 4, '2023-09-17 07:45:13'),
(63, 45, 2, '2023-09-17 07:46:25'),
(64, 45, 2, '2023-09-18 05:10:47'),
(65, 45, 5, '2023-09-18 05:11:23'),
(66, 49, 2, '2023-09-18 05:17:15'),
(67, 46, 2, '2023-09-18 05:46:50'),
(68, 46, 3, '2023-09-18 05:47:07'),
(69, 46, 4, '2023-09-18 05:47:10'),
(70, 46, 5, '2023-09-18 05:47:13'),
(71, 49, 3, '2023-09-18 05:48:01'),
(72, 49, 4, '2023-09-18 05:49:00'),
(73, 49, 5, '2023-09-18 05:49:03'),
(74, 47, 2, '2023-09-18 05:49:48');

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `city` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `gst_no` varchar(255) NOT NULL,
  `store_owner` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `printer_user_name` varchar(255) NOT NULL,
  `printer_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `printer`
--

INSERT INTO `printer` (`id`, `store_name`, `city`, `address`, `email`, `status`, `gst_no`, `store_owner`, `contact_number`, `printer_user_name`, `printer_password`) VALUES
(14, 'Big Printers', 11, '4rd Cross', '23.987654-89.9809876', 1, 'GSTIN09897564456', 'Vijay Kumar', '9864332469', 'viji@gmail.com', '1234'),
(15, 'Nirmala Printing Press', 11, '4rd Cross', 'test@mail.com', 0, 'GSTIN09897564456', 'Nirmala Kumari Bhandari', '9090909090', 'nkbhandariprinters@gmail.com', '1234'),
(17, 's', 11, 's', 'sangeethathapa82@gmail.com', 0, 'saq4210', 's', '2365478912', 'admintest@gmail.com', 'admin'),
(18, 'q', 11, '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', 'sangeethathapa82@gmail.', 1, 'qsljuytr678uytf', 'q', '0888421630', 'adminte@gmail', 'adminH3@'),
(19, 'a', 11, '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', 'sangeethathapa82@gmail', 1, 'qsljuytr678uytf', 'Ganesh', '0888421630', 'admintest@gmail.c', 'adminA@123');

-- --------------------------------------------------------

--
-- Table structure for table `print_jobs`
--

CREATE TABLE `print_jobs` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `printer_id` varchar(255) NOT NULL,
  `card_id` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified` datetime NOT NULL,
  `billing_amount` double NOT NULL,
  `event_id` int(11) NOT NULL,
  `wish` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `print_jobs`
--

INSERT INTO `print_jobs` (`id`, `transaction_id`, `printer_id`, `card_id`, `status`, `created_on`, `last_modified`, `billing_amount`, `event_id`, `wish`) VALUES
(2, '45', '14', '9', 5, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 34, ''),
(3, '49', '14', '9', 5, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 34, ''),
(4, '46', '14', '9', 5, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 34, ''),
(5, '47', '14', '9', 2, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 34, ''),
(6, '48', '14', '9', 1, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 36, '');

-- --------------------------------------------------------

--
-- Table structure for table `settlements`
--

CREATE TABLE `settlements` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `receiver_bank_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settlements`
--

INSERT INTO `settlements` (`id`, `transaction_id`, `event_id`, `receiver_bank_id`, `created_on`) VALUES
(4, 17, 34, 1, '2023-07-31 17:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `id` int(11) NOT NULL,
  `sender_uid` varchar(255) NOT NULL,
  `receiver_uid` varchar(255) NOT NULL,
  `transaction_amount` double NOT NULL,
  `shagun_amount` double NOT NULL,
  `greeting_card_id` int(11) NOT NULL,
  `transaction_fee` double NOT NULL,
  `delivery_fee` double NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `is_settled` tinyint(1) DEFAULT 0,
  `reciever_bank_id` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `gifter_name` varchar(255) NOT NULL,
  `greeting_card_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`id`, `sender_uid`, `receiver_uid`, `transaction_amount`, `shagun_amount`, `greeting_card_id`, `transaction_fee`, `delivery_fee`, `transaction_id`, `payment_status`, `event_id`, `status`, `is_settled`, `reciever_bank_id`, `created_on`, `gifter_name`, `greeting_card_price`) VALUES
(45, 'poiuytrtyuiopoiuy', 'wjkkjhgfdserty', 4500.5, 2100.25, 7890, 22.75, 25, '0', '0', 34, 0, 0, '', '2023-08-06 10:50:05', '', 0),
(46, 'poiuytrtyuiopoiuy', 'wjkkjhgfdserty', 5800.25, 2700.5, 3456, 25.75, 30, '0', '0', 34, 0, 0, '', '2023-08-06 12:35:10', '', 0),
(47, 'poiuytrtyuiopoiuy', 'wjkkjhgfdserty', 7800.75, 3600.5, 6789, 52.25, 55, '0', '0', 34, 0, 0, '', '2023-08-06 15:10:20', '', 0),
(48, 'poiuytrtyuiopoiuy', 'wjkkjhgfdserty', 9100.25, 4400.75, 8901, 40.5, 45, '0', '0', 34, 0, 0, '', '2023-08-06 16:45:30', '', 0),
(49, 'poiuytrtyuiopoiuy', 'wjkkjhgfdserty', 5200, 2500, 4567, 18, 20.5, '0', '0', 34, 0, 0, '', '2023-08-06 18:35:40', '', 0),
(52, 'v0FxDg19CZOg0iBjQprxTrBwjk13', 'QEdAObI232VCtVBtt7fDOLkKeai1', 120.98, 0.09, 1, 0.07, 50.04, '0', '0', 1, 0, 0, '', '2023-08-21 11:29:21', 'Santhosh', 0),
(53, 'v0FxDg19CZOg0iBjQprxTrBwjk13', 'QEdAObI232VCtVBtt7fDOLkKeai1', 120.98, 0.09, 1, 0.07, 50.04, '0', '0', 34, 0, 0, '', '2023-08-21 11:29:21', 'Santhosh', 0),
(54, 'v0FxDg19CZOg0iBjQprxTrBwjk13', 'QEdAObI232VCtVBtt7fDOLkKeai1', 120.98, 0.09, 1, 0.07, 50.04, '0', '0', 34, 0, 0, '', '2023-08-21 11:29:21', 'Santhosh', 0),
(55, 'v0FxDg19CZOg0iBjQprxTrBwjk13', 'QEdAObI232VCtVBtt7fDOLkKeai1', 520.98, 300.09, 1, 100.07, 50.04, '0', '0', 34, 1, 0, '', '2023-08-21 11:33:55', 'Santhu mane kade', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `auth_type` varchar(255) NOT NULL,
  `kyc` tinyint(1) NOT NULL DEFAULT 0,
  `profile_pic` varchar(255) NOT NULL DEFAULT 'http://cdn.onlinewebfonts.com/svg/img_504768.png',
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `role` tinyint(1) NOT NULL,
  `fcm_token` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uid`, `name`, `email`, `phone`, `auth_type`, `kyc`, `profile_pic`, `created_on`, `status`, `role`, `fcm_token`, `city`, `password`) VALUES
(32, 'wjkkjhgfdserty', 'David Willey', 'david@gmail.com', '9898989892', '', 1, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-07-30 14:54:58', 0, 3, 'wertyuiop0987654ertkkjhgf', '', 'admin'),
(33, 'wjkkjhgkjhgfdserty', 'john Doe', 'john@gmail.com', '9865231906', '', 1, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-07-30 14:54:58', 0, 3, 'wertyuiop0987654ertkkjhgf', '', 'admin'),
(35, 'Santhosh', 'Santhosh Kumar Murthy', 'Santhosh', '8660225160', '', 0, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-08-26 08:36:31', 1, 2, '', 'Bangalore', 'sandy@#123'),
(36, 'testadmin', 'test admin for shagun', 'testadmin', '9898098979', '', 1, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-08-26 08:40:46', 1, 3, '', 'Bangalore', 'test@#123'),
(37, 'poiuytrtyuiopoiuy', 'Roop Raj', 'roopraj@gmail.cm', '9738505213', '', 0, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-08-26 08:46:58', 0, 3, 'f2ddBJQTQy-C4uEDRf3VdS:APA91bHpGcBi-ruY2IjsxMLfS1OxRSM5-VY9e3AHcqd_PSFPPiV7qGULmFRpY-N6nvjblyYTH5pEoz35iklzzRNS37Quzcnb0USl4XggHH_F99Z0U94QnjwtetqRal24gBSdUTV_VsAc', 'Bangalore', '12345'),
(38, 'admintest@gmail.com', 'Admin test for shagun', 'admintest@gmail.com', '9809089789', '', 0, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-08-26 08:51:59', 1, 1, '', 'Bangalore', 'admin'),
(42, 'admin@shagun.com', 'Shagun Admin', 'admin@shagun.com', '1234567890', '', 0, 'images/profile_pic/profile.png', '2023-09-15 08:51:59', 1, 1, '', 'Bangalore', 'admin@#123');

-- --------------------------------------------------------

--
-- Table structure for table `user_callback_request`
--

CREATE TABLE `user_callback_request` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `completed_by` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `event_date` date DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_callback_request`
--

INSERT INTO `user_callback_request` (`id`, `uid`, `type`, `status`, `completed_by`, `created_on`, `event_date`, `event_type`, `city`) VALUES
(9, 'wjkkjhgfdserty', 'KYC', 0, 'admin@gmail.com', '2023-07-30 16:15:37', '2023-09-15', NULL, 11),
(10, 'wjkkjhgkjhgfdserty', 'event', 1, 'admin@gmail.com', '2023-07-30 16:15:37', '2023-09-15', 'Marriage', 11),
(11, 'wjkkjhgkjhgfdserty', 'event', 1, 'admin@gmail.com', '2023-07-30 16:15:37', '2023-09-15', 'Marriage', 11),
(12, 'wjkkjhgfdserty', 'KYC', 1, 'admin@gmail.com', '2023-07-30 16:15:37', '2023-10-22', 'Birthday', 11);

-- --------------------------------------------------------

--
-- Table structure for table `user_kyc`
--

CREATE TABLE `user_kyc` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `identification_proof1` varchar(255) NOT NULL,
  `identification_proof2` varchar(255) NOT NULL,
  `identification_number1` varchar(255) NOT NULL,
  `identification_number2` varchar(255) NOT NULL,
  `identification_doc1` varchar(255) NOT NULL,
  `identification_doc2` varchar(255) NOT NULL,
  `verification_status` tinyint(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_on` datetime NOT NULL,
  `approved_by` varchar(255) NOT NULL,
  `approved_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_kyc`
--

INSERT INTO `user_kyc` (`id`, `uid`, `full_name`, `dob`, `gender`, `address_line1`, `address_line2`, `city`, `state`, `postcode`, `country`, `identification_proof1`, `identification_proof2`, `identification_number1`, `identification_number2`, `identification_doc1`, `identification_doc2`, `verification_status`, `created_on`, `created_by`, `updated_by`, `updated_on`, `approved_by`, `approved_on`) VALUES
(40, 'wjkkjhgfdserty', 'Sangeetha Kumari Thapa', '2023-09-14', 'Female', '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', 'Bangalore', 'Karnataka', '560058', 'India', 'Driving License', 'PAN CARD', '12345678987654', 'BARPT3925R', 'images/documents/12345678987654_1694684302_IMG-20221010-WA0000.jpg', 'images/documents/BARPT3925R_1694684302_IMG-20221010-WA0000.jpg', 1, '2023-09-14 09:37:41', 'admintest@gmail.com', 'admin@shagun.com', '2023-09-18 11:43:31', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `version_details`
--

CREATE TABLE `version_details` (
  `id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `min_version` varchar(255) NOT NULL,
  `latest_version` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `version_details`
--

INSERT INTO `version_details` (`id`, `app_name`, `min_version`, `latest_version`, `platform`, `created`, `updated`) VALUES
(1, 'shagun_mobile', '1.0.0', '1.0.1', 'android', '2023-07-05 05:42:53', '2023-07-05 07:42:22'),
(2, 'shagun_mobile', '1.0.0', '1.0.1', 'IoS', '2023-07-05 05:43:11', '2023-07-05 07:42:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_list`
--
ALTER TABLE `bank_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_vendors`
--
ALTER TABLE `delivery_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events_type`
--
ALTER TABLE `events_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_guest_invite`
--
ALTER TABLE `event_guest_invite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_invite` (`invited_by`,`invited_to`,`event_id`);

--
-- Indexes for table `greeting_cards`
--
ALTER TABLE `greeting_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_printer_user_name` (`printer_user_name`),
  ADD KEY `idx_printer_user_name` (`printer_user_name`);

--
-- Indexes for table `print_jobs`
--
ALTER TABLE `print_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlements`
--
ALTER TABLE `settlements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_uid` (`uid`),
  ADD UNIQUE KEY `unique_phone` (`phone`),
  ADD KEY `idx_uid` (`uid`);

--
-- Indexes for table `user_callback_request`
--
ALTER TABLE `user_callback_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_kyc`
--
ALTER TABLE `user_kyc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uid` (`uid`);

--
-- Indexes for table `version_details`
--
ALTER TABLE `version_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `bank_list`
--
ALTER TABLE `bank_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_vendors`
--
ALTER TABLE `delivery_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `events_type`
--
ALTER TABLE `events_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `event_guest_invite`
--
ALTER TABLE `event_guest_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `greeting_cards`
--
ALTER TABLE `greeting_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `print_jobs`
--
ALTER TABLE `print_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `settlements`
--
ALTER TABLE `settlements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user_callback_request`
--
ALTER TABLE `user_callback_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_kyc`
--
ALTER TABLE `user_kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `version_details`
--
ALTER TABLE `version_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
