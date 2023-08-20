-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2023 at 06:35 PM
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
(16, 'wjkkjhgfdserty', 'ICICI', '', 'ICICI090908', 'Roop Raj Thapa', '1234567890', 1, '2023-08-04 15:50:42', 'nkbhandari95@gmail.com', '2023-08-04 21:14:37', 'nkbhandari95@gmail.com');

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
(1, 'Raj', 0, 'Address Line 1', '123.456, 78.910', 1, 'fwg567', 'Vikas', '9865432345', 'admin', '2023-08-09 11:10:12'),
(2, 'Roop', 0, 'Address Line 2', '123.456, 78.910', 0, 'fwg567', 'Ashish', '9865982345', 'admin', '2023-08-09 11:16:17'),
(3, 'Professional Courier', 11, '4rd Cross', '', 1, 'GSTIN09897564456', 'Hong Kong', '9090909090', 'admin@gmail.com', '2023-08-15 14:57:53');

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
('cwkw9902rse7gl0d8mprxtsg8iw8p0e6', '.eJw1zE0OgjAQQOGrmFlTCiQuYOVNyEjHMtpOm_6kica7CwvX78v7AOfVBWvJrCywlFSpg8oGFpDXfUcxmHi-3qxHdv0WPHQg6OnsnDw6vPzVUWIKD3a0Rt4OsJcS86J1a60vO7EYRmmc6PzoFtUWpJAUXaMLaLKehnHW46AtCTlGZXKob1RT_4wWvj9_AzyC:1qNTZG:hJ2Us6bs2qdmg_HQVjtXvC2aInF68mxj9dbVK2khXJA', '2023-08-06 07:31:50.926448'),
('ezqjc2ykzgka5wj003r75xbs2amcow3z', 'eyJpc19sb2dnZWRfaW4iOnRydWV9:1qM3RA:c96TFYHd0QOBUpPJk2wUA1gESewXVRcpCWzcwiNxzdk', '2023-08-02 09:25:36.616398'),
('seyc4s5nf9tugfbk8oiqxywvo4o19m73', '.eJw1izEOwjAMAP_iuUoYoKBM_CQKiWssxXbUpDAg_t4yMN6d7gPcYzUiLJEVwlg3nGDjAgFSEdY7SeLqsglMoEnwHw5sqy1cMTbOh32O0YL3uagzraz4xsdiOvpv9v1FnoXi5XS-zjfXlOC7A7MwKyw:1qVsHt:mtsA-8XWsMy28_TZnTzFgepWgV8Yt2DSNNT7LKN10Kc', '2023-08-29 11:32:37.116666');

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
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `status`) VALUES
(34, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-08-03 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 14, '0000-00-00 00:00:00', 1),
(35, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2022-08-05 13:40:00', 'dfghjk', '[{\"name\": \"Raj\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 1, 0, 14, '0000-00-00 00:00:00', 1),
(36, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"Nirmala\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 15, '0000-00-00 00:00:00', 1),
(37, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1),
(38, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(39, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1),
(40, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(41, 'nkbhandari95@gmail.com', 12, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(42, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(43, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(44, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"},{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"44_9898989892\"}, {\"name\": \"Roop\", \"role\": \"test\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"44_9865231906\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(45, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 15, '0000-00-00 00:00:00', 1),
(46, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(47, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(48, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1),
(49, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(50, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(51, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1),
(52, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(53, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(54, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(55, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(56, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(57, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(58, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 0),
(59, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(60, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(61, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(62, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(63, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(64, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(65, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(66, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 1, 0, 15, '0000-00-00 00:00:00', 1),
(67, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(68, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(69, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(70, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(71, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(72, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(73, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(74, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(75, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(76, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 15, '0000-00-00 00:00:00', 1),
(77, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(78, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(79, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 0),
(80, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(81, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(82, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(83, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(84, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(85, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(86, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(87, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(88, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(89, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 2, 0, 15, '0000-00-00 00:00:00', 1),
(90, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(91, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(92, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(93, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(94, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(95, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(96, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(97, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(98, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(99, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(100, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(101, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(102, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(103, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(104, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(105, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(106, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(107, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(108, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(109, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(110, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(111, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(112, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(113, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(114, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(115, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(116, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(117, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(118, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(119, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(120, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(121, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(122, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(123, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(124, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(125, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(126, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(127, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(128, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(129, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(130, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(131, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(132, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(133, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(134, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(135, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(136, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(137, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1);
INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `status`) VALUES
(138, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(139, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(140, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(141, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(142, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(143, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(144, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(145, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(146, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(147, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(148, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(149, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(150, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(151, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(152, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(153, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(154, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(155, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(156, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(157, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(158, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(159, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(160, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(161, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(162, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(163, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(164, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(165, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(166, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(167, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(168, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(169, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(170, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(171, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(172, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(173, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(174, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(175, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(176, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(177, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(178, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(179, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(180, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(181, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(182, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(183, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(184, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(185, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(186, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(187, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(188, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(189, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(190, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(191, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(192, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(193, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(194, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(195, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(196, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(197, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(198, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(199, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(200, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(201, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(202, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(203, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(204, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(205, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(206, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(207, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(208, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(209, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(210, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1),
(211, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 0),
(212, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.959723269238731, Longitude: 79.06150376093748', '2023-08-08 20:36:59', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-08 20:37:00\", \"end_time\": \"2023-08-08 20:37:00\"}]', '2023-08-08 20:37:00', 'event takes place at Latitude: 12.959723269238731, Longitude: 79.06150376093748', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(213, 'admin@gmail.com', 12, 11, 'munnar, Kerala', 'Kerala, India', 'Latitude: 9.964520230664933, Longitude: 76.30696132343746', '2023-08-08 21:13:12', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-12-22 21:29:00\", \"end_time\": \"2023-12-22 21:29:00\"}]', '2023-12-22 21:28:00', 'My Birthday at muunar, find the lat lng Latitude: 10.0889333, Longitude: 77.05952479999999. Sorry sorry sorry!!! moved to Kochi Latitude: 9.964520230664933, Longitude: 76.30696132343746', '[{\"name\": \"john Doe\", \"role\": \"Birthday Boy\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(214, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.9141417, Longitude: 74.8559568', '2023-08-09 14:03:27', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-12-23 12:00:00\", \"end_time\": \"2023-12-23 14:30:00\"}]', '2023-12-22 11:00:00', 'Marriage', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"214_9898989892\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(215, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.305163, Longitude: 76.65517489999999', '2023-08-09 14:03:27', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-10-12 10:15:00\", \"end_time\": \"2023-10-12 10:55:00\"}]', '2023-10-12 07:30:00', '', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"215_9898989892\"}, {\"name\": \"john Doe\", \"role\": \"Bride\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"215_9865231906\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(216, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.305163, Longitude: 76.65517489999999', '2023-08-09 14:41:50', '[{\"sub_event_name\": \"muhartam\", \"start_time\": \"2023-10-12 11:00:00\", \"end_time\": \"2023-10-12 12:00:00\"}]', '2023-10-12 10:00:00', 'Maharaja Wedding at Mysuru Palace', '[{\"name\": \"David Willey\", \"role\": \"Groom\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"/media/images/qr_codes/qr_code.png\"}, {\"name\": \"john Doe\", \"role\": \"Bride\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"/media/images/qr_codes/qr_code.png\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(217, 'admin@gmail.com', 11, 11, '4rd Cross', '#A148', 'Latitude: 12.305163, Longitude: 76.65517489999999', '2023-08-09 15:09:25', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-10-01 11:00:00\", \"end_time\": \"2023-10-01 11:30:00\"}]', '2023-10-01 10:30:00', '25th Birthday', '[{\"name\": \"john Doe\", \"role\": \"Birthday Boy\", \"uid\": \"wertyuijhgfmn\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"images/qr_codes/217_9865231906.png\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1);

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
(12, 'Birthday', 1, 'nkbhandari95@gmail.com');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_guest_invite`
--

INSERT INTO `event_guest_invite` (`id`, `invited_by`, `invited_to`, `event_id`, `status`, `created_at`) VALUES
(3, 'v0FxDg19CZOg0iBjQprxTrBwjk13', '8660225160', 34, 0, '2023-07-31 18:05:29');

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
(9, 'Wedding1', 'images/greeting_card/1690794699_wed2.jpg', 250, 14, '2023-07-31 09:11:39', 1);

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
(11, 'Mysore', 1, 'nkbhandari95@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `city` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `lat_lng` varchar(255) NOT NULL,
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

INSERT INTO `printer` (`id`, `store_name`, `city`, `address`, `lat_lng`, `status`, `gst_no`, `store_owner`, `contact_number`, `printer_user_name`, `printer_password`) VALUES
(14, 'Big Printers', 11, '4rd Cross', '23.987654-89.9809876', 1, 'GSTIN09897564456', 'Vijay Kumar', '9864332469', 'viji@gmail.com', '1234'),
(15, 'Nirmala Printing Press', 11, '4rd Cross', '23.987654-89.9809876', 0, 'GSTIN09897564456', 'Nirmala Kumari Bhandari', '9090909090', 'nkbhandariprinters@gmail.com', '1234');

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
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `print_jobs`
--

INSERT INTO `print_jobs` (`id`, `transaction_id`, `printer_id`, `card_id`, `status`, `created_on`, `last_modified`, `billing_amount`, `event_id`) VALUES
(2, '17', '14', '9', 5, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 34),
(3, '17', '15', '9', 4, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 34),
(4, '17', '15', '9', 3, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 34),
(5, '17', '15', '9', 2, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 34),
(6, '17', '15', '9', 1, '2023-08-04 13:13:01', '2023-08-04 15:12:12', 2000, 36);

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
  `payment_status` tinyint(1) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `is_settled` tinyint(1) DEFAULT 0,
  `reciever_bank_id` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`id`, `sender_uid`, `receiver_uid`, `transaction_amount`, `shagun_amount`, `greeting_card_id`, `transaction_fee`, `delivery_fee`, `transaction_id`, `payment_status`, `event_id`, `status`, `is_settled`, `reciever_bank_id`, `created_on`) VALUES
(1, 'user123', 'user456', 100.5, 50, 0, 2.5, 5, 'txn987', 0, 45, 0, 0, '', '2023-08-05 07:04:56'),
(2, 'user789', 'user654', 75.25, 30, 0, 1.75, 3.5, 'txn654', 0, 78, 0, 0, '', '2023-08-05 08:52:30'),
(3, 'user555', 'user777', 200, 100, 0, 5, 7, 'txn333', 0, 105, 0, 0, '', '2023-08-05 11:15:15'),
(4, 'user222', 'user888', 50.75, 10, 0, 2, 4, 'txn444', 0, 129, 0, 0, '', '2023-08-05 12:40:40'),
(5, 'user999', 'user111', 300, 150, 0, 8.5, 9.5, 'txn555', 0, 189, 0, 0, '', '2023-08-05 14:35:00'),
(20, 'user123', 'user456', 1500.75, 750.5, 1234, 25.5, 30, 'txn987', 0, 45, 0, 0, '', '2023-08-05 07:04:56'),
(21, 'user789', 'user654', 3000.25, 1200.75, 5678, 17.5, 20, 'txn654', 0, 78, 0, 0, '', '2023-08-05 08:52:30'),
(22, 'user555', 'user777', 4500, 2200, 9012, 55, 60, 'txn333', 0, 105, 0, 0, '', '2023-08-05 11:15:15'),
(23, 'user222', 'user888', 1800.5, 350, 3456, 12, 15, 'txn444', 0, 129, 0, 0, '', '2023-08-05 12:40:40'),
(24, 'user999', 'user111', 6000, 3000, 7890, 85.5, 90, 'txn555', 0, 189, 0, 0, '', '2023-08-05 14:35:00'),
(25, 'user111', 'user222', 2500.25, 1200.5, 2345, 23.75, 25, 'txn777', 0, 176, 0, 0, '', '2023-08-05 16:45:10'),
(26, 'user666', 'user999', 4100.5, 2000.25, 6789, 40.5, 50, 'txn888', 0, 88, 0, 0, '', '2023-08-05 18:15:20'),
(27, 'user444', 'user777', 5600.75, 2800.5, 8901, 34.25, 40, 'txn999', 0, 167, 0, 0, '', '2023-08-05 19:35:30'),
(28, 'user555', 'user888', 7300.25, 3600.75, 4567, 52.75, 55, 'txn222', 0, 199, 0, 0, '', '2023-08-05 21:50:45'),
(29, 'user777', 'user999', 3200, 1500, 7890, 20, 22.5, 'txn333', 0, 201, 0, 0, '', '2023-08-05 23:40:55'),
(30, 'user123', 'wjkkjhgfdserty', 1500.75, 750.5, 1234, 25.5, 30, 'txn987', 0, 34, 0, 1, '', '2023-08-05 07:04:56'),
(31, 'user789', 'wjkkjhgfdserty', 3000.25, 1200.75, 5678, 17.5, 20, 'txn654', 0, 34, 0, 1, '', '2023-08-05 08:52:30'),
(32, 'user555', 'wertyuijhgfmn', 4500, 2200, 9012, 55, 60, 'txn333', 0, 34, 0, 0, '', '2023-08-05 11:15:15'),
(33, 'user222', 'wertyuijhgfmn', 1800.5, 350, 3456, 12, 15, 'txn444', 0, 34, 0, 0, '', '2023-08-05 12:40:40'),
(34, 'user999', 'wjkkjhgfdserty', 6000, 3000, 7890, 85.5, 90, 'txn555', 0, 34, 0, 0, '', '2023-08-05 14:35:00'),
(35, 'user111', 'wertyuijhgfmn', 2500.25, 1200.5, 2345, 23.75, 25, 'txn777', 0, 34, 0, 0, '', '2023-08-05 16:45:10'),
(36, 'user666', 'wertyuijhgfmn', 4100.5, 2000.25, 6789, 40.5, 50, 'txn888', 0, 34, 0, 0, '', '2023-08-05 18:15:20'),
(37, 'user444', 'wjkkjhgfdserty', 5600.75, 2800.5, 8901, 34.25, 40, 'txn999', 0, 34, 0, 0, '', '2023-08-05 19:35:30'),
(38, 'user555', 'wertyuijhgfmn', 7300.25, 3600.75, 4567, 52.75, 55, 'txn222', 0, 34, 0, 0, '', '2023-08-05 21:50:45'),
(39, 'user777', 'wertyuijhgfmn', 3200, 1500, 7890, 20, 22.5, 'txn333', 0, 34, 0, 0, '', '2023-08-05 23:40:55'),
(40, 'user333', 'wjkkjhgfdserty', 2200.5, 1100.25, 7890, 15.5, 20, 'txn444', 0, 34, 0, 0, '', '2023-08-06 02:00:10'),
(41, 'user888', 'wjkkjhgfdserty', 4000.25, 1800.5, 3456, 32.75, 35, 'txn555', 0, 34, 0, 0, '', '2023-08-06 04:15:20'),
(42, 'user444', 'wjkkjhgfdserty', 5800.75, 2700.5, 6789, 28.25, 30, 'txn666', 0, 34, 0, 0, '', '2023-08-06 05:40:30'),
(43, 'user999', 'wjkkjhgfdserty', 7100.25, 3400.75, 8901, 45.5, 50, 'txn777', 0, 34, 0, 0, '', '2023-08-06 07:25:40'),
(44, 'user555', 'wjkkjhgfdserty', 3200, 1600, 4567, 10, 12.5, 'txn888', 0, 34, 0, 0, '', '2023-08-06 09:00:55'),
(45, 'user777', 'wjkkjhgfdserty', 4500.5, 2100.25, 7890, 22.75, 25, 'txn999', 0, 34, 0, 0, '', '2023-08-06 10:50:05'),
(46, 'user333', 'wjkkjhgfdserty', 5800.25, 2700.5, 3456, 25.75, 30, 'txn111', 0, 34, 0, 0, '', '2023-08-06 12:35:10'),
(47, 'user888', 'wjkkjhgfdserty', 7800.75, 3600.5, 6789, 52.25, 55, 'txn222', 0, 34, 0, 0, '', '2023-08-06 15:10:20'),
(48, 'user444', 'wjkkjhgfdserty', 9100.25, 4400.75, 8901, 40.5, 45, 'txn333', 0, 34, 0, 0, '', '2023-08-06 16:45:30'),
(49, 'user999', 'wjkkjhgfdserty', 5200, 2500, 4567, 18, 20.5, 'txn444', 0, 34, 0, 0, '', '2023-08-06 18:35:40'),
(50, 'user333', 'wjkkjhgfdserty', 6400.5, 3200.25, 7890, 35.5, 40, 'txn555', 0, 34, 0, 1, '', '2023-08-06 21:00:50'),
(51, 'user777', 'wjkkjhgfdserty', 3200, 1500, 7890, 20, 22.5, 'testing1234', 0, 34, 0, 1, '', '2023-08-05 23:40:55');

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
(29, 'admin@gmail.com', 'admin', 'admin@gmail.com', '9898989898', '', 0, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-07-30 14:54:58', 1, 2, 'wertyuiop0987654ertkkjhgf', '', 'admin'),
(32, 'wjkkjhgfdserty', 'David Willey', 'david@gmail.com', '9898989892', '', 1, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-07-30 14:54:58', 0, 3, 'wertyuiop0987654ertkkjhgf', '', 'admin'),
(33, 'wertyuijhgfmn', 'john Doe', 'john@gmail.com', '9865231906', '', 1, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-07-30 14:54:58', 0, 3, 'wertyuiop0987654ertkkjhgf', '', 'admin');

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
(9, 'wjkkjhgfdserty', 'KYC', 1, 'nkbhandari95@gmail.com', '2023-07-30 16:15:37', NULL, NULL, 0),
(10, 'wjkkjhgfdserty', 'event', 2, 'nkbhandari95@gmail.com', '2023-07-30 16:15:37', '0000-00-00', 'Marriage', 1);

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
(40, 'wjkkjhgfdserty', 'Roop Raj Thapa', '22/12/1996', 'Male', '4rd Cross', 'Peenya 1st stage', 'Bangalore', 'Karnataka', '560058', 'India', 'Aadhar Card', 'PAN CARD', '121212121212', 'BARPT3925R', 'images/documents/121212121212_1690802065_F16_FY2022-23_13452695 (1).pdf', 'images/documents/BARPT3925RRRR_1690802065_SSCD (1) (1).pdf', 1, '2023-07-31 11:06:57', 'nkbhandari95@gmail.com', 'nkbhandari95@gmail.com', '2023-07-31 21:54:37', '', '0000-00-00 00:00:00');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `events_type`
--
ALTER TABLE `events_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `event_guest_invite`
--
ALTER TABLE `event_guest_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `greeting_cards`
--
ALTER TABLE `greeting_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `print_jobs`
--
ALTER TABLE `print_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settlements`
--
ALTER TABLE `settlements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user_callback_request`
--
ALTER TABLE `user_callback_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_kyc`
--
ALTER TABLE `user_kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
