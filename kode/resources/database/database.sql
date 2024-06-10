-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2024 at 03:26 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cartuser`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `uid`, `role_id`, `created_by`, `updated_by`, `name`, `user_name`, `email`, `phone`, `image`, `address`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, NULL, NULL, 'Admin', 'admin', 'admin@admin.com', '123123', '65ae633fc7a411705927487.png', NULL, '$2y$10$/rlWCJpoEyTmGjAFwd0bZu8fCRDecKdrEvPo3wXwrRirTcT0SgOw2', '1', '2023-03-14 14:09:00', '2024-02-12 06:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_password_resets`
--

INSERT INTO `admin_password_resets` (`id`, `uid`, `email`, `token`, `created_at`, `updated_at`) VALUES
(7, 'LI8a-YO02jetU-KDs5', 'admin@admin.com', '5209708', '2024-03-05 08:57:01', '2024-03-05 08:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT 'Active : 1, Inactive : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_id` int DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default.jpg',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int DEFAULT NULL,
  `name` json DEFAULT NULL,
  `logo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT 'Active : 1, Inactive : 2',
  `top` tinyint DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` json DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `discount_type` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Percent  : 1,Flat : 0',
  `discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_home_page` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Yes : 1,No : 0',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_products`
--

CREATE TABLE `campaign_products` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `discount_type` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Percent  : 1,Flat : 0',
  `discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `campaign_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `currency_id` bigint DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute` json DEFAULT NULL,
  `attributes_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int NOT NULL DEFAULT '1',
  `name` json DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'No : 0, Yes : 1',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `top` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'No : 0, Yes : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compare_product_lists`
--

CREATE TABLE `compare_product_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint DEFAULT NULL COMMENT 'Fixed : 1, Percent : 2',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1, Inactive : 2, default : 3',
  `default` tinyint DEFAULT NULL COMMENT 'yes: 1, no: 2	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `uid`, `name`, `symbol`, `rate`, `status`, `default`, `created_at`, `updated_at`) VALUES
(1, 'XDU0r=xopoii-pg9Av56z-4YQ4', 'BDT', '৳', '100.00000000', 1, 2, NULL, '2024-01-23 06:12:23'),
(2, 'XDU-xxuii-pg9Av56z-4YQ4', 'INR', 'Y', '77.71000000', 2, 2, NULL, '2024-01-23 06:12:23'),
(4, 'XDUi-pg9A44434-4v56z-4YQ4', 'USD', '$', '1.00000000', 1, 1, NULL, '2024-01-23 06:12:23'),
(7, '146D-CGPAx0if-OLcP', 'NGN', 'ngn', '1.00000000', 1, 2, '2023-04-06 06:07:31', '2024-01-23 06:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `digital_product_attributes`
--

CREATE TABLE `digital_product_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `short_details` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Available : 1,Sold : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `digital_product_attribute_values`
--

CREATE TABLE `digital_product_attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digital_product_attribute_id` int NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1, Inactive : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `uid`, `name`, `slug`, `subject`, `body`, `sms_body`, `codes`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Password Reset', 'PASSWORD_RESET', 'Password Reset', 'Your password reset code : {{code}}\r\nRequested Time : {{time}}', 'Your Reset Password {{code}} and time {{time}}', '{\"code\":\"Password Reset Code\", \"time\":\"Time\"}', 1, NULL, '2024-02-15 06:08:24'),
(2, NULL, 'Admin Support Reply', 'SUPPORT_TICKET_REPLY', 'Support Ticket Reply', NULL, 'NOT NOW', '{\"ticket_number\":\"Support Ticket Number\",\"link\":\"Ticket URL For relpy\"}', 1, NULL, '2022-12-04 13:33:45'),
(3, NULL, 'Withdraw Request ', 'WITHDRAW_REQUEST_AMOUNT', 'Withdraw request amount', NULL, NULL, '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Withdraw Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_currency\":\"Withdraw Method Currency\",\"method_amount\":\"Withdraw Method Amount After Conversion\", \"user_balance\":\"Users Balance After process\"}', 1, NULL, NULL),
(4, NULL, 'Withdraw Cancel', 'WITHDRAW_CANCEL', 'Withdraw cancelled by admin', NULL, 'Admin can cancel any unwanted withdrawal transaction.', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Withdraw Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_currency\":\"Withdraw Method Currency\",\"method_amount\":\"Withdraw Method Amount After Conversion\", \"user_balance\":\"Users Balance After process\"}', 1, NULL, '2022-10-31 05:29:38'),
(5, NULL, 'Withdraw Approved', 'WITHDRAW_APPROVED', 'Withdraw Approved', NULL, NULL, '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Withdraw Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_currency\":\"Withdraw Method Currency\",\"method_amount\":\"Withdraw Method Amount After Conversion\", \"user_balance\":\"Users Balance After process\"}', 1, NULL, NULL),
(6, NULL, 'Order Confirmation ', 'ORDER_CONFIRMED', 'Order Confirmed', 'Your Order Number {{order_number}}', NULL, '{\"order_number\":\"Order Number\"}', 1, NULL, '2024-02-15 06:10:03'),
(7, NULL, 'Order Delivered ', 'ORDER_DELIVERED', 'Order Delivery', 'Your Order Number {{order_number}}', NULL, '{\"order_number\":\"Order Number\"}', 1, NULL, '2024-02-15 06:10:22'),
(8, NULL, 'Order Cancel', 'ORDER_CANCEL', 'Order Cancel', 'Your Order Number {{order_number}}', 'NOT NOW', '{\"order_number\":\"Order Number\"}', 1, NULL, '2024-02-15 06:10:32'),
(9, NULL, 'Order Placed', 'ORDER_PLACED', 'Order Placed', 'Your Order Number  {{order_number}}', NULL, '{\"order_number\":\"Order Number\"}', 1, NULL, '2024-02-12 07:10:38'),
(10, NULL, 'Payment Confirmation', 'PAYMENT_CONFIRMED', 'Payment confirm', NULL, NULL, '{\"trx\":\"Transaction Number\",\"amount\":\"Payment Amount\",\"charge\":\"Payment Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Payment Method name\",\"method_currency\":\"Payment Method Currency\"}', 1, NULL, NULL),
(11, NULL, 'Digital Product Order', 'DIGITAL_PRODUCT_ORDER', 'Digital Product Order', NULL, NULL, '{\"order_number\":\"Order Number\"}', 1, NULL, NULL),
(12, NULL, 'Admin Password Reset', 'ADMIN_PASSWORD_RESET', 'Admin Password Reset', 'We have received a request to reset the password for your account on {{code}} and Request time {{time}}', 'NOT NOW', '{\"code\":\"Password Reset Code\", \"time\":\"Time\"}', 1, NULL, '2024-02-15 06:10:59'),
(13, NULL, 'Password Reset Confirm', 'ADMIN_PASSWORD_RESET_CONFIRM', 'Admin Password Reset Confirm', '<p>We have received a request to reset the password for your account on {{code}} and Request time {{time}}</p>', NULL, '{\"time\":\"Time\"}', 1, NULL, '2022-05-30 04:48:02'),
(14, NULL, 'Seller Password Reset', 'SELLER_PASSWORD_RESET', 'Seller Password Reset', '<p>We have received a request to reset the password for your account on {{code}} and Request time {{time}}</p>', NULL, '{\"code\":\"Password Reset Code\", \"time\":\"Time\"}', 1, NULL, '2022-05-30 04:48:02'),
(15, NULL, 'Seller Password Reset Confirm', 'SELLER_PASSWORD_RESET_CONFIRM', 'Seller Password Reset Confirm', '<p>We have received a request to reset the password for your account on {{code}} and Request time {{time}}</p>', NULL, '{\"time\":\"Time\"}', 1, NULL, '2022-05-30 04:48:02'),
(16, '7UPy-uKdwxsRt-NfeK', 'OTP Verificaton', 'otp_verification', 'OTP Verificaton', 'Your Otp {{otp_code}} and request time {{time}}', 'Your Otp {{otp_code}} and request time {{time}}', '{\"otp_code\":\"OTP (One time password)\",\"time\":\"Time\"}', 1, '2024-03-18 08:08:23', '2024-03-18 08:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `exclusive_offers`
--

CREATE TABLE `exclusive_offers` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` int DEFAULT NULL,
  `serial` int DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_products`
--

CREATE TABLE `feature_products` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default.jpg',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1 ,Inactive: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `following_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `name`, `slug`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Service Sections', 'service-section', '{\"service_1\":{\"heading\":\"FREE SHIPPING & RETURN\",\"sub_heading\":\"On all orders over $99\",\"icon\":\"<i class=\\\"fa-solid fa-truck-arrow-right\\\"><\\/i>\"},\"service_2\":{\"heading\":\"FREE SHIPPING & RETURN\",\"sub_heading\":\"On all orders over $99\",\"icon\":\"<i class=\\\"fa-solid fa-truck-arrow-right\\\"><\\/i>\"},\"service_3\":{\"heading\":\"FREE SHIPPING & RETURN\",\"sub_heading\":\"On all orders over $99\",\"icon\":\"<i class=\\\"fa-solid fa-truck-arrow-right\\\"><\\/i>\"},\"service_4\":{\"heading\":\"FREE SHIPPING & RETURN\",\"sub_heading\":\"On all orders over $99\",\"icon\":\"<i class=\\\"fa-solid fa-truck-arrow-right\\\"><\\/i>\"}}', '1', NULL, '2024-01-31 09:30:08'),
(2, 'Today\'s Deals', 'todays-deals', '{\"heading\":{\"type\":\"text\",\"value\":\"Today\'s Deal\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Choose your necessary products from this collection\"},\"banner_title\":{\"type\":\"text\",\"value\":\"70% Off\"},\"banner_description\":{\"type\":\"textarea\",\"value\":\"Visit our showroom today for exclusive offers on premium products. Discover unbeatable deals and elevate your lifestyle with our curated selection. Limited time, extraordinary savings await you\"},\"image\":{\"type\":\"file\",\"size\":\"330x625\",\"value\":\"641db01a6580f1679667226.png\"}}', '1', NULL, '2024-02-15 05:53:27'),
(3, 'Top Category', 'top-category', '{\"heading\":{\"type\":\"text\",\"value\":\"Top Category\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Special products in this month.\"}}', '1', NULL, '2023-03-28 06:12:25'),
(4, 'Campaigns', 'campaign', '{\"heading\":{\"type\":\"text\",\"value\":\"Campaign\"}}', '1', NULL, '2024-01-27 07:45:25'),
(5, 'New Arrivals', 'new-arrivals', '{\"heading\":{\"type\":\"text\",\"value\":\"New Arrivals\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Newly Arrive Product In This Month\"}}', '1', NULL, '2024-02-15 05:35:33'),
(6, 'Best Selling Products', 'best-selling-products', '{\"heading\":{\"type\":\"text\",\"value\":\"Best Selling Products\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Best Selling products in this month.\"}}', '1', NULL, '2024-02-15 05:35:46'),
(7, 'Menu Category', 'menu-category', '{\"sub_heading\":{\"type\":\"text\",\"value\":\"Special products in this month.\"}}', '1', NULL, NULL),
(8, 'Our Top Products', 'top-products', '{\"heading\":{\"type\":\"text\",\"value\":\"Top Products\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Top products in this month.\"}}', '1', NULL, '2024-02-15 05:37:33'),
(9, 'Best Shops', 'best-shops', '{\"heading\":{\"type\":\"text\",\"value\":\"Best Shops\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Best Selling Store\"}}', '1', NULL, '2024-02-15 05:37:24'),
(10, 'Top Brands', 'top-brands', '{\"heading\":{\"type\":\"text\",\"value\":\"Top Brands\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Our Top Brands\"}}', '1', NULL, '2024-02-15 05:37:45'),
(11, 'Trending Products', 'trending-products', '{\"heading\":{\"type\":\"text\",\"value\":\"Trending Products\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Special products in this month\"}}', '1', NULL, NULL),
(12, 'Floating Header', 'floating-header', '{\"heading\":{\"type\":\"text\",\"value\":\"Cartuser - Your Ultimate Shopping Destination\"}}', '1', NULL, '2024-03-05 11:02:29'),
(13, 'Digital Products', 'digital-products', '{\"heading\":{\"type\":\"text\",\"value\":\"Digital Products\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Explore our Digital Collection\"},\"image\":{\"type\":\"file\",\"size\":\"330x540\",\"value\":\"641c207737a4e1679564919.png\"}}', '1', NULL, '2024-02-15 05:52:37'),
(14, 'Footer App', 'app-section', '{\"heading\":{\"type\":\"text\",\"value\":\"Download the EmergeCart App\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Take your shopping experience to the next level with the cartuser mobile app. Enjoy exclusive deals, seamless browsing, and faster checkout on-the-go. Available for iOS and Android.\"},\"play_store_link\":{\"type\":\"text\",\"value\":\"@@\"},\"apple_store_link\":{\"type\":\"text\",\"value\":\"@@\"}}', '1', NULL, '2024-03-05 11:02:20'),
(21, 'Newsletter', 'news-latter', '{\"heading\":{\"type\":\"text\",\"value\":\"Stay Connected with cartuser Updates\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Subscribe to our newsletter and stay up-to-date with the latest trends, exclusive offers, and exciting news from cartuser. Don\'t miss out on our special promotions and product launches \\u2013 sign up today\"},\"image\":{\"type\":\"file\",\"size\":\"577x642\",\"value\":\"641c3a17702201679571479.png\"}}', '1', NULL, '2024-03-05 11:02:12'),
(23, 'Product Offer', 'product-offer', '{\"heading\":{\"type\":\"text\",\"value\":\"Women\'s Fashion\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Get 20% off on your purchase over $99\"},\"body\":{\"type\":\"textarea\",\"value\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, quod minus! Voluptatem, repellendus rxccatione. Quaxerat in asperiores hic voluptatibus corporis?cccc\"},\"button_text\":{\"type\":\"text\",\"value\":\"view\"},\"button_url\":{\"type\":\"text\",\"value\":\"@@\"},\"image\":{\"type\":\"file\",\"size\":\"850x450\",\"value\":\"641c20114a26d1679564817.png\"}}', '1', NULL, '2024-01-31 09:29:35'),
(26, 'Promotional Offer 2', 'promotional-offer-2', '{\"position\":{\"type\":\"select\",\"value\":\"best-shops\"},\"image\":{\"type\":\"file\",\"size\":\"1000x200\",\"url\":\"@@@@\",\"value\":\"6422a3c87484b1679991752.png\"},\"image_2\":{\"type\":\"file\",\"size\":\"1000x200\",\"url\":\"@@@@\",\"value\":\"6422a3c8acb471679991752.png\"}}', '1', NULL, '2024-01-25 10:42:51'),
(27, 'Promotional Offer', 'promotional-offer', '{\"position\":{\"type\":\"select\",\"value\":\"new-arrivals\"},\"image\":{\"type\":\"file\",\"size\":\"1000x200\",\"url\":\"@@@@\",\"value\":\"64227f229c4761679982370.png\"},\"image_2\":{\"type\":\"file\",\"size\":\"1000x200\",\"url\":\"@@@@\",\"value\":\"64227f22b47181679982370.png\"}}', '1', NULL, '2024-01-31 10:56:03'),
(133, 'Footer Text', 'footer-text', '{\"heading\":{\"type\":\"text\",\"value\":\"Your go-to destination for seamless online shopping experiences. Explore curated collections, discover new trends, and enjoy hassle-free transactions. Shop with confidence at EmergeCart\"}}', '1', NULL, '2024-02-15 05:38:41'),
(212, 'Seo Section', 'seo-section', '{\"seo_image\":\"65af65405f73f1705993536.png\",\"meta_keywords\":[\"Online\",\"Shopping\",\"E-commerce\",\"Platform\",\"Buy\",\"Cart\",\"Webstore\",\"Shop\",\"Secure\",\"Transactions\",\"Convenient\",\"Products\",\"Innovative\",\"Features\",\"Exceptional\"],\"meta_description\":\"<!DOCTYPE html PUBLIC \\\"-\\/\\/W3C\\/\\/DTD HTML 4.0 Transitional\\/\\/EN\\\" \\\"http:\\/\\/www.w3.org\\/TR\\/REC-html40\\/loose.dtd\\\">\\n<html><head><meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\"><meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\">\\r\\n<meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\"><meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\">\\r\\n<meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\">\\r\\n<meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\"><link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1706511848&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1709629248&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1709629248&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1709629248&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1709629248&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<\\/head><body><span style=\\\"color: rgb(13, 13, 13); font-family: S\\u00f6hne, ui-sans-serif, system-ui, -apple-system, \\\" segoe=\\\"\\\" ui=\\\"\\\" roboto=\\\"\\\" ubuntu=\\\"\\\" cantarell=\\\"\\\" sans=\\\"\\\" sans-serif=\\\"\\\" neue=\\\"\\\" arial=\\\"\\\" color=\\\"\\\" emoji=\\\"\\\" symbol=\\\"\\\" font-size:=\\\"\\\" white-space-collapse:=\\\"\\\" preserve=\\\"\\\">cartuser offers a seamless online shopping experience, where convenience meets quality. Discover a curated selection of products, innovative features, and exceptional service. cartuser\\u2013 Where your shopping journey begin<\\/span><\\/body><\\/html>\\n\",\"social_title\":\"\\\"cartuser: Where Every Purchase Tells a Story\\\"\",\"social_description\":\"Experience the future of online shopping with cartuser. Discover a world of possibilities, where every click leads to new adventures. Shop smart, shop seamlessly, shop cartuser.\",\"social_image\":\"65af6576751c11705993590.png\"}', '1', NULL, '2024-03-05 11:10:27'),
(213, 'Support', 'support', '{\"heading\":{\"type\":\"text\",\"value\":\"How can we help you?\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"SWe are glad having you here looking for the answer. As our team hardly working on the\"}}', '1', NULL, NULL),
(214, 'Login', 'login', '{\"heading\":{\"type\":\"text\",\"value\":\"Get In Touch\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Want to get in touch? We\'d love to hear from you. Here\'s how you can reach us...!\"}}', '1', NULL, NULL),
(215, 'Contact', 'contact', '{\"heading\":{\"type\":\"text\",\"value\":\"How can we help you?\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"SWe are glad having you here looking for the answer. As our team hardly working on the\"}}', '1', NULL, NULL),
(216, 'Social Icon', 'social-icon', '{\"heading\":{\"type\":\"text\",\"value\":\"Social Icon\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"We are on Social media you can also follow here for more updates.\"},\"facebook\":{\"icon\":\"<i class=\\\"fa-brands fa-facebook-f\\\"><\\/i>\",\"url\":\"@@\",\"type\":\"text\"},\"google\":{\"icon\":\"<i class=\\\"fa-brands fa-google\\\"><\\/i>\",\"url\":\"@@\",\"type\":\"text\"},\"linkedin\":{\"icon\":\"<i class=\\\"fa-brands fa-linkedin\\\"><\\/i>\",\"url\":\"@@\",\"type\":\"text\"},\"whatsapp\":{\"icon\":\"<i class=\\\"fa-brands fa-whatsapp\\\"><\\/i>\",\"url\":\"@@\",\"type\":\"text\"}}', '1', NULL, '2024-02-15 05:34:12'),
(217, 'Payment Image', 'payment-image', '{\"image\":{\"type\":\"file\",\"size\":\"430x35\",\"value\":\"642278e37d2771679980771.png\"}}', '1', NULL, '2023-03-28 05:19:31'),
(219, 'Cookie', 'cookie', '{\"heading\":{\"type\":\"text\",\"value\":\"Cookie Preferences\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Manage your cookie preferences to enhance your browsing experience. We use cookies to personalize content, provide social media features, and analyze our traffic. By clicking \'Accept All Cookies,\' you agree to the storing of cookies on your device to improve site navigation, analyze site usage, and assist in our marketing efforts. You can also customize your cookie settings below.\"}}', '1', NULL, '2024-02-15 05:35:09'),
(220, 'Breadcrumb Banner', 'breadcrumb', '{\"image\":{\"type\":\"file\",\"size\":\"1900x190\",\"value\":\"6423d8deed4101680070878.png\"}}', '1', NULL, '2023-03-29 06:21:19'),
(221, 'Testimonial', 'testimonial', '{\"title\":{\"type\":\"text\",\"value\":\"Let\'s explore customer sentiments towards our offerings.\"},\"description\":{\"type\":\"textarea\",\"value\":\"Discover what customers are saying about our products. Dive into the feedback on the quality and performance of our offerings. Gain insights into how our customers perceive our products and their overall satisfaction. Your opinions matter, and we\'re here to listen.\"}}', '1', NULL, '2024-02-05 06:59:49'),
(222, 'Flash Deals', 'flash-deals', '{\"heading\":{\"type\":\"text\",\"value\":\"50% OFF\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Choose your necessary products from this feature categories\"}}', '1', NULL, '2024-02-15 05:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loder_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'loder_logo.jpg',
  `invoice_logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_logo_lg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default.jpg',
  `admin_logo_sm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `guest_checkout` int NOT NULL DEFAULT '0' COMMENT 'Enable : 1,Disable :0',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seller_mode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `site_favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_gateway_id` int DEFAULT NULL,
  `commission` decimal(18,8) DEFAULT NULL,
  `mail_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_gateway_id` int DEFAULT NULL,
  `email_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_notification` tinyint DEFAULT NULL COMMENT 'Yes : 1, No : 2',
  `sms_notification` tinyint DEFAULT '1' COMMENT 'Enable : 1, Disable : 2',
  `search_min` decimal(18,8) DEFAULT '0.00000000',
  `search_max` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `s_login_google_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `s_login_facebook_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refund` tinyint DEFAULT '0',
  `preloader` tinyint NOT NULL DEFAULT '0' COMMENT 'Active 1 , Inactive 0',
  `tawk_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refund_time_limit` int NOT NULL DEFAULT '10',
  `app_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seller_reg_allow` tinyint DEFAULT '1' COMMENT 'ON : 1, OFF : 2',
  `status_expiry` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_section` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `app_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_installed_at` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maintenance_mode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strong_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_ai_setting` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `otp_configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `task_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `uid`, `site_name`, `logo`, `loder_logo`, `invoice_logo`, `admin_logo_lg`, `admin_logo_sm`, `site_logo`, `cod`, `guest_checkout`, `address`, `copyright_text`, `seller_mode`, `site_favicon`, `currency_name`, `currency_symbol`, `primary_color`, `secondary_color`, `font_color`, `sms_gateway_id`, `commission`, `mail_from`, `phone`, `order_prefix`, `email_gateway_id`, `email_template`, `sms_template`, `email_notification`, `sms_notification`, `search_min`, `search_max`, `s_login_google_info`, `s_login_facebook_info`, `refund`, `preloader`, `tawk_to`, `refund_time_limit`, `app_settings`, `seller_reg_allow`, `status_expiry`, `banner_section`, `app_version`, `system_installed_at`, `security_settings`, `maintenance_mode`, `strong_password`, `open_ai_setting`, `otp_configuration`, `task_config`, `last_cron_run`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Cartuser', 'fsad', 'loder_logo.jpg', '{\"Cash On Delivery\":\"64046349de2aa1678009161.png\",\"unpaid\":\"6404635f52c081678009183.png\",\"paid\":\"640463728b0d31678009202.png\",\"Delivered\":\"6404637290b261678009202.png\"}', 'admin_site_logo.jpg', NULL, NULL, 'active', 1, '1210 Bingamon Road ,Garfield Heights', '©cartuser.com | All brands and registered hallmarks belongings to the right owners.', 'active', 'fs', 'USD', '$', 'E40046', '094966', 'fff', 13, '2.00000000', 'cartuser@gmail.com', '+15678781998', 'cartuser', 1, 'Hello {{username}}\r\n{{message}}', 'hi {{name}}, {{message}}', 1, 2, '20.00000000', '7000.00000000', '{\"g_client_id\":\"@@@@@@@@\",\"g_client_secret\":\"@@@@@@@@\",\"g_status\":\"2\"}', '{\"f_client_id\":\"@@@@@@@@\",\"f_client_secret\":\"@@@@@@@@\",\"f_status\":\"2\"}', NULL, 0, '{\"property_id\":\"@@@\",\"widget_id\":\"@@@\",\"status\":\"0\"}', 0, '{\"page_-1\":{\"image\":null,\"heading\":\"Welcome to Fluute: Your Ultimate Music Companion\",\"description\":\"Get ready to elevate your music experience with Fluute \\u2013 the ultimate music companion. Dive into a world of endless tunes, curated playlists, and personalized recommendations. Join Fluute today and let the music take you on a journey.\"},\"page_2\":{\"image\":null,\"heading\":\"Personalized Recommendations Just for You\\\"\",\"description\":\"Get ready to elevate your music experience with Fluute \\u2013 the ultimate music companion. Dive into a world of endless tunes, curated playlists, and personalized recommendations. Join Fluute today and let the music take you on a journey.\\\"\"}}', 1, '10', 'Full_Width_Banner', '1.1', '2024-03-19 09:22:10', '{\"dos_attempts\":\"2000\",\"dos_attempts_in_second\":\"2\",\"dos_security\":\"captcha\"}', '2', '1', '{\"key\":\"@@@@@@@@@@\",\"status\":\"1\"}', '{\"phone_otp\":\"0\",\"email_otp\":\"0\",\"login_with_password\":\"1\"}', NULL, NULL, NULL, '2024-03-19 09:22:10');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'default : 1,Not default : 0',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `uid`, `created_by`, `updated_by`, `name`, `code`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, NULL, 'English', 'en', '1', '1', '2023-03-14 14:09:00', '2023-03-14 14:09:00'),
(3, '4HbZ-JFFyiq1s-sZ28', NULL, NULL, 'Bengali', 'bn', '0', '1', '2024-01-23 10:31:12', '2024-01-23 10:31:12'),
(5, '7HuT-Xpc5KM3Y-H3QJ', NULL, NULL, 'Dutch', 'nl', '0', '1', '2024-01-23 10:31:39', '2024-01-23 10:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE `mails` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1 Inactive : 2',
  `driver_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mails`
--

INSERT INTO `mails` (`id`, `uid`, `name`, `status`, `driver_information`, `created_at`, `updated_at`) VALUES
(1, NULL, 'SMTP', 1, '{\"driver\":\"@@\",\"host\":\"@@\",\"port\":\"@@\",\"from\":{\"address\":\"@@\",\"name\":\"@@\"},\"encryption\":\"@@\",\"username\":\"@@\",\"password\":\"@@\"}', NULL, '2024-03-19 03:25:14'),
(2, NULL, 'PHP MAIL', 1, NULL, NULL, '2022-08-03 06:52:48'),
(3, NULL, 'SendGrid Api', 1, '{\"app_key\":\"@@@@@@@@@@\"}', NULL, '2024-02-15 05:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Default : 1,Not Default : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_categories`
--

CREATE TABLE `menu_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `serial` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(208, '2014_10_12_000000_create_users_table', 1),
(209, '2014_10_12_100000_create_password_resets_table', 1),
(210, '2019_08_19_000000_create_failed_jobs_table', 1),
(211, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(212, '2022_03_02_045942_create_admins_table', 1),
(213, '2022_03_02_083349_create_categories_table', 1),
(214, '2022_03_02_114052_create_brands_table', 1),
(215, '2022_03_05_045023_create_attributes_table', 1),
(216, '2022_03_05_052225_create_products_table', 1),
(217, '2022_03_06_100007_create_attribute_values_table', 1),
(218, '2022_03_06_123415_create_product_images_table', 1),
(219, '2022_03_07_051646_create_shipping_methods_table', 1),
(220, '2022_03_07_051810_create_shipping_deliveries_table', 1),
(221, '2022_03_09_063537_create_product_stocks_table', 1),
(222, '2022_03_09_092226_create_general_settings_table', 1),
(223, '2022_03_09_115716_create_sellers_table', 1),
(224, '2022_03_10_094707_create_seller_shop_settings_table', 1),
(225, '2022_03_12_063006_create_pricing_plans_table', 1),
(226, '2022_03_21_044001_create_withdraw_methods_table', 1),
(227, '2022_03_21_090820_create_currencies_table', 1),
(228, '2022_03_21_124014_create_withdraws_table', 1),
(229, '2022_03_22_093201_create_transactions_table', 1),
(230, '2022_03_23_052000_create_support_tickets_table', 1),
(231, '2022_03_23_084309_create_support_messages_table', 1),
(232, '2022_03_23_092035_create_support_files_table', 1),
(233, '2022_03_24_050504_create_mails_table', 1),
(234, '2022_03_24_104034_create_email_templates_table', 1),
(235, '2022_03_27_065423_create_payment_methods_table', 1),
(236, '2022_03_31_061114_create_plan_subscriptions_table', 1),
(237, '2022_04_03_035452_create_orders_table', 1),
(238, '2022_04_10_110244_create_digital_product_attributes_table', 1),
(239, '2022_04_12_045020_create_digital_product_attribute_values_table', 1),
(240, '2022_04_27_032226_create_user_login_infos_table', 1),
(241, '2022_04_27_072443_create_product_ratings_table', 1),
(242, '2022_05_07_095405_create_subscribers_table', 1),
(243, '2022_05_08_102349_create_coupons_table', 1),
(244, '2022_05_09_052716_create_todays_offers_table', 1),
(245, '2022_05_09_084737_create_wish_lists_table', 1),
(246, '2022_05_10_044452_create_frontends_table', 1),
(247, '2022_05_10_115425_create_menus_table', 1),
(248, '2022_05_12_045234_create_menu_categories_table', 1),
(249, '2022_05_14_093059_create_exclusive_offers_table', 1),
(250, '2022_05_16_053300_create_languages_table', 1),
(251, '2022_05_17_110315_create_carts_table', 1),
(252, '2022_05_21_094336_create_order_details_table', 1),
(253, '2022_05_22_054022_create_followers_table', 1),
(254, '2022_05_25_062354_create_page_setups_table', 1),
(255, '2022_05_25_062425_create_blogs_table', 1),
(256, '2022_05_30_085018_create_seller_password_resets_table', 1),
(257, '2022_05_31_070309_create_compare_product_lists_table', 1),
(258, '2022_06_02_111430_create_payment_logs_table', 1),
(259, '2022_07_25_095610_create_product_shipping_deliveries_table', 1),
(260, '2022_08_04_152005_create_admin_password_resets_table', 1),
(261, '2022_08_07_141046_create_sms_gateways_table', 1),
(262, '2022_10_04_161745_create_banners_table', 1),
(263, '2022_10_16_110641_create_todays_deals_table', 1),
(264, '2022_10_16_134818_create_feature_products_table', 1),
(265, '2022_10_20_104829_create_contact_us_table', 1),
(266, '2022_10_20_105817_create_supports_table', 1),
(267, '2022_10_20_110712_create_faqs_table', 1),
(268, '2022_10_23_134516_create_news_latters_table', 1),
(269, '2023_02_02_111939_create_campaigns_table', 1),
(270, '2023_02_02_112536_create_campaign_products_table', 1),
(271, '2023_02_05_154615_create_refunds_table', 1),
(272, '2023_02_05_164445_create_refund_methods_table', 1),
(273, '2023_02_27_155604_create_roles_table', 1),
(274, '2023_02_27_163131_create_plugin_settings_table', 1),
(275, '2023_02_28_171924_create_translations_table', 1),
(276, '2023_03_04_150302_create_order_statuses_table', 1),
(277, '2022_05_08_090552_create_today_deals_table', 2),
(278, '2022_05_09_052716_create_todays_offers_table copy', 2),
(279, '2024_01_21_150004_create_flash_deals_table', 2),
(280, '2024_01_31_153946_create_testimonials_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `news_latters`
--

CREATE TABLE `news_latters` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `time_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_percentage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_deliverie_id` int UNSIGNED DEFAULT NULL,
  `payment_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint UNSIGNED DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` tinyint DEFAULT NULL,
  `shipping_charge` decimal(18,8) DEFAULT NULL,
  `payment_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount` decimal(18,8) DEFAULT NULL,
  `amount` decimal(18,8) DEFAULT '0.00000000',
  `billing_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_status` tinyint NOT NULL DEFAULT '1' COMMENT 'Unpaid : 1, Paid : 2',
  `order_type` tinyint NOT NULL DEFAULT '1' COMMENT 'Digital : 101, Physical : 102',
  `payment_type` tinyint NOT NULL DEFAULT '1' COMMENT 'Cash On Delivery : 1, Payment method : 2',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Placed : 1, Confirmed : 2, Processing : 3, Shipped : 4, Delivered : 5 Cancel : 6',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `digital_product_attribute_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_price` decimal(18,8) DEFAULT NULL,
  `attribute` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Placed : 1, Confirmed : 2, Processing : 3, Shipped : 4, Delivered : 5 Cancel : 6',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `payment_status` tinyint DEFAULT NULL COMMENT 'Unpaid : 1, Paid : 2',
  `payment_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_status` tinyint DEFAULT NULL COMMENT 'Placed : 1, Confirmed : 2, Processing : 3, Shipped : 4, Delivered : 5 Cancel : 6',
  `delivery_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_setups`
--

CREATE TABLE `page_setups` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_setups`
--

INSERT INTO `page_setups` (`id`, `uid`, `name`, `body`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, '1dRR-7BkgK045-kV4k', 'Terms and Conditions', NULL, '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\r\n<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><body><h1 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 0.888889em; margin-left: 0px; line-height: 1.11111; color: rgb(13, 13, 13); font-size: 2.25em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"background-color: var(--ig-card-bg); font-family: var(--ig-body-font-family); font-size: var(--ig-body-font-size); font-weight: var(--ig-body-font-weight); text-align: var(--ig-body-text-align);\">Last Updated: 02-03-2024</span><br></h1><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 1.25em 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">Please read these terms and conditions carefully before using the CartUser e-commerce platform.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">1. Acceptance of Terms</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">By accessing or using the CartUser website and its related services, you agree to comply with and be bound by these terms and conditions. If you disagree with any part of these terms, please refrain from using our platform.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">2. User Accounts</h2><ol segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; list-style-type: none; list-style-position: initial; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(13, 13, 13);\"><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Account Information:</span> Users are responsible for maintaining the confidentiality of their account information and passwords.</p></li><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Account Termination:</span> CartUser reserves the right to terminate or suspend user accounts without prior notice if there is a violation of these terms.</p></li></ol><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">3. Products and Services</h2><ol segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; list-style-type: none; list-style-position: initial; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(13, 13, 13);\"><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Product Information:</span> While we strive for accuracy, we do not guarantee the completeness or reliability of product information on CartUser. Users are encouraged to verify details independently.</p></li><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Pricing:</span> Prices are subject to change without notice. CartUser reserves the right to modify or discontinue any product or service without prior notice.</p></li></ol><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">4. Privacy Policy</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">Your use of CartUser is also governed by our <a target=\"_new\" style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Privacy Policy</a>, which outlines how we collect, use, and protect your personal information.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">5. Intellectual Property</h2><ol segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; list-style-type: none; list-style-position: initial; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(13, 13, 13);\"><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Ownership:</span> All content and materials on CartUser, including but not limited to text, graphics, logos, and images, are the property of [Your Company Name] and are protected by intellectual property laws.</p></li><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Use Restrictions:</span> Users are prohibited from using, reproducing, or distributing any content from CartUser without explicit permission.</p></li></ol><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">6. Disclaimers</h2><ol segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; list-style-type: none; list-style-position: initial; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(13, 13, 13);\"><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Availability:</span> CartUser strives to maintain uninterrupted service, but we do not guarantee continuous, error-free operation of the platform.</p></li><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Content Accuracy:</span> We do our best to provide accurate and up-to-date information, but we make no warranties or representations regarding the accuracy of the content on CartUser.</p></li></ol><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">7. Limitation of Liability</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">CartUser, its affiliates, and partners are not liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">8. Changes to Terms</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">CartUser reserves the right to modify these terms and conditions at any time. Users are responsible for regularly reviewing these terms, and continued use of the platform constitutes acceptance of any changes.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Contact Information</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">If you have any questions or concerns regarding these terms and conditions, please contact us.</p></body></html>\r\n', '1', NULL, '2024-03-14 09:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `order_type` int NOT NULL COMMENT 'Digital : 101, Physical : 102',
  `user_id` int DEFAULT NULL,
  `method_id` int DEFAULT NULL,
  `charge` decimal(18,8) DEFAULT NULL,
  `rate` decimal(18,8) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `final_amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `trx_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Pending : 1, Success : 2, Cancel : 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int UNSIGNED DEFAULT NULL,
  `percent_charge` decimal(18,8) DEFAULT NULL,
  `rate` decimal(18,8) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Inactive : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `uid`, `currency_id`, `percent_charge`, `rate`, `name`, `unique_code`, `image`, `payment_parameter`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 4, '0.00000000', '1.00000000', 'Stripe', 'STRIPE101', '6363c927654fb1667483943.png', '{\"secret_key\":\"@@@@@@@@\",\"publishable_key\":\"@@@@@@@@\",\"note\":\"Payment with Stripe with 0% charge\"}', 1, NULL, '2024-02-15 05:47:19'),
(3, NULL, 4, '1.00000000', '1.00000000', 'Paypal', 'PAYPAL102', '62a02c1256fcf1654664210.png', '{\"environment\":\"sandbox\",\"client_id\":\"@@@@@@@@@@@@@\",\"secret\":\"@@@@@@@@@@\",\"note\":\"Payment with  Paypal with 0% charge\"}', 1, NULL, '2024-02-15 05:47:39'),
(4, NULL, 7, '1.00000000', '1.00000000', 'Paystack', 'PAYSTACK103', '62a02c97aee411654664343.png', '{\"public_key\":\"@@@@@@@@\",\"secret_key\":\"@@@@@\",\"note\":\"Payment to Paystack with 0% charge\"}', 1, NULL, '2024-02-15 05:47:55'),
(6, NULL, 4, '1.00000000', '1.00000000', 'Flutterwave', 'FLUTTERWAVE105', '6363c8ed594cc1667483885.jpg', '{\"public_key\":\"@@@@@@@@\",\"secret_key\":\"@@@@@@@@\",\"secret_hash\":\"@@@@@@@\",\"note\":\"Payment with Flutterwave with 0% charge\"}', 1, NULL, '2024-02-15 05:48:19'),
(7, NULL, 2, '1.00000000', '78.00000000', 'Razorpay', 'RAZORPAY106', '6363c8b0065b61667483824.png', '{\"razorpay_key\":\"@@@@@@\",\"razorpay_secret\":\"@@@@@@\",\"note\":\"Payment with Razorpay with 0% charge\"}', 1, NULL, '2024-02-15 05:48:47'),
(10, NULL, 4, '1.00000000', '1.00000000', 'Instamojo', 'INSTA106', '65b49a4b60c881706334795.png', '{\"api_key\":\"@@@@@@@@@\",\"auth_token\":\"@@@@@@@@@\",\"salt\":\"@@@@@@@@@\",\"note\":\"Payment with Instamojo\"}', 1, '2022-09-14 12:25:24', '2024-02-15 05:46:56'),
(11, NULL, 1, '1.00000000', '100.00000000', 'bkash', 'BKASH102', '63cfdc863c7011674566790.png', '{\"environment\":\"sandbox\",\"user_name\":\"@@@@@@\",\"password\":\"@@@@@@\",\"api_key\":\"@@@@@@\",\"api_secret\":\"@@@@@@\",\"note\":\"Payment with  bkash with 0% charge\"}', 1, NULL, '2024-02-15 05:49:11'),
(12, NULL, 1, '1.00000000', '100.00000000', 'Nagad', 'NAGAD104', '63cfdc96088d01674566806.png', '{\"environment\":\"sandbox\",\"public_key\":\"@@@@@@@@\",\"private_key\":\"@@@@@@@@\",\"merchant_id\":\"@@@@@@@@\",\"merchant_number\":\"@@@@@@@@\",\"note\":\"Payment to nagad with 0% charge\"}', 1, NULL, '2024-02-15 05:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscriptions`
--

CREATE TABLE `plan_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` int UNSIGNED DEFAULT NULL,
  `plan_id` int UNSIGNED DEFAULT NULL,
  `total_product` int DEFAULT '0',
  `status` tinyint NOT NULL COMMENT 'Running : 1, Expired : 2, Requested : 3',
  `expired_date` datetime(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_settings`
--

CREATE TABLE `plugin_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricing_plans`
--

CREATE TABLE `pricing_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `total_product` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Inactive : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricing_plans`
--

INSERT INTO `pricing_plans` (`id`, `uid`, `name`, `amount`, `total_product`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(3, '63z8-MqYxuJkm-7NCC', 'Free', '0.00000000', 10, 10, 1, '2023-03-28 06:58:17', '2023-03-28 07:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` int DEFAULT NULL COMMENT 'Digital Product : 101,  Physical Product : 102',
  `seller_id` int UNSIGNED DEFAULT NULL,
  `warranty_policy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `sub_category_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(18,8) DEFAULT '0.00000000',
  `discount` decimal(18,8) DEFAULT NULL,
  `discount_percentage` decimal(18,8) DEFAULT NULL,
  `featured_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `variant_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `minimum_purchase_qty` int DEFAULT NULL,
  `maximum_purchase_qty` int DEFAULT NULL,
  `top_status` tinyint NOT NULL DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `featured_status` tinyint NOT NULL DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `best_selling_item_status` tinyint NOT NULL DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `is_suggested` tinyint NOT NULL DEFAULT '0' COMMENT 'Yes:1 , No :0\r\n',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'New : 0, Published : 1, Inactive : 2',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `rating` decimal(18,8) NOT NULL,
  `review` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1 ,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_shipping_deliveries`
--

CREATE TABLE `product_shipping_deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `shipping_delivery_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `attribute_id` int UNSIGNED DEFAULT NULL,
  `attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `method_id` bigint UNSIGNED DEFAULT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_info` json DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Pending : 0,Success : 1,Failed : 2,Declined : 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_methods`
--

CREATE TABLE `refund_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `uid`, `created_by`, `updated_by`, `name`, `slug`, `permissions`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'SuperAdmin', 'superadmin', '[{\"admin\": [\"view_admin\", \"update_profile\", \"create_admin\", \"update_admin\", \"delete_admin\"]}, {\"language\": [\"view_languages\", \"create_languages\", \"update_languages\", \"delete_languages\"]}, {\"role\": [\"view_roles\", \"create_roles\", \"update_roles\", \"delete_roles\"]}, {\"settings\": [\"view_settings\", \"update_settings\"]}, {\"dashboard\": [\"view_dashboard\"]}, {\"order\": [\"view_order\", \"update_order\", \"delete_order\"]}, {\"configuration\": [\"view_configuration\", \"update_configuration\", \"delete_configuration\"]}, {\"settings\": [\"view_settings\", \"update_settings\", \"create_settings\"]}, {\"support\": [\"view_support\", \"update_support\", \"create_support\", \"delete_support\"]}, {\"Payment System\": [\"view_method\", \"update_method\", \"create_method\", \"delete_method\"]}, {\"brand\": [\"view_brand\", \"update_brand\", \"create_brand\", \"delete_brand\"]}, {\"category\": [\"view_category\", \"update_category\", \"create_category\", \"delete_category\"]}, {\"product\": [\"view_product\", \"update_product\", \"create_product\", \"delete_product\"]}, {\"promote\": [\"manage_deal\", \"manage_offer\", \"manage_cuppon\", \"manage_campaign\"]}, {\"log\": [\"view_log\", \"update_log\", \"delete_log\"]}, {\"blog\": [\"manage_blog\"]}, {\"seller\": [\"view_seller\", \"update_seller\", \"delete_seller\"]}, {\"customer\": [\"manage_customer\"]}, {\"frontend\": [\"manage_frontend\"]}]', '1', '2023-03-14 14:09:00', '2023-03-24 10:18:42'),
(4, '8vw2-mcnUob6E-iC9f', 1, NULL, 'Manager', 'manager', '[{\"admin\": [\"view_admin\", \"update_profile\"]}, {\"language\": [\"update_languages\", \"delete_languages\"]}, {\"role\": [\"update_roles\", \"delete_roles\"]}, {\"dashboard\": [\"view_dashboard\"]}, {\"order\": [\"delete_order\"]}, {\"configuration\": [\"update_configuration\"]}, {\"settings\": [\"view_settings\", \"update_settings\", \"create_settings\"]}, {\"support\": [\"view_support\", \"update_support\", \"create_support\", \"delete_support\"]}, {\"Payment System\": [\"view_method\", \"delete_method\"]}, {\"brand\": [\"view_brand\", \"update_brand\"]}, {\"category\": [\"view_category\", \"update_category\", \"create_category\"]}, {\"product\": [\"view_product\", \"create_product\"]}, {\"promote\": [\"manage_deal\"]}, {\"log\": [\"view_log\", \"delete_log\"]}]', '1', '2024-01-23 05:54:48', '2024-02-15 05:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `balance` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_status` tinyint NOT NULL DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Banned : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_password_resets`
--

CREATE TABLE `seller_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_shop_settings`
--

CREATE TABLE `seller_shop_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` int NOT NULL,
  `seller_id` int UNSIGNED NOT NULL,
  `short_details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `shop_first_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_second_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_third_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logoicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '2' COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_deliveries`
--

CREATE TABLE `shipping_deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_id` int UNSIGNED DEFAULT NULL,
  `duration` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active: 1, Inactive: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `gateway_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credential` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1, Inactive : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `gateway_code`, `name`, `credential`, `status`, `created_at`, `updated_at`) VALUES
(13, '101VON', 'vonage', '{\"api_key\":\"@@\",\"api_secret\":\"@@\",\"sender_id\":\"@@\"}', 1, '2024-03-18 08:08:37', '2024-03-18 08:08:37'),
(14, '103BIRD', 'messagebird', '{\"access_key\":\"@@\",\"sender_id\":\"@@\"}', 1, '2024-03-18 08:08:37', '2024-03-18 08:08:37'),
(15, '102TWI', 'twilio', '{\"account_sid\":\"@@\",\"auth_token\":\"@@\",\"from_number\":\"@@\"}', 1, '2024-03-18 08:08:37', '2024-03-18 08:08:37'),
(16, '104INFO', 'infobip', '{\"sender_id\":\"@@\",\"infobip_api_key\":\"@@\",\"infobip_base_url\":\"@@\"}', 1, '2024-03-18 08:08:37', '2024-03-18 08:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_files`
--

CREATE TABLE `support_files` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_message_id` int UNSIGNED DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_ticket_id` int UNSIGNED DEFAULT NULL,
  `admin_id` int UNSIGNED DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `seller_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Running : 1, Answered : 2, Replied : 3, closed : 4',
  `priority` tinyint NOT NULL DEFAULT '1' COMMENT 'Low : 1, medium : 2 high: 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quote` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT 'Active : 1, Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` int UNSIGNED DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `guest_user` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `transaction_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_number` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `code`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'en', 'create_staff', 'Create Staff', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(2, 'en', 'home', 'Home', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(3, 'en', 'staffs', 'Staffs', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(4, 'en', 'create', 'Create', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(5, 'en', 'name', 'Name', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(6, 'en', 'enter_your_name', 'Enter Your Name', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(7, 'en', 'user_name', 'User Name', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(8, 'en', 'enter_your_username', 'Enter your Username', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(9, 'en', 'phone_number', 'Phone Number', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(10, 'en', 'email', 'Email', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(11, 'en', 'password', 'Password', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(12, 'en', 'minimum_5_character_required', 'Minimum 5 Character Required!!', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(13, 'en', 'confirm_password', 'Confirm Password', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(14, 'en', 'roles', 'Roles', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(15, 'en', 'select_a_role', 'Select A Role', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(16, 'en', 'address', 'Address', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(17, 'en', 'enter_your_adress', 'Enter Your Adress', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(18, 'en', 'image', 'Image', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(19, 'en', 'add', 'Add', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(20, 'en', 'add_new', 'Add New', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(21, 'en', 'new_product', 'New Product', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(22, 'en', 'new_brand', 'New Brand', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(23, 'en', 'new_category', 'New Category', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(24, 'en', 'clear_cache', 'Clear Cache', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(25, 'en', 'browse_frontend', 'Browse Frontend', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(26, 'en', 'placed_order', 'Placed Order', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(27, 'en', 'welcome', 'Welcome', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(28, 'en', 'settings', 'Settings', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(29, 'en', 'logout', 'Logout', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(30, 'en', 'menu', 'Menu', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(31, 'en', 'dashboard', 'Dashboard', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(32, 'en', 'access_control', 'Access Control', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(33, 'en', 'sellers', 'Sellers', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(34, 'en', 'shop_analytics', 'Shop Analytics', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(35, 'en', 'manage_seller', 'Manage Seller', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(36, 'en', 'seller_subscription', 'Seller Subscription', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(37, 'en', 'pricing_plan', 'Pricing Plan', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(38, 'en', 'product__order', 'Product & Order', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(39, 'en', 'manage_product', 'Manage Product', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(40, 'en', 'inhouse_product', 'Inhouse Product', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(41, 'en', 'seller_product', 'Seller Product', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(42, 'en', 'digital_product', 'Digital Product', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(43, 'en', 'brand', 'Brand', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(44, 'en', 'category', 'Category', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(45, 'en', 'attribute', 'Attribute', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(46, 'en', 'manage_order', 'Manage Order', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(47, 'en', 'inhouse_order', 'Inhouse Order', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(48, 'en', 'seller_order', 'Seller Order', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(49, 'en', 'digital_order', 'Digital Order', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(50, 'en', 'inhouse____________________________________________________order', 'Inhouse                                                    Order', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(51, 'en', 'seller____________________________________________________order', 'Seller                                                    Order', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(52, 'en', 'userreports__support____________________________', 'USER,REPORTS & SUPPORT                            ', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(53, 'en', 'customers', 'Customers', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(54, 'en', 'support_ticket', 'Support Ticket', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(55, 'en', 'reports', 'Reports', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(56, 'en', 'transactions', 'Transactions', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(57, 'en', 'payment', 'Payment', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(58, 'en', 'widthdraw', 'Widthdraw', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(59, 'en', 'website_setup', 'Website Setup', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(60, 'en', 'appearances', 'Appearances', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(61, 'en', 'frontend_section', 'Frontend Section', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(62, 'en', 'menus', 'Menus', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(63, 'en', 'testimonials', 'Testimonials', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(64, 'en', 'blogs', 'Blogs', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(65, 'en', 'pages', 'Pages', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(66, 'en', 'support_faq', 'Support FAQ', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(67, 'en', 'home_category', 'Home Category', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(68, 'en', 'banner', 'Banner', '2024-02-15 04:39:46', '2024-02-15 04:39:46'),
(69, 'en', 'promotional_banner', 'Promotional Banner', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(70, 'en', 'marketing', 'Marketing', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(71, 'en', 'coupon', 'Coupon', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(72, 'en', 'campaign', 'Campaign', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(73, 'en', 'flash_deals', 'Flash Deals', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(74, 'en', 'subscribers', 'Subscribers', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(75, 'en', 'contacts', 'Contacts', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(76, 'en', 'system_setting', 'System Setting', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(77, 'en', 'setup__configuration', 'Setup & Configuration', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(78, 'en', 'seo', 'SEO', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(79, 'en', 'languages', 'Languages', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(80, 'en', 'payment__methods', 'Payment  Methods', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(81, 'en', 'withdraw_methods', 'Withdraw Methods', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(82, 'en', 'email_configuration', 'Email Configuration', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(83, 'en', 'global_template', 'Global template', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(84, 'en', 'mail_templates', 'Mail templates', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(85, 'en', 'shipping', 'Shipping', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(86, 'en', 'methods', 'Methods', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(87, 'en', 'delivery', 'Delivery', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(88, 'en', 'currencies', 'Currencies', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(89, 'en', 'social_login', 'Social Login', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(90, 'en', 'plugin', 'Plugin', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(91, 'en', 'flutter_app_settings', 'Flutter App Settings', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(92, 'en', 'ai_configuration', 'AI Configuration', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(93, 'en', 'security_settings', 'Security Settings', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(94, 'en', 'visitors', 'Visitors', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(95, 'en', 'dos_security', 'Dos Security', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(96, 'en', 'system_upgrade', 'System Upgrade', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(97, 'en', 'system_information', 'System Information', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(98, 'en', 'v', 'V', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(99, 'en', 'this_function_is_not_avaialbe_for_website_demo_mode', 'This Function is Not Avaialbe For Website Demo Mode', '2024-02-15 04:39:47', '2024-02-15 04:39:47'),
(100, 'en', 'manage_roles', 'Manage Roles', '2024-02-15 04:39:49', '2024-02-15 04:39:49'),
(101, 'en', 'roles_list', 'Roles List', '2024-02-15 04:39:49', '2024-02-15 04:39:49'),
(102, 'en', 'add_new_roles', 'Add New Roles', '2024-02-15 04:39:49', '2024-02-15 04:39:49'),
(103, 'en', 'status', 'Status', '2024-02-15 04:39:49', '2024-02-15 04:39:49'),
(104, 'en', 'created_by', 'Created By', '2024-02-15 04:39:49', '2024-02-15 04:39:49'),
(105, 'en', 'optinos', 'Optinos', '2024-02-15 04:39:49', '2024-02-15 04:39:49'),
(106, 'en', 'update', 'Update', '2024-02-15 04:39:49', '2024-02-15 04:39:49'),
(107, 'en', 'delete', 'Delete', '2024-02-15 04:39:49', '2024-02-15 04:39:49'),
(108, 'en', 'are_you_sure_', 'Are you sure ?', '2024-02-15 04:39:50', '2024-02-15 04:39:50'),
(109, 'en', 'are_you_sure_you_want_to____________________________remove_this_record_', 'Are you sure you want to                            remove this record ?', '2024-02-15 04:39:50', '2024-02-15 04:39:50'),
(110, 'en', 'close', 'Close', '2024-02-15 04:39:50', '2024-02-15 04:39:50'),
(111, 'en', 'yes_delete_it', 'Yes, Delete It!', '2024-02-15 04:39:50', '2024-02-15 04:39:50'),
(112, 'en', 'role_create', 'Role Create', '2024-02-15 04:39:51', '2024-02-15 04:39:51'),
(113, 'en', 'create_role', 'Create Role', '2024-02-15 04:39:51', '2024-02-15 04:39:51'),
(114, 'en', 'enter_name', 'Enter Name', '2024-02-15 04:39:51', '2024-02-15 04:39:51'),
(115, 'en', 'permissions', 'Permissions', '2024-02-15 04:39:51', '2024-02-15 04:39:51'),
(116, 'en', 'total_products', 'Total Products', '2024-02-15 04:39:54', '2024-02-15 04:39:54'),
(117, 'en', 'view_all', 'View All', '2024-02-15 04:39:54', '2024-02-15 04:39:54'),
(118, 'en', 'digital_products', 'Digital Products', '2024-02-15 04:39:54', '2024-02-15 04:39:54'),
(119, 'en', 'digital_orders', 'Digital Orders', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(120, 'en', 'withdraws_amount', 'Withdraws Amount', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(121, 'en', 'placed_orders', 'Placed Orders', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(122, 'en', 'processing_orders', 'Processing Orders', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(123, 'en', 'shipped_orders', 'Shipped Orders', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(124, 'en', 'delivered_orders', 'Delivered Orders', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(125, 'en', 'top_selling_store', 'Top selling store', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(126, 'en', 'username', 'Username', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(127, 'en', 'phone', 'Phone', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(128, 'en', 'action', 'Action', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(129, 'en', 'sorry_no_result_found', 'Sorry! No Result Found', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(130, 'en', 'monthly_order_overview', 'Monthly Order Overview', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(131, 'en', 'all_order_overview', 'All order overview', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(132, 'en', 'seller_shop', 'Seller shop', '2024-02-15 04:39:55', '2024-02-15 04:39:55'),
(133, 'en', 'seller', 'Seller', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(134, 'en', 'seller_list', 'Seller List', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(135, 'en', 'search_nameemailphone', 'Search name,email,phone', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(136, 'en', 'search', 'Search', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(137, 'en', 'reset', 'Reset', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(138, 'en', 'all____________________________seller', 'All                            Seller', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(139, 'en', 'active_seller', 'Active Seller', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(140, 'en', 'banned_seller', 'Banned Seller', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(141, 'en', 'name__username', 'Name - Username', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(142, 'en', 'email__phone', 'Email - Phone', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(143, 'en', 'best_seller', 'Best Seller', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(144, 'en', 'balance__total_products', 'Balance - Total Products', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(145, 'en', 'shop_status', 'Shop Status', '2024-02-15 04:39:57', '2024-02-15 04:39:57'),
(146, 'en', 'subscription_seller_log', 'Subscription seller log', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(147, 'en', 'seller_subscriptions', 'Seller Subscriptions', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(148, 'en', 'subscriptions_list', 'Subscriptions List', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(149, 'en', 'search_by_name_username_or_email', 'Search by name ,username, or email', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(150, 'en', 'search_by_date', 'Search by date', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(151, 'en', 'date', 'Date', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(152, 'en', 'plan', 'Plan', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(153, 'en', 'amount', 'Amount', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(154, 'en', 'total_product', 'Total Product', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(155, 'en', 'expired_date', 'Expired Date', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(156, 'en', 'are_you_sure_want_to_approve_this_update_plan', 'Are you sure want to approve this update plan?', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(157, 'en', 'cancel', 'Cancel', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(158, 'en', 'approved', 'Approved', '2024-02-15 04:40:02', '2024-02-15 04:40:02'),
(159, 'en', 'manage_pricing_plan', 'Manage pricing plan', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(160, 'en', 'plans', 'Plans', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(161, 'en', 'plan_list', 'Plan List', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(162, 'en', 'add_plan', 'Add Plan', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(163, 'en', 'search_by_name', 'Search by name', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(164, 'en', 'duration', 'Duration', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(165, 'en', 'days', 'Days', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(166, 'en', 'active', 'Active', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(167, 'en', 'na', 'N/A', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(168, 'en', 'add_new_pricing_plan', 'Add New Pricing Plan', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(169, 'en', 'enter_amount', 'Enter Amount', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(170, 'en', 'enter_number_of_product', 'Enter Number of Product', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(171, 'en', 'product', 'Product', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(172, 'en', 'enter_duration', 'Enter Duration', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(173, 'en', 'day', 'Day', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(174, 'en', 'inactive', 'Inactive', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(175, 'en', 'update_pricing_plan', 'Update Pricing Plan', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(176, 'en', 'update_plan', 'Update Plan', '2024-02-15 04:40:06', '2024-02-15 04:40:06'),
(177, 'en', 'plan_has_been_deleted', 'Plan has been deleted', '2024-02-15 04:40:13', '2024-02-15 04:40:13'),
(178, 'en', 'inhouse_products', 'In-house products', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(179, 'en', 'product_list', 'Product List', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(180, 'en', 'search__by_product_name__brand_or_category', 'Search  by product name , brand or category', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(181, 'en', 'all____________________________product', 'All                            Product', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(182, 'en', 'trashed_product', 'Trashed Product', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(183, 'en', 'categories__sold_item', 'Categories - Sold Item', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(184, 'en', 'info', 'Info', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(185, 'en', 'top_item__todays_deal', 'Top Item - Todays Deal', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(186, 'en', 'time__status', 'Time - Status', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(187, 'en', 'are_you_sure_you_want_toremove_this_record_', 'Are you sure you want to								remove this record ?', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(188, 'en', 'are_you_sure_you_want_torestore_this_record_', 'Are you sure you want to								restore this record ?', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(189, 'en', 'restore', 'Restore', '2024-02-15 04:40:22', '2024-02-15 04:40:22'),
(190, 'en', 'trashed_products', 'Trashed products', '2024-02-15 04:40:23', '2024-02-15 04:40:23'),
(191, 'en', 'seller_all_products', 'Seller all products', '2024-02-15 04:40:25', '2024-02-15 04:40:25'),
(192, 'en', 'seller_products', 'Seller Products', '2024-02-15 04:40:25', '2024-02-15 04:40:25'),
(193, 'en', 'seller_product_list', 'Seller Product List', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(194, 'en', 'search_by_name_or_category', 'Search by name or category', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(195, 'en', 'filter', 'Filter', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(196, 'en', 'published_products', 'Published Products', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(197, 'en', 'refuse_products', 'Refuse Products', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(198, 'en', 'categories', 'Categories', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(199, 'en', 'price', 'Price', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(200, 'en', 'are_you_sure_you_want_to_approve_this_product', 'Are you sure you want to approve this product?', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(201, 'en', 'are_you_sure_you_want_to_inactive_this_product', 'Are you sure you want to inactive this product?', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(202, 'en', 'confirm', 'Confirm!!', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(203, 'en', 'are_you_sure_you_want_to_delete_this_product', 'Are you sure you want to delete this product?', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(204, 'en', 'are_you_sure_you_want_to_restore_this_product', 'Are you sure you want to restore this product?', '2024-02-15 04:40:26', '2024-02-15 04:40:26'),
(205, 'en', 'seller_new_products', 'Seller new products', '2024-02-15 04:40:28', '2024-02-15 04:40:28'),
(206, 'en', 'seller_approved_products', 'Seller approved products', '2024-02-15 04:40:29', '2024-02-15 04:40:29'),
(207, 'en', 'seller_cancel_products', 'Seller cancel products', '2024-02-15 04:40:30', '2024-02-15 04:40:30'),
(208, 'en', 'all_brands', 'All Brands', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(209, 'en', 'brands', 'Brands', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(210, 'en', 'brand_list', 'Brand List', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(211, 'en', 'top_brand', 'Top Brand', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(212, 'en', 'options', 'Options', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(213, 'en', 'update_brand', 'Update Brand', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(214, 'en', 'serial_number', 'Serial Number', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(215, 'en', 'enter_serial_number', 'Enter Serial Number', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(216, 'en', 'logo', 'Logo', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(217, 'en', 'supported_file__jpgpngjpeg_and_size', 'Supported File : jpg,png,jpeg and size', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(218, 'en', 'pixels', 'pixels', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(219, 'en', 'submit', 'Submit', '2024-02-15 04:40:49', '2024-02-15 04:40:49'),
(220, 'en', 'inhouse_digital_products', 'In-house digital products', '2024-02-15 04:40:52', '2024-02-15 04:40:52'),
(221, 'en', 'digital_product_list', 'Digital Product List', '2024-02-15 04:40:52', '2024-02-15 04:40:52'),
(222, 'en', 'add_product', 'Add Product', '2024-02-15 04:40:52', '2024-02-15 04:40:52'),
(223, 'en', 'seller_digital_products', 'Seller digital products', '2024-02-15 04:40:55', '2024-02-15 04:40:55'),
(224, 'en', 'are_you_sure_you_want_toapproved_this_product', 'Are you sure you want to								Approved This Product?', '2024-02-15 04:40:55', '2024-02-15 04:40:55'),
(225, 'en', 'are_you_sure_you_want_torestore_this_product', 'Are you sure you want to								Restore This Product?', '2024-02-15 04:40:55', '2024-02-15 04:40:55'),
(226, 'en', 'seller_digital_trashed_product_showing_item', 'Seller digital trashed product showing item', '2024-02-15 04:40:57', '2024-02-15 04:40:57'),
(227, 'en', 'manage_categories', 'Manage Categories', '2024-02-15 04:41:01', '2024-02-15 04:41:01'),
(228, 'en', 'category_list', 'Category List', '2024-02-15 04:41:01', '2024-02-15 04:41:01'),
(229, 'en', 'parent_category', 'Parent Category', '2024-02-15 04:41:01', '2024-02-15 04:41:01'),
(230, 'en', 'top_category', 'Top Category', '2024-02-15 04:41:01', '2024-02-15 04:41:01'),
(231, 'en', 'all_attribute', 'All Attribute', '2024-02-15 04:41:03', '2024-02-15 04:41:03'),
(232, 'en', 'atrributes', 'Atrributes', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(233, 'en', 'attribite_list', 'Attribite list', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(234, 'en', 'createattribute', 'Create									Attribute', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(235, 'en', 'add_attribute_value', 'Add Attribute Value', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(236, 'en', 'attribute_value', 'Attribute Value', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(237, 'en', 'add_new_attribute_value', 'Add New Attribute Value', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(238, 'en', 'select_one', 'Select One', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(239, 'en', 'add_new_attribute', 'Add New Attribute', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(240, 'en', 'add_attribue', 'Add Attribue', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(241, 'en', 'update_attribute', 'Update Attribute', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(242, 'en', 'update_attribue', 'Update Attribue', '2024-02-15 04:41:04', '2024-02-15 04:41:04'),
(243, 'en', 'inhouse_all_orders', 'Inhouse all orders', '2024-02-15 04:41:07', '2024-02-15 04:41:07'),
(244, 'en', 'inhouse_orders', 'Inhouse Orders', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(245, 'en', 'order_list', 'Order List', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(246, 'en', 'all____________________________orders', 'All                            Orders', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(247, 'en', 'placed____________________________orders', 'Placed                            Orders', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(248, 'en', 'confirmed_order', 'Confirmed Order', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(249, 'en', 'processing', 'Processing', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(250, 'en', 'shipped', 'Shipped', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(251, 'en', 'delivered', 'Delivered', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(252, 'en', 'canceled_order', 'Canceled Order', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(253, 'en', 'order_id', 'Order ID', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(254, 'en', 'qty', 'Qty', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(255, 'en', 'time', 'Time', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(256, 'en', 'customer_info', 'Customer Info', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(257, 'en', 'product_details', 'Product Details', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(258, 'en', 'status_update', 'Status Update', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(259, 'en', 'select_status', 'Select Status', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(260, 'en', 'payment_status', 'Payment Status', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(261, 'en', 'delivery_status', 'Delivery Status', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(262, 'en', 'product_info', 'Product Info', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(263, 'en', 'paid', 'Paid', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(264, 'en', 'unpaid', 'Unpaid', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(265, 'en', 'nothing_selected', 'Nothing Selected', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(266, 'en', 'confirmed', 'Confirmed', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(267, 'en', 'processed', 'Processed', '2024-02-15 04:41:08', '2024-02-15 04:41:08'),
(268, 'en', 'inhouse_placed_orders', 'Inhouse placed orders', '2024-02-15 04:41:10', '2024-02-15 04:41:10'),
(269, 'en', 'inhouse_confirmed_orders', 'Inhouse confirmed orders', '2024-02-15 04:41:11', '2024-02-15 04:41:11'),
(270, 'en', 'inhouse_processing_orders', 'Inhouse processing orders', '2024-02-15 04:41:12', '2024-02-15 04:41:12'),
(271, 'en', 'inhouse_shipped_orders', 'Inhouse shipped orders', '2024-02-15 04:41:12', '2024-02-15 04:41:12'),
(272, 'en', 'inhouse_cancel_orders', '\"Inhouse cancel orders\"', '2024-02-15 04:41:13', '2024-02-15 04:41:13'),
(273, 'en', 'seller_orders', 'Seller orders', '2024-02-15 04:41:14', '2024-02-15 04:41:14'),
(274, 'en', 'all________________________________orders', 'All                                Orders', '2024-02-15 04:41:14', '2024-02-15 04:41:14'),
(275, 'en', 'placed________________________________orders', 'Placed                                Orders', '2024-02-15 04:41:14', '2024-02-15 04:41:14'),
(276, 'en', 'inhouse_digital_product_orders', 'In-house digital product orders', '2024-02-15 04:41:17', '2024-02-15 04:41:17'),
(277, 'en', 'order_number', 'Order Number', '2024-02-15 04:41:17', '2024-02-15 04:41:17'),
(278, 'en', 'customer', 'Customer', '2024-02-15 04:41:17', '2024-02-15 04:41:17'),
(279, 'en', 'details', 'Details', '2024-02-15 04:41:17', '2024-02-15 04:41:17'),
(280, 'en', 'seller_digital_product_orders', 'Seller digital product orders', '2024-02-15 04:41:20', '2024-02-15 04:41:20'),
(281, 'en', 'manage_customers', 'Manage customers', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(282, 'en', 'customer_list', 'Customer List', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(283, 'en', 'search_by_name__email_username_or_phone', 'Search by name , email ,username or phone', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(284, 'en', 'all____________________________customer', 'All                            Customer', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(285, 'en', 'active_customer', 'Active Customer', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(286, 'en', 'banned_customer', 'Banned Customer', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(287, 'en', 'customer__username', 'Customer - Username', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(288, 'en', 'number_of_orders', 'Number of Orders', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(289, 'en', 'joined_at', 'Joined At', '2024-02-15 04:41:24', '2024-02-15 04:41:24'),
(290, 'en', 'manage_support_ticket', 'Manage Support ticket', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(291, 'en', 'tickets', 'Tickets', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(292, 'en', 'ticket_list', 'Ticket List', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(293, 'en', 'search_by_name__email__ticket_number_or_subject', 'Search by name , email , ticket number or subject', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(294, 'en', 'all____________________________tickets', 'All                            Tickets', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(295, 'en', 'running_ticket', 'Running Ticket', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(296, 'en', 'answered_ticket', 'Answered Ticket', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(297, 'en', 'replied_ticket', 'Replied Ticket', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(298, 'en', 'closed_ticket', 'Closed Ticket', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(299, 'en', 'subject', 'Subject', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(300, 'en', 'ticket_number', 'Ticket Number', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(301, 'en', 'submitted_by', 'Submitted By', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(302, 'en', 'priority', 'Priority', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(303, 'en', 'last_reply', 'Last Reply', '2024-02-15 04:41:28', '2024-02-15 04:41:28'),
(304, 'en', 'manage_running_support_ticket', 'Manage running support ticket', '2024-02-15 04:41:30', '2024-02-15 04:41:30'),
(305, 'en', 'manage_answered_support_ticket', 'Manage answered support ticket', '2024-02-15 04:41:31', '2024-02-15 04:41:31'),
(306, 'en', 'manage_replied_support_ticket', 'Manage replied support ticket', '2024-02-15 04:41:32', '2024-02-15 04:41:32'),
(307, 'en', 'manage_closed_support_ticket', 'Manage closed support ticket', '2024-02-15 04:41:32', '2024-02-15 04:41:32'),
(308, 'en', 'user_transactions', 'User transactions', '2024-02-15 04:41:35', '2024-02-15 04:41:35'),
(309, 'en', 'transaction_logs', 'Transaction Logs', '2024-02-15 04:41:35', '2024-02-15 04:41:35'),
(310, 'en', 'transaction_log_list', 'Transaction log List', '2024-02-15 04:41:35', '2024-02-15 04:41:35'),
(311, 'en', 'search_by_customer_seller_trx_id_email', 'Search By Customer ,Seller TRX ID, Email', '2024-02-15 04:41:35', '2024-02-15 04:41:35'),
(312, 'en', 'user____________________________transactions', 'User                            Transactions', '2024-02-15 04:41:35', '2024-02-15 04:41:35'),
(313, 'en', 'seller_transactions', 'Seller Transactions', '2024-02-15 04:41:35', '2024-02-15 04:41:35'),
(314, 'en', 'guest_transactions', 'Guest Transactions', '2024-02-15 04:41:35', '2024-02-15 04:41:35'),
(315, 'en', 'transaction_id', 'Transaction ID', '2024-02-15 04:41:35', '2024-02-15 04:41:35'),
(316, 'en', 'post_balance', 'Post Balance', '2024-02-15 04:41:36', '2024-02-15 04:41:36'),
(317, 'en', 'guest', 'Guest', '2024-02-15 04:41:37', '2024-02-15 04:41:37'),
(318, 'en', 'payments_log', 'Payments log', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(319, 'en', 'payment_logs', 'Payment Logs', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(320, 'en', 'payment_log_list', 'Payment Log List', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(321, 'en', 'search_by_username_or_email_or_name_or_payment_method', 'Search By username or email or name, or payment method', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(322, 'en', 'all____________________________payments', 'All                            Payments', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(323, 'en', 'pending_payments', 'Pending Payments', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(324, 'en', 'approved_payments', 'Approved Payments', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(325, 'en', 'rejected_payments', 'Rejected Payments', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(326, 'en', 'user', 'User', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(327, 'en', 'method', 'Method', '2024-02-15 04:41:38', '2024-02-15 04:41:38'),
(328, 'en', 'final_amount', 'Final Amount', '2024-02-15 04:41:39', '2024-02-15 04:41:39'),
(329, 'en', 'pending_payments_log', 'Pending payments log', '2024-02-15 04:41:40', '2024-02-15 04:41:40'),
(330, 'en', 'approved_payments_log', 'Approved payments log', '2024-02-15 04:41:40', '2024-02-15 04:41:40'),
(331, 'en', 'rejected_payments_log', 'Rejected payments log', '2024-02-15 04:41:41', '2024-02-15 04:41:41'),
(332, 'en', 'all_withdraw_log', 'All withdraw log', '2024-02-15 04:41:42', '2024-02-15 04:41:42'),
(333, 'en', 'withdraw_logs', 'Withdraw logs', '2024-02-15 04:41:42', '2024-02-15 04:41:42'),
(334, 'en', 'withdraw_log_list', 'Withdraw Log List', '2024-02-15 04:41:42', '2024-02-15 04:41:42'),
(335, 'en', 'search_by_name_username_email', 'Search by name ,username ,email', '2024-02-15 04:41:42', '2024-02-15 04:41:42'),
(336, 'en', 'all____________________________logs', 'All                            Logs', '2024-02-15 04:41:42', '2024-02-15 04:41:42'),
(337, 'en', 'pending_logs', 'Pending Logs', '2024-02-15 04:41:42', '2024-02-15 04:41:42'),
(338, 'en', 'approved_logs', 'Approved Logs', '2024-02-15 04:41:42', '2024-02-15 04:41:42'),
(339, 'en', 'rejected_logs', 'Rejected Logs', '2024-02-15 04:41:43', '2024-02-15 04:41:43'),
(340, 'en', 'charge', 'Charge', '2024-02-15 04:41:43', '2024-02-15 04:41:43'),
(341, 'en', 'receivable', 'Receivable', '2024-02-15 04:41:43', '2024-02-15 04:41:43'),
(342, 'en', 'are_you_sure_to_want_rejected_this_withdraw', 'Are you sure to want rejected this withdraw?', '2024-02-15 04:41:43', '2024-02-15 04:41:43'),
(343, 'en', 'enter_details', 'Enter Details', '2024-02-15 04:41:43', '2024-02-15 04:41:43'),
(344, 'en', 'are_you_sure_want_to_approved_this_withdraw', 'Are you sure want to approved this withdraw?', '2024-02-15 04:41:43', '2024-02-15 04:41:43'),
(345, 'en', 'feedback', 'Feedback', '2024-02-15 04:41:43', '2024-02-15 04:41:43'),
(346, 'en', 'manage_frontend_section', 'Manage frontend section', '2024-02-15 04:41:47', '2024-02-15 04:41:47'),
(347, 'en', 'frontends', 'Frontends', '2024-02-15 04:41:47', '2024-02-15 04:41:47'),
(348, 'en', 'section_list', 'Section List', '2024-02-15 04:41:47', '2024-02-15 04:41:47'),
(349, 'en', 'manage_menu', 'Manage Menu', '2024-02-15 04:41:54', '2024-02-15 04:41:54'),
(350, 'en', 'menu_list', 'Menu List', '2024-02-15 04:41:54', '2024-02-15 04:41:54'),
(351, 'en', 'add_new_', 'Add New ', '2024-02-15 04:41:54', '2024-02-15 04:41:54'),
(352, 'en', 'url', 'URL', '2024-02-15 04:41:54', '2024-02-15 04:41:54'),
(353, 'en', 'manage_testimonials', 'Manage Testimonials', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(354, 'en', 'testimonials_list', 'Testimonials List', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(355, 'en', 'create____________________________________testimonial', 'Create                                    Testimonial', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(356, 'en', 'search_by_author_or_designation', 'Search by author or designation', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(357, 'en', 'author', 'Author', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(358, 'en', 'designation', 'Designation', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(359, 'en', 'rating', 'Rating', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(360, 'en', 'add_testimonial', 'Add Testimonial', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(361, 'en', 'enter_author_name', 'Enter author name', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(362, 'en', 'enter_designation', 'Enter designation', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(363, 'en', 'quote', 'Quote', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(364, 'en', 'enter_quote', 'Enter quote', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(365, 'en', 'max', 'Max', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(366, 'en', 'enter_rating', 'Enter rating', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(367, 'en', 'update_testimonial', 'Update Testimonial', '2024-02-15 04:41:56', '2024-02-15 04:41:56'),
(368, 'en', 'manage_blog', 'Manage Blog', '2024-02-15 04:41:58', '2024-02-15 04:41:58'),
(369, 'en', 'blog_list', 'Blog List', '2024-02-15 04:41:58', '2024-02-15 04:41:58'),
(370, 'en', 'create_blog', 'Create Blog', '2024-02-15 04:41:58', '2024-02-15 04:41:58'),
(371, 'en', 'search_by_category_or_title', 'Search by category or title', '2024-02-15 04:41:59', '2024-02-15 04:41:59'),
(372, 'en', 'post_title', 'Post Title', '2024-02-15 04:41:59', '2024-02-15 04:41:59'),
(373, 'en', 'manage_page_setup', 'Manage Page setup', '2024-02-15 04:42:00', '2024-02-15 04:42:00'),
(374, 'en', 'page_setup', 'Page Setup', '2024-02-15 04:42:00', '2024-02-15 04:42:00'),
(375, 'en', 'pages_list', 'Pages List', '2024-02-15 04:42:00', '2024-02-15 04:42:00'),
(376, 'en', 'add_new_page', 'Add New Page', '2024-02-15 04:42:00', '2024-02-15 04:42:00'),
(377, 'en', 'add_page', 'Add Page', '2024-02-15 04:42:00', '2024-02-15 04:42:00'),
(378, 'en', 'decription', 'Decription', '2024-02-15 04:42:00', '2024-02-15 04:42:00'),
(379, 'en', 'enter_description', 'Enter Description', '2024-02-15 04:42:00', '2024-02-15 04:42:00'),
(380, 'en', 'faq', 'FAQ', '2024-02-15 04:42:01', '2024-02-15 04:42:01'),
(381, 'en', 'faq_list', 'Faq List', '2024-02-15 04:42:01', '2024-02-15 04:42:01'),
(382, 'en', 'create____________________________________faqs', 'Create                                    Faqs', '2024-02-15 04:42:01', '2024-02-15 04:42:01'),
(383, 'en', 'search_by_category__name_or_question', 'Search by category , name or question', '2024-02-15 04:42:01', '2024-02-15 04:42:01'),
(384, 'en', 'category_name', 'Category Name', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(385, 'en', 'question', 'Question', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(386, 'en', 'add_new_faq', 'Add New Faq', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(387, 'en', 'choose_categroy', 'Choose Categroy', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(388, 'en', 'information_center', 'Information Center', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(389, 'en', 'pricing__plans', 'Pricing & Plans', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(390, 'en', 'sales_and_question', 'Sales And Question', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(391, 'en', 'usage_guide', 'Usage Guide', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(392, 'en', 'enter_question', 'Enter Question', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(393, 'en', 'answer', 'Answer', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(394, 'en', 'enter_answer', 'Enter Answer', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(395, 'en', 'deactive', 'DeActive', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(396, 'en', 'update_faq', 'Update FAQ', '2024-02-15 04:42:02', '2024-02-15 04:42:02'),
(397, 'en', 'menu_create', 'Menu create', '2024-02-15 04:42:03', '2024-02-15 04:42:03'),
(398, 'en', 'frontend_categories', 'Frontend Categories', '2024-02-15 04:42:03', '2024-02-15 04:42:03'),
(399, 'en', 'home_category_list', 'Home category list', '2024-02-15 04:42:03', '2024-02-15 04:42:03'),
(400, 'en', 'already_added', 'Already Added', '2024-02-15 04:42:03', '2024-02-15 04:42:03'),
(401, 'en', 'title', 'Title', '2024-02-15 04:42:03', '2024-02-15 04:42:03'),
(402, 'en', 'product_title', 'Product title', '2024-02-15 04:42:03', '2024-02-15 04:42:03'),
(403, 'en', 'section', 'Section', '2024-02-15 04:42:13', '2024-02-15 04:42:13'),
(404, 'en', 'banners', 'Banners', '2024-02-15 04:42:19', '2024-02-15 04:42:19'),
(405, 'en', 'banner_list', 'Banner List', '2024-02-15 04:42:19', '2024-02-15 04:42:19'),
(406, 'en', 'create_banner', 'Create Banner', '2024-02-15 04:42:19', '2024-02-15 04:42:19'),
(407, 'en', 'button_url', 'Button URL', '2024-02-15 04:42:19', '2024-02-15 04:42:19'),
(408, 'en', 'banner_item', 'Banner Item', '2024-02-15 04:42:19', '2024-02-15 04:42:19'),
(409, 'en', 'manage_campaign', 'Manage Campaign', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(410, 'en', 'campaigns', 'Campaigns', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(411, 'en', 'campaign_list', 'Campaign List', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(412, 'en', 'start_time', 'Start Time', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(413, 'en', 'end_time', 'End Time', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(414, 'en', 'payment_method', 'Payment Method', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(415, 'en', 'home_page', 'Home Page', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(416, 'en', 'manage_coupons', 'Manage Coupons', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(417, 'en', 'coupons', 'Coupons', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(418, 'en', 'coupon_list', 'Coupon List', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(419, 'en', 'code', 'Code', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(420, 'en', 'type', 'Type', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(421, 'en', 'value', 'Value', '2024-02-15 04:42:25', '2024-02-15 04:42:25'),
(422, 'en', 'flash_deal_list', 'Flash Deal List', '2024-02-15 04:42:29', '2024-02-15 04:42:29'),
(423, 'en', 'search_for_name', 'Search for Name', '2024-02-15 04:42:29', '2024-02-15 04:42:29'),
(424, 'en', 'manager_subscriber', 'Manager Subscriber', '2024-02-15 04:42:30', '2024-02-15 04:42:30'),
(425, 'en', 'subscriber_list', 'Subscriber List', '2024-02-15 04:42:30', '2024-02-15 04:42:30'),
(426, 'en', 'send_mail', 'Send Mail', '2024-02-15 04:42:30', '2024-02-15 04:42:30'),
(427, 'en', 'contact_message_list', 'Contact Message List', '2024-02-15 04:42:32', '2024-02-15 04:42:32'),
(428, 'en', 'contact_us', 'Contact Us', '2024-02-15 04:42:32', '2024-02-15 04:42:32'),
(429, 'en', 'contact_list', 'Contact List', '2024-02-15 04:42:32', '2024-02-15 04:42:32'),
(430, 'en', 'search_by_nameemail_or_subject', 'Search by name,email or subject', '2024-02-15 04:42:32', '2024-02-15 04:42:32'),
(431, 'en', 'message', 'Message', '2024-02-15 04:42:32', '2024-02-15 04:42:32'),
(432, 'en', 'enter_subject', 'Enter subject', '2024-02-15 04:42:32', '2024-02-15 04:42:32'),
(433, 'en', 'enter_message', 'Enter message', '2024-02-15 04:42:32', '2024-02-15 04:42:32'),
(434, 'en', 'send_mail_to_subscriber', 'Send mail to subscriber', '2024-02-15 04:42:35', '2024-02-15 04:42:35'),
(435, 'en', 'body', 'Body', '2024-02-15 04:42:35', '2024-02-15 04:42:35'),
(436, 'en', 'no_subscribers', 'No subscribers', '2024-02-15 04:42:39', '2024-02-15 04:42:39'),
(437, 'en', 'general_setting', 'General Setting', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(438, 'en', 'seller_panel', 'Seller Panel', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(439, 'en', 'debug_mode', 'Debug Mode', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(440, 'en', 'site_information', 'Site Information', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(441, 'en', 'site_name', 'Site Name', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(442, 'en', 'copyright_text', 'Copyright Text', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(443, 'en', 'email_address', 'Email Address', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(444, 'en', 'order_prefix', 'Order Prefix', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(445, 'en', 'primary_color', 'Primary Color', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(446, 'en', 'secondary_color', 'Secondary Color', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(447, 'en', 'font_color', 'Font Color', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(448, 'en', 'currency__percentage', 'Currency & Percentage', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(449, 'en', 'currency', 'Currency', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(450, 'en', 'currency_symbol', 'Currency Symbol', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(451, 'en', 'commission_on_sale', 'Commission On Sale', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(452, 'en', 'configurations', 'Configurations', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(453, 'en', 'guest_checkout', 'Guest Checkout', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(454, 'en', 'enable', 'Enable', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(455, 'en', 'disable', 'Disable', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(456, 'en', 'maintenance_mode', 'Maintenance Mode', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(457, 'en', 'strong_password', 'Strong Password', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(458, 'en', 'email_notification', 'Email Notification', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(459, 'en', 'seller_registration_status', 'Seller Registration Status', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(460, 'en', 'cash_on_delivery', 'Cash On Delivery', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(461, 'en', 'price_range_min', 'Price Range (Min)', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(462, 'en', 'price_range_max', 'Price Range (Max)', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(463, 'en', 'logo__icon', 'Logo & Icon', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(464, 'en', 'site_logo', 'Site Logo', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(465, 'en', 'admin_site_logo', 'Admin Site Logo', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(466, 'en', 'admin_logo_icon', 'Admin Logo Icon', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(467, 'en', 'site_favicon', 'Site Favicon', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(468, 'en', 'cron_job__others', 'Cron Job & Others', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(469, 'en', 'product_new_status_expiry', 'Product New Status Expiry', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(470, 'en', 'cron_job_url', 'Cron Job Url', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(471, 'en', 'copy_url', 'Copy Url', '2024-02-15 04:42:45', '2024-02-15 04:42:45'),
(472, 'en', 'seo_content', 'Seo Content', '2024-02-15 04:42:48', '2024-02-15 04:42:48'),
(473, 'en', 'seo_image__meta_keywords', 'Seo Image & Meta Keywords', '2024-02-15 04:42:48', '2024-02-15 04:42:48'),
(474, 'en', 'meta_keywords', 'Meta Keywords', '2024-02-15 04:42:48', '2024-02-15 04:42:48'),
(475, 'en', 'seo_image', 'SEO Image', '2024-02-15 04:42:49', '2024-02-15 04:42:49'),
(476, 'en', 'view_image', 'View image', '2024-02-15 04:42:49', '2024-02-15 04:42:49'),
(477, 'en', 'meta_description', 'Meta Description', '2024-02-15 04:42:49', '2024-02-15 04:42:49'),
(478, 'en', 'social_title__image', 'Social Title & Image', '2024-02-15 04:42:49', '2024-02-15 04:42:49'),
(479, 'en', 'social_title', 'Social Title', '2024-02-15 04:42:49', '2024-02-15 04:42:49'),
(480, 'en', 'social_seo_image', 'Social SEO Image', '2024-02-15 04:42:49', '2024-02-15 04:42:49'),
(481, 'en', 'social_description', 'Social Description', '2024-02-15 04:42:49', '2024-02-15 04:42:49'),
(482, 'en', 'keyword', 'Keyword', '2024-02-15 04:42:49', '2024-02-15 04:42:49'),
(483, 'en', 'view_more', 'View More', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(484, 'en', 'upto', 'Upto', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(485, 'en', 'view_products', 'View Products', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(486, 'en', 'write_your_words', 'Write Your Words', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(487, 'en', 'author_name', 'Author Name', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(488, 'en', 'author_image', 'Author Image', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(489, 'en', 'stars', 'stars', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(490, 'en', 'review', 'Review', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(491, 'en', 'write_opinion', 'Write Opinion', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(492, 'en', 'need_help', 'Need Help?', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(493, 'en', 'cart', 'Cart', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(494, 'en', 'support', 'Support', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(495, 'en', 'contact', 'Contact', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(496, 'en', 'become_a_seller', 'Become A Seller', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(497, 'en', 'track_order', 'Track Order', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(498, 'en', 'login', 'Login', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(499, 'en', 'what_are_you_looking_for', 'What are you looking for?', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(500, 'en', 'loading', 'Loading', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(501, 'en', 'favorite', 'Favorite', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(502, 'en', 'my_wishlist', 'My Wishlist', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(503, 'en', 'compare', 'Compare', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(504, 'en', 'compare_list', 'Compare list', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(505, 'en', 'your_cart', 'Your Cart:', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(506, 'en', 'need_help__call_now', 'Need Help ? Call Now', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(507, 'en', 'important_links', 'IMPORTANT LINKS', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(508, 'en', 'quick_links', 'QUICK LINKS', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(509, 'en', 'download_on_the', 'Download on the', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(510, 'en', 'google_play', 'Google Play', '2024-02-15 04:42:50', '2024-02-15 04:42:50'),
(511, 'en', 'apple_store', 'Apple Store', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(512, 'en', 'quick_view', 'Quick View', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(513, 'en', 'all_categories', 'All Categories', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(514, 'en', 'see_all_categories', 'See All Categories', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(515, 'en', 'wishlist', 'Wishlist', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(516, 'en', 'filter_by_price', 'Filter By Price', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(517, 'en', 'to', 'to', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(518, 'en', 'add_to_cart', 'Add to cart', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(519, 'en', 'manage_language', 'Manage language', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(520, 'en', 'language_list', 'Language List', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(521, 'en', 'add_new_language', 'Add New Language', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(522, 'en', 'language', 'Language', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(523, 'en', 'make_default', 'Make Default', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(524, 'en', 'translate', 'Translate', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(525, 'en', 'default', 'Default', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(526, 'en', 'add_language', 'Add Language', '2024-02-15 04:42:51', '2024-02-15 04:42:51'),
(527, 'en', 'select_country', 'Select Country', '2024-02-15 04:42:51', '2024-02-15 04:42:51');
INSERT INTO `translations` (`id`, `code`, `key`, `value`, `created_at`, `updated_at`) VALUES
(528, 'en', 'payment_methods', 'Payment methods', '2024-02-15 04:42:54', '2024-02-15 04:42:54'),
(529, 'en', 'payment_method_list', 'Payment Method List', '2024-02-15 04:42:54', '2024-02-15 04:42:54'),
(530, 'en', 'method_currency', 'Method Currency', '2024-02-15 04:42:54', '2024-02-15 04:42:54'),
(531, 'en', 'manage_withdraw_method', 'Manage withdraw method', '2024-02-15 04:42:57', '2024-02-15 04:42:57'),
(532, 'en', 'withdraw_method_list', 'Withdraw Method List', '2024-02-15 04:42:57', '2024-02-15 04:42:57'),
(533, 'en', 'create_withdrawmethod', 'Create Withdraw									Method', '2024-02-15 04:42:57', '2024-02-15 04:42:57'),
(534, 'en', 'method_name', 'Method Name', '2024-02-15 04:42:57', '2024-02-15 04:42:57'),
(535, 'en', 'currency_rate', 'Currency Rate', '2024-02-15 04:42:57', '2024-02-15 04:42:57'),
(536, 'en', 'withdraw_limit', 'Withdraw Limit', '2024-02-15 04:42:57', '2024-02-15 04:42:57'),
(537, 'en', 'mail_configuration', 'Mail Configuration', '2024-02-15 04:43:00', '2024-02-15 04:43:00'),
(538, 'en', 'mail_gateway', 'Mail Gateway', '2024-02-15 04:43:00', '2024-02-15 04:43:00'),
(539, 'en', 'mail_gateway_list', 'Mail Gateway List', '2024-02-15 04:43:00', '2024-02-15 04:43:00'),
(540, 'en', 'gateway_name', 'Gateway Name', '2024-02-15 04:43:00', '2024-02-15 04:43:00'),
(541, 'en', 'global_email_template', 'Global Email Template', '2024-02-15 04:43:01', '2024-02-15 04:43:01'),
(542, 'en', 'emial_template_short_code', 'Emial Template Short Code', '2024-02-15 04:43:01', '2024-02-15 04:43:01'),
(543, 'en', 'sent_from_email', 'Sent From Email', '2024-02-15 04:43:01', '2024-02-15 04:43:01'),
(544, 'en', 'email_template', 'Email Template', '2024-02-15 04:43:01', '2024-02-15 04:43:01'),
(545, 'en', 'template', 'Template', '2024-02-15 04:43:01', '2024-02-15 04:43:01'),
(546, 'en', 'email_template_short_code', 'Email Template Short Code', '2024-02-15 04:43:01', '2024-02-15 04:43:01'),
(547, 'en', 'mail_body', 'Mail Body', '2024-02-15 04:43:01', '2024-02-15 04:43:01'),
(548, 'en', 'email_templates', 'Email templates', '2024-02-15 04:43:03', '2024-02-15 04:43:03'),
(549, 'en', 'sms_template_list', 'SMS Template List', '2024-02-15 04:43:03', '2024-02-15 04:43:03'),
(550, 'en', '_name', ' Name', '2024-02-15 04:43:03', '2024-02-15 04:43:03'),
(551, 'en', 'shipping_methods', 'Shipping Methods', '2024-02-15 04:43:06', '2024-02-15 04:43:06'),
(552, 'en', 'shipping_method_list', 'Shipping Method List', '2024-02-15 04:43:06', '2024-02-15 04:43:06'),
(553, 'en', 'add_method', 'Add Method', '2024-02-15 04:43:06', '2024-02-15 04:43:06'),
(554, 'en', 'add_new_shipping_method', 'Add New Shipping Method', '2024-02-15 04:43:06', '2024-02-15 04:43:06'),
(555, 'en', 'update_shipping_method', 'Update Shipping Method', '2024-02-15 04:43:06', '2024-02-15 04:43:06'),
(556, 'en', 'shipping_method', 'Shipping method', '2024-02-15 04:43:06', '2024-02-15 04:43:06'),
(557, 'en', 'shipping_delivary', 'Shipping Delivary', '2024-02-15 04:43:07', '2024-02-15 04:43:07'),
(558, 'en', 'shipping_delivary_list', 'Shipping Delivary List', '2024-02-15 04:43:07', '2024-02-15 04:43:07'),
(559, 'en', 'search_by_namemethod', 'Search by name,method', '2024-02-15 04:43:07', '2024-02-15 04:43:07'),
(560, 'en', 'add_delivery_method', 'Add Delivery Method', '2024-02-15 04:43:07', '2024-02-15 04:43:07'),
(561, 'en', 'manage_shipping_delivery', 'Manage Shipping Delivery', '2024-02-15 04:43:07', '2024-02-15 04:43:07'),
(562, 'en', 'currency_list', 'Currency List', '2024-02-15 04:43:09', '2024-02-15 04:43:09'),
(563, 'en', 'add_new_currency', 'Add New Currency', '2024-02-15 04:43:09', '2024-02-15 04:43:09'),
(564, 'en', 'symbol', 'Symbol', '2024-02-15 04:43:09', '2024-02-15 04:43:09'),
(565, 'en', 'rate', 'Rate', '2024-02-15 04:43:09', '2024-02-15 04:43:09'),
(566, 'en', 'enter_symbol', 'Enter Symbol', '2024-02-15 04:43:09', '2024-02-15 04:43:09'),
(567, 'en', 'exchange_rate', 'Exchange Rate', '2024-02-15 04:43:09', '2024-02-15 04:43:09'),
(568, 'en', 'update_currency', 'Update Currency', '2024-02-15 04:43:09', '2024-02-15 04:43:09'),
(569, 'en', 'manage_currencies', 'Manage currencies', '2024-02-15 04:43:09', '2024-02-15 04:43:09'),
(570, 'en', 'social_login_credentials', 'Social Login Credentials', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(571, 'en', 'social_login_settings', 'Social Login Settings', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(572, 'en', 'google_auth_credentials_setup', 'Google Auth Credentials Setup', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(573, 'en', 'client_id', 'Client Id', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(574, 'en', 'enter_google_client_id', 'Enter Google Client Id', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(575, 'en', 'client_secret', 'Client Secret', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(576, 'en', 'enter_google_secret_key', 'Enter Google Secret Key', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(577, 'en', 'authorized_redirect_uris', 'Authorized redirect URIs', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(578, 'en', 'facebook_auth_credentials_setup', 'Facebook Auth Credentials Setup', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(579, 'en', 'enter_facebook_client_id', 'Enter Facebook Client Id', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(580, 'en', 'enter_facebook_secret_key', 'Enter Facebook Secret Key', '2024-02-15 04:43:12', '2024-02-15 04:43:12'),
(581, 'en', 'plugin_settings', 'Plugin Settings', '2024-02-15 04:43:14', '2024-02-15 04:43:14'),
(582, 'en', 'plugins', 'Plugins', '2024-02-15 04:43:14', '2024-02-15 04:43:14'),
(583, 'en', 'tawk_to', 'Tawk To', '2024-02-15 04:43:14', '2024-02-15 04:43:14'),
(584, 'en', 'enter_tawk', 'Enter Tawk', '2024-02-15 04:43:14', '2024-02-15 04:43:14'),
(585, 'en', 'app_settings', 'App Settings', '2024-02-15 04:43:16', '2024-02-15 04:43:16'),
(586, 'en', 'onboard_page_content', 'Onboard Page Content', '2024-02-15 04:43:16', '2024-02-15 04:43:16'),
(587, 'en', 'add_more', 'Add More', '2024-02-15 04:43:16', '2024-02-15 04:43:16'),
(588, 'en', 'heading', 'heading', '2024-02-15 04:43:16', '2024-02-15 04:43:16'),
(589, 'en', 'enter_heading', 'Enter Heading', '2024-02-15 04:43:16', '2024-02-15 04:43:16'),
(590, 'en', 'description', 'Description', '2024-02-15 04:43:16', '2024-02-15 04:43:16'),
(591, 'en', 'type_here', 'Type Here', '2024-02-15 04:43:16', '2024-02-15 04:43:16'),
(592, 'en', 'chat_gpt_settings', 'Chat Gpt Settings', '2024-02-15 04:43:19', '2024-02-15 04:43:19'),
(593, 'en', 'open_ai_api_key', 'Open AI Api Key', '2024-02-15 04:43:19', '2024-02-15 04:43:19'),
(594, 'en', 'api_key', 'Api Key', '2024-02-15 04:43:19', '2024-02-15 04:43:19'),
(595, 'en', 'manage_ip', 'Manage Ip', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(596, 'en', 'ip_list', 'IP List', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(597, 'en', 'filter_by_ip', 'Filter by IP', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(598, 'en', 'ip', 'IP', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(599, 'en', 'blocked', 'Blocked', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(600, 'en', 'last_visited', 'Last Visited', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(601, 'en', 'add_ip', 'Add IP', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(602, 'en', 'ip_address', 'IP Address', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(603, 'en', 'enter_ip', 'Enter IP', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(604, 'en', 'visistor_agent_info', 'Visistor Agent Info', '2024-02-15 04:43:23', '2024-02-15 04:43:23'),
(605, 'en', 'dos_security_settings', 'Dos Security Settings', '2024-02-15 04:43:26', '2024-02-15 04:43:26'),
(606, 'en', 'prevent_dos_attack', 'Prevent Dos Attack', '2024-02-15 04:43:26', '2024-02-15 04:43:26'),
(607, 'en', 'if_there_are_more_than', 'If there are more than', '2024-02-15 04:43:26', '2024-02-15 04:43:26'),
(608, 'en', 'attempts_in', 'attempts in', '2024-02-15 04:43:26', '2024-02-15 04:43:26'),
(609, 'en', 'second', 'second', '2024-02-15 04:43:26', '2024-02-15 04:43:26'),
(610, 'en', 'show_captcha', 'Show Captcha', '2024-02-15 04:43:26', '2024-02-15 04:43:26'),
(611, 'en', 'block_ip', 'Block Ip', '2024-02-15 04:43:26', '2024-02-15 04:43:26'),
(612, 'en', 'updated_successfully', 'Updated Successfully', '2024-02-15 04:43:33', '2024-02-15 04:43:33'),
(613, 'en', 'item_deleted_succesfully', 'Item deleted succesfully', '2024-02-15 04:43:41', '2024-02-15 04:43:41'),
(614, 'en', 'update_system', 'Update System', '2024-02-15 04:43:48', '2024-02-15 04:43:48'),
(615, 'en', 'system_update', 'System Update', '2024-02-15 04:43:48', '2024-02-15 04:43:48'),
(616, 'en', 'update_application', 'Update Application', '2024-02-15 04:43:48', '2024-02-15 04:43:48'),
(617, 'en', 'current_version', 'Current Version', '2024-02-15 04:43:48', '2024-02-15 04:43:48'),
(618, 'en', 'upload_zip_file', 'Upload Zip file', '2024-02-15 04:43:49', '2024-02-15 04:43:49'),
(619, 'en', 'update_now', 'Update Now', '2024-02-15 04:43:49', '2024-02-15 04:43:49'),
(620, 'en', 'server_information', 'Server Information', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(621, 'en', 'php_versions', 'Php versions', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(622, 'en', 'larvel_versions', 'Larvel versions', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(623, 'en', 'http_host', 'Http host', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(624, 'en', 'phpini_config', 'php.ini Config', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(625, 'en', 'config_name', 'Config Name', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(626, 'en', 'current', 'Current', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(627, 'en', 'recommended', 'Recommended', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(628, 'en', 'file_uploads', 'File uploads', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(629, 'en', 'on', 'On', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(630, 'en', 'max_file_uploads', 'Max File Uploads', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(631, 'en', 'allow_url_fopen', 'Allow url Fopen', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(632, 'en', 'max_execution_time', 'Max Execution time', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(633, 'en', 'max_input_time', 'Max Input time', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(634, 'en', 'max_input_vars', 'Max Input vars', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(635, 'en', 'memory_limit', 'Memory limit', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(636, 'en', 'extensions', 'Extensions', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(637, 'en', 'extension_name', 'Extension Name', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(638, 'en', 'file__folder_permissions', 'File & Folder Permissions', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(639, 'en', 'file_or_folder', 'File or Folder', '2024-02-15 04:43:52', '2024-02-15 04:43:52'),
(640, 'en', 'no_product_available_in_your_cart', 'No Product Available In Your Cart', '2024-02-15 04:43:55', '2024-02-15 04:43:55'),
(641, 'en', 'look_like_youre_lost', 'Look like you\'re lost', '2024-02-15 04:44:30', '2024-02-15 04:44:30'),
(642, 'en', 'we_cant_seem_to_find_the_page_that_youre_looking_for', 'We can\'t seem to find the page that you\'re looking for', '2024-02-15 04:44:30', '2024-02-15 04:44:30'),
(643, 'en', 'go_to_home', 'Go to Home', '2024-02-15 04:44:30', '2024-02-15 04:44:30'),
(644, 'en', 'not_found', 'Not Found', '2024-02-15 04:44:30', '2024-02-15 04:44:30'),
(645, 'en', 'all', 'All', '2024-02-15 04:45:15', '2024-02-15 04:45:15'),
(646, 'en', 'top_categories', 'Top Categories', '2024-02-15 04:45:19', '2024-02-15 04:45:19'),
(647, 'en', 'search_by_title', 'Search by title', '2024-02-15 04:58:24', '2024-02-15 04:58:24'),
(648, 'en', 'blog_categories', 'Blog Categories', '2024-02-15 04:58:24', '2024-02-15 04:58:24'),
(649, 'en', 'recent_posts', 'RECENT POSTS', '2024-02-15 04:58:24', '2024-02-15 04:58:24'),
(650, 'en', 'top_brands', 'Top Brands', '2024-02-15 05:01:51', '2024-02-15 05:01:51'),
(651, 'en', 'new_products', 'New products', '2024-02-15 05:02:06', '2024-02-15 05:02:06'),
(652, 'en', 'sort_by', 'Sort By:', '2024-02-15 05:02:06', '2024-02-15 05:02:06'),
(653, 'en', 'sort_by_default', 'SORT BY DEFAULT', '2024-02-15 05:02:06', '2024-02-15 05:02:06'),
(654, 'en', 'price_high_to_low', 'Price (High to low)', '2024-02-15 05:02:06', '2024-02-15 05:02:06'),
(655, 'en', 'price_low_to_high', 'Price low to High', '2024-02-15 05:02:06', '2024-02-15 05:02:06'),
(656, 'en', 'showing', 'Showing', '2024-02-15 05:02:06', '2024-02-15 05:02:06'),
(657, 'en', 'of', 'of', '2024-02-15 05:02:06', '2024-02-15 05:02:06'),
(658, 'en', 'results', 'Results', '2024-02-15 05:02:06', '2024-02-15 05:02:06'),
(659, 'en', 'sign_in', 'Sign In', '2024-02-15 05:04:05', '2024-02-15 05:04:05'),
(660, 'en', 'shop', 'Shop', '2024-02-15 05:04:18', '2024-02-15 05:04:18'),
(661, 'en', 'all_shops', 'All Shops', '2024-02-15 05:04:18', '2024-02-15 05:04:18'),
(662, 'en', 'all_digital_products', 'All digital products', '2024-02-15 05:04:39', '2024-02-15 05:04:39'),
(663, 'en', 'filter_by_category', 'Filter By Category', '2024-02-15 05:04:39', '2024-02-15 05:04:39'),
(664, 'en', 'total', 'Total', '2024-02-15 05:04:39', '2024-02-15 05:04:39'),
(665, 'en', 'products_found', 'products found', '2024-02-15 05:04:39', '2024-02-15 05:04:39'),
(666, 'en', 'invalid_order', 'Invalid Order', '2024-02-15 05:06:19', '2024-02-15 05:06:19'),
(667, 'en', 'to_track_your_order_please_enter_your_order_id_in_the_box_belowand_press_the_track_button_this_was_given_to_you_on_yourreceipt_and_in_the_confirmation_email_you_should_have_received', 'To track your order please enter your Order ID in the box below				and press the “Track Button”. This was given to you on your				receipt and in the confirmation email you should have received', '2024-02-15 05:06:25', '2024-02-15 05:06:25'),
(668, 'en', 'tracking_id_', 'TRACKING ID ', '2024-02-15 05:06:25', '2024-02-15 05:06:25'),
(669, 'en', 'billing_email', 'BILLING EMAIL', '2024-02-15 05:06:25', '2024-02-15 05:06:25'),
(670, 'en', 'email_you_using_during_checkout', 'Email you using during checkout', '2024-02-15 05:06:25', '2024-02-15 05:06:25'),
(671, 'en', 'track_now', 'Track Now', '2024-02-15 05:06:25', '2024-02-15 05:06:25'),
(672, 'en', 'your_name', 'Your Name', '2024-02-15 05:06:38', '2024-02-15 05:06:38'),
(673, 'en', 'your_email', 'Your Email', '2024-02-15 05:06:38', '2024-02-15 05:06:38'),
(674, 'en', '_message', ' Message', '2024-02-15 05:06:38', '2024-02-15 05:06:38'),
(675, 'en', 'eamil', 'Eamil', '2024-02-15 05:06:38', '2024-02-15 05:06:38'),
(676, 'en', 'frequently_asked_questions', 'Frequently asked questions', '2024-02-15 05:06:52', '2024-02-15 05:06:52'),
(677, 'en', 'information', 'Information', '2024-02-15 05:06:52', '2024-02-15 05:06:52'),
(678, 'en', 'sales_question', 'Sales Question', '2024-02-15 05:06:52', '2024-02-15 05:06:52'),
(679, 'en', 'usage_guides', 'Usage Guides', '2024-02-15 05:06:52', '2024-02-15 05:06:52'),
(680, 'en', 'your_subject', 'Your subject', '2024-02-15 05:08:22', '2024-02-15 05:08:22'),
(681, 'en', 'your_message_here', 'Your Message Here', '2024-02-15 05:08:22', '2024-02-15 05:08:22'),
(682, 'en', 'admin_dashboard', 'Admin Dashboard', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(683, 'en', 'wellcome_back', 'Wellcome Back', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(684, 'en', 'tasks_to_be_done', 'Tasks to be done!', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(685, 'en', 'setup', 'Setup', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(686, 'en', 'mail_configuration__used_for_sending_emails', 'Mail Configuration - used for sending emails', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(687, 'en', 'ai_configuration__used_for_generating_content_using_open_ai', 'AI Configuration - used for generating content using open AI', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(688, 'en', 'total_earnings', 'Total Earnings', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(689, 'en', 'subscription_payment', 'Subscription Payment', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(690, 'en', 'order_payment', 'Order Payment', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(691, 'en', 'withdraw_amount', 'Withdraw Amount', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(692, 'en', 'total_customers', 'Total Customers', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(693, 'en', 'total_sellers', 'Total Sellers', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(694, 'en', 'canceld_orders', 'Canceld Orders', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(695, 'en', 'monthly_order_insight', 'Monthly Order Insight', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(696, 'en', 'latest_orders', 'Latest Orders', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(697, 'en', 'top_selling_products', 'Top Selling Products', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(698, 'en', 'orders_insight', 'Orders Insight', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(699, 'en', 'total_orders', 'Total Orders', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(700, 'en', 'physical_orders', 'Physical Orders', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(701, 'en', 'product_insight', 'Product Insight', '2024-02-15 05:08:32', '2024-02-15 05:08:32'),
(702, 'en', 'latest_transactions', 'Latest Transactions', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(703, 'en', 'earning_insight', 'Earning Insight', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(704, 'en', 'web_visitors_insight', 'Web Visitors Insight', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(705, 'en', 'total_order', 'Total Order', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(706, 'en', 'physical_order', 'Physical Order', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(707, 'en', 'physical_product', 'Physical Product', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(708, 'en', 'total_sell', 'Total Sell', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(709, 'en', 'payment_charge', 'Payment Charge', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(710, 'en', 'withdraw_charge', 'Withdraw Charge', '2024-02-15 05:08:33', '2024-02-15 05:08:33'),
(711, 'en', 'manage_staff', 'Manage Staff', '2024-02-15 05:08:35', '2024-02-15 05:08:35'),
(712, 'en', 'staff_list', 'Staff List', '2024-02-15 05:08:35', '2024-02-15 05:08:35'),
(713, 'en', 'add_new_staff', 'Add New Staff', '2024-02-15 05:08:35', '2024-02-15 05:08:35'),
(714, 'en', 'update_role', 'Update Role', '2024-02-15 05:10:42', '2024-02-15 05:10:42'),
(715, 'en', 'roles_updated_succesfully', 'Roles Updated Succesfully', '2024-02-15 05:10:52', '2024-02-15 05:10:52'),
(716, 'en', 'general_setting_has_been_updated', 'General Setting has been updated', '2024-02-15 05:25:05', '2024-02-15 05:25:05'),
(717, 'en', 'seo_content_has_been_update', 'Seo content has been update', '2024-02-15 05:26:40', '2024-02-15 05:26:40'),
(718, 'en', 'deleted_successfully', 'Deleted Successfully', '2024-02-15 05:27:18', '2024-02-15 05:27:18'),
(719, 'en', 'mail_updated', 'Mail updated', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(720, 'en', 'email_gateways', 'Email Gateways', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(721, 'en', 'updtae_gateway', 'Updtae Gateway', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(722, 'en', 'driver', 'Driver', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(723, 'en', 'enter_driver', 'Enter Driver', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(724, 'en', 'host', 'Host', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(725, 'en', 'enter_host', 'Enter Host', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(726, 'en', 'port', 'Port', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(727, 'en', 'enter_port', 'Enter Port', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(728, 'en', 'encryption', 'Encryption', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(729, 'en', 'enter_encryption', 'Enter Encryption', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(730, 'en', 'enter_mail_username', 'Enter Mail Username', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(731, 'en', 'enter_mail_password', 'Enter Mail Password', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(732, 'en', 'from_address', 'From Address', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(733, 'en', 'enter_from_address', 'Enter From Address', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(734, 'en', 'from_name', 'From Name', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(735, 'en', 'enter_from_name', 'Enter From Name', '2024-02-15 05:27:26', '2024-02-15 05:27:26'),
(736, 'en', 'smtp_mail_method_has_been_updated', 'SMTP mail method has been updated', '2024-02-15 05:27:44', '2024-02-15 05:27:44'),
(737, 'en', 'app_key', 'App Key', '2024-02-15 05:28:11', '2024-02-15 05:28:11'),
(738, 'en', 'enter_app_key', 'Enter App key', '2024-02-15 05:28:11', '2024-02-15 05:28:11'),
(739, 'en', 'sendgrid_api_mail_method_has_been_updated', 'SendGrid Api mail method has been updated', '2024-02-15 05:28:15', '2024-02-15 05:28:15'),
(740, 'en', 'social_login_setting_has_been_updated', 'Social login setting has been updated', '2024-02-15 05:28:36', '2024-02-15 05:28:36'),
(741, 'en', 'plugin_settings_updated', 'Plugin Settings Updated', '2024-02-15 05:29:24', '2024-02-15 05:29:24'),
(742, 'en', 'ai_configuration_updated', 'AI Configuration Updated', '2024-02-15 05:33:07', '2024-02-15 05:33:07'),
(743, 'en', 'frontend_section_updated_successfully', 'Frontend Section Updated Successfully', '2024-02-15 05:33:46', '2024-02-15 05:33:46'),
(744, 'en', 'payment_method_update', 'Payment method update', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(745, 'en', 'payment_gateway_setting', 'Payment Gateway Setting', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(746, 'en', 'select_currency', 'Select Currency', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(747, 'en', 'ngn', 'NGN', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(748, 'en', 'bdt', 'BDT', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(749, 'en', 'inr', 'INR', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(750, 'en', 'usd', 'USD', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(751, 'en', 'percent_charge', 'Percent Charge', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(752, 'en', 'enter_number', 'Enter Number', '2024-02-15 05:46:33', '2024-02-15 05:46:33'),
(753, 'en', 'payment_method_has_been_updated', 'Payment method has been updated', '2024-02-15 05:46:56', '2024-02-15 05:46:56'),
(754, 'en', 'sign_up', 'Sign Up', '2024-02-15 05:54:58', '2024-02-15 05:54:58'),
(755, 'en', 'enter_your_email', 'Enter your email', '2024-02-15 05:54:58', '2024-02-15 05:54:58'),
(756, 'en', 'examplegmailcom', 'example@gmail.com', '2024-02-15 05:54:58', '2024-02-15 05:54:58'),
(757, 'en', 'forgot_password', 'Forgot Password', '2024-02-15 05:54:58', '2024-02-15 05:54:58'),
(758, 'en', 'enter_your_password', 'Enter your password', '2024-02-15 05:54:58', '2024-02-15 05:54:58'),
(759, 'en', 'confirmation_password', 'Confirmation password', '2024-02-15 05:54:58', '2024-02-15 05:54:58'),
(760, 'en', 'please_enter_your_email', 'Please Enter Your Email', '2024-02-15 05:54:58', '2024-02-15 05:54:58'),
(761, 'en', 'or_sign_up_with', 'Or Sign Up With', '2024-02-15 05:54:58', '2024-02-15 05:54:58'),
(762, 'en', 'create_campaign', 'Create Campaign', '2024-02-15 05:59:20', '2024-02-15 05:59:20'),
(763, 'en', 'campaign_information', 'Campaign Information', '2024-02-15 05:59:20', '2024-02-15 05:59:20'),
(764, 'en', 'please_enter_a_name', 'Please Enter a Name', '2024-02-15 05:59:20', '2024-02-15 05:59:20'),
(765, 'en', 'discount_type', 'Discount Type', '2024-02-15 05:59:20', '2024-02-15 05:59:20'),
(766, 'en', 'select_discont_type', 'Select Discont Type', '2024-02-15 05:59:20', '2024-02-15 05:59:20'),
(767, 'en', 'discount_', 'Discount ', '2024-02-15 05:59:20', '2024-02-15 05:59:20'),
(768, 'en', 'start_date', 'Start Date', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(769, 'en', 'end_date', 'End Date', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(770, 'en', 'banner_image', 'Banner image', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(771, 'en', 'image_size_should_be', 'Image Size Should Be', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(772, 'en', 'campaign_prodcuts_sections', 'Campaign Product Sections', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(773, 'en', 'cash_on_delivary', 'Cash On Delivary', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(774, 'en', 'show_on_home_page', 'Show On Home Page', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(775, 'en', 'discount_can_not_be_greater_than_100', 'Discount Can Not Be Greater Than 100', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(776, 'en', 'select_discount_type_first', 'Select Discount Type First', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(777, 'en', 'discount', 'Discount', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(778, 'en', 'discont_type', 'Discont Type', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(779, 'en', 'quantity', 'Quantity', '2024-02-15 05:59:21', '2024-02-15 05:59:21'),
(780, 'en', 'add_new_physical_product', 'Add new physical product', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(781, 'en', 'products', 'Products', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(782, 'en', 'create_product', 'Create Product', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(783, 'en', 'product_basic_information', 'Product Basic Information', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(784, 'en', 'enter_product_title', 'Enter product title', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(785, 'en', 'regular_price', 'Regular price', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(786, 'en', 'product_price', 'Product Price', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(787, 'en', 'discount____________________________________________percentage', 'Discount                                            Percentage(%)', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(788, 'en', 'discount_percentage', 'Discount Percentage', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(789, 'en', 'purchase____________________________________________quantity_min', 'Purchase                                            Quantity (Min)', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(790, 'en', 'min_qty_should_be_1', 'Min Qty should be 1', '2024-02-15 06:00:26', '2024-02-15 06:00:26'),
(791, 'en', 'purchase____________________________________________quantity_max', 'Purchase                                            Quantity (Max)', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(792, 'en', 'max_qty_unlimited_number', 'Max qty unlimited number', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(793, 'en', 'short_description', 'Short Description', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(794, 'en', 'product_description', 'Product Description', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(795, 'en', 'product_gallery', 'Product Gallery', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(796, 'en', 'thumbnail_image', 'Thumbnail Image', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(797, 'en', 'gallery_image', 'Gallery Image', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(798, 'en', 'product_stock', 'Product Stock', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(799, 'en', 'attributes', 'Attributes', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(800, 'en', 'choose_the_attributes', 'Choose the attributes', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(801, 'en', 'meta_data', 'Meta Data', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(802, 'en', 'meta____________________________________________title', 'Meta                                            title', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(803, 'en', 'enter__meta_title', 'Enter  meta title', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(804, 'en', 'enter_meta_description', 'Enter Meta Description', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(805, 'en', 'status_section', 'Status Section', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(806, 'en', 'product_status', 'Product Status', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(807, 'en', 'new', 'New', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(808, 'en', 'published', 'Published', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(809, 'en', 'todays_deal', 'Todays Deal', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(810, 'en', 'product_categories', 'Product Categories', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(811, 'en', 'sub_category', 'Sub Category', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(812, 'en', 'product_brand', 'Product Brand', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(813, 'en', 'product_warranty_policy', 'Product Warranty Policy', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(814, 'en', 'add_warranty_policy_of_product', 'Add Warranty Policy of Product', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(815, 'en', 'product_shipping', 'Product Shipping', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(816, 'en', 'shipping_areazonecountry', 'Shipping Area/Zone/Country', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(817, 'en', 'select_item', 'Select Item', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(818, 'en', 'type_keywords', 'Type Keywords', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(819, 'en', 'choose_value', 'Choose Value', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(820, 'en', 'discount_can_not_be_greater_than_original_price', 'Discount Can Not Be Greater Than Original Price', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(821, 'en', 'select_value', 'Select Value', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(822, 'en', 'choice_title', 'Choice Title', '2024-02-15 06:00:27', '2024-02-15 06:00:27'),
(823, 'en', 'global_email_template_has_been_updated', 'Global email template has been updated', '2024-02-15 06:07:40', '2024-02-15 06:07:40'),
(824, 'en', 'updtae_template', 'Updtae Template', '2024-02-15 06:07:48', '2024-02-15 06:07:48'),
(825, 'en', 'email_template_has_been_updated', 'Email template has been updated', '2024-02-15 06:07:51', '2024-02-15 06:07:51'),
(826, 'en', 'sign_in_to_continue_to', 'Sign in to continue to', '2024-02-27 07:41:08', '2024-02-27 07:41:08'),
(827, 'en', 'enter_username', 'Enter username', '2024-02-27 07:41:08', '2024-02-27 07:41:08'),
(828, 'en', 'enter_password', 'Enter Password', '2024-02-27 07:41:08', '2024-02-27 07:41:08'),
(829, 'en', 'remember_me', 'Remember me', '2024-02-27 07:41:08', '2024-02-27 07:41:08'),
(830, 'en', 'last_cron_run', 'Last Cron Run', '2024-02-27 07:41:11', '2024-02-27 07:41:11'),
(831, 'en', 'ai_assistance', 'AI Assistance', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(832, 'en', 'result', 'Result', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(833, 'en', 'copy', 'Copy', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(834, 'en', 'download', 'Download', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(835, 'en', 'your_content', 'Your Content', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(836, 'en', 'your_prompt_goes_here__', 'Your prompt goes here .... ', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(837, 'en', 'what_do_you_want_to_do', 'What do you want to do', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(838, 'en', 'here_are_some_ideas', 'Here are some ideas', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(839, 'en', 'more', 'More', '2024-02-27 07:41:12', '2024-02-27 07:41:12'),
(840, 'en', 'back', 'Back', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(841, 'en', 'rewrite_it', 'Rewrite It', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(842, 'en', 'adjust_tone', 'Adjust Tone', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(843, 'en', 'choose_language', 'Choose Language', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(844, 'en', 'select_language', 'Select Language', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(845, 'en', 'or', 'OR', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(846, 'en', 'make_your_own_prompt', 'Make Your Own Prompt', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(847, 'en', 'ex_make_it_more_friendly_', 'Ex: Make It more friendly ', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(848, 'en', 'insert', 'Insert', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(849, 'en', 'generate_with_ai', 'Generate With AI', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(850, 'en', 'text_copied_to_clipboard', 'Text copied to clipboard!', '2024-02-27 07:41:13', '2024-02-27 07:41:13'),
(851, 'en', 'put_your_email_address', 'Put your email address', '2024-02-27 07:45:44', '2024-02-27 07:45:44'),
(852, 'en', 'get_news', 'Get News', '2024-02-27 07:45:44', '2024-02-27 07:45:44'),
(853, 'en', 'do_not_show_this_popup_again', 'Do not show this popup again', '2024-02-27 07:45:44', '2024-02-27 07:45:44'),
(854, 'en', 'sub_heading', 'Sub Heading', '2024-02-27 07:53:52', '2024-02-27 07:53:52'),
(855, 'en', 'icon', 'Icon', '2024-02-27 07:53:52', '2024-02-27 07:53:52'),
(856, 'en', 'view_icons', 'View icons', '2024-02-27 07:53:52', '2024-02-27 07:53:52'),
(857, 'en', 'frontend_preloader', 'Frontend Preloader', '2024-03-05 08:47:59', '2024-03-05 08:47:59'),
(858, 'en', 'file_field_is_required', 'File field is required', '2024-03-05 08:49:49', '2024-03-05 08:49:49'),
(859, 'en', 'reset_password', 'Reset Password', '2024-03-05 08:54:18', '2024-03-05 08:54:18'),
(860, 'en', 'password_reset', 'Password Reset', '2024-03-05 08:54:18', '2024-03-05 08:54:18'),
(861, 'en', 'check_your_email_password_reset_code_sent_successfully', 'Check your email password reset code sent successfully', '2024-03-05 08:54:21', '2024-03-05 08:54:21'),
(862, 'en', 'account_verification', 'Account Verification', '2024-03-05 08:54:21', '2024-03-05 08:54:21'),
(863, 'en', 'enter_verify_code', 'Enter Verify Code', '2024-03-05 08:54:21', '2024-03-05 08:54:21'),
(864, 'en', 'enter_code', 'Enter code', '2024-03-05 08:54:21', '2024-03-05 08:54:21'),
(865, 'en', 'category__subcategory', 'Category - Subcategory', '2024-03-05 08:56:24', '2024-03-05 08:56:24'),
(866, 'en', 'search_by_nameusername_or_email', 'Search by name,username or email', '2024-03-05 11:03:02', '2024-03-05 11:03:02'),
(867, 'en', 'no_data_found', 'No data found', '2024-03-05 11:06:43', '2024-03-05 11:06:43'),
(868, 'en', 'write_a_review', 'Write a review', '2024-03-05 11:08:12', '2024-03-05 11:08:12'),
(869, 'en', 'write_your_word', 'Write Your Word', '2024-03-05 11:08:12', '2024-03-05 11:08:12'),
(870, 'en', 'todays_deal_products', 'Todays Deal products', '2024-03-05 11:08:46', '2024-03-05 11:08:46'),
(871, 'en', 'write_your_custom_prompt', 'Write your custom prompt', '2024-03-14 09:08:06', '2024-03-14 09:08:06'),
(872, 'en', 'do_not_close_window_while_proecessing', 'Do not close window while proecessing', '2024-03-14 09:08:06', '2024-03-14 09:08:06'),
(873, 'en', 'frontend_page_update', 'Frontend page update', '2024-03-14 09:11:45', '2024-03-14 09:11:45'),
(874, 'en', 'update_page', 'Update Page', '2024-03-14 09:11:45', '2024-03-14 09:11:45'),
(875, 'en', 'the_id_field_is_required', 'The Id Field Is Required', '2024-03-14 09:12:00', '2024-03-14 09:12:00'),
(876, 'en', 'status_update_failed', 'Status Update Failed', '2024-03-14 09:12:00', '2024-03-14 09:12:00'),
(877, 'en', 'status_updated_successfully', 'Status Updated Successfully', '2024-03-14 09:12:00', '2024-03-14 09:12:00'),
(878, 'en', 'frontend_new_page_has_been_created', 'Frontend new page has been created.', '2024-03-14 09:15:14', '2024-03-14 09:15:14'),
(879, 'en', 'page_has_been_deleted', 'Page has been deleted.', '2024-03-14 09:15:16', '2024-03-14 09:15:16'),
(880, 'en', 'accept__continue', 'Accept & Continue', '2024-03-14 09:15:39', '2024-03-14 09:15:39'),
(881, 'en', 'register_here', 'Register Here', '2024-03-14 09:15:51', '2024-03-14 09:15:51'),
(882, 'en', 'i_accept', 'I Accept', '2024-03-14 09:16:19', '2024-03-14 09:16:19'),
(883, 'en', 'terms_and_conditions', 'Terms and Conditions', '2024-03-14 09:16:26', '2024-03-14 09:16:26'),
(884, 'en', 'notification_templates', 'Notification Templates', '2024-03-18 08:04:42', '2024-03-18 08:04:42'),
(885, 'en', 'sms_configuration', 'SMS Configuration', '2024-03-18 08:04:42', '2024-03-18 08:04:42'),
(886, 'en', 'sms_gateway', 'SMS Gateway', '2024-03-18 08:04:42', '2024-03-18 08:04:42'),
(887, 'en', 'otp__login_configuration', 'OTP & Login Configuration', '2024-03-18 08:04:52', '2024-03-18 08:04:52'),
(888, 'en', 'otp_with_mobile', 'OTP with mobile', '2024-03-18 08:04:52', '2024-03-18 08:04:52'),
(889, 'en', 'otp_with_email', 'OTP with email', '2024-03-18 08:04:52', '2024-03-18 08:04:52'),
(890, 'en', 'login_with_password', 'Login with password', '2024-03-18 08:04:52', '2024-03-18 08:04:52'),
(891, 'en', 'enter_your_phone', 'Enter your phone', '2024-03-18 08:06:28', '2024-03-18 08:06:28'),
(892, 'en', 'sms_gateway_list', 'SMS Gateway list', '2024-03-18 08:09:45', '2024-03-18 08:09:45'),
(893, 'en', 'sms_global_template', 'SMS Global template', '2024-03-18 08:09:50', '2024-03-18 08:09:50'),
(894, 'en', 'sms_template_short_code', 'SMS Template Short Code', '2024-03-18 08:09:50', '2024-03-18 08:09:50'),
(895, 'en', 'notification_template_list', 'Notification Template List', '2024-03-18 08:09:59', '2024-03-18 08:09:59'),
(896, 'en', 'update_template', 'Update Template', '2024-03-18 08:10:01', '2024-03-18 08:10:01'),
(897, 'en', 'sms_body', 'SMS Body', '2024-03-18 08:10:01', '2024-03-18 08:10:01'),
(898, 'en', 'email_body', 'Email Body', '2024-03-18 08:10:01', '2024-03-18 08:10:01'),
(899, 'en', 'default_sms_gateway_has_been_updated', 'Default SMS Gateway has been updated', '2024-03-18 08:10:11', '2024-03-18 08:10:11'),
(900, 'en', 'api_gateway_update', 'API Gateway update', '2024-03-19 03:24:28', '2024-03-19 03:24:28'),
(901, 'en', 'sms_gateways', 'SMS Gateways', '2024-03-19 03:24:28', '2024-03-19 03:24:28'),
(902, 'en', 'update_gateway', 'Update Gateway', '2024-03-19 03:24:29', '2024-03-19 03:24:29'),
(903, 'en', 'enter_valid_api_data', 'Enter Valid API Data', '2024-03-19 03:24:29', '2024-03-19 03:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `billing_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_code` mediumint DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_login_infos`
--

CREATE TABLE `user_login_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint UNSIGNED NOT NULL,
  `ip_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_blocked` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Yes: 1, No: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `ip_address`, `agent_info`, `is_blocked`, `created_at`, `updated_at`) VALUES
(2, '127.0.0.1', '{\"country\":\"\",\"city\":\"\",\"code\":\"\",\"long\":\"\",\"lat\":\"\",\"os_platform\":\"Windows 10\",\"browser\":\"Chrome\",\"ip\":\"127.0.0.1\",\"time\":\"19-03-2024 09:26:02 AM\"}', '0', '2024-02-15 04:43:54', '2024-03-19 03:26:02');

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` int UNSIGNED DEFAULT NULL,
  `method_id` int UNSIGNED DEFAULT NULL,
  `currency_id` int UNSIGNED DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `rate` double(20,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(18,8) DEFAULT NULL,
  `trx_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'success : 1, pending : 2, reject : 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `max_limit` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `duration` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `user_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_name_unique` (`name`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uid_2` (`uid`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaigns_name_unique` (`name`),
  ADD UNIQUE KEY `campaigns_slug_unique` (`slug`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `campaign_products`
--
ALTER TABLE `campaign_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `compare_product_lists`
--
ALTER TABLE `compare_product_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `digital_product_attributes`
--
ALTER TABLE `digital_product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `digital_product_attribute_values`
--
ALTER TABLE `digital_product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `exclusive_offers`
--
ALTER TABLE `exclusive_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `feature_products`
--
ALTER TABLE `feature_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flash_deals_name_unique` (`name`),
  ADD UNIQUE KEY `flash_deals_slug_unique` (`slug`),
  ADD KEY `flash_deals_uid_index` (`uid`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frontends_name_unique` (`name`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `menu_categories`
--
ALTER TABLE `menu_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_latters`
--
ALTER TABLE `news_latters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `page_setups`
--
ALTER TABLE `page_setups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_unique_code_unique` (`unique_code`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `pricing_plans`
--
ALTER TABLE `pricing_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `product_shipping_deliveries`
--
ALTER TABLE `product_shipping_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `refund_methods`
--
ALTER TABLE `refund_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_username_unique` (`username`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`),
  ADD UNIQUE KEY `sellers_phone_unique` (`phone`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `seller_password_resets`
--
ALTER TABLE `seller_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `seller_shop_settings`
--
ALTER TABLE `seller_shop_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seller_shop_settings_name_unique` (`name`),
  ADD UNIQUE KEY `seller_shop_settings_email_unique` (`email`),
  ADD UNIQUE KEY `seller_shop_settings_phone_unique` (`phone`);

--
-- Indexes for table `shipping_deliveries`
--
ALTER TABLE `shipping_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipping_methods_name_unique` (`name`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supports_support_category_unique` (`support_category`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `support_files`
--
ALTER TABLE `support_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_uid_index` (`uid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `user_login_infos`
--
ALTER TABLE `user_login_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_products`
--
ALTER TABLE `campaign_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compare_product_lists`
--
ALTER TABLE `compare_product_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `digital_product_attributes`
--
ALTER TABLE `digital_product_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `digital_product_attribute_values`
--
ALTER TABLE `digital_product_attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `exclusive_offers`
--
ALTER TABLE `exclusive_offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_products`
--
ALTER TABLE `feature_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1112;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_categories`
--
ALTER TABLE `menu_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `news_latters`
--
ALTER TABLE `news_latters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_setups`
--
ALTER TABLE `page_setups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugin_settings`
--
ALTER TABLE `plugin_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricing_plans`
--
ALTER TABLE `pricing_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_shipping_deliveries`
--
ALTER TABLE `product_shipping_deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_methods`
--
ALTER TABLE `refund_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_password_resets`
--
ALTER TABLE `seller_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_shop_settings`
--
ALTER TABLE `seller_shop_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_deliveries`
--
ALTER TABLE `shipping_deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_files`
--
ALTER TABLE `support_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=904;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login_infos`
--
ALTER TABLE `user_login_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
