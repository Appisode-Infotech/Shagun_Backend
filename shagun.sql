-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2023 at 06:59 AM
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
('ezqjc2ykzgka5wj003r75xbs2amcow3z', 'eyJpc19sb2dnZWRfaW4iOnRydWV9:1qM3RA:c96TFYHd0QOBUpPJk2wUA1gESewXVRcpCWzcwiNxzdk', '2023-08-02 09:25:36.616398');

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
(34, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:38:49', '[{\"sub_event_name\": \"cake cutting\", \"start_time\": \"2023-07-31 13:34:00\", \"end_time\": \"2023-07-31 13:34:00\"}]', '2023-07-31 13:33:00', 'wertyuiklkjhgfds', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(35, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:43:17', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-05 13:40:00\", \"end_time\": \"2023-08-05 13:40:00\"}]', '2023-08-05 13:40:00', 'dfghjk', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"user_data[0]\", \"qr_code\": \"qr code\"}]', 0, 0, 14, '0000-00-00 00:00:00', 1),
(36, 'nkbhandari95@gmail.com', 11, 11, '4rd Cross', '#A148', '13.09876543-77.0987653', '2023-07-31 13:44:02', '[{\"sub_event_name\": \"ring exchange\", \"start_time\": \"2023-08-01 13:45:00\", \"end_time\": \"2023-08-01 13:45:00\"}]', '2023-07-31 13:44:00', 'Final Test', '[{\"name\": \"admin\", \"role\": \"test\", \"uid\": \"wjkkjhgfdserty\", \"profile\": \"http://cdn.onlinewebfonts.com/svg/img_504768.png\", \"qr_code\": \"qr code\"}]', 0, 0, 15, '0000-00-00 00:00:00', 1);

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
(11, 'Marriage', 1, 'nkbhandari95@gmail.com');

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
(15, 'Nirmala Printing Press', 11, '4rd Cross', '23.987654-89.9809876', 1, 'GSTIN09897564456', 'Nirmala Kumari Bhandari', '9090909090', 'nkbhandariprinters@gmail.com', '1234');

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
  `billing_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`id`, `sender_uid`, `receiver_uid`, `transaction_amount`, `shagun_amount`, `greeting_card_id`, `transaction_fee`, `delivery_fee`, `transaction_id`, `payment_status`, `event_id`, `status`, `created_on`) VALUES
(17, 'wjkkjhgfdserty', 'wjkkjhgfdserty', 5000, 4800, 0, 200, 0, '', 0, 34, 0, '2023-07-31 17:58:35'),
(18, 'wjkkjhgfdserty', 'wjkkjhgfdserty', 5000, 4800, 0, 200, 0, '', 0, 34, 0, '2023-07-31 17:58:35'),
(19, 'wjkkjhgfdserty', 'wjkkjhgfdserty', 5000, 4800, 0, 200, 0, '', 0, 34, 0, '2023-07-31 17:58:35');

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
(32, 'wjkkjhgfdserty', 'admin', 'admin@gmail.com', '9898989892', '', 1, 'http://cdn.onlinewebfonts.com/svg/img_504768.png', '2023-07-30 14:54:58', 1, 3, 'wertyuiop0987654ertkkjhgf', '', 'admin');

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
(10, 'wjkkjhgfdserty', 'event', 2, 'nkbhandari95@gmail.com', '2023-07-30 16:15:37', NULL, 'Marriage', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bank_list`
--
ALTER TABLE `bank_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `events_type`
--
ALTER TABLE `events_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settlements`
--
ALTER TABLE `settlements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
