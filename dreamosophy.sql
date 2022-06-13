-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jun 08, 2022 at 04:13 PM
-- Server version: 8.0.28
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dreamosophy`
--
CREATE DATABASE IF NOT EXISTS `dreamosophy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `dreamosophy`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ritwik Math', 'ritwik@gmail.com', NULL, '$2y$10$zq0OpYPhya76WRcl50nrSe0qUS.E8kkb97.dBBJencf4Zx0FAqJI6', NULL, '2022-03-01 18:19:45', '2022-03-01 18:19:45'),
(2, 'Ritwik Math', 'ritwikmath@gmail.com', NULL, '$2y$10$fR/7DKyufT6mAEXmMrjPqup0eDAlbL36zHqDqzKYPCr/94bMys3sq', NULL, '2022-03-07 18:23:58', '2022-03-07 18:23:58'),
(3, 'Paul', 'paul@email.com', NULL, '$2y$10$bSJ0dcb8G/uozz504GJLgeZR2dZiC/khMfRNAlMas8fVK9enizzLa', NULL, '2022-03-14 16:52:32', '2022-03-14 16:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `blocked_users`
--

CREATE TABLE `blocked_users` (
  `id` bigint UNSIGNED NOT NULL,
  `blocked_by` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `dream_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bad_comment_intensity` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `dream_id`, `user_id`, `comment`, `created_at`, `updated_at`, `bad_comment_intensity`) VALUES
(1, 4, 2, 'Testing comment', '2022-02-12 15:32:30', '2022-02-12 15:32:30', 0),
(2, 5, 4, 'Testing comment', '2022-02-12 15:45:35', '2022-02-12 15:45:35', 0),
(3, 5, 3, 'Testing comment', '2022-02-12 15:46:06', '2022-02-12 15:46:06', 0),
(4, 5, 3, 'this is testing comment', '2022-02-12 15:46:33', '2022-02-12 15:46:33', 0),
(5, 4, 4, 'this is testing comment', '2022-02-12 15:49:59', '2022-02-12 15:49:59', 0),
(6, 4, 3, 'eqwedewdewqd', '2022-02-12 15:55:58', '2022-02-12 15:55:58', 0),
(7, 5, 2, 'Awesome dream', '2022-02-12 18:17:16', '2022-02-12 18:17:16', 0),
(8, 5, 2, 'efceacaec', '2022-02-16 14:47:08', '2022-02-16 14:47:08', 0),
(9, 6, 2, 'efwewfw', '2022-02-16 14:50:36', '2022-02-16 14:50:36', 0),
(10, 5, 2, 'fewfwefew', '2022-02-16 15:27:54', '2022-02-16 15:27:54', 0),
(11, 11, 8, 'Testing comment', '2022-02-22 18:07:11', '2022-02-22 18:07:11', 0),
(12, 11, 6, 'another testing comment', '2022-02-22 18:23:32', '2022-02-22 18:23:32', 0),
(13, 11, 5, 'testing comment in review', '2022-02-23 18:00:45', '2022-02-23 18:00:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dreams`
--

CREATE TABLE `dreams` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `watched_on` date NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `draft` tinyint(1) NOT NULL DEFAULT '0',
  `current_question_no` int NOT NULL DEFAULT '0',
  `garden_level` int NOT NULL DEFAULT '0',
  `bed_no` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dreams`
--

INSERT INTO `dreams` (`id`, `title`, `description`, `watched_on`, `location`, `user_id`, `created_at`, `updated_at`, `private`, `draft`, `current_question_no`, `garden_level`, `bed_no`) VALUES
(1, 'My new dream 5', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 1, '2022-02-10 20:54:32', '2022-02-22 15:56:31', 1, 0, 0, 1, 2),
(2, 'My new dream 2', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 1, '2022-02-10 20:54:42', '2022-02-15 20:49:23', 1, 0, 1, 0, 0),
(3, 'My new dream 3', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 1, '2022-02-10 20:54:51', '2022-02-10 20:54:51', 1, 1, 0, 0, 0),
(4, 'My new dream', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 3, '2022-02-12 15:28:21', '2022-02-16 15:41:24', 0, 0, 0, 0, 0),
(5, 'My new test dream', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 2, '2022-02-12 15:44:38', '2022-02-12 15:44:38', 0, 0, 0, 0, 0),
(6, 'My new date test dream', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 2, '2022-02-12 15:45:13', '2022-02-12 15:45:13', 0, 0, 0, 0, 0),
(7, 'My new dream 4', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 1, '2022-02-15 20:48:50', '2022-02-15 20:48:50', 1, 0, 0, 0, 0),
(8, 'My TESTING dream 4', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissimNullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 3, '2022-02-16 15:43:10', '2022-02-16 15:43:10', 0, 0, 0, 0, 0),
(9, 'rgergeg', 'ravrraer', '2020-02-20', 'rgvrv', 5, '2022-02-19 17:21:33', '2022-02-19 17:21:33', 0, 0, 0, 0, 0),
(10, 'Firsttimetesting', 'fafawfawf', '2020-02-20', 'dfsfsf', 5, '2022-02-20 15:48:13', '2022-02-20 15:48:13', 0, 1, 0, 0, 0),
(11, 'hello', 'fstrtrtrtr', '2020-02-20', 'vsdvd', 8, '2022-02-20 16:17:32', '2022-02-20 16:17:32', 0, 1, 0, 0, 0),
(12, 'First dream updated3', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-20 17:03:21', '2022-02-22 15:57:07', 1, 0, 0, 1, 1),
(13, 'My new dream 4', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-20 18:48:21', '2022-02-20 18:48:21', 0, 1, 0, 0, 0),
(14, 'Testing dream with bed and garden', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-22 15:35:21', '2022-02-22 15:35:21', 1, 0, 0, 0, 0),
(15, 'Testing dream with bed and garden', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-22 15:56:43', '2022-02-22 15:56:43', 1, 0, 0, 0, 0),
(16, 'testingnewdream', 'testing new dream', '2020-02-20', 'BGLR', 6, '2022-02-22 18:08:30', '2022-02-22 18:08:30', 0, 0, 0, 0, 0),
(17, 'Testing dream with bed and garden', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-23 15:12:09', '2022-02-23 15:12:09', 0, 0, 0, 0, 0),
(18, 'My new dream 7', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-25 15:54:41', '2022-02-25 15:54:41', 0, 0, 0, 1, 2),
(19, 'My new dream 7', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-25 15:54:52', '2022-02-25 15:54:52', 0, 0, 0, 1, 2),
(20, 'My new dream 78', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-25 16:32:49', '2022-02-25 16:32:49', 1, 0, 0, 1, 3),
(21, 'My new dream 89', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-25 16:32:56', '2022-02-25 16:32:56', 1, 0, 0, 1, 3),
(22, 'My new dream 96', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 8, '2022-02-25 16:33:06', '2022-02-25 16:33:06', 0, 0, 0, 1, 3),
(23, 'Testingthisnew1', 'teting new dreams in new 1', '2020-02-20', 'fefs', 9, '2022-02-26 17:22:38', '2022-03-06 05:53:40', 0, 0, 5, 1, 1),
(24, 'tryinganotherdream', 'tryinganotherdream', '2002-01-22', 'sfs', 9, '2022-02-26 17:23:18', '2022-03-06 05:30:42', 0, 0, 5, 1, 1),
(25, 'Mpostman dream', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 9, '2022-02-27 17:03:33', '2022-02-27 17:03:33', 0, 0, 0, 1, 3),
(26, 'tesing3rdream', 'fefsf efsf sf seff sef', '2020-02-20', 'gwesf', 9, '2022-02-27 18:08:08', '2022-03-06 15:03:40', 0, 0, 5, 1, 1),
(27, 'My new dream 11', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 1, '2022-02-28 06:40:48', '2022-02-28 06:40:48', 0, 0, 0, 1, 2),
(28, 'Mpostman dream ent oemo', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 10, '2022-03-01 18:18:18', '2022-03-01 18:18:18', 0, 0, 0, 1, 3),
(29, 'Mpostman dream ent oemo', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 10, '2022-03-01 18:18:24', '2022-03-06 16:42:56', 0, 0, 5, 1, 1),
(30, 'My new dream 11', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 9, '2022-03-05 18:49:42', '2022-03-05 18:49:42', 0, 0, 0, 1, 2),
(31, 'testindream5', 'efsdssdv', '2020-02-20', 'fefsfsf', 9, '2022-03-06 15:32:12', '2022-03-06 15:42:34', 0, 0, 3, 1, 2),
(32, 'fesff', 'fseffs', '2002-02-20', 'dsfsdf', 9, '2022-03-06 15:32:31', '2022-03-06 15:32:31', 1, 0, 0, 1, 2),
(33, 'Testingthisuserdream1', 'Testing this user dream1', '2022-03-07', 'bglr', 12, '2022-03-07 14:51:06', '2022-03-07 14:51:06', 0, 0, 0, 1, 1),
(34, 'tseting', 'fesefseff', '2022-03-07', 'errser', 12, '2022-03-07 15:00:28', '2022-03-07 18:14:22', 0, 0, 5, 1, 1),
(35, 'Testingnewdream', 'this is a testing dream and final for this bed. this is to show the working of portals', '2022-03-07', 'Bengalore', 12, '2022-03-07 18:16:57', '2022-03-07 18:16:57', 0, 0, 0, 1, 1),
(36, 'My new dream 2', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 9, '2022-03-18 17:08:05', '2022-03-18 17:13:11', 0, 0, 0, 1, 3),
(37, 'My new dream 2', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 9, '2022-03-18 17:10:11', '2022-03-18 17:13:56', 0, 0, 0, 1, 3),
(38, 'My new dream 11', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 9, '2022-03-18 17:10:17', '2022-03-18 17:10:17', 0, 0, 0, 1, 3),
(39, 'regd', 'sfesefesff', '2020-02-20', 'gesgse', 9, '2022-03-18 18:09:32', '2022-03-21 18:54:00', 0, 0, 6, 1, 4),
(40, 'adwawdadawdawd', 'awawdadww', '2022-02-22', 'awdawdawdawd', 21, '2022-03-20 09:53:35', '2022-03-20 09:53:35', 0, 0, 0, 1, 1),
(41, 'My new dream 11', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 22, '2022-03-23 15:56:31', '2022-03-23 16:03:53', 0, 0, 4, 1, 3),
(42, 'My new dream 11', 'Nullam ultrices sodales iaculis. Pellentesque convallis augue vel nulla lobortis fringilla. Quisque suscipit ornare orci vitae dignissim.', '2021-02-12', 'Nullam ultrices sodales iaculis.', 22, '2022-03-23 15:58:12', '2022-03-23 15:58:12', 0, 0, 0, 3, 2),
(43, 'wdadaw', 'hello', '2022-03-08', 'dawdawd', 22, '2022-03-23 16:02:37', '2022-03-23 16:03:01', 0, 0, 5, 1, 1),
(44, 'testingdreamonbed1', 'Testing dream in garden on bed one', '2020-01-11', 'Bglr', 22, '2022-03-24 18:18:24', '2022-03-24 18:20:48', 0, 0, 5, 1, 1),
(45, 'Friendstest1', 'Friends test 1', '2022-03-25', 'Ashland', 25, '2022-03-25 19:24:02', '2022-03-25 19:29:31', 0, 0, 4, 1, 3),
(46, 'Freetext1', 'Free test 1', '2022-03-25', 'ashland', 25, '2022-03-25 19:25:55', '2022-03-25 19:27:55', 0, 0, 5, 1, 1),
(47, 'Understandtest1', 'Understand Test 1', '2022-03-25', 'ashland', 25, '2022-03-25 19:30:43', '2022-03-25 19:31:47', 0, 0, 9, 1, 5),
(48, 'Friendstest1', 'Friends test 1', '2022-03-25', 'ashland', 25, '2022-03-25 19:33:09', '2022-03-26 11:13:51', 0, 0, 6, 1, 4),
(49, 'werwe', 'werwer', '2022-03-26', 'werwer', 25, '2022-03-26 11:07:50', '2022-03-26 11:17:36', 0, 0, 4, 1, 2),
(50, 'wqerwer', 'werwer', '2022-03-26', 'werwer', 25, '2022-03-26 11:22:27', '2022-03-26 11:23:28', 0, 0, 9, 1, 5),
(51, 'wer', 'wer', '2022-04-13', 'wer', 25, '2022-04-13 22:22:53', '2022-04-15 16:03:56', 0, 0, 5, 1, 1),
(52, 'dwa', 'wda', '2022-04-12', 'weq', 13, '2022-04-15 07:18:53', '2022-04-16 13:03:04', 0, 0, 5, 1, 1),
(53, 'qw', 'qwe', '2022-04-16', 'qwe', 13, '2022-04-16 13:04:33', '2022-04-16 13:05:21', 0, 0, 2, 1, 2),
(54, 'qw', 'qwe', '2022-04-16', 'qwe', 13, '2022-04-16 13:04:34', '2022-04-16 13:05:09', 0, 0, 4, 1, 2),
(55, 'qweqw', 'qwe', '2022-04-16', 'qwe', 13, '2022-04-16 13:06:19', '2022-04-16 13:07:19', 0, 0, 6, 1, 4),
(56, 'qwe', 'qwe', '2022-04-16', 'qwe', 13, '2022-04-16 13:08:30', '2022-04-16 13:08:46', 0, 0, 4, 1, 3),
(57, 'qwe', 'qwe', '2022-04-16', 'qwe', 13, '2022-04-16 13:09:04', '2022-04-16 13:09:24', 0, 0, 9, 1, 5),
(58, 'T5', 'TD', '2022-01-10', 'TL2', 34, '2022-06-03 12:17:05', '2022-06-03 12:17:05', 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `sent_by` bigint UNSIGNED NOT NULL,
  `received_by` bigint UNSIGNED NOT NULL,
  `status` enum('pending','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sender_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `sent_by`, `received_by`, `status`, `created_at`, `updated_at`, `sender_relation`, `receiver_relation`) VALUES
(1, 3, 2, 'accepted', '2022-02-11 17:12:52', '2022-02-11 17:13:51', NULL, NULL),
(2, 5, 2, 'pending', '2022-02-19 15:48:13', '2022-02-19 15:48:13', NULL, NULL),
(3, 6, 5, 'accepted', '2022-02-19 16:00:27', '2022-02-19 16:04:50', NULL, NULL),
(4, 5, 3, 'accepted', '2022-02-19 17:17:31', '2022-02-19 17:19:12', NULL, NULL),
(5, 8, 6, 'accepted', '2022-02-22 17:58:53', '2022-02-22 18:06:17', NULL, NULL),
(6, 8, 5, 'accepted', '2022-02-23 17:47:18', '2022-02-23 17:59:40', NULL, NULL),
(7, 10, 9, 'accepted', '2022-02-26 17:31:42', '2022-02-26 17:40:09', NULL, NULL),
(8, 12, 9, 'accepted', '2022-03-07 14:45:40', '2022-03-07 14:47:35', NULL, NULL),
(9, 22, 9, 'pending', '2022-03-23 15:22:04', '2022-03-23 15:22:04', NULL, NULL),
(10, 1, 24, 'pending', '2022-03-26 10:15:30', '2022-03-26 10:15:30', NULL, NULL),
(11, 13, 1, 'accepted', '2022-03-26 10:16:31', '2022-03-26 10:23:40', NULL, 'Partner');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `available_units` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `user_id`, `item_id`, `available_units`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 4, '2022-03-04 18:58:09', '2022-03-04 18:58:09'),
(2, 1, 1, 5, '2022-03-10 17:38:13', '2022-03-10 20:38:11'),
(3, 1, 4, 2, '2022-03-10 17:50:12', '2022-03-10 17:50:32'),
(4, 1, 5, 1, '2022-03-10 18:34:38', '2022-03-10 18:34:38'),
(5, 1, 10, 1, '2022-03-10 18:44:04', '2022-03-10 18:44:04'),
(6, 1, 23, 1, '2022-03-10 18:47:49', '2022-03-10 18:47:49'),
(7, 1, 37, 1, '2022-03-10 20:31:52', '2022-03-10 20:31:52'),
(8, 1, 6, 2, '2022-03-10 20:33:56', '2022-03-28 18:02:52'),
(9, 1, 16, 1, '2022-03-10 20:34:08', '2022-03-10 20:34:08'),
(10, 1, 12, 1, '2022-03-10 20:34:14', '2022-03-10 20:34:14'),
(11, 21, 4, 1, '2022-03-20 10:29:38', '2022-03-20 10:29:38'),
(12, 13, 1, 2, '2022-03-27 08:33:05', '2022-04-20 17:34:56'),
(13, 25, 3, 1, '2022-04-13 22:26:07', '2022-04-13 22:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discounted_cost` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `sku`, `cost`, `name`, `discounted_cost`, `created_at`, `updated_at`) VALUES
(1, 'UNI001', 1500, 'Unicorn', NULL, NULL, NULL),
(2, 'SQU001', 1500, 'Squirrel', NULL, NULL, NULL),
(3, 'BUT001', 1000, 'Butterfly 1', NULL, NULL, NULL),
(4, 'BUT002', 1000, 'Butterfly 2', NULL, NULL, NULL),
(5, 'SPA001', 1400, 'Sparrow', NULL, NULL, NULL),
(6, 'HUM001', 1000, 'Humming Bird 1', NULL, NULL, NULL),
(7, 'HUM002', 1000, 'Humming Bird 2', NULL, NULL, NULL),
(8, 'HUM003', 1000, 'Humming Bird 3', NULL, NULL, NULL),
(9, 'HUM004', 1000, 'Humming Bird 4', NULL, NULL, NULL),
(10, 'FLO001', 500, 'Flower Pot 1', NULL, NULL, NULL),
(11, 'FLO002', 500, 'Flower Pot 2', NULL, NULL, NULL),
(12, 'FLO003', 500, 'Flower Pot 3', NULL, NULL, NULL),
(13, 'DGT001', 300, 'Daisy Group Type 1', NULL, NULL, NULL),
(14, 'DGT002', 300, 'Daisy Group Type 2', NULL, NULL, NULL),
(15, 'DGT003', 300, 'Daisy Group Type 3', NULL, NULL, NULL),
(16, 'DGT004', 300, 'Daisy Group Type 4', NULL, NULL, NULL),
(17, 'DAT001', 200, 'Daisy Type 1', NULL, NULL, NULL),
(18, 'DAT002', 200, 'Daisy Type 2', NULL, NULL, NULL),
(19, 'DAT003', 200, 'Daisy Type 3', NULL, NULL, NULL),
(20, 'DAT004', 200, 'Daisy Type 4', NULL, NULL, NULL),
(21, 'HHLP01', 300, 'Holly Hock Light Pink', NULL, NULL, NULL),
(22, 'HHDP01', 300, 'Holly Hock Dark Pink', NULL, NULL, NULL),
(23, 'HHR001', 300, 'Holly Hock Red', NULL, NULL, NULL),
(24, 'HHW001', 300, 'Holly Hock White', NULL, NULL, NULL),
(25, 'SAV001', 400, 'Saintpaulia Violet', NULL, NULL, NULL),
(26, 'SLP001', 400, 'Saintpaulia Light Pink', NULL, NULL, NULL),
(27, 'SDP001', 400, 'Saintpaulia Dark Pink', NULL, NULL, NULL),
(28, 'TGT001', 500, 'Tulipa Group Type 1', NULL, NULL, NULL),
(29, 'TGT002', 500, 'Tulipa Group Type 2', NULL, NULL, NULL),
(30, 'TGT003', 500, 'Tulipa Group Type 3', NULL, NULL, NULL),
(31, 'TGT004', 500, 'Tulipa Group Type 4', NULL, NULL, NULL),
(32, 'TGT005', 500, 'Tulipa Group Type 5', NULL, NULL, NULL),
(33, 'TGT006', 500, 'Tulipa Group Type 6', NULL, NULL, NULL),
(34, 'TGT007', 500, 'Tulipa Group Type 7', NULL, NULL, NULL),
(35, 'TGT008', 500, 'Tulipa Group Type 8', NULL, NULL, NULL),
(36, 'TGT009', 500, 'Tulipa Group Type 9', NULL, NULL, NULL),
(37, 'TUT001', 200, 'Tulipa Type 1', NULL, NULL, NULL),
(38, 'TUT002', 200, 'Tulipa Type 2', NULL, NULL, NULL),
(39, 'TUT003', 200, 'Tulipa Type 3', NULL, NULL, NULL),
(40, 'TUT004', 200, 'Tulipa Type 4', NULL, NULL, NULL),
(41, 'TUT005', 200, 'Tulipa Type 5', NULL, NULL, NULL),
(42, 'TUT006', 200, 'Tulipa Type 6', NULL, NULL, NULL),
(43, 'TUT007', 200, 'Tulipa Type 7', NULL, NULL, NULL),
(44, 'TUT008', 200, 'Tulipa Type 8', NULL, NULL, NULL),
(45, 'TUT009', 200, 'Tulipa Type 9', NULL, NULL, NULL),
(46, 'VIT001', 400, 'Viola Type 1', NULL, NULL, NULL),
(47, 'VIT002', 400, 'Viola Type 2', NULL, NULL, NULL),
(48, 'VIT003', 400, 'Viola Type 3', NULL, NULL, NULL),
(49, 'VIT004', 400, 'Viola Type 4', NULL, NULL, NULL),
(50, 'VIT005', 400, 'Viola Type 5', NULL, NULL, NULL),
(51, 'VIT006', 400, 'Viola Type 6', NULL, NULL, NULL),
(52, 'VIT007', 400, 'Viola Type 7', NULL, NULL, NULL),
(53, 'VIT008', 400, 'Viola Type 8', NULL, NULL, NULL),
(54, 'VIT009', 400, 'Viola Type 9', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `sent_by` bigint UNSIGNED NOT NULL,
  `received_by` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sent_by`, `received_by`, `message`, `created_at`, `updated_at`) VALUES
(1, 13, 1, 'Hello', '2022-03-26 10:23:57', '2022-03-26 10:23:57'),
(2, 1, 13, 'hi', '2022-03-26 10:48:41', '2022-03-26 10:48:41'),
(3, 1, 13, 'hi', '2022-03-26 10:48:42', '2022-03-26 10:48:42'),
(4, 13, 1, 'What', '2022-03-26 10:50:34', '2022-03-26 10:50:34'),
(5, 13, 1, 'I Am good', '2022-03-27 05:35:04', '2022-03-27 05:35:04'),
(6, 13, 1, 'hi', '2022-03-27 05:35:15', '2022-03-27 05:35:15'),
(7, 13, 1, 'hi', '2022-03-27 05:35:16', '2022-03-27 05:35:16'),
(8, 13, 1, 'hi', '2022-03-27 05:35:17', '2022-03-27 05:35:17'),
(9, 13, 1, 'hi', '2022-03-27 05:35:20', '2022-03-27 05:35:20'),
(10, 1, 13, 'hello', '2022-03-28 18:07:34', '2022-03-28 18:07:34'),
(11, 1, 13, 'hello', '2022-03-28 18:07:35', '2022-03-28 18:07:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_19_201933_create_user_meta_table', 1),
(6, '2021_11_28_010634_add_dob_to_users_table', 1),
(7, '2021_12_03_182017_create_friend_requests_table', 1),
(8, '2021_12_04_132123_create_dreams_table', 1),
(9, '2021_12_10_022028_add_private_to_dreams_table', 1),
(10, '2021_12_19_073607_create_comments_table', 1),
(11, '2022_02_10_190932_add_draft_to_dreams_table', 1),
(12, '2022_02_15_192835_add_current_question_no_to_dreams_table', 2),
(13, '2022_02_15_193054_create_plants_table', 2),
(17, '2022_02_19_163711_add_bio_interest_profile_pic_to_users', 3),
(18, '2022_02_21_180438_create_scenes_table', 3),
(19, '2022_02_21_180930_add_garden_level_bed_no_to_dreams_table', 3),
(20, '2022_02_23_155120_add_experience_level_to_users_table', 4),
(21, '2022_02_26_155401_add_bad_comment_to_comments_table', 5),
(22, '2022_02_26_191541_create_admins_table', 5),
(23, '2022_03_01_034934_create_items_table', 5),
(24, '2022_03_01_040155_create_inventories_table', 5),
(25, '2022_03_02_162036_create_messages_table', 6),
(26, '2022_03_08_153220_add_relations_to_friend_requests_table', 6),
(27, '2022_03_08_162012_add_index_to_friend_requests_table', 6),
(28, '2022_03_16_194340_create_blocked_users_table', 7),
(29, '2022_03_26_170337_create_payments_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `paypal_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_on` datetime NOT NULL,
  `payer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `paypal_id`, `intent`, `status`, `amount`, `currency_code`, `payment_on`, `payer_name`, `payer_email`, `payer_country_code`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '1AY105370B215435K', 'CAPTURE', 'COMPLETED', '5.97', 'USD', '2022-04-02 17:45:37', 'John Doe', 'sb-urfgs15413898@personal.example.com', 'US', 1, '2022-04-02 17:45:38', '2022-04-02 17:45:38'),
(2, '0K3299754D1087542', 'CAPTURE', 'COMPLETED', '50.99', 'USD', '2022-04-02 17:47:43', 'John Doe', 'sb-urfgs15413898@personal.example.com', 'US', 13, '2022-04-02 17:47:44', '2022-04-02 17:47:44'),
(3, '2SC51164WS9026918', 'CAPTURE', 'COMPLETED', '50.99', 'USD', '2022-04-02 17:56:31', 'John Doe', 'sb-urfgs15413898@personal.example.com', 'US', 13, '2022-04-02 17:56:32', '2022-04-02 17:56:32'),
(4, '4KY02989HS845321R', 'CAPTURE', 'COMPLETED', '0.24', 'USD', '2022-04-04 17:26:42', 'John Doe', 'sb-urfgs15413898@personal.example.com', 'US', 13, '2022-04-04 17:26:43', '2022-04-04 17:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'dreamosophy', '52ee4ee159179aa8df8d81d5125d0a473adfee01e71fc1ab239f86aecffab1e8', '[\"*\"]', '2022-02-10 20:55:02', '2022-02-10 20:54:16', '2022-02-10 20:55:02'),
(2, 'App\\Models\\User', 3, 'dreamosophy', '9119de260f545b6500f432ebdf786438582f2038333a3ae6c5aa105ddd5059bb', '[\"*\"]', '2022-02-11 17:13:25', '2022-02-11 16:47:29', '2022-02-11 17:13:25'),
(3, 'App\\Models\\User', 3, 'dreamosophy', '7756a4f1d331d893cf49d82d1ed31cd5e3b7d6ff5d3f185fc923cc8e51269e47', '[\"*\"]', '2022-02-11 17:07:20', '2022-02-11 17:07:20', '2022-02-11 17:07:20'),
(4, 'App\\Models\\User', 3, 'dreamosophy', '3dd816cd47981c9c98c2d2965dd33eb713f0c2042ff6e395577b20ad53dc0615', '[\"*\"]', '2022-02-11 17:18:57', '2022-02-11 17:11:33', '2022-02-11 17:18:57'),
(5, 'App\\Models\\User', 2, 'dreamosophy', '77c89691db5351c8ddd224567a4c428b5769bf0ddbf6e8c11bafc7b280b8bd54', '[\"*\"]', '2022-02-11 18:38:33', '2022-02-11 17:13:36', '2022-02-11 18:38:33'),
(6, 'App\\Models\\User', 3, 'dreamosophy', '76eb749401a10a5cb86f9e4b8e88dbd77db887b4bedf60c8165ad716a59616e9', '[\"*\"]', '2022-02-11 17:28:12', '2022-02-11 17:25:40', '2022-02-11 17:28:12'),
(7, 'App\\Models\\User', 3, 'dreamosophy', '131824b5de2288ec43550805427c2cb618551a4c4d3ca996c83cc592acd4f1a2', '[\"*\"]', '2022-02-11 17:43:36', '2022-02-11 17:40:58', '2022-02-11 17:43:36'),
(8, 'App\\Models\\User', 3, 'dreamosophy', '87d54d6603e03a345cdf5d568d7da13bbc87b329a45fa3243fae27ab5e302392', '[\"*\"]', '2022-02-11 18:39:32', '2022-02-11 18:34:08', '2022-02-11 18:39:32'),
(9, 'App\\Models\\User', 3, 'dreamosophy', '11294da8af2fb288e4710d2435f5fbfba571ec7c5e4513c654e3b5d1e50bdc19', '[\"*\"]', '2022-02-11 18:38:50', '2022-02-11 18:38:46', '2022-02-11 18:38:50'),
(10, 'App\\Models\\User', 3, 'dreamosophy', 'e7f778bc054d40a79515aa6b2593839ca99062ae44a06e05f975d32c1581e8a6', '[\"*\"]', '2022-02-12 15:33:35', '2022-02-12 15:28:09', '2022-02-12 15:33:35'),
(11, 'App\\Models\\User', 3, 'dreamosophy', 'c46f343bbf94e036f75fa932efa03d993247efa54b66095bfc05dbcdd6d345bb', '[\"*\"]', '2022-02-12 15:50:58', '2022-02-12 15:41:24', '2022-02-12 15:50:58'),
(12, 'App\\Models\\User', 2, 'dreamosophy', 'a0b75b602fc3081261b03e65b5954e2fb528a29a36c56ab624abdcbc43734b07', '[\"*\"]', '2022-02-12 15:46:38', '2022-02-12 15:44:15', '2022-02-12 15:46:38'),
(13, 'App\\Models\\User', 3, 'dreamosophy', '0d7379d75cae5f6ece38ce70fb29d663428a5b9a20e258c3b580c45098dcac26', '[\"*\"]', '2022-02-12 15:49:59', '2022-02-12 15:49:09', '2022-02-12 15:49:59'),
(14, 'App\\Models\\User', 2, 'dreamosophy', 'd1db12d9ade5ff06d3b13c762bc82dc6a819810bcf7621f8c0ec04f781267631', '[\"*\"]', '2022-02-12 15:56:20', '2022-02-12 15:52:06', '2022-02-12 15:56:20'),
(15, 'App\\Models\\User', 2, 'dreamosophy', '191671df20ee9ea9c01ee720a2785224b930f9b45d3f6ad995865cba42fdac5c', '[\"*\"]', '2022-02-12 16:01:02', '2022-02-12 16:01:01', '2022-02-12 16:01:02'),
(16, 'App\\Models\\User', 3, 'dreamosophy', '48fed60c863138c3e3c18f6807c0e09e5721302d0452c508c5a813147efb7093', '[\"*\"]', '2022-02-12 18:04:42', '2022-02-12 18:04:42', '2022-02-12 18:04:42'),
(17, 'App\\Models\\User', 3, 'dreamosophy', '5203b6948235cb9d86d22110b3b528a919e8bc9581efe4c6c53cc72310465e33', '[\"*\"]', '2022-02-12 18:20:13', '2022-02-12 18:05:22', '2022-02-12 18:20:13'),
(18, 'App\\Models\\User', 3, 'dreamosophy', '4fe088a7088e5fa53ba429066480b8ecb9d0b9749f6e39c4d0957a28475dc165', '[\"*\"]', '2022-02-13 17:06:43', '2022-02-13 17:06:38', '2022-02-13 17:06:43'),
(19, 'App\\Models\\User', 3, 'dreamosophy', '7d065b125bdcb61b2d786102f2e056149474657d0443608c95d21bc0f3bb928e', '[\"*\"]', '2022-02-14 18:42:58', '2022-02-14 18:42:53', '2022-02-14 18:42:58'),
(20, 'App\\Models\\User', 2, 'dreamosophy', '985be7c8767e5ddce3061d89c7a48a34b46dbb78404342a93e5c61a18475308a', '[\"*\"]', '2022-02-14 18:43:17', '2022-02-14 18:43:13', '2022-02-14 18:43:17'),
(21, 'App\\Models\\User', 1, 'dreamosophy', '9bb1886e4e603b94ba309072347a8b1a584cba192ea24452cc4c3763b381abde', '[\"*\"]', NULL, '2022-02-15 19:20:59', '2022-02-15 19:20:59'),
(22, 'App\\Models\\User', 1, 'dreamosophy', '54175171306af3f97aae53a2d8a3ac66b2f08ec797185c5bf0d581dd93d9e946', '[\"*\"]', NULL, '2022-02-15 19:21:13', '2022-02-15 19:21:13'),
(23, 'App\\Models\\User', 1, 'dreamosophy', '5902c8bcc4ee4ddc028874dff335e6ccbdc2177728c797d07f19cdbbf99c31b9', '[\"*\"]', '2022-02-15 20:49:27', '2022-02-15 20:47:03', '2022-02-15 20:49:27'),
(24, 'App\\Models\\User', 3, 'dreamosophy', '9ca358dde8a3a58584957600d37414fa0da267c5a5f3e3b37d8e65f234b1131f', '[\"*\"]', '2022-02-16 14:47:10', '2022-02-16 14:42:32', '2022-02-16 14:47:10'),
(25, 'App\\Models\\User', 3, 'dreamosophy', '142e0790f5b7239cd21a61c3204edd412e3b448b6e85c4d2a503492faaac684f', '[\"*\"]', '2022-02-16 15:22:10', '2022-02-16 14:48:06', '2022-02-16 15:22:10'),
(26, 'App\\Models\\User', 3, 'dreamosophy', 'b290b280b4b86bfb28e56b5e318ea073f76b582bf6d35dc8862420189b24886d', '[\"*\"]', '2022-02-16 15:32:24', '2022-02-16 15:26:08', '2022-02-16 15:32:24'),
(27, 'App\\Models\\User', 1, 'dreamosophy', 'ddea95199aa1f75a019412a6b5216abab58fb87a1ea3f5b73cae85c395140320', '[\"*\"]', NULL, '2022-02-16 15:39:53', '2022-02-16 15:39:53'),
(28, 'App\\Models\\User', 3, 'dreamosophy', '560d5e651bd03d685ac721ffc8e7a72907f56b16043addc2d2f2f7336bef46ec', '[\"*\"]', '2022-02-16 15:45:04', '2022-02-16 15:40:02', '2022-02-16 15:45:04'),
(29, 'App\\Models\\User', 1, 'dreamosophy', 'c8225975e1ffa585e37cc55cfc7ed4c55550b4850154cc33aa46bb74404ce1aa', '[\"*\"]', '2022-02-16 16:54:35', '2022-02-16 16:49:12', '2022-02-16 16:54:35'),
(30, 'App\\Models\\User', 1, 'dreamosophy', '10b050b95210c56180a9fa27756d398968dc8aec2a63eb22141315641bbbc496', '[\"*\"]', '2022-02-19 15:47:47', '2022-02-19 15:36:47', '2022-02-19 15:47:47'),
(31, 'App\\Models\\User', 5, 'dreamosophy', '5865fd1cf4d1ff1e2ddcada546e4fa96f07fb429de9f649ddae75f010657f5ff', '[\"*\"]', '2022-02-19 15:48:21', '2022-02-19 15:45:59', '2022-02-19 15:48:21'),
(32, 'App\\Models\\User', 5, 'dreamosophy', 'f027bc86e5991aaa70bf4874372c25e21bac3cd69c428d7cc4bf76fc66b9fb45', '[\"*\"]', NULL, '2022-02-19 15:54:38', '2022-02-19 15:54:38'),
(33, 'App\\Models\\User', 6, 'dreamosophy', '53f9dfef4bb01bfcce637a3b6ee2686f7cf751ccef0c6971b8d91cbb1cf25013', '[\"*\"]', '2022-02-19 16:05:19', '2022-02-19 15:59:09', '2022-02-19 16:05:19'),
(34, 'App\\Models\\User', 5, 'dreamosophy', '503859f725ca82a2a7459e48a629a3bad8c1270279f4ea7fd37b92e7cbaef074', '[\"*\"]', '2022-02-19 16:04:51', '2022-02-19 16:01:25', '2022-02-19 16:04:51'),
(35, 'App\\Models\\User', 5, 'dreamosophy', '5279ed6b52078319483aca54dc869e6a722c7a36d91703b1f6dd6ce58e5374aa', '[\"*\"]', '2022-02-19 17:21:34', '2022-02-19 17:15:46', '2022-02-19 17:21:34'),
(36, 'App\\Models\\User', 3, 'dreamosophy', 'e93af6b60c620a47a63000e1c2f0b7644a19576b0de0d9b6a6378b13c53c2b07', '[\"*\"]', '2022-02-19 17:19:20', '2022-02-19 17:18:20', '2022-02-19 17:19:20'),
(37, 'App\\Models\\User', 1, 'dreamosophy', 'b44769009b5ed5e10009eea98eada49642e3389b0816d8cb98e4a8c39ffed8e4', '[\"*\"]', '2022-02-19 19:31:15', '2022-02-19 19:27:50', '2022-02-19 19:31:15'),
(38, 'App\\Models\\User', 5, 'dreamosophy', 'e0fae972cdf2935f3b6304bb9a00d10f046e14edac3b7b754dd762d799a4c2cc', '[\"*\"]', '2022-02-20 08:10:05', '2022-02-20 08:07:50', '2022-02-20 08:10:05'),
(39, 'App\\Models\\User', 5, 'dreamosophy', 'f5ae9d4879d6a6fae74f7030192d388d2a96991e70588a9bd6c8d018e26e27ec', '[\"*\"]', '2022-02-20 15:33:52', '2022-02-20 15:30:15', '2022-02-20 15:33:52'),
(40, 'App\\Models\\User', 5, 'dreamosophy', 'a7d83df769486a2852266e7fccbce904c26b1b1dfe6b89cb8fe5e375c816c95e', '[\"*\"]', '2022-02-20 15:53:57', '2022-02-20 15:39:44', '2022-02-20 15:53:57'),
(41, 'App\\Models\\User', 5, 'dreamosophy', '4fdc369084649e2225e478628e281e6cfe95101a5429f7e73397278dfe717c37', '[\"*\"]', '2022-02-20 15:48:14', '2022-02-20 15:43:52', '2022-02-20 15:48:14'),
(42, 'App\\Models\\User', 8, 'dreamosophy', '4df6a5550153e3fd97bee3768f6fc367c411cf5fed895d701c0de5020c4a483b', '[\"*\"]', '2022-02-20 16:23:06', '2022-02-20 16:11:57', '2022-02-20 16:23:06'),
(43, 'App\\Models\\User', 8, 'dreamosophy', '95714d3efa5de1911e07bd2a65d8e0e15dfe8328d9f6a132d53944166524bf31', '[\"*\"]', '2022-02-20 19:00:13', '2022-02-20 16:22:02', '2022-02-20 19:00:13'),
(44, 'App\\Models\\User', 8, 'dreamosophy', '5915becd1cef6af094658626043732a67cec569de1eccc5d104f0d0cf9dd6d70', '[\"*\"]', '2022-02-20 17:03:22', '2022-02-20 17:01:15', '2022-02-20 17:03:22'),
(45, 'App\\Models\\User', 8, 'dreamosophy', '5b2d28fca44fc809adc457fdeffb9b059cea113900848457b0b397ffc7265c71', '[\"*\"]', '2022-02-20 18:20:33', '2022-02-20 18:17:29', '2022-02-20 18:20:33'),
(46, 'App\\Models\\User', 8, 'dreamosophy', '6be7f8aa98d1f89588aea1bcaa072d7508b754cdf99deefb59ca943a54e4e1fb', '[\"*\"]', '2022-02-20 18:44:13', '2022-02-20 18:40:28', '2022-02-20 18:44:13'),
(47, 'App\\Models\\User', 8, 'dreamosophy', 'a1d7b830cd30cf4ef963d7f4ac2cd53f5c922d7dffc5c1a32df333dccba9adf4', '[\"*\"]', '2022-02-20 18:56:21', '2022-02-20 18:51:31', '2022-02-20 18:56:21'),
(48, 'App\\Models\\User', 8, 'dreamosophy', '51086e27efe3e5ed7ec9422ee40ca3703f4862e056d28ee906091827f46ae79f', '[\"*\"]', '2022-02-20 19:15:27', '2022-02-20 19:09:41', '2022-02-20 19:15:27'),
(49, 'App\\Models\\User', 1, 'dreamosophy', 'c7d79fdb5905271a7db8d5056d36307c4738fba2219a981457b61ade951fd4da', '[\"*\"]', '2022-02-22 02:39:42', '2022-02-22 02:39:18', '2022-02-22 02:39:42'),
(50, 'App\\Models\\User', 1, 'dreamosophy', 'ad385583f4d2676e117d1283565a1a5fd75c84f464ac88c58b0a2dc5eacbeacc', '[\"*\"]', '2022-02-22 14:54:07', '2022-02-22 14:13:43', '2022-02-22 14:54:07'),
(51, 'App\\Models\\User', 8, 'dreamosophy', 'a117287618d7e1bc53ff6df0fa02d07a9f6bda2323cb1888bc79ea0e2de1e8c1', '[\"*\"]', '2022-02-22 18:15:35', '2022-02-22 14:54:39', '2022-02-22 18:15:35'),
(52, 'App\\Models\\User', 1, 'dreamosophy', '25472c9fec200bb6766fb6d4444f62ee19e3226c8366eee535b75f762d6988c5', '[\"*\"]', '2022-02-22 15:58:21', '2022-02-22 15:56:13', '2022-02-22 15:58:21'),
(53, 'App\\Models\\User', 8, 'dreamosophy', '0bce0a28bbcce0d2efcfc36a7fb6f7c2cb33b3bf54766f94ec20f0f3c7fb2943', '[\"*\"]', '2022-02-22 17:50:17', '2022-02-22 17:50:16', '2022-02-22 17:50:17'),
(54, 'App\\Models\\User', 8, 'dreamosophy', 'fb113d2d8df86260a752124207ee8d997b27964c64e74861fee41350156be9ae', '[\"*\"]', '2022-02-22 18:01:14', '2022-02-22 17:51:15', '2022-02-22 18:01:14'),
(55, 'App\\Models\\User', 6, 'dreamosophy', 'ec138defdfb58406c73cec7b4ab9bc7a00cc5d72581f0a72aad1a9a961657383', '[\"*\"]', '2022-02-22 18:10:34', '2022-02-22 18:05:22', '2022-02-22 18:10:34'),
(56, 'App\\Models\\User', 8, 'dreamosophy', '331ae6794ff1301f4606e1672fe9e18ede3293cfa3fac17047af3136a7ad6332', '[\"*\"]', '2022-02-22 18:13:44', '2022-02-22 18:11:45', '2022-02-22 18:13:44'),
(57, 'App\\Models\\User', 8, 'dreamosophy', '8aed5373f2e2d6f3d9a5883ce17f7e1441ce755d3b6255de20a6af1de487c816', '[\"*\"]', '2022-02-22 18:23:42', '2022-02-22 18:15:44', '2022-02-22 18:23:42'),
(58, 'App\\Models\\User', 6, 'dreamosophy', 'c6019bfd8dbfb6ff05787dbe571058fe593243191bd86b21ffc206af174c67a7', '[\"*\"]', '2022-02-22 18:23:33', '2022-02-22 18:21:51', '2022-02-22 18:23:33'),
(59, 'App\\Models\\User', 8, 'dreamosophy', 'eb3d5c8cf3e74557e10f50355e966a62df61654e25d3f4fb88e82e1ee1dc56b8', '[\"*\"]', '2022-02-23 16:33:34', '2022-02-23 15:11:40', '2022-02-23 16:33:34'),
(60, 'App\\Models\\User', 8, 'dreamosophy', '73a4eb110f5c11e0db91650cc43f8c7f1d6bd6bae30c9fd859fdfa4ec27dd267', '[\"*\"]', '2022-02-23 17:34:04', '2022-02-23 17:34:03', '2022-02-23 17:34:04'),
(61, 'App\\Models\\User', 8, 'dreamosophy', 'e1f5a2dd321e2d48fcb94c23ef8d742f98156a68da3d323fccdb0a73b4499057', '[\"*\"]', '2022-02-23 17:57:54', '2022-02-23 17:39:52', '2022-02-23 17:57:54'),
(62, 'App\\Models\\User', 5, 'dreamosophy', '1d4738966a4b9849dda62484be14c1b45b1f85f19229c449fa49a96e52c120f1', '[\"*\"]', '2022-02-23 18:01:02', '2022-02-23 17:58:31', '2022-02-23 18:01:02'),
(63, 'App\\Models\\User', 8, 'dreamosophy', '964c15a5e519abc1662c0a94a20436a74d6143a47de7259031b7c1f9fac9fd9d', '[\"*\"]', '2022-02-23 18:05:40', '2022-02-23 18:02:34', '2022-02-23 18:05:40'),
(64, 'App\\Models\\User', 8, 'dreamosophy', '7e82526dbe80395228c6d13ebb8acc5fd3e889f0e90410afd81a42ed3b64499b', '[\"*\"]', '2022-02-23 18:29:57', '2022-02-23 18:09:43', '2022-02-23 18:29:57'),
(65, 'App\\Models\\User', 1, 'dreamosophy', '5147079adbc44f9200b798e1ef379c70482140d1ec159690d8313017bd4571f3', '[\"*\"]', NULL, '2022-02-24 13:34:47', '2022-02-24 13:34:47'),
(66, 'App\\Models\\User', 8, 'dreamosophy', '840689ede03f8361d723f06411aa5abd0b61042d46f8a8154fb93b9aa386e238', '[\"*\"]', '2022-02-24 16:08:48', '2022-02-24 13:34:58', '2022-02-24 16:08:48'),
(67, 'App\\Models\\User', 8, 'dreamosophy', '914d4eac0978aceb6b7651780a3852e3e6eaa5f8375f3353e07581455fefc162', '[\"*\"]', '2022-02-24 16:34:38', '2022-02-24 16:31:31', '2022-02-24 16:34:38'),
(68, 'App\\Models\\User', 8, 'dreamosophy', '53d6469cc1f7c8930fb60d4ebe9514abcc045b157773aea64ff506f83cdf2380', '[\"*\"]', '2022-02-25 15:31:44', '2022-02-25 15:22:19', '2022-02-25 15:31:44'),
(69, 'App\\Models\\User', 8, 'dreamosophy', 'e819b21b248b3359c61829e3d543c59f92acf9144b78c6c0f8b10d1c08f4cc1f', '[\"*\"]', '2022-02-25 15:33:07', '2022-02-25 15:30:02', '2022-02-25 15:33:07'),
(70, 'App\\Models\\User', 8, 'dreamosophy', '5bfed78c2dd4bbd5cad8cd43e168234087f4cbbeeab3b49c30b6373737a4c795', '[\"*\"]', '2022-02-25 19:11:31', '2022-02-25 15:50:54', '2022-02-25 19:11:31'),
(71, 'App\\Models\\User', 8, 'dreamosophy', '0f10f14a6d3da0d9ca95f17ad6e7b1dc92d2dc6b5fffd355a8601bfd121dfc97', '[\"*\"]', '2022-02-25 19:27:49', '2022-02-25 19:09:49', '2022-02-25 19:27:49'),
(72, 'App\\Models\\User', 6, 'dreamosophy', 'ba2fa6947deaf9081580803ad7c51388cc9a850c0c73e0937ff35503c6bede0e', '[\"*\"]', '2022-02-25 19:28:14', '2022-02-25 19:27:13', '2022-02-25 19:28:14'),
(73, 'App\\Models\\User', 8, 'dreamosophy', '35ce09080ae7df6f2d175ba5b248e052395a84aaa759465c254cc1987fd2bdeb', '[\"*\"]', '2022-02-25 19:32:25', '2022-02-25 19:32:24', '2022-02-25 19:32:25'),
(74, 'App\\Models\\User', 8, 'dreamosophy', 'e957ffce576ddbefc488c6fa843212fa4d92b7beac5b937dc031d7148cebca2c', '[\"*\"]', '2022-02-25 19:33:27', '2022-02-25 19:33:25', '2022-02-25 19:33:27'),
(75, 'App\\Models\\User', 8, 'dreamosophy', '850a4a58bb511628254aaa747bb482aabc13db0ec13b0caf5e883d4b33156eef', '[\"*\"]', '2022-02-25 19:37:23', '2022-02-25 19:37:22', '2022-02-25 19:37:23'),
(76, 'App\\Models\\User', 8, 'dreamosophy', 'f9abce86793ddc7801786f447dfd9ed6ea12d55cad703d81562ef4622312ec0b', '[\"*\"]', '2022-02-25 19:39:01', '2022-02-25 19:39:01', '2022-02-25 19:39:01'),
(77, 'App\\Models\\User', 8, 'dreamosophy', 'd3c308c18509c78e26a1329df0b9e81e540d141fbae6458357e1739c7c2542aa', '[\"*\"]', '2022-02-25 19:45:34', '2022-02-25 19:45:33', '2022-02-25 19:45:34'),
(78, 'App\\Models\\User', 8, 'dreamosophy', '693b21b1ed1d5edf5e3c592f897cd176ee1843aa029f403bfe987218a219a1c9', '[\"*\"]', '2022-02-25 19:48:03', '2022-02-25 19:48:02', '2022-02-25 19:48:03'),
(79, 'App\\Models\\User', 8, 'dreamosophy', '0d8f05ef44a1e9bb2d1be659f0dbad29ead1d138aca9a47d3547859305900e20', '[\"*\"]', '2022-02-25 19:53:01', '2022-02-25 19:53:00', '2022-02-25 19:53:01'),
(80, 'App\\Models\\User', 8, 'dreamosophy', 'aa07911e50e8b9c2b7a0c174f8c53c75defc10beea1cd198a7824bef1ed9d53a', '[\"*\"]', '2022-02-25 19:58:04', '2022-02-25 19:58:03', '2022-02-25 19:58:04'),
(81, 'App\\Models\\User', 8, 'dreamosophy', '7a3fa4f20331e824a1deb252537763ab11a56886c8ac053e6c100c5a84112694', '[\"*\"]', '2022-02-25 20:10:40', '2022-02-25 20:02:14', '2022-02-25 20:10:40'),
(82, 'App\\Models\\User', 6, 'dreamosophy', 'ef0b746fb7cba068d54b1528798809b6f002c81cb399e545f790560e02814cf5', '[\"*\"]', '2022-02-25 20:09:51', '2022-02-25 20:05:20', '2022-02-25 20:09:51'),
(83, 'App\\Models\\User', 8, 'dreamosophy', '995ad73d73cd808a161aaca0d502fb5062300eb7d7846c40b634dd96f8186dce', '[\"*\"]', '2022-02-25 20:27:21', '2022-02-25 20:25:59', '2022-02-25 20:27:21'),
(84, 'App\\Models\\User', 8, 'dreamosophy', '0fea3919b45b284fed54f21304fb7fec449c8030a2549f4b81035d235ca75519', '[\"*\"]', '2022-02-25 20:41:09', '2022-02-25 20:33:29', '2022-02-25 20:41:09'),
(85, 'App\\Models\\User', 6, 'dreamosophy', 'b196abdc28f9335de2e765dda7d72687b5b26142fc00bd8309d22e1f173adfd9', '[\"*\"]', '2022-02-25 20:44:43', '2022-02-25 20:42:01', '2022-02-25 20:44:43'),
(86, 'App\\Models\\User', 9, 'dreamosophy', '589758710b5cecc88a9c7aeb30d4acb15ff876588d5bc474aeafeb99338183ae', '[\"*\"]', '2022-02-26 17:23:19', '2022-02-26 17:19:02', '2022-02-26 17:23:19'),
(87, 'App\\Models\\User', 10, 'dreamosophy', '79db8b6d70b03791e59998e54989a3aed5919f3e36ba7b65d49802875180a731', '[\"*\"]', '2022-02-26 17:27:16', '2022-02-26 17:26:11', '2022-02-26 17:27:16'),
(88, 'App\\Models\\User', 6, 'dreamosophy', 'b4445dbb2c4ae11c98c12dd9d649d6dd906a40f576b0bcd03cb89e8ea73aa799', '[\"*\"]', '2022-02-26 17:27:56', '2022-02-26 17:27:49', '2022-02-26 17:27:56'),
(89, 'App\\Models\\User', 9, 'dreamosophy', 'ae3406fc7cebccf26ff405f4035d46442e2848b5dcf862a43022e8d49e59c709', '[\"*\"]', '2022-02-26 17:29:01', '2022-02-26 17:28:45', '2022-02-26 17:29:01'),
(90, 'App\\Models\\User', 9, 'dreamosophy', 'b952c14291bb04331bb7b4383fe314c23f3f5a06a0fdd9d3ca09b6c22ca5ca55', '[\"*\"]', NULL, '2022-02-26 17:29:10', '2022-02-26 17:29:10'),
(91, 'App\\Models\\User', 10, 'dreamosophy', '185d58af9e082077d4d89fb34902386cf8c10cd4810517526d4b77745e41d95f', '[\"*\"]', '2022-02-26 17:29:45', '2022-02-26 17:29:19', '2022-02-26 17:29:45'),
(92, 'App\\Models\\User', 10, 'dreamosophy', '71a7bb42a8c1d7d6af8e18444bf853f33ad3cee3e9f022375a3e011b3936c4c0', '[\"*\"]', '2022-02-26 17:31:56', '2022-02-26 17:30:25', '2022-02-26 17:31:56'),
(93, 'App\\Models\\User', 9, 'dreamosophy', '6068ebfacf9fe98624753731dc1fe95286f88752728c42585fda67f707281dde', '[\"*\"]', '2022-02-26 17:53:20', '2022-02-26 17:32:49', '2022-02-26 17:53:20'),
(94, 'App\\Models\\User', 9, 'dreamosophy', 'b7d84d6736d47bc3e7c40bc8a1f0ad1e489e19fed0bf9590b2f746d7e875e1ef', '[\"*\"]', '2022-02-26 17:40:09', '2022-02-26 17:33:05', '2022-02-26 17:40:09'),
(95, 'App\\Models\\User', 10, 'dreamosophy', '4ab0dae9f419d27f0897429490bf3a6e3cd75ca51a7955d78a7008c922f75dba', '[\"*\"]', '2022-02-26 17:44:26', '2022-02-26 17:41:05', '2022-02-26 17:44:26'),
(96, 'App\\Models\\User', 10, 'dreamosophy', 'f5fac2c2322b5ba4fcc985cce87dd9b810e602d810e1a50a700c43c383ddf997', '[\"*\"]', '2022-02-26 18:33:21', '2022-02-26 18:22:07', '2022-02-26 18:33:21'),
(97, 'App\\Models\\User', 10, 'dreamosophy', '04d69056367e6626f5733ea5c12114a6accc4265d8d4e2b97e9c19adf71341c2', '[\"*\"]', '2022-02-26 18:29:19', '2022-02-26 18:26:14', '2022-02-26 18:29:19'),
(98, 'App\\Models\\User', 9, 'dreamosophy', '6ef903d7036ba6a4ffab43b143a24dd6b06b9e179777852611d41a86f0d9b699', '[\"*\"]', '2022-02-26 18:31:08', '2022-02-26 18:30:08', '2022-02-26 18:31:08'),
(99, 'App\\Models\\User', 9, 'dreamosophy', 'e2df03c1ce48c2df817d24d8d69562a0919f78a18fd1e017c32953d2af11505f', '[\"*\"]', NULL, '2022-02-27 08:59:33', '2022-02-27 08:59:33'),
(100, 'App\\Models\\User', 9, 'dreamosophy', '7959b6ab5d21bffbedbc8186689c3a4f4eff83855b6b292d64d7cffa7bf208be', '[\"*\"]', '2022-02-27 20:14:39', '2022-02-27 08:59:38', '2022-02-27 20:14:39'),
(101, 'App\\Models\\User', 1, 'dreamosophy', 'dcc0fa1f5452ef31c6a8bbb032e1e29fa81a646dc13048ba0d9c43eeb4176d5c', '[\"*\"]', '2022-02-27 11:35:17', '2022-02-27 10:13:58', '2022-02-27 11:35:17'),
(102, 'App\\Models\\User', 9, 'dreamosophy', 'c49b1872061536134411dd2627dbed7b7cc9430019cf3bd868616433e03cecdb', '[\"*\"]', '2022-02-27 20:00:38', '2022-02-27 17:27:22', '2022-02-27 20:00:38'),
(103, 'App\\Models\\User', 1, 'dreamosophy', '00c15650e335c66c61f52b4523965d46912daa46bc9d64a396bd6d1501526ea4', '[\"*\"]', '2022-02-27 17:43:23', '2022-02-27 17:43:18', '2022-02-27 17:43:23'),
(104, 'App\\Models\\User', 1, 'dreamosophy', '92cb456a9faefe30bf4c9ef5375cde7e50e888538a48275c0273e54f6616c222', '[\"*\"]', '2022-02-28 06:40:56', '2022-02-28 06:32:26', '2022-02-28 06:40:56'),
(105, 'App\\Models\\User', 1, 'dreamosophy', 'b9c75ad9e5005bee6ea8eaada872dd99a7075e99546642a4d5955b8461ae8211', '[\"*\"]', '2022-02-28 16:23:22', '2022-02-28 16:22:58', '2022-02-28 16:23:22'),
(106, 'App\\Models\\User', 9, 'dreamosophy', '868dd6ef048fff68d21093146cb9d16f5d7500f9c66b7301c3778cca999e0d72', '[\"*\"]', '2022-02-28 17:59:35', '2022-02-28 16:40:25', '2022-02-28 17:59:35'),
(107, 'App\\Models\\User', 9, 'dreamosophy', '8fdb46775efaeb8a9a87a8e9c30c8f7a607c89574a628f638cc59b996c73dd83', '[\"*\"]', NULL, '2022-02-28 17:59:40', '2022-02-28 17:59:40'),
(108, 'App\\Models\\User', 9, 'dreamosophy', '0dccd640278afd21baf8132849290c194caf30d5ab0b585ca760d972a1726825', '[\"*\"]', NULL, '2022-02-28 18:00:52', '2022-02-28 18:00:52'),
(109, 'App\\Models\\User', 9, 'dreamosophy', 'a1971eba854ce8e07b5eca825584a8f94a6846dc61b9a894c6c325ed0f555ef7', '[\"*\"]', '2022-02-28 18:07:28', '2022-02-28 18:03:16', '2022-02-28 18:07:28'),
(110, 'App\\Models\\User', 1, 'dreamosophy', '2b7b618e2f30b44fb74ae391e60e352bf7cc593f0ce549f86cfaf11a6ccce8b6', '[\"*\"]', '2022-02-28 18:06:02', '2022-02-28 18:05:54', '2022-02-28 18:06:02'),
(111, 'App\\Models\\User', 1, 'dreamosophy', 'e4d774903dcd1bb7c91a62f1e43d8c6362236dcdad14c6b8bb9e0a10c6e5b5e0', '[\"*\"]', '2022-02-28 18:16:29', '2022-02-28 18:16:20', '2022-02-28 18:16:29'),
(112, 'App\\Models\\User', 9, 'dreamosophy', '142a9b5969b75befdba597620d1fb0ce7a95ab059d0c65bae66c5dbc2cd64676', '[\"*\"]', '2022-02-28 18:17:06', '2022-02-28 18:17:02', '2022-02-28 18:17:06'),
(113, 'App\\Models\\User', 1, 'dreamosophy', '5ede017568a5e37d845156d960f0eb6e043d3f6e762165afa382d859b4d2673f', '[\"*\"]', '2022-02-28 18:17:32', '2022-02-28 18:17:21', '2022-02-28 18:17:32'),
(114, 'App\\Models\\User', 1, 'dreamosophy', '8098e20823aac04c2dc7eae192d3cd49d6bc3aadccddda66f3122ff6d76af87e', '[\"*\"]', '2022-02-28 18:26:31', '2022-02-28 18:17:42', '2022-02-28 18:26:31'),
(115, 'App\\Models\\User', 9, 'dreamosophy', '617fbdae54eb6e3c4f430a118bf9326c6984e36ce321263fe98b112cbcadaad1', '[\"*\"]', '2022-03-01 13:12:29', '2022-03-01 13:12:22', '2022-03-01 13:12:29'),
(116, 'App\\Models\\User', 10, 'dreamosophy', 'd66ba6331c5ea496c330fcd8e6b96720244784e0ec5bea64671491cfc7bc4241', '[\"*\"]', '2022-03-01 13:36:54', '2022-03-01 13:36:51', '2022-03-01 13:36:54'),
(117, 'App\\Models\\User', 9, 'dreamosophy', 'f921224812acb5b743af9d80c875a20092a5e46655cd3558d602f2346473b575', '[\"*\"]', '2022-03-01 13:52:17', '2022-03-01 13:37:08', '2022-03-01 13:52:17'),
(118, 'App\\Models\\User', 9, 'dreamosophy', 'e4a7d7c43e4a5ba13f166ba2af9dea812c4f2377ab10b758d7eb6b09476afacc', '[\"*\"]', '2022-03-01 20:15:04', '2022-03-01 13:49:26', '2022-03-01 20:15:04'),
(119, 'App\\Models\\User', 10, 'dreamosophy', '2002c987c2d4becba5b0ddd749726653d6e067aa962bc362d0434259858ffc36', '[\"*\"]', '2022-03-01 13:53:25', '2022-03-01 13:52:30', '2022-03-01 13:53:25'),
(120, 'App\\Models\\User', 10, 'dreamosophy', 'fb95c1e12232f298758af560bd6f0d63be9eff7343a9eea6f716cff9b2e13b98', '[\"*\"]', NULL, '2022-03-01 13:53:32', '2022-03-01 13:53:32'),
(121, 'App\\Models\\User', 9, 'dreamosophy', '502a5a4591985f493f156fe2d9622b35bd153f1d8c1e0d2b7eb830c406a3553c', '[\"*\"]', '2022-03-01 18:09:44', '2022-03-01 13:53:36', '2022-03-01 18:09:44'),
(122, 'App\\Models\\User', 10, 'dreamosophy', 'f6ff92c38f7f2e5715a8b9b966d347372214c64c16c1060b38120d20bfa3e403', '[\"*\"]', '2022-03-01 18:18:32', '2022-03-01 18:09:56', '2022-03-01 18:18:32'),
(123, 'App\\Models\\User', 9, 'dreamosophy', 'f1bb24f922d95654e4c6e48c1ebc872dd07db57c344c87a302081b0a052ee3c9', '[\"*\"]', '2022-03-01 18:20:48', '2022-03-01 18:18:43', '2022-03-01 18:20:48'),
(124, 'App\\Models\\User', 10, 'dreamosophy', '6b5226d4b87bdd7c6e6261b0227699977be957f1cf6ae4837b7c074e25e66b10', '[\"*\"]', '2022-03-01 20:01:16', '2022-03-01 18:21:06', '2022-03-01 20:01:16'),
(125, 'App\\Models\\User', 9, 'dreamosophy', 'c5f5366457262f2600daf1002a090e0cd22584342e4a19fe77cf8a5040ad011f', '[\"*\"]', '2022-03-01 20:22:51', '2022-03-01 20:01:51', '2022-03-01 20:22:51'),
(126, 'App\\Models\\User', 10, 'dreamosophy', '281f52e3bac5a4ad838ac0b1f503ba37bed3f6f9d3ef86cf5e3556401c66f557', '[\"*\"]', '2022-03-01 20:17:37', '2022-03-01 20:15:36', '2022-03-01 20:17:37'),
(127, 'App\\Models\\User', 9, 'dreamosophy', 'a39ba59f97bb3ac56d395abc65eee07425d6c207d35dae6b350e7d0a806dfd49', '[\"*\"]', '2022-03-02 18:36:41', '2022-03-02 14:07:02', '2022-03-02 18:36:41'),
(128, 'App\\Models\\User', 9, 'dreamosophy', 'b04ec1acef40c1b3c3f42af5d86e2495b2f26ce2c185aa9fcef0f6605ed4a4e3', '[\"*\"]', '2022-03-02 18:37:51', '2022-03-02 18:37:38', '2022-03-02 18:37:51'),
(129, 'App\\Models\\User', 1, 'dreamosophy', '69959d1e006cd4895fdff7c977579162013ca47f3a02598be4396214122d59f6', '[\"*\"]', '2022-03-02 19:45:32', '2022-03-02 19:45:15', '2022-03-02 19:45:32'),
(130, 'App\\Models\\User', 9, 'dreamosophy', 'd443aa8c3b7a0b6e9075e33c7d956c98caa705bf3e16bf5dce0b017a8d46da79', '[\"*\"]', '2022-03-03 01:52:47', '2022-03-03 01:51:15', '2022-03-03 01:52:47'),
(131, 'App\\Models\\User', 9, 'dreamosophy', '45f58f5d5b1d0252150508baa78318f83645e28ebb30e04c4c8da91ebdc675ba', '[\"*\"]', '2022-03-03 17:15:31', '2022-03-03 16:43:05', '2022-03-03 17:15:31'),
(132, 'App\\Models\\User', 9, 'dreamosophy', 'a32fc2ceae09759320bab07b025a8a32e3beeec98a68a763b0c44f8a3dbe9a86', '[\"*\"]', '2022-03-03 20:23:31', '2022-03-03 17:05:06', '2022-03-03 20:23:31'),
(133, 'App\\Models\\User', 10, 'dreamosophy', '63b16c250a88455df9cc322d4c91d1e26e99e2b9730753443b8b55ff51de4590', '[\"*\"]', '2022-03-03 17:41:31', '2022-03-03 17:17:24', '2022-03-03 17:41:31'),
(134, 'App\\Models\\User', 9, 'dreamosophy', 'a383e92cdc0ec930a21a20f0b770c1925a921ee6fbd72ed9faf04461b84d0430', '[\"*\"]', '2022-03-03 18:04:19', '2022-03-03 17:44:36', '2022-03-03 18:04:19'),
(135, 'App\\Models\\User', 9, 'dreamosophy', 'dd52e86ddf520e4a7712ada5a5bb0e207700970bc3d1f6047c6880c6b96fe6af', '[\"*\"]', '2022-03-03 20:28:55', '2022-03-03 19:39:00', '2022-03-03 20:28:55'),
(136, 'App\\Models\\User', 9, 'dreamosophy', '8ad85a9401ccd2beef1710199a47218cab49b84d8d6ee9ae549dae627c673adf', '[\"*\"]', '2022-03-04 17:00:59', '2022-03-04 16:58:14', '2022-03-04 17:00:59'),
(137, 'App\\Models\\User', 1, 'dreamosophy', 'e0c27d37fb9cc811247a50b218b1f72dc2e50129a29b6f305a9411aee5c25119', '[\"*\"]', '2022-03-04 18:58:09', '2022-03-04 18:57:38', '2022-03-04 18:58:09'),
(138, 'App\\Models\\User', 1, 'dreamosophy', 'ad403fedb755f3b239ffc419a9f51b40ed31a1fede5ca92409e6beb93d36cbe8', '[\"*\"]', '2022-03-04 19:12:56', '2022-03-04 19:12:55', '2022-03-04 19:12:56'),
(139, 'App\\Models\\User', 1, 'dreamosophy', '105b90f2ec88764102c2bb3ef157836f7cd3a9a91735e7526b50155517516aa2', '[\"*\"]', '2022-03-04 19:19:02', '2022-03-04 19:18:40', '2022-03-04 19:19:02'),
(140, 'App\\Models\\User', 1, 'dreamosophy', '2170a2c3e02a8e24a5697e6f4291cba1297c2e5b149a1102fde9f9ce6a2e265e', '[\"*\"]', '2022-03-04 19:21:06', '2022-03-04 19:21:01', '2022-03-04 19:21:06'),
(141, 'App\\Models\\User', 1, 'dreamosophy', 'fe8bc110c2358a8cfa0a06d0e526097d3153fcae5223464ebf75f667e72c3631', '[\"*\"]', '2022-03-04 19:34:23', '2022-03-04 19:34:18', '2022-03-04 19:34:23'),
(142, 'App\\Models\\User', 1, 'dreamosophy', '107bea97c7a3077e50c58e46506aa51d23282f6d63e6a371a7b2a1235ba68195', '[\"*\"]', '2022-03-04 19:39:39', '2022-03-04 19:39:34', '2022-03-04 19:39:39'),
(143, 'App\\Models\\User', 1, 'dreamosophy', '6edcf39fdcdb713834f185abe6da1f79d1f01f10393e98e8bab232b22c2ff181', '[\"*\"]', '2022-03-04 21:31:25', '2022-03-04 19:43:26', '2022-03-04 21:31:25'),
(144, 'App\\Models\\User', 9, 'dreamosophy', '0a474221079dc937e457f1dc1f086dccd78c3661e60d0fb8e1fefa2d41104171', '[\"*\"]', '2022-03-05 18:49:42', '2022-03-05 16:25:38', '2022-03-05 18:49:42'),
(145, 'App\\Models\\User', 9, 'dreamosophy', '8ed44d48d8b35385336299018e5a3d01fde816cddfe4db1dc653b274b9251ce1', '[\"*\"]', '2022-03-05 17:58:41', '2022-03-05 17:06:50', '2022-03-05 17:58:41'),
(146, 'App\\Models\\User', 1, 'dreamosophy', 'a50338d46255608f3f0cbf0852f92df4b25b6456cb5a9ca634b59fc012310d04', '[\"*\"]', '2022-03-05 17:24:51', '2022-03-05 17:24:02', '2022-03-05 17:24:51'),
(147, 'App\\Models\\User', 1, 'dreamosophy', '2f04bf72fbc1a4a10425501edeab6de191568dca93ad30e4ffff5825376013fa', '[\"*\"]', '2022-03-05 17:39:28', '2022-03-05 17:39:21', '2022-03-05 17:39:28'),
(148, 'App\\Models\\User', 1, 'dreamosophy', '960f1ade5c5338c78ac6a2f4063e281755dd979e90a4427f63d97179d33bdfd7', '[\"*\"]', '2022-03-05 17:50:08', '2022-03-05 17:50:04', '2022-03-05 17:50:08'),
(149, 'App\\Models\\User', 1, 'dreamosophy', 'b1ea954ad9f17b41b2dcff6e7c445140be38b8936edf25568b8b1ab57fbfa1b7', '[\"*\"]', '2022-03-05 17:54:48', '2022-03-05 17:54:42', '2022-03-05 17:54:48'),
(150, 'App\\Models\\User', 1, 'dreamosophy', '9ba295a8095cffe79421b24499b50e5073f56c4d0ba8d6d1345b59f51077850a', '[\"*\"]', '2022-03-05 17:58:47', '2022-03-05 17:58:22', '2022-03-05 17:58:47'),
(151, 'App\\Models\\User', 1, 'dreamosophy', 'e45873e0db91baee42f5f2c606b1cedfd63b9d8aa7f95dec42cf0f6a4ccfe739', '[\"*\"]', '2022-03-05 18:00:17', '2022-03-05 18:00:07', '2022-03-05 18:00:17'),
(152, 'App\\Models\\User', 1, 'dreamosophy', 'bc8b3776a55bf2f6eaaae9e55bc31f53a1676ed034d575a0b67f3ddbc9722ce3', '[\"*\"]', '2022-03-05 18:20:34', '2022-03-05 18:13:34', '2022-03-05 18:20:34'),
(153, 'App\\Models\\User', 1, 'dreamosophy', '89d6c843f346e3ecf4710936fc46421966f963f0c1ce98bea1495749621fe815', '[\"*\"]', '2022-03-05 18:15:41', '2022-03-05 18:15:38', '2022-03-05 18:15:41'),
(154, 'App\\Models\\User', 9, 'dreamosophy', '0a14c8daf60f713715337e5f6d03aa6051978289f372d48adaa44afa9aafac03', '[\"*\"]', '2022-03-06 05:27:45', '2022-03-06 04:53:08', '2022-03-06 05:27:45'),
(155, 'App\\Models\\User', 9, 'dreamosophy', '7ab0ba7bdb113b1e657c9b995e82f2c56f96e730c72e2735b7fbb406e256a56f', '[\"*\"]', '2022-03-06 05:53:48', '2022-03-06 05:17:23', '2022-03-06 05:53:48'),
(156, 'App\\Models\\User', 9, 'dreamosophy', '1e99abbfc82760eb98a6c0aebf0723ae158fc2a9219f9a7a6a5f49957da5c379', '[\"*\"]', '2022-03-06 14:46:31', '2022-03-06 14:46:31', '2022-03-06 14:46:31'),
(157, 'App\\Models\\User', 9, 'dreamosophy', '603dd47b41e9efde853fe739deed6094cd186af1664dcbcfc32b2b751bc9f7f4', '[\"*\"]', '2022-03-06 14:58:09', '2022-03-06 14:58:09', '2022-03-06 14:58:09'),
(158, 'App\\Models\\User', 9, 'dreamosophy', '869a729b7f9491ae05720569d27e95d93428876b8307bbd8469cc5e10761be19', '[\"*\"]', '2022-03-06 15:42:35', '2022-03-06 14:58:33', '2022-03-06 15:42:35'),
(159, 'App\\Models\\User', 9, 'dreamosophy', '710cabdc7b9708ef689c5ae24b789ca57644dd3ec069e4a02564b989c7039359', '[\"*\"]', '2022-03-06 15:36:18', '2022-03-06 15:22:00', '2022-03-06 15:36:18'),
(160, 'App\\Models\\User', 10, 'dreamosophy', '6feb4a56fff9e8ca54049827438adf5b216b29e58646d96741cb75d9faadfcf6', '[\"*\"]', '2022-03-06 17:02:04', '2022-03-06 16:34:29', '2022-03-06 17:02:04'),
(161, 'App\\Models\\User', 10, 'dreamosophy', 'b61dd028a7e56624b386228c6a7aa1633f9080bd0357887cb63410582eda296b', '[\"*\"]', '2022-03-06 16:45:45', '2022-03-06 16:41:27', '2022-03-06 16:45:45'),
(162, 'App\\Models\\User', 1, 'dreamosophy', '14ea655f19675f3c9328191694cbd02784d3ebb6e32a959f1320aee3beed59de', '[\"*\"]', '2022-03-06 19:15:11', '2022-03-06 19:15:06', '2022-03-06 19:15:11'),
(163, 'App\\Models\\User', 1, 'dreamosophy', '9e6618fcce2636ad5aba8f1c77dc1d8423809b9b4b5af80f9bf200c18ea6b0bd', '[\"*\"]', '2022-03-06 19:17:14', '2022-03-06 19:17:12', '2022-03-06 19:17:14'),
(164, 'App\\Models\\User', 1, 'dreamosophy', 'de6355b854bf031aa0a6f3aa200f26218c249eef619b14746dbe9c4f6b54f995', '[\"*\"]', '2022-03-06 19:20:19', '2022-03-06 19:20:12', '2022-03-06 19:20:19'),
(165, 'App\\Models\\User', 1, 'dreamosophy', 'dfb687ae8c317f38c7b610e666fab87c4cc132d11a2b9728e7dc1c959919987f', '[\"*\"]', '2022-03-06 19:22:49', '2022-03-06 19:22:45', '2022-03-06 19:22:49'),
(166, 'App\\Models\\User', 1, 'dreamosophy', 'fb0b51b2c13c9dd7fc399643f70f9e9dfc2bfd3065029a00447d0682f93b3835', '[\"*\"]', '2022-03-06 19:23:40', '2022-03-06 19:23:37', '2022-03-06 19:23:40'),
(167, 'App\\Models\\User', 1, 'dreamosophy', 'da5db015d1e249c7b5852afb76b7c4d9bbf26cab97958cc981e3e15295096dc5', '[\"*\"]', '2022-03-06 19:27:47', '2022-03-06 19:27:43', '2022-03-06 19:27:47'),
(168, 'App\\Models\\User', 1, 'dreamosophy', '63e8c9d3d599c45d2811e91d6814baebb8ce1652ad6a325c58b11a7047d43c7a', '[\"*\"]', '2022-03-06 19:29:02', '2022-03-06 19:29:00', '2022-03-06 19:29:02'),
(169, 'App\\Models\\User', 1, 'dreamosophy', '7a32520590fcc767fe99324a3f5fe3522517963249745833d86511660e58ab27', '[\"*\"]', '2022-03-06 19:30:24', '2022-03-06 19:30:21', '2022-03-06 19:30:24'),
(170, 'App\\Models\\User', 1, 'dreamosophy', 'a52deb595827936db76aea9a07dcc732b6818ab47870276d7205db081222d08d', '[\"*\"]', '2022-03-06 19:32:09', '2022-03-06 19:32:05', '2022-03-06 19:32:09'),
(171, 'App\\Models\\User', 1, 'dreamosophy', '1c17a1b707142b1cd645ca57da5b43c11bed9e0be46443b55fdbd707450ac709', '[\"*\"]', '2022-03-06 19:34:25', '2022-03-06 19:34:21', '2022-03-06 19:34:25'),
(172, 'App\\Models\\User', 1, 'dreamosophy', '4d5728b9df3dd6974ea6ce9bf1f852543ec7eaf4ad4497165ee7b66f07f0758a', '[\"*\"]', '2022-03-06 19:35:12', '2022-03-06 19:34:59', '2022-03-06 19:35:12'),
(173, 'App\\Models\\User', 1, 'dreamosophy', '034d12a06d3d40ef939476a6d4941c6468ac59b9868cc96196b62c221104b980', '[\"*\"]', '2022-03-06 19:37:59', '2022-03-06 19:37:08', '2022-03-06 19:37:59'),
(174, 'App\\Models\\User', 12, 'dreamosophy', '2a2d8c7aa5d764b0f2daa78d3ab9b75ade7f04fc1c72a055f822b5d3fe7569ab', '[\"*\"]', '2022-03-07 14:51:26', '2022-03-07 14:38:51', '2022-03-07 14:51:26'),
(175, 'App\\Models\\User', 10, 'dreamosophy', 'ab0af37177ea62fb02ccf500a41215fa571e6c3042f8587fa61177c6ad5d412c', '[\"*\"]', NULL, '2022-03-07 14:46:50', '2022-03-07 14:46:50'),
(176, 'App\\Models\\User', 9, 'dreamosophy', 'f3717a05434e9d33f9cbe0a181841b7a71c5deccc6f3c30fd82eb87bc706764a', '[\"*\"]', '2022-03-07 14:47:35', '2022-03-07 14:46:54', '2022-03-07 14:47:35'),
(177, 'App\\Models\\User', 12, 'dreamosophy', '15ddec4b7eccaf93c220c44ff0878aa7d385ac079b8d3c3e6b5f7fb55c10e4d9', '[\"*\"]', '2022-03-07 15:02:10', '2022-03-07 14:56:53', '2022-03-07 15:02:10'),
(178, 'App\\Models\\User', 1, 'dreamosophy', '4e5191ee1d2b135fe718a2144fa54e549317dbbad56a4714456778bbdda6a2e2', '[\"*\"]', '2022-03-07 15:16:40', '2022-03-07 15:16:36', '2022-03-07 15:16:40'),
(179, 'App\\Models\\User', 1, 'dreamosophy', '5dbd1ac68e83acc2358db82a41e5960a87ccf6a804c38b01d0b34bf251e4faa9', '[\"*\"]', '2022-03-07 15:23:08', '2022-03-07 15:23:05', '2022-03-07 15:23:08'),
(180, 'App\\Models\\User', 1, 'dreamosophy', '3cb60df73fef48039b0f17434caad7bdb286e84dee0f0959d46e1787fd647ca0', '[\"*\"]', '2022-03-07 15:27:32', '2022-03-07 15:27:29', '2022-03-07 15:27:32'),
(181, 'App\\Models\\User', 1, 'dreamosophy', '524878ce6e9745116002ea642c3425e805c8036c23c474294a3c2f82e4574f36', '[\"*\"]', '2022-03-07 15:35:33', '2022-03-07 15:35:30', '2022-03-07 15:35:33'),
(182, 'App\\Models\\User', 1, 'dreamosophy', '8b3ef9c224a7b114bad58a55943c5ca22a986013049b10a2416775c349c47c76', '[\"*\"]', '2022-03-07 15:51:33', '2022-03-07 15:50:44', '2022-03-07 15:51:33'),
(183, 'App\\Models\\User', 1, 'dreamosophy', '992d83f2f2dbb22ac64dfd5b2a4cd5cefcf20c54d6989818310a28fa39dc1d7b', '[\"*\"]', '2022-03-07 16:14:29', '2022-03-07 16:14:26', '2022-03-07 16:14:29'),
(184, 'App\\Models\\User', 1, 'dreamosophy', '7cfc3aa4dcbe93c56d65fb33b13e4ee924cd71e1eec30d9e7b9c404b226d3a6f', '[\"*\"]', '2022-03-07 16:18:56', '2022-03-07 16:18:53', '2022-03-07 16:18:56'),
(185, 'App\\Models\\User', 1, 'dreamosophy', '3bf9fe18365728001e4c8c304c88181965813c01620b9c6cd4cad02a55164f9c', '[\"*\"]', '2022-03-07 16:20:49', '2022-03-07 16:20:44', '2022-03-07 16:20:49'),
(186, 'App\\Models\\User', 1, 'dreamosophy', 'e51b5cc298a349caeff96e5b766b5f34c7624d86041b6d261e3b75f56217c1c5', '[\"*\"]', '2022-03-07 16:26:24', '2022-03-07 16:25:40', '2022-03-07 16:26:24'),
(187, 'App\\Models\\User', 1, 'dreamosophy', '66c83e064e2307e853d3d3892722c70c627d25a2502ee8c0b6d00eb3cb615df6', '[\"*\"]', '2022-03-07 16:29:10', '2022-03-07 16:28:16', '2022-03-07 16:29:10'),
(188, 'App\\Models\\User', 1, 'dreamosophy', '3b46808f46945b2b2f3295f002ee2009d00cd32e4577cb059095592d8c988c44', '[\"*\"]', '2022-03-07 16:40:42', '2022-03-07 16:40:37', '2022-03-07 16:40:42'),
(189, 'App\\Models\\User', 1, 'dreamosophy', '4338ba43076bfd470cc5e6d76f266544043d9759cdf4e4259489b27d5833d90f', '[\"*\"]', '2022-03-07 16:41:54', '2022-03-07 16:41:31', '2022-03-07 16:41:54'),
(190, 'App\\Models\\User', 1, 'dreamosophy', 'c2e6f6729b454ee3bbb7ff54c1e156b764345fb353654faf8332eb0a976b78fe', '[\"*\"]', '2022-03-07 17:17:00', '2022-03-07 17:16:02', '2022-03-07 17:17:00'),
(191, 'App\\Models\\User', 1, 'dreamosophy', 'e45c4c16e5537c9354cbef673f69bf4e11b6e1939a336eaae9b37e2eb828d6e8', '[\"*\"]', '2022-03-07 17:19:18', '2022-03-07 17:19:11', '2022-03-07 17:19:18'),
(192, 'App\\Models\\User', 1, 'dreamosophy', '5eb4965a43adeb89b548bb46c98ae6a88ddaf15fe4c519403874fedb628d3f14', '[\"*\"]', '2022-03-07 17:20:32', '2022-03-07 17:20:26', '2022-03-07 17:20:32'),
(193, 'App\\Models\\User', 12, 'dreamosophy', '5b87fbc79e1a56b8bad21ea8c4e112026c2f83cf6d2fe1745f29164aa0c3de7b', '[\"*\"]', '2022-03-07 18:42:09', '2022-03-07 18:03:13', '2022-03-07 18:42:09'),
(194, 'App\\Models\\User', 13, 'dreamosophy', 'e78412e55166a77434da04da12efbb418cc5dae164a122c897ddfaf9e09c81dc', '[\"*\"]', '2022-03-07 18:16:02', '2022-03-07 18:10:45', '2022-03-07 18:16:02'),
(195, 'App\\Models\\User', 9, 'dreamosophy', '28e867ab222d5fc5802e0a915a830eab271e6f4cfd72f2450de8da49f1803eb0', '[\"*\"]', '2022-03-07 18:47:35', '2022-03-07 18:43:37', '2022-03-07 18:47:35'),
(196, 'App\\Models\\User', 13, 'dreamosophy', '250e2f4fd5f1d2f34872838745d5ab9c5ecfa6009943dcce0d593d2fe48ec619', '[\"*\"]', '2022-03-07 18:45:35', '2022-03-07 18:45:34', '2022-03-07 18:45:35'),
(197, 'App\\Models\\User', 13, 'dreamosophy', '610d6e7e831def15e9aa51f4a00abe51bd5b4ce182d64a9639ab0ba216ab2305', '[\"*\"]', '2022-03-07 18:54:04', '2022-03-07 18:50:17', '2022-03-07 18:54:04'),
(198, 'App\\Models\\User', 13, 'dreamosophy', '5346e598163e8da69dce203426f5c65e7a106e9cbee1524b7239247375ca31d1', '[\"*\"]', '2022-03-10 17:07:21', '2022-03-10 17:05:56', '2022-03-10 17:07:21'),
(199, 'App\\Models\\User', 13, 'dreamosophy', '63dfba3f86f700956b65e77ff9734ac7fad438af55fefaaba25a77273902768d', '[\"*\"]', '2022-03-10 17:13:12', '2022-03-10 17:13:08', '2022-03-10 17:13:12'),
(200, 'App\\Models\\User', 13, 'dreamosophy', '1b8596e184005294386766e8c5cd9e6e1f8c0101f92a42b8c052f521d17bd6f4', '[\"*\"]', '2022-03-10 17:17:15', '2022-03-10 17:17:11', '2022-03-10 17:17:15'),
(201, 'App\\Models\\User', 13, 'dreamosophy', 'b32efb0b4d5fc1166a336fa5c1f998502f73a487447849dc43c6a9b7d16c1d00', '[\"*\"]', '2022-03-10 17:23:30', '2022-03-10 17:21:18', '2022-03-10 17:23:30'),
(202, 'App\\Models\\User', 1, 'dreamosophy', 'dd857442d24b5d783b2563e5a45da7a19afcadd0b8a422cae53af88c2ea97cf3', '[\"*\"]', '2022-03-10 17:24:58', '2022-03-10 17:24:00', '2022-03-10 17:24:58'),
(203, 'App\\Models\\User', 1, 'dreamosophy', '02e94146d2ea63fe67652dc2d343efd7712d75e11d0249296ef7d98c0d4f990c', '[\"*\"]', '2022-03-10 20:33:48', '2022-03-10 17:27:27', '2022-03-10 20:33:48'),
(204, 'App\\Models\\User', 1, 'dreamosophy', '38899285f8693338e99fc12a3f7b9357c2ce2137bd813d398e0d4a1d0eaa0135', '[\"*\"]', '2022-03-10 17:28:32', '2022-03-10 17:28:21', '2022-03-10 17:28:32'),
(205, 'App\\Models\\User', 1, 'dreamosophy', '775eef90cbc0accc69dcd2ec0c010ed999690fe440985713201ee80df070fe84', '[\"*\"]', '2022-03-10 17:31:06', '2022-03-10 17:31:02', '2022-03-10 17:31:06'),
(206, 'App\\Models\\User', 1, 'dreamosophy', '534de08f729ab33db66680e86aae206b39ebbcc1fcf47fb3547eb317457c5cb2', '[\"*\"]', '2022-03-10 17:31:47', '2022-03-10 17:31:38', '2022-03-10 17:31:47'),
(207, 'App\\Models\\User', 1, 'dreamosophy', '1abbfebfeca656c22362a5dfa66192bb400f88ab807d11e16276aeecd58c16b0', '[\"*\"]', '2022-03-10 17:36:10', '2022-03-10 17:36:07', '2022-03-10 17:36:10'),
(208, 'App\\Models\\User', 1, 'dreamosophy', 'abf12c7950302ec0a952f3bfedcc4c9f14eea70c3c68fcf7f56fb4453fcc7a99', '[\"*\"]', '2022-03-10 17:38:45', '2022-03-10 17:36:47', '2022-03-10 17:38:45'),
(209, 'App\\Models\\User', 1, 'dreamosophy', '0a406c0b73225e62e28ee7006628bf2839a71e3887a6268670f6b5ce26e7ab74', '[\"*\"]', '2022-03-10 17:50:47', '2022-03-10 17:41:39', '2022-03-10 17:50:47'),
(210, 'App\\Models\\User', 1, 'dreamosophy', '1d7bc5ab113f685a1030e419a170946abd574afbf31d8a30ef655fa9a43bd3ec', '[\"*\"]', '2022-03-10 17:51:26', '2022-03-10 17:51:22', '2022-03-10 17:51:26'),
(211, 'App\\Models\\User', 1, 'dreamosophy', '6abecae4d6b35c3893577ff6a27a0c206b49fa381df58c0aa72282ee6d801447', '[\"*\"]', '2022-03-10 17:54:06', '2022-03-10 17:54:03', '2022-03-10 17:54:06'),
(212, 'App\\Models\\User', 1, 'dreamosophy', '110a54d173e58efa290a2730936ed14815d2149ca112a1e6e9cbe1f735e46b63', '[\"*\"]', '2022-03-10 18:00:37', '2022-03-10 18:00:33', '2022-03-10 18:00:37'),
(213, 'App\\Models\\User', 1, 'dreamosophy', 'a0bfbb4f911156d3afd3e4411230bbb9132dc90c40d945aad4c914fb938b3c95', '[\"*\"]', '2022-03-10 18:07:00', '2022-03-10 18:06:58', '2022-03-10 18:07:00'),
(214, 'App\\Models\\User', 1, 'dreamosophy', '19a16525a46932c5a29dbd0064a3e51de58589f0983948c0162c67d046ca4d41', '[\"*\"]', '2022-03-10 18:44:04', '2022-03-10 18:43:45', '2022-03-10 18:44:04'),
(215, 'App\\Models\\User', 1, 'dreamosophy', '2b42f8a4dd808a7333e255b641986f2fbe00da76970e09842726662bddc73b90', '[\"*\"]', '2022-03-10 18:47:49', '2022-03-10 18:47:35', '2022-03-10 18:47:49'),
(216, 'App\\Models\\User', 13, 'dreamosophy', 'e5993d913a015ca0ae0bc3d4a5b97285ba8f649d2eea84e6d7b7d8dd7053c64a', '[\"*\"]', '2022-03-10 19:05:55', '2022-03-10 19:01:25', '2022-03-10 19:05:55'),
(217, 'App\\Models\\User', 1, 'dreamosophy', '08e23c65da1a0b53b5eab4633bf9750e5978a0ed4bb122cd700bbc22e8b6d491', '[\"*\"]', '2022-03-10 19:08:18', '2022-03-10 19:08:18', '2022-03-10 19:08:18'),
(218, 'App\\Models\\User', 1, 'dreamosophy', 'a951b9cf18ebb7252dd43de7b1d0be546687bbba4e2e53b41742647fa88ceff4', '[\"*\"]', '2022-03-10 19:12:34', '2022-03-10 19:09:37', '2022-03-10 19:12:34'),
(219, 'App\\Models\\User', 1, 'dreamosophy', 'fa84f3798d82808f790642935d22ce7910e40c68eb99189cfb274e74510ab6f4', '[\"*\"]', '2022-03-10 19:21:19', '2022-03-10 19:18:24', '2022-03-10 19:21:19'),
(220, 'App\\Models\\User', 1, 'dreamosophy', 'f1e789cfa1fe6d37be768df26e024268ce14ad5e86819ad543a97dbf1a791bb1', '[\"*\"]', '2022-03-10 19:44:23', '2022-03-10 19:41:12', '2022-03-10 19:44:23'),
(221, 'App\\Models\\User', 1, 'dreamosophy', '71bb9098b635fc062d488b2705b2bfd3a6829b4dab96ab5ffca6d698e5504283', '[\"*\"]', '2022-03-10 19:59:02', '2022-03-10 19:56:14', '2022-03-10 19:59:02'),
(222, 'App\\Models\\User', 1, 'dreamosophy', 'd5005cb5a0e039e596f296e84219c4e5c8ec6dc1eb89f36e691ae75529d67894', '[\"*\"]', '2022-03-10 20:06:07', '2022-03-10 20:03:27', '2022-03-10 20:06:07'),
(223, 'App\\Models\\User', 1, 'dreamosophy', '78ec84135b7a32d962639659edac585e08b5267eb946eb1de2baeb3e08a5b71a', '[\"*\"]', '2022-03-10 20:09:44', '2022-03-10 20:06:56', '2022-03-10 20:09:44'),
(224, 'App\\Models\\User', 1, 'dreamosophy', '6cb957152479c9696ee7ad8b6dd15799e32c0d53af27cec409a75939f0c2084e', '[\"*\"]', '2022-03-10 20:14:44', '2022-03-10 20:12:03', '2022-03-10 20:14:44'),
(225, 'App\\Models\\User', 1, 'dreamosophy', '8bbcd86812cd0ffb7888ffb5b18eeeda942f8c9c11d53e6876911e26379e0f1f', '[\"*\"]', '2022-03-10 20:34:14', '2022-03-10 20:31:40', '2022-03-10 20:34:14'),
(226, 'App\\Models\\User', 1, 'dreamosophy', 'ac79cab857cf35f08092507d072e7bbddbb72bf2d51315ff92f4f1ae91301bf2', '[\"*\"]', '2022-03-10 20:36:05', '2022-03-10 20:35:58', '2022-03-10 20:36:05'),
(227, 'App\\Models\\User', 1, 'dreamosophy', '15e1605ffb5e99bed6e34c90aaf75c10bbffe677ca3dcfcaefc00941b13ad78e', '[\"*\"]', '2022-03-10 20:38:11', '2022-03-10 20:38:02', '2022-03-10 20:38:11'),
(228, 'App\\Models\\User', 1, 'dreamosophy', 'af47842f16e1a6719e9bd16263297692d679ec2beaec2c646a261b601330864f', '[\"*\"]', '2022-03-12 16:37:30', '2022-03-12 16:37:21', '2022-03-12 16:37:30'),
(229, 'App\\Models\\User', 1, 'dreamosophy', 'b0768213678bffe1ee5ebd18e9cb1f20c6d32c0f03f22166ddc48979364b746a', '[\"*\"]', '2022-03-13 14:58:35', '2022-03-13 14:58:31', '2022-03-13 14:58:35'),
(230, 'App\\Models\\User', 1, 'dreamosophy', '502e718ef14d8c1d862455e3206e2f5d4d02c45e6cd2e708aad225af6a61af8f', '[\"*\"]', '2022-03-13 21:49:35', '2022-03-13 21:49:02', '2022-03-13 21:49:35'),
(231, 'App\\Models\\User', 9, 'dreamosophy', 'd2f20cd44688647583f0511ca34ef7c2c853b547c9a0349a06feb80a71904717', '[\"*\"]', '2022-03-14 17:13:10', '2022-03-14 17:10:13', '2022-03-14 17:13:10'),
(232, 'App\\Models\\User', 1, 'dreamosophy', 'c37d235062d7faf6d7dcb387218943b8d369fe9fccc57189b2b760eb4042a862', '[\"*\"]', '2022-03-15 15:40:47', '2022-03-15 15:40:32', '2022-03-15 15:40:47'),
(233, 'App\\Models\\User', 9, 'dreamosophy', '15c0030f4f9f4c6f72de95ac8f5a33e0e857482be7179343a55d9b387a8c7da2', '[\"*\"]', '2022-03-15 16:36:04', '2022-03-15 16:35:55', '2022-03-15 16:36:04'),
(234, 'App\\Models\\User', 1, 'dreamosophy', '7a8e62873e83b4ffa85ee84dfbb6c0c7efbc160b244dd9283d24daf3955570a4', '[\"*\"]', '2022-03-16 21:36:28', '2022-03-16 21:35:51', '2022-03-16 21:36:28'),
(235, 'App\\Models\\User', 9, 'dreamosophy', 'b3f76fdf6583c4b6cafb192775fa484d99a08cb344e840487791ed4e11202f12', '[\"*\"]', '2022-03-17 14:52:58', '2022-03-17 14:52:51', '2022-03-17 14:52:58'),
(236, 'App\\Models\\User', 9, 'dreamosophy', '0aed6bd2e622ae7899dd1aae6349b61cc53f87988e758a4a1a8aca00c738df39', '[\"*\"]', '2022-03-18 17:14:06', '2022-03-18 15:38:30', '2022-03-18 17:14:06'),
(237, 'App\\Models\\User', 9, 'dreamosophy', '898464f051fb0100e0b0bb400110b282ed369b4e1ba5ae38bb77d8a72091268d', '[\"*\"]', '2022-03-18 17:14:42', '2022-03-18 16:41:32', '2022-03-18 17:14:42'),
(238, 'App\\Models\\User', 9, 'dreamosophy', '3abb3eeedfee88385bfafb4fb3ff4ad56e22f87fe613ad7763345e31aef27797', '[\"*\"]', '2022-03-18 17:28:34', '2022-03-18 17:25:39', '2022-03-18 17:28:34'),
(239, 'App\\Models\\User', 9, 'dreamosophy', 'ed4da5471955623f74b58e392a12271bf09a666929753a3c2a7bb1bef2b4cb2d', '[\"*\"]', '2022-03-18 18:54:31', '2022-03-18 18:05:24', '2022-03-18 18:54:31'),
(240, 'App\\Models\\User', 10, 'dreamosophy', 'a944488ec61145858fdc0ec74c2ce4a44d9b4f88467b4bd2a891905cb46c9667', '[\"*\"]', '2022-03-19 14:58:23', '2022-03-19 14:50:56', '2022-03-19 14:58:23'),
(241, 'App\\Models\\User', 9, 'dreamosophy', '0e65d41df1b5e1e8686b2a1aa713114d690788dc25dc95429860677d39a874e5', '[\"*\"]', '2022-03-19 15:33:11', '2022-03-19 14:51:37', '2022-03-19 15:33:11'),
(242, 'App\\Models\\User', 9, 'dreamosophy', '0d461e0b2cf700d8721a42a0687b44d5d98c8d036a9508df5e3afae11879f942', '[\"*\"]', NULL, '2022-03-20 06:14:24', '2022-03-20 06:14:24'),
(243, 'App\\Models\\User', 21, 'dreamosophy', '366abeab177b9ab7f5165743f5479956220ee8f1a5b236036ff3a796c6315279', '[\"*\"]', '2022-03-20 09:20:33', '2022-03-20 09:20:07', '2022-03-20 09:20:33'),
(244, 'App\\Models\\User', 21, 'dreamosophy', 'f75a12cd5f0fb15c7c6fc2a0bf59986350f88c21e1959ae8b28b2b18c0fa78a9', '[\"*\"]', '2022-03-20 09:54:44', '2022-03-20 09:20:45', '2022-03-20 09:54:44'),
(245, 'App\\Models\\User', 21, 'dreamosophy', '80ac744fd3ea48eec0c8b219a99ed07a394c32a2607db66b61a08c6980ff887e', '[\"*\"]', '2022-03-20 09:57:12', '2022-03-20 09:56:50', '2022-03-20 09:57:12'),
(246, 'App\\Models\\User', 21, 'dreamosophy', '5b5a3a3f2e297f2ec01c5fcf9db80f4a72260c448a3a6dce9d3895de7db9e653', '[\"*\"]', '2022-03-20 09:57:34', '2022-03-20 09:57:33', '2022-03-20 09:57:34'),
(247, 'App\\Models\\User', 21, 'dreamosophy', 'c8d1ea0e5278c4d5b6318bd17899009efe560c2b69803ae3dbf9eb7dcce010fd', '[\"*\"]', '2022-03-20 09:58:55', '2022-03-20 09:58:55', '2022-03-20 09:58:55'),
(248, 'App\\Models\\User', 21, 'dreamosophy', '15022829a8563c28cf3b6a4ecb18a40a034e9c46c1d511bfa808b73d8db5d86a', '[\"*\"]', '2022-03-20 10:29:38', '2022-03-20 10:26:47', '2022-03-20 10:29:38'),
(249, 'App\\Models\\User', 21, 'dreamosophy', '31e144b1486ba93ff078331aa6a33b0c9467930fbdd5c7a222c03259815807f6', '[\"*\"]', '2022-03-20 10:36:43', '2022-03-20 10:33:39', '2022-03-20 10:36:43'),
(250, 'App\\Models\\User', 9, 'dreamosophy', '652c19e91410297afc8a3afbc0a059c25f90f103f79e714b16ddf3668131ea31', '[\"*\"]', '2022-03-21 14:37:25', '2022-03-21 14:37:23', '2022-03-21 14:37:25'),
(251, 'App\\Models\\User', 9, 'dreamosophy', '77a02705da3f7a60b86dc69df80c0d88403a0643c279bbdedece5a9331d64584', '[\"*\"]', '2022-03-21 14:41:42', '2022-03-21 14:41:41', '2022-03-21 14:41:42'),
(252, 'App\\Models\\User', 9, 'dreamosophy', '83bb3cdc4fc48cde5bddf1aa91b27e8d149ff8665dd160b31bf667edaccddb4e', '[\"*\"]', '2022-03-21 18:07:55', '2022-03-21 18:07:54', '2022-03-21 18:07:55'),
(253, 'App\\Models\\User', 9, 'dreamosophy', '9ae00ed6d246cc4e1dcc2b344d1d48e2236cddef759d6e95393568446191dc72', '[\"*\"]', '2022-03-21 18:12:36', '2022-03-21 18:12:35', '2022-03-21 18:12:36'),
(254, 'App\\Models\\User', 9, 'dreamosophy', '1ce05de2171327ceddf19f0454a61e4ee0783b06da3ab792c7ae88f038146695', '[\"*\"]', '2022-03-21 18:18:56', '2022-03-21 18:18:56', '2022-03-21 18:18:56'),
(255, 'App\\Models\\User', 9, 'dreamosophy', 'b31dc6de17d713dd4dd6cf4d5cc53983f0cdc75a30f126f52a3fb551eff5c1ae', '[\"*\"]', '2022-03-21 18:25:47', '2022-03-21 18:25:46', '2022-03-21 18:25:47'),
(256, 'App\\Models\\User', 9, 'dreamosophy', '3f1575d23691d3aea60641dc912e3e86080fa9582eabdc73003aa1ac22c853cc', '[\"*\"]', '2022-03-21 18:41:33', '2022-03-21 18:41:32', '2022-03-21 18:41:33'),
(257, 'App\\Models\\User', 9, 'dreamosophy', '7f989efc533eda0c29b2e3eea125967afb6ec2ba2a27c3095085398ea6f7b46f', '[\"*\"]', '2022-03-21 18:55:59', '2022-03-21 18:45:23', '2022-03-21 18:55:59'),
(258, 'App\\Models\\User', 9, 'dreamosophy', 'e079970595d206a7e7b63e8458b4fc99f6fbe7b0e5fb7e8659117447ea7cf5d0', '[\"*\"]', '2022-03-21 19:17:34', '2022-03-21 19:07:03', '2022-03-21 19:17:34'),
(259, 'App\\Models\\User', 9, 'dreamosophy', '27c75da66ac2d3fa2f5a1260330c5904b8cb9f776f33c0c15d37f6fe58e52da6', '[\"*\"]', '2022-03-21 19:19:03', '2022-03-21 19:18:53', '2022-03-21 19:19:03'),
(260, 'App\\Models\\User', 9, 'dreamosophy', '6b5b1bacdc02966be853089140c07cf6ed4390cd9eced1c43dd097197e0462dc', '[\"*\"]', '2022-03-22 16:17:49', '2022-03-22 15:04:52', '2022-03-22 16:17:49'),
(261, 'App\\Models\\User', 9, 'dreamosophy', '3de41b8be02cc2336b687471260d9e34cf6585833ac8e005c06def37d24e8eab', '[\"*\"]', '2022-03-23 14:35:44', '2022-03-23 14:35:44', '2022-03-23 14:35:44');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(262, 'App\\Models\\User', 9, 'dreamosophy', 'a0fd65a3345bb73e915a3a5ed45d9bbc08451a65e56af00c05a17f007fa916be', '[\"*\"]', '2022-03-23 14:51:06', '2022-03-23 14:48:06', '2022-03-23 14:51:06'),
(263, 'App\\Models\\User', 9, 'dreamosophy', '43800cd0ddcfc891b872645a70a3f55bb5f08ea88d9b842e08dc5d4f9368b604', '[\"*\"]', '2022-03-23 14:51:37', '2022-03-23 14:51:36', '2022-03-23 14:51:37'),
(264, 'App\\Models\\User', 22, 'dreamosophy', '293830364024ec8d44e3bd3e0d4c82c3a5a6f0141bd5d65d862c90e38426e113', '[\"*\"]', '2022-03-23 15:22:04', '2022-03-23 15:15:18', '2022-03-23 15:22:04'),
(265, 'App\\Models\\User', 22, 'dreamosophy', '1fcb45d6904cb3d766a9b513f8ebd21fb940bf4e18b47a9080b126304232807a', '[\"*\"]', '2022-03-23 15:21:05', '2022-03-23 15:20:48', '2022-03-23 15:21:05'),
(266, 'App\\Models\\User', 9, 'dreamosophy', '736d8563b3feaa31c6d28b57fbfd864227738c102173530aa217ee14dd440020', '[\"*\"]', NULL, '2022-03-23 15:21:27', '2022-03-23 15:21:27'),
(267, 'App\\Models\\User', 22, 'dreamosophy', '166588bea126201b89d4a528e913e070132bb7fb0a2de4c630e036ccdcead5b7', '[\"*\"]', '2022-03-23 15:21:47', '2022-03-23 15:21:38', '2022-03-23 15:21:47'),
(268, 'App\\Models\\User', 22, 'dreamosophy', '491555897293c5898e49167a3585335203f4440cf2bcfa4a5b365fea7c677cb7', '[\"*\"]', '2022-03-23 15:32:55', '2022-03-23 15:28:15', '2022-03-23 15:32:55'),
(269, 'App\\Models\\User', 22, 'dreamosophy', 'd51c811805a28dc240d283abadc80c2e9c2443873c5e1c5cae36cd5ff263b15e', '[\"*\"]', '2022-03-23 15:49:14', '2022-03-23 15:44:36', '2022-03-23 15:49:14'),
(270, 'App\\Models\\User', 22, 'dreamosophy', 'a7db017b6a8117ec54f2f90f4e267208fe22e5490fd12d40501ea44e00c2d029', '[\"*\"]', '2022-03-23 15:58:35', '2022-03-23 15:48:47', '2022-03-23 15:58:35'),
(271, 'App\\Models\\User', 22, 'dreamosophy', '781879f1e31067c41294831a7f768a9b9d3c8a3c6d2992e5d92281b5866fa084', '[\"*\"]', '2022-03-23 16:04:03', '2022-03-23 15:49:57', '2022-03-23 16:04:03'),
(272, 'App\\Models\\User', 22, 'dreamosophy', 'b22c735c73424abb27ddbafccbd796c7bc93093f00954a93435325e3b1904b9b', '[\"*\"]', '2022-03-24 14:46:14', '2022-03-24 14:42:23', '2022-03-24 14:46:14'),
(273, 'App\\Models\\User', 22, 'dreamosophy', 'c90c6f80e93d181a7f0e8286e20203ccd646824d1cfb1b5419fb2cd61641084c', '[\"*\"]', '2022-03-24 18:29:39', '2022-03-24 18:03:57', '2022-03-24 18:29:39'),
(274, 'App\\Models\\User', 22, 'dreamosophy', 'ebb9a505c655d9d1fa81210e74701aefd4f424d85701fc7a3b45fb961a7249e0', '[\"*\"]', '2022-03-24 18:47:13', '2022-03-24 18:42:31', '2022-03-24 18:47:13'),
(275, 'App\\Models\\User', 24, 'dreamosophy', 'dd29ad97209acb69e8117a4a503f2573284a296f7d343c5462e99ef089973b00', '[\"*\"]', '2022-03-25 18:53:55', '2022-03-25 18:53:21', '2022-03-25 18:53:55'),
(276, 'App\\Models\\User', 25, 'dreamosophy', '99bba8f9a05d7b1eeef40a8af39e1af8d053aac254fdc83e31faf99d9afc6b08', '[\"*\"]', '2022-03-25 19:12:36', '2022-03-25 19:00:15', '2022-03-25 19:12:36'),
(277, 'App\\Models\\User', 25, 'dreamosophy', 'a34f1fe5d00b908daa298d0b84003849fd64acfe0d69f1166b5a2cfad2d1da5c', '[\"*\"]', '2022-03-25 19:35:43', '2022-03-25 19:14:28', '2022-03-25 19:35:43'),
(278, 'App\\Models\\User', 25, 'dreamosophy', 'b0ef58717183497eb376c636edfc5eff1fa3f9f2992b85a3b7c8e5ca0154540c', '[\"*\"]', '2022-03-25 19:47:44', '2022-03-25 19:44:52', '2022-03-25 19:47:44'),
(279, 'App\\Models\\User', 13, 'dreamosophy', '41a3518f0c0e5c72652d7a089326ed6d35777edd593a1dc79df67d3fd14f57d4', '[\"*\"]', '2022-03-26 10:10:46', '2022-03-26 10:10:34', '2022-03-26 10:10:46'),
(280, 'App\\Models\\User', 1, 'dreamosophy', 'a125a20447e1f839e73ed0a76f3bece604fba4dc67e8ae33d782ccdf039b7551', '[\"*\"]', '2022-03-26 10:15:30', '2022-03-26 10:13:31', '2022-03-26 10:15:30'),
(281, 'App\\Models\\User', 13, 'dreamosophy', 'b7d66a2e788d3a0f3fb3e11402471073a10866c574df74bada93d1eb69bf572c', '[\"*\"]', '2022-03-26 10:16:31', '2022-03-26 10:15:41', '2022-03-26 10:16:31'),
(282, 'App\\Models\\User', 1, 'dreamosophy', 'b7a0cd86608d71c6773d7b479437a010c68b652a9370cf3eb658894d031ffcac', '[\"*\"]', '2022-03-26 10:17:12', '2022-03-26 10:16:46', '2022-03-26 10:17:12'),
(283, 'App\\Models\\User', 13, 'dreamosophy', '633f3b8f872318d1b0e6339b12fea6f558b38b62db1beca9e4fc300087260822', '[\"*\"]', '2022-03-26 10:17:26', '2022-03-26 10:17:20', '2022-03-26 10:17:26'),
(284, 'App\\Models\\User', 13, 'dreamosophy', 'f2b05f5190d5accccfaf41016f4d8eea63e5a6d37e89bfb58f5c4986ce1b3ed1', '[\"*\"]', '2022-03-26 10:17:44', '2022-03-26 10:17:40', '2022-03-26 10:17:44'),
(285, 'App\\Models\\User', 13, 'dreamosophy', 'a0de42a9a43c9799cdf3c3e6acf383db53386d50038a5ee5e93fdbcd30b7ab5f', '[\"*\"]', '2022-03-26 10:19:16', '2022-03-26 10:19:12', '2022-03-26 10:19:16'),
(286, 'App\\Models\\User', 13, 'dreamosophy', 'f3ebaa5f5fc008d5be4806429f9147e50b243b6232805c854a12a20b324ae1be', '[\"*\"]', '2022-03-26 10:24:58', '2022-03-26 10:23:10', '2022-03-26 10:24:58'),
(287, 'App\\Models\\User', 13, 'dreamosophy', '544ef604836d4d465c53e5633c5093678c9249e70d842eb237e891a82ba63d1b', '[\"*\"]', '2022-03-26 10:27:07', '2022-03-26 10:27:01', '2022-03-26 10:27:07'),
(288, 'App\\Models\\User', 13, 'dreamosophy', '355592224f97a2fcf2fae6685dad7a5d537b30f607aad8911caa0b9968dcba33', '[\"*\"]', '2022-03-26 10:30:45', '2022-03-26 10:30:41', '2022-03-26 10:30:45'),
(289, 'App\\Models\\User', 13, 'dreamosophy', 'eaef9c429b3907caafe4f05120826a050e2510cedb168c84fd9bce5b61b9211a', '[\"*\"]', '2022-03-26 10:32:48', '2022-03-26 10:32:43', '2022-03-26 10:32:48'),
(290, 'App\\Models\\User', 13, 'dreamosophy', 'b5fdfee4710b5e50c46b8bf4ff0e7f8e7989dcceb286cb45034203adb646e7e1', '[\"*\"]', '2022-03-26 10:34:04', '2022-03-26 10:34:02', '2022-03-26 10:34:04'),
(291, 'App\\Models\\User', 13, 'dreamosophy', 'f157b6945e6395305092ec7158bb8af5bd19be8e0527f0fe911b55557fb33c2c', '[\"*\"]', '2022-03-26 10:38:04', '2022-03-26 10:37:42', '2022-03-26 10:38:04'),
(292, 'App\\Models\\User', 13, 'dreamosophy', '0f2f3c5742f6138447768887e0e084adfe44ab8e15eb27cde550453baafc48d9', '[\"*\"]', '2022-03-26 10:38:27', '2022-03-26 10:38:25', '2022-03-26 10:38:27'),
(293, 'App\\Models\\User', 1, 'dreamosophy', '383f0ff090b12cfb3d692862ae887e82de91332562a593b83399b03e91944af2', '[\"*\"]', '2022-03-26 10:39:01', '2022-03-26 10:38:51', '2022-03-26 10:39:01'),
(294, 'App\\Models\\User', 1, 'dreamosophy', '5dd0bda586c6328326ed0442ecaae8f28f52b2ef2505f52e93efe75075f285eb', '[\"*\"]', '2022-03-26 10:40:26', '2022-03-26 10:40:22', '2022-03-26 10:40:26'),
(295, 'App\\Models\\User', 13, 'dreamosophy', 'c9c7506e5495b3ef4082fecbfe3e1ceb4e3931545034580c708d2059507737ca', '[\"*\"]', '2022-03-26 10:46:18', '2022-03-26 10:45:40', '2022-03-26 10:46:18'),
(296, 'App\\Models\\User', 1, 'dreamosophy', '42ef8d50a4dbfa8a963dd671d2578a218beddbc7eeabf247733830e328e2bc1f', '[\"*\"]', '2022-03-26 10:49:14', '2022-03-26 10:46:55', '2022-03-26 10:49:14'),
(297, 'App\\Models\\User', 13, 'dreamosophy', '4fad08fed8154eb9e65d443cb7938c413b8df0d723ac329a8161c9b48ee59af8', '[\"*\"]', '2022-03-26 10:50:34', '2022-03-26 10:50:14', '2022-03-26 10:50:34'),
(298, 'App\\Models\\User', 25, 'dreamosophy', 'aef5ce0e49c2db3545dd97b21ef7911d801e873b1a7cd433d539e0fa4bfc5c1b', '[\"*\"]', '2022-03-26 11:27:40', '2022-03-26 10:55:48', '2022-03-26 11:27:40'),
(299, 'App\\Models\\User', 1, 'dreamosophy', '63d0082ed81c77739f7082a97c83ecd5847ac6f4be724666903ad18961b49763', '[\"*\"]', '2022-03-26 17:31:27', '2022-03-26 17:20:10', '2022-03-26 17:31:27'),
(300, 'App\\Models\\User', 13, 'dreamosophy', '0d8bb65ff431d07269f9b43601292565522ea01f3fef8a350bb27d49ae8044b2', '[\"*\"]', '2022-03-26 17:31:42', '2022-03-26 17:30:31', '2022-03-26 17:31:42'),
(301, 'App\\Models\\User', 13, 'dreamosophy', 'ee64fb7e43abc94bce8ac9ef5ea1955b9311541926666988dcabd96be612d20d', '[\"*\"]', '2022-03-27 05:22:14', '2022-03-27 05:22:10', '2022-03-27 05:22:14'),
(302, 'App\\Models\\User', 13, 'dreamosophy', 'b1631fa9f8cdcd85e15bfea3ef60a3cf667d7e30fdfeb34c76d624a9260198e2', '[\"*\"]', '2022-03-27 05:22:38', '2022-03-27 05:22:35', '2022-03-27 05:22:38'),
(303, 'App\\Models\\User', 13, 'dreamosophy', 'ed6956e229da82db2edca536101b1eb1be0a0937f44f433e1e1ade6f92af5491', '[\"*\"]', '2022-03-27 05:24:02', '2022-03-27 05:23:57', '2022-03-27 05:24:02'),
(304, 'App\\Models\\User', 13, 'dreamosophy', '6177a95182a279993709e14a8efddd5e7c7002366645803d0343bf6447637efe', '[\"*\"]', '2022-03-27 05:29:06', '2022-03-27 05:28:59', '2022-03-27 05:29:06'),
(305, 'App\\Models\\User', 13, 'dreamosophy', '67afb752bbc5da650fb5e6da0b60facedd940d2f5be1d75611e16092d432d9d8', '[\"*\"]', '2022-03-27 05:31:41', '2022-03-27 05:31:38', '2022-03-27 05:31:41'),
(306, 'App\\Models\\User', 13, 'dreamosophy', '000f9430fc6b67497b414152d18f116b862ea9781c846968c70630ceef00bf71', '[\"*\"]', '2022-03-27 05:33:04', '2022-03-27 05:32:56', '2022-03-27 05:33:04'),
(307, 'App\\Models\\User', 13, 'dreamosophy', 'd7394a11902afb890e37db95959fc0cc71d57a1db35f2d572377cd0dc3fa27e0', '[\"*\"]', '2022-03-27 05:35:20', '2022-03-27 05:34:44', '2022-03-27 05:35:20'),
(308, 'App\\Models\\User', 13, 'dreamosophy', 'f82b04c41c400412500b12bf462390a1a8a80ef96294c0a73bd12c0ca38846cc', '[\"*\"]', '2022-03-27 05:48:28', '2022-03-27 05:48:22', '2022-03-27 05:48:28'),
(309, 'App\\Models\\User', 13, 'dreamosophy', '549d797c156c7d3b7c51046f59e742f60d551ce78b9b46ed22f58bfdd6e695ad', '[\"*\"]', '2022-03-27 05:49:35', '2022-03-27 05:49:29', '2022-03-27 05:49:35'),
(310, 'App\\Models\\User', 13, 'dreamosophy', '6b25ceddb77efdcce5ce02a2d08841e834371108ad33cd2c62ee52b490958667', '[\"*\"]', '2022-03-27 05:53:35', '2022-03-27 05:53:19', '2022-03-27 05:53:35'),
(311, 'App\\Models\\User', 13, 'dreamosophy', '44157f80bbfab9b330f38ff5412ebffa69c00d45782ee45038a2352099d84007', '[\"*\"]', '2022-03-27 08:33:05', '2022-03-27 08:32:53', '2022-03-27 08:33:05'),
(312, 'App\\Models\\User', 13, 'dreamosophy', '6eab41a8001db602a52bd942fa0016c0ce415261331e5bcec5b2df51b59e8554', '[\"*\"]', '2022-03-27 08:35:04', '2022-03-27 08:35:02', '2022-03-27 08:35:04'),
(313, 'App\\Models\\User', 13, 'dreamosophy', '0dd6840e84aa74eeb4218c5a29181c4e37ea2367ca5712595524657a35463a0a', '[\"*\"]', '2022-03-27 09:21:15', '2022-03-27 09:14:52', '2022-03-27 09:21:15'),
(314, 'App\\Models\\User', 1, 'dreamosophy', 'df139d07c302ef9f860f13a31261dc9fdb5acd603ddaf7729c740fd8bc1f93fb', '[\"*\"]', '2022-03-27 09:18:57', '2022-03-27 09:15:03', '2022-03-27 09:18:57'),
(315, 'App\\Models\\User', 1, 'dreamosophy', 'fe48b0888123aa7975634017275160ed42690626f3c7ce540be2f2115fa8b37f', '[\"*\"]', '2022-03-27 09:23:18', '2022-03-27 09:20:25', '2022-03-27 09:23:18'),
(316, 'App\\Models\\User', 1, 'dreamosophy', 'f5843ea8b63dd60bb094a2cbf15cdeb05fcc89695d63fd7058f62ec4efe7a662', '[\"*\"]', '2022-03-27 09:33:29', '2022-03-27 09:30:42', '2022-03-27 09:33:29'),
(317, 'App\\Models\\User', 13, 'dreamosophy', '805714cf743cda98d28ca65f9684f30f67bf7cd5ae1f4f222af7d98e3f00343c', '[\"*\"]', '2022-03-27 18:49:32', '2022-03-27 18:47:17', '2022-03-27 18:49:32'),
(318, 'App\\Models\\User', 13, 'dreamosophy', '13c8e70857c129f3298a687d929c5df2e58cdad1468e20133378ce13bed358b1', '[\"*\"]', '2022-03-28 17:55:23', '2022-03-28 17:54:51', '2022-03-28 17:55:23'),
(319, 'App\\Models\\User', 1, 'dreamosophy', '1ad0210679304d84db1401d922f4b0b8103aa40d1913ba976d25d2c01a57c167', '[\"*\"]', '2022-03-28 18:00:45', '2022-03-28 18:00:32', '2022-03-28 18:00:45'),
(320, 'App\\Models\\User', 1, 'dreamosophy', '9e9277d7398618d5ff3eadb03147998101fe54e363516f820ac27220e1d751d1', '[\"*\"]', '2022-03-28 18:08:38', '2022-03-28 18:02:36', '2022-03-28 18:08:38'),
(321, 'App\\Models\\User', 26, 'dreamosophy', '613d59a7b2f2e58948f8bb5f2212f45a84fff28ff62114ea896c9e9702f994c4', '[\"*\"]', '2022-03-29 05:53:09', '2022-03-29 05:38:01', '2022-03-29 05:53:09'),
(322, 'App\\Models\\User', 25, 'dreamosophy', '0e4ff501071a04f91a0f5921983f7cfc0d37a99d3e9705589527356723998af0', '[\"*\"]', '2022-03-29 16:52:00', '2022-03-29 16:43:01', '2022-03-29 16:52:00'),
(323, 'App\\Models\\User', 26, 'dreamosophy', 'c297cfd20444352051fca5597de2c7e65b1348748e2ef1dce738771dd35f5a86', '[\"*\"]', '2022-03-30 07:33:17', '2022-03-30 07:00:11', '2022-03-30 07:33:17'),
(324, 'App\\Models\\User', 13, 'dreamosophy', '90a2010fb92d406234a6aa7e6dee71e8b90c74545958ac78dba88186f1c8a27b', '[\"*\"]', '2022-04-02 17:22:20', '2022-04-02 17:22:15', '2022-04-02 17:22:20'),
(325, 'App\\Models\\User', 1, 'dreamosophy', 'f3fe201782c1cceeb041b4868b77ce09b6ba7a38c3d50e3c8ccd85a5139fd15f', '[\"*\"]', NULL, '2022-04-02 17:28:55', '2022-04-02 17:28:55'),
(326, 'App\\Models\\User', 13, 'dreamosophy', 'ca6f0abaf48e6e4325be87406c574b9620f3fdf6f525f584fbb9dd5ac3c5cc5f', '[\"*\"]', '2022-04-02 17:33:42', '2022-04-02 17:33:37', '2022-04-02 17:33:42'),
(327, 'App\\Models\\User', 13, 'dreamosophy', '3f72545f1da45f481d0df18d6b1818af474cc948b06f18b0f71f692a41259a3f', '[\"*\"]', '2022-04-02 17:47:50', '2022-04-02 17:46:48', '2022-04-02 17:47:50'),
(328, 'App\\Models\\User', 13, 'dreamosophy', '83c93821f224274655fff0e076878fb05fc380a01beaf6ed4b6fc9b8f2e1bade', '[\"*\"]', '2022-04-02 17:56:54', '2022-04-02 17:55:05', '2022-04-02 17:56:54'),
(329, 'App\\Models\\User', 1, 'dreamosophy', '07823f9f3c8d46b55feca64c4de7401adbeba54968fa64020091c52f65d57d3d', '[\"*\"]', '2022-04-02 18:12:00', '2022-04-02 18:11:08', '2022-04-02 18:12:00'),
(330, 'App\\Models\\User', 1, 'dreamosophy', '8cdf03e6e00af7d7ae6bcbdfc88aebd31a6d6ae6911c41a2651526884d604e00', '[\"*\"]', '2022-04-03 05:11:13', '2022-04-03 05:11:07', '2022-04-03 05:11:13'),
(331, 'App\\Models\\User', 1, 'dreamosophy', 'c020f0099b087d5b3bb9d420dc044f378471e74b0d867f6fcc6ab4a10a7cf08b', '[\"*\"]', '2022-04-03 15:57:07', '2022-04-03 15:56:47', '2022-04-03 15:57:07'),
(332, 'App\\Models\\User', 13, 'dreamosophy', '3962fc59241f32cbd1006a7d04ed36b9560a179a6be108e17e05f5893ed0625d', '[\"*\"]', '2022-04-04 17:27:01', '2022-04-04 17:25:45', '2022-04-04 17:27:01'),
(333, 'App\\Models\\User', 27, 'dreamosophy', '1b603bdf564b6feb12ec34a6432fee0977c2796d48c4a8781a5ce578aa48d461', '[\"*\"]', '2022-04-05 17:14:02', '2022-04-05 17:04:09', '2022-04-05 17:14:02'),
(334, 'App\\Models\\User', 1, 'dreamosophy', '4c883a89858107d65fbe4dcd8e99fd8cef987db52102ac409dca98c0ee8895c9', '[\"*\"]', NULL, '2022-04-07 16:47:34', '2022-04-07 16:47:34'),
(335, 'App\\Models\\User', 27, 'dreamosophy', '2f1d79e3c410ecbd38e44ec81e1d78ad2253dc8471d9088986f99016086d9ff2', '[\"*\"]', '2022-04-10 14:24:59', '2022-04-10 14:24:58', '2022-04-10 14:24:59'),
(336, 'App\\Models\\User', 27, 'dreamosophy', '4d46cd99f5f298b87d2b941becfff45d711beaf1cd053fcf97a5ba4e5e5a9114', '[\"*\"]', '2022-04-10 14:43:39', '2022-04-10 14:42:30', '2022-04-10 14:43:39'),
(337, 'App\\Models\\User', 27, 'dreamosophy', 'e32f90ca10cb38f4bc2c1efb5758a4f60b717fde69dc66c86c45b35f5e168141', '[\"*\"]', '2022-04-10 14:45:31', '2022-04-10 14:45:22', '2022-04-10 14:45:31'),
(338, 'App\\Models\\User', 27, 'dreamosophy', '31037f88ad27919b98dc56c049a22fe6cc337e1e353db89346a4bfe9d2fd77db', '[\"*\"]', '2022-04-10 14:47:46', '2022-04-10 14:47:45', '2022-04-10 14:47:46'),
(339, 'App\\Models\\User', 13, 'dreamosophy', '8f3324544e6951a22f05e6a8aaeeeedaa76c6143d33342ce9303e0facdba4ce8', '[\"*\"]', '2022-04-13 17:35:42', '2022-04-13 17:32:57', '2022-04-13 17:35:42'),
(340, 'App\\Models\\User', 25, 'dreamosophy', 'b89c0f807caed8a76a55edf551bf9c8f50c236ea9b1abd48f2966523b8ceaa2d', '[\"*\"]', '2022-04-13 21:47:52', '2022-04-13 21:47:52', '2022-04-13 21:47:52'),
(341, 'App\\Models\\User', 25, 'dreamosophy', 'da54833cfa0e5018ca7aac1e472ac958dbc3865a2c96b9bad7bf8e6f1031fd2b', '[\"*\"]', '2022-04-13 22:26:07', '2022-04-13 22:16:07', '2022-04-13 22:26:07'),
(342, 'App\\Models\\User', 25, 'dreamosophy', 'ced8a61af7939d2278abaa92da888de046bf2e35cb5b4c5f3059b04e02e4a8af', '[\"*\"]', '2022-04-14 15:54:40', '2022-04-14 15:54:40', '2022-04-14 15:54:40'),
(343, 'App\\Models\\User', 25, 'dreamosophy', '8df959fd8d3c88a93555534c7600b028a3bf8edd1cdbe02f13ed366e0b1052f6', '[\"*\"]', '2022-04-14 15:57:50', '2022-04-14 15:57:50', '2022-04-14 15:57:50'),
(344, 'App\\Models\\User', 25, 'dreamosophy', '4e0daca0664656d8a48c883bb7219f94207f9c5f53e7e9f544c54690df23dd3a', '[\"*\"]', '2022-04-15 02:31:06', '2022-04-15 02:25:22', '2022-04-15 02:31:06'),
(345, 'App\\Models\\User', 13, 'dreamosophy', 'ca0581af78719989b7015e9fe9fafb8f7e87a662c35d2258ee0f0c198bb70a2e', '[\"*\"]', '2022-04-15 07:09:50', '2022-04-15 07:09:47', '2022-04-15 07:09:50'),
(346, 'App\\Models\\User', 13, 'dreamosophy', '067e8f5af23e513fcc14c477eaac83ce1ac0770a0cf2140b67b2e22ddf9ddb40', '[\"*\"]', '2022-04-15 07:18:54', '2022-04-15 07:14:09', '2022-04-15 07:18:54'),
(347, 'App\\Models\\User', 25, 'dreamosophy', '332fc1caf9d32739110632873a56c31dbf2299d69e61052f737c1e04c2da7c95', '[\"*\"]', '2022-04-15 16:07:59', '2022-04-15 15:56:20', '2022-04-15 16:07:59'),
(348, 'App\\Models\\User', 27, 'dreamosophy', 'd0df58f91872f40ea57295d20271334777524c4b217fd5ea7a645b5e09fabf2a', '[\"*\"]', '2022-04-15 16:59:22', '2022-04-15 16:59:10', '2022-04-15 16:59:22'),
(349, 'App\\Models\\User', 27, 'dreamosophy', 'f044d116082fd331fd221b227d0a91a662126d11711d53c088494824eaf41e99', '[\"*\"]', '2022-04-15 18:33:17', '2022-04-15 18:33:14', '2022-04-15 18:33:17'),
(350, 'App\\Models\\User', 13, 'dreamosophy', '043996623d80ea4e632f4b9cad09d0f3d4942fcc0a765a9626ad4c6ccc2ce2d1', '[\"*\"]', '2022-04-16 13:12:14', '2022-04-16 12:50:46', '2022-04-16 13:12:14'),
(351, 'App\\Models\\User', 13, 'dreamosophy', '8285cf981ed369456b693ac2b35216d512bbf7c51bd59e009de58dc5fb7b86b4', '[\"*\"]', '2022-04-16 13:18:56', '2022-04-16 13:16:48', '2022-04-16 13:18:56'),
(352, 'App\\Models\\User', 1, 'dreamosophy', '4dff67abf59dc04b16ecff4f7e56f18dab459ea65ba2846a31ec2bec0b6f649e', '[\"*\"]', '2022-04-16 16:17:18', '2022-04-16 16:16:17', '2022-04-16 16:17:18'),
(353, 'App\\Models\\User', 27, 'dreamosophy', '774d05914d1eb52f66d3b71f32adf282c702437cbb933611bbf3b8e70fcef7a2', '[\"*\"]', '2022-04-16 17:07:50', '2022-04-16 17:07:15', '2022-04-16 17:07:50'),
(354, 'App\\Models\\User', 27, 'dreamosophy', '3c9cff62f8c092819071dc54161ce31769c8f64c2410bf7602861fc584f529f2', '[\"*\"]', '2022-04-16 17:08:46', '2022-04-16 17:08:43', '2022-04-16 17:08:46'),
(355, 'App\\Models\\User', 1, 'dreamosophy', '525d9b8fad670ff9b767acb6c92a2a64867dac72a4c71ebbe6f04fb22b481e2a', '[\"*\"]', '2022-04-16 17:10:54', '2022-04-16 17:10:34', '2022-04-16 17:10:54'),
(356, 'App\\Models\\User', 1, 'dreamosophy', 'd99f695039c194aa6f391508ec02676b84c9a0ac1d483a3d21fed247a0952342', '[\"*\"]', '2022-04-16 17:11:25', '2022-04-16 17:11:20', '2022-04-16 17:11:25'),
(357, 'App\\Models\\User', 1, 'dreamosophy', 'd4ca49f6218179df7c3c0df2baba912666004cf539c75caabd0efa85dc47c410', '[\"*\"]', '2022-04-16 17:46:55', '2022-04-16 17:46:49', '2022-04-16 17:46:55'),
(358, 'App\\Models\\User', 1, 'dreamosophy', '16fbf88e0056179169d8596202e6207d9dd0467f43f5b765aa0c675d37361c17', '[\"*\"]', '2022-04-16 17:47:58', '2022-04-16 17:47:56', '2022-04-16 17:47:58'),
(359, 'App\\Models\\User', 1, 'dreamosophy', '22d423bd916ebf3dcd196d1dbd698106671c7e81b3a756e00ab3fd56bba65941', '[\"*\"]', '2022-04-16 17:49:40', '2022-04-16 17:49:37', '2022-04-16 17:49:40'),
(360, 'App\\Models\\User', 1, 'dreamosophy', '19adb9f3cabc6df7686aef806cc655085d66e803ceb78e3026ab6cd0693d1842', '[\"*\"]', '2022-04-16 18:18:11', '2022-04-16 18:18:09', '2022-04-16 18:18:11'),
(361, 'App\\Models\\User', 13, 'dreamosophy', '4b3eee8afedcdd84501faf39ed9320ef6cb897eb0dd910d4504410198647eab4', '[\"*\"]', '2022-04-20 16:59:46', '2022-04-20 16:37:40', '2022-04-20 16:59:46'),
(362, 'App\\Models\\User', 13, 'dreamosophy', '5540431acf30e579f3c8d990c572ee5e0aed5c89f320ec6f3bb758bdf3f17717', '[\"*\"]', '2022-04-20 17:35:19', '2022-04-20 17:33:06', '2022-04-20 17:35:19'),
(363, 'App\\Models\\User', 13, 'dreamosophy', '1c31dca30ecefa258ef164d9fde7cf7aedcc4e56bdebec6e1debdaf2cd1bb67e', '[\"*\"]', '2022-04-26 13:51:33', '2022-04-26 13:51:32', '2022-04-26 13:51:33'),
(364, 'App\\Models\\User', 13, 'dreamosophy', 'db202fef2d03679e99a1a12b4fb02e165a595c09fcdbb6461e0420dc38130a4c', '[\"*\"]', '2022-04-26 13:59:17', '2022-04-26 13:54:46', '2022-04-26 13:59:17'),
(365, 'App\\Models\\User', 13, 'dreamosophy', '1f402b5a0adf2848cd31574f52b248187a39783c84d25823e87cf76cea501eb7', '[\"*\"]', '2022-04-28 19:12:37', '2022-04-28 19:12:36', '2022-04-28 19:12:37'),
(366, 'App\\Models\\User', 13, 'dreamosophy', '87e7fbd4e92f798d6d3338cc77fa413e4b1060db83e8d4d95e30405410a0e7ae', '[\"*\"]', '2022-04-30 07:03:48', '2022-04-30 07:03:46', '2022-04-30 07:03:48'),
(367, 'App\\Models\\User', 13, 'dreamosophy', 'b74acaaa44fb107afba717db0834e9282d6f8e607484a4cf4ad473bd5b51c59f', '[\"*\"]', '2022-04-30 07:10:15', '2022-04-30 07:10:13', '2022-04-30 07:10:15'),
(368, 'App\\Models\\User', 13, 'dreamosophy', '3cec14e317c877f5b94ee5cd2df852e225ffb8310dc8f8efab0f56f569417c04', '[\"*\"]', '2022-04-30 07:22:01', '2022-04-30 07:12:58', '2022-04-30 07:22:01'),
(369, 'App\\Models\\User', 13, 'dreamosophy', '4f34ac229a993668319136383dc162ca19a17b844ee9362df4f85a8142666c56', '[\"*\"]', '2022-05-03 17:45:05', '2022-05-03 17:45:04', '2022-05-03 17:45:05'),
(370, 'App\\Models\\User', 13, 'dreamosophy', '1f1ac8fc95aa50b1e20a895ea780c5d722cdc991a61af4b6a935b0f2f7d0f921', '[\"*\"]', '2022-05-03 18:30:31', '2022-05-03 18:30:28', '2022-05-03 18:30:31'),
(371, 'App\\Models\\User', 13, 'dreamosophy', '2a1a831f791cae0f1fc30179d96aa279974337a932acdfe3a9ecbc00e92680d8', '[\"*\"]', '2022-05-03 18:33:45', '2022-05-03 18:31:14', '2022-05-03 18:33:45'),
(372, 'App\\Models\\User', 25, 'dreamosophy', 'ca66ba1e611511537fe2019ab01097ee53be2db0d89c9b344a90d9a20c4f3dbd', '[\"*\"]', '2022-05-04 19:22:25', '2022-05-04 19:15:37', '2022-05-04 19:22:25'),
(373, 'App\\Models\\User', 25, 'dreamosophy', '59990936acd7a9467d42d19b5afe8e4ec8aecf3472416381347497551f5a2fc2', '[\"*\"]', '2022-05-04 19:34:26', '2022-05-04 19:27:03', '2022-05-04 19:34:26'),
(374, 'App\\Models\\User', 25, 'dreamosophy', 'a350b93cf94129c7e7e092095ef2deb5c0f7b723303305ca763e0a4055465d36', '[\"*\"]', '2022-05-04 19:56:52', '2022-05-04 19:50:46', '2022-05-04 19:56:52'),
(375, 'App\\Models\\User', 25, 'dreamosophy', '6d4f02260b3f8b4df9cb25e323fda9105f418611a197a89a27b26fa075d4e84e', '[\"*\"]', '2022-05-04 20:04:34', '2022-05-04 20:04:33', '2022-05-04 20:04:34'),
(376, 'App\\Models\\User', 25, 'dreamosophy', '8bbf8ee44756f4d66f99c9f24e628bd7658fdddce401c9bc48a41a154946ba45', '[\"*\"]', '2022-05-04 20:17:22', '2022-05-04 20:12:39', '2022-05-04 20:17:22'),
(377, 'App\\Models\\User', 31, 'dreamosophy', '6ce2e9ce67aafa4e251e1e79e67f97410a2a9e4ba1fd4e3097be8340abd63f33', '[\"*\"]', '2022-05-05 03:33:23', '2022-05-05 03:33:23', '2022-05-05 03:33:23'),
(378, 'App\\Models\\User', 31, 'dreamosophy', 'ea428b845e3eafe2dbc449966f15a81fcd63aba838b6db3625533902d7b27201', '[\"*\"]', '2022-05-05 03:42:43', '2022-05-05 03:42:39', '2022-05-05 03:42:43'),
(379, 'App\\Models\\User', 32, 'dreamosophy', '0b213a72983527e3832a0790808750dc9a375fd88a1f445ac7223ec781258db6', '[\"*\"]', '2022-05-09 13:14:56', '2022-05-09 13:14:56', '2022-05-09 13:14:56'),
(380, 'App\\Models\\User', 25, 'dreamosophy', '5d2628594a2112c1cded693927937257467995908316439a8918643204262efb', '[\"*\"]', '2022-05-09 13:38:43', '2022-05-09 13:38:43', '2022-05-09 13:38:43'),
(381, 'App\\Models\\User', 32, 'dreamosophy', 'a1728b378c54b249238b50e39432d7737b3aecbd9bd19d575718ea16960af28a', '[\"*\"]', '2022-05-09 13:42:08', '2022-05-09 13:42:06', '2022-05-09 13:42:08'),
(382, 'App\\Models\\User', 32, 'dreamosophy', '7026fef3b1be839c880a08d261336ac5980d160b22dbace8b2512fad1645abd4', '[\"*\"]', '2022-05-09 13:55:05', '2022-05-09 13:53:59', '2022-05-09 13:55:05'),
(383, 'App\\Models\\User', 32, 'dreamosophy', '2fc6bfba533b6f514d2b957ca325a7feb4afe43f53351229b1f92a91f44e6aaf', '[\"*\"]', '2022-05-09 13:57:43', '2022-05-09 13:57:43', '2022-05-09 13:57:43'),
(384, 'App\\Models\\User', 31, 'dreamosophy', '58f7b80f062a3381fa41840c0f59a52d14e5761e9086c1f02045a4610b93ffaf', '[\"*\"]', '2022-05-10 18:08:15', '2022-05-10 18:06:23', '2022-05-10 18:08:15'),
(385, 'App\\Models\\User', 22, 'dreamosophy', 'cd8d96fa181da4f75720654c25cd42ac0660b4e61973a499f08b238415a2ca99', '[\"*\"]', '2022-05-10 18:20:00', '2022-05-10 18:15:51', '2022-05-10 18:20:00'),
(386, 'App\\Models\\User', 1, 'dreamosophy', 'a78c03fa71b3c23f47d767e12b2464f3ad7f5c85970638ae90b5eb58b32cd09e', '[\"*\"]', '2022-05-11 18:31:54', '2022-05-11 18:31:53', '2022-05-11 18:31:54'),
(387, 'App\\Models\\User', 1, 'dreamosophy', 'a40bd2ec598644de78ac268f3918d20c9ad194e3b9a4249e73672e0c25f02655', '[\"*\"]', '2022-05-11 19:01:41', '2022-05-11 19:01:40', '2022-05-11 19:01:41'),
(388, 'App\\Models\\User', 22, 'dreamosophy', '4441a96b8fe579c47c1178981d19fc37864b15d69ad2b80afdb77978b2fa8694', '[\"*\"]', '2022-05-13 13:33:09', '2022-05-13 13:32:22', '2022-05-13 13:33:09'),
(389, 'App\\Models\\User', 1, 'dreamosophy', '752197d60d0f8c3b179f0b7b47b122b970a4bf8bd5f75774d5242cb5b9f7abbd', '[\"*\"]', '2022-05-17 16:05:15', '2022-05-17 16:04:05', '2022-05-17 16:05:15'),
(390, 'App\\Models\\User', 1, 'dreamosophy', '103822dc39e8a7a09eabad1108d0424c00d913413b7e8bf53a5abe6990b6c13a', '[\"*\"]', '2022-05-17 17:56:34', '2022-05-17 17:56:33', '2022-05-17 17:56:34'),
(391, 'App\\Models\\User', 1, 'dreamosophy', 'e4c8b204223a1b0bb9832f89d6286d280b0cb3eee440d6df61b96d61b6ff4f30', '[\"*\"]', '2022-05-17 18:10:14', '2022-05-17 18:10:14', '2022-05-17 18:10:14'),
(392, 'App\\Models\\User', 1, 'dreamosophy', 'f359b2ef18b0209b0ab549fd51fa944ec94e1d537931d55fcfee24839952b75f', '[\"*\"]', '2022-05-17 18:15:43', '2022-05-17 18:15:39', '2022-05-17 18:15:43'),
(393, 'App\\Models\\User', 1, 'dreamosophy', '18c63564745e89c51ce05c2176f3e4a1c63dd83cf235b66ca551ea40e71dda96', '[\"*\"]', '2022-05-17 18:23:51', '2022-05-17 18:23:37', '2022-05-17 18:23:51'),
(394, 'App\\Models\\User', 1, 'dreamosophy', '81de3a9114eef4f8fd8fc9f70a83397c71bce40f41fee5a8b1374aa41ec14e48', '[\"*\"]', '2022-05-21 10:51:39', '2022-05-21 10:47:03', '2022-05-21 10:51:39'),
(395, 'App\\Models\\User', 33, 'dreamosophy', '4926a3dfb42483a75223f87bb0a4988d1def44f42976c265fce7ecdb1d8ea3bf', '[\"*\"]', '2022-05-21 14:36:46', '2022-05-21 14:26:57', '2022-05-21 14:36:46'),
(396, 'App\\Models\\User', 33, 'dreamosophy', '12905cb17387d5d783f4014a063397b0f00636e5bcea979b407f58224595d87a', '[\"*\"]', '2022-05-21 14:39:19', '2022-05-21 14:39:19', '2022-05-21 14:39:19'),
(397, 'App\\Models\\User', 33, 'dreamosophy', '141bbf7a81ef93cac0d9958262307923ee64062f427ae7622946ec7c0d0ecf0d', '[\"*\"]', '2022-05-22 18:16:27', '2022-05-22 18:16:27', '2022-05-22 18:16:27'),
(398, 'App\\Models\\User', 33, 'dreamosophy', '411dc543b80b7c5030744fe5be9206f37cc8a54f2d8685a3e5449cd231836385', '[\"*\"]', '2022-05-22 19:24:17', '2022-05-22 19:17:41', '2022-05-22 19:24:17'),
(399, 'App\\Models\\User', 33, 'dreamosophy', 'a0549a408a845c06e551a60e8162915c25937838b79e8357a5c90f634dd3adcf', '[\"*\"]', '2022-05-22 19:24:53', '2022-05-22 19:24:52', '2022-05-22 19:24:53'),
(400, 'App\\Models\\User', 33, 'dreamosophy', '5582a0eaf65afe7db477934c11b4039b28a464d26005a550c39329f09ac54b74', '[\"*\"]', '2022-05-22 19:27:18', '2022-05-22 19:27:17', '2022-05-22 19:27:18'),
(401, 'App\\Models\\User', 33, 'dreamosophy', 'c578549451313dc7f0f55c6ae1b7ac557cbd26d8388be9a8e41d6be8b0b979f0', '[\"*\"]', '2022-05-22 19:35:37', '2022-05-22 19:32:14', '2022-05-22 19:35:37'),
(402, 'App\\Models\\User', 33, 'dreamosophy', 'c2ddd347da74b803aadf30fe3f96ea8f1de214f7519a7fbf47d8b248765f60ac', '[\"*\"]', '2022-05-22 19:53:17', '2022-05-22 19:38:06', '2022-05-22 19:53:17'),
(403, 'App\\Models\\User', 34, 'dreamosophy', 'b1e506e9cf6291fbdd7b10ce3ebe746c0e881393d9da70edcda988283f422cc3', '[\"*\"]', '2022-06-02 05:32:15', '2022-06-02 05:30:00', '2022-06-02 05:32:15'),
(404, 'App\\Models\\User', 34, 'dreamosophy', 'aab672f26ceb26aa8b90c444b9f0951ea864c6db0d177437e037a1532a93b294', '[\"*\"]', '2022-06-02 05:32:48', '2022-06-02 05:32:44', '2022-06-02 05:32:48'),
(405, 'App\\Models\\User', 34, 'dreamosophy', '78b89132bd19aa5c91836318aebf4ae8fb1a944328a53af70a9d0c41502c4614', '[\"*\"]', '2022-06-02 06:15:24', '2022-06-02 06:15:23', '2022-06-02 06:15:24'),
(406, 'App\\Models\\User', 34, 'dreamosophy', '0e52df71d04a1118fd49182cbfbd455fe54d343cca79b29c37ca3a5ac47c1abf', '[\"*\"]', '2022-06-03 11:50:47', '2022-06-03 11:33:49', '2022-06-03 11:50:47'),
(407, 'App\\Models\\User', 34, 'dreamosophy', 'bb76293aefa97df3a253cba1fbb433047be71445d0b38f416fc34d2c94b06c3e', '[\"*\"]', '2022-06-03 12:17:21', '2022-06-03 11:55:09', '2022-06-03 12:17:21'),
(408, 'App\\Models\\User', 34, 'dreamosophy', 'b89d474869344518539d5f2c17f332a66c155acb32bc8992d3cb96d6e90ddb29', '[\"*\"]', '2022-06-03 12:42:10', '2022-06-03 12:42:09', '2022-06-03 12:42:10'),
(409, 'App\\Models\\User', 34, 'dreamosophy', '4a64d8e597da429a0ce590d25bdc81cae899fff5207862dee2ea5b0e73ae6568', '[\"*\"]', '2022-06-03 15:15:31', '2022-06-03 15:15:31', '2022-06-03 15:15:31'),
(410, 'App\\Models\\User', 34, 'dreamosophy', 'b344db832d74da747b64dba1f7fdaeebfc75605074f25b78711a2f40e1a3dbd6', '[\"*\"]', '2022-06-03 15:36:32', '2022-06-03 15:36:32', '2022-06-03 15:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `id` bigint UNSIGNED NOT NULL,
  `height` double(8,2) NOT NULL DEFAULT '0.00',
  `dream_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plants`
--

INSERT INTO `plants` (`id`, `height`, `dream_id`, `created_at`, `updated_at`) VALUES
(1, 0.00, 7, '2022-02-15 20:48:50', '2022-02-15 20:48:50'),
(2, 0.00, 8, '2022-02-16 15:43:10', '2022-02-16 15:44:16'),
(3, 0.00, 9, '2022-02-19 17:21:33', '2022-02-19 17:21:33'),
(4, 0.00, 10, '2022-02-20 15:48:13', '2022-02-20 15:48:13'),
(5, 0.00, 11, '2022-02-20 16:17:32', '2022-02-20 16:17:32'),
(6, 0.00, 12, '2022-02-20 17:03:21', '2022-02-20 17:03:21'),
(7, 0.00, 13, '2022-02-20 18:48:21', '2022-02-20 18:48:21'),
(8, 0.00, 14, '2022-02-22 15:35:21', '2022-02-22 15:35:21'),
(9, 0.00, 15, '2022-02-22 15:56:43', '2022-02-22 15:56:43'),
(10, 0.00, 16, '2022-02-22 18:08:30', '2022-02-22 18:08:30'),
(11, 0.00, 17, '2022-02-23 15:12:09', '2022-02-23 15:12:09'),
(12, 0.00, 18, '2022-02-25 15:54:41', '2022-02-25 15:54:41'),
(13, 0.00, 19, '2022-02-25 15:54:52', '2022-02-25 15:54:52'),
(14, 0.00, 20, '2022-02-25 16:32:49', '2022-02-25 16:32:49'),
(15, 0.00, 21, '2022-02-25 16:32:56', '2022-02-25 16:32:56'),
(16, 0.00, 22, '2022-02-25 16:33:06', '2022-02-25 16:33:06'),
(17, 0.09, 23, '2022-02-26 17:22:38', '2022-03-07 18:46:52'),
(18, 0.25, 24, '2022-02-26 17:23:18', '2022-03-07 18:46:52'),
(19, 0.25, 25, '2022-02-27 17:03:33', '2022-03-07 18:47:25'),
(20, 0.13, 26, '2022-02-27 18:08:08', '2022-03-07 18:46:52'),
(21, 2.76, 27, '2022-02-28 06:40:48', '2022-03-02 19:45:32'),
(22, 0.00, 28, '2022-03-01 18:18:18', '2022-03-01 18:18:18'),
(23, 0.20, 29, '2022-03-01 18:18:24', '2022-03-06 16:43:22'),
(24, 0.06, 30, '2022-03-05 18:49:42', '2022-03-07 18:46:57'),
(25, 0.03, 31, '2022-03-06 15:32:12', '2022-03-07 18:46:57'),
(26, 0.06, 32, '2022-03-06 15:32:31', '2022-03-07 18:46:57'),
(27, 0.00, 33, '2022-03-07 14:51:06', '2022-03-07 18:24:30'),
(28, 0.03, 34, '2022-03-07 15:00:29', '2022-03-07 18:24:30'),
(29, 0.03, 35, '2022-03-07 18:16:57', '2022-03-07 18:24:30'),
(30, 0.00, 36, '2022-03-18 17:08:05', '2022-03-18 17:08:05'),
(31, 0.00, 37, '2022-03-18 17:10:11', '2022-03-18 17:10:11'),
(32, 0.00, 38, '2022-03-18 17:10:17', '2022-03-18 17:10:17'),
(33, 0.65, 39, '2022-03-18 18:09:32', '2022-03-21 18:54:00'),
(34, 0.65, 40, '2022-03-20 09:53:35', '2022-03-20 09:54:43'),
(35, 0.12, 41, '2022-03-23 15:56:31', '2022-03-23 16:03:54'),
(36, 0.00, 42, '2022-03-23 15:58:12', '2022-03-23 15:58:12'),
(37, 0.18, 43, '2022-03-23 16:02:37', '2022-03-23 16:03:02'),
(38, 0.34, 44, '2022-03-24 18:18:24', '2022-03-24 18:20:49'),
(39, 0.40, 45, '2022-03-25 19:24:02', '2022-03-25 19:29:31'),
(40, 0.34, 46, '2022-03-25 19:25:55', '2022-03-25 19:27:55'),
(41, 0.56, 47, '2022-03-25 19:30:43', '2022-03-25 19:31:47'),
(42, 2.11, 48, '2022-03-25 19:33:09', '2022-03-26 11:13:51'),
(43, 1.95, 49, '2022-03-26 11:07:50', '2022-03-26 11:17:30'),
(44, 0.62, 50, '2022-03-26 11:22:27', '2022-03-26 11:23:29'),
(45, 0.18, 51, '2022-04-13 22:22:53', '2022-04-15 16:03:56'),
(46, 0.34, 52, '2022-04-15 07:18:53', '2022-04-16 13:03:04'),
(47, 0.15, 53, '2022-04-16 13:04:33', '2022-04-16 13:05:20'),
(48, 0.40, 54, '2022-04-16 13:04:34', '2022-04-16 13:05:10'),
(49, 0.22, 55, '2022-04-16 13:06:19', '2022-04-16 13:07:20'),
(50, 0.15, 56, '2022-04-16 13:08:30', '2022-04-16 13:08:46'),
(51, 0.31, 57, '2022-04-16 13:09:04', '2022-04-16 13:09:25'),
(52, 0.00, 58, '2022-06-03 12:17:05', '2022-06-03 12:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `scenes`
--

CREATE TABLE `scenes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `garden_level` int NOT NULL,
  `scene` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scenes`
--

INSERT INTO `scenes` (`id`, `user_id`, `garden_level`, `scene`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 'Base64 is a binary-to-text encoding scheme. It\'s represented as printable ASCII characters where each Base64 character contains 6 bits of binary information.', '2022-02-25 15:23:23', '2022-02-25 15:23:23'),
(2, 8, 2, 'Base64 is a binary-to-text encoding scheme. It\'s represented as printable ASCII characters where each Base64 character contains 6 bits of binary information.', '2022-02-25 15:23:38', '2022-02-25 15:23:38'),
(3, 22, 1, 'Base64 is a binary-to-text encoding scheme. It\'s represented as printable ASCII characters where each Base64 character contains 6 bits of binary information.', '2022-05-13 13:32:31', '2022-05-13 13:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `likes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dislikes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_level` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `dob`, `bio`, `interest`, `profile_pic`, `likes`, `dislikes`, `experience_level`) VALUES
(1, 'Arnab', 'arnab@gmail.com', '2022-02-10 20:53:57', '$2y$10$L9x3BwkSxafNJ2YEGOVkkOIQe/.kCddtwfGteLZ31C/L7P1upNJmS', NULL, '2022-02-10 20:53:34', '2022-05-21 10:51:02', '2021-11-27', 'I Am Good', 'abc', 'http://137.184.83.68/storage/profile_pics/1646673420-arnab.png', 'Games', NULL, 1),
(2, 'AAA', 'AAA@gmail.com', '2022-02-11 16:47:23', '$2y$10$cXHbcHmet7gbQH5LYUoOluIADU0lokmNpbjMHYIC0ajpkzw258txa', NULL, '2022-02-11 16:25:10', '2022-02-11 16:47:23', '2021-11-27', NULL, NULL, NULL, NULL, NULL, 1),
(3, 'BBB', 'BBB@gmail.com', '2022-02-11 16:46:42', '$2y$10$00zAwQAQnv9i1ozOJFEdh.0e05FrE/.rpmfiMVoCWklxOaFQfFcFa', NULL, '2022-02-11 16:25:29', '2022-02-11 16:46:42', '2021-11-27', NULL, NULL, NULL, NULL, NULL, 1),
(4, 'nithish', 'nithish2106@gmail.com', '2022-02-11 16:44:58', '$2y$10$S2QmfFHaFq13xz.knyms8.9.T1ODfp1gooOh8xeHtQ4.8Yi6B/11O', NULL, '2022-02-11 16:27:57', '2022-02-11 16:44:58', '2021-11-27', NULL, NULL, NULL, NULL, NULL, 1),
(5, 'Testing1', 'Testing1@gmail.com', '2022-02-19 15:45:27', '$2y$10$FoP228zaZsNYbPHemKU5euQ5Me7F7TafCJeW6bReIXGde8/THO.wW', NULL, '2022-02-19 15:41:36', '2022-02-19 15:45:27', '1994-02-21', NULL, NULL, NULL, NULL, NULL, 1),
(6, 'testing2', 'testing2@gmail.com', '2022-02-19 15:58:34', '$2y$10$fQrJ39qLlPP6Py0gU9Xiu.NDNwbhgRNtPAAqozxxXLdvc/flBTzjS', NULL, '2022-02-19 15:57:39', '2022-02-19 15:58:34', '2020-02-21', NULL, NULL, NULL, NULL, NULL, 1),
(7, 'John Doe', 'john@gmail.com', '2022-02-19 19:29:41', '$2y$10$KyRjE90Rh7yU3j.1T.zjv.otKLKnkfT0uiw/vZGXRy/WV/epI74nO', NULL, '2022-02-19 19:29:19', '2022-02-19 19:29:41', '2021-11-27', NULL, NULL, NULL, NULL, NULL, 1),
(8, 'testing3', 'testing3@gmail.com', '2022-02-20 16:11:43', '$2y$10$q8eXyPP3rDhPscfcBLz/VuZR26Il0CtRmW63GQTMuL5a.FqMNp5UK', NULL, '2022-02-20 16:10:41', '2022-02-20 16:11:43', '1994-06-21', NULL, NULL, NULL, NULL, NULL, 1),
(9, 'test4', 't4@g.com', '2022-02-26 17:18:52', '$2y$10$7z6rrRC7oVz6lAmGwPSOY.0tYz9jqvnK5P/Xa.LqJ59KzVUvX7THi', NULL, '2022-02-26 17:18:38', '2022-03-18 17:14:42', '1991-05-21', NULL, NULL, NULL, NULL, NULL, 1),
(10, 'tes5', 't5@g.com', '2022-02-26 17:25:57', '$2y$10$V4YuJkqR47B7wjIrcXlyouz3GwL.osKGHNQZafpMMhZY6ooYpk40e', NULL, '2022-02-26 17:25:41', '2022-02-26 17:29:26', '1994-02-21', 'Software developer', '[1,2,4]', NULL, 'Cooking', 'Hiking', 1),
(11, 'Surya', 'suryakantac66@gmail.com', NULL, '$2y$10$n0n9Ypaf8bQ23BzRim3knu4c3aGeAzPvZxbLeOpGEiFf.JRxFtESy', NULL, '2022-03-04 19:11:28', '2022-03-04 19:11:28', '1995-11-01', NULL, NULL, NULL, NULL, NULL, 1),
(12, 'nithishtesting1', 'nithishtesting1@gmail.com', '2022-03-07 14:38:39', '$2y$10$9Kv39cXT5lkd744ZC/3Xue1mVu.r2KvsjHn7whUp6zaH0qGNLR0Jy', NULL, '2022-03-07 14:38:01', '2022-03-07 14:38:39', '1994-06-21', NULL, NULL, NULL, NULL, NULL, 1),
(13, 'Suryakanta Choudhury', 'abc@gmail.com', '2022-03-07 18:10:33', '$2y$10$HFkn.db2GmsnTUcnKUsP..OkRixdL4j.ai2ukDSjMAcG7j.E1B.x.', NULL, '2022-03-07 18:10:19', '2022-03-26 10:38:04', '1995-11-01', 'Iamgoodperson', NULL, 'http://137.184.83.68/storage/profile_pics/1648291084-suryakanta_choudhury.png', NULL, NULL, 1),
(14, 'Tester', 'A@gmail.com', NULL, '$2y$10$LX5lGUFgMRTUTWSYPyypIeNeU2FN1R0SiS4nn7tRXxBIiXbOIM3EG', NULL, '2022-03-19 19:59:43', '2022-03-19 19:59:43', '2000-01-01', NULL, NULL, NULL, NULL, NULL, 1),
(15, 'Tester', 'chaari143@gmail.com', NULL, '$2y$10$DlAb0Sw5d2yvYqKX1PkTqe8m97h/inP7of1i4cvGQjdurHxfs7tqG', NULL, '2022-03-19 20:00:40', '2022-03-19 20:00:40', '1993-10-04', NULL, NULL, NULL, NULL, NULL, 1),
(16, 'Tester', 'Ab@gmail.com', NULL, '$2y$10$rvUE8vukqAwTYqfAy0IF2e8QtvCw1Ur0VdJLY4PPhmaLGkewKUdRe', NULL, '2022-03-20 05:51:26', '2022-03-20 05:51:26', '1993-10-10', NULL, NULL, NULL, NULL, NULL, 1),
(17, 'Tester', 'Abcd@gmail.com', NULL, '$2y$10$ImIq.BbpT2LUWe8bjb.Ej.qXskPBs2MNvIgwh9p.RRxGE4jsnnMRu', NULL, '2022-03-20 05:52:08', '2022-03-20 05:52:08', '1010-10-10', NULL, NULL, NULL, NULL, NULL, 1),
(18, 'Testing6', 'testing6@gmail.com', NULL, '$2y$10$Nif6JbNrnytN2ixS8LxpeeNUEyGh6KxSe028clsA7DJ63f4cAUHTK', NULL, '2022-03-20 06:10:41', '2022-03-20 06:10:41', '1994-06-21', NULL, NULL, NULL, NULL, NULL, 1),
(19, 'John Doe', 'john3@gmail.com', NULL, '$2y$10$YXGqgg27gICZGg6totqxqe5tVcOnKKuGVGTHp1Tske.0YFW/1J2Sy', NULL, '2022-03-20 06:12:53', '2022-03-20 06:12:53', '2021-11-27', NULL, NULL, NULL, NULL, NULL, 1),
(20, 'testtomg7', 'testtomg7@gmail.com', NULL, '$2y$10$M3p/2A9fiChF40OmVasdDOXQCgZwS4Yls4CbrghGVXzLAp.dBxnTC', NULL, '2022-03-20 06:15:20', '2022-03-20 06:15:20', '1994-06-21', NULL, NULL, NULL, NULL, NULL, 1),
(21, 'Tester', 'abc@abc.com', '2022-03-20 09:19:52', '$2y$10$x3dCUqLT6rIY8pue7BDWCOi4Ck.FQfO.PO5HzSWReHRyVytpeh6PO', NULL, '2022-03-20 09:19:36', '2022-03-20 10:36:42', '2000-12-20', 'awdawdawd', 'awdawd', NULL, 'awdawdawdawdawdawdawdawdawdawdawdawdawedawdawdawdawdawedawd', NULL, 1),
(22, 'testing7', 'testing7@gmail.com', '2022-03-23 15:15:05', '$2y$10$7pybYhvu/fOpE4lKi6i5JeEyXp9PdzRa6oZAFqyrXHDkrikxifqg6', NULL, '2022-03-23 15:14:19', '2022-03-24 14:44:35', '1994-06-21', NULL, NULL, NULL, NULL, NULL, 3),
(23, 'Paul Sheldon', 'pmsheldon@gmail.com', NULL, '$2y$10$T8t/epJyjgHv/3Ma6Ri6PObWm6YjFL2ObZN2Czwp6YfYMkeMit7vC', NULL, '2022-03-25 18:07:30', '2022-03-25 18:07:30', '1951-10-16', NULL, NULL, NULL, NULL, NULL, 1),
(24, 'Abcdef', 'bcg@gmail.com', '2022-03-25 18:53:03', '$2y$10$Ph1EcAmEJJ083HJhnxflZOeIVVOIuLkeD.IctdA2PKXoewYyyxIJO', NULL, '2022-03-25 18:52:52', '2022-03-25 18:53:54', '1444-11-01', 'abcd', NULL, NULL, NULL, NULL, 1),
(25, 'Gordon Osgood', 'abcd@direct.com', '2022-03-25 18:59:51', '$2y$10$MyRPNYniwppu9lJngQVpuu7I3hX6ziQLqk7iZIEQgmM9duFNWYP3q', NULL, '2022-03-25 18:59:14', '2022-03-25 19:15:34', '1951-10-16', 'This is Gordon Osgood\'s short bio', 'Garden of Dreams Game', NULL, 'People, dreams', 'mean people', 1),
(26, 't5j5n4r1', 'dharma.sidhaartha@gmail.com', '2022-03-29 05:37:35', '$2y$10$oom.WTSFXMLC65FMa/uaOO10TsAMRa9RE0IrO5C./BBLuzqCxC8He', NULL, '2022-03-29 05:36:55', '2022-03-29 05:37:35', '1993-05-16', NULL, NULL, NULL, NULL, NULL, 1),
(27, 'Tester', 'Test@test.com', '2022-04-05 17:03:54', '$2y$10$HcsgxlkYDpHcZZx.pZllReUxxFqERrL0L3aZOrTyuWkZAt7jb.PJS', NULL, '2022-04-05 17:03:26', '2022-04-05 17:03:54', '2000-02-02', NULL, NULL, NULL, NULL, NULL, 1),
(28, 'Paul Sheldon', 'paul@dreamosophy.com', NULL, '$2y$10$y7fRimX0l0ZmdvKwQL3wPuxWOOhQi1lHVtU.z/L30nwZgVUAhMiMW', NULL, '2022-04-15 03:52:24', '2022-04-15 03:52:24', '1951-10-16', NULL, NULL, NULL, NULL, NULL, 1),
(29, 'Dhruba', 'dhruba.karmakar@digidrub.com', NULL, '$2y$10$XnlVa29w/.18X7KIvzVXwe1MOIelua1h/DFs8dph7gVILkMW826Qe', NULL, '2022-04-15 19:57:45', '2022-04-15 19:57:45', '2000-01-01', NULL, NULL, NULL, NULL, NULL, 1),
(30, 'Paul Sheldon', 'limnosophy@gmail.com', NULL, '$2y$10$kXpsVSk8Pm.X3CvQKpEED.1wRyfAGv/oJrsWYfBR6kg86w5U5jr1y', NULL, '2022-05-04 20:19:57', '2022-05-04 20:19:57', '1951-10-16', NULL, NULL, NULL, NULL, NULL, 1),
(31, 'Tester', 'Test@gmail.com', '2022-05-05 03:33:03', '$2y$10$ikmrUiH8Yy1a0FOcWiSUxe3M3MY1wC4gfyZ4wal2z9/1Ng68edwfi', NULL, '2022-05-05 03:32:46', '2022-05-05 03:33:03', '1993-10-02', NULL, NULL, NULL, NULL, NULL, 1),
(32, 'Paul Sheldon', 'imaginaryemail@dreamosophy.com', '2022-05-09 13:14:36', '$2y$10$SGo0xaZCcHZLqdXzZEofI.C8LG2uRdmzIuvafIqHbakiOuMxVhMm6', NULL, '2022-05-09 13:14:00', '2022-05-09 13:14:36', '1951-10-16', NULL, NULL, NULL, NULL, NULL, 1),
(33, 'Jaw DvaildvbalidbaloiwdvblaiwdvliawdvblaiwdvbloqiwadvloiawdvblaoiodgbLaOwIudAoLwIdawidblpiAwUdlaiwdbliawdliabsdliewgbadibdalidvablwidbawildbawoidpaoiwdbaoiwdbapodgbaliwdgbdliAw', 'Potti@Test.com', '2022-05-21 14:26:44', '$2y$10$e90BoA8mdyM2NP6xOd4a.Omw4P4q5cISw6TJLe95AbfRfqr/Q73oq', NULL, '2022-05-21 14:26:20', '2022-05-21 14:35:55', '2000-02-02', 'I am a Hell Born son with a gun to send you back to hell okayyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', NULL, 'http://137.184.83.68/storage/profile_pics/1653143700-test.png', 'ojabW:idbail;dbALOIHDvbliawdvblAI:Wdjvbail9wdblaidawudvalwidAVDWLiavselibvsaFOliugbzilueashd0iawhdwo;awdgbp;awp;doawgbo;abdabdaiouwdb;pao9uwdbp;aow9dugbawo:dbawo;9pdugabwdp;o9uagbwdsp;ouagbdp;aodgb', NULL, 1),
(34, 'T5j5', 'Testing123@gmail.com', '2022-06-02 05:29:22', '$2y$10$vXl44BXoAx5zKETiUZSEduX97ZfHwPWtHtZxv/Ft.MhGxVnHVuhoW', NULL, '2022-06-02 05:29:01', '2022-06-02 05:32:15', '1990-05-04', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_meta`
--

INSERT INTO `user_meta` (`id`, `user_id`, `meta_key`, `meta_value`) VALUES
(5, 2, 'watched_tutorial', '1'),
(6, 3, 'watched_tutorial', '1'),
(9, 5, 'watched_tutorial', '1'),
(10, 7, 'rating', '0'),
(11, 7, 'hoots', '0'),
(13, 8, 'rating', '2'),
(14, 8, 'hoots', '0'),
(16, 8, 'watched_tutorial', '1'),
(17, 9, 'rating', '0'),
(18, 9, 'hoots', '9200'),
(20, 10, 'rating', '0'),
(21, 10, 'hoots', '1100'),
(23, 9, 'facebook_url', 'www.facebook.com'),
(24, 9, 'linkedin_url', 'www.linkedin.com'),
(25, 10, 'facebook_url', 'www.facebook.com'),
(26, 10, 'linkedin_url', 'www.linkedin.com'),
(27, 1, 'watched_tutorial', '1'),
(28, 9, 'watched_tutorial', '1'),
(29, 11, 'rating', '0'),
(30, 11, 'hoots', '0'),
(31, 11, 'otp', '1186'),
(32, 1, 'facebook_url', 'www.google.com'),
(33, 12, 'rating', '0'),
(34, 12, 'hoots', '1000'),
(36, 12, 'watched_tutorial', '1'),
(37, 13, 'rating', '0'),
(38, 13, 'hoots', '9212'),
(40, 13, 'watched_tutorial', '1'),
(41, 1, 'hoots', '3602'),
(43, 10, 'watched_tutorial', '1'),
(44, 14, 'rating', '0'),
(45, 14, 'hoots', '0'),
(46, 14, 'otp', '7554'),
(47, 15, 'rating', '0'),
(48, 15, 'hoots', '0'),
(49, 15, 'otp', '3897'),
(50, 16, 'rating', '0'),
(51, 16, 'hoots', '0'),
(52, 16, 'otp', '6426'),
(53, 17, 'rating', '0'),
(54, 17, 'hoots', '0'),
(55, 17, 'otp', '9032'),
(56, 18, 'rating', '0'),
(57, 18, 'hoots', '0'),
(58, 18, 'otp', '5526'),
(59, 19, 'rating', '0'),
(60, 19, 'hoots', '0'),
(61, 19, 'otp', '2866'),
(62, 20, 'rating', '0'),
(63, 20, 'hoots', '0'),
(64, 20, 'otp', '6566'),
(65, 21, 'rating', '0'),
(66, 21, 'hoots', '900'),
(68, 21, 'watched_tutorial', '1'),
(69, 21, 'facebook_url', 'awda'),
(70, 21, 'linkedin_url', 'awaw'),
(71, 21, 'tiktok_url', 'awdawd'),
(72, 22, 'rating', '0'),
(73, 22, 'hoots', '1900'),
(75, 22, 'watched_tutorial', '1'),
(76, 23, 'rating', '0'),
(77, 23, 'hoots', '0'),
(78, 23, 'otp', '6316'),
(79, 24, 'rating', '0'),
(80, 24, 'hoots', '0'),
(82, 25, 'rating', '0'),
(83, 25, 'hoots', '16500'),
(85, 25, 'watched_tutorial', '1'),
(86, 26, 'rating', '0'),
(87, 26, 'hoots', '0'),
(89, 26, 'watched_tutorial', '1'),
(90, 27, 'rating', '0'),
(91, 27, 'hoots', '0'),
(93, 28, 'rating', '0'),
(94, 28, 'hoots', '0'),
(95, 28, 'otp', '9105'),
(96, 29, 'rating', '0'),
(97, 29, 'hoots', '0'),
(98, 29, 'otp', '9699'),
(99, 30, 'rating', '0'),
(100, 30, 'hoots', '0'),
(101, 30, 'otp', '4723'),
(102, 31, 'rating', '0'),
(103, 31, 'hoots', '0'),
(105, 32, 'rating', '0'),
(106, 32, 'hoots', '0'),
(108, 33, 'rating', '0'),
(109, 33, 'hoots', '0'),
(111, 33, 'watched_tutorial', '1'),
(112, 34, 'rating', '0'),
(113, 34, 'hoots', '0'),
(115, 34, 'watched_tutorial', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocked_users_blocked_by_foreign` (`blocked_by`),
  ADD KEY `blocked_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_dream_id_foreign` (`dream_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `dreams`
--
ALTER TABLE `dreams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dreams_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friend_requests_received_by_index` (`received_by`),
  ADD KEY `friend_requests_sent_by_index` (`sent_by`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plants_dream_id_foreign` (`dream_id`);

--
-- Indexes for table `scenes`
--
ALTER TABLE `scenes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blocked_users`
--
ALTER TABLE `blocked_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `dreams`
--
ALTER TABLE `dreams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `plants`
--
ALTER TABLE `plants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `scenes`
--
ALTER TABLE `scenes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD CONSTRAINT `blocked_users_blocked_by_foreign` FOREIGN KEY (`blocked_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `blocked_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_dream_id_foreign` FOREIGN KEY (`dream_id`) REFERENCES `dreams` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `dreams`
--
ALTER TABLE `dreams`
  ADD CONSTRAINT `dreams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `friend_requests_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `friend_requests_sent_by_foreign` FOREIGN KEY (`sent_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `plants`
--
ALTER TABLE `plants`
  ADD CONSTRAINT `plants_dream_id_foreign` FOREIGN KEY (`dream_id`) REFERENCES `dreams` (`id`);

--
-- Constraints for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD CONSTRAINT `user_meta_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
