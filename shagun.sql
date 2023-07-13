-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2023 at 11:23 AM
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
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `ifsc_code` varchar(255) NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created on` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`id`, `uid`, `bank_name`, `ifsc_code`, `account_holder_name`, `account_number`, `status`, `created on`, `added_by`, `modified_on`) VALUES
(1, 'ghoiwgjhfhg9879', 'ICICI Bank', 'ICICI00009845', 'Shalini Doe', '1234567890', 1, '2023-07-04 06:01:18', 0, '2023-07-04 11:35:15'),
(2, 'ghoiwgjdfgg9879', 'CANARA Bank', 'CAN00009845', 'Sangeetha Thapa', '1234567890', 1, '2023-07-04 10:19:30', 0, '2023-07-04 15:49:30'),
(3, 'ghoiwgjdfgg9879', 'INDUS Bank', 'CAN00009845', 'Sangeetha Thapa', '1234567890', 1, '2023-07-06 10:31:21', 0, '2023-07-06 16:01:21');

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
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `sub_events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`sub_events`)),
  `event_date` datetime NOT NULL,
  `event_note` varchar(255) NOT NULL,
  `event_admin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`event_admin`)),
  `is_approved` tinyint(1) DEFAULT NULL,
  `approved_by` int(11) NOT NULL,
  `printer_id` int(11) NOT NULL,
  `approved_date_time` datetime NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `created_by_uid`, `event_type_id`, `city_id`, `address_line1`, `address_line2`, `event_lat_lng`, `created_on`, `sub_events`, `event_date`, `event_note`, `event_admin`, `is_approved`, `approved_by`, `printer_id`, `approved_date_time`, `active`) VALUES
(2, 'admin1', 1, 1, 'Peenya 1st stage', 'Bangalore North', '23.876543-11.987656', '2023-07-04 10:00:20', '[{\"sub_event_name\": \"asdf\", \"start\": \"22/12/2023 12:00\", \"end\": \"24/12/12023 5:00\"}, {\"sub_event_name\": \"asdf\", \"start\": \"22/12/2023 12:00\", \"end\": \"24/12/12023 5:00\"}]', '2023-07-20 15:56:20', 'wert ertyu yubv', '[{\"name\": \"wertyvb\", \"role\": \"Bride\", \"profile\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU\", \"qr_code\": \"sdfghjkoiuyt\"}, {\"name\": \"lkjhg\", \"role\": \"Groom\", \"profile\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU\", \"qr_code\": \"jhgfdiu\"}]', 0, 0, 0, '0000-00-00 00:00:00', 1),
(3, 'admin1', 2, 1, 'Peenya 1st stage', 'Bangalore North', '23.876543-11.987656', '2023-07-04 10:44:41', '[{\"sub_event_name\": \"asdf\", \"start\": \"22/12/2023 12:00\", \"end\": \"24/12/12023 5:00\"}, {\"sub_event_name\": \"asdf\", \"start\": \"22/12/2023 12:00\", \"end\": \"24/12/12023 5:00\"}]', '2023-07-14 17:08:10', 'wert ertyu yubv', '[{\"name\": \"wertyvb\", \"role\": \"Bride\", \"profile\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU\", \"qr_code\": \"sdfghjkoiuyt\"}, {\"name\": \"lkjhg\", \"role\": \"Groom\", \"profile\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU\", \"qr_code\": \"jhgfdiu\"}]', 0, 0, 0, '0000-00-00 00:00:00', 1),
(4, 'admin1', 3, 1, 'Peenya 1st stage', 'Bangalore North', '23.876543-11.987656', '2023-07-04 10:44:48', '[{\"sub_event_name\": \"asdf\", \"start\": \"22/12/2023 12:00\", \"end\": \"24/12/12023 5:00\"}, {\"sub_event_name\": \"asdf\", \"start\": \"22/12/2023 12:00\", \"end\": \"24/12/12023 5:00\"}]', '2023-07-15 00:00:00', 'wert ertyu yubv', '[{\"name\": \"wertyvb\", \"role\": \"Bride\", \"profile\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU\", \"qr_code\": \"sdfghjkoiuyt\"}, {\"name\": \"lkjhg\", \"role\": \"Groom\", \"profile\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU\", \"qr_code\": \"jhgfdiu\"}]', 0, 0, 0, '0000-00-00 00:00:00', 1),
(5, 'admin1', 2, 1, 'Peenya 1st stage', 'Bangalore North', '23.876543-11.987656', '2023-07-06 10:49:54', '[{\"sub_event_name\": \"asdf\", \"start\": \"22/12/2023 12:00\", \"end\": \"24/12/12023 5:00\"}, {\"sub_event_name\": \"asdf\", \"start\": \"22/12/2023 12:00\", \"end\": \"24/12/12023 5:00\"}]', '0000-00-00 00:00:00', 'wert ertyu yubv', '[{\"name\": \"wertyvb\", \"role\": \"Bride\", \"profile\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU\", \"qr_code\": \"sdfghjkoiuyt\"}, {\"name\": \"lkjhg\", \"role\": \"Groom\", \"profile\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU\", \"qr_code\": \"jhgfdiu\"}]', 0, 0, 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `events_type`
--

CREATE TABLE `events_type` (
  `id` int(11) NOT NULL,
  `event_type_name` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events_type`
