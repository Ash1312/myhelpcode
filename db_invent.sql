-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2020 at 09:04 AM
-- Server version: 5.6.48-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_invent`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `reference_no`, `warehouse_id`, `note`, `attachment`, `created_by`, `updated_by`, `updated_at`, `count_id`) VALUES
(1, '2020-07-13 08:23:00', '2020/07/0001', 1, '', NULL, 1, NULL, NULL, NULL),
(2, '2020-07-13 08:31:00', '2020/07/0002', 1, '', NULL, 5, NULL, NULL, NULL),
(3, '2020-07-14 04:16:00', '2020/07/0003', 1, '', NULL, 5, NULL, NULL, NULL),
(4, '2020-07-14 04:17:00', '2020/07/0004', 1, '', NULL, 5, NULL, NULL, NULL),
(5, '2020-07-14 04:18:00', '2020/07/0005', 1, '', NULL, 5, NULL, NULL, NULL),
(6, '2020-07-14 04:19:00', '2020/07/0006', 1, '', NULL, 5, NULL, NULL, NULL),
(7, '2020-07-14 04:20:00', '2020/07/0007', 1, '', NULL, 5, NULL, NULL, NULL),
(8, '2020-07-14 04:21:00', '2020/07/0008', 1, '', NULL, 5, NULL, NULL, NULL),
(9, '2020-07-14 04:34:00', '2020/07/0009', 1, '', NULL, 5, NULL, NULL, NULL),
(10, '2020-07-14 04:36:00', '2020/07/0010', 1, '', NULL, 5, NULL, NULL, NULL),
(11, '2020-07-14 04:38:00', '2020/07/0011', 1, '', NULL, 5, NULL, NULL, NULL),
(12, '2020-07-14 04:40:00', '2020/07/0012', 1, '', NULL, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustment_items`
--

INSERT INTO `sma_adjustment_items` (`id`, `adjustment_id`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `serial_no`, `type`) VALUES
(1, 1, 1, NULL, 20.0000, 1, '', 'addition'),
(2, 2, 2, NULL, 4.0000, 1, '', 'addition'),
(3, 3, 3, NULL, 6.0000, 1, '', 'addition'),
(4, 4, 4, NULL, 6.0000, 1, '', 'addition'),
(5, 5, 5, NULL, 8.0000, 1, '', 'addition'),
(6, 6, 6, NULL, 9.0000, 1, '', 'addition'),
(7, 7, 7, NULL, 8.0000, 1, '', 'addition'),
(8, 8, 8, NULL, 10.0000, 1, '', 'addition'),
(9, 9, 9, NULL, 5.0000, 1, '', 'addition'),
(10, 9, 10, NULL, 16.0000, 1, '', 'addition'),
(11, 10, 16, NULL, 12.0000, 1, '', 'addition'),
(12, 10, 17, NULL, 10.0000, 1, '', 'addition'),
(13, 11, 12, NULL, 4.0000, 1, '', 'addition'),
(14, 11, 13, NULL, 10.0000, 1, '', 'addition'),
(15, 11, 11, NULL, 30.0000, 1, '', 'addition'),
(16, 12, 14, NULL, 8.0000, 1, '', 'addition'),
(17, 12, 15, NULL, 8.0000, 1, '', 'addition');

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(2, 'BedSheet', 'BedSheet', NULL, 0, 'bedsheet', '-'),
(3, 'Clothing', 'Clothing', NULL, 0, 'clothing', '-'),
(4, 'Women', 'Women', NULL, 3, 'women', '-'),
(5, 'Men', 'Men', NULL, 3, 'men', '-'),
(6, 'Kids', 'kids', NULL, 3, 'kids', '-');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'saleem@tecdiary.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL, NULL),
(4, 4, 'supplier', NULL, NULL, 'Arshad', 'Faislabad', '', 'flate C-205 Welcome Tarace block 19, Gulistan-e-Johar', 'Faisalabad', 'Punjab', '75290', 'Pakistan', '03008690427', 'farhan.j935@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', 1.0000, 0, NULL),
(2, 'EUR', 'EURO', 0.7340, 0, NULL),
(3, 'Rs', 'Pakistan Ruppee', 1.0000, 0, 'Rs');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p></p>', '2014-08-15 13:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `returns-index` tinyint(1) DEFAULT '0',
  `returns-add` tinyint(1) DEFAULT '0',
  `returns-edit` tinyint(1) DEFAULT '0',
  `returns-delete` tinyint(1) DEFAULT '0',
  `returns-email` tinyint(1) DEFAULT '0',
  `returns-pdf` tinyint(1) DEFAULT '0',
  `reports-tax` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2020-07-05 13:39:27', 1, 10000.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2020-07-14 00:05:50', 5, 1000.0000, 'close', 1000.0000, 0, 0, 1000.0000, 0, 0, '', '2020-07-14 00:06:57', NULL, 5),
