-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2023 at 03:05 PM
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
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_list`
--

INSERT INTO `bank_list` (`id`, `bank_name`, `bank_logo`, `status`, `created_on`, `created_by`, `updated_by`, `updated_on`) VALUES
(1, 'ICICI', 'https://assets.stickpng.com/thumbs/627ccb0a1b2e263b45696aa5.png', 1, '2023-07-22 11:17:35', NULL, 'nkbhandari95@gmail.com', '2023-10-08 13:30:54'),
(2, 'HDFC', 'https://e7.pngegg.com/pngimages/257/159/png-clipart-hdfc-logo-thumbnail-bank-logos-thumbnail.png', 1, '2023-07-22 11:17:35', NULL, 'nkbhandari95@gmail.com', '2023-10-08 13:32:14'),
(3, 'creator updator', '', 1, '2023-10-08 07:54:14', 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', '2023-10-08 13:24:14');

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
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(255) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_vendors`
--

INSERT INTO `delivery_vendors` (`id`, `delivery_vendor_name`, `city`, `address`, `lat_lng`, `status`, `gst_no`, `delivery_vendor_owner`, `contact_number`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES
(1, 'Raj', 11, 'Address Line 1', '123.456, 78.910', 1, 'fwg567', 'Vikas', '9865432345', 'admin', '2023-08-09 11:10:12', '', '0000-00-00 00:00:00'),
(2, 'Roop', 12, 'Address Line 2', '123.456, 78.910', 0, 'tyuiu8987876789', 'Ashish', '9865982345', 'admin', '2023-08-09 11:16:17', '', '2023-10-08 16:10:36'),
(3, 'Professional Courier', 13, '4rd Cross', '', 1, 'GSTIN0989756441', 'Hong Kong', '0000000008', 'nkbhandari95@gmail.com', '2023-08-15 14:57:53', '', '0000-00-00 00:00:00'),
(4, 'creator updator', 12, 'creator updator', '', 1, 'GSTIN0989756445', 'creator updator', '7676543232', 'nkbhandari95@gmail.com', '2023-10-14 14:02:14', 'nkbhandari95@gmail.com', '2023-10-07 19:24:42');

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
('2rz3ud4e14suf6vweq340u5bwjk4sbm3', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjLUUYIpKC0GEnmJualKVkolqcUlxSX5RakO6bmJmTl6yfm5SjpKYBEMJUq1ANPYJhM:1qofz6:XbwHV-2JYiMpSh1aXSn1n2fQdEsL8uaOE_s1n3A_4ug', '2023-10-06 16:14:56.925023'),
('32kj1v97a9jkwrhjflo4ztd7pqmmymd7', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qgdis:T_KwA-3NcR4VKbBk_rW9NWQtjmksg8bR4yd1-dU4bRk', '2023-09-14 12:12:58.676469'),
('37wo8htvh52wzsc5mgozx5y88kh13jkl', '.eJxNjTEOwjAMRa-CPEetGBjoBGfgAJFJXNcidiKXTIi7E7au77-v9wHZY6nMlKMYLG_vFKBLhgXs9dzQMrpcLzdWlDKlqhDAUGnsjw252-medTwDeC2DngM0r6sUik3SsESRaZ8PcE7iqRf0f7hOzRi-P5RsL74:1qoidl:532h2vljji-BGyRcOpKj9BzvpWUe00Q2gINzT361xGI', '2023-10-06 19:05:05.241153'),
('3k04lfdzlqe7vg0ihdwwztprp04rdi1z', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjLUUYIpKC0GEnmJualKVkolqcUlxSX5RakO6bmJmTl6yfm5SjpKYBEMJUq1ANPYJhM:1qmBNz:5PmQQ1exh8JVARN-cwnt30GmKzAiKuXs70EuVtRmsuw', '2023-09-29 19:10:19.386530'),
('4d7ddl139v74pp5onwd6evppap5v7kkq', '.eJw1yjEKwzAMheGrlDebQocunnKC0hsYpRauqC0HyZlK754UkuXxw_u-EE-LiQ62VHspnJMo4rCVAyQj3u4BJ1h9H6XGiNDP_CbNZHK8PpVGUq-v3hDgoxuf9iHWqNLl-ZeiZQ92x28Df4wuIQ:1qhBl2:Z3tUyt8Znk2yYN-cbeloUYu5yu4_5OAQ9-AHZO9dRtA', '2023-09-16 00:33:28.595149'),
('7sx4i3tchuv7l3maolavzcwo6jbrqy61', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qh3oq:1cCqao-HbxgxNEtPfQF8kCmuqHdGAKZmzTwHuCyTB3Y', '2023-09-15 16:04:52.014742'),
('8bvfl7jv17ond2wpbp0rq2v0hhhxglbg', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qi6Tw:YKDFiZEpet6BJZVEx_V-dgZtm2BUzzNsp7QLUJ3DOjE', '2023-09-18 13:07:36.961921'),
('97ey7zubghm4bo95x1oje1flbggsnc3g', '.eJxljjsOwyAMQK9SeUaJ2jFTeoYeACFwqSV-MjBVvXsNzVApC8Pj2X5voKpD9h6dpgRb444KOjnYwLhIaa8v43tabI6gIJmI8vOY7HIfglDOQehVQeH8pIC6kBWLovFY1z-4WmLbg-FxMi8leZmWgMKUGvI5ZHTc5uKf0Ks8R0TD2mrLjLuPhsJROMlJgc8XcD9TCQ:1qna3n:bpCIBLuqkhxZWND2ZJA-HKN0rQRe8soljamc4tRILkg', '2023-10-03 15:43:15.140401'),
('99adgidus9cteo3litsl8dxz2rn0lncc', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qh40a:C8-ELdxeg2O_AWtujI09z5Vo5BouLqw-QUeFZ5YMwU4', '2023-09-15 16:17:00.108403'),
('a19yutok5gtnr9mv43k2eod3dmueh3m7', '.eJxNjTEOwjAMRa-CPEetGBjoBGfgAJFJXNcidiKXTIi7E7au77-v9wHZY6nMlKMYLG_vFKBLhgXs9dzQMrpcLzdWlDKlqhDAUGnsjw252-medTwDeC2DngM0r6sUik3SsESRaZ8PcE7iqRf0f7hOzRi-P5RsL74:1qpNko:F0BpSGEt_g9MH91Gdza4oZ5ZuA-eoO5ogmpJW1-vULo', '2023-10-08 14:59:06.457967'),
('b9v64ko5agab9s9m8140ego5541rpfuh', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qe9EK:a3I990cu5Cd2ihht9k8FNkQSQKNrFLgSB_DNwEDELMc', '2023-09-07 15:15:08.030530'),
('bppgju44xpqhl63c9reb1vfzzhyarvg1', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjLUUYIpKC0GEnmJualKVkolqcUlxSX5RakO6bmJmTl6yfm5SjpKYBEMJUq1ANPYJhM:1qloH1:zK-NK3dNe9QGIb-NcpfZl3jcM_MCPmeLDdHEsbHZUV4', '2023-09-28 18:29:35.941383'),
('bty9hun2nq2hecwxn78awwnm6huhr7l9', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qfzai:pBsHdfgIdprUMRfhQRLPp6PACGleWjURt8QK1MPBeqE', '2023-09-12 17:21:52.484995'),
('bzxsxcucrnsb3y3esk59tzh6xmk889nl', '.eJxljz0KwzAMRq9SNJuEdvSUnqEHMMZWXYH_kOyp9O51TAqFLBqenj5JbyAxlSk3ZBNLCOgNZdCNOyogD_p2VfATuoySbULQ0FCatMK4hWQpLq4kUDDJSRmNseYU3_d8sD5R3uRlQ89HyjH_mOxy34VBucRB5znlSRFNJTcsSjagrH9wdcSuRzs_KkvNAT5fIZpTCQ:1qnaFZ:vBpSoxHRYoJDODXBxzh2roxc6kmDzT9B-OleRUayAUU', '2023-10-03 15:55:25.477811'),
('cwkw9902rse7gl0d8mprxtsg8iw8p0e6', '.eJw1zE0OgjAQQOGrmFlTCiQuYOVNyEjHMtpOm_6kica7CwvX78v7AOfVBWvJrCywlFSpg8oGFpDXfUcxmHi-3qxHdv0WPHQg6OnsnDw6vPzVUWIKD3a0Rt4OsJcS86J1a60vO7EYRmmc6PzoFtUWpJAUXaMLaLKehnHW46AtCTlGZXKob1RT_4wWvj9_AzyC:1qNTZG:hJ2Us6bs2qdmg_HQVjtXvC2aInF68mxj9dbVK2khXJA', '2023-08-06 07:31:50.926448'),
('eznrgkmj12yuf52kbwppd9odroymlbul', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjTRUYIpKC0GEnmJualKVkplmVmZDum5iZk5esn5uUo6SsUl-UWpMFmnzHSFAIiuYqVaAHEvJHY:1qd2M9:E44gXD9t6VHaIXAPUA45bpkksXXKp3ohLfiNxlWBW5Q', '2023-09-04 13:42:37.065134'),
('ezqjc2ykzgka5wj003r75xbs2amcow3z', 'eyJpc19sb2dnZWRfaW4iOnRydWV9:1qM3RA:c96TFYHd0QOBUpPJk2wUA1gESewXVRcpCWzcwiNxzdk', '2023-08-02 09:25:36.616398'),
('ffbymgvbfkkjzh0ungqidjj9gxay0b1r', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qhA3f:97qBDjt6MwfkrDagi-ZXTuK-wF96U-JVhbJnzaaRPQs', '2023-09-15 22:44:35.669297'),
('gom2y3ci7r731jym8tk2lzrm3btfzc05', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qmpa3:VnbwloVkeP4bhI3bYz9RomVpg4rRb7FDafXTy1Iw3mg', '2023-10-01 14:05:27.421280'),
('h7p23igqe1f9ta8womr6ssqfaa4vhlao', '.eJxNzTEKwzAMheGrFM0moWum9gw5gBG2ogpsycjxVHr3Op26fu-H9wbpsRgz5SgK2-mDAgzJsAHmKvroL-ShS7IKARQrzWX_2e15BVPdytR7gOZ2SKHYJM1KKjL19Q_XJJ5GQb8ubWnK8PkChR0tww:1qnuqZ:cs8_UtPs-CozD-apyag7zWm3-588FFw3twHQgq6pZpw', '2023-10-04 13:54:59.536916'),
('i5w3clubz9xaz28j3odek6bu2t4hrdcx', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qh3vJ:I0bJLbzMnPy9cD2By01x-6SLBEeL28lQRgBxLoCKW2U', '2023-09-15 16:11:33.963844'),
('ip38r4bfwm6fqbvdfqo04w79761zh8uy', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qmqMU:E0Aez1AnZadKModzHcD1hoWpH8s2Tfjzw6jaIK9W4lw', '2023-10-01 14:55:30.220761'),
('iyaewcvp8jpc3yw0lc9sm42qq4sx0013', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qd2kT:8F3K9LDivumhoe4npZ6fJuBTT-Yd3pxqmdVX7FcWAig', '2023-09-04 14:07:45.245207'),
('jjdepnp1ym1wcnv3fhh0p4ne56wgchfb', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qesCX:A6oaw_2n63IZNNZ909MB9I1gyxp8q2GwSONEK4tT42I', '2023-09-09 15:16:17.047698'),
('ju1m2ajsnfjos40vx0pzkdfgouco1ayl', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjLUUYIpKC0GEnmJualKVkolqcUlxSX5RakO6bmJmTl6yfm5SjpKYBEMJUq1ANPYJhM:1qnJ45:srHFvityeAMiQaKHA1FtmgCAtz67krsA0H1RDnPt650', '2023-10-02 21:34:25.408810'),
('loz3zfgt8wvgmuymebnrmn25utvh111t', '.eJw1yjEKwzAMheGrlDebQocunnKC0hsYpRauqC0HyZlK754UkuXxw_u-EE-LiQ62VHspnJMo4rCVAyQj3u4BJ1h9H6XGiNDP_CbNZHK8PpVGUq-v3hDgoxuf9iHWqNLl-ZeiZQ92x28Df4wuIQ:1qgLJO:joLEmvIbovWLov-pcgQM0rT7eu7C6axf4a7uOUFTDX8', '2023-09-13 16:33:26.036156'),
('lt6q7eq89fhuwjovfm3h0g8owancd1y8', '.eJyrVsosji8oyswrSS2Kz8lPT09Nic_MU7IqKSpN1VHKTFGyMjTRUYIpKC0GEnmJualKVkplmVmZDum5iZk5esn5uUo6SsUl-UWpMFmnzHSFAIiuYqVaAHEvJHY:1qi6Wn:njG6Q-iRnzeLslwQtxYsV1IKx_7tp3z64pDRtJb2VmY', '2023-09-18 13:10:33.305439'),
('m9i448vdsrwc5hb9pc7ffdwop9du6lqe', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qhmDj:swSv571jwzK1zwmqIphkkg80NjI0eh5s9NQd27Ed87A', '2023-09-17 15:29:31.604872'),
('n09d1bbn2asrwap6bxc9tgdi9u6vabs1', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qnCUP:56lqxmdWc3paEqxFVcYUYLPhpsA0BKyKH6Ypsz5CBbM', '2023-10-02 14:33:09.888341'),
('nhxauht22ig0uqpqn8in7s1chap7yc6a', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qn0ZE:5C7PoSxcvvI28wq4ZCCshsVI-nQMH0nWvl1TmOOD3EM', '2023-10-02 01:49:20.607771'),
('o00617em2ztkdx1amo3g13emnrg6en80', '.eJxlj0EKAjEMRa8iWZcZFFw4Kz2DByixjZ1gmw5puxLvbh0UFDdZ_Ly8JHfgYhdlqaQ25hDIWxaYqjYywB6m3dbAB2ilF8FEMEGlUkvNSseQkOPgcgIDa_KH9EZf86dvLz_I7TKjeFQ-7H9cb8t5xtBkc_KpTxrQHHu6HpWvHMku7DrFCQOV8SscHatrEde_8rBIgMcTEJxVBA:1qolMV:Z5qmyYM5_MoSpTdhFl3-Gnb2pQLkrQqNDfHDnLNsHbM', '2023-10-06 21:59:27.186033'),
('o0i30mg12a1uxyt8wql6y15pg72yayk5', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qn1r0:Y2O_jOjpDCWSNTiZKevQAmM3-jqi29f3kCuLQyxMGqs', '2023-10-02 03:11:46.170790'),
('pliv2y11trvx912wvqyc6rofu9z3j0gv', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qmaoM:KZAo_IIBy0DZP7y5cVDJCmfQhw6cxXsYkQMI7pnXdF0', '2023-09-30 22:19:14.138971'),
('q8e9i7w72g6zmbbpbhavfyycy193k0v3', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qhPSG:N1bsLc3mRM-Qj4ME_9d0ZS8Fb6O3ZZ_eU1eco5Dovks', '2023-09-16 15:11:00.056873'),
('qbhnm207fx5xchm6myyqkcec2ci8a82x', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qllwS:V1_Er4zWi8FWeUDpWLsU2j5cwpoqbowtKxByStQtyEA', '2023-09-28 16:00:12.342157'),
('qisl1m8zoa3d6hgto150thbofg3bgnnd', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qmCFN:9boSf7Ziik-YQHMIcaJ1MN0mmeAxibTVzVTI54lRgZQ', '2023-09-29 20:05:29.502041'),
('qpnh7cpym9xbihx6l3a22taujwsujism', '.eJw1izEOwjAMAP_iuUoYoKBM_CQKiWssxXbUpDAg_t4yMN6d7gPcYzUiLJEVwlg3nGDjAgFSEdY7SeLqsglMoEnwHw5sqy1cMTbOh32O0YL3uagzraz4xsdiOvpv9v1FnoXi5XS-zjfXlOC7A7MwKyw:1qY3Sb:xJ52WhE5vmwC93vQ4goWaAADXMQy582b2M_Qp-q64Kw', '2023-09-04 11:52:41.281572'),
('rq6gwws7ptrhyt4y943hz6ywqpqdz46a', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qlkvW:g1dfkNnTiN41YcoQxn4zDXZgqBMPYhYKzV7PO_9yl5I', '2023-09-28 14:55:10.257984'),
('s1dobdy9jio7kag4s6ae8fjesnz61zt3', '.eJxNjTEOwjAMRa-CPEetGBjoBGfgAJFJXNcidiKXTIi7E7au77-v9wHZY6nMlKMYLG_vFKBLhgXs9dzQMrpcLzdWlDKlqhDAUGnsjw252-medTwDeC2DngM0r6sUik3SsESRaZ8PcE7iqRf0f7hOzRi-P5RsL74:1qp0fe:H2wKivkAFBm3eeQqJOnjdZZ3NrBKPEBMTZ-_lK60DIg', '2023-10-07 14:20:14.959970'),
('seyc4s5nf9tugfbk8oiqxywvo4o19m73', '.eJw1izEOwjAMAP_iuUoYoKBM_CQKiWssxXbUpDAg_t4yMN6d7gPcYzUiLJEVwlg3nGDjAgFSEdY7SeLqsglMoEnwHw5sqy1cMTbOh32O0YL3uagzraz4xsdiOvpv9v1FnoXi5XS-zjfXlOC7A7MwKyw:1qVsHt:mtsA-8XWsMy28_TZnTzFgepWgV8Yt2DSNNT7LKN10Kc', '2023-08-29 11:32:37.116666'),
('stc9xeq14q25thzoudn7vjt38eojqonn', '.eJxNzTEKwzAMheGrFM0moWum9gw5gBG2ogpsycjxVHr3Op26fu-H9wbpsRgz5SgK2-mDAgzJsAHmKvroL-ShS7IKARQrzWX_2e15BVPdytR7gOZ2SKHYJM1KKjL19Q_XJJ5GQb8ubWnK8PkChR0tww:1qofvE:zjatXSTLYIKhkg5PwZaHzVrQBs8W52TGscpAaZlAoP0', '2023-10-06 16:10:56.450197'),
('t03kqmr1su12tjttuex4we1xjyattjmb', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qcgOA:94Fg3IOKNk2BY28Ar-ysZOCqzjaYGn2zsS4T93naA5g', '2023-09-03 14:15:14.717696'),
('uodwy8qn0p4c10e0p3sxls8nuqz7x5pf', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qnCYc:8d-FHOBvHL4NTEMZli4Vm9WTi2gJlwZYybhYRyWhCDM', '2023-10-02 14:37:30.675650'),
('vlfc6mfj7gjrtkpe0abfrng4cj0vrsa5', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qmTIo:BwXsvRHQoh6sa9_zsb2TJbOFEmsfJsegQubGHdzcOAY', '2023-09-30 14:18:10.891035'),
('vpvhqi2otl7rbsatgnjfi8sarz82czlj', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qeb6V:N3TOucWrpY208it87js-c2ihm7MF_ytgbhTmdquH1_k', '2023-09-08 21:00:55.159204'),
('wn8nl1tqqxq4cwj8rz1a9p2yla8tgtbw', '.eJxNykEKwyAQheGrhLeWlGyzas7QA4joZDKgo2hdld49NhDo7vG9_wNpNmZmClYU67t2MugSsMKFJPpsh-Ous88JBuoSjed12bT9gqE1x6GLQal5l0i2iB-VJMfUHn9477ko43sCdukrTw:1qhcVL:kcR5fiVCpwWqDODzv5tbIikDww-zFYGgmbpKbIgVqSM', '2023-09-17 05:07:03.025485'),
('y0dbxkhiq5pd3xbf2lxxjyucsf8tldk5', '.eJxNjTEOwjAMRa-CPEetGBjoBGfgAJFJXNcidiKXTIi7E7au77-v9wHZY6nMlKMYLG_vFKBLhgXs9dzQMrpcLzdWlDKlqhDAUGnsjw252-medTwDeC2DngM0r6sUik3SsESRaZ8PcE7iqRf0f7hOzRi-P5RsL74:1qp6e3:SCwyMO4qp7m2RFdY0Du2U54yvBz7_3NIWGy5nC76XmA', '2023-10-07 20:42:59.104387'),
('y7mt0s5krr5iqnr4jd9mne69azqr0pzu', '.eJwVzE0KwyAQQOGrhFkHbaF_ZNWeRGycTAZ0RtSki9K716y_x_sCVxeVCINjgamVDUfYOMAEPiSWhrU9KXmOZtYEI4hP2PF14HDosGgZ6uppk85FY-fzCLnowhFd5rnna2t5snYOYlQiC37wvai0elxt3clyInc9Xe63h8lC8PsDRKw1Rg:1qglRg:NXUBbQDmqxYUyQtI-xoMqgf5EhxufYfqxxOpwqNtCAo', '2023-09-14 20:27:44.910010'),
('ylow5ttsj0nz6jjyr3d8k33y945kfu4f', 'e30:1qp1ai:XOhPFyJfqs22u6DqVZCJuPg5mk5VOIEDXeoO_RIaArY', '2023-10-07 15:19:12.612377'),
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
  `approved_by` varchar(255) NOT NULL,
  `printer_id` int(11) NOT NULL,
  `approved_date_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_fee` double NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `status`, `delivery_fee`, `delivery_address`, `updated_by`, `updated_on`) VALUES
(35, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2022-08-05 13:40:00', 'dfghjk', '[{\"name\": \"Raj\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 1, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(36, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"Nirmala\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(37, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(38, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(39, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(40, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(41, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(42, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(43, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(44, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"},{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"44_9898989892\"}, {\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"44_9865231906\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(45, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(47, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(48, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(50, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(51, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(52, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(53, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(54, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(55, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(56, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(57, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(58, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 0, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(59, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(60, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(61, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(62, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(63, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(64, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(65, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(66, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(67, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(68, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(69, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(70, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(71, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(72, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(73, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(74, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(75, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(76, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(77, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(78, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(79, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 0, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(80, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(81, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(82, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(83, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(84, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(85, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(86, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(87, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(88, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(89, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(90, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(91, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(92, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(93, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(94, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(95, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(96, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(97, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(98, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(99, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(100, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(101, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(102, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(103, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(104, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(105, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(106, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(107, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(108, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(109, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(110, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(111, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(112, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(113, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(114, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(115, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(116, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(117, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(118, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(119, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(120, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(121, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(122, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(123, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(124, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(125, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(126, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(127, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(128, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(129, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(130, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL);
INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `status`, `delivery_fee`, `delivery_address`, `updated_by`, `updated_on`) VALUES
(131, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(132, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(133, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(134, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(135, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(136, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(137, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(138, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(139, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(140, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(141, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(142, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(143, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(144, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(145, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(146, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(147, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(148, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(149, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(150, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(151, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(152, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(153, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(154, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(155, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(156, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(157, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(158, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(159, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(160, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(161, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(162, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(163, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(164, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(165, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(166, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(167, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(168, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(169, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(170, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(171, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(172, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(173, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(174, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(175, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(176, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(177, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(178, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(179, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(180, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(181, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(182, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(183, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(184, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(185, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(186, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(187, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(188, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(189, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(190, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(191, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(192, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(193, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(194, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(195, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(196, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(197, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(198, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(199, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(200, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(201, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(202, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(203, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(204, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(205, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(206, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(207, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(208, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(209, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(210, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(211, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 15, '0000-00-00 00:00:00', 0, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(212, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.959723269238731, Longitude: 79.06150376093748', '2023-08-08 20:36:59', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-08 20:37:00\", \"end_time\": \"2023-08-08 20:37:00\"}]', '2023-08-08 20:37:00', 'event takes place at Latitude: 12.959723269238731, Longitude: 79.06150376093748', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(213, 'admin@gmail.com', 12, 11, 'munnar, Kerala', 'Kerala, India', 'Latitude: 9.964520230664933, Longitude: 76.30696132343746', '2023-08-08 21:13:12', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-12-22 21:29:00\", \"end_time\": \"2023-12-22 21:29:00\"}]', '2023-12-22 21:28:00', 'My Birthday at muunar, find the lat lng Latitude: 10.0889333, Longitude: 77.05952479999999. Sorry sorry sorry!!! moved to Kochi Latitude: 9.964520230664933, Longitude: 76.30696132343746', '[{\"name\": \"john Doe\", \"role\": \"Birthday Boy\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(214, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.9141417, Longitude: 74.8559568', '2023-08-09 14:03:27', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-12-23 12:00:00\", \"end_time\": \"2023-12-23 14:30:00\"}]', '2023-12-22 11:00:00', 'Marriage', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"214_9898989892\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(215, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.305163, Longitude: 76.65517489999999', '2023-08-09 14:03:27', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-10-12 10:15:00\", \"end_time\": \"2023-10-12 10:55:00\"}]', '2023-10-12 07:30:00', 'event note', '[]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55, 'VCNR Archade, Nelmangala', NULL, NULL),
(216, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.42639027642552, Longitude: 75.7408463513428', '2023-08-09 14:41:50', '[{\"sub_event_name\": \"muhartam\", \"start_time\": \"2023-10-12 11:00:00\", \"end_time\": \"2023-10-12 12:00:00\"}]', '2023-10-12 10:00:00', 'Maharaja Wedding at Mysuru Palace', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"/media/images/qr_codes/qr_code.png\"}, {\"name\": \"john Doe\", \"role\": \"Bride\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"/media/images/qr_codes/qr_code.png\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(217, 'admin@gmail.com', 12, 11, '4rd Cross', '#A148', 'Latitude: 12.305163, Longitude: 76.65517489999999', '2023-08-09 15:09:25', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-10-01 11:00:00\", \"end_time\": \"2023-10-01 11:30:00\"}, {\"sub_event_name\": \"testing\", \"start_time\": \"2023-09-17 16:50:00\", \"end_time\": \"2023-09-17 16:50:00\"}]', '2023-10-01 10:30:00', '25th Birthday', '[{\"name\": \"john Doe\", \"role\": \"Birthday Boy\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/217_9865231906.png\"},{\"name\": \"David Willey\", \"role\": \"Bride\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, '0', 14, '0000-00-00 00:00:00', 1, 55, 'VCNR Archade, Nelmangala', NULL, NULL),
(218, 'admin@gmail.com', 11, 11, 'asdfghjk', 'kjhgfdsdfg', 'Latitude: 12.2958104, Longitude: 76.6393805', '2023-08-21 17:46:40', '[{\"sub_event_name\": \"mnbvcxz\", \"start_time\": \"2023-08-21 19:11:00\", \"end_time\": \"2023-08-21 19:11:00\"}, {\"sub_event_name\": \"poiuytrew\", \"start_time\": \"2023-08-21 19:23:00\", \"end_time\": \"2023-08-21 19:23:00\"}, {\"sub_event_name\": \"oiuytremnbvc\", \"start_time\": \"2023-08-21 19:12:00\", \"end_time\": \"2023-08-21 19:12:00\"}, {\"sub_event_name\": \"oooooooooooooooooooooooo\", \"start_time\": \"2023-08-21 19:38:00\", \"end_time\": \"2023-08-21 19:39:00\"}]', '2023-09-13 19:05:00', 'mnbvcxcfgh', '[{\"name\": \"David Willey\", \"role\": \"Bride\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, '0', 14, '0000-00-00 00:00:00', 1, 55.5, 'VCNR Archade, Nelmangala', NULL, NULL),
(219, 'admin@gmail.com', 12, 11, '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', '#A148', 'Latitude: 13.0476933, Longitude: 77.8595963', '2023-08-26 13:58:51', '[{\"sub_event_name\": \"test delivery\", \"start_time\": \"2023-09-09 13:57:00\", \"end_time\": \"2023-09-09 13:57:00\"}]', '2023-09-14 13:56:00', 'poiuytre', '[{\"name\": \"David Willey\", \"role\": \"tester\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, '0', 14, '0000-00-00 00:00:00', 1, 250, 'VCNR Archade, Nelmangala', NULL, NULL),
(220, 'admintest@gmail.com', 14, 13, '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', 'vbnm', 'Latitude: 13.0345565, Longitude: 77.52620089999999', '2023-09-14 11:40:26', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-09-14 11:53:00\", \"end_time\": \"2023-09-14 11:53:00\"}, {\"sub_event_name\": \"test2\", \"start_time\": \"2023-09-17 15:07:00\", \"end_time\": \"2023-09-17 15:07:00\"}]', '2023-10-01 11:52:00', 'my event', '[{\"name\": \"David Willey\", \"role\": \"test2\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/220_9898989892.png\"}]', 0, 'nkbhandari95@gmail.com', 18, '0000-00-00 00:00:00', 1, 45, 'VCNR Archade, Nelmangala', NULL, NULL);
INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `status`, `delivery_fee`, `delivery_address`, `updated_by`, `updated_on`) VALUES
(221, 'admin@shagun.com', 11, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 13:43:40', '[{\"sub_event_name\": \"test1\", \"start_time\": \"2023-10-07 13:43:00\", \"end_time\": \"2023-10-07 13:43:00\"}, {\"sub_event_name\": \"test2\", \"start_time\": \"2023-10-05 13:43:00\", \"end_time\": \"2023-10-05 13:43:00\"}, {\"sub_event_name\": \"test3\", \"start_time\": \"2023-10-03 13:43:00\", \"end_time\": \"2023-10-03 13:43:00\"}]', '2023-10-07 13:42:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"tester1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/221_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"tester2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/221_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 350, '4rd Cross\r\n#A148', NULL, NULL),
(222, 'admin@shagun.com', 12, 13, '4rd Cross', '#A148', 'Latitude: 13.3378762, Longitude: 77.117325', '2023-10-01 13:47:18', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 13:47:00\", \"end_time\": \"2023-10-01 13:47:00\"}]', '2023-10-07 13:46:00', 'test qr code', '[{\"name\": \"test admin for shagun\", \"role\": \"Groom\", \"uid\": \"testadmin\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/222_9898098979.png\"}]', 0, '0', 14, '0000-00-00 00:00:00', 1, 300, '4rd Cross\r\n#A148', NULL, NULL),
(223, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 13:56:15', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 13:56:00\", \"end_time\": \"2023-10-01 13:56:00\"}]', '2023-10-01 13:55:00', 'event note', '[{\"name\": \"David Willey\", \"role\": \"tester1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/223_9898989892.png\"}]', 0, '0', 19, '0000-00-00 00:00:00', 1, 500, '4rd Cross\r\n#A148', NULL, NULL),
(224, 'admin@shagun.com', 11, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 13:58:24', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 13:58:00\", \"end_time\": \"2023-10-01 13:58:00\"}]', '2023-10-01 13:57:00', 'test event for qr', '[{\"name\": \"test admin for shagun\", \"role\": \"tester\", \"uid\": \"testadmin\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/224_9898098979.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 600, '4rd Cross\r\n#A148', NULL, NULL),
(225, 'admin@shagun.com', 11, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 14:07:27', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 14:07:00\", \"end_time\": \"2023-10-01 14:07:00\"}, {\"sub_event_name\": \"test2\", \"start_time\": \"2023-10-01 18:15:00\", \"end_time\": \"2023-10-01 18:15:00\"}, {\"sub_event_name\": \"tes3\", \"start_time\": \"2023-10-01 18:15:00\", \"end_time\": \"2023-10-01 18:15:00\"}]', '2023-10-01 14:06:00', 'test qr code', '[{\"name\": \"David Willey\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/225_9898989892.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 350, '4rd Cross\r\n#A148', NULL, NULL),
(226, 'admin@shagun.com', 11, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 14:12:49', '[{\"sub_event_name\": \"test3\", \"start_time\": \"2023-10-01 18:21:00\", \"end_time\": \"2023-10-01 18:21:00\"}, {\"sub_event_name\": \"test4\", \"start_time\": \"2023-10-01 18:21:00\", \"end_time\": \"2023-10-01 18:21:00\"}, {\"sub_event_name\": \"test5\", \"start_time\": \"2023-10-01 18:29:00\", \"end_time\": \"2023-10-01 18:29:00\"}, {\"sub_event_name\": \"test6\", \"start_time\": \"2023-10-01 18:29:00\", \"end_time\": \"2023-10-01 18:29:00\"}]', '2023-10-01 14:12:00', 'event test', '[{\"name\": \"test admin for shagun\", \"role\": \"test\", \"uid\": \"testadmin\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/226_9898098979.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 600, '4rd Cross\r\n#A148', NULL, NULL),
(227, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 23:20:34', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/227_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/227_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross\r\n#A148', NULL, NULL),
(228, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 23:53:57', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(229, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 23:56:42', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(230, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-01 23:58:57', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(231, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:03:45', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(232, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:04:37', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(233, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:11:14', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(234, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:11:31', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(235, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:20:52', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(236, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:28:26', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/236_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/236_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(237, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:29:52', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/237_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/237_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(238, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:31:05', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/238_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/238_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(239, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:42:44', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(240, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:45:31', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(241, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:53:01', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(242, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 00:53:58', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(243, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:34:56', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(244, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:35:47', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(245, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:37:01', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(246, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:40:57', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(247, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:43:07', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(248, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:43:39', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(249, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:44:06', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(250, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:44:25', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(251, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:45:36', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(252, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:46:35', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(253, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:46:54', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/253_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/253_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(254, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:48:11', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(255, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:49:09', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(256, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:49:39', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(257, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:51:03', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(258, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:52:30', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(259, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:57:30', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(260, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 01:58:54', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(261, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 02:02:20', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(262, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 12:51:15', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(263, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 12:52:59', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(264, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 12:55:23', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(265, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:00:25', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(266, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:03:32', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(267, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:07:02', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(268, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:08:15', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(269, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:09:12', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(270, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:14:27', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/270_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/270_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(271, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:16:17', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(272, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:17:38', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/272_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/272_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(273, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:23:03', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/273_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/273_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(274, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:25:30', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(275, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:28:44', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(276, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:29:41', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/276_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/276_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(277, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:30:20', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/277_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/277_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(278, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:30:40', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/278_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/278_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(279, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:31:46', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/279_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/279_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(280, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:35:01', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/280_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/280_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(281, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:37:02', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/281_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/281_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(282, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:42:11', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(283, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:43:14', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/283_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/283_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(284, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:46:23', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/284_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/284_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(285, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:50:41', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/285_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/285_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(286, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:51:59', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/286_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/286_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(287, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 13:54:18', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/287_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/287_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(288, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 14:07:23', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(289, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 14:08:08', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"qr code\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"qr code\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL);
INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `status`, `delivery_fee`, `delivery_address`, `updated_by`, `updated_on`) VALUES
(290, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 14:12:38', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/290_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/290_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(291, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 14:14:58', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/291_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/291_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(292, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:08:54', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/292_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/292_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(293, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:14:13', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/293_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/293_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(294, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:17:04', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/294_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/294_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(295, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:20:19', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/295_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/295_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(296, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:23:06', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/296_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/296_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(297, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:25:03', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/297_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/297_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(298, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:29:03', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/298_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/298_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(299, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:30:10', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/299_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/299_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(300, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:32:56', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/300_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/300_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(301, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:33:01', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/301_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/301_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(302, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:33:36', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/302_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/302_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(303, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:33:59', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/303_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/303_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(304, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:35:37', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/304_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/304_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(305, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:37:15', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/305_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/305_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(306, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:38:09', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/306_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/306_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(307, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:40:05', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/307_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/307_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(308, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:48:24', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/308_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/308_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(309, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:52:25', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/309_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/309_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(310, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:53:38', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/310_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/310_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(311, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 15:56:56', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/311_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/311_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(312, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:15:34', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/312_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/312_9865231906.png\"}]', 0, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(313, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:16:06', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/313_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/313_9865231906.png\"}]', 1, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(314, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:18:36', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/314_9898989892.png\"}, {\"name\": \"john Doe\", \"role\": \"test2\", \"uid\": \"wjkkjhgkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/314_9865231906.png\"}]', 1, 'nkbhandari95@gmail.com', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(315, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:27:07', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/315_9898989892.png\"}]', 1, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(316, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:34:47', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/316_9898989892.png\"}]', 1, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(317, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:36:34', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/317_9898989892.png\"}]', 1, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(318, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:37:13', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/318_9898989892.png\"}]', 1, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(319, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:39:40', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/319_9898989892.png\"}]', 1, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(320, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 16:40:54', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-08 23:19:00\", \"end_time\": \"2023-10-08 23:20:00\"}]', '2023-10-08 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/320_9898989892.png\"}]', 1, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', 'nkbhandari95@gmail.com', '2023-10-08 16:11:17'),
(321, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-02 19:03:40', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-11 23:19:00\", \"end_time\": \"2023-10-08 23:20:00\"}]', '2023-10-08 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/321_9898989892.png\"}]', 1, 'nkbhandari95@gmail.com', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', 'nkbhandari95@gmail.com', '2023-10-08 15:31:46'),
(322, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-03 09:11:42', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/322_9898989892.png\"}]', 2, '0', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, NULL),
(323, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-08 16:21:36', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/323_9898989892.png\"}]', 0, '', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, '2023-10-08 16:21:36'),
(324, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-08 16:23:13', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/324_9898989892.png\"}]', 0, '', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, '2023-10-08 16:23:13'),
(325, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-08 16:23:49', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/325_9898989892.png\"}]', 0, '', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, '2023-10-08 16:23:49'),
(326, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-08 16:26:24', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/326_9898989892.png\"}]', 0, '', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, '2023-10-08 16:26:24'),
(327, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-08 16:27:03', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/327_9898989892.png\"}]', 0, '', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, '2023-10-08 16:27:03'),
(328, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-08 16:29:49', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/328_9898989892.png\"}]', 0, '', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, '2023-10-08 16:29:49'),
(329, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-08 16:30:09', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/329_9898989892.png\"}]', 0, '', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, '2023-10-08 16:30:09'),
(330, 'admin@shagun.com', 13, 12, '4rd Cross', '#A148', 'Latitude: 15.3647083, Longitude: 75.1239547', '2023-10-08 16:31:14', '[{\"sub_event_name\": \"test\", \"start_time\": \"2023-10-01 23:19:00\", \"end_time\": \"2023-10-01 23:20:00\"}]', '2023-10-01 23:19:00', 'test event', '[{\"name\": \"David Willey\", \"role\": \"test1\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"images/profile_pic/circular_logo.png\", \"qr_code\": \"images/qr_codes/330_9898989892.png\"}]', 0, '', 21, '0000-00-00 00:00:00', 1, 900, '4rd Cross #A148', NULL, '2023-10-08 16:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `events_type`
--

CREATE TABLE `events_type` (
  `id` int(11) NOT NULL,
  `event_type_name` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` varchar(255) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events_type`
--

INSERT INTO `events_type` (`id`, `event_type_name`, `status`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES
(11, 'Marriage', 1, 'nkbhandari95@gmail.com', NULL, 'nkbhandari95@gmail.com', NULL),
(12, 'Birthday', 1, 'nkbhandari95@gmail.com', NULL, 'nkbhandari95@gmail.com', '2023-10-08 13:00:38'),
(13, 'test popup edit', 1, 'admintest@gmail.com', NULL, 'nkbhandari95@gmail.com', '2023-10-08 13:00:44'),
(14, 'Engagement', 1, 'admintest@gmail.com', NULL, NULL, NULL),
(15, 'Housewarming', 1, 'admin@shagun.com', NULL, NULL, NULL),
(16, 'creator updator', 1, 'nkbhandari95@gmail.com', '2023-10-08 13:02:25', 'nkbhandari95@gmail.com', '2023-10-08 15:02:33');

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
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `greeting_cards`
--

INSERT INTO `greeting_cards` (`id`, `card_name`, `card_image_url`, `card_price`, `printer_id`, `created_on`, `status`, `created_by`, `updated_by`, `updated_on`) VALUES
(9, 'Wedding_card_blue', 'images/greeting_card/1690794699_wed2.png', 250, 14, '2023-07-31 09:11:39', 1, 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', NULL),
(10, 'Invite1  ', 'images/greeting_card/1693807614_IMG-20221010-WA0000.jpg', 250, 14, '2023-09-04 06:06:54', 0, 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', NULL),
(11, 'Invite1  ', 'images/greeting_card/1694593608_IMG-20221010-WA0000.jpg', 12235, 15, '2023-09-13 08:26:48', 1, 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', NULL),
(12, 'Invite12', 'images/greeting_card/1694605144_IMG-20221010-WA0000.jpg', 280, 18, '2023-09-13 11:39:04', 1, 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', NULL),
(13, 'asa', 'images/greeting_card/1694690342_IMG-20221010-WA0000.jpg', 250, 15, '2023-09-14 11:19:02', 0, 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', NULL),
(14, 'WeddingSpecial', 'images/greeting_card/1696316142_wed2.jpg', 127, 21, '2023-10-03 06:55:42', 1, 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', '2023-10-08 14:55:50'),
(15, 'card001AAB', 'images/greeting_card/1696321189_wed2.jpg', 250, 21, '2023-10-03 08:19:49', 1, 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', '2023-10-08 14:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` varchar(255) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `city_name`, `status`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES
(11, 'Mysore', 0, 'nkbhandari95@gmail.com', NULL, 'nkbhandari95@gmail.com', '2023-10-08 13:13:58'),
(12, 'Hubbali', 1, 'admintest@gmail.com', NULL, 'nkbhandari95@gmail.com', '2023-10-08 13:14:03'),
(13, 'Tumkur', 1, 'admintest@gmail.com', NULL, NULL, NULL),
(14, 'creator updator', 1, 'nkbhandari95@gmail.com', '2023-10-08 13:14:17', 'nkbhandari95@gmail.com', '2023-10-08 13:14:17');

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
(24, 'poiuytrtyuiopoiuy', 'invite', 'David Willey has invited you to Marriage', 'David Willey has invited you to Marriage', '2023-09-18 06:03:33'),
(25, 'poiuytrtyuiopoiuy', 'KYC', 'KYC Completed for ROOP RAJ THAPA', 'KYC added for Aadhar Card:121212121212 and PAN Card:BARPT3925RRRRR', '2023-09-29 06:33:21'),
(26, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Birthday on 2023-09-30 11:52:00', '2023-09-29 08:58:24'),
(27, 'poiuytrtyuiopoiuy', 'KYC', 'KYC Updated for ROOP RAJ THAPA', 'KYC updated with Aadhar Card:121212121212 and PAN CARD:BARPT3925RRRRR', '2023-09-29 09:49:08'),
(28, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Birthday on 2023-09-30 11:52:00', '2023-09-29 10:16:10'),
(29, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Birthday on 2023-09-30 11:52:00', '2023-09-29 10:48:41'),
(30, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Birthday on 2023-09-30 11:52:00', '2023-09-29 10:52:52'),
(31, 'wjkkjhgfdserty', 'KYC', 'KYC Updated for Sangeetha Kumari Thapa', 'KYC updated with Driving License:12345678987654 and PAN CARD:BARPT3925R', '2023-09-29 11:54:35'),
(32, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Birthday on 2023-10-01 11:52:00', '2023-09-30 13:14:09'),
(33, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Birthday on 2023-10-01 11:52:00', '2023-09-30 13:14:29'),
(34, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Birthday on 2023-10-01 11:52:00', '2023-09-30 13:16:10'),
(35, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for test popup edit on 2023-10-01 11:52:00', '2023-09-30 13:17:30'),
(36, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for test popup edit on 2023-10-01 11:52:00', '2023-09-30 13:18:33'),
(37, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Engagement on 2023-10-01 11:52:00', '2023-09-30 13:20:05'),
(38, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Engagement on 2023-10-01 11:52:00', '2023-09-30 14:20:33'),
(39, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Engagement on 2023-10-01 11:52:00', '2023-09-30 14:20:45'),
(40, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Engagement on 2023-10-01 11:52:00', '2023-09-30 14:20:56'),
(41, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Engagement on 2023-10-01 11:52:00', '2023-09-30 14:21:29'),
(42, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Engagement on 2023-10-01 11:52:00', '2023-09-30 14:21:37'),
(43, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for Marriage on 2023-10-07 13:42:00', '2023-10-01 08:13:40'),
(44, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for Marriage on 2023-10-07 13:42:00', '2023-10-01 08:13:41'),
(45, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-07 13:42:00', '2023-10-01 08:16:05'),
(46, 'wjkkjhgkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-07 13:42:00', '2023-10-01 08:16:05'),
(47, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-07 13:42:00', '2023-10-01 08:16:10'),
(48, 'wjkkjhgkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-07 13:42:00', '2023-10-01 08:16:11'),
(49, 'testadmin', 'event', 'Event has been created', ' Event created for Birthday on 2023-10-07 13:46:00', '2023-10-01 08:17:18'),
(50, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 13:55:00', '2023-10-01 08:26:15'),
(51, 'testadmin', 'event', 'Event has been created', ' Event created for Marriage on 2023-10-01 13:57:00', '2023-10-01 08:28:24'),
(52, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for Marriage on 2023-10-01 14:06:00', '2023-10-01 08:37:27'),
(53, 'testadmin', 'event', 'Event has been created', ' Event created for Marriage on 2023-10-01 14:12:00', '2023-10-01 08:42:49'),
(54, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-01 14:06:00', '2023-10-01 12:45:49'),
(55, 'testadmin', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-01 14:12:00', '2023-10-01 12:49:48'),
(56, 'testadmin', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-01 14:12:00', '2023-10-01 12:50:38'),
(57, 'testadmin', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-01 14:12:00', '2023-10-01 12:51:19'),
(58, 'testadmin', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-01 14:12:00', '2023-10-01 12:51:46'),
(59, 'testadmin', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-01 14:12:00', '2023-10-01 12:59:11'),
(60, 'testadmin', 'event', 'Event has been updated', ' Event updated for Marriage on 2023-10-01 14:12:00', '2023-10-01 12:59:25'),
(61, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 17:50:34'),
(62, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 17:50:35'),
(63, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:23:57'),
(64, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:26:42'),
(65, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:28:57'),
(66, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:33:45'),
(67, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:34:37'),
(68, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:41:14'),
(69, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:41:31'),
(70, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:50:52'),
(71, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:58:26'),
(72, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:58:27'),
(73, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:59:52'),
(74, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 18:59:52'),
(75, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 19:01:05'),
(76, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 19:01:06'),
(77, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 19:12:44'),
(78, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 19:15:31'),
(79, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 19:23:01'),
(80, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 19:23:58'),
(81, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:04:56'),
(82, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:05:47'),
(83, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:07:01'),
(84, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:10:57'),
(85, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:13:07'),
(86, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:13:39'),
(87, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:14:06'),
(88, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:14:25'),
(89, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:15:36'),
(90, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:16:35'),
(91, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:16:54'),
(92, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:16:55'),
(93, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:18:11'),
(94, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:19:09'),
(95, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:19:39'),
(96, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:21:03'),
(97, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:22:30'),
(98, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:27:30'),
(99, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:28:54'),
(100, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-01 20:32:20'),
(101, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:21:15'),
(102, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:22:59'),
(103, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:25:23'),
(104, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:30:25'),
(105, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:33:32'),
(106, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:37:02'),
(107, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:38:15'),
(108, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:39:12'),
(109, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:44:27'),
(110, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:44:30'),
(111, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:46:17'),
(112, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:47:38'),
(113, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:47:40'),
(114, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:53:03'),
(115, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:53:07'),
(116, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:55:30'),
(117, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:58:44'),
(118, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:59:41'),
(119, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 07:59:43'),
(120, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:00:20'),
(121, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:00:40'),
(122, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:00:41'),
(123, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:00:42'),
(124, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:01:46'),
(125, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:01:49'),
(126, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:05:01'),
(127, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:05:03'),
(128, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:07:02'),
(129, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:07:06'),
(130, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:12:11'),
(131, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:13:14'),
(132, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:13:16'),
(133, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:16:23'),
(134, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:16:25'),
(135, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:20:41'),
(136, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:20:43'),
(137, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:21:59'),
(138, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:22:02'),
(139, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:24:18'),
(140, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:24:19'),
(141, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:37:23'),
(142, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:38:08'),
(143, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:42:38'),
(144, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:42:39'),
(145, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:44:58'),
(146, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 08:44:59'),
(147, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:38:54'),
(148, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:38:56'),
(149, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:44:13'),
(150, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:44:14'),
(151, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:47:04'),
(152, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:47:06'),
(153, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:50:20'),
(154, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:50:21'),
(155, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:53:06'),
(156, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:53:07'),
(157, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:55:03'),
(158, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:55:04'),
(159, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:59:03'),
(160, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 09:59:05'),
(161, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:00:10'),
(162, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:00:11'),
(163, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:02:56'),
(164, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:02:58'),
(165, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:03:01'),
(166, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:03:02'),
(167, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:03:36'),
(168, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:03:38'),
(169, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:03:59'),
(170, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:04:00'),
(171, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:05:37'),
(172, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:05:38'),
(173, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:07:15'),
(174, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:07:16'),
(175, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:08:09'),
(176, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:08:10'),
(177, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:10:05'),
(178, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:10:07'),
(179, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:18:24'),
(180, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:18:26'),
(181, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:22:25'),
(182, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:22:26'),
(183, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:23:38'),
(184, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:23:39'),
(185, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:26:56'),
(186, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:26:57'),
(187, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:45:34'),
(188, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:45:36'),
(189, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:46:06'),
(190, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:46:08'),
(191, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:48:36'),
(192, 'wjkkjhgkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:48:38'),
(193, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 10:57:07'),
(194, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 11:04:47'),
(195, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 11:06:34'),
(196, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 11:07:13'),
(197, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 11:09:40'),
(198, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 11:10:54'),
(199, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-02 13:33:40'),
(200, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-03 03:41:42'),
(201, 'poiuytrtyuiopoiuy', 'KYC', 'KYC Completed for ROOP RAJ THAPA', 'KYC added for Aadhar Card:121214141513 and PAN Card:BARPT3925RRRRR', '2023-10-06 08:47:32'),
(202, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for test popup edit on 2023-10-08 23:19:00', '2023-10-08 09:53:48'),
(203, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for test popup edit on 2023-10-08 23:19:00', '2023-10-08 09:55:21'),
(204, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for test popup edit on 2023-10-08 23:19:00', '2023-10-08 09:56:33'),
(205, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for test popup edit on 2023-10-08 23:19:00', '2023-10-08 09:57:52'),
(206, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for test popup edit on 2023-10-08 23:19:00', '2023-10-08 10:01:46'),
(207, 'wjkkjhgfdserty', 'event', 'Event has been updated', ' Event updated for test popup edit on 2023-10-08 23:19:00', '2023-10-08 10:41:17'),
(208, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-08 10:51:36'),
(209, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-08 10:53:13'),
(210, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-08 10:53:49'),
(211, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-08 10:56:24'),
(212, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-08 10:57:03'),
(213, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-08 10:59:49'),
(214, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-08 11:00:09'),
(215, 'wjkkjhgfdserty', 'event', 'Event has been created', ' Event created for test popup edit on 2023-10-01 23:19:00', '2023-10-08 11:01:14');

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
(74, 47, 2, '2023-09-18 05:49:48'),
(75, 48, 2, '2023-10-02 13:47:56');

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
  `printer_password` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `printer`
--

INSERT INTO `printer` (`id`, `store_name`, `city`, `address`, `email`, `status`, `gst_no`, `store_owner`, `contact_number`, `printer_user_name`, `printer_password`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES
(14, 'Big Printers', 11, '4rd Cross', '23.987654-89.9809876', 1, 'GSTIN09897564456', 'Vijay Kumar', '9864332469', 'viji@gmail.com', '1234', NULL, NULL, NULL, NULL),
(15, 'Nirmala Printing Press', 11, '4rd Cross', 'test@mail.com', 0, 'GSTIN0989756445', 'Nirmala Kumari Bhandari', '9620725475', 'nkbhandariprinters@gmail.com', '1234', NULL, NULL, NULL, NULL),
(17, 's', 11, 's', 'sangeethathapa82@gmail.com', 0, 'saq4210', 's', '2365478912', 'admintest@gmail.com', 'admin', NULL, NULL, NULL, NULL),
(18, 'q', 11, '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', 'sangeethathapa82@gmail.', 1, 'qsljuytr678uytf', 'q', '0888421630', 'adminte@gmail', 'adminH3@', NULL, NULL, NULL, NULL),
(19, 'a', 11, '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', 'sangeethathapa82@gmail', 1, 'qsljuytr678uytf', 'Ganesh', '0888421630', 'admintest@gmail.c', 'adminA@123', NULL, NULL, NULL, NULL),
(21, 'teststore', 11, 'mysore, karnataka', 'teststore@gmail.com', 1, 'GSTIN098975644x', 'Vijay Kumar', '9090890989', 'teststore@gmail.com', '$2b$12$/5hmq6QBIMsmBuoULJej1.PM.hFA5C7C3FxCCcxLR1PF2LYTHBnua', NULL, NULL, NULL, NULL),
(22, 'siddideshwar printers', 12, '4rd Cross', 'rooprajt@gmail.com', 1, 'GSTIN0989756445', 'Roop Raj', '9738505213', 'rooprajt@gmail.com', '$2b$12$SbOQDp8ZtL1ZkBlRtjgItOORzMVhL6QO8j5Swq9TxBWNqxSh0VSDq', NULL, NULL, 'nkbhandari95@gmail.com', NULL),
(24, 'test created by', 12, '4rd Cross', 'testcreatedby@gmail.com', 1, 'GSTIN0989756442', 'test created by', '9087656789', 'testcreatedby@gmail.com', '$2b$12$e5aACJ6wDkwD71xw20t0Iu4FNtCpupJw9Zjz.FS1ViNx1ZCuB12g2', NULL, NULL, 'nkbhandari95@gmail.com', '2023-10-08 16:09:53');

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
(2, '45', '21', '9', 5, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 35, 'Happy birthday! May this year be the best one yet, filled with joy, laughter, and all the success you deserve.'),
(3, '49', '21', '9', 5, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 35, 'Wishing you a day filled with love, laughter, and the company of good friends. Happy birthday!'),
(4, '46', '21', '9', 5, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 35, 'Another year older, wiser, and more fabulous! May your birthday be as amazing as you are.'),
(5, '47', '21', '9', 2, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 35, 'On your special day, may all your dreams and wishes come true. Happy birthday!'),
(6, '48', '21', '9', 2, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 35, 'Here\'s to another year of adventures, laughter, and unforgettable moments. Happy birthday and enjoy your day to the fullest!');

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
  `password` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uid`, `name`, `email`, `phone`, `auth_type`, `kyc`, `profile_pic`, `created_on`, `status`, `role`, `fcm_token`, `city`, `password`, `created_by`, `updated_by`, `updated_on`) VALUES
(32, 'wjkkjhgfdserty', 'David Willey', 'david@gmail.com', '9898989892', '', 1, 'images/profile_pic/circular_logo.png', '2023-07-30 14:54:58', 0, 3, 'wertyuiop0987654ertkkjhgf', '', 'admin', '', '', '0000-00-00 00:00:00'),
(33, 'wjkkjhgkjhgfdserty', 'john Doe', 'john@gmail.com', '9865231906', '', 1, 'images/profile_pic/circular_logo.png', '2023-07-30 14:54:58', 0, 3, 'wertyuiop0987654ertkkjhgf', '', 'admin', '', '', '0000-00-00 00:00:00'),
(35, 'Santhosh', 'Santhosh Kumar Murthy', 'Santhosh', '8660225161', '', 0, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-08-26 08:36:31', 1, 2, '', 'Bangalore', 'sandy@#123', '', '', '0000-00-00 00:00:00'),
(36, 'testadmin', 'test admin for shagun', 'testadmin', '9898098979', '', 1, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-08-26 08:40:46', 1, 3, '', 'Bangalore', 'test@#123', '', '', '0000-00-00 00:00:00'),
(37, 'poiuytrtyuiopoiuy', 'Roop Raj', 'roopraj@gmail.cm', '9738505213', '', 1, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-08-26 08:46:58', 1, 3, 'f2ddBJQTQy-C4uEDRf3VdS:APA91bHpGcBi-ruY2IjsxMLfS1OxRSM5-VY9e3AHcqd_PSFPPiV7qGULmFRpY-N6nvjblyYTH5pEoz35iklzzRNS37Quzcnb0USl4XggHH_F99Z0U94QnjwtetqRal24gBSdUTV_VsAc', 'Bangalore', '12345', '', '', '0000-00-00 00:00:00'),
(38, 'admintest@gmail.com', 'Admin test for shagun', 'admintest@gmail.com', '980908978', '', 0, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-08-26 08:51:59', 0, 1, '', 'Bangalore', '$2b$12$Ley2s8lU9Tge75VWALXGKOjjsCTj1avimRiAF1S7YpFU.jd.rAI0.', '', '', '0000-00-00 00:00:00'),
(42, 'nkbhandari95@gmail.com', 'Shagun Admin', 'nkbhandari95@gmail.com', '12345', '', 0, 'images/profile_pic/circular_logo.png', '2023-09-15 08:51:59', 1, 1, '', 'Mysore', '$2b$12$Q69cKgBAShEfo763hY8nNuSCHpMmrydW3JIiaJdZfQ.kp80dbJCh6', '', '', '0000-00-00 00:00:00'),
(44, 'Roopraj', 'Roopraj Thapa', 'roop@gmail.com', '9738505214', '', 0, 'C:\\Users\\Nirmala\\Desktop\\100CANON\\IMG_9240.JPG', '2023-08-26 08:36:31', 1, 2, '', 'Bangalore', 'Roop@#123', '', 'nkbhandari95@gmail.com', '0000-00-00 00:00:00'),
(45, 'vanitha', 'Vanitha Shetty', 'vanitha@gmail.com', '9954123658', '', 0, 'C:\\Users\\Nirmala\\Downloads\\profile.png', '2023-08-26 08:36:31', 1, 2, '', 'Mysore', '$2b$12$OXcF7KaBopmADGWYwwt8d.oWrwk/UcN44efzuKwpsSS7FMit9lTOu', '', '', '0000-00-00 00:00:00'),
(46, 'testemp@gmail.com', 'New employee', 'testemp@gmail.com', '9591088998', '', 0, 'images/profile_pic/profile.png', '2023-10-07 13:16:15', 1, 2, '', 'Bangalore', '$2b$12$jxvjV5io8SbmPJCB0.jYjeOhrWrOmKPCZsIdbX/vI1VaRb9tgu/8C', 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', '2023-10-08 16:08:25'),
(47, 'rooprajt@gmail.com', 'ROOP RAJ THAPA', 'rooprajt@gmail.com', '9089876545', '', 0, 'images/profile_pic/profile.png', '2023-10-07 13:35:44', 1, 1, '', '4rd Cross', '$2b$12$6L.wm7bF48Vb3yrH14GoKurZbq8aJvJSd6JaLrOFLPI8qxFoX5hLK', '', 'nkbhandari95@gmail.com', '0000-00-00 00:00:00'),
(48, 'admin@shagun.com', 'test creator updator', 'testuuuuuu@test.com', '9890345217', '', 0, 'images/profile_pic/profile.png', '2023-10-07 13:41:18', 1, 1, '', '4rd Cross', '$2b$12$GyX6AZELf3O.3NTiNRzvVuc.wivdpyT.zMGTfbPdL34nC9OClYNRq', 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', '2023-10-08 16:08:33');

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
  `city` int(11) NOT NULL,
  `selected_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_callback_request`
--

INSERT INTO `user_callback_request` (`id`, `uid`, `type`, `status`, `completed_by`, `created_on`, `event_date`, `event_type`, `city`, `selected_reason`) VALUES
(9, 'wjkkjhgfdserty', 'KYC', 0, 'admin@gmail.com', '2023-07-30 16:15:37', '2023-09-15', NULL, 11, 'simply'),
(10, 'wjkkjhgkjhgfdserty', 'event', 1, 'admin@gmail.com', '2023-07-30 16:15:37', '2023-09-15', 'Marriage', 11, 'simply'),
(11, 'wjkkjhgkjhgfdserty', 'event', 1, 'admin@gmail.com', '2023-07-30 16:15:37', '2023-09-15', 'Marriage', 11, 'simply'),
(12, 'wjkkjhgfdserty', 'KYC', 1, 'admin@gmail.com', '2023-07-30 16:15:37', '2023-10-22', 'Birthday', 11, 'simply');

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
(40, 'wjkkjhgfdserty', 'Sangeetha Kumari Thapa', '2023-09-14', 'Female', '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', '#A-148 3rd Cross 1st stage Peenya Industrial Estate Bangalore-58', 'Bangalore', 'Karnataka', '560058', 'India', 'Driving License', 'PAN CARD', '12345678987654', 'BARPT3925R', 'images/documents/12345678987654_1694684302_IMG-20221010-WA0000.jpg', 'images/documents/BARPT3925R_1694684302_IMG-20221010-WA0000.jpg', 1, '2023-09-14 09:37:41', 'admintest@gmail.com', 'admin@shagun.com', '2023-09-29 17:24:35', 'nkbhandari95@gmail.com', '2023-10-08 15:54:44'),
(45, 'poiuytrtyuiopoiuy', 'ROOP RAJ THAPA', '1994-12-19', 'Male', '4rd Cross', '4rd Cross', 'Bangalore', 'Karnataka', '560058', 'India', 'Aadhar Card', 'PAN Card', '121214141513', 'BARPT3925RRRRR', 'images/documents/121214141513_1696582052_aadhar.jpg', 'images/documents/BARPT3925RRRRR_1696582052_pan.jpg', 1, '2023-10-06 08:47:32', 'admin@shagun.com', 'admin@shagun.com', '2023-10-06 14:17:32', 'nkbhandari95@gmail.com', '2023-10-08 15:51:29');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_vendors`
--
ALTER TABLE `delivery_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `events_type`
--
ALTER TABLE `events_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `event_guest_invite`
--
ALTER TABLE `event_guest_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `greeting_cards`
--
ALTER TABLE `greeting_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_callback_request`
--
ALTER TABLE `user_callback_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_kyc`
--
ALTER TABLE `user_kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