--

INSERT INTO `events_type` (`id`, `event_type_name`, `status`) VALUES
(1, 'Wedding', 1),
(2, 'Engagement', 1),
(3, 'Birthday', 1),
(4, 'House_warming', 1),
(5, 'Reception', 1),
(6, 'Company Anniversary', 1);

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
(1, 'ghoiwgjhfhg9879', '8889064576', 2, 1, '2023-07-07 07:14:24'),
(2, 'ertyuikjhgvbn', '8889064576', 3, 0, '2023-07-07 07:14:24');

-- --------------------------------------------------------

--
-- Table structure for table `greeting_cards`
--

CREATE TABLE `greeting_cards` (
  `id` int(11) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `card_image_url` varchar(255) NOT NULL,
  `card_price` double NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `greeting_cards`
--

INSERT INTO `greeting_cards` (`id`, `card_name`, `card_image_url`, `card_price`, `created_on`, `status`) VALUES
(1, 'Marriage1', 'https:wertyuioiugfdfghioiuytr', 100, '2023-07-06 10:08:41', 1),
(2, 'Marriage2', 'https://ertyuiokjhgfdvbnm,mjhgf', 450, '2023-07-06 10:10:26', 1),
(3, 'Birthday', 'http:///birthjkdhjkchgjk', 150, '2023-07-12 12:16:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `city_name`, `status`) VALUES
(1, 'Bangalore', 1),
(2, 'Mysore', 1),
(3, 'Mandya', 1),
(4, 'Tumkur', 1),
(5, 'Davanagere', 1),
(6, 'chitradurga', 1),
(7, 'Kolar', 1);

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
(1, 'Sri Siddhivinayaka printers', 1, 'Peenya', '12.971599:77.594566', 1, 'GSTIN9867', 'Gundu rao', '9864321908', 'Shankar', 'shan876'),
(2, 'Big Prints', 1, 'Mandya', '12.971599:77.594564', 1, 'GSTINNO87', 'Sri Nidhi', '7658904537', 'Prithvi raj', 'raj987'),
(3, 'New printers', 3, 'Mysore', '12.98765.77.9875', 0, 'gstin9897', 'Aravind', '9786546788', 'uhbh1', 'nhfy@123'),
(4, 'SLV printers', 1, '#A-148 3rd cross peenya 1st stage bangalore 560058', '12.987-65.77.9875', 1, 'gstin9897', 'Toyata', '9090909090', 'uhdfbh1', 'nhffdgy@123');

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

--
-- Dumping data for table `print_jobs`
--

INSERT INTO `print_jobs` (`id`, `transaction_id`, `printer_id`, `card_id`, `status`, `created_on`, `last_modified`, `billing_amount`) VALUES
(1, '10', '1', '2', 1, '2023-07-13 07:15:11', '2023-07-13 09:14:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settlements`
--

CREATE TABLE `settlements` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `receiver_bank_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settlements`
--

INSERT INTO `settlements` (`id`, `transaction_id`, `receiver_bank_id`, `created_on`) VALUES
(1, 10, 1, '2023-07-12 10:45:58');

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
  `delivery_fee` double NOT NULL DEFAULT current_timestamp(),
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
(8, 'ghoiwgjhfhg9879', 'ghoiwgjdfgg9879', 5000.5, 4500.5, 1, 50, 100, 'example_transaction_id', 0, 2, 1, '2023-07-07 05:59:20'),
(9, 'ertyuikjhgvbn', 'ghoiwgjdfgg9879', 5000.5, 4500.5, 1, 50, 100, 'example_transaction_id', 0, 2, 1, '2023-07-07 06:00:57'),
(10, 'ghoiwgjdfgg9879', 'ertyuikjhgvbn', 5000.5, 4500.5, 2, 50, 100, 'example_transaction_id', 0, 2, 1, '2023-07-07 06:00:57'),
(11, 'ertyuikjhgvbn', 'ghoiwgjdfgg9879', 5000.5, 4500.5, 2, 50, 100, 'example_transaction_id', 0, 2, 1, '2023-07-07 06:00:57'),
(12, 'ertyuikjhgvbn', 'ghoiwgjdfgg9879', 5000.5, 4500.5, 2, 50, 100, 'example_transaction_id', 0, 2, 1, '2023-07-07 06:00:57'),
(13, 'ertyuikjhgvbn', 'ghoiwgjdfgg9879', 5000.5, 4500.5, 2, 50, 100, 'example_transaction_id', 0, 2, 1, '2023-07-07 06:00:57'),
(14, 'ghoiwgjdfgg9879', 'ghoiwgjdfgg9879', 5000.5, 4500.5, 2, 50, 100, 'example_transaction_id', 0, 2, 1, '2023-07-07 05:59:20'),
(15, 'ghoiwgjhfhg9879', 'ghoiwgjdfgg9879', 5000.5, 4500.5, 2, 50, 100, 'example_transaction_id', 0, 2, 1, '2023-07-07 05:59:20');

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
  `kyc` tinyint(1) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uid`, `name`, `email`, `phone`, `auth_type`, `kyc`, `profile_pic`, `created_on`, `status`, `role`) VALUES
(1, 'ghoiwgjhfhg9879', 'Shalini', 'shalini@gmail.com', '7649085143', 'facebook', 0, 'shalini pofile pic url', '2023-07-04 06:01:08', 1, 3),
(2, 'ghoiwgjdfgg9879', 'Sangeetha Thapa', 'sangeethathapa82@gmail.com', '8889064576', 'Phone', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1-nmOh7iFjw8kBndATzsEl0iK8Lk51JxaseYBnWsxNElFroJQhY-lq9oZhzN0LbYoT8&usqp=CAU', '2023-07-04 10:15:00', 0, 3),
(7, 'ertyuikjhgvbn', 'Nirmala', 'nkbhandari95@gmail.com', '9900990090', 'Phone', 0, 'Nirmala pofile pic url', '2023-07-07 06:00:35', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_kyc`
--

CREATE TABLE `user_kyc` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `permanent_address` varchar(255) NOT NULL,
  `identification_proof1` varchar(255) NOT NULL,
  `identification_proof2` varchar(255) NOT NULL,
  `identification_number1` varchar(255) NOT NULL,
  `identification_number2` varchar(255) NOT NULL,
  `identification_doc1` varchar(255) NOT NULL,
  `identification_doc2` varchar(255) NOT NULL,
  `verification_status` tinyint(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime NOT NULL,
  `approved_by` varchar(255) NOT NULL,
  `approved_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_kyc`
--

INSERT INTO `user_kyc` (`id`, `uid`, `full_name`, `dob`, `permanent_address`, `identification_proof1`, `identification_proof2`, `identification_number1`, `identification_number2`, `identification_doc1`, `identification_doc2`, `verification_status`, `created_on`, `updated_on`, `approved_by`, `approved_on`) VALUES
(1, 'ghoiwgjhfhg9879', 'RzJpXNEyhd', '0000-00-00', 'TnZwLubnvWTcvXxhlBzO', 'Aadhar', 'PAN', '4802599218', '7463805093', 'https://tse4.mm.bing.net/th?id=OIP.6g-ppiTDcH5VW4ekEilZlQHaED&pid=Api&P=0&h=180', 'https://tse1.mm.bing.net/th?id=OIP.9OIuT6R4m3VERDmK_ANrCwHaDt&pid=Api&P=0&h=180', 1, '2023-07-04 06:03:07', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(7, 'ghoiwgjdfgg9879', 'Sangakka', '0000-00-00', 'TnZwLubnvWTcvXxhlBzO', 'Aadhar', 'PAN', '4802599218', '7463805093', 'https://tse4.mm.bing.net/th?id=OIP.6g-ppiTDcH5VW4ekEilZlQHaED&pid=Api&P=0&h=180', 'https://tse1.mm.bing.net/th?id=OIP.9OIuT6R4m3VERDmK_ANrCwHaDt&pid=Api&P=0&h=180', 0, '2023-07-06 10:41:02', '2023-07-06 16:13:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `version_details`
--

CREATE TABLE `version_details` (
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

INSERT INTO `version_details` (`app_name`, `min_version`, `latest_version`, `platform`, `created`, `updated`) VALUES
('Shagun', '1.0.0', '1.0.1', 'android', '2023-07-05 05:42:53', '2023-07-05 07:42:22'),
('Shagun', '1.0.0', '1.0.1', 'IoS', '2023-07-05 05:43:11', '2023-07-05 07:42:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `idx_uid` (`uid`);

--
-- Indexes for table `user_kyc`
--
ALTER TABLE `user_kyc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events_type`
--
ALTER TABLE `events_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event_guest_invite`
--
ALTER TABLE `event_guest_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `greeting_cards`
--
ALTER TABLE `greeting_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `print_jobs`
--
ALTER TABLE `print_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settlements`
--
ALTER TABLE `settlements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_kyc`
--
ALTER TABLE `user_kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