(3, '2020-07-14 00:21:50', 3, 1000.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.35',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.4.35', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(1, 'AL20-CKVD-1001', 'Digital chickenkari Veil Dupatta 90/70', 1, 1800.0000, 2699.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 20.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'digital-chickenkari-veil-dupatta-9070', NULL, 0.0000, NULL, 0, 0, 'S1', 0),
(2, 'AL20-CKVD1003', 'Bin-ilyas Print boring work', 1, 1550.0000, 2150.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 4.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'bin-ilyas-print-boring-work', NULL, 0.0000, NULL, 0, 0, 'S3', 0),
(3, 'AL20-CKBCD-4001', 'Chicken kari shafon dupata print shirt Bareeze print', 1, 1625.0000, 2299.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 6.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'chicken-kari-shafon-dupata-print-shirt-bareeze-print', NULL, 0.0000, NULL, 0, 0, 'S4', 0),
(4, 'AL20-MC-5001', 'Manat cut work dupata print shirt', 1, 1625.0000, 2299.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 6.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'manat-cut-work-dupata-print-shirt', NULL, 0.0000, NULL, 0, 0, 'S5', 0),
(5, 'AL20-DBCK-6001', 'Digital Boring Chickenkari Front stone Lawn 100/100', 1, 1850.0000, 2799.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 8.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'digital-boring-chickenkari-front-stone-lawn-100100', NULL, 0.0000, NULL, 0, 0, 'S6', 0),
(6, 'AL20-DLCD-7001', 'Digital Lawn Shafoon Dupata 80-80 ', 1, 1100.0000, 1699.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 9.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'digital-lawn-shafoon-dupata-80-80', NULL, 0.0000, NULL, 0, 0, 'S7', 0),
(7, 'AL20-DCBD-8001', 'Digital Cotail Lawn Bamber Dupatta', 1, 1600.0000, 2399.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 8.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'digital-cotail-lawn-bamber-dupatta', NULL, 0.0000, NULL, 0, 0, 'S8', 0),
(8, 'AL20-DLBD-9001', 'Digital 90/70 Lawn Bamber Dupatta', 1, 1500.0000, 2399.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 10.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'digital-9070-lawn-bamber-dupatta', NULL, 0.0000, NULL, 0, 0, 'S9', 0),
(9, 'AL20-SDA-10001', '80-80 Shafoon Dupatta Awami', 1, 775.0000, 1050.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 5.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, '80-80-shafoon-dupatta-awami', NULL, 0.0000, NULL, 0, 0, 'S10', 0),
(10, 'AL20-DK-1001', 'Digi Kurti 90/70', 1, 560.0000, 899.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 16.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'digi-kurti-9070', NULL, 0.0000, NULL, 0, 0, 'Digi Kurti 90/70', 0),
(11, 'AL20-SSK-20001', 'Sanasafinaz genuine kurti Self design', 1, 625.0000, 1099.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 30.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'sanasafinaz-genuine-kurti-self-design', NULL, 0.0000, NULL, 0, 0, 'K1', 0),
(12, 'AL20-PC-60001', 'Abid Faraz manan Brand 4 design pure cotton', 1, 500.0000, 799.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 4.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'abid-faraz-manan-brand-4-design-pure-cotton', NULL, 0.0000, NULL, 0, 0, 'K2', 0),
(13, 'AL20-PC-70001', 'Abid Firdous  Awami', 1, 480.0000, 699.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 10.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'abid-firdous-awami', NULL, 0.0000, NULL, 0, 0, 'K3', 0),
(14, 'AL20-T1-50001', 'Chicken kari poncha karahi trouser', 1, 375.0000, 599.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 8.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'chicken-kari-poncha-karahi-trouser', NULL, 0.0000, NULL, 0, 0, 'T1', 0),
(15, 'AL20-T2-52001', 'Chicken kari poncha karahi trouser', 1, 375.0000, 599.0000, 0.0000, 'no_image.png', 3, 4, '', '', '', '', '', '', 8.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'chicken-kari-poncha-karahi-trouser', NULL, 0.0000, NULL, 0, 0, 'T2', 0),
(16, 'AL20-MK-30001', 'Carizma Unstiched kids as well', 1, 900.0000, 1399.0000, 0.0000, 'no_image.png', 3, 6, '', '', '', '', '', '', 12.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'carizma-unstiched-kids-as-well', NULL, 0.0000, NULL, 0, 0, 'KD-1', 0),
(17, 'AL20-CK-40001', 'MariaB', 1, 900.0000, 1399.0000, 0.0000, 'no_image.png', 3, 6, '', '', '', '', '', '', 10.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'mariab', NULL, 0.0000, NULL, 0, 0, 'KD-2', 0),
(18, '1201', 'ALAYA 1201', 1, 650.0000, 1150.0000, 0.0000, 'no_image.png', 2, NULL, '', '', '', '', '', '', NULL, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'alaya-1201', NULL, 0.0000, NULL, 0, 0, '1201', 0),
(19, '1202', 'ALAYA 1202', 1, 650.0000, 1150.0000, 0.0000, 'no_image.png', 2, NULL, '', '', '', '', '', '', NULL, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'alaya-1202', NULL, 0.0000, NULL, 0, 0, '1202', 0),
(20, '1203', 'ALAYA 1203', 1, 775.0000, 1299.0000, 0.0000, 'no_image.png', 2, NULL, '', '', '', '', '', '', NULL, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'alaya-1203', NULL, 0.0000, NULL, 0, 0, '1203', 0),
(21, '02595827', 'airpords', 1, 1000.0000, 10000.0000, 0.0000, 'no_image.png', 2, NULL, '', '', '', '', '', '', NULL, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, '02595827', NULL, 0.0000, NULL, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_promos`
--

CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, NULL, NULL, 1, 'AL20-CKVD-1001', 'Digital chickenkari Veil Dupatta 90/70', NULL, 1800.0000, 20.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 36000.0000, 20.0000, '2020-07-12', 'received', 1800.0000, 1800.0000, 20.0000, NULL, NULL, 1, 'Pc', 20.0000, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 2, 'AL20-CKVD1003', 'Bin-ilyas Print boring work', NULL, 1550.0000, 4.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 6200.0000, 4.0000, '2020-07-12', 'received', 1550.0000, 1550.0000, 4.0000, NULL, NULL, 1, 'Pc', 4.0000, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 3, 'AL20-CKBCD-4001', 'Chicken kari shafon dupata print shirt Bareeze print', NULL, 1625.0000, 6.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 9750.0000, 6.0000, '2020-07-13', 'received', 1625.0000, 1625.0000, 6.0000, NULL, NULL, 1, 'Pc', 6.0000, NULL, NULL, NULL, NULL),
(4, NULL, NULL, 4, 'AL20-MC-5001', 'Manat cut work dupata print shirt', NULL, 1625.0000, 6.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 9750.0000, 6.0000, '2020-07-13', 'received', 1625.0000, 1625.0000, 6.0000, NULL, NULL, 1, 'Pc', 6.0000, NULL, NULL, NULL, NULL),
(5, NULL, NULL, 5, 'AL20-DBCK-6001', 'Digital Boring Chickenkari Front stone Lawn 100/100', NULL, 1850.0000, 8.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 14800.0000, 8.0000, '2020-07-13', 'received', 1850.0000, 1850.0000, 8.0000, NULL, NULL, 1, 'Pc', 8.0000, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 6, 'AL20-DLCD-7001', 'Digital Lawn Shafoon Dupata 80-80 ', NULL, 1100.0000, 9.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 9900.0000, 9.0000, '2020-07-13', 'received', 1100.0000, 1100.0000, 9.0000, NULL, NULL, 1, 'Pc', 9.0000, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 7, 'AL20-DCBD-8001', 'Digital Cotail Lawn Bamber Dupatta', NULL, 1600.0000, 8.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 12800.0000, 8.0000, '2020-07-13', 'received', 1600.0000, 1600.0000, 8.0000, NULL, NULL, 1, 'Pc', 8.0000, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 8, 'AL20-DLBD-9001', 'Digital 90/70 Lawn Bamber Dupatta', NULL, 1500.0000, 10.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 15000.0000, 10.0000, '2020-07-13', 'received', 1500.0000, 1500.0000, 10.0000, NULL, NULL, 1, 'Pc', 10.0000, NULL, NULL, NULL, NULL),
(9, NULL, NULL, 9, 'AL20-SDA-10001', '80-80 Shafoon Dupatta Awami', NULL, 775.0000, 5.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 3875.0000, 5.0000, '2020-07-13', 'received', 775.0000, 775.0000, 5.0000, NULL, NULL, 1, 'Pc', 5.0000, NULL, NULL, NULL, NULL),
(10, NULL, NULL, 10, 'AL20-DK-1001', 'Digi Kurti 90/70', NULL, 560.0000, 16.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 8960.0000, 16.0000, '2020-07-13', 'received', 560.0000, 560.0000, 16.0000, NULL, NULL, 1, 'Pc', 16.0000, NULL, NULL, NULL, NULL),
(11, NULL, NULL, 16, 'AL20-MK-30001', 'Carizma Unstiched kids as well', NULL, 900.0000, 12.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 10800.0000, 12.0000, '2020-07-13', 'received', 900.0000, 900.0000, 12.0000, NULL, NULL, 1, 'Pc', 12.0000, NULL, NULL, NULL, NULL),
(12, NULL, NULL, 17, 'AL20-CK-40001', 'MariaB', NULL, 900.0000, 10.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 9000.0000, 10.0000, '2020-07-13', 'received', 900.0000, 900.0000, 10.0000, NULL, NULL, 1, 'Pc', 10.0000, NULL, NULL, NULL, NULL),
(13, NULL, NULL, 12, 'AL20-PC-60001', 'Abid Faraz manan Brand 4 design pure cotton', NULL, 500.0000, 4.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 2000.0000, 4.0000, '2020-07-13', 'received', 500.0000, 500.0000, 4.0000, NULL, NULL, 1, 'Pc', 4.0000, NULL, NULL, NULL, NULL),
(14, NULL, NULL, 13, 'AL20-PC-70001', 'Abid Firdous  Awami', NULL, 480.0000, 10.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 4800.0000, 10.0000, '2020-07-13', 'received', 480.0000, 480.0000, 10.0000, NULL, NULL, 1, 'Pc', 10.0000, NULL, NULL, NULL, NULL),
(15, NULL, NULL, 11, 'AL20-SSK-20001', 'Sanasafinaz genuine kurti Self design', NULL, 625.0000, 30.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 18750.0000, 30.0000, '2020-07-13', 'received', 625.0000, 625.0000, 30.0000, NULL, NULL, 1, 'Pc', 30.0000, NULL, NULL, NULL, NULL),
(16, NULL, NULL, 14, 'AL20-T1-50001', 'Chicken kari poncha karahi trouser', NULL, 375.0000, 8.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 3000.0000, 8.0000, '2020-07-13', 'received', 375.0000, 375.0000, 8.0000, NULL, NULL, 1, 'Pc', 8.0000, NULL, NULL, NULL, NULL),
(17, NULL, NULL, 15, 'AL20-T2-52001', 'Chicken kari poncha karahi trouser', NULL, 375.0000, 8.0000, 1, 0.0000, 1, '0', NULL, NULL, NULL, 3000.0000, 8.0000, '2020-07-13', 'received', 375.0000, 375.0000, 8.0000, NULL, NULL, 1, 'Pc', 8.0000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('9d81f8b3c0ebad357143d5352fed7fc9d7b76f22', '103.255.4.62', 1593810319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333831303331393b6964656e746974797c733a31303a226172736861646b68616e223b757365726e616d657c733a31303a226172736861646b68616e223b656d61696c7c733a31393a226b7a6b616d617a6f6e40676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383039393336223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d52587ebfcf79a24c4ceb34ecab23d8dcf80566b', '103.255.4.62', 1593811013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333831313031333b7265717565737465645f706167657c733a353a2261646d696e223b),
('60b7df424f5b8f012023a1751b7b55b7e8c2a3b9', '103.255.4.62', 1593811013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333831313031333b),
('90cb58cdeea8c547524f0494f5f719036c995cad', '103.255.4.62', 1593811395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333831313339353b),
('bd35313d900faa3df5025625d6fb0c5695444495', '42.201.168.125', 1593869425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333836393236373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31303a226172736861646b68616e223b757365726e616d657c733a31303a226172736861646b68616e223b656d61696c7c733a31393a226b7a6b616d617a6f6e40676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383131303839223b6c6173745f69707c733a31323a223130332e3235352e342e3632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c5f8f35909e9a08b28595b0886e794be44970f09', '103.255.4.62', 1593811012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333831313031323b),
('cf11b43c7496c36612154928e46c730244550c70', '103.255.4.62', 1593811008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333831313030383b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('ed1492939294166e2c71487041e0a3fccdf67f49', '103.255.5.47', 1593931120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933313132303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383131313638223b6c6173745f69707c733a31323a223130332e3235352e342e3632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5f9d8996eac863e007559c246e1214f2bc0e8341', '103.255.5.47', 1593931002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933313030323b),
('0856c79bf58bdc293db5986bea82059e2faf8160', '103.255.5.47', 1593931002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933313030323b),
('9abb55628b9aa9c2e343594856c8df924ccd0773', '72.255.40.199', 1593931181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933313036363b6964656e746974797c733a31303a226172736861646b68616e223b757365726e616d657c733a31303a226172736861646b68616e223b656d61696c7c733a31393a226b7a6b616d617a6f6e40676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383639333337223b6c6173745f69707c733a31343a2234322e3230312e3136382e313235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539333933313138313b6572726f727c733a38323a225265676973746572206973206e6f74206f70656e2c20506c6561736520656e74657220746865206361736820696e2068616e6420616d6f756e7420616e6420636c69636b206f70656e207265676973746572223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('fe4be8d6229d63ed0b709112d8b79781d282f3f9', '103.255.5.47', 1593931676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933313637363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383131313638223b6c6173745f69707c733a31323a223130332e3235352e342e3632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539333933313136373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d30352030363a33393a3237223b),
('fa002aebeff6cb6eaa21935ca216c8df7874446c', '103.255.5.47', 1593932735, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933323733353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383131313638223b6c6173745f69707c733a31323a223130332e3235352e342e3632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539333933313836393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d30352030363a33393a3237223b),
('95666a963c953090496c32fa62d237d96a77a801', '103.255.5.47', 1593933068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333036383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383131313638223b6c6173745f69707c733a31323a223130332e3235352e342e3632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539333933313836393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d30352030363a33393a3237223b637372666b65797c733a383a226d69664b45364873223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22633857767970356a46695642734b714a67486155223b),
('148c4052cbc1fcebfdc4fa6f0b5bef5d23c224e1', '111.119.187.3', 1593933617, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333631373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383131313638223b6c6173745f69707c733a31323a223130332e3235352e342e3632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539333933313836393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d30352030363a33393a3237223b),
('307a74a78a2878e909a9eb0502ac935ceaa9efe1', '39.42.104.225', 1593933230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333135363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393332393839223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('43f6ebf6f63c7199a51d9a56ed29da06d5100110', '18.217.223.118', 1593933161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333136313b),
('ae457837e3e0129356fe20ebc354bed3e49e9007', '54.207.33.42', 1593933162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333136313b7265717565737465645f706167657c733a353a2261646d696e223b),
('9d55af98ba1d2b72b91e34a20df39fd981543217', '54.207.33.42', 1593933162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333136313b7265717565737465645f706167657c733a353a2261646d696e223b),
('07e5010158192b3f49adf38dc7aa33a7433a7928', '54.207.33.42', 1593933162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333136323b),
('d77021846a06ef627371fbe119cc722cff99d330', '111.119.187.3', 1593933975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333937353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383131313638223b6c6173745f69707c733a31323a223130332e3235352e342e3632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539333933313836393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d30352030363a33393a3237223b),
('66992fbc1eaac93cdccc1f29d3956b77fc936333', '111.119.187.3', 1593933977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333933333937353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383131313638223b6c6173745f69707c733a31323a223130332e3235352e342e3632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539333933313836393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d30352030363a33393a3237223b),
('34a2c9147eba0bf9278017d14f7ed4ac8882b0c9', '39.42.104.225', 1593975409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333937353430393b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393333313831223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('adcc2c96906c01b69f7392184f594cf9bf6a17ef', '3.101.0.4', 1593974759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333937343735393b),
('3c96ab1cf5480debc004c4463a0c3d8cda9004d7', '3.101.0.4', 1593974760, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333937343736303b),
('a31674022173334b30f23ea06c7604bdd28291b7', '54.207.33.42', 1593974761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333937343736313b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('7c1ffdcfa4d70ae1c82d9f297bafd936af5aae4b', '39.42.104.225', 1593975409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333937353430393b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393333313831223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a37393a223c703e5468652066696c6520796f752061726520617474656d7074696e6720746f2075706c6f6164206973206c6172676572207468616e20746865207065726d69747465642073697a652e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('06042adec7eddf9745e72944220f46a8ad9330f2', '18.217.223.118', 1593975412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333937353431313b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('d697529923801aead230b04704455b0a73d34968', '119.160.69.116', 1594048719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343034383630363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393332373930223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f604255906eeb595d5a110b520dc1447879c6349', '119.160.69.116', 1594061061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343036313036313b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('b641af2866af376351ab7abae50618d0a439cf44', '119.160.69.116', 1594061061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343036313036313b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('348a1f6dc729df55cb6bc8900fe95f35b694ee36', '39.42.14.187', 1594584820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538343832303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3ea34164423239eef48c8be0afd37d8fd9f53765', '3.101.0.4', 1594584153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538343135333b7265717565737465645f706167657c733a353a2261646d696e223b),
('27d229d38fcf745922edd64e233b22439f8a56b6', '18.217.223.118', 1594584153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538343135333b7265717565737465645f706167657c733a353a2261646d696e223b),
('9cdc00a786c686a8cd71a725d3f661a63bbe3f1d', '18.217.223.118', 1594584153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538343135333b),
('6a69a2f488e06c2bdae19a2e72fe9556ea27f24e', '3.101.0.4', 1594584153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538343135333b),
('8d3eedf7362ee964bcbea0e8c168c12d3dcf59a0', '39.42.14.187', 1594585209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538353230393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('e7d30c4389b3c8b086f0d23aa3412ab4ddd90bd4', '3.101.0.4', 1594584822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538343832323b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('aeacba5cf2c6ee269104f0987d898bb8e6669fd2', '18.217.223.118', 1594584822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538343832323b7265717565737465645f706167657c733a32313a2261646d696e2f70726f64756374732f656469742f31223b),
('5daac8b1c8453bebf1c2eb2708cde988bc515603', '111.119.187.47', 1594585398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538353339383b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393239363733223b6c6173745f69707c733a31323a223130332e3235352e352e3437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f539704fcda21d711d16999d822a984a9a69b230', '39.42.14.187', 1594585524, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538353532343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('bd5873714f35e6507140dec379e7f9581cf7e9a0', '111.119.187.47', 1594585706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538353730363b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393239363733223b6c6173745f69707c733a31323a223130332e3235352e352e3437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('883dc345225e1759ba3ae28220e9a66a862b5a5d', '3.101.0.4', 1594585460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538353436303b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('826865417088e9c3f95d852bdb69a2f87bed68d5', '39.42.14.187', 1594585866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538353836363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('1121f41d02bcbc6a12374d8a985124ef52d527e7', '111.119.187.47', 1594585780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538353730363b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393239363733223b6c6173745f69707c733a31323a223130332e3235352e352e3437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6a5814f07a64f3ee58243ba0e218597e2855cdfe', '39.42.14.187', 1594586315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538363331353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('509e28addbb6e538305cc09fe8127972aad75e2e', '39.42.14.187', 1594586626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538363632363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('31c708c836a78bbd55a9c2f3fd702ea6af4635e9', '3.101.0.4', 1594586317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538363331373b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('8b0c5b7545ba791c11f310f7aeb970bd5b5eef1d', '39.42.14.187', 1594587064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538373036343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('dcbb55a7cdf3e9e6f90f8977c9b080c8327b45f1', '39.42.14.187', 1594587390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538373339303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('c5f7ca0fd181fd5875deb73c5cbbcd46ce730c44', '18.217.223.118', 1594587066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538373036363b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('c848e80cc448f5e01c548a1fc544677a25cfebee', '18.217.223.118', 1594587066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538373036363b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('2313f51170220f87a4695e5f882953a72b54754a', '39.42.14.187', 1594587696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538373639363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('51ec6a1452f87086423b1802716294afbaa947b9', '39.42.14.187', 1594588083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538383038333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('3a62352a6b582d77eaebbc5a7d260af197cf5724', '18.217.223.118', 1594587698, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538373639383b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('6fb627cfbfe87421afc3470c6cedee657ab7a86a', '18.217.223.118', 1594587698, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538373639383b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('f41fa68ca2afa350209115e5e29c2c86b5fb0e7b', '39.42.14.187', 1594588390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538383339303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('97b141c66846bc87f2b3095f48e1335aa4fa79f0', '18.217.223.118', 1594588332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538383333323b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('1e92f8756d08c59292cb3f38eb84534f13833546', '18.217.223.118', 1594588332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538383333323b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('2b1d140af849f1536da899b4a3f47e8307fb26ef', '39.42.14.187', 1594588796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538383739363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('712561322333d913899f696c7b54094db812be8c', '39.42.14.187', 1594589100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538393130303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('e399ee7a643c984a26f235b9a1233dd4018df025', '39.42.14.187', 1594589140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538393130303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393734373836223b6c6173745f69707c733a31333a2233392e34322e3130342e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346461314d38765a434c7378534a416f774e596d223b),
('80be43891121223506e67b949ad90b65570265aa', '39.42.114.146', 1594589766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343538393534303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934303438363736223b6c6173745f69707c733a31343a223131392e3136302e36392e313136223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3be0a69afac7a401a28be6199bd7022a3f6f7dc6', '182.185.134.239', 1594600336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343630303333363b7265717565737465645f706167657c733a31353a2261646d696e2f707572636861736573223b),
('7089cb9ceed55a52ad59977aa7023183c4862f14', '103.255.4.5', 1594618985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343631383938353b7265717565737465645f706167657c733a32393a2261646d696e2f7265706f7274732f77617265686f7573655f73746f636b223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353835303731223b6c6173745f69707c733a31343a223131312e3131392e3138372e3437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('884eb8e744ccd1f8c498629745a318b8b593467d', '103.255.4.5', 1594623428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343632333432383b7265717565737465645f706167657c733a32393a2261646d696e2f7265706f7274732f77617265686f7573655f73746f636b223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353835303731223b6c6173745f69707c733a31343a223131312e3131392e3138372e3437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7635c794c949aafcf4893f84aaf25cfaf9b957c0', '103.255.4.5', 1594623461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343632333432383b7265717565737465645f706167657c733a32393a2261646d696e2f7265706f7274732f77617265686f7573655f73746f636b223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353835303731223b6c6173745f69707c733a31343a223131312e3131392e3138372e3437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3a97f4ead6defad83a3152cfe2e328e8b4bc7566', '110.39.198.138', 1594656770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635363737303b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6a791d7304569117482bf402dc81c24e9b3f82bb', '3.101.0.4', 1594654837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635343833373b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b),
('f1c63a92a921c4434f9f4806c1e3e983fefd580d', '3.101.0.4', 1594654838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635343833383b),
('d93ff17645b84ce7c799e2ee5ff7623f275c0821', '3.101.0.4', 1594654838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635343833383b),
('cb58a5d5fe196ef99d9e7e71d258af03f71d044b', '110.39.198.138', 1594657124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635373132343b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7021c4143926d32af59ffa5f940491a09cca749b', '3.101.0.4', 1594656772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635363737323b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('70a7be3be1eff3b7b588cabd6e97cad10965c96a', '110.39.198.138', 1594657481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635373438313b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f7f4631f549a4fc2d4549b39dd119b58f20c6bc3', '18.217.223.118', 1594657398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635373339383b7265717565737465645f706167657c733a33353a2261646d696e2f70726f64756374732f7175616e746974795f61646a7573746d656e7473223b),
('4951e8fed410a07bc84f1db3f259a9d3fe0d037c', '18.217.223.118', 1594657398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635373339383b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b),
('8549f057d0c5786ccf3415cd1f09b380c97bedb0', '110.39.198.138', 1594658053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635383035333b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a0ec251b23278a5e026aa06e2b191c1ed0803fa9', '110.39.198.138', 1594658387, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635383338373b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('73e1bc28f61dca40bc640a2601d526318027709e', '3.101.0.4', 1594658055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635383035353b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b),
('7f6f6de16addfb83b90ad2dd6f3f8234a42b28e6', '110.39.198.138', 1594659831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635393833313b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('855dd16933b301adf7696f237551839649423a16', '110.39.198.138', 1594660181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303138313b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343636303031373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31332031373a30353a3530223b),
('b0425581c54801ee7d87c912bf69d4119f70ae25', '3.101.0.4', 1594659833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635393833333b7265717565737465645f706167657c733a32393a2261646d696e2f7265706f7274732f77617265686f7573655f73746f636b223b),
('8e80385425a6207a64649d1c8ce1c403fddae644', '18.217.223.118', 1594659895, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343635393839353b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('b7de27c26842f8bb110157a8a6ab621cb06d0023', '110.39.198.138', 1594660487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303438373b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343636303031373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31332031373a30353a3530223b757365725f637372667c733a32303a224c456d366748545a4b6a5542724e787757565975223b),
('f50dc031b3305df00fdfef48d2def7234e192032', '110.39.198.138', 1594660260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303236303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353839353530223b6c6173745f69707c733a31333a2233392e34322e3131342e313436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dfb4879f40e10460600601b655ea31ee68794ffb', '110.39.198.138', 1594660590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303539303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353839353530223b6c6173745f69707c733a31333a2233392e34322e3131342e313436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a227a39644466774e754f57584a6b4849556a345268223b),
('af46f090a42303b88f11821dab382a03f8cf8913', '110.39.198.138', 1594660489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303438373b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f6164645f61646a7573746d656e74223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353834313538223b6c6173745f69707c733a31323a2233392e34322e31342e313837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343636303031373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31332031373a30353a3530223b757365725f637372667c733a32303a2232414f71506e30794e464a5648766a4c4b68666f223b),
('a430eaf1a5519003756b83b9e5cd2fd7fdb750f1', '166.62.74.193', 1594660537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303533373b),
('9e8bfaa72f567ac4217757649a37c6e7e2634480', '166.62.74.193', 1594660538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303533383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('90d5f2f4a044d79fbf9a719b5348693fef1fdf9e', '166.62.74.193', 1594660538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303533383b),
('19bedab8437e8d4d09038ed559ce94a07d1cc2a6', '166.62.74.193', 1594660538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303533383b7265717565737465645f706167657c733a353a2261646d696e223b),
('384f84e9b735bd555f4fc4fb591302ae6d2ab3f1', '166.62.74.193', 1594660538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303533383b),
('70f2d67f34366c80914fb4f019f47814fa55bf60', '110.39.198.138', 1594660903, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636303930333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353839353530223b6c6173745f69707c733a31333a2233392e34322e3131342e313436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a227a39644466774e754f57584a6b4849556a345268223b),
('0f155c043e3df563d45e06803b551326968e921d', '110.39.198.138', 1594661242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636313234323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353839353530223b6c6173745f69707c733a31333a2233392e34322e3131342e313436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a227a39644466774e754f57584a6b4849556a345268223b6c6173745f61637469766974797c693a313539343636303932333b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31332031373a32313a3530223b),
('85fdce37055d08116afe3a4ce45b6bfccc9ebc01', '110.39.198.138', 1594661696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636313639363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353839353530223b6c6173745f69707c733a31333a2233392e34322e3131342e313436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a227a39644466774e754f57584a6b4849556a345268223b6c6173745f61637469766974797c693a313539343636303932333b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31332031373a32313a3530223b),
('a15816cca98ea121a90a87404755cfb2471bf686', '110.39.198.138', 1594661696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343636313639363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353839353530223b6c6173745f69707c733a31333a2233392e34322e3131342e313436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a227a39644466774e754f57584a6b4849556a345268223b6c6173745f61637469766974797c693a313539343636303932333b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31332031373a32313a3530223b),
('11111d66b6d54fda0da4c17c1b236dab5b153b83', '119.160.101.39', 1594687738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343638373733373b7265717565737465645f706167657c733a353a2261646d696e223b),
('3fc0d7d252b70d67adfd44d8f051e22c91a17a19', '110.39.198.138', 1594749027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343734393032373b7265717565737465645f706167657c733a31393a2261646d696e2f7075726368617365732f616464223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934363534383431223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2269566238594c305a466d514853794f373378707a223b),
('82be98cbd67195546a3278b19fb5c03ced7bff74', '3.101.0.4', 1594743626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343734333632363b7265717565737465645f706167657c733a31393a2261646d696e2f7075726368617365732f616464223b),
('c74a30876f979ac8622a299d3a59e510c0fac13f', '3.101.0.4', 1594743626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343734333632363b),
('c65a483293ba8110585490dc4735d70f1e88edf6', '3.101.0.4', 1594743626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343734333632363b),
('2cde2d9476b4e3fc7660f9c1e4c65b9ffabbcb75', '110.39.198.138', 1594749049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343734393032373b7265717565737465645f706167657c733a31393a2261646d696e2f7075726368617365732f616464223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934363534383431223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2269566238594c305a466d514853794f373378707a223b),
('3394f923f9d9f4cd634effd74074beb0b2d56a66', '18.217.223.118', 1594749029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343734393032393b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('fc7779500e6722e400451e0ef6c419f07462e649', '110.39.198.138', 1594844112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343834343032383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31303a226172736861646b68616e223b757365726e616d657c733a31303a226172736861646b68616e223b656d61696c7c733a31393a226b7a6b616d617a6f6e40676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933393331313030223b6c6173745f69707c733a31333a2237322e3235352e34302e313939223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b0cceffb262d5ef6b56f1953937fe24d9c113a04', '110.39.198.138', 1594847100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343834373039383b7265717565737465645f706167657c733a353a2261646d696e223b),
('99e29f3c7f1e0aeb9ebff91afe72de423ec0dd1b', '110.39.198.138', 1595600748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630303734383b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('e9033768bb1ea7a1a8f4db0d9c5a655685e612bc', '18.217.223.118', 1595600251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630303235313b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('201f4b4c055d7bbddeac119b0953c945ec95d16e', '18.217.223.118', 1595600251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630303235313b),
('5a03cd6dd2ec24b9c47b2b2bbe9c3b17548b7d2d', '3.101.0.4', 1595600252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630303235323b),
('0971e65b10ef712824a5bcb854c372fd286393fe', '110.39.198.138', 1595600758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630303734383b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934373433363331223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c4ea437783f69d218e813528232d66f1491b1f76', '110.39.198.138', 1595609615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630393533303b7265717565737465645f706167657c733a32393a2261646d696e2f7265706f7274732f7175616e746974795f616c65727473223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353935363030373438223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cd568622aed5776f8931de4e9dd1fc0deb1d9656', '3.101.0.4', 1595609531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630393533313b7265717565737465645f706167657c733a32393a2261646d696e2f7265706f7274732f7175616e746974795f616c65727473223b),
('848b7c9693b08d45f64f2ef41e029077e8a8e14a', '3.101.0.4', 1595609532, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630393533323b),
('c7a7caa0ea9da6ddd631239f9e8f204fb86c2fa7', '3.101.0.4', 1595609532, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630393533323b),
('3c61232c0ed4ba8fc58a68946bc8c63523c4d620', '110.39.198.138', 1595948951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353934383934333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a363a2266617268616e223b757365726e616d657c733a363a2266617268616e223b656d61696c7c733a32313a2266617268616e2e6a39333540676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353935363039353335223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('5400d1d1b0b5bc055b6b467abbb28e5e00b9ef42', '18.217.223.118', 1595948946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353934383934353b7265717565737465645f706167657c733a353a2261646d696e223b),
('fb5d76944307b945631353701d48b531a9f230a2', '18.217.223.118', 1595948945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353934383934353b),
('69cb9e3f5f6f20e8636976abc6cc971474c5aa2d', '110.39.198.138', 1597164936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373136343933363b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('8093edb56df074fe45d273f5b1c2cbef3baa8be1', '35.225.82.182', 1597164938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373136343933383b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('a8fc400348aa02e2cf9ddc3d82ee5ad1b114c43a', '3.101.0.4', 1597164938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373136343933383b),
('8d183486024947c85497d934357ea73940edefa4', '104.37.31.39', 1597766657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373736363635363b),
('fb26624c0bcf63967b2cf709b5c2366b3b57d858', '18.217.223.118', 1597766657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373736363635373b),
('ef25f858193bfb1c5cbb2f45e96a805269011592', '135.14.238.250', 1597766657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373736363635373b),
('291b01015c45f71ca5fd5ca21a9628bfc290dcf0', '110.39.198.138', 1598294749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539383239343734393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31303a226172736861646b68616e223b757365726e616d657c733a31303a226172736861646b68616e223b656d61696c7c733a31393a226b7a6b616d617a6f6e40676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934383434303430223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539383239343139303b),
('5f442ddf656c9d87d079537dc7a169af20c2ef53', '110.39.198.138', 1598296384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539383239363338343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31303a226172736861646b68616e223b757365726e616d657c733a31303a226172736861646b68616e223b656d61696c7c733a31393a226b7a6b616d617a6f6e40676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934383434303430223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539383239343139303b),
('4b9e5fa2335e83db05bc46cc9b1daeb87505f2b4', '110.39.198.138', 1598296399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539383239363338343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31303a226172736861646b68616e223b757365726e616d657c733a31303a226172736861646b68616e223b656d61696c7c733a31393a226b7a6b616d617a6f6e40676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934383434303430223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539383239343139303b),
('46bc328bec3925ee2d95f04ce1e16f9a8f88d6ef', '111.119.187.41', 1599914253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393931343230353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934363539393832223b6c6173745f69707c733a31343a223131302e33392e3139382e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('ca79a1c2d1cec17d78dfa74cc8e73aa6c5ffcbed', '111.119.187.41', 1599914225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393931343232353b),
('6c6e2352bb7d239161b3b9e243e5b5a15a57718a', '111.119.187.41', 1599916042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393931363034323b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393134323532223b6c6173745f69707c733a31343a223131312e3131392e3138372e3431223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d7bae97a325183d300313d94a46ca91941741e86', '111.119.187.41', 1599917613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393931373631333b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393134323532223b6c6173745f69707c733a31343a223131312e3131392e3138372e3431223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c16c1a874a9cddd1abe4c2fe2fae0025ffc13d7f', '162.212.12.132', 1599914370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393931343336393b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('99b0f703e9ef4b959323d21fcc727436e9f800f7', '111.119.187.41', 1599919244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393931393234343b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393134323532223b6c6173745f69707c733a31343a223131312e3131392e3138372e3431223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('10f68043a216fc2d4f5b32ba8b725c4f35a86723', '111.119.187.41', 1599919261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393931393234343b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393134323532223b6c6173745f69707c733a31343a223131312e3131392e3138372e3431223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d26b5f3b954f6a1af900b05d0228e0184bc3947a', '119.63.138.173', 1601925111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630313932353131313b7265717565737465645f706167657c733a31313a2261646d696e2f73616c6573223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393134333635223b6c6173745f69707c733a31343a223131312e3131392e3138372e3431223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('41f9c6a210c617b3f5857dc3ead3fc588defa25d', '119.63.138.173', 1601925421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630313932353432313b7265717565737465645f706167657c733a31313a2261646d696e2f73616c6573223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393134333635223b6c6173745f69707c733a31343a223131312e3131392e3138372e3431223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313630313932353139363b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31332031373a32313a3530223b),
('31e00f568948510562b013a1c8a9026633ec363a', '119.63.138.173', 1601925478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630313932353432313b7265717565737465645f706167657c733a31313a2261646d696e2f73616c6573223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393134333635223b6c6173745f69707c733a31343a223131312e3131392e3138372e3431223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313630313932353139363b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31332031373a32313a3530223b),
('18721f9b9750d76531adb71bfd36f0cf7ed889d2', '111.119.187.5', 1601985174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630313938343938373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363031393234363631223b6c6173745f69707c733a31343a223131392e36332e3133382e313733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b5458756b4e39623343356e48644a53744f4734223b),
('54b663b0c2b1442a84d95d17f6a291804c73bd4a', '111.119.187.36', 1602596782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323539363737343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363031393834393935223b6c6173745f69707c733a31333a223131312e3131392e3138372e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('2de545b21f047bb9ac5420a36e275e5c557da22a', '119.153.111.198', 1602596780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323539363737383b7265717565737465645f706167657c733a353a2261646d696e223b),
('5cfa8c66926b8f7ca532891246a31ff021774f63', '111.119.161.4', 1602596791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323539363738393b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('fbf047ac838bb6f48b5fd2c7a497daa35a66b125', '119.63.138.127', 1602689911, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323638393930313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353936373831223b6c6173745f69707c733a31343a223131312e3131392e3138372e3336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('f0c994966be3a2f99940f1f37071941a23f48b60', '119.63.138.10', 1602699706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323639393730363b7265717565737465645f706167657c733a353a2261646d696e223b),
('92ad6281aaa2465d6cb91a4e592e2f478aa3eb26', '119.63.138.10', 1602700419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323730303431393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363839393130223b6c6173745f69707c733a31343a223131392e36332e3133382e313237223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('fc2f1c245d2a65f0051bdd465c3586de54641138', '119.63.138.10', 1602700425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323730303431393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363839393130223b6c6173745f69707c733a31343a223131392e36332e3133382e313237223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('79561ad257d826f65932840306f0879747db8798', '72.255.58.231', 1602753109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323735333130383b7265717565737465645f706167657c733a353a2261646d696e223b),
('19ac9b06a5668af23fa39dcafcbcf7e2da76fa64', '72.255.58.231', 1602753497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323735333439373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363939373036223b6c6173745f69707c733a31333a223131392e36332e3133382e3130223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('b2ef4b6e964e4e4a1084689bfab160741e85e77d', '72.255.58.231', 1602754338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323735343333383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363939373036223b6c6173745f69707c733a31333a223131392e36332e3133382e3130223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fa30d98c67391c79e5269b2a226397130403f8a3', '72.255.58.231', 1602754723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323735343732333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363939373036223b6c6173745f69707c733a31333a223131392e36332e3133382e3130223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a41194ec22c57900f1f01b7d07aadecf995c0c02', '72.255.58.231', 1602754724, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323735343732333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363939373036223b6c6173745f69707c733a31333a223131392e36332e3133382e3130223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cd6fd84e3b9c1383d894402b5b7e7d10819db8c6', '119.73.112.81', 1603018041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333031383034313b),
('db81776d6a815a42b5dbbda3b9fdd45210b99331', '119.73.112.81', 1603019279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333031393237393b),
('a9a4bee7caada1823ba278d4fca3f2be1f43f07c', '119.73.112.81', 1603019324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333031393237393b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363033303138303639223b6c6173745f69707c733a31333a223131392e37332e3131322e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a678f89e947f7060511be872e0ec417ebc9ce1d3', '119.73.112.90', 1603563272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333536333237323b7265717565737465645f706167657c733a353a2261646d696e223b),
('956d8c1c48245d9eea9d05569bee38a3a57efa15', '119.73.112.90', 1603563286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333536333237323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a22756d616972223b757365726e616d657c733a353a22756d616972223b656d61696c7c733a32363a22756d6169726b686f6b6861723139393740676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363033303139323739223b6c6173745f69707c733a31333a223131392e37332e3131322e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`, `use_code_for_slug`) VALUES
(1, 'logo2.png', 'logo3.png', 'AlayaCollections', 'english', 1, 0, 'USD', 1, 10, '3.4.35', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Africa/Abidjan', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'zkhalids', 'afade14c-1aee-43c1-b7a5-1883f1afd37e', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', 0, '-', 0, 1, 1, 'POP', 90, '', 0, 0, 'AN', 'dompdf', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2020-07-13 03:21:00', '', 1, 'full', 'beff9fda276744a6907a5dcec08115a9.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', 0.0000, '2'),
(2, 'VAT @10%', 'VAT10', 10.0000, '1'),
(3, 'GST @6%', 'GST', 6.0000, '1'),
(4, 'VAT @20%', 'VT20', 20.0000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'Pc', 'Per Pc', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x3130332e3235352e342e35, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'owner@tecdiary.com', NULL, NULL, NULL, NULL, 1351661704, 1594616418, 1, 'Zeeshan', 'Khalid', 'Alaya Collections', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 0x3131302e33392e3139382e313338, 0x3130332e3235352e342e3632, 'arshadkhan', 'd44b249f108f077847ab98834e66c0f3f4c98acf', NULL, 'kzkamazon@gmail.com', NULL, NULL, NULL, NULL, 1593809936, 1598294115, 1, 'Arshad', 'Khan', 'KZK LLC', '0', NULL, 'male', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(3, 0x3131392e37332e3131322e3930, 0x3130332e3235352e352e3437, 'umair', '9d224664c9c10b42333bf70b58a3f4c06e2ec919', NULL, 'umairkhokhar1997@gmail.com', NULL, NULL, NULL, '943a079a1c0875cd67addd97d675f254744d18b2', 1593932790, 1603563285, 1, 'Umair', 'Khokhar', 'KZK LLC', '0', NULL, 'male', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(4, NULL, 0x3131312e3131392e3138372e33, 'aliijaz', '7674ee8c0b87b0fbdd764c80f9744d44cd167b76', NULL, 'deargull@gmail.com', NULL, NULL, NULL, NULL, 1593932919, 1593932919, 1, 'Ali', 'Ijaz', 'KZK LLC', '0', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(5, 0x3131302e33392e3139382e313338, 0x3131312e3131392e3138372e33, 'farhan', '3ddaacbd734e7614853993ed0817dd6c742644b3', NULL, 'farhan.j935@gmail.com', NULL, NULL, NULL, '6d296ad184894f8979ad815879c66b5a44245d8a', 1593932989, 1595948951, 1, 'Farhan', 'Javaid', 'KZK LLC', '0', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3130332e3235352e342e3632, 'owner@tecdiary.com', '2020-07-03 20:55:17'),
(2, 2, NULL, 0x3130332e3235352e342e3632, 'arshadkhan', '2020-07-03 20:59:23'),
(3, 1, NULL, 0x3130332e3235352e342e3632, 'owner@tecdiary.com', '2020-07-03 21:10:08'),
(4, 2, NULL, 0x3130332e3235352e342e3632, 'arshadkhan', '2020-07-03 21:14:40'),
(5, 2, NULL, 0x3130332e3235352e342e3632, 'arshadkhan', '2020-07-03 21:18:09'),
(6, 1, NULL, 0x3130332e3235352e342e3632, 'owner@tecdiary.com', '2020-07-03 21:19:28'),
(7, 2, NULL, 0x34322e3230312e3136382e313235, 'arshadkhan', '2020-07-04 13:28:57'),
(8, 1, NULL, 0x3130332e3235352e352e3437, 'owner@tecdiary.com', '2020-07-05 06:14:33'),
(9, 2, NULL, 0x37322e3235352e34302e313939, 'arshadkhan', '2020-07-05 06:38:20'),
(10, 5, NULL, 0x33392e34322e3130342e323235, 'farhan', '2020-07-05 07:13:01'),
(11, 5, NULL, 0x33392e34322e3130342e323235, 'farhan', '2020-07-05 18:46:26'),
(12, 3, NULL, 0x3131392e3136302e36392e313136, 'umair', '2020-07-06 15:17:56'),
(13, 5, NULL, 0x33392e34322e31342e313837, 'farhan', '2020-07-12 20:02:38'),
(14, 1, NULL, 0x3131312e3131392e3138372e3437, 'owner@tecdiary.com', '2020-07-12 20:17:51'),
(15, 3, NULL, 0x33392e34322e3131342e313436, 'umair', '2020-07-12 21:32:30'),
(16, 1, NULL, 0x3130332e3235352e342e35, 'owner@tecdiary.com', '2020-07-13 05:00:18'),
(17, 5, NULL, 0x3131302e33392e3139382e313338, 'farhan', '2020-07-13 15:40:41'),
(18, 3, NULL, 0x3131302e33392e3139382e313338, 'umair', '2020-07-13 17:06:22'),
(19, 5, NULL, 0x3131302e33392e3139382e313338, 'farhan', '2020-07-14 16:20:31'),
(20, 2, NULL, 0x3131302e33392e3139382e313338, 'arshadkhan', '2020-07-15 20:14:00'),
(21, 5, NULL, 0x3131302e33392e3139382e313338, 'farhan', '2020-07-24 14:25:48'),
(22, 5, NULL, 0x3131302e33392e3139382e313338, 'farhan', '2020-07-24 16:52:15'),
(23, 5, NULL, 0x3131302e33392e3139382e313338, 'farhan', '2020-07-28 15:09:11'),
(24, 2, NULL, 0x3131302e33392e3139382e313338, 'arshadkhan', '2020-08-24 18:35:15'),
(25, 3, NULL, 0x3131312e3131392e3138372e3431, 'umair', '2020-09-12 12:37:32'),
(26, 3, NULL, 0x3131312e3131392e3138372e3431, 'umair', '2020-09-12 12:39:25'),
(27, 3, NULL, 0x3131392e36332e3133382e313733, 'umair', '2020-10-05 19:04:21'),
(28, 3, NULL, 0x3131312e3131392e3138372e35, 'umair', '2020-10-06 11:49:55'),
(29, 3, NULL, 0x3131312e3131392e3138372e3336, 'umair', '2020-10-13 13:46:21'),
(30, 3, NULL, 0x3131392e36332e3133382e313237, 'umair', '2020-10-14 15:38:30'),
(31, 3, NULL, 0x3131392e36332e3133382e3130, 'umair', '2020-10-14 18:21:46'),
(32, 3, NULL, 0x37322e3235352e35382e323331, 'umair', '2020-10-15 09:11:56'),
(33, 3, NULL, 0x3131392e37332e3131322e3831, 'umair', '2020-10-18 10:47:49'),
(34, 3, NULL, 0x3131392e37332e3131322e3831, 'umair', '2020-10-18 11:07:59'),
(35, 3, NULL, 0x3131392e37332e3131322e3930, 'umair', '2020-10-24 18:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, '210', 'Office', '<p>210 Second Floor Eden Town</p>', NULL, '012345678', '-', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 1, 1, 20.0000, NULL, 1800.0000),
(3, 2, 1, 4.0000, NULL, 1550.0000),
(4, 3, 1, 6.0000, NULL, 1625.0000),
(5, 4, 1, 6.0000, NULL, 1625.0000),
(6, 5, 1, 8.0000, NULL, 1850.0000),
(7, 6, 1, 9.0000, NULL, 1100.0000),
(8, 7, 1, 8.0000, NULL, 1600.0000),
(9, 8, 1, 10.0000, NULL, 1500.0000),
(10, 9, 1, 5.0000, NULL, 775.0000),
(11, 10, 1, 16.0000, NULL, 560.0000),
(12, 11, 1, 30.0000, NULL, 625.0000),
(13, 12, 1, 4.0000, NULL, 500.0000),
(14, 13, 1, 10.0000, NULL, 480.0000),
(15, 14, 1, 8.0000, NULL, 375.0000),
(16, 15, 1, 8.0000, NULL, 375.0000),
(17, 16, 1, 12.0000, NULL, 900.0000),
(18, 17, 1, 10.0000, NULL, 900.0000),
(19, 18, 1, 0.0000, NULL, 650.0000),
(20, 19, 1, 0.0000, NULL, 650.0000),
(21, 20, 1, 0.0000, NULL, 775.0000),
(22, 21, 1, 0.0000, NULL, 1000.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_id_name` (`product_id`,`name`);

--
-- Indexes for table `sma_promos`
--
ALTER TABLE `sma_promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_promos`
--
ALTER TABLE `sma_promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
