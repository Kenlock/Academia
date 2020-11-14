-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2020 at 07:41 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ulearn`
--

-- --------------------------------------------------------

--
-- Table structure for table `become_instructors`
--

CREATE TABLE `become_instructors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `instructor_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `instruction_level_id` int(10) UNSIGNED NOT NULL,
  `course_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overview` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_video` int(10) UNSIGNED DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(6) DEFAULT NULL,
  `strike_out_price` decimal(8,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_files`
--

CREATE TABLE `course_files` (
  `id` int(11) NOT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `file_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_tag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `processed` int(11) NOT NULL DEFAULT 1 COMMENT '0-not processed,1-processed',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_progress`
--

CREATE TABLE `course_progress` (
  `progress_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-incomplete,1-complete',
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_ratings`
--

CREATE TABLE `course_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `rating` decimal(8,1) NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_taken`
--

CREATE TABLE `course_taken` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_videos`
--

CREATE TABLE `course_videos` (
  `id` int(11) NOT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `video_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploader_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `processed` int(11) NOT NULL DEFAULT 1 COMMENT '0-not processed,1-processed',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE `credits` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `instructor_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `credit` decimal(10,2) DEFAULT NULL,
  `credits_for` int(11) DEFAULT NULL COMMENT '1-course_cost,2-course_commission',
  `is_admin` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_lectures_quiz`
--

CREATE TABLE `curriculum_lectures_quiz` (
  `lecture_quiz_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenttext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` int(11) DEFAULT NULL COMMENT '0-video,1-audio,2-document,3-text',
  `sort_order` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `resources` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_sections`
--

CREATE TABLE `curriculum_sections` (
  `section_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instruction_levels`
--

CREATE TABLE `instruction_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructor_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_googleplus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructor_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_credits` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `multi_choices`
--

CREATE TABLE `multi_choices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `set_number` int(11) DEFAULT NULL,
  `item_number` int(11) NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_A` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice_B` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice_C` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice_D` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_choices`
--

INSERT INTO `multi_choices` (`id`, `quiz_id`, `set_number`, `item_number`, `question`, `correct_answer`, `choice_A`, `choice_B`, `choice_C`, `choice_D`, `points`, `created_at`, `updated_at`) VALUES
(48, 5, NULL, 1, ' Properties of both spouses who married prior to the effectivity of the Family Code  constitutes a property relationship known as –', 'C', 'Absolute community', 'Absolute separation', 'Conjugal partnership of gains', ' None of the above', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(49, 5, NULL, 2, 'A property acquired by gratuitous title means –', 'C', ' Property purchased by only one of the spouses', ' Property purchased using the money of both spouses', 'Property inherited by any of the spouses', ' Property won in a lottery', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(50, 5, NULL, 3, 'The winnings of one of the spouses from gambling shall become –', 'C', ' The spouse’s own personal exclusive property	', 'The property of the entire family', 'Co-owned by both spouses', ' Assets at the sole disposal of the lucky spouse', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(51, 5, NULL, 4, ' Jewelry bought and accumulated by a wife is considered', 'D', ' Her personal property.', 'Co-owned by both spouses', 'Owned by the entire family.', ' None of the above.', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(52, 5, NULL, 5, 'Private corporations are entitled to own private lands not in excess of ______  hectares if  60% of the capital is owned by Filipinos entitled to acquire and own private land –', 'A', ' No limit', '12 hectares  .', '2000 hectares .	', ' 50 hectares .', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(53, 5, NULL, 6, 'Private corporations whose capital is 60% Filipino may lease up to ______ hectares of private land:', 'C', 'No limit', '12 hectares.', ' 2000 hectares .	', '50 hectares.', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(54, 5, NULL, 7, 'A written instrument used to transfer title must have the following, except –', 'C', 'Grantor and grantee', 'Words of conveyance	', 'Selling price of the property', ' Signature of Grantor', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(55, 5, NULL, 8, 'To be valid, a contract to sell or buy property must have the following, except –', 'D', 'Consent of the contracting parties	', 'An object certain', 'Cause or consideration', ' Approval of the government', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(56, 5, NULL, 9, 'Properties of both spouses who married after the effectivity of the Family Code and had no pre-nuptial agreement, except for exclusive properties,  constitutes a property relationship known as –', 'A', ' Absolute community', 'Absolute separation', 'Conjugal partnership of gains', '  None of the above', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(57, 5, NULL, 10, 'A person can apply for ownership of alienable public agricultural land if he has continuously occupied the same in good faith and there are no other claimants/applicants for --', 'A', '10 years', '15 years', '20 years', '30 years', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(58, 5, NULL, 11, 'Extraordinary adverse possession or prescription in bad faith means that a person can apply for ownership of alienable public agricultural land if he has continuously occupied the same for --', 'D', '10 years', '15 years', '20 years', '30 years', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(59, 5, NULL, 12, 'Under the Civil Code, the following are deemed personal property, except –', 'C', ' In general, all things  which  can be transported from place to place;', ' Obligations   and   actions   which   have   for   their   object movables or demandable sums;', ' Fertilizer actually used on a piece of land;  ', 'Shares  of  stock  of  agricultural,  commercial  and  industrial entities, although they may have real estate.', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(60, 5, NULL, 13, 'A property that is fungible means that it is a good or commodity which --', 'B', 'Can be transferred from one place to another ;', 'Can be substituted for another good or item.', 'Can easily deteriorate ;', 'Is liquid or easily sold  ', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(61, 5, NULL, 14, ' Patrimonial properties of the State are –', 'D', ' Properties considered as public dominion', 'Properties owned by the State or any of its instrumentalities in a private capacity', 'Properties expropriated by the State from the private sector to be used for roads', ' Properties belonging to individuals working in the government', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(62, 5, NULL, 15, ' Properties of public dominion are the following, except –', 'C', 'Properties of the State intended for public use by anybody;', 'Properties of the State reserved for the development of national wealth like natural resources', 'Properties of the State to be used for public service', ' Properties of the State that can be sold to the private sector', 1, '2020-09-14 00:05:01', '2020-09-14 00:05:01'),
(118, 5, NULL, 16, 'The following is not a characteristic of a property considered as public dominion –', 'C', ' The property is outside the commerce of man, cannot be leased, donated or sold;', 'The property can not be registered under the LRA', 'The property can be sold by the State', 'The property can not be acquired by prescription.', 1, '2020-09-14 00:31:49', '2020-09-14 00:31:49'),
(120, 5, NULL, 17, 'Former natural-born Filipinos can acquire land for residential purposes, up to 1,000 sqm in urban areas or 1 hectare in rural areas, under –', 'B', 'R.A. 7042', ' B.P. 185', 'R.A. 10023', 'R.A. 9225', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(121, 5, NULL, 18, ' Former natural-born Filipinos can also acquire land for business purposes, up to 5,000 sqm in urban areas or 3 hectares in rural areas, under –', 'A', 'R.A. 7042', ' B.P. 185', 'R.A. 10023', 'R.A. 9225', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(122, 5, NULL, 19, 'Former natural-born Filipinos can regain their citizenship and be able to own land without limit, under –', 'D', 'R.A. 7042', ' B.P. 185', 'R.A. 10023', 'R.A. 9225', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(123, 5, NULL, 20, 'Voluntary restrictions on property ownership includes the following, except –', 'C', 'Lease contracts', 'Easements', 'Taxes', 'Usufruct', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(124, 5, NULL, 21, 'Quieting of Title means –', 'B', 'To ban the Owner from obtaining a copy of the property’s title', ' To bring to court an action involving a question of ownership or rights to a property', 'To cancel the title of the property', 'To apply for a new title to replace that which was lost', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(125, 5, NULL, 22, ' The Philippine’s titling system is based on the Torren’s system which originally came from –', 'C', 'Spanish colonial government', ' American government', ' Australia', ' Commonwealth', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(126, 5, NULL, 23, ' The title or property ownership granted by the DENR is known as the –', 'A', 'Free patents', 'Certificate of Land Ownership', ' Confirmation of Title', 'Transfer Certificate of Title', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(127, 5, NULL, 24, ' A form of property ownership document issued by the Department of Agrarian Reform –', 'B', 'Homestead patent', 'Certificate of Land Ownership', 'Transfer Certificate of Title', 'Warranty Deed', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(128, 5, NULL, 25, ' The following modes of acquiring title are considered involuntary, except –', 'D', 'Expropriation', 'Execution by Sheriff to satisfy judgment', 'Foreclosure', 'Inheritance through a will of the decedent', 1, '2020-09-14 00:32:57', '2020-09-14 00:32:57'),
(129, 5, NULL, 26, 'A person who was born before __________ of Filipino mother, foreign father, can become a citizen of the Philippines at the age of majority –', 'A', 'January 17, 1973', ' August 3, 1988', 'August 17, 1947', 'June 12, 1946', 1, '2020-09-14 00:32:57', '2020-09-14 00:36:42'),
(163, 5, NULL, 27, 'Land that is classified as “public domain” includes the following land not privately owned, except –', 'D', 'Agricultural land', 'Forest', 'Mineral land	', 'Farms owned by Filipino citizens', 1, '2020-09-14 00:58:43', '2020-09-14 00:58:43'),
(164, 5, NULL, 28, ' The following lands of the public domain may acquired by private citizens –', 'D', 'Forest lands', 'Mineral lands', 'Old national parks', 'Agricultural lands', 1, '2020-09-14 00:58:43', '2020-09-14 00:58:43'),
(165, 5, NULL, 29, ' Filipino citizens may acquire up to ______ of land that is alienable public domain –', 'D', '500 hectares;', '1000 hectares;', '10 hectares;', '12 hectares', 1, '2020-09-14 00:58:43', '2020-09-14 00:58:43'),
(166, 5, NULL, 30, ' The general term for the highest form of property ownership consisting of a “bundle of rights” without limits other than those imposed by law or by contract is called –', 'C', 'Leasehold', 'Eminent domain', ' Fee simple', 'Easement', 1, '2020-09-14 00:58:43', '2020-09-14 00:58:43'),
(167, 5, NULL, 31, 'The owner of a property also owns the rights to the following “fruits” yielded by the said property –', 'D', ' Natural fruits', 'Civil fruits', 'Industrial fruits', 'All of the above', 1, '2020-09-14 00:58:43', '2020-09-14 00:58:43'),
(168, 5, NULL, 32, 'The following are the inherent rights of the State imposed in general on the right to ownership, except –', 'C', ' Taxation', ' Police power', 'Cancellation of title', 'Eminent domain', 1, '2020-09-14 00:58:43', '2020-09-14 00:58:43'),
(169, 5, NULL, 33, 'The term “Legitime” pertains to –', 'C', ' A legitimate claim filed against the land owner by a tenant of agricultural land.', 'The legal claim of the creditor to whom a property was mortgaged.', 'The property reserved by law to compulsory heirs of a property owner who died.', ' A property that is awarded by court order to a claimant in a property dispute.', 1, '2020-09-14 00:58:43', '2020-09-14 00:58:43'),
(170, 5, NULL, 34, 'The term “Usufruct” pertains to –', 'C', 'A right of ownership which allows the property’s occupant to sell the property.', 'A privilege of the property owner that was transferred to it by the previous owner.', 'The right to utilize a property and its fruits.', 'The rights of the heirs of a deceased property owner to use the property.', 1, '2020-09-14 00:58:43', '2020-09-14 00:58:43'),
(171, 5, NULL, 35, ' The following are all forms of “encumbrances” upon a property which allows others to use that portion of the property, except for  –', 'C', 'An easement', ' A right-of-way', ' A setback', 'A permit to use', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(172, 5, NULL, 36, 'The property owner who grants another a right-of-way easement thru his property is called the –', 'A', 'Servient estate', 'Grantor', 'Dominant estate', 'Grantee', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(173, 5, NULL, 37, ' If a person, without permission from  the lot owner, finds hidden treasure buried in a private property, all the treasure shall belong to –', 'B', 'The finder, under the principle “finders-keepers”', 'The current lot owner, under the concept of “bundle of rights”', 'The heir of the original land owner who buried the treasure;', 'The State', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(174, 5, NULL, 38, 'Which of the following is FALSE –', 'C', 'The portions of a river that has dried up will continue to be part of public domain.', 'Soil materials coming from your neighbor’s land that is swept to your land by flood or overflowing river need not be returned to your neighbor if he does not remove it in two years.', 'A river that has changed its course by natural means now encroaches your land and the  State will compensate you for your opportunity loss.', 'The banks of rivers and streams even inside private property may be considered easement for public use up to a 3 meter zone beyond its margins.', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(175, 5, NULL, 39, 'Who of the following individuals may not own land in the Philippines:', 'B', 'Aliens who acquired land in the Philippines before the 1935 constitution', 'Aliens who are married to Filipino citizens', 'Aliens who are the legal heirs of a land owner owned by a Filipino citizen decedent', 'Aliens who were former natural-born Filipino citizens', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(176, 5, NULL, 40, ' A corporation may own land in the Philippines if –', 'C', 'It’s capital is at least 50% owned by Filipinos entitled to own land in the Philippines', 'It is a wholly-owned subsidiary of  another corporation registered in the Philippines', 'It’s capital is at least 60% owned by Filipinos entitled to own land in the Philippines', ' It is a non-stock, non-profit corporation registered in the Philippines', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(177, 5, NULL, 41, 'Under BP 185, former natural-born Filipino citizens can still acquire land for residential use subject to the following limits  –', 'D', ' Maximum of 1,000 sqm at urban areas', 'Maximum 1 hectare at  rural areas', 'Can own both urban and rural land subject to above limits;', 'Can own only either “A” or “B”', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(178, 5, NULL, 42, ' Under RA 8179, former natural-born Filipino citizens can still acquire  land for business purposes subject to the following limitation –', 'C', 'Maximum of 1,000 square meters of urban land and one hectare of rural land.', 'Maximum of 3,000 square meters of urban land and 3 hectares rural land.', 'Maximum 5,000 square meters at urban areas and 3 hectares at rural areas', ' None of the above.', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(179, 5, NULL, 43, 'Which of these classifications of land are found in lands of the “public domain” --  ', 'D', 'Agricultural', 'Forest or timber', 'Mineral', 'All of the above.', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(180, 5, NULL, 44, ' Which of the following is TRUE:', 'D', 'Private lands can be owned by any private foreign corporation without limitation.  ', ' Alienable lands of the public domain  can also be acquired and owned by eligible private  corporations.  (prohib 1987C art 12 Sec 3)', 'Private corporations can lease land without term limits.', 'None of the above.', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(181, 5, NULL, 45, 'Which of the following is generally considered the best evidence of ownership of land –', 'D', 'Deed of sale', 'Tax Declaration', 'Possession', 'Torrens Certificate of Title', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(182, 5, NULL, 46, 'What kind of judicial action must be undertaken to remove a cloud or infirmity as to the validity or veracity of title to real property?', 'B', 'Revision of title', ' Quieting of title', 'Correction of title', ' Title search', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(183, 5, NULL, 47, ' With respect to properties adjoining a river, which of these rights will be in keeping with the  “Riparian doctrine”  --', 'A', 'Property owners have a right to draw water from a stream or water body that crosses or borders their land.', 'Property owners have a right to extend their fence up to the river bank', ' Property owners have the right to store or dam water that passes thru their property', 'All of the above.', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(184, 5, NULL, 48, ' A person who will be a beneficiary of property given as a gift by virtue of a will is called a –', 'B', ' Testator', 'Devisee', 'Successor', 'Legitime', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(185, 5, NULL, 49, ' In case property is acquired by succession, which of the following general rules is  false or not valid –', 'A', ' If the property owner has a will, he can convey all his property to any one he chooses', ' If the property owner died intestate, property will be distributed by operation of law', ' If the property owner has an illegitimate child, the child is a compulsory heir', ' If the property owner has no children, the property goes to his/her parents', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(186, 5, NULL, 50, 'In case a property owner dies without any lawful heirs or legatees, the property   which will revert to the government is known as –', 'D', 'Legitime property', ' Intestate property', 'Expropriated property   ', ' Escheat property', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(187, 5, NULL, 51, 'As a mode of acquiring title to real property,  prescription in good faith is:  ', 'A', '10 years', '30 years', '50 years', '100 years', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(188, 5, NULL, 52, ' Real property includes the following types of property:', 'D', ' Land	', 'Buildings', 'Franchises and patents', 'All of the above', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(189, 5, NULL, 53, ' The right to possess, use, enjoy the fruits, dispose, recover, and exclude others from property is generally called the –', 'B', 'Civil rights', 'Bundle of Rights', 'Constitutional Rights', 'None of the Above', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(190, 5, NULL, 54, 'Under the Civil Code, rental income from a building is considered a –', 'C', 'Natural fruit of property ownership	', 'Industrial fruit', 'Civil fruit', 'Commercial revenue', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(191, 5, NULL, 55, ' An absolute, unrestricted estate in perpetuity to property is called –', 'B', ' Estate for years', 'Freehold', 'Tenancy', 'None of the above', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(192, 5, NULL, 56, 'The following is considered intangible property –', 'B', 'Ownership of the air rights above land', 'Ownership of a franchise contract', ' Ownership of the building on the land', 'Ownership of the fruits of the trees on the land', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(193, 5, NULL, 57, ' The finder of hidden treasure in a property not belonging to him is entitled to –', 'A', ' 50% of the treasure if he is not a trespasser', '25% of the treasure if he is a trespasser', 'All of the treasure', ' None of the treasure', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(194, 5, NULL, 58, ' When a river opens a new bed by its natural flow in private land,  the new bed shall –', 'B', '  Be acquired by the government from the private land owner;	', 'Become a public dominion', ' Be exchanged for other public lands	', 'None of the above', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(195, 5, NULL, 59, 'The State’s power to take away private property for public use upon just compensation –', 'C', 'Taxation', 'Escheat', 'Eminent domain', 'Zoning', 1, '2020-09-14 00:58:44', '2020-09-14 00:58:44'),
(196, 5, NULL, 60, 'A subdivision plan needs only  the approval of the Land Registration or Land Management Bureau to effect segregation of titles when the resulting number of lot is:  ', 'A', 'Nine (9) or less', 'Twelve (12) or less', 'Ten (10) or less', 'Fifteen (15) or less', 1, '2020-09-14 01:00:00', '2020-09-14 01:00:00'),
(197, 14, NULL, 1, 'The broker helped his Client obtain a license to build a repair shop within a residential subdivision because he bribed the building official . This violates the rules of conduct in relation to –', 'D', 'The public ', 'government', 'fellow practitioners', 'both a and b', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(198, 14, NULL, 2, 'Some clients prefer a net listing and the broker therefore over-prices the selling price in order to include his 5% commission. This results in violation of the rules of conduct –', 'D', 'In the relation to government', 'In relation to the public', 'In relation to fellow practitioners', 'none of the above', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(199, 14, NULL, 3, 'The broker was asked by a client to obtain to sign as witness in a sales transaction in which the price shown is undervalued. He signed for fear of losing his commission. This results in a violation of the rules of conduct in relation to –', 'D', 'Government', 'Client', 'Fellow Practitioners', 'Public', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(200, 14, NULL, 4, 'The broker prepared an appraisal report even though he is not yet a licensed appraiser. He is in violation of the –', 'D', 'Code of ethics, rules of conduction in relation to the public', 'PRC Rules of Conduct', 'Code of ethics, rules of conduct in relation to Fellow practitioners', 'Real estate service act', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(201, 14, NULL, 5, 'A broker who was expelled by his national association did not officially appeal the same and immediately filed a case in court suing the organization\'s president. He is guilty of violating the code of ethics in relation to –', 'D', 'Fellow practitioner', 'The Public', 'Government', 'His Organization', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(202, 14, NULL, 6, 'In accordance with the National Code of Ethics, violations of the Rules of Conduct, shall result in the imposition of the following sanctions –', 'D', 'Cancellation of PRC license	', 'Suspension of PRC license', 'Fine of P100,000 or 6 months imprisonment, or both', 'None of the Above', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(203, 14, NULL, 7, 'Which of these acts are considered a violation of the rules of conduct of the national code of ethics in relation to fellow practitioners –', 'D', 'Campaigning in the elections against fellow practitioners', 'Advertising a property without authority of the owner', 'Overpricing the property to make allowance for bargaining', 'Passing on the listings of a co-broker without consent', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(204, 14, NULL, 8, 'The broker who is accredited with SMDC received newly-printed flyers containing the announcement of the developer\'s latest project. He then pasted his name and contact numbers in the flyers and distributed them. He is in violation of –', 'D', 'National Code of Ethics rules of conduct in relation to his Client', 'PRC Rules of Conduct', ' National Code of Ethics rules of conduct in relation to the Public', 'HLURB rules governing advertising', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(205, 14, NULL, 9, 'A real estate who collects a commission more than 5% is –', 'D', 'Violating the RESA law', 'Violating the HLURB rules', 'Violating the National Code of Ethics for Realty Service', 'Is not in violation of any law or code of ethics', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(206, 14, NULL, 10, 'The National Code of Ethics provides that the following be well-informed about matters affecting real estate as part of their duty in relation to the public –', 'D', 'Real estate brokers', 'Real estate appraisers', 'Real estate consultants', ' All of the above', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(207, 14, NULL, 11, 'Which of the following is not included in the primary purpose of the establishment of RA 9646?', 'A', 'To enhance the collection of taxes by government in the real estate transaction', ' To protect the general public of any unscrupulous act of practitioners in the conduct of real estate business', 'To limit number of practitioners in the real estate industry', 'To enhance qualification of the real estate service practitioners', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(208, 14, NULL, 12, 'On the professional rules of conduct and responsibilities, the practitioners shall be governed by the following, except:', 'D', ' relation to government and public', ' relation to principals', 'relation to fellow practitioners', 'relation to relatives', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(209, 14, NULL, 13, ' Pursuant to section 35, article IV of RA 9646 of the Code of ethics and Responsibilities, who will adopt and promulgate this code of ethics', 'B', 'PRC', 'PRBRES & PRC', 'PhilRes', 'AIPO', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(210, 14, NULL, 14, 'As agent of the seller, the real estate broker is usually authorized to do all the following except:', 'B', ' cooperate with other brokers to facilitate a sale', 'bind the principal under a contract to sell', 'list the property on the multi-listing service', 'advertise the listed property', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(211, 14, NULL, 15, 'In relation to the government, which of the following is the exception for brokers:', 'A', ' register a property buyer', ' pay all professional fees and taxes for the practice of real estate', 'should not encourage, tolerate and participate in the evasion or illegal reduction in the payment of all taxes that is due to government.', 'none of the above', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(212, 14, NULL, 16, 'After the sale is consummated, the broker should do the following, except:', 'A', 'accept commission from both the seller and buyer without knowledge of either of the parties', 'should assist the buyer to acquire possession and ownership of the real property bought in accordance with the terms and conditions agreed upon', 'should see to it that both the buyer and seller concluded a fair contract advantageous to both', 'in case of court proceeding and called upon to act as a witness, should give testimonies in the most unbiased, honest , truthful and professional manner', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(213, 14, NULL, 17, 'Being in the real estate service, it is provided in the code of Ethics that the real estate broker should see to it that all agreements, terms and conditions and obligations in a real estate transaction are:', 'A', 'in proper legal form', ' be registered with the register of deeds', 'in writing and duly signed by all parties', 'signed by the real estate broker', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(214, 14, NULL, 18, 'A Real Estate broker who accepts a listing from a client follows several ethical guidelines in his relationship with the client. Which one of the following is not always applicable', 'B', 'he should pledge himself with utmost fidelity and good faith to protect and promote the interest of his client', 'he should undertake to prepare an accurate appraisal report on the property subject of the listing, as art of his service to his client', 'he should endeavor to be well informed of current legislation, policies and programs of the government including proposed legislation, which may affect the interest of his client', 'he should endeavor to make his client and customer conclude a fair contract advantageous to both', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(215, 14, NULL, 19, 'Three of the following are tricks employed by unethical real estate brokers when bringing clients to view their listings. Which one is not unethical', 'B', 'using a roundabout route to avoid eyesores near the neighborhood', 'employing a cleaning company to freshen the smell of the house interiors', 'forecasting changes from residential to commercial zoning to hint at high rates of value appreciation', 'showing another inferior property to position his listing as the better alternative', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(216, 14, NULL, 20, 'Jose takes the following steps as a licensed real estate broker. Which of these actions can be considered unethical?', 'D', 'he accepted an exclusive listing for an abandoned house and lot even with his knowledge that somebody died violently in the property', 'he proceeds to entertain prospective buyers all the while disclosing to them the crime committed inside the property', 'he also advertised the listing giving the exact address for an open house on one weekend', 'he invites his friends to attend the open house hoping that real buyers will fee that there are many other interested in the property', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(217, 14, NULL, 21, 'In accordance with RESA Law, a Code of Ethics shall be prepared by the ____________ and adopted for observance by all real estate service practitioners.', 'A', 'Accredited Integrated Professional Organization', 'Professional Regulation Commission', 'All existing real estate service associations', 'Professional Regulatory Board for Real Estate Service', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(218, 14, NULL, 22, 'Prior to the final approval of the new Code of Ethics under RESA Law, the following has been considered applicable --National Code of Ethics for Realty Service by DTI, 1993', 'D', 'The Golden Rule', 'The Code of Ethics of each realty association', 'No code of ethics', 'National code of ethics for realty service (DTI)', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(219, 14, NULL, 23, 'The “Golden Rule” is a universal guide which means --', 'A', 'Treat others as you like them to treat you', 'Do unto others as they do unto you', 'An eye for an eye', ' Treat others as if they are your family', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(220, 14, NULL, 24, 'The Rules of Conduct and Practice in the Realty Code of Ethics defines the practitioner’s relations to the following, except --', 'A', 'His family, relatives and close friends', 'Clients/Customers and fellow practitioners', 'His organization and the national association to which it belongs', ' Government and the public', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(221, 14, NULL, 25, 'Which of the following is not needed by the real estate service pracitioner before practicing –', 'A', 'Mayor’s permit with the LGU', 'BIR Certificate of registration', 'Professional tax receipt from the LGU', 'Professional I.D. and license from the PRC', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(222, 14, NULL, 26, 'The following are the rules of conduct in relation to the government, except –', 'A', 'Register and incorporate a corporation with SEC or a business name with DTI', 'Secure all needed permits and licenses before practicing', ' Assist government in zonification and conservation of real estate', ' Do not abet, tolerate or participate in tax evasion', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(223, 14, NULL, 27, 'A real estate practitioner has the obligation to inform government about deceptive, unfair and unconscionable acts of other unscrupolous practitioners as part of his duty to –', 'A', 'Protect the interest of the public', 'Abide by the rules of conduct in relation to government', ' Protect and promote the interest of his clients', 'Abide by the rules of conduct ion relation to fellow practitioners.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(224, 14, NULL, 28, 'The real estate practitioner’s duty to the public does not include –', 'A', 'Offering free consultancy services to the public', 'Ensuring the highest and best use of land.', 'Not introducing in a neighborhood a use of property which will impair its value', 'Presenting a true picture of property he advertises', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(225, 14, NULL, 29, 'A real estate broker who has an authority to sell may be guilty of unethical conduct if he -', 'A', 'Receives a commission from the buyer', 'Pays a commission to another broker who referred the buyer', 'Pays a fee to a facilitator who helps process the transfer of the property', 'None of the above are unethical', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(226, 14, NULL, 30, 'A real estate broker’s application for accreditation to sell a developer’s project was approved only to find out that the project does not yet have a license to sell. The broker should –', 'A', 'Refrain from selling the project until its LTS has been approved.', ' Immediately resign his accreditation.', 'Report the developer to the HLURB.', 'Do nothing', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(227, 14, NULL, 31, 'Which one of the following newspaper line ads is blatantly unethical', 'C', ' house on a very quiet neighborhood	', 'flood free street', 'the value of this property will double in one year', 'beautiful view', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(228, 14, NULL, 32, 'Which one of the following acts of a broker can be considered within the bounds of the code of ethics', 'B', 'encouraging the parties to a sale to indicated a consideration lower than the actual selling price', 'serving as a witness in court proceedings involving a property owned by his client', 'disclosing his client\'s confidential personal information to a fellow broker in order to facilitate the sale of his client\'s property', 'delaying submission of a formal offer that he had received from a prospective buyer in the hope of securing a higher offer.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(229, 14, NULL, 33, 'When a licensed broker accepts a listing from a fellow practitioner, he follows a three conditions clearly stated in the code of ethics. Which one of the following is not a condition to be followed?', 'D', 'the agency of the broker who offers the listing should be respected until it has expired and the listing comes to his attention from a different source', 'the agency of the listing broker should be respected perpetually in all dealings with his client/ principal', 'the agency of the broker who offers the listing should be respected until the owner, without solicitations, offer to list with him', 'the listing should be passed to a third broker without the knowledge and consent of the listing broker.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(230, 14, NULL, 34, 'A broker has just received from a fellow broker\'s client/buyer a written offer to purchase a property of his client/seller, together with a check for earnest money payment. Which of the following steps is the most proper and ethical for him to take?', 'B', 'call another fellow broker whose client is also interested in the property in the hope that they can top the offer', 'call the seller immediately to inform him about the offer and submit at the soonest possible time, both written offer and the earnest money payment', 'show the offer to another prospective buyer in the hope of getting a better price for the seller', 'reject the first offer outright based on his opinion that the offered price is too low and tell his fellow broker who submitted the offer to convince the buyer to make a higher offer', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(231, 14, NULL, 35, 'As A real estate practitioner, we should but not:', 'D', 'willingly share the lessons and experiences', 'not use the service of the salesman of the fellow practitioner without their knowledge and consent', 'not solicit a listing currently listed exclusively with another broker', 'put sign or notice of a property for sale without authority from the owner', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(232, 14, NULL, 36, 'A sign giving notice of an property for sale or lease should not be placed on a property by more than one broker and only if:', 'D', 'the address of the broker is indicated on the sign', 'the sign is placed at least one meter away from the other sign', 'the sign should be the same size as the other signs', 'authorized by the owner', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(233, 14, NULL, 37, 'In relation to the public, what are the social responsibilities of brokers:', 'D', 'imbued with social responsibilities and conscience being part of society', ' cooperate with the government in protecting the public against deceit, misrepresentation, unfair, relevant information and other related unethical and malpractices of unlicensed and unauthorized practitioners', ' endeavor to present the full disclosure of pertinent and material facts on the subject property in advertisements', 'All of the above', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(234, 14, NULL, 38, 'This is not one of the six principles declared as objectives of the National Code of Ethics for Realty Service Practice –', 'D', 'Abide by all laws, decrees, orders and rules of government authorities', 'Observe fidelity, sincerity, respect for colleagues and honesty with client', 'Maintain a high level of professional values and respect relationships with colleagues', 'Service to humanity is the best work of life.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(235, 14, NULL, 39, 'A broker must indicate his license number in his letterhead, signboard, and ads because this is part of the required code of conduct in relation to –', 'D', 'The public', 'Client', 'Fellow practitioners', ' Government', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(236, 14, NULL, 40, 'A broker was co-witness in a contract of sale that was later found to contain a false consideration. This is a violation of the rules of conduct in relation to –', 'D', 'Government', 'Client', 'Public', 'Government and Public', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(237, 14, NULL, 41, 'The relative of a prospective Buyer was the one who referred the Buyer and is asking you as a broker to over-price the property offered. Your response shall be –', 'D', 'Report the relative’s request of over-pricing to the Buyer.', ' Refuse it outright at the risk of losing the sale.', 'Cancel the transaction.', ' Offer the relative a share of your commission subject to prior disclosure to the Buyer.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(238, 14, NULL, 42, ' A broker who holds a non-exclusive authority to sell writes letters to several real estate organizations offering all their members an extension listing, then informing his client that he has extended his listing to several real estate associations. His action can be interpreted as –', 'A', 'A sign of his desire to please his Client and expedite the sale.', 'A sign of his generosity because he is offering an extension of his listing to large groups.', ' A strategy to pre-empt many other brokers from applying for accreditation with the owner.', 'All of the above.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(239, 14, NULL, 43, 'A real estate broker who just closed the sale for his Client may agree to do the following, except –', 'A', 'Rebate part of his commission to the Buyer’s wife without his knowledge', 'Process the documents needed to transfer the title for an extra facilitation fee', 'Prepare the deed of sale', ' Assist the Buyer to negotiate a mortgage with a banking institution.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(240, 14, NULL, 44, 'A broker receives several offers to buy for one of the properties in his list. He should –', 'A', 'Show the Client all the offers.', 'Show the Client the offer made by a prospective buyer who is his distant relative.', 'Show the Client only the highest offer.', 'Show other offerors the highest offer so they can top the price.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(241, 14, NULL, 45, 'A seller’s broker receives several offers for a property, none of them equal to or higher than the Seller’s asking price. He should –', 'A', 'All of the above actions are alright', 'Show the Owner all the offers for his decision.', 'Start negotiating with the highest offeror to increase his price.', 'Start negotiating with the Owner to reduce the price.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(242, 14, NULL, 46, 'A dispute has arisen between a broker’s Client and one of the prospective buyers who put in an earnest money but did not proceed with the sale and is requesting a refund. Both parties are in court. The broker shall –', 'A', 'Testify only as to the facts in an unbiased and honest manner', 'Testify in favor of the Buyer', 'Testify in favor of his Client', 'Refuse to participate in the court proceedings.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(243, 14, NULL, 47, 'A broker finds out that another broker who has an exclusive listing has not been successful in selling a property for nearly a year. He recently met the Owner’s relative and may –', 'A', ' Gain an introduction to the exclusive broker and offer his services as co-broker', 'Do not offer his services because it is listed by another broker exclusively', 'Approach the Owner and offer his services', 'Do nothing and look for another listing.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(244, 14, NULL, 48, 'A salesman who is accredited by a fellow broker wishes to help you sell your listings on a referral fee basis. As a professional broker, you should –', 'B', ' Refuse to deal with the salesman of another broker.', ' Ask the salesman to seek permission from his principal.', 'Immediately report the said salesman to his principal.', 'Offer to hire the salesman.', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(245, 14, NULL, 49, 'A broker plans to post a sign giving notice that the property is for sale. He should – A. Post the sign without need for any approvals', 'B', 'Not post any signage at all', 'Post the sign but subject to prior approval of the owner and other brokers who also have a sign', 'Post a shared sign with the other broker who is also authorized to sell the property.', 'none of the above', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(246, 14, NULL, 50, ' In case there is a controversy between two brokers regarding the sharing of commission, they shall –', 'D', 'File a case in court to resolve the issue', 'Allow the Seller and the Buyer to decide the sharing percentage.', 'Refer the matter to their respective lawyers.', 'Refer the problem to an Arbiter', 1, '2020-09-14 19:05:37', '2020-09-14 19:05:37'),
(247, 15, NULL, 1, 'The law governing the professionalization of real estate service.', 'A', 'R.A. 9646', ' R.A. 8981', 'R.A. 9653', ' R.A. 9856', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(248, 15, NULL, 2, 'Under the RESA Law, the incumbent real estate assessors –', 'A', 'Must possess a real estate appraiser\'s license', 'Are exempted from a real estate license if they have 2 years experience', 'Must obtain a separate PRC license as assessor	', 'Are not required to be licensed appraisers', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(249, 15, NULL, 3, 'The PRC shall recommend ______ nominees for each vacant position in the Professional Regulatory Board of Real Estate Service .', 'A', 'two', 'four', 'five', 'three', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(250, 15, NULL, 4, 'The list of nominees to be recommended by the PRC for a vacancy in the PRB-RES –', 'A', 'shall come from the various real estate associations', 'shall be submitted for approval by the Civil Service Commission', 'shall come from the President of the Philippines', 'shall come from the AIPO', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(251, 15, NULL, 5, 'The RESA law requires that the chairperson and members of the PRB-RES must be –', 'A', ' lawyers or accountants', 'holders of a master\'s degree in real estate', 'faculty members of an established r educational institution', 'member in good standing of the AIPO on real estate service', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(252, 15, NULL, 6, 'This is not one of the mandatory duties of the Professional Regulatory Board on Real Estate Service -', 'B', 'Adopt a national code of ethics as issued by the AIPO', 'Prescribe in coordination with CHED the real estate curriculum', 'Consult with the AIPO and prescribe guidelines for the CPE program', 'Issue the licenses to sell of the real estate developers.', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(253, 15, NULL, 7, 'All members of the Professional Regulatory Board for Real Estate Service can be re-appointed for ______ terms but in no case shall serve for more than six years.', 'A', ' five', 'four', 'three', 'two', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(254, 15, NULL, 8, 'The roster of real estate service practitioners must be kept by the PRB-RES and –', 'A', 'submitted to the CHED every year.', 'submitted to the HLURB every year.', 'submitted to the DOLE every year.', 'made available to the public upon request.', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(255, 15, NULL, 9, 'The mechanism utilized by the ASEAN which will allow professionals to cross borders and practice in other member countries –', 'A', 'ASEAN professional regulatory board	', 'Cross-border Treaty for Professionals', 'ASEAN Reciprocity', 'Mutual Recognition Agreement', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(256, 15, NULL, 10, ' Corporations and partnerships engaged in the practice of real estate service are NOT required to –', 'A', 'Submit a list of duly licensed brokers to PRC', 'Submit a list of duly licensed brokers to the SEC', ' Maintain one licensed broker for every 20 accredited salespersons', ' Submit a list of duly licensed brokers to BIR', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(257, 15, NULL, 11, 'Corporations and partnerships engaged in corporate practice of real estate service are not required to –', 'A', 'Maintain licensed brokers as heads of their marketing departments', ' Maintain licensed brokers as heads of branch offices', 'Submit the list of their licensed brokers to PRC', 'Pay their licensed brokers on commission basis', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(258, 15, NULL, 12, 'All duly-licensed real estate practitioners are required to abide by these, except –', 'A', 'Obtain a professional ID', 'Attend continuing professional education', 'Abide by the code of ethics', ' Submit annual report to PRC', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(259, 15, NULL, 13, 'The RESA law provides that –', 'A', 'All duly licensed real estate practitioners must register with the HLURB', 'All duly licensed real estate practitioners must join any one of the existing real estate associations', 'All duly licensed real estate practitioners must sign all real estate contracts they negotiated', 'All duly licensed brokers must be bonded', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(260, 15, NULL, 14, 'As given in the present Implementing Rules and Regulations of the RESA Law, as well as in keeping with the current practice for all other professional organizations accredited by PRC, the accredited and integrated professional organization of real estate service shall be –', 'A', 'A confederation of existing real estate associations', 'A federation of existing real estate associations', 'An organization limited only to existing real estate associations', 'An organization in which all licensed real estate practitioners shall be automatically members in their individual capacity.', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(261, 15, NULL, 15, 'The most recent organization that was accredited by the PRC to be the accredited and integrated professional organization for real estate service –', 'A', 'PAREB', 'REBAP	', 'FRESPI', 'PHILRES', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(262, 15, NULL, 16, 'The current stalemate which resulted in the absence and failure of the PRC to update the accreditation of the previous real estate AIPO stems from –', 'A', 'Conflict in the interpretation of what shall compose the AIPO-RES', 'Objections of existing real estate associations to the previously accredited AIPO', ' Political ambitions of existing real estate associations to control the AIPO leadership', 'All of the above', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(263, 15, NULL, 17, ' Among the bureaucratic regulations that continue to burden real estate service practitioners are –', 'A', 'Dual registration requirements – PRC every 3 years and HLURB annually.', 'Practitioners have to post performance bonds both at PRC and HLURB', 'Practitioners are required by BIR to register their appointment books', 'All of the above', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(264, 15, NULL, 18, 'Significant reasons why the major colleges and universities have not offered the Bachelor in Real Estate Management course despite the fact that RESA law enacted in 2009 requires it –', 'A', 'Lack of qualified faculty – licensed practitioners with post-graduate degrees', 'Lack of interest from students', 'Real estate service is still considered a secondary profession', 'All of the above', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(265, 15, NULL, 19, 'Violations  of licensed practitioners will be fined –', 'A', 'P150,000.', 'P100,000', 'P200,000', 'P300,000.', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(266, 15, NULL, 20, 'Violations of unlicensed real estate service practitioners will be penalized –', 'A', 'P 150,000', 'P200,000', 'P100,000', 'P50,000.', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(267, 15, NULL, 21, 'For real estate salespersons, no examination shall be given, but they shall be accredited by the Board provided they have completed at least _____ years of college :', 'A', '2 years', '3 years', '4 years', 'one year', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(268, 15, NULL, 22, 'For partnerships or corporations engaged in selling real estate, there shall at least be one (1) licensed real estate broker for every _____ accredited salespersons.', 'D', '20', '25', '10', '5', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(269, 15, NULL, 23, 'The following information is not required in signing documents in connection with the practice of real estate service:', 'D', 'BIR Certificate of registration Number and expiry date', 'Professional Identification Card expiry date', 'Privilege Tax Receipt number and expiry date', 'Certificate of registration number with PRC', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(270, 15, NULL, 24, 'The PRC released Resolution 2013-774 effective August 10, 2013 which pertains to –', 'D', 'CPD Guidelines	', 'Schedule of the 2014 board examinations', ' List of newly-passed appraisers', 'Revised fees for renewal of licenses', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(271, 15, NULL, 25, 'The PRC Modernization Act –', 'D', 'R.A. 8981', 'R.A. 8974', 'R.A. 8532', 'R.A.8435', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51');
INSERT INTO `multi_choices` (`id`, `quiz_id`, `set_number`, `item_number`, `question`, `correct_answer`, `choice_A`, `choice_B`, `choice_C`, `choice_D`, `points`, `created_at`, `updated_at`) VALUES
(272, 15, NULL, 26, 'The requirement for renewal of licenses of real estate practitioners once every 3 years is -', 'D', '60 CPD units', '45 CPD units', '30 CPD units', '15 CPD units', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(273, 15, NULL, 27, 'For every hour of activity, a resource speaker or lecturer can earn –', 'D', 'Five (5) CPD units', 'Three (3) CPD units', 'Four (4) CPD units', 'One(1) CPD unit', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(274, 15, NULL, 28, 'The following activities can be given CPD credit units as self-directed learning, except –', 'D', 'Read a comprehensive book on real estate	', 'Attended a real estate training module over the internet', 'Wrote articles on real estate', 'Attended a relevant short-term post-graduate course', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(275, 15, NULL, 29, 'The CPD Council for Real Estate Service is composed of ____ members.', 'D', 'Three (3)', 'Four (4).', 'Five (5)	', 'Two (2).', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(276, 15, NULL, 30, 'The IRR of R.A. 9646 was enacted in –', 'D', 'July 2010.', 'July 2009 .', 'June 2010 .', ' June 2009.', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(277, 15, NULL, 31, 'Also known as an -- “agent”, refers to a person now licensed to offer property for sale:', 'D', 'Broker', 'Assesso', 'Estimator', 'Value consultant', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(278, 15, NULL, 32, 'Main difference between an appraiser and an assessor --', 'D', 'Where employed', 'Different licensure', ' Experience', 'College degree', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(279, 15, NULL, 33, 'The following are considered real estate service practitioners, except:', 'D', 'Real estate lenders', 'Real estate appraiser', 'Real estate consultant', 'Real estate broker', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(280, 15, NULL, 34, 'The Professional Regulatory Board of Real Estate Service is composed of a chairperson and –', 'D', '4 members', '5 members', '6 members', '3 members', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(281, 15, NULL, 35, 'At least _____ members of the PRB-RES shall represent government assessors and appraisers:', 'D', ' Two', 'Three', 'One', 'None', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(282, 15, NULL, 36, 'Which of the following is not a required qualification of the Chairperson and Members of the PRB-RES?', 'D', 'An officer or trustee of the accredited integrated organization for real estate service;', 'Licensed practitioner of real estate service for at least 10 years prior to appointment;', 'A citizen and resident of the Philippines;', 'Of good moral character, and must not have been convicted by final judgment;', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(283, 15, NULL, 37, 'The term of office of the chairperson and the members of the PRB-RES is –', 'D', '3 years', '5 years', '7 years', 'Up to the president of the Phil.', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(284, 15, NULL, 38, 'The following are the current basic qualifications to be admitted to the licensure examination for real estate service, except for --', 'D', 'Experience of at least 2 years in any occupation involving real estate service;', 'A holder of a relevant bachelor\'s degree from a state university or college, or other educational institution duly recognized by the CHED:', 'Of good moral character, and must not have been convicted of any crime involving moral turpitude:', 'A citizen of the Philippines;', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(285, 15, NULL, 39, 'All real estate brokers and private real estate appraisers shall be required to post a professional indemnity insurance/cash or surety bond, renewable every three (3) years, in an amount to be determined by the Board, which in no case shall be less than –', 'B', 'P 20,000.', ' P 40,000.', 'P 25,000.', 'P 50,000.', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(286, 15, NULL, 40, 'Which of the following acts requires licensure in real estate service --', 'B', 'A person who negotiates the lease of a private condominium unit.', 'A receiver, trustee or assignee in bankruptcy or insolvency proceedings;', 'A person acting pursuant to the order of any court of justice;', 'A person acting as attorney-in-fact for purposes of selling a property without any compensation or remuneration;', 1, '2020-09-14 22:28:51', '2020-09-14 22:28:51'),
(287, 16, NULL, 1, 'The law that abolished the traditional share tenancy practice.', 'B', 'R.A. 6657.', 'R.A. 3844 .', ' P.D. 27', 'R.A. 8435', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(288, 16, NULL, 2, 'The law that declared lands planted to rice and corn subject to land reform.', 'C', ' R.A. 9700 .', 'R.A. 8532 .', 'P.D. 27.', 'R.A. 6657 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(289, 16, NULL, 3, 'The comprehensive agrarian reform law.', 'D', 'R.A. 9700.', ' R.A. 8532.', 'P.D. 27.', 'R.A. 6657 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(290, 16, NULL, 4, 'The law comprising the latest and current extension of agrarian land reform.', 'A', 'R.A. 9700 .', 'R.A. 8532.', 'P.D. 27.', 'R.A. 6657.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(291, 16, NULL, 5, 'The “Urban Development and Housing Act” also known as the Lina Law.', 'C', 'R.A. 9700 .', 'R.A. 9397', ' R.A. 7279.', 'R.A. 6657 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(292, 16, NULL, 6, 'The law that established the Torrens system in the Philippines.', 'B', 'Act 926.', 'Act  496', 'Act  2259.', 'C.A. 141', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(293, 16, NULL, 7, 'The law that began the process of undertaking cadastral surveys opf lands in the country.', 'C', ' Act  496.', ' Act  926.', 'Act  2259 .', 'C.A. 141.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(294, 16, NULL, 8, 'This law prescribes rules on administrative reconstitution of lost titles.', 'B', 'P.D. 1529', 'R.A. 6732', 'R.A. 8974', 'P.D. 892', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(295, 16, NULL, 9, 'Also known as the Property Registration Decree which updated Act 496.', 'A', 'P.D. 1529.', 'R.A. 6732 .', 'R.A. 8974.', 'P.D. 892.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(296, 16, NULL, 10, 'The basic law providing overall design standards for buildings.', 'A', 'P.D. 1096.', ' R.A. 4726.', ' B.P. 220.', ' P.D. 957 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(297, 16, NULL, 11, 'The law governing the design standards for socialized and low-cost housing.', 'C', 'P.D. 1096.', 'R.A. 4726 .', 'B.P. 220.', 'P.D. 957 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(298, 16, NULL, 12, 'The law governing the licensing and registration of development projects.', 'D', 'P.D. 1096 .', 'R.A. 4726', 'B.P. 220 .', 'P.D. 957.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(299, 16, NULL, 13, 'The law prescribing the percentage of open spaces in subdivisions.', 'B', 'RA 6552.', 'PD 1216.', 'B.P. 220 .', 'R.A. 9514', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(300, 16, NULL, 14, 'The latest revision of the National Fire Code.', 'D', 'RA 6552.', 'PD 1216  .', 'PD 1216  .', 'R.A. 9514', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(301, 16, NULL, 15, 'The “Realty Buyers Installment Act” also known as the Maceda Law.', 'C', 'PD 1216 .', 'RA 9514 .', 'RA 6552.', 'RA 4726 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(302, 16, NULL, 16, 'The law governing the development of condominiums.', 'D', 'PD 1216.', 'RA 9514.', 'RA 6552.', 'RA 4726', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(303, 16, NULL, 17, 'The law governing the professionalization of real estate service.', 'B', ' R.A. 8981', 'R.A. 9646', 'R.A. 9653', 'R.A. 9856', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(304, 16, NULL, 18, 'Act 926, or the first Public Land Act was about –', 'B', 'Established the Torrens system of land registration', 'Governed  distribution of land through homestead, free patent, sale or lease.', 'Created the Insular Bureau of Public Lands', 'Authorized ground surveys and registration proceedings', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(305, 16, NULL, 19, 'In the Commonwealth era, C.A. 141 became the new Public Land Act and provided for the following, except –', 'C', 'Allowed both judicial and administrative proceedings for land titling', 'Re-affirmed land distribution through patents', 'Establish the system for taxation of land .', 'Allowed patents to be brought into the Torrens system', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(306, 16, NULL, 20, 'This law updated Act 496 and is the governing law on property registration today.', 'C', 'R.A. 6657', 'R.A. 7279', 'P.D. 1529.', 'P.D. 957', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(307, 16, NULL, 21, 'The government agency in charge of administering, surveying and disposing “Alienable and Disposable (A&D) lands --', 'A', 'Land Management Bureau.', 'Land Registration Authority', 'National Housing Authority', 'Housing & Land Use Regulatory Board', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(308, 16, NULL, 22, 'The Land Management Bureau is under the jurisdiction of the --', 'A', 'Dept. of Environment & Natural Resources  ', ' Dept. of Agrarian Reform', 'Department of Public Works and Highways	', 'Department of Justice', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(309, 16, NULL, 23, 'The field offices of the Land Registration Authority is known as --', 'C', 'Civil register', 'Land registration commission', 'Register of Deeds.', 'General Land Registration Office', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(310, 16, NULL, 24, 'A FREE patent for 12 hectares of A&D agricultural land falls under –', 'A', 'Commonwealth Act 141.', 'R.A. 10023', 'R.A. 6657', ' Commonwealth Act 496', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(311, 16, NULL, 25, ' R.A. 10023  enacted in 2010,  provides for A FREE patent for residential land with the following limitations –', 'B', 'Maximum of 1,000 sqm urban land or 1 hectare rural land', ' Maximum 200 sqm highly urban, 500 in other cities, 750 sqm in first-second class municipalities, 1,000 sqm in other municipalities.', 'Maximum of 3 hectares	', 'Maximum of 12 hectares', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(312, 16, NULL, 26, 'A process provided in Act 496 which allows a person to file an action that will record his interest in a property titled to another person is known as --', 'A', 'Claim of adverse possession', 'Lis pendens', 'Adverse claim', ' Right of first refusal', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(313, 16, NULL, 27, 'The State’s power to  own a property left by a person who died without an heir or a will is –', 'B', 'State inheritance', 'Escheat.', 'Eminent domain', 'Confiscation', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(314, 16, NULL, 28, 'The basic law governing persons, properties, obligations and contracts.', 'C', '1987 Constitution.', ' E.O. 209 Family Code.', 'R.A. 386, Civil Code .', 'R.A. 8424.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(315, 16, NULL, 29, 'The basic law governing relationships between spouses.', 'B', '1987 Constitution.', 'E.O. 209 Family Code .', ' R.A. 386, Civil Code.', ' R.A. 8424.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(316, 16, NULL, 30, 'The basic law governing national taxation.', 'D', '1987 Constitution.', 'E.O. 209 Family Code.', 'R.A. 386, Civil Code.', 'R.A. 8424 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(317, 16, NULL, 31, 'The law allowing former natural-born Filipinos to re-acquire citizenship', 'B', '1987 Constitution.', 'R.A. 9225 .', 'R.A. 7042.', 'R.A. 6809.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(318, 16, NULL, 32, 'The law lowering the age of majority to 18.', 'D', '1987 Constitution.', 'R.A. 9225.', 'R.A. 7042.', 'R.A. 6809 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(319, 16, NULL, 33, 'The law allowing former Filipinos to acquire land for residential purposes.', 'D', '1987 Constitution.', 'R.A. 9225.', 'R.A. 7042 amended by RA 8179.', 'B.P. 185 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(320, 16, NULL, 34, 'The law allowing former Filipinos to acquire land for business purposes.', 'C', '1987 Constitution.', 'R.A. 9225.', 'R.A. 7042 amended by RA 8179 .', 'B.P. 185.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(321, 16, NULL, 35, 'The law which allows aliens to lease land for 25 years, renewable 25 more.', 'B', 'RA 7652 .', 'PD 471.', 'RA 7042 .', 'RA 8179 .', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(322, 16, NULL, 36, 'The law which allows aliens who are investors to lease land for 50 years, renewable 25 more.', 'A', 'RA 7652 .', 'PD 471.	', 'RA 7042.', 'RA 8179.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(323, 16, NULL, 37, 'The owner wants a net proceed of P1,750,000.00 exclusive of capital gain tax, documentary stamps and 5% broker’s commission. How much would be the selling price so that the broker can maintain his 5% commission?  ', 'C', 'P 1,668,750.00', 'P 1,680,000.00	', 'P 2,000,000.00.', 'P 2,200,000.00', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(324, 16, NULL, 38, 'The bank’s acquired assets which form part of its real estate inventories at the close of its  accounting period shall be classified as:', 'D', 'Ordinary assets', 'Capital assets', 'Fixed assets', 'none of the above', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(325, 16, NULL, 39, 'The BIR Revenue Regulation No. 17-2003, the seller of family home who failed to utilize the proceeds to acquire a new residence within 18 months from the sale shall be assessed additional deficiency capital gains tax inclusive of penalties and;', 'A', '10% interest per annum', '20% interest per annum', '15% interest per annum', '25% interest per annum', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(326, 16, NULL, 40, 'The annual registration fee for VAT-registered entity is –', 'B', 'P500.00', 'P1,000.00', 'P1,500.00', 'None of the above', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(327, 16, NULL, 41, 'The documentary stamp tax on the sale of the property must be paid --', 'B', 'Within 30 days from the date of notarization', 'Within five (5) days after the close of the month of the date of sale.', 'Within ten (10) days after the close of the month of the date of sale', 'At the time of payment of the capital gains tax', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(328, 16, NULL, 42, 'If the property is an ordinary asset, what is the applicable BIR tax ?', 'D', 'Capital gains tax', 'Realty Tax', 'C. Creditable Withholding Tax.', 'Excise tax', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(329, 16, NULL, 43, 'Under the Local Government Code, agricultural lands more than one hectare are subject to additional tax of not more than 5% assessed value when at least:  ', 'C', 'One-half of the area is uncultivated.	', ' The entire is cultivated', 'Forty percent of the area is uncultivated', 'Thirty percent of the area is uncultivated', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(330, 16, NULL, 44, 'The chairman of the Local Board of Assessment Appeals in a city is:  ', 'B', 'City auditor', 'City mayor', 'City registrar of deeds', 'City Engineer', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(331, 16, NULL, 45, 'The rate of real estate tax in municipalities within the Metro Manila is not more than:', 'A', 'One-half percent of assessed value', 'Two percent of assessed value', 'One percent of assessed value', 'Three percent of assessed value', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(332, 16, NULL, 46, 'Per BIR 28-98, the ground floor of a condominium project shall be considered as commercial and an additional rate shall be added to an established residential zonal value.  ', 'D', '0.1', '0.2', '0.25', '0.5', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(333, 16, NULL, 47, 'As annual levy on real estate equivalent to 1% of assessed value which shall be in additional to be basis real estate tax is:  ', 'A', 'Special real estate tax', 'Ad valorem tax', 'Excise tax', 'Special education fund tax.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(334, 16, NULL, 48, 'The value placed on taxable property by the assessor for ad valorem tax purpose is:  ', 'C', 'Market value.', 'Economic value', 'Assessed value', 'Assessment value', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(335, 16, NULL, 49, 'The documentary stamp tax for a deed of real estate mortgage is:', 'D', 'P15.00 for every P1,000.00 of the mortgage amount', 'P10.00 for every P1,000.00 of the mortgage amoun', 'P10.00 for the first P5,000.00 of the mortgage amount plus P5.00 for every P5,000.00 thereafter', 'P20.00 for the first P5,000.00 of the mortgage plus P10.00 for every P5,000.00 thereafter', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(336, 16, NULL, 50, 'Unless validated, tax credit life span is only:', 'C', ' 1 year	', '2 years', '3 years', '4 years', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(337, 16, NULL, 51, 'In payment of real estate tax, an allowed deduction to the gross estate of a decedent is funeral expense which is:', 'A', '5% of gross estate or P200,000.00 whichever is lower', '5% of gross estate or P200,000.00 whichever is higher', '10% of gross estate or P200,000.00 whichever is lower', '10% of gross estate or P200,000.00 whichever is higher', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(338, 16, NULL, 52, 'A tax fixed on documents, instruments and papers evidencing the acceptance, assignment or sale of a right, property or obligation:', 'B', 'Residence tax', ' Documentary Stamp', 'Community tax	', 'None of the above', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(339, 16, NULL, 53, 'The zonal value of property can be obtained from:  ', 'C', 'Assessor’s Office	', 'Land Registration Authority', 'Bureau of Internal Revenue.', 'All of the above', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(340, 16, NULL, 54, 'The rate of creditable withholding tax in the sale of real estate property classified as ordinary asset by an individual, estate, trust or corporation not habitually engaged in real estate business is:', 'D', '0.03', '0.05', '0.07', 'None of the above (now 6%)', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(341, 16, NULL, 55, 'Capital gains tax on the sale of real estate classified as capital asset is:', 'D', 'Creditable tax on the sale', 'Deductible item from value added tax', 'Deductible item from income tax', 'Pre-paid income tax.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(342, 16, NULL, 56, 'The schedule of fair market value in municipalities in Metro Manila is prepared by:  ', 'C', 'MMDA	', 'Sanggunian Bayan by ordinance', 'Concerned municipal assessors.', 'None of the above', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(343, 16, NULL, 57, 'The following compose the Board of Assessment Appeals in Makati City, except:  ', 'B', 'Registry of deeds.', 'City Assessors', 'City Prosecutor', 'City Engineer', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(344, 16, NULL, 58, 'A tax payer has _____ to redeem his real property which was levied and subsequently forfeited and acquired by the local government for tax delinquency.', 'A', '1 year', '4 years	', '60 days', '3 years', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(345, 16, NULL, 59, 'For purpose of determining whether  seller / transferor can be considered as habitually engaged in real estate business, he should offer satisfactory evidence that he consummated least ____ taxable real estate transaction during the preceding year.  ', 'B', 'Five', 'Six', 'Eight', 'Ten', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(346, 16, NULL, 60, 'Under the new BIR Ruling, acquired asset of banks regardless of amount are subject to the creditable withholding tax of:  ', 'D', '0.015', '0.03', '0.05', '6.0%.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(347, 16, NULL, 61, 'The seller realized a 30% gross over his cost. If the property was sold at P1,950,000.00 the cost is --', 'B', 'P1,365,000.00', 'P1,500,000.00.', 'P 1,560,000.00', 'P 1,350,000.00', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(348, 16, NULL, 62, 'Property held as inventory or stock in trade of buy and sell business and in connection with trade, business or source of income is:', 'C', 'Capital asset', 'Fixed asset', 'Ordinary Asset', 'Intangible asset', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(349, 16, NULL, 63, 'In case a false or fraudulent estate, donor or capital gains tax BIR form was willfully made how much surcharge based on the deficiency hall be imposed?', 'D', '0.2', '0.25', '0.3', '0.5', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(350, 16, NULL, 64, 'In a sale of property  on  installment plan where the buyer is not engaged in trade or business, the applicable rate of tax is based on --', 'C', 'Gross selling price', 'Fair market value', 'A or b whichever is higher.	', 'Assets value', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(351, 16, NULL, 65, ' In case of sale of real property paid under deferred payment basis, the payment of the documentary stamp tax shall accrue upon --', 'A', 'Notarization of transfer document.	', 'Execution of Contract to Sell', 'Execution of the Deed of Absolute Sale', 'Payment of the full amount', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(352, 16, NULL, 66, ' The schedule of market value for ad valorem tax in municipalities outside Metro Manila is prepared by:  ', 'C', 'Municipal Assessors', 'Sanggunian Panglalawigan	', 'Provincial Assessors.', 'Provincial treasurer', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(353, 16, NULL, 67, 'The amount of family home equivalent to fair market consideration as allowable deduction from the estate of a decedent.  ', 'B', 'P500,000.00', 'P1,000,000.00', ' P2,000,000', 'P 750,000.00', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(354, 16, NULL, 68, 'The zonal value of a property can be obtained from:', 'A', 'Bureau of Internal Revenue.', 'Registry of deeds', 'Office of the sheriff', 'Assessor’s Office', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(355, 16, NULL, 69, 'The creditable withholding tax rate in the sale of a real estate dealer of a lot priced at  P220,000.00 is –', 'A', '1.5%.', '0.03', '0.075', '0.05', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(356, 16, NULL, 70, 'The sale and transfer of title from a real estate dealer to a buyer of a house and lot at   P2,000,000.00 is subject to the following EXCEPT:', 'D', 'Creditable withholding tax	', 'Transfer and registration fees.', 'Expanded value added tax', 'Capital gains tax', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(357, 16, NULL, 71, 'For the exemption on the payment of capital gains to be valid, within how many months after the sale or disposition of  a residential unit is it allowed ?   ', 'B', '9 months', '36 months', '24 months', ' 12 months', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(358, 16, NULL, 72, 'The estate tax return shall be filed with the BIR within _____ days from death of the decedent:  ', 'D', '60 days', '120 days', '90 days	', '180 days', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(359, 16, NULL, 73, 'The following types of taxes apply to real estate transactions, except --', 'D', 'Value-added tax', 'Creditable income tax', 'Excise tax.', 'Percentage tax', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(360, 16, NULL, 74, 'The sale of a house and lot by a developer at a price below this amount is exempted from VAT –', 'B', ' P 1,919,500.', 'P 3,199,200', 'P 1,500,000.', 'P 2,500.000.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(361, 16, NULL, 75, 'As a real estate broker, if your total gross receipts in one year is below this amount, you can apply to be a non-VAT entity –', 'D', 'P 1,500,000.', ' P 2,500,000.', 'P 3,199,200.', '1919500', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(362, 16, NULL, 76, 'Lease of residential units below this amount per month is not subject to VAT –', 'D', 'P 10,000.', 'P 12,000.  ', 'P 12,500.', 'P 12,800.', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(363, 16, NULL, 77, 'This tax is not imposed by the Bureau of Internal Revenue –', 'C', 'Income tax', ' Value-added tax	', 'Transfer tax', 'Documentary stamps tax', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(364, 16, NULL, 78, ' The following tax is imposed by the Bureau of Internal Revenue:', 'B', 'Transfer tax', 'Capital gains tax	', 'Realty tax', 'Privilege tax', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(365, 16, NULL, 79, 'The sale of the following is not exempt from VAT –', 'D', ' Sale of agricultural and marine products', 'Services that are subject to percentage tax', 'Revenue of hospital  and educational services	D.', ' Revenue of doctors', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(366, 16, NULL, 80, 'VAT returns (form 2550M) containing the amount of net output tax payable must be filed –', 'A', 'Monthly', 'Quarterly', 'Annually', 'None of the above', 1, '2020-09-14 23:13:53', '2020-09-14 23:13:53'),
(367, 17, NULL, 1, 'A subdivision plan needs only  the approval of the Land Registration or Land Management Bureau to effect segregation of titles when the resulting number of lot is:  ', 'A', 'Nine (9) or less', 'Twelve (12) or less', 'Ten (10)or less', 'Fifteen (15) or less', 1, '2020-09-15 00:30:30', '2020-09-15 00:30:30'),
(368, 17, NULL, 2, 'The body which formulates the policies and objectives as well as the over-all strategies for the county’s national shelter program is:', 'C', 'National Housing Authority', 'HLURB', 'HUDCC	', 'None of the above', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(369, 17, NULL, 3, 'A buyer of real estate has already paid in 8 years of installment a total amount of P520,000.00 inclusive of P20,000.00 penalty interest. The cash surrender value of the property based on Maceda Law is:', 'B', 'P200,000.00', 'P325,000.00', 'P250,000.00', ' None of the above', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(370, 17, NULL, 4, 'Most important document to be checked before buying a subdivision lot.  ', 'D', 'Map', 'License to sell', 'Subdivision plan', 'Development permit', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(371, 17, NULL, 5, 'A buyer on installment who has paid at least two years of installments, under Republic Act No. 6552, is entitled to a refund or 50% of total payments effected during the first five years and an additional ____ every year but not to exceed 90% of total payments made.  ', 'A', '0.05', '0.5', '0.2', '0.3', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(372, 17, NULL, 6, ' PD 957 is otherwise known as the –', 'B', 'Realty Installment Buyer Act', 'Subdivision and Condominium Buyer’s Protective Decree', 'Decree adopting the National Building Code', 'None of the above', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(373, 17, NULL, 7, 'PD 957 requires that project developers submit the following to guarantee the construction and full development of the project --', 'D', ' Surety bond or real estate mortgage equivalent to 20% of the development cost', 'Cash bond of 10% of development cost', 'Both of the above', 'Any of “A” or “B”', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(374, 17, NULL, 8, 'It is not necessary to secure a License to Sell if –', 'D', ' The sale of property is between co-owners or co-heirs;	', 'B.  The sale is a from an original purchaser who is reselling the property', 'A mortgagee is selling a property used as collateral to liquidate the debt', 'All of the above', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(375, 17, NULL, 9, 'Which of the following is not a strong ground for revocation of a License to Sell:', 'D', 'The developer’s completion of the project has been delayed.', 'Misrepresentation in any prospectus, brochure or literature given to buyers.', 'Conducting fraudulent transactions.', 'Insolvency of the developer.', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(376, 17, NULL, 10, ' If the developer will mortgage all or portions of the project, he is not required to --', 'B', 'Notify the HLURB', 'Notify all the buyers', 'Secure the prior approval of the Buyers ', 'Secure the prior approval of the HLURB', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(377, 17, NULL, 11, 'A subdivision project which is master-planned to provide all the elements of a small community, including commercial areas, residential areas, community facilities, leisure amenities -- -', 'B', 'First-class subdivision', 'Planned unit development', 'Mixed community', 'Urban subdivision', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(378, 17, NULL, 12, 'Enacted in 1977, PD 1216 amended Section 31 of PD 957 and requires the following amount of open spaces for parks, playgrounds and recreation  in residential subdivisions one hectare or more, except –', 'C', ' 9% of gross area for high-density or social housing', '7% of gross area for medium density or economic housing', '5% of gross area for townhouse projects', '3.5% of gross area for low-density or open market housing', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(379, 17, NULL, 13, 'A developer will develop a project with a gross area of 10 hectares into a subdivision for medium density housing.  Per PD 1216, how many square meters must be allocated for parks, playground and recreation?', 'C', '30,000 sqm', '9,000 sqm', '7,000 sqm', '3,500 sqm', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(380, 17, NULL, 14, 'Under PD 1216, the definition of open market housing is one in which the density is  –', 'A', 'Below 20 lots per gross hectare', '21 to 65 lots per gross hectare', '66 to 100 lots per gross hectare', 'Over 100 lots per gross hectare', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(381, 17, NULL, 15, 'After development, the road, alleys, sidewalks and playgrounds in a subdivision –', 'D', 'Shall be maintained in perpetuity by the developer', 'Shall be donated either to theLGU or homeowner’s association at developer’s option', 'Shall be donated only to the LGU', 'Shall be donated to the LGU or to the Homeowner’s Association subject to consent of the LGU.', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(382, 17, NULL, 16, 'A home built on a single lot with appropriate yard setback.', 'B', 'Single attached. 	', 'Single detached.	', 'Duplex', 'Rowhouse', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(383, 17, NULL, 17, ' Two homes built on a single lot.', 'C', 'Single attached.	', 'Single detached.	', 'Duplex', 'Rowhouse', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(384, 17, NULL, 18, 'Under BP 220, on a 80, 000 square meter gross area of socialized housing project and a density of 170 dwelling units per hectare, how many square meters should be allocated to community facilities?', 'A', '1200', '800', '1600', '2000', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(385, 17, NULL, 19, 'Under BP 220, on a 80,000 square meter gross area of economic housing project and a density of 240 dwelling units per hectare, how many square meters should be allocated to community facilities?', 'C', '1200', '800', '1600', '2000', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(386, 17, NULL, 20, 'Under BP 220, on a 100,000 square meter gross area of socialized housing project and a density of 120 dwelling units per hectare, how many square meter should be allocated to parks and playgrounds?', 'A', '1000', '2000', '5000', '1500', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(387, 17, NULL, 21, 'The curvilinear side of a lot occuring at a street corner.', 'C', 'Corner curve', 'Corner cut', 'Chaplan', 'Quarter round', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(388, 17, NULL, 22, 'A lot with 3 sides fronting streets.', 'B', 'Key Lot', 'Corner-Through Lot', ' Corner Lot', 'Flag Lot', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(389, 17, NULL, 23, 'The law that prescribes the amount of open spaces for subdivisions –', 'B', 'PD 1096', 'PD 1216', ' PD 957', 'PD 1517', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(390, 17, NULL, 24, 'The development permit for subdivisions shall be obtained from --  ', 'A', 'Local government unit', 'DENR', 'HLURB', 'DPWH', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(391, 17, NULL, 25, 'The license to sell for a subdivision project shall be obtained from --', 'C', ' Local government unit', 'DENR', 'HLURB', ' LMB', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(392, 17, NULL, 26, 'The agency of government that will review and approve the survey plan of the subdivision –', 'C', ' Local government unit', 'DENR	', 'HLURB', 'LMB', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(393, 17, NULL, 27, 'The basic elements that must be built in a subdivision development includes the following, except -  ', 'B', ' Streets and storm drainage system	', 'Housing models	', 'Electrical system', 'Water system', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(394, 17, NULL, 28, 'If the parcel of land planned for a residential subdivision is still agricultural, an application for conversion must first be obtained from --', 'D', 'Local government unit', 'Department of Public Works and Highways', 'Department of Environment and Natural Resources', 'Department of Agrarian Reform', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(395, 17, NULL, 29, ' In order to develop a tract of land into a residential subdivision, it must be zoned residential in accordance with the -', 'B', 'Requirements of the DAR	', 'Comprehensive Land Use Plan of the LGU', 'Regulations of HLURB', 'Department of Environment and Natural Resources', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(396, 17, NULL, 30, 'The common types of subdivision projects today are the following, except –', 'C', 'Residential subdivision', 'Agricultural subdivision', ' Golf courses', 'Industrial subdivisions', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(397, 17, NULL, 31, 'The HLURB stands for -', 'C', 'Housing Land Urban Regulatory Board;', ' Home and Land Utilization Regulations Bureau;', 'Housing and Land Use Regulatory Board', ' Home Living and Urban Resources Bureau.', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(398, 17, NULL, 32, 'The HLURB’s functions to enforce PD 957 of 1976  was previously exercised by -  ', 'B', 'HUDCC', 'NHA', 'Land Management Bureau	', 'Human Settlements Commission', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(399, 17, NULL, 33, ' The coordinating council in government which is in charge of all matters related to land use and housing is the --', 'C', 'National Housing Authority', 'National Land Use Commission', 'HUDCC', 'HLURB', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(400, 17, NULL, 34, 'The important functions of the HLURB includes  the following, except for --', 'B', 'Planning assistance to local governments for their CLUP;', ' Issuance of construction permits for large projects.', 'Registration and regulation of subdivisions, condominiums and other real estate projects', 'Adjudication or resolution of disputes between developers and buyers', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(401, 17, NULL, 35, 'The following is not part of the HLURB’s detailed regulatory function --', 'A', 'Review and approval of subdivision development permits.', 'Approval of the master deed for condominium projects.', 'Registration and supervision of homeowners’ associations.', 'Registration of real estate brokers engaged in selling projects licensed by HLURB.', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(402, 17, NULL, 36, 'Document issued by the DENR which shall exempt subdivision or condominium projects from providing a sewage treatment plant.', 'D', 'DP', 'COR', 'ECC.', 'CNC', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(403, 17, NULL, 37, 'Which of the following is not a common requirements for certificate of registration and license to sell between a residential subdivision project and a residential condominium project?', 'D', 'Sworn registration statement', 'Copies of the land titles', 'Articles of incorporation and financial statement of applicant', 'Master deed and declaration of restrictions', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(404, 17, NULL, 38, 'The following documents related to the marketing and selling of the project should be submitted, except –', 'C', 'Circular, prospectus, brochure or advertisements for public offering', 'Sample contract to sell', 'List of the company’s buyers', 'Proof that the notice of filing was published in two newspapers', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(405, 17, NULL, 39, 'The main office of the HLURB is located at --', 'C', 'Makati City', 'Manila', 'QC', 'Taguig', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(406, 17, NULL, 40, 'The HSRC was renamed the  HLURB in –', 'D', 'PD 957', 'R.A. 7279', 'Executive Order 648, in 1981', 'Executive Order 90 in 1986', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(407, 17, NULL, 41, 'Registration of a mortgage covering a subdivision project can only be affected when the deed is accompanied by a permit to mortgage issued by:', 'D', 'LGU', 'HUDCC	', 'HLURB', 'NHA', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(408, 17, NULL, 42, 'In the absence of any provision in the master deed of a condominium project, the interest of the unit owners in the common area shall be:  ', 'C', 'Proportionate', 'Based on value	', 'Equal	', 'Decided by the condominium corporation', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(409, 17, NULL, 43, ' Document to be checked before buying a subdivision lot:', 'C', 'Development permit', 'Map', 'License to sell', 'LMB approval', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(410, 17, NULL, 44, 'Which of the following cannot be issued condominium certificates of titles:  ', 'C', 'One-level row houses', 'Industrial warehouses', 'Two-level row houses', 'Subdivision lots', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(411, 17, NULL, 45, 'The required number of votes of registered owners to authorize a condominium corporation to sell, or otherwise dispose of the common areas in a condominium project is:  ', 'D', 'Two-thirds', 'Unanimous', 'Three-fourths', ' Simple majority', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(412, 17, NULL, 46, ' Jurisdiction for adjudication of buyers’ complaints against subdivision developers is with the:', 'D', 'Bureau of Trade Regulation and Consumer Protection', 'HUDCC', 'NHA', 'HLURB', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(413, 17, NULL, 47, 'The performance bond for a subdivision project may be in the form of a surety bond equivalent to:', 'C', '10% of development', '40% of development cost', '20% of development cost', 'None of the above', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(414, 17, NULL, 48, 'The articles of incorporation of homeowners association is registered with:  ', 'D', 'SEC', 'HLURB	', 'Home Guaranty Corporation', 'SEC or HLURB', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(415, 17, NULL, 49, 'In mixed use condominium project, the master deed may be amended by simple majority of unit owners.  Majority is based on.', 'A', 'Number of condominium units', 'Total area of condominium units', 'Floor area of ownership', 'Any of the above', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(416, 17, NULL, 50, 'Under DILG Memorandum Order No. 15-2002, the time frame for processing and action on applications for approval of subdivision plan is:', 'B', '15 days', ' 30 days', '45 days	', ' 60 days', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(417, 17, NULL, 51, 'A parcel of land subdivided into smaller parcels without provisions for streets or open spaces is a –', 'D', 'Regular subdivision', 'Complex subdivision', 'Consolidation-subdivision	', 'Simple subdivision', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(418, 17, NULL, 52, 'A parcel of land subdivided into smaller lots properly planned with streets and open spaces is –', 'B', 'Regular subdivision', 'Complex subdivision', 'Consolidation-subdivision	', 'Simple subdivision', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(419, 17, NULL, 53, 'Subdivision planning that is recti-linear, blocks, lots and streets arrayed in a rectangular pattern.', 'C', 'Contour planning', ' Modern planning', 'Gridiron planning ', 'Square planning', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(420, 17, NULL, 54, 'Subdivision planning that arranges all elements to closely fit into the terrain of the land.', 'A', 'Contour planning', 'Modern planning', ' Gridiron planning', 'Square planning', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(421, 17, NULL, 55, 'A street that leads into a bell-shaped end.', 'C', 'Dead-end', 'Driveway', 'Cul-de-sac', 'Provisional street', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(422, 17, NULL, 56, 'A lot with single frontage, all sides bounded by a neighboring lot.', 'A', 'Regular lot', 'Interior lot', 'Standard lot', 'Inside lot', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(423, 17, NULL, 57, 'A lot with 2 perpendicular sides fronting a street.', 'C', 'Key Lot', 'Corner-Through Lot', 'Corner Lot', 'Flag Lot', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(424, 17, NULL, 58, 'A lot in which the front and rear sides are fronting a street.', 'D', 'Corner lot', 'Flag lot', 'Corner lot', 'Through lot', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(425, 17, NULL, 59, ' A lot that does not have a frontage and is accessed only through a driveway.', 'A', ' Interior lot', 'Corner lot', 'Through lot', ' Inside lot', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(426, 17, NULL, 60, ' Any particular lot that commands a higher value because of its location.', 'D', 'Prime lot', 'High-end lot', 'Through lot', 'Key lot', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(427, 17, NULL, 61, 'The current price range  of  medium-cost housing (PD 957)  as set by the HUDCC per MC 4-2006 is _________?', 'D', 'P4-5M', 'P5-6M	', 'P6-7M', 'P3-4M	', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(428, 17, NULL, 62, 'The current price range  of  open market housing  (PD 957)  as set by the HUDCC per MC 4-2006 is _________?', 'D', 'Over P5M', 'Over P6M', 'Over 7M', 'Over P4M', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(429, 17, NULL, 63, 'For all residential subhdivisions, what percent  of the land area or cost is required for the socialized housing component?', 'D', '25', '30', '10', '20', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(430, 17, NULL, 64, 'Subdivision developers are required to undertake the following under PD 953 --', 'D', 'Built houses', 'Cement roads', 'Make playgrounds', 'Plant trees', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(431, 17, NULL, 65, 'The developer shall only be relieved of the obligation to maintain the subdivision only upon the issuance of a _________ by the HLURB and upon receipt by the local government unit concerned of the Deed of Donation for the Road Lots and open spaces duly executed in their favor or the Homeowner Association, in this case of parks and playground with the consent of the local government', 'D', ' Business permit', 'Occupancy Permit', 'Building permit', 'Certificate of completion', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(432, 17, NULL, 66, 'The minimum ceiling height for habitable rooms is _____ meters, and shall be measured from the finished floor line to the ceiling line?', 'A', '2', '1.5', '2.5', '3', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(433, 17, NULL, 67, 'The minimum clear width of a bathroom door shall be ______ meter?', 'A', '0.6', '0.7', '0.8', '0.5', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(434, 17, NULL, 68, 'A single-attached dwelling containing 3 or more separate living units designed in such a way that they abut each other at the sides, and are separated from each other by party wall is known as ________?', 'A', 'Row house', 'Multi Family Dwelling', 'Duplex	', 'Quaduplex', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(435, 17, NULL, 69, 'One of the ground for revocation of the license to sell of a subdivision project after due process by HLURB is _________?', 'A', 'Have been engaged or is about to engage in fraudulent transactions', 'Non payment of payable to contractors', 'Non payment to suppliers of construction materials', ' Selling for other developer', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(436, 17, NULL, 70, 'Upon full payment by the buyer of the lot or unit, the developer, if a mortgage over the lot or unit is outstanding at the time of the issuance of the title to the buyer, the owner or developer shall redeem the mortgage within ______ months from such issuance in order that the title over any fully paid lot or unit may be secured and delivered to the buyer.', 'A', '6', '12', '18', '24', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(437, 17, NULL, 71, 'The important functions of the HLURB includes the following, except for --', 'A', 'Issuance of construction permits for large projects.', 'Planning assistance to local governments for their CLUP;', 'Registration and regulation of subdivisions, condominiums and other real estate projects', 'Adjudication or resolution of disputes between developers and buyers', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(438, 17, NULL, 72, 'The following is not part of the HLURB’s detailed regulatory function --', 'A', 'Review and approval of subdivision development permits.', 'Approval of the master deed for condominium projects.', 'Registration and supervision of homeowners’ associations.', 'Registration of real estate brokers engaged in selling projects licensed by HLURB.', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(439, 17, NULL, 73, 'Who shall bear the cost of installation of street names/signs coincident with the construction of streets?', 'A', ' Developer', 'Contractor', 'Homeowners Association	', 'Buyers', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(440, 17, NULL, 74, 'Which community facilities is a mandatory provision for open market and medium cost housing projects with an area of 1 hectare and above that is non saleable?', 'A', 'Neighborhood multi-purpose center	', 'School', 'Tricycle terminal	', 'Commercial and retail centers', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(441, 17, NULL, 75, 'The minimum lot frontage for row house under PD 957  open market and medium cost housing projects is?', 'A', '4 meters', ' 6 meters', '8 meters', ' 10 meter', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(442, 17, NULL, 76, ' Under what government agency is HLURB?', 'A', 'HUDCC	', 'NHA', 'SEC', 'Local government', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(443, 17, NULL, 77, 'A developmental permit shall only be valid for a period of _______ years from date of issuance if no physical development is introduced?', 'A', '3 years	', '1 year', ' 5 years	', '10 years', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(444, 17, NULL, 78, 'After ______ weeks from the completion of the publication and upon submission of the affidavit of publications, HLURB shall in the absence of any impediment, issue a Certificate of Registration upon payment of the prescribed fees?', 'A', '2', '1', '4', '6', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(445, 17, NULL, 79, 'The current price ceiling of socialized housing as set by the HUDCC per MC 1-2014 is _________?', 'A', 'P450,000.00 and below', ' P300,000.00 and below', 'P225,000.00 and below', 'P180,000.00 and below', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(446, 17, NULL, 80, 'The current price range of  economic housing (BP 220) per HUDCC MC 2-2015 is _________?', 'A', 'P450K - P1.7M', 'P450K -  P1.5M', 'P400K - P1.7M', 'P500K - P1.5M', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(447, 17, NULL, 81, 'HLURB may authorized ______________, as the case may be , to conduct an ocular inspection of the project to determine whether the development of said project conform to the standards and specification prescribed by the government.', 'A', 'Provincial, City or Municipal Engineer', 'Homeowner', 'Private Appraiser', 'Judge', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(448, 17, NULL, 82, 'Who is the lead financial institution that develops and implement social housing programs of the Philippines?', 'A', 'Social Housing Finance Corporation	', 'Home Guaranty Corporation', 'NHMFC', ' NHA', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(449, 17, NULL, 83, 'In a subdivision project that is not covered by concerned local water franchise holder the developer may drill their own deep well subject to securing permit to drill from which Government agency?', 'A', 'NWRB	', 'LGU', 'DENR', 'Department of Agrarian Reform', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(450, 17, NULL, 84, 'If the road width of a medium cost subdivision housing project is 15 meters then how many meters should the sidewalk be?', 'A', '1.2', '1', '1.3', '1.5', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(451, 17, NULL, 85, 'For a subdivision housing project that is 30 hectares and above _________ is required to be submitted to HLURB before the Certificate of Registration can be issued.', 'A', 'Traffic Impact assessment (TIA)', 'Cash flow', 'Building Permit', 'NWRB Permit', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(452, 17, NULL, 86, 'If an independent water supply is to be developed such as a deep well, its capacity must be based on the estimated population and a per capita consumption of –', 'D', '50 liters per day	', '100 liters per day', '125 liters per day', '150 liters per day.', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31');
INSERT INTO `multi_choices` (`id`, `quiz_id`, `set_number`, `item_number`, `question`, `correct_answer`, `choice_A`, `choice_B`, `choice_C`, `choice_D`, `points`, `created_at`, `updated_at`) VALUES
(453, 17, NULL, 87, 'If the water tank for a subdivision must be sized to hold 20% of average daily demand, what is the required size for a subdivision with an estimated population of 1,000 residents?', 'C', '20,000 Liters', '25,000 Liters', '30,000 Liters', '35,000 Liters.', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(454, 17, NULL, 88, 'The street lights in a subdivision must be spaced a maximum distance not to exceed –', 'B', '25 meters', '50 meters.', '75 meters', '100 meters', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(455, 17, NULL, 89, 'What is the maximum number of units that is allowed for a rowhouse building?', 'C', '10 units .', '15 units .', '20 units.', '25 units .', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(456, 17, NULL, 90, ' If a buyer stops paying installments due to developer’s long delay in developing the project, he can be reimbursed if –', 'D', 'He notifies the developer in writing;	', 'He notifies the HLURB in writing;', 'He obtains clearance from the HLURB.', 'All of the above.', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(457, 17, NULL, 91, 'A  preliminary development permit for a condominium is valid for -', 'A', '180 days', '120 days', '90 days', 'one year', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(458, 17, NULL, 92, ' In PD 957 IRR, area allocated for parks and playgrounds for subdivisions  with 20 lots/ hectares or less shall be --', 'A', '0.035', '0.04', '0.05', '0.06', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(459, 17, NULL, 93, ' In PD 957 IRR, the minimum size of a  single detached lot, under open market category,  in a subdivision shall be –', 'D', '50 sqm.', '75 sqm', '100 sqm', '120 sqm', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(460, 17, NULL, 94, 'In PD 957 IRR, the maximum length of a subdivision block shall not exceed –', 'C', '250 meters', '300 meters', '400 meters.', '500 meters', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(461, 17, NULL, 95, ' An intermediate  alley must be provided if a subdivision block exceeds ____ meters in length.', 'A', '250 meters.', '300 meters', '400 meters', '500 meters', 1, '2020-09-15 00:30:31', '2020-09-15 00:30:31'),
(462, 27, NULL, 1, 'What is the minimum floor area allowed for a residential condominium by PD 957 IRR?', 'A', ' 18 sqm', '21 sqm', '24 sqm', '30 sqm', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(463, 27, NULL, 2, 'Under PD 957, How many parking slots should be provided in a residential condo with 240 units that are all below 50 sqm in size?', 'B', '60 slots', '30 slots', '40 slots', '240 slots', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(464, 27, NULL, 3, 'In PD 957, are parks and playgrounds required for residential condominium projects?', 'D', ' Not required if there are parks and playgrounds not more than 800 meters away.', 'Not required if the project has less than 10 condo units.', ' Not required if the total salable area is less than 1,000 sqm.', ' All of the above is true', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(465, 27, NULL, 4, 'If a park or playground is required for a residential condo project, what is the area needed?', 'C', ' At least 50 sqm in size only', 'At least 100 sqm in size only', 'At least 50 sqm plus increments of 3 sqm for each additional unit in excess of 10.', 'At least 200 sqm in size', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(466, 27, NULL, 5, 'If a residential condo has 240 dwelling units, what is the minimum size of the park or playground?', 'D', '500 sqm', ' 650 sqm', ' 700 sqm', '740 sqm. ', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(467, 27, NULL, 6, 'The HLURB requires publication by the developer of a notice of filing of the project registration statement –', 'D', 'In at least two newspapers for 30 days', 'In one newspaper daily for two weeks', 'In two newspapers daily for one week', 'In two newspapers, once a week, for two weeks.', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(468, 27, NULL, 7, 'Besides the publication requirement, the developer is required by HLURB to maintain the following until its license to sell has been approved –', 'D', 'Security guard at the project site', 'Insurance policy for the project', 'Site office', 'Site billboard 3\'x6\'', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(469, 27, NULL, 8, 'The minimum size of parks/playgrounds for condominium projects under PD 957 –', 'D', '100 sq. meters', 'At least one floor with amenities', '50 sq. meters for every 10 units', '50 sq. meters plus 3 sq. meters per unit in excess of ten', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(470, 27, NULL, 9, ' The title of the  land on which a condominium project shall be built must be –', 'D', 'Titled to the name of the condominium corporation;', 'Title can be maintained in the name of the condominium developer ;', 'Title may be held in the name of the original lot owner;', ' Any of the above', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(471, 27, NULL, 10, 'According to the BIR, the condominium corporation –', 'A', 'Shall be subject to income tax', 'Shall be subject to EVAT or percentage tax only', 'Shall be tax-exempt', 'Shall be subject to all internal revenue taxes', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(472, 27, NULL, 11, 'In order to amend the enabling document governing a specific condominium project that has been turned over, the approval of the following is required –', 'D', ' At least two-thirds (2/3) majority of the condominium unit owners', 'The developer of the project', 'The register of deeds', 'A simple majority of the condominium unit owners', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(473, 27, NULL, 12, ' The specific document which provides for the management of a condominium project – its authority, voting majorities, quorum, notices and other rules –', 'B', 'House rules', 'Declaration of Restrictions', 'Condo policies', 'Master deed', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(474, 27, NULL, 13, 'The general rules is that foreigners can own up to _____ % of the condominium units in a condo project if the land is titled to the condominium corporation -', 'C', '0.5', '0.6', '0.4', 'No limitation', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(475, 27, NULL, 14, 'Which of the following elements is considered a part of a condominium unit –', 'D', 'bearing walls, columns, floors, roofs, foundations and other common structural elements of the building;', 'lobbies, stairways, hallways,', 'elevator equipment and shafts', 'outlets of electrical circuits located within the unit', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(476, 27, NULL, 15, 'The condominium corporation comprised of all unit owners in the condo building do not have  the power to  –', 'D', 'Hold title to the land of the condominium project', 'Elect the Board of Directors and Officers', 'Sign contracts for the security and maintenance of the building', 'Engage in secondary purposes  such as brokerage for the sale of units in the project', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(477, 27, NULL, 16, ' Which of the following is not legally part of the condominium corporation\'s obligations  –', 'C', 'To assess and collect condominium dues from unit owners', 'To purchase materials and supplies for maintenance of common areas', 'To supervise the auction of units which are foreclosed for non-payment of dues', 'To register with the Register of Deeds the unpaid assessments as liens upon condo units', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(478, 27, NULL, 17, 'If a condominium building has been seriously damaged by fire, which of the following acts is not valid –', 'D', 'The condominium corporation can be dissolved if not yet restored after 3 years;', 'The condominium corporation can be dissolved if more than half of the units are un-tenantable and more than 30% of the members are opposed to restoration;', 'The condominium corporation can be dissolved if more than half of the unit owners decide to do so;', 'The condominium corporation can be dissolved by order of the HLURB.', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(479, 27, NULL, 18, 'Condominium association dues that are unpaid become liens upon the unit that are –', 'D', 'Secondary liens to the unit\'s mortgage', 'Not to be registered with the Register of Deeds', 'Basis for the forfeiture of the unit\'s ownership', 'Superior liens to all other future liens except taxes', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(480, 27, NULL, 19, 'Before title to a condominium unit can be transferred at the Register of Deeds, the following is required –', 'D', 'Certificate of the HLURB approving the transfer', 'Approval of the City or Municipal Assessor', 'Approval of the majority of the unit owners', 'Certificate of the management body that conveyance complies with Master Deed', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(481, 27, NULL, 20, 'The original amendment provision of the master deed under the Condominium Act required a 2/3 majority and this was later amended only to a majority vote by –', 'D', 'RA 4726', 'RA 6552', 'RA 7652', 'RA 7899', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(482, 27, NULL, 21, 'The condominium corporation shall have a term that is –', 'D', ' At least 50 years	', '50 years renewable another 25 years', 'At least 25 years', 'Co-terminus with the duration or life of the condominium project', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(483, 27, NULL, 22, 'The condominium corporation shall be initiated or organized by the –', 'D', 'HLURB	', 'Majority of the condominium unit buyers', 'Local government where the project is located', 'Condominium developer', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(484, 27, NULL, 23, 'A common restriction in the resale of condominium units –', 'D', ' Resale must be approved by the HLURB', 'Resale subject to approval by the local government assessor', 'Resale is prohibited for at least 5 years', 'Resale subject to right of first refusal by other condominium unit owners', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(485, 27, NULL, 24, ' The condominium buyer under a contract to sell who is delinquent in the payment of his installments after 30 months will suffer the consequence of –', 'D', 'Rescission of his contract to sell and forfeiture of all payments', 'Foreclosure and auction of the condominium unit', 'Blacklisting by the real estate developers association', 'Rescission and forfeiture based on RA 6552', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(486, 27, NULL, 25, 'The condominium buyer whose unit has been mortgaged to a bank who is delinquent in paying the amortization will suffer the consequence of –', 'D', 'Automatic rescission of his contract to sell and forfeiture of all payments', 'Blacklisting by the bankers association', 'Rescission and forfeiture based on RA 6552', 'Foreclosure and auction of the condominium unit.', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(487, 27, NULL, 26, 'A form of common ownership which involves a corporation where each unit owner owns shares together with independent ', 'A', 'Condominium', ' Joint use', 'Cooperative', 'Townhome', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(488, 27, NULL, 27, 'The condominium concept of development is legally mandated by the following law –', 'B', 'PD 957', 'PD 1216', 'R.A. 4726', 'R.A. 6552', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(489, 27, NULL, 28, 'Developers of subdivisions and condominium projects must register their projects and secure development permits and licenses to sell as required by –', 'B', 'PD 957.', 'PD 1216', 'R.A. 4726', 'R.A. 6552', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(490, 27, NULL, 29, 'Buyers paying under an installment plan who are in default may avail of a grace period as provided by –', 'D', 'PD 957', ' PD 1216', 'R.A. 4726', 'R.A. 6552.', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(491, 27, NULL, 30, 'In a  condominium project that has been completed and  turned over,  the land is usually owned by –', 'C', 'The developer', 'A separate corporation  owned by the unit owners', 'The local government where the project is located', 'The unit owners in their joint capacity', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(492, 27, NULL, 31, 'The management of the completed condominium project will be under the –', 'B', 'The developer', 'A separate corporation  owned by the unit owners', 'The local government where the project is located', 'The unit owners in their joint capacity', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(493, 27, NULL, 32, 'Which of the following parts of a condominium project might not be part of the common areas –', 'C', ' Lobbies', 'Stairs and corridors', 'Basement parking stalls', 'Elevator equipment', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(494, 27, NULL, 33, 'Which of the following is not considered part of the unit  in a condominium project', 'D', 'Toilets constructed by the developer for the unit', 'Interior face of the structural slabs within the unit', 'Interior partitions separating the bedrooms', 'Structural columns and beams inside the unit', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(495, 27, NULL, 34, ' What document is required to be anotated in the title of the land which is part of a condo project?', 'B', 'Deed of restrictions', 'Master Deed', 'License to Sell', 'Development Permit', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(496, 27, NULL, 35, 'Which of the following laws is not applicable to  condominium  development projects -', 'D', 'P.D. 957', 'R.A. 4726', 'R.A. 7899', 'None of the above', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(497, 27, NULL, 36, 'The minimum size of a lot in an agricultural subdivisions shall be –', 'C', '500 sqm', '750 sqm', '1000 sqm', '1500 sqm', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(498, 27, NULL, 37, ' Not more than ____% of the lot area in a farmlot of an agricultural subdivision can be occupied by a house.', 'C', '0.15', '0.2', '0.25', '0.3', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(499, 27, NULL, 38, 'The following resolution/s of HLURB governs memorial park projects –', 'D', 'HLURB Res 681', 'HLURB Res 729', 'HLURB Res 747', 'All of the above', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(500, 27, NULL, 39, 'Memorial parks and cemeteries may NOT be located at –', 'C', ' Areas zoned for memorial parks/cemeteries	', 'Areas adjacent to an existing cemetery/memorial park', 'Areas zoned within the SAFDZ  ', 'Areas at least 100m away from residential, commercial, industrial or institutional use', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(501, 27, NULL, 40, 'Licensing of memorial park/cemetery projects shall be granted when the development has reached at least ____ %.', 'C', '0.1', '0.15', '0.2', '0.25', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(502, 27, NULL, 41, 'Columbarium projects may be located in any of the following, except –', 'C', 'Areas zoned for columbarium', 'Institutional zones designated for religious structures', 'Agricultural areas.', 'Commercial zone C2', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(503, 27, NULL, 42, 'A Columbarium project must have at least _____ parking slots.', 'A', '100', '75', '50', '25', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(504, 27, NULL, 43, 'At least _____ % of the land area for a memorial park must have “lawn” lots to preserve the natural character of the project.', 'C', '100', '75', '50', '25', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(505, 27, NULL, 44, 'A repository in the columbarium for storing bone remains –', 'A', 'Ossuary.', 'Ash niche', 'Vault', 'None of the above', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(506, 27, NULL, 45, 'A standard golf course has _____ holes.', 'C', '9', '12', '18', '24', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(507, 27, NULL, 46, ' For planning purposes, about _____ hectares of land should be allocated for a typical golf course.', 'A', '50', '30', '20', '10', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(508, 27, NULL, 47, ' A form of common ownership which involves a corporation where each unit owner owns a share entitling him to lease a unit.', 'C', 'Condominium', 'Joint use', 'Cooperative', 'Townhome ', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(509, 27, NULL, 48, ' A form of ownership which involves separate ownership of adjacent lots on which a common building with multiple attached units are owned independently.', 'D', 'Condominium', 'Joint use', 'Cooperative', 'Townhome', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(510, 27, NULL, 49, 'In order that the maintenance and repairs of a memorial park project shall be assured, developers of such projects are required to –', 'D', 'Provide a warranty bond that they shall maintain the project forever', 'Turn over the maintenance to the homeowners association', 'Setup a maintenance contract with the local government', 'Establish a perpetual care fund', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(511, 27, NULL, 50, 'The land on which memorial parks may be constructed must have a water table depth of not less than –', 'D', '1.0 meter', '2.0 meters', '3.0 meters', '4.50 meters', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(512, 27, NULL, 51, 'Columbarium buildings shall not be  constructed at the following location –', 'D', 'Institutional zones for religious structures', 'Institutional zones for area for seminaries and convents', 'Commercial zone C2', 'None of the above', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(513, 27, NULL, 52, ' The development permit application  for memorial parks and cemeteries  may be submitted to  –', 'D', ' DENR', 'HLURB	', 'Local Government Unit', 'Either B or C', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(514, 27, NULL, 53, 'Columbarium buildings must be built with a minimum ______ meter non-buildable buffer adjoining residential areas.', 'D', '2 meters', '3 meters', '4 meters', '5 meters', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(515, 27, NULL, 54, 'Columbarium projects must provide –', 'A', 'Prayer room', 'Canteen', 'Crematorium', 'None of the above', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(516, 27, NULL, 55, ' For memorial parks and columbarium projects, a license to sell is –', 'C', 'Not required', 'Optional', 'Required', 'Required if stipulated by the LGU', 1, '2020-09-15 01:52:42', '2020-09-15 01:52:42'),
(517, 28, NULL, 1, 'Under 1987 Constitution, a Filipino citizen or a Filipino corporation  may lease land of the public domain for ____ years, renewable for another ______years.', 'A', '25 and 25', '50 and 50', '15 and 15', '50 and 25', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(518, 28, NULL, 2, 'Under 1987 Constitution, a corporation may lease not more than ______ hectares of land of the public domain.', 'C', '500', '750', '1000', '1500', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(519, 28, NULL, 3, 'Under 1987 Constitution, a Filipino citizen  may lease not more than ______ hectares of land of the public domain', 'A', '500', '750', '1000', '1500', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(520, 28, NULL, 4, 'Useful improvements: If the lessee makes in good faith useful improvements suitable for the use intended, he is entitled to ____% refund of the value of the improvements.', 'C', 'none', '0.25', '0.5', '1', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(521, 28, NULL, 5, 'Under Rent Control Law of 2009 (RA 9653) the maximum increase of residential dwellings covered by rent control law should not exceed ____%.', 'B', '0.05', '0.07', '0.1', '0.15', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(522, 28, NULL, 6, 'Under Rent Control Law of 2009 (RA 9653) the maximum rent for residential dwellings located in the NCR and highly urbanized areas should not exceed P______ per month.', 'D', 'P7,000.00', 'P12,800', 'P9,000.00', 'P10,000.00', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(523, 28, NULL, 7, ' One ground for judicial ejectment under Rent Control is non payment of rental for at least ____consecutive months.', 'B', '2', '3', '4', '5', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(524, 28, NULL, 8, 'Under the Philippine Expropriation Law, the initial offer of the government for the lot affected is _______% of the BIR zonal value per square meter.', 'C', '0.5', '0.8', '1', '1.5', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(525, 28, NULL, 9, 'The ground floor of a residential condominium is treated as commercial by the BIR and therefore a _____% premium based on regular zonal value is added.', 'C', '0.1', '0.15', '0.2', '0.25', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(526, 28, NULL, 10, 'Foreclosure sale of banking institution; basis is registration of the sale; Extra-judicial – right of redemption, if mortgagor is individual', 'A', '1 year ', '3 months', '6 months', '2 months', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(527, 28, NULL, 11, 'A stipulation in a mortgage contract where the mortgagee is authorized to appropriate the property upon default or non-payment of debt is:', 'A', 'Pactum Commissorium', 'Pactum de non Aliendo', 'Tacita Reconduct', 'Dacion en pago', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(528, 28, NULL, 12, 'The conveyance of real estate in payment of an obligation is:', 'A', 'Dacion en pago', 'Pacto en retro sale.', ' Cession of ownership', 'Quit claim Deed', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(529, 28, NULL, 13, 'The voluntary or involuntary transfer of title to real estate is:', 'A', 'Alienation', 'Adverse possession', 'Quit claim', 'Surrender', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(530, 28, NULL, 14, 'A provision in the blanket mortgage that property whose loan value has been fully paid shall be released from the mortgage:', 'A', 'Automatic redemption clause ', 'Defeasance clause.', 'Termination clause', ' Acceleration clause', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(531, 28, NULL, 15, 'In the absence of a pre-nuptial agreement, the following are excluded from the community property, except:', 'A', 'Jewelry for personal use of either spouse.', 'Fruit as well as income of property mentioned in letter (a) unless otherwise provided by the donor', 'Property acquired before the marriage by other spouse who has legitimate descendants by a former marriage and the fruit as well as the income, if any, of such property', 'Property acquired during the marriage by gratuitous title by either spouse unless otherwise provided by the donor', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(532, 28, NULL, 16, ' Title to an inherited property may be transferred to the sole heir upon payment of estate tax and execution and registration of a legal document called:', 'A', 'Affidavit of Adjudication', 'Extra-judicial Settlement of Estate', 'Extra-judicial Partition of Estate', 'Affidavit of Consolidation', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(533, 28, NULL, 17, 'The right of an owner-lessor to receive the contract rent and reversion of the property at the end of the lease is called:', 'A', 'Lease fee ', 'Fee simple', 'Leasehold', 'Net lease', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(534, 28, NULL, 18, 'A mortgage which covers two or more properties is called:', 'A', ' Blanket mortgage ', 'Equitable mortgage', 'Conventional mortgage', 'Close mortgage', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(535, 28, NULL, 19, 'A legal provision which requires agreement for the sale of real estate to be in writing and subscribed to by the parties to be enforceable by action:', 'A', 'Statute of fraud', 'Defeasance clause', 'Evidentiary rule', ' Enforceability clause', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(536, 28, NULL, 20, 'In the absence of stipulation on the period, the vendor in pacto de retro sale may repurchase the property within:', 'A', '4 years', '6 years', '8 years', '1 years', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(537, 28, NULL, 21, 'The party that holds legal title to real property when the property seller and buyer enter into an installment sales contract is the', 'A', 'Vendor', 'Vendee', 'Closing agent', 'Buyer', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(538, 28, NULL, 22, 'A contract in which one of the parties has used duress to obtain consent can usually be rescinded', 'D', ' By the party who used duress to obtain consent', 'By either of the parties', 'Only if both parties mutually agree to rescind the contract', 'By the innocent party', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(539, 28, NULL, 23, 'A contract has no provisions for consideration is', 'A', 'Valid', ' Void', 'Voidable', 'Unenforceable', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(540, 28, NULL, 24, ' Which of the following statements best describes the prospective buyer\'s situation when the seller makes a counteroffer?', 'C', 'The buyer is relieved of any obligation under his original offer', 'The buyer is obligated to accept the counteroffer', 'The buyer remains obligated to the terms of his original offer', 'The buyer is obligated to make a new offer if the counteroffer is not accepted', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(541, 28, NULL, 25, 'Three joint tenants share interest in a property. If one joint tenant\'s share is sold using the proper legal formalities, the new owner will be a ', 'A', 'Joint tenant with the other joint tenants', 'Tenant in common with other joint tenants', 'Tenant at sufferance', 'Remainderman', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(542, 28, NULL, 26, 'Betty\'s property includes an easement over Al\'s land, Al\'s property is the', 'A', 'Dominant tenement', 'Servient tenement', ' Easement', 'Encroachment', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(543, 28, NULL, 27, 'When both parties agree to cancel a contract they affect a', 'A', 'Rescission', 'Release', 'Novation', 'Reformation', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(544, 28, NULL, 28, ' A well- drafted real estate purchase contract will include provision for', 'D', 'The buyer\'s possession of the property', 'The financing terms', 'Proration of property expenses', 'All of the above', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(545, 28, NULL, 29, 'Because a tenant complains about the condition of the building, the landlord may', 'D', ' Evict the tenant', 'Raise the Tenant\'s rent', 'Shut off the tenant\'s utilities', 'Investigate the complaint', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(546, 28, NULL, 30, 'Which of the following may be considered in choosing a tenant?', 'D', 'Marital Status', 'National ancestry', 'Whether the prospective tenant is on welfare', 'Tenant\'s income', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(547, 28, NULL, 31, ' In general, a mortgagor who mortgages his property and later was foreclosed extrajudicial and sold at public auction my redeem the property within the period of:', 'A', 'One (1) year from registration of certificate of sale.', 'Ninety (90) days from date of auction sale', 'One (1) year from date of auction sale', 'One (1) month from date of auction sale', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(548, 28, NULL, 32, 'To constitute negligence of failure to disclose or ascertain to any person with whom person a broker is dealing relative to the property and within his knowledge at the same time of the transaction, what matters must the broker disclose?', 'A', 'Material fact, data of information', ' Location, topography and shape of factory', 'Previous owner of property or history of a title.', 'Whether property is updated in tax payment', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(549, 28, NULL, 33, 'Mr. Villanueva inherited a piece of land when he was still single. Then he got married on October 1, 2000 without a marriage settlement. What is the nature of the property now that he is married?', 'A', 'Community property', 'Exclusive property', 'Common property', 'Conjugal property', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(550, 28, NULL, 34, 'A provision in a financing agreement which renders the remaining principal balance of the loan immediately due and payable upon default in any stipulated installment.', 'A', 'Acceleration clause.', 'Defeasance clause', 'Escalation clause', 'Open-end loan provision', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(551, 28, NULL, 35, 'What is legitime?', 'A', 'Reserved property for compulsory heirs', 'An acknowledge heir', 'An inherited property', 'Child born out or wedlock', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(552, 28, NULL, 36, 'A mortgage containing a clause that permits the mortgagor to borrow money after the loan has been reduced without rewriting the mortgage.', 'D', 'pactum commissorium', ' closed mortgage	', ' pactum de non aliendo', 'open-end mortgage', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(553, 28, NULL, 37, 'Any lien placed upon property with consent of, or as a result of,  the voluntary act of the owner.', 'D', 'mortgage', 'encumbrance', 'voluntary encumbrance', 'voluntary lien', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(554, 28, NULL, 38, 'A lien imposed against property without consent of the owner; example: unpaid realty tax, estate tax, mechanics lien', 'B', 'mortgage lien', 'involuntary lien	', 'compulsory lien', 'statutory lien', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(555, 28, NULL, 39, 'A lien placed upon property after a previous lien has been made and recorded.', 'B', 'first mortgage', 'junior lien', ' mechanics lien', 'statutory lien', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(556, 28, NULL, 40, 'Violation of any of the terms or conditions of a contract without legal excuse.', 'C', 'voidable contract', 'void contract', 'breach of contract ', 'unenforceable contract', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(557, 28, NULL, 41, ' A contract whereby the owner retains title to the property until the purchaser has met all of the terms and conditions of the contract.', 'C', 'conditional deed of sale', ' contract of sale', 'conditional sale contract', 'option contract', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(558, 28, NULL, 42, 'The transfer of title to real property by means of a written instrument back to the original owner.', 'A', 'reconveyance ', 'assignment', 'transfer of right', 'contract', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(559, 28, NULL, 43, 'A legal instrument in writing, duly executed, sealed, and delivered, whereby the owner of real property (grantor) conveys to another (grantee) some right, title, or interest in real estate.', 'A', 'deed', 'sale', 'assignment', 'contract', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(560, 28, NULL, 44, 'Failure to perform a specific, required legal duty. Example is non-payment of loan amortizations.', 'A', 'default ', 'arrears', ' breach of contract', 'foreclosure', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(561, 28, NULL, 45, 'At a judicial foreclosure sale, the difference between the indebtedness sued upon and the sale price of the real estate.', 'A', 'deficiency judgment ', 'equitable judgment', 'unearned increment', 'refund', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(562, 28, NULL, 46, 'Forcing action or inaction against a person\'s will.', 'B', 'foreclosure', 'duress', 'involuntary alienation', ' judgment', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(563, 28, NULL, 47, 'Procedure whereby property pledged as security for a debt is sold to pay the debt in event of default in payments or terms.', 'C', 'forfeiture', 'redemption', 'foreclosure', 'auction', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(564, 28, NULL, 48, 'Under Civil Code, Filipino citizen may lease private real estate property of no more than:', 'D', '25 years', '50 years', '75 years', '99 years', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(565, 28, NULL, 49, 'Under PD 471, a foreigner not a foreign investor may lease real estate property in the Phils for a maximum of ____ years including renewal.', 'B', '25 years', '50 years ', '75 years', '99 years', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(566, 28, NULL, 50, 'Under RA 7652, a foreign investor may lease land in the Phils solely for investment for a maximum of _______years including renewal', 'C', '25 years', '50 years', '75 years', '99 years', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(567, 28, NULL, 51, 'An Authority given by the developer to a broker to look for a supplier of back-filing materials who shall be paid with developed lot is:', 'A', 'Exchange agency', 'Procurement agency', 'General Brokerage', 'Sales agency', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(568, 28, NULL, 52, 'An agreement wherein the seller, for a consideration, binds himself to reserve the property for the buyer within a stipulated period is:', 'A', 'Option', 'Contract to sell', ' Listing', 'Offer to sell', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(569, 28, NULL, 53, 'An agreement between an owner and a broker to sell a real estate property:', 'A', 'Authorization ', 'Joint venture', 'Listing', 'Power of Attorney', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(570, 28, NULL, 54, 'A right given for a consideration to purchase or lease a property within specified time:', 'D', 'Plus factor', ' Earnest money', 'Time frame', 'None of the above', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(571, 28, NULL, 55, 'In the real estate business, another term of the owner is:', 'A', 'Principal ', 'Prospect', ' Customer', 'Alter Ego', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(572, 28, NULL, 56, 'Which of the following listings affords the best protection for real estate brokers:', 'A', 'Exclusive right to sell ', 'Exclusive agency;', ' Multiple listing;', 'Open listing;', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(573, 28, NULL, 57, 'A real estate listing agreement is:', 'A', 'Employment of a broker by owner to sell or lease', 'A list of real estate properties held by one owner ;', 'A written list of improvements on the land ;', 'A rendition of property for valuation ;', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(574, 28, NULL, 58, 'It is a contract in which performance will depend on the occurrence of another event.', 'A', 'Aleatory contract', 'Contract to sell', 'Option;', 'Pacto de retro contract', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(575, 28, NULL, 59, ' In case of foreclosure sale where right of redemption is not exercised by the mortgagor, who pays the capital gains tax?', 'B', 'None of these', 'Buyer of the property', 'Creditor-Bank', 'Owner-mortgagor', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(576, 28, NULL, 60, 'An annotation on a title which serves as notice that the property is being held in reserve for whatever judgment may be rendered against the owner.', 'A', 'Writ of preliminary attachment', 'Caveat emptor', 'Lis Pendens', 'Adverse claim', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(577, 28, NULL, 61, 'In tax delinquency sale, the redemption period starting from the registration of the sale is_____.', 'A', '1 year', '3 months', '6 months', '2 months', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(578, 28, NULL, 62, 'Under PD 1517, if the owner of the land occupied by a legitimate tenant for at least 10 years, is being offered for sale, the legitimate tenant has the right of first of refusal and maybe exercised for a period not exceeding ______months.', 'D', '1 month', ' 2 months', '3 months', ' 6 months', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(579, 28, NULL, 63, 'In general, under Civil Code, right of first refusal is within ______ starting from the date the offer was made.', 'A', ' 30days ', ' 60days', '90days', '6 months', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(580, 28, NULL, 64, 'Adverse claim is good for _______days upon registration', 'B', '15days', '30 days', '45 days', '60 days', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(581, 28, NULL, 65, 'Sale of subdivision lot resulting from the partition of land among co-owners and co-heirs is _________ from getting a License to Sell from HLURB.', 'A', 'Exempt', 'Required', 'Must register', 'Must Report', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(582, 28, NULL, 66, 'Refers to an amount accompanying an offer to buy or purchase. it is considered as part of the contract price.', 'A', 'Earnest', 'Escrow', 'Listing', 'Option', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(583, 28, NULL, 67, 'It is a contract whereby a person, for a consideration, gives to another the possession, use and enjoyment of a property for a period which may be a fixed or not fixed.', 'B', 'Loan', 'Lease', 'Mortgage', 'Sale', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(584, 28, NULL, 68, 'It is a document containing the contract executed between the principal and the real estate broker to negotiate for the sale, lease or mortgage of the property.', 'B', 'Earnest', 'Listing', 'Escrow', 'Option', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(585, 28, NULL, 69, ' A resident of a unit in a multi-unit building has proprietary lease right. Title to the resident\'s building is held under which form of ownership?', 'C', 'Joint tenancy', 'Cooperative', 'Condominium', 'Land trust', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(586, 28, NULL, 70, 'A tenant who remains in possession of property after the lease expires without the landlord\'s consent has a (n)', 'C', 'Periodic tenancy', 'Estate for years', 'Defeasible estate	', 'Tenancy at sufferance', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(587, 28, NULL, 71, 'Which of the following forms of ownership includes the unities of time, title, interest and possession?', 'C', 'Ownership in severalty', 'Tenancy in common', 'Joint Tenancy', 'Tenancy at sufferance', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(588, 28, NULL, 72, ' A life estate based in the life of a person other than the life tenant is called', 'A', 'A remainder', 'A reversio', 'Pur autre vie', 'Curtesy', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(589, 28, NULL, 73, 'Which of the following is a characteristics of tenants in common?', 'B', 'Each tenant is assumed by law to hold an equal interest in the land', 'Each tenant has an undivided interest in property', 'Each tenant rents their portion of the property', 'Each tenant rents the right of survivorship', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(590, 28, NULL, 74, 'Freehold estates that are not inheritable are called', 'D', 'Fee simple estates', 'Defeasible estate', ' Fee absolute estates', 'Life estates', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(591, 28, NULL, 75, 'A lease of fixed length that continually renews itself for like periods of time until notice is given to terminate is a (n)', 'A', 'Periodic estate', 'Estate at will', 'Estate for years', 'Estate at sufferance', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(592, 28, NULL, 76, ' John and Mary hold property as joint tenants.  John conveys one-half of his interest to his wife. Which of the following now is true?', 'C', ' John and Mary are joint tenants and tenants in common with John\'s wife.', 'John, his wife and Mary are all tenants in common', 'John and his wife are tenants in the entirety and joint tenants with Mary', 'John, his wife and Mary are all joint tenants', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(593, 28, NULL, 77, 'A lease arrangements in which the tenants pays fixed rent and the landlord pays all the operating expenses of the property is called a -', 'A', 'Gross lease', 'Net lease', 'Percentage lease', 'Ground lease', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(594, 28, NULL, 78, 'A borrower takes out a mortgagee\'s title insurance policy. The premium for the policy will usually paid', 'D', 'Monthly, as part of the mortgage payment', 'Semiannually, with the real estate tax', 'Annually, with the homeowners\'s insurance policy', 'Once, when the policy is issued', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(595, 28, NULL, 79, 'Prorations of expenses in a real estate closing are typically calculated as of the date', 'B', 'The loan is approved', 'The sale contract is signed', 'Title is transferred', 'As of the buyer\'s walkthrough', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(596, 28, NULL, 80, 'During negotiations for the sale of an empty lot, a property seller misrepresents to the buyer that the land is suitable for constructing an office building. The sales contract they sign is', 'A', 'Valid', 'Void', 'Voidable by the buyer', 'Voidable by either party', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(597, 28, NULL, 81, 'The maximum period, including renewal,  that a foreigner may lease land in the Philippines is:', 'A', '50 years', '60 years', '75 years', '90 years', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(598, 28, NULL, 82, 'If a contract of sale is to deed of sale, contract to sell is to:', 'A', 'Deed of conditional sale', 'Deed of sale with mortgage', 'Pacto de retro sale', 'Dacion en pago', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(599, 28, NULL, 83, 'Special power of attorney is necessary in the following cases, except:', 'A', 'To perform acts of administration', ' To lease real property for more than one year', 'To convey real right on immovable property', 'To cancel any obligation gratuitously', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(600, 28, NULL, 84, ' Seizure of a property by court order, usually done to have it available in the event of adverse judgment in a pending suit, is:', 'A', 'Attachment', 'Forfeiture', 'Foreclosure', 'Escheat', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(601, 28, NULL, 85, 'The real estate contract  entered into by an agent who has no authority, is not in writing, or one in which both parties are incapable of giving consent  is --', 'A', ' Void', 'Valid', 'Unenforceable', 'Voidable', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(602, 28, NULL, 86, 'A contract made by a guardian which will result into lesion more than 25% or one undertaken in fraud of creditors -', 'A', 'Rescissible', 'Valid', 'Unenforceable', 'Voidable', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(603, 28, NULL, 87, 'A contract that is valid but which can be voided by an action brought within 4 years.', 'D', 'Rescissible', 'Valid', 'Unenforceable', 'Voidable', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(604, 28, NULL, 88, ' A contract whose purpose is contrary to law, or one which is simulated, or where the object is inexistent or outside the commerce of man.', 'A', 'Void', 'Valid', 'Unenforceable', 'Voidable', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(605, 28, NULL, 89, 'Essential requirements of a contract of sale:', 'A', 'All of them', 'Object or subject matter of consideration', 'Consent or meeting of minds of buyer and seller', 'Property Description', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(606, 28, NULL, 90, ' An adverse claim lapses after how many days from annotation in the certificate of land title?', 'A', '30 days', '100 days', '60 days', '120 days', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(607, 28, NULL, 91, 'It means that short of foreclosure, the mortgagor agrees to sell and transfer the mortgage property to the mortgagee.', 'A', 'dacion en pago', 'pacto de retro', 'redemption', 'auction', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(608, 28, NULL, 92, 'A sale cannot be extinguished by:', 'A', 'transfer of residence of principal or agent', 'revocation by the principal of the agency', 'death, insanity, civil interdiction or principal or agent', 'accomplishment of the purpose', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(609, 28, NULL, 93, 'On a Pacto de Retro contract of sale which there is no stipulation of the period to which the vendor shall have the right to buy back or redeem of the property, the period of redemption shall be:', 'B', '2 years	', '4 years	', '8 years', '12 years', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(610, 28, NULL, 94, ' A contract of sale whereby part of the purchased price is paid upon execution of the contract and the balance to be paid within a stipulated period and the property is mortgaged back to the vendor to secure the payment of the balance:', 'C', 'Deed of sale with assumption of mortgage', 'Deed of sale with warranty of payment of balance', 'Deed of sale with mortgage', ' Contract to sell with mortgage', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(611, 28, NULL, 95, 'If a person died leaving a will, what is that special court proceeding that must be instituted to determine the validity of the testamentary disposition of the deceased?', 'B', ' Reconstitution of land title	', 'Probate proceedings', ' Petition to remove cloud on title', 'petition', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(612, 28, NULL, 96, 'The sheriff can forcibly remove a tenant by a', 'A', 'Judgment of eviction', 'Writ of possession', ' Notice of eviction', 'Notice to pay or quit', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(613, 28, NULL, 97, 'A property manager -', 'D', 'Is the property owner\'s agent', ' Is the tenant\'s agent', ' Is not an agent', ' the administrator ', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(614, 28, NULL, 98, ' Land may be subdivided for purpose of', 'D', ' Sale', 'Lease	', 'Financing', 'All of these', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(615, 28, NULL, 99, 'In general, a mortgagor who mortgaged his real property and later was foreclosed extrajudicial and sold at public auction may redeem the property within the period of', 'B', 'Ninety (90) days from date of auction sale', 'One (1) year from registration of certificate of sale', 'One (1) year from date of auction sale', 'Two years from auction', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(616, 28, NULL, 100, 'Under RA 891, the maximum redemption period after extrajudicial forclosure of a mortgage executed by corporation in favor of a bank is:', 'C', '9 months', '18 months', ' 3 months', '12 months', 1, '2020-09-15 17:57:20', '2020-09-15 17:57:20'),
(617, 29, NULL, 1, 'In case of sale of real property paid under deferred payment basis, the payment of the documentary stamp tax shall accrue upon --', 'C', 'Notarization of transfer document.', 'Execution of Contract to Sell', 'Execution of the Deed of Absolute Sale', 'Payment of the full amount', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(618, 29, NULL, 2, 'A process provided in Act 496 which allows a person to file an action that will record his interest in a property titled to another person is known as --', 'C', 'Claim of adverse possession', 'Lis pendens', 'Adverse claim', 'Right of first refusal', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(619, 29, NULL, 3, 'The proof of ownership of lands awarded to an agrarian reform beneficiary under RA No 6657, as amended, which contains the restriction and conditions for such ownership and must be registered in the Register of Deeds is the __________.', 'A', 'Certificate of Land Ownership Award (CLOA)	', 'Certificate of Land Ownership Accreditation (CLOA)', 'Comprehensive Land Ownership Award (CLOA)', 'Deed of Restrictions on Land Award (DRLA)', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(620, 29, NULL, 4, ' _______________ is synonymous with public use, interest and public benefit. It is the general concept of meeting public need or public exigency.', 'A', 'Common and Public Welfare and Services', 'Public Domain and Welfare', 'Public Resources Allocation', 'Public Benefit Domain', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(621, 29, NULL, 5, ' The proof of ownership of lands awarded to an agrarian reform beneficiary under PD No 27 (Operation Land Transfer) or Executive Order No 228 which contains the restriction and conditions for such ownership and must be registered in the Register of Deeds is _______________', 'A', 'Emancipation Patent (EP)	', 'Certificate of Land Ownership Award (CLOA)', 'Certificate of Land Receipt	', 'Certificate of Land Ownership Accreditation (CLOA)', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(622, 29, NULL, 6, ' ____________ are instrument of ownership issued pursuant to the implementation of the Public Land Act (CA 141), Property Registration Decree (PD 1529), Comprehensive Agrarian Reform Law (RA 6657) and Indigenous Peoples Rights Act (RA 8371)', 'A', 'Land Titles', 'Native Title', ' Certificate of Land Ownership Award (CLOA)', 'Certificate of Land Accreditation (CLA)', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(623, 29, NULL, 7, '____________ refers to pre-conquest rights to lands and domains which, as far back as memory reaches, have been under a claim of private ownership by ICCs/IPs, have never been public lands and are thus indisputably presumed to have been held that way since before the Spanish conquest.', 'A', 'Native Title', 'Land Title', ' Indigenous Land Title', ' Native Land Accreditation', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(624, 29, NULL, 8, 'A sale of real estate that was attached or levied to answer for a liability.', 'D', 'Consolidation of ownership', 'Extra-judicial settlement sales', 'Adjudication', 'Execution sale', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(625, 29, NULL, 9, 'A purchase of real estate at an auction.', 'D', 'Extra-judicial settlement sales', 'Adjudication', 'Execution sale', 'Consolidation of ownership', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10');
INSERT INTO `multi_choices` (`id`, `quiz_id`, `set_number`, `item_number`, `question`, `correct_answer`, `choice_A`, `choice_B`, `choice_C`, `choice_D`, `points`, `created_at`, `updated_at`) VALUES
(626, 29, NULL, 10, ' If an estate is settled among heirs, they must execute an extra-judicial settlement agreement and publish this –', 'D', 'Daily for one week', ' Twice a week for two weeks', 'One a week for two weeks', 'Once a week for three consecutive weeks', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(627, 29, NULL, 11, 'The following is not part of the documents required by the BIR in a property sales transaction --', 'C', 'Certified true copy of the TCT', 'Notarized deed of sale', 'Income tax return of both parties	', 'BIR receipts for payment of capital gains tax if applicable', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(628, 29, NULL, 12, 'The creditable withholding tax imposed by BIR in the sale of a property is --', 'C', '0.015', '0.06', 'a variable amount', '0.12', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(629, 29, NULL, 13, ' Deadline for filing and paying the capital gains tax on the sale of property is --', 'B', '15 days after the sale', '30 days after the sale', '45 days after the sale', '5 days after the end of the month of sale', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(630, 29, NULL, 14, 'The tax clearance certificate for real property taxes is obtained from –', 'C', 'BIR', 'City or municipal assessor	', 'Land tax division', 'City or municipal mayor', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(631, 29, NULL, 15, 'The corporate documents required for presentation during registration of property need not include the –', 'C', 'Secretary’s certificate that the Board authorized the transaction and signatory', 'Copy of the corporate articles of incorporation and bylaws', 'Copy of the corporation’s latest audited financial statement', ' All of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(632, 29, NULL, 16, ' If a property being transferred is “agricultural land”, the following document is required by the Register of Deeds --', 'C', 'Certificate of land ownership award	', 'DAR conversión	', 'DAR clearance', 'Approval of the Department of Agriculture', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(633, 29, NULL, 17, 'After buying a property, the new owner must go to the local government to –', 'B', 'Submit a copy of the new title', ' Submit a new tax declaration', 'Pay for the realty tax', 'None of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(634, 29, NULL, 18, 'The “E-title” is a newly-coined term which refers to the new look of titles from the Register of Deeds which is --', 'A', 'A new form of title document printed from an electronic database ', ' A title document that was converted into a PDF file format', 'An electronic copy of the former title document', 'Any of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(635, 29, NULL, 19, 'With respect to a condominium project, which of these statements is TRUE –', 'B', 'Title of the land is replaced by new titles of the condo units', 'The title of the land is annotated with a master deed', 'The titles of condominium units are always attached to the title of the land', ' None of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(636, 29, NULL, 20, 'If CCT’s are being issued for the first time in a condominium project, the following is not one of the requirements --', 'C', 'Master deed', 'License to sel', 'Certificate of management', 'Certificate of registration with HLURB', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(637, 29, NULL, 21, 'The Torrens system of land registration was established in the Philippines by virtue of –', 'B', ' Spanish mortgage law', ' Act 496 (1903)', 'Presidential Decree 27', 'R.A. 6557', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(638, 29, NULL, 22, 'A more recent law which was enacted to strengthen land registration in the Philippines –', 'C', 'Act 2259 – Cadastral Act', 'Commonwealth Act 141', ' Presidential Decree 1529', ' R.A. 6557', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(639, 29, NULL, 23, 'Which of the following documents does not fall under the Torrens system –', 'D', 'Original certificate of title 	', 'Transfer certificate of title	c. Reconstituted certificate of title', 'License to sell', 'Cooperative certificate of title', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(640, 29, NULL, 24, 'If a title on land is created through an administrative procedure (vs. a judicial procedure), the order to be released is known as a –', 'C', 'Decree of registration', 'Tax declaration', 'Patent ', 'Leasehold', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(641, 29, NULL, 25, ' Under R.A. 6732, administrative resolution of lost or destroyed original copies of titles can be availed of when the certificates lost or destroy are at least.  ', 'A', '10% of all titles in the registry', '40% of all titles in the registry', ' 20% of all titles in the registry', '30% of all titles in the registry', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(642, 29, NULL, 26, ' A TCT has an annotation that says “subject to sec.4 Rule 74 of the Rules of Court.”  It means that the property is subject to claim by any heir unduly deprived of lawful participation in the settlement of the decedents estate within --', 'A', '2 years', '4 years	', '6 years	', '10 years', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(643, 29, NULL, 27, ' Registration of a real estate instrument can be given due course even without the presentation of the owner’s duplicate certificate of title when the document is:  ', 'D', 'Notice of adverse claim', 'Writ of attachment', 'Notice of Lis Pendens', ' All of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(644, 29, NULL, 28, 'Which of the following are not considered money claims or charges against the property --  ', 'D', 'Real estate tax liens', ' Judgment Liens	', 'Mechanic’s Liens	', 'Deed of restrictions', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(645, 29, NULL, 29, 'When a claim contesting ownership of property is brought to court litigation, the following may be annotated in the back of the certificate of title –', 'B', 'Real estate lien', 'Lis pendens', '. Deed of restrictions', ' All of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(646, 29, NULL, 30, 'The Land Registration Authority (LRA), a government agency in charge of the Torrens System of titling, is under the –', 'D', ' Office of the president', ' Department of Interior & Local Government (DILG)', ' Department of Finance (DOF)', 'Department of Justice (DOJ)', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(647, 29, NULL, 31, 'A person authorized to perform certain acts for another person, under power of attorney.', 'A', 'attorney in fact', 'representative', 'agent', 'administrator', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(648, 29, NULL, 32, ' RA 6732 – Administrative Reconstitution, but no less than _________ titles', 'A', '500 titles', '300 titles', '250titles', '1,000 titles', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(649, 29, NULL, 33, 'Which government agency is in charge of supplying the titles to the Register of Deeds?', 'C', ' LRA', ' SEC', ' Bureau of Printing', 'Department of Trade and Industry', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(650, 29, NULL, 34, 'A history of the ownership of a property, showing transfers in ownership and factors affecting ownership, such as mortgages.', 'B', ' title transfers', 'abstract of title', ' muniments of title', 'history of title', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(651, 29, NULL, 35, 'An instrument by which the government conveys public land to an individual.', 'B', 'deed of conveyance', 'patent', 'award', 'decree', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(652, 29, NULL, 36, 'The document issued by the BIR which is required for titling –', 'C', 'Tax clearance certificate', ' Certificate of registration', 'Certificate authorizing registration', 'All of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(653, 29, NULL, 37, 'The term “patrimonial property” applies to –', 'A', ' Land owned by the government which is not intended for public use', 'Land for public use like roads, canals, rivers, ports and bridges', ' Land owned by the State and classified as agricultural 	', ' Ancestral lands owned by original settlers', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(654, 29, NULL, 38, 'An form of land ownership document issued as the initial part of agrarian reform proceedings –', 'C', 'Homestead patent', ' Free patent', 'Certificate of land ownership', 'Original certificate of title', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(655, 29, NULL, 39, 'A formal declaration made before an authorized official by a person executing a document, that he signs the document by a free act and deed. The official is usually a notary public who witnesses the signature and verifies the identity of the person.', 'C', 'affidavit', 'document', 'acknowledgment', 'notarial oath', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(656, 29, NULL, 40, ' A written declaration, sworn before an officer who has authority to administer oaths.', 'B', 'acknowledgment', 'affidavit', ' notarial oath', 'document', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(657, 29, NULL, 41, 'Among these documents, the strongest evidence of ownership is the –', 'B', 'Certificate of Land Ownership Award', 'Torrens Certificate of Title', ' Approved Plan of the Lot	', 'Tax Declaration', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(658, 29, NULL, 42, 'The Register of Deeds is an agency which keeps the original copies of the –', 'B', 'Certificate of Land Ownership Award', 'Torrens Certificate of Title', 'Approved Plan of the Lot', 'Tax Declaration', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(659, 29, NULL, 43, 'Other transactions related to or involving property, such as a mortgage, must be –', 'D', 'Submitted to the Register of Deeds	', 'Submitted to the BIR', 'Submitted to the Tax Assessor', 'All of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(660, 29, NULL, 44, 'The document that conveys ownership and all appurtenant interests in a property is called the –', 'C', 'Certificate of ownership', 'Contract to Sell', 'Deed of  Conveyance', 'Certificate of authority to register', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(661, 29, NULL, 45, 'If one of the parties in a real estate transaction is a corporation, the following  is required –', 'A', 'Secretary’s certificate of board resolution authorizing transaction and signatory', 'Signature of the corporation’s president', 'Signature of the majority of the board of directors', 'All of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(662, 29, NULL, 46, 'A deed of sale does not have to contain the following –', 'D', ' Identity of both  Seller and Buyer;', 'Technical description of the property subject of the sale', 'Signature of the Seller’s spouse', 'Signature of the Buyer', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(663, 29, NULL, 47, 'Which of these requirements must be accomplished ahead of the rest –', 'C', 'Payment of transfer taxes	', 'Submission of documents of sale to Register of Deeds', 'Application for the BIR certificate of authority to register', 'Application for the tax declaration', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(665, 29, NULL, 49, 'This tax is not imposed by the BIR in the transfer of property –', 'C', 'Capital gains tax	', 'Value added tax	', 'Transfer tax', 'Documentary stamps tax', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(666, 29, NULL, 50, ' A special requirement required for documents that are notarized outside the country --', 'D', 'Copy of the passport of the person signing the document', 'Authentication certificate of the foreign notary', 'Accreditation of the foreign notary with the Philippine consulate abroad', 'All of the above', 1, '2020-09-15 18:34:10', '2020-09-15 18:34:10'),
(667, 29, NULL, 48, 'The following is not necessary in transferring title to property –', 'C', 'Updating the payment for realty taxes', 'Obtaining the Owner’s duplicate copy of the title', 'Verifying the exact location of property monuments', 'Verifying the title with the Register of Deeds', 1, NULL, NULL),
(668, 30, NULL, 1, 'A broker\'s annual earnings is P1.5 Million.  All his commissions will automatically be subject to –', 'D', 'VAT of 12%', 'Percentage tax of 5%', 'Creditable withholding tax of 10%', 'Creditable withholding tax of 15%', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(669, 30, NULL, 2, ' If a broker himself forms a company to buy and re-sell properties, he becomes a –', 'D', 'Real estate developer', 'Marketing broker', 'Lead broker', ' Real estate dealer', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(670, 30, NULL, 3, 'Real estate brokers who register with HLURB are required to post a performance bond in the amnount of  –', 'D', ' P20,000', 'P15,000', 'P10,000', 'P5,000', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(671, 30, NULL, 4, 'Besides registering with the BIR, the licensed broker should also secure –', 'D', 'tax clearance from the BIR	', 'a business license with the LGU', 'membership certificate from any existing real estate association', 'privIlege tax receipt from the LGU', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(672, 30, NULL, 5, 'The cheapest way to advertise property –', 'D', 'Newspaper', 'Television', 'Radio', 'Internet', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(673, 30, NULL, 6, ' Which of the following websites specializes in providing highly informative and useful real estate articles –', 'D', 'Property 24', 'OLX', 'Lamudi', 'Foreclosure Philippines', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(674, 30, NULL, 7, 'The estimated internet penetration in the Philippines for 2015 has reached –', 'D', '0.2', '0.25', '0.3', '0.4', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(675, 30, NULL, 8, 'The first national organization of real estate brokers in the Philippines –', 'D', 'National Association of Realtors', 'Real Estate Brokers Association of the Philippines', 'National Real Estate Association', 'Philippine Association of Real Estate Boards', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(676, 30, NULL, 9, 'A commission rate for the sale of real estate is determined by:', 'D', 'Fixed scheduled of commission  approved by the BTRCP	', 'Standard rate approved by the brokers in a locality', 'Discretion of the  seller', 'Agreement between seller and broker', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(677, 30, NULL, 10, ' As an agent, the broker is usually authorized to do all of the following acts except:  ', 'D', ' Cooperate with other brokers to facilitate the sale', 'Place “for sale” sign on the listed property', 'Advertise the listed property', ' Bind the principal in a contract of sale', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(678, 30, NULL, 11, 'An agreement where the consideration of a contract is deposited with a third party who is authorized to release said consideration to the seller after the latter has complied with certain condition is:  ', 'A', ' Escrow', 'Option', 'Contract to sell', 'Hold-over clause', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(679, 30, NULL, 12, 'For the “Hold-over” clause to entitle the broker to commission even if he closed the sale after the lapse of his authority, the broker must:', 'C', ' Register and negotiate with his prospect during his authority', 'Submit written acknowledgement of his buyer', 'Register his prospect during his authority', 'None of the above', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(680, 30, NULL, 13, ' A stipulation in an authority to sell entitles the broker to a commission even beyond the period of his authority if he has registered his buyer to his principal before the expiry date of his authority.', 'B', 'Open, non-exclusive listing', 'Hold over clause	', 'Exclusive agency agreement', '“First come, First serve” rule', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(681, 30, NULL, 14, 'A brokers’ complaints for non-payments of commission by the developer shall be filled with:  ', 'D', ' Regular Court', 'BTRCP', 'HUDCC', ' HLURB', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(682, 30, NULL, 15, ' The scope of brokerage are as follows, but not:', 'A', 'Procurement of insurance for properties secured by real estate', 'Engaged to look for a buyer', ' Authority to look for property', 'Procurement of tenants for rental properties', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(683, 30, NULL, 16, 'As a Professional Real Estate Broker (PREB) selling condominium projects, one must be knowledgeable and familiar with --', 'A', 'The Project, Pricing, Financing and Documentation', 'Documentation, Liaison work with the registry of Deeds and Assessors', 'Finance, Master Deed documents, Pricing and Pag-ibig Rules', 'The Economy, Pag-ibig Rules, R.A. 9646 and the Project for Sale', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(684, 30, NULL, 17, 'As a REB engaged in selling properties situated within Camp John Hay Baguio, what possible adverse effect and legal impediment could arise?', 'A', 'Controversy between BCDA and CJHDC', 'CJH was considered tribal land', 'CJH is included under the Public-Private-Partnership Program', 'CJH was not granted special economic zone incentives', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(685, 30, NULL, 18, 'With the help of the Philippines Chamber of Commerce and Industry, you have been requested by several foreign IT locations for a site in Morong, Bataan. What are the essential facilities necessary in order to meet the requirement of your IT foreign locators?', 'A', 'Energy & power facilities, tele-communication services, bandwidth capability, PEZA zone;', 'PEZA zone, accessibility, port facilities, ample water and light', '24-hour power generation, access to airport, hotels and housing, PEZA approval', 'PEZA approval, recreational facilities, technological park facilities', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(686, 30, NULL, 19, 'A commercial bank announced that they are looking for a 20-30 new branches nationwide. As a real estate broker specializing in retails rentals, what is the  best step to take in order to secure Listings of suitable commercial sites?', 'D', 'Set-up a “wanted a lease” bank branch site at your web and other IT  _____', 'Surf the net for listings and ask your co-brokers for possible bank sites', 'Go “door-to-door” and ask the property owner for listings', 'Publish a boxed ad stating the need for bank site', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(687, 30, NULL, 20, 'In sale that involves sellers who are staying abroad, a representative will be given an:', 'D', 'Special Power of Attorney duly notarized and approved by consul of the embassy', 'Memorandum of Agreement', 'Contract to Sell', ' Deed of Sale', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(688, 30, NULL, 21, ' Aside from the Deed of Sale in a transaction what document shall be surrendered by the seller to the buyer upon full payment?', 'D', 'Owner\'s Duplicate', 'Memorandum of Agreement', 'Contract to Sell', 'Authority to Sell', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(689, 30, NULL, 22, 'Real Estate investment requires access to large capital sources. Which of these would you consider the best instrument or means you will advice your client for his/her capital requirement?', 'D', ' Seek help from an Investment Banker', 'Mutual Funds or REIT', 'Money Market or the Binondo Central Bank', 'Power Shop Mortgage- a rich relative', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(690, 30, NULL, 23, 'The Housing sector in the cooperation with the government is working together to help curb red tape in the process of developing and selling subdivisions. The ARTA Technical Working Group shall be organized by what government department?', 'D', 'DILG and HUDCC', 'DENR and HUDCC', 'HULRB with DILG', 'DAR, DILG, and DENR', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(691, 30, NULL, 24, ' One of the following transactions does not require  a real estate broker\'s license -', 'D', 'Sale or purchase of all kinds of real estate', ' Barter or exchange of real property', 'Lease and rentals', 'Preparation of a project feasibility study', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(692, 30, NULL, 25, 'When a principal or client places complete confidence in another, such as with a broker, there exists –', 'D', 'An authority to sell', 'A special power of attorney', 'A trusteeship', 'A fiduciary relationship', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(693, 30, NULL, 26, 'A licensed broker who is given an authority to search or find a specified type of property –', 'D', 'Seller\'s broker', 'Seller\'s representative', ' Buyer\'s agent', 'Buyer\'s broker', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(694, 30, NULL, 27, 'As to the type of properties which may be transacted by a broker, which type does not require him to prepare substantial documents and collaterals –', 'D', 'Farmland', 'Houses at Forbes Park', 'Second sale of high-end condominiums', 'Pre-selling condos of developers', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(695, 30, NULL, 28, 'A real estate broker who works for a real estate developer will be compensated by way of –', 'D', ' A fixed salary', ' Pure Commissions', ' Allowance and commission', 'Any of the above', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(696, 30, NULL, 29, 'A real estate broker who plans to engage the full-time services of salespersons –', 'D', ' may hire anyone provided he is a high school graduate', 'may hire anyone provided he is a college graduate', 'shall give that person a power of attorney to act as a broker', 'shall require that person to be accredited with the PRC', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(697, 30, NULL, 30, ' A salesperson who will sell projects that  have a license to sell  –', 'D', ' may engage in such sales provided he is employed by the developer', 'may engage in such sales provided he is employed by a real estate broker', 'may engage in such sales provided he is already accredited with PRC', 'may engage in such sales only if he is registered with the HLURB', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(698, 30, NULL, 31, ' The HLURB resolution governing the use of flyers, announcements and advertisements –', 'D', 'Resolution MC 01-2012', 'Resolution MC 01-2013', 'Resolution MC 01-2014', 'Resolution MC 01-2015', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(699, 30, NULL, 32, 'The HLURB resolution governing advertisements specifically requires the following –', 'D', ' Advertisements shall first be approved by the Advertising Media Council', ' Advertisements shall be limited only to projects that have been completed', 'All advertising shall contain the details of financing for buyers', ' All advertisements must indicate the license to sell', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(700, 30, NULL, 33, 'The HLURB resolution governing the issuance of announcements prohibits –', 'D', 'Using artist rendering instead of real photographs', 'Distribution of announcement flyers to potential buyers', 'Publishing announcement flyers without a license to sell', 'Providing a space where brokers and agents may affix their contact details', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(701, 30, NULL, 34, 'In the U.S., a new type of broker has evolved in which that individual no longer has a fiduciary or agency relationship with his client –', 'D', ' Buyer\'s broke', 'Seller\'s broker', ' Exclusive broker	', 'Transaction broker', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(702, 30, NULL, 35, 'When a broker specializes in project selling, he must be fully acquainted with the following documents, except –', 'D', 'Reservation form', 'Contract to sell	', 'Financing scheme', 'Joint venture agreement', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(703, 30, NULL, 36, ' A developer can launch a project and engage in pre-selling, provided –', 'D', 'He has finalized a joint venture agreement', 'He has already started construction', 'He has already registered the project with HLURB', 'He has secured his license to sell', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(704, 30, NULL, 37, 'A real estate broker is required by the BIR to –', 'D', 'Submit the name and contact details of his employer', 'Open an office and display the BIR registration', 'File an income tax return only once a year in April', 'Submit and register his appointment book', 1, '2020-09-15 18:56:38', '2020-09-15 18:56:38'),
(705, 31, NULL, 1, 'A published ranking, based on detailed financial analysis by a credit bureau, of one\'s financial history, specifically as it relates to one\'s ability to meet debt obligations. The highest is usually AAA, and the lowest is D. Lenders use this information to decide whether to approve a loan.', 'B', 'Credit ranking', 'Credit rating', 'Credit investigation	', 'Credit standing', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(706, 31, NULL, 2, 'A non-cash expense that reduces the valueof an asset as a result of wear and tear, age or obsolescence –', 'C', 'Depletion', 'Credit', 'Depreciation', 'Maintenance and repair', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(707, 31, NULL, 3, 'The volume of sales at which a company\'s net sales just equals its costs.', 'B', 'Target sales volume', ' Break-even sales volume', 'Minimum sales volume', 'Profitable sales volume.', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(708, 31, NULL, 4, 'Mortgage insurance provided by non-government insurers that  protects a lender against loss if the borrower defaults.', 'B', 'Mortgage protection', 'Private mortgage insurance', 'Default safety net', 'Property insurance', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(709, 31, NULL, 5, 'The element of the economy tracked by a measurement system which yields values such as M1, M2, M3, etc. that is of primary concern to the government’s economic planners.', 'A', 'Money supply', 'Monetary policy', 'Management efficiency', 'Measures of inflation', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(710, 31, NULL, 6, 'The theory that, in the long run, identical products and services in different countries should cost the same in different countries. This is based on the belief that exchange rates will adjust to eliminate the arbitrage opportunity of buying a product or service in one country and selling it in another.', 'B', 'Equity of trade', 'Purchasing power parity', 'Buyer beware', 'Law of demand', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(711, 31, NULL, 7, 'The aggregate value of a company’s  stock which is obtained by multiplying the number of shares outstanding by their current price per share.', 'C', 'Equity', 'Net worth', 'Market capitalization', 'Invested capital', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(712, 31, NULL, 8, 'A figure that calculates how much of a person\'s income is spent paying his or her debts.', 'A', 'Debt to income ratio', ' Creditworthiness', 'Take-home pay', 'Loan capacity', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(713, 31, NULL, 9, 'Any intangible asset that consists of human knowledge and ideas. Some examples are patents, copyrights, trademarks and software.', 'C', 'Real property', 'Movable property', 'Intellectual property', 'Chattel', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(714, 31, NULL, 10, 'An organization that acts as a meeting ground for 30 countries that believe strongly in the free market system.', 'A', 'Asia-Pacific Economic  Council', ' ASEAN', 'United Nations', 'Organization for Economic  Cooperation and Development', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(715, 31, NULL, 11, 'A measure of how much the demand for a good or service increases or decreases in response to changes in price.', 'A', 'Elasticity of demand', 'Law of demand', 'Supply-Demand equation', 'Price point', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(716, 31, NULL, 12, 'A mortgage with an interest rate that may change, usually in response to changes in the prime lending rate.', 'A', 'Adjustable rate mortgage', 'Flexible rate mortgage', 'Open mortgage', 'Renewable rate  mortgage', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(717, 31, NULL, 13, 'A measure of a company\'s financial leverage.  Investing in a company with a higher value may be riskier.', 'D', 'Book value', 'Leverage level', 'Debt burden', 'Debt-to-Equity ratio', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(718, 31, NULL, 14, 'A transfer of debt from one credit card to another.', 'A', 'Balance transfer', 'Liquidation', ' Competitive advantage', 'Re-financing', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(719, 31, NULL, 15, 'An organization that acts as a meeting ground for 30 countries that believe strongly in the free market system,', 'C', 'APEC', 'ASEAN', 'OECD', 'NAFTA', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(720, 31, NULL, 16, 'The actual value of a security, as opposed to its market price or book value.', 'B', 'Market value', 'Intrinsic value', 'Book value', 'Par value', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(721, 31, NULL, 17, 'A legal document that enables an individual to designate another person, called the attorney-in-fact, to act on his/her behalf, even in the event the individual becomes disabled or incapacitated.', 'B', 'General power of attorney', 'Durable Power of Attorney', 'Last will and testament', 'Authorization', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(722, 31, NULL, 18, 'A market in which an investor purchases a security from another investor rather than the issuer, subsequent to the original issuance in the primary market. also called aftermarket.', 'C', 'Stock exchange', 'Securities', 'Secondary market', 'Option', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(723, 31, NULL, 19, 'The regulation of the money supply and interest rates by a central bank, such as the Bangko Sentral in order to control inflation and stabilize currency.', 'C', 'Fiscal policy', 'Banking act', 'Monetary policy', 'Open market', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(724, 31, NULL, 20, 'A widely accepted set of rules, conventions, standards, and procedures for reporting financial information, as established by the Financial Accounting Standards Board.', 'B', 'IFRS', 'GAAP', 'USPAP', 'IVSC', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(725, 31, NULL, 21, ' An individual, corporation or association holding assets for another party, often with the legal authority and duty to make decisions regarding financial matters on behalf of the other party.', 'B', 'Attorney in fact', 'Fiduciary', 'Trustee', 'Guardian', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(726, 31, NULL, 22, 'A lender\'s postponement of foreclosure in order to give the borrower time an opportunity to make up for overdue payments.', 'C', 'Grace period', 'Suspension', 'Forbearance', 'Re-financing', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(727, 31, NULL, 23, 'A collective of countries founded in 1960 that choose to collaborate in order to manage the exportation of their crude oil to the rest of the world. Because of their ability to adjust production levels, they possess a great deal of influence on the price of oil.', 'C', 'OECD', 'U.N', 'OPEC', 'E.U.', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(728, 31, NULL, 24, 'A prolonged period in which investment prices rise faster than their historical average.', 'D', 'Bear market', 'Buyer’s market', 'Seller’s market', 'Bull market', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(729, 31, NULL, 25, 'Documents, real estate, money, or securities deposited with a neutral third party to be delivered upon fulfillment of certain conditions, as established in a written agreement.', 'A', 'Escrow', 'Warranty', 'Safety deposit', 'Mortgage', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(730, 31, NULL, 26, 'An economic theory which advocates government intervention, or demand-side management of the economy, to achieve full employment and stable prices.', 'B', 'Mercantile economics', 'Keynesian economics', 'Laizze Faire', ' Socialism', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(731, 31, NULL, 27, ' Insurance to protect a lender or owner against loss in the event of a property ownership dispute; It is most frequently used for mortgages, and is required by a large number of lenders.', 'C', 'Fire insurance', 'Mortgage redemption insurance', 'Title insurance', 'Title guarantee', 1, '2020-09-15 19:12:42', '2020-09-15 19:12:42'),
(732, 32, NULL, 1, 'A measure of a company\'s financial leverage.  Investing in a company with a higher value may be riskier.', 'D', 'Book value', 'Leverage level', 'Debt burden', 'Debt-to-Equity ratio', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(733, 32, NULL, 2, 'A transfer of debt from one credit card to another.', 'A', 'Balance transfer	', ' Liquidation', 'Competitive advantage', 'Re-financing', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(734, 32, NULL, 3, 'The aggregate value of a company’s  stock which is obtained by multiplying the number of shares outstanding by their current price per share.', 'C', 'Equity', ' Net worth', 'Market capitalization', 'Invested capital', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(735, 32, NULL, 4, 'A figure that calculates how much of a person\'s income is spent paying his or her debts.', 'A', 'Debt to income ratio', 'Creditworthiness	', ' Take-home pay', 'Loan capacity', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(736, 32, NULL, 5, 'Insurance to protect a lender or owner against loss in the event of a property ownership dispute; It is most frequently used for mortgages, and is required by a large number of lenders.', 'C', 'Fire insurance', 'Mortgage redemption insurance', 'Title insurance', 'Title guarantee', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(737, 32, NULL, 6, 'A widely accepted set of rules, conventions, standards, and procedures for reporting financial information, as established by the Financial Accounting Standards Board.', 'B', 'IFRS', 'GAAP', 'USPAP	', ' IVSC', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(738, 32, NULL, 7, 'An individual, corporation or association holding assets for another party, often with the legal authority and duty to make decisions regarding financial matters on behalf of the other party.', 'A', 'Attorney in fact	', 'Fiduciary', 'Trustee', 'Guardian', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(739, 32, NULL, 8, 'A lender\'s postponement of foreclosure in order to give the borrower time an opportunity to make up for overdue payments.', 'A', 'Grace period', 'Suspension', 'Forbearance', 'Re-financing', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(740, 32, NULL, 9, 'Documents, real estate, money, or securities deposited with a neutral third party to be delivered upon fulfillment of certain conditions, as established in a written agreement.', 'B', ' Escrow', ' Warranty', 'Safety deposit', 'Mortgage', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(741, 32, NULL, 10, 'The common practice of developers known as “pre-selling “ allows the following, except –', 'A', 'Up to 20 years to pay by in-house financing	', ' Interest-free payment of equity over 2-3 years', 'Small reservation fee', 'Bank financing', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(742, 32, NULL, 11, 'Amortization is the –', 'A', 'Recurring amounts needed in the future equivalent to a present sum', 'Simplified procedure for calculating a future value of a present investment', 'Building up a nest egg for the future', 'Paying off a loan in one lump-sum', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(743, 32, NULL, 12, 'The method of determining the future value of a present sum given an interest rate and the number of periods –', 'B', 'Discounting', ' Compounding', ' Present value', 'Amortization', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(744, 32, NULL, 13, ' If “R” is the annual interest rate and  “n” is the number of years, the  Future Value of the “Principal” compounded monthly  is –', 'C', 'Future Value  = Principal x R x n', 'Future Value =  Principal x (1+R)^n', 'Future Value = Principal x (1+R/12)^12n', 'None of the above is correct', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(745, 32, NULL, 14, 'If the future value is given, the method to compute its present value, given an interest rate and the number of periods, is known as –', 'A', 'Discounting', 'Compounding', ' Sinking fund', 'Amortization', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(746, 32, NULL, 15, 'What will be the value of your time deposit of P1,000,000 after 5 years if it earns 5% compound interest?  ', 'A', 'P 1,276,280', 'P1,250,000', 'P 1,200,300', 'P1,050,000', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(747, 32, NULL, 16, 'Your employer deducts P10,000 from your wages yearly, matches it 50% and invests it in a fund earning 5%. How much will you receive if you retire after 10 years?  (Annuity)', 'B', 'P150,000', 'P188,668', 'P 100,000', 'P220,400', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(748, 32, NULL, 17, 'A mortgage which allows the borrower to increase payments in advance without incurring pre-payment penalties –', 'A', 'Open mortgage', 'Equitable mortgage', 'Closed mortgage', ' Adjustable rate mortgage', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(749, 32, NULL, 18, 'A mortgage which, even if not fully documented, deemed valid because some actions between the parties prove the intent of their agreement to allow property to be used as security.', 'B', 'Open mortgage	', 'Equitable mortgage', 'Closed mortgage	', 'Adjustable rate mortgage', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(750, 32, NULL, 19, 'When the loan is fully amortized by equal monthly payments, the amount applied to principal:  ', 'C', 'is Fixed', 'Decreases while interest payment increases', 'Increases while interest payment decreases', 'Increase by a constant amount', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(751, 32, NULL, 20, 'The rate of return earned by an investor which does not include allowance for capital recovery is:', 'D', 'Recapture rate', 'Discount rate', ' Cash flow', 'Interest rate ', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(752, 32, NULL, 21, 'The ratio obtained by dividing the sales price by the contract rental rate, is:', 'B', 'Effective gross income', ' Gross income multiplier', 'Recapture', 'Capitalization', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(753, 32, NULL, 22, 'The process of making installment payments consisting of principal and interest  that reduces the loan-balance is:  ', 'C', 'Acceleration', 'Hypothecation', 'Amortization', 'Liquidation', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(754, 32, NULL, 23, 'The use of borrowed fund to increase purchasing power to increase the profitability of an investment is --  ', 'C', ' Limited liability', 'Debt Coverage', 'Leverage', 'Interim Financing', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(755, 32, NULL, 24, 'The latest law, enacted in 2009,  that reverted the nature of PAG-IBIG Membership to be mandatory to all SSS & GSIS members.', 'A', 'Republic Act 9679', 'PD 1530', 'PD 4752', 'Executive Order No. 90', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(756, 32, NULL, 25, 'A published ranking, based on detailed financial analysis by a credit bureau, of one\'s financial history, specifically as it relates to one\'s ability to meet debt obligations. The highest is usually AAA, and the lowest is D. Lenders use this information to decide whether to approve a loan.', 'B', 'Credit ranking', 'Credit rating', ' Credit investigation', ' Credit standing', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(757, 32, NULL, 26, ' A non-cash expense that reduces the valueof an asset as a result of wear and tear, age or obsolescence –', 'C', ' Depletion', 'Credit', 'Depreciation', ' Maintenance and repair', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(758, 32, NULL, 27, 'The volume of sales at which a company\'s net sales just equals its costs.', 'B', 'Target sales volume', 'Break-even sales volume', 'Minimum sales volume', 'Profitable sales volume.', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(759, 32, NULL, 28, ' Mortgage insurance provided by non-government insurers that protects a lender against loss if the borrower defaults.', 'B', 'Mortgage protection', 'Private mortgage insurance', ' Default safety net', 'Property insurance', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(760, 32, NULL, 29, ' A figure that calculates how much of a person\'s income is spent paying his or her debts.', 'A', 'Debt to income ratio', 'Creditworthiness	', 'Take-home pay	', 'Loan capacity', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(761, 32, NULL, 30, ' A mortgage with an interest rate that may change, usually in response to changes in the prime lending rate.', 'A', 'Adjustable rate mortgage', 'Flexible rate mortgage', ' Open mortgage', ' Renewable rate  mortgage', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(762, 32, NULL, 31, 'Current private bank lending rates (low and high) for home loans, one-year re-pricing –', 'B', ' 2-4 percent', ' 4-6 percent', '6-8 percen', '8-10 percent', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(763, 32, NULL, 32, 'The common practice of developers known as “pre-selling “ allows the following, except –', 'C', 'Small reservation fee', 'Interest-free payment of equity over 2-3 years', 'Up to 20 years to pay by in-house financing', ' Bank financing', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(764, 32, NULL, 33, 'Home ownership can includes carrying the following costs every year, except –', 'B', 'Realty taxes', 'Capital gains taxes', ' Fire insurance', 'Payment of association dues', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(765, 32, NULL, 34, 'Source of funding for developers of real estate projects obtained directly from an investing public –', 'C', 'Bank financing', ' Equity	', 'Stock market', ' Joint ventures', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(766, 32, NULL, 35, 'Partnership between developers and other parties who agree to be paid for their investment in the form of completed real estate products –', 'B', 'Syndication', '  Joint venture', 'Money market', 'Traditional financing', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(767, 32, NULL, 36, 'The following company is a real estate development company that is not listed in the Philippine stock exchange –', 'D', ' 8990 Holdings', 'Rockwell Land', 'Filinvest Land', ' Landco', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(768, 32, NULL, 37, 'If you have a mortgage and you default, your collateral will be –', 'C', 'Confiscated by the lending institution', 'Sold in auction by the lending institution with finality within 60 days', 'Subjected to a process known as foreclosure', 'Purchased by the creditor', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(769, 32, NULL, 38, 'The fraction of a property’s total market value which can be borrowed, subject to policies of the lender –', 'B', 'Collateral', ' Loan-to-Value ratio', ' Mortgaged property', ' Equity', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(770, 32, NULL, 39, 'A mortgage is a –', 'A', ' Pledge of security for a loan', ' Form of investment in property', ' Agreement that property used as collateral may be expropriated on default', 'None of the above', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(771, 32, NULL, 40, 'The lending institution will usually approve a borrower a loan amounting to –', 'B', 'His take-home pay for one year', ' Only about 50 to 80 percent of the market value of the collateral', 'The zonal value of the collateral', 'Only to those recommended by the developer', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(772, 32, NULL, 41, ' Home ownership can includes carrying the following costs every year, except –', 'A', 'Capital gains taxes ', ' Realty taxes', ' Fire insurance', 'Payment of association dues', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(773, 32, NULL, 42, 'Source of funding for developers of real estate projects obtained directly from an investing public –', 'A', 'Stock market', 'Equity', ' Bank financing', ' Joint ventures', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(774, 32, NULL, 43, 'Partnership between developers and other parties who agree to be paid for their investment in the form of completed real estate products –', 'B', 'Joint venture', 'Syndication', 'Money market', 'Traditional financing', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(775, 32, NULL, 44, 'Liquidation or gradual retirement of a financial obligation by periodic installments that includes interest.', 'C', 'annuity payment	', 'mortgage installment', 'amortization', 'mortgage retirement', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(776, 32, NULL, 45, ' Last  payment on a note. It is usually substantially larger than any of the preceding installments.', 'A', 'balloon payment', 'acceleration payment', ' note retirement', ' final payment', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(777, 32, NULL, 46, 'A sale in form but mortgage in substance', 'A', 'Pacto de Retro', 'PactumCommissorium', 'Pacto de Non Aliendo', 'Dacion en Pago', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(778, 32, NULL, 47, 'The maximum period for right of redemption for corporations, under the General Banking Act,  is', 'B', '1 year if habitually engaged', ' 3 months', '1 month', ' 1 year', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(779, 32, NULL, 48, 'A type of housing project provided to average income families?', 'A', 'Economic housing', ' Socialized housing', 'Community Mortgage Program', ' Slum upgrading', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(780, 32, NULL, 49, 'The developer of socialized housing shall qualify for the incentives cited in Sec 20 of RA 7279 only after being authorized by _______________?', 'A', 'BIR', 'Department of Trade and Industry', ' Local Government Unit', 'National Housing Authority', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(781, 32, NULL, 50, 'A table showing the periodic payment amount, interest and principal requirements and unpaid loan balance for each period for the life of the loan is referred to as _______', 'A', 'Amortization Schedule', 'Table of factors', ' Client\'s Ledger', 'Statement of Account', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(782, 32, NULL, 51, 'A buyer bought a one bedroom condominium unit for P3,200,000.00, and paid 30% down payment. The balance payable at the end of each year in equal annual installment for three years with interest at 18% per annum is --', 'B', '881066', '1028328', '2643200', '1493333', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(783, 32, NULL, 52, 'Mr. Santos purchased a vacant lot for P1,000,000.00. He paid a 20% downpayment,  balance payable in equal annual installment for 5 years at zero interest. Immediately after paying the first annual amortization Mr. Santos wrote the developer and demand for refund for his payments for none compliance and no development of the subdivision. How much 	 will be the refund of Mr. Santos if the prevailing bank interest rate is 12% per annum.', 'A', 'P384,000.00', 'P200,000.00', 'P360,000.00', 'P403,200.00', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(784, 32, NULL, 53, ' Rafael bought a property at P1,500,000.00 and gave a downpayment of P150,000.00 paid P250,000.00  at the end of the first year and another P250,000.00 at the end of the second year and P300,000 at the end of the third year, and a final pc the end of 4 years. Compute her final payment if interest is 18% per annum.', 'C', '1504491.98', '1334740', '1274993.2', '1733990.76', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(785, 32, NULL, 54, 'Measures the length of time to recover, the original investments from the expec', 'A', 'Payback period	', 'Return on investment', ' Recapture period', 'Return of Investment', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14'),
(786, 32, NULL, 55, 'Which study examines the profitability of a proposed property?', 'A', 'Feasibility study	', 'Marketability study', 'Market study', 'Trade area analysis', 1, '2020-09-15 21:32:14', '2020-09-15 21:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `item_number` int(11) NOT NULL,
  `questions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `correct_answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `quiz_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_rate` int(11) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `instructor_id`, `title`, `category`, `price`, `status`, `quiz_image`, `thumb_image`, `passing_rate`, `time_limit`, `created_at`, `updated_at`) VALUES
(5, 2, 'Real Estate Broker ( Fundamentals )', '26', 150, 1, NULL, NULL, 80, 0, '2020-09-13 23:32:03', '2020-09-14 01:02:01'),
(14, 2, 'Real Estate Broker ( Code of Ethics )', '26', 100, 1, NULL, NULL, 80, 0, '2020-09-14 18:23:02', '2020-09-15 19:00:03'),
(15, 2, 'Real Estate Broker ( Legal Req for RES )', '26', 100, 1, NULL, NULL, 80, 0, '2020-09-14 22:08:15', '2020-09-14 22:08:15'),
(16, 2, 'Real Estate Broker ( Real Estate Laws and Taxation )', '26', 100, 1, NULL, NULL, 80, 0, '2020-09-14 22:31:12', '2020-09-14 22:31:12'),
(17, 2, 'Real Estate Broker ( Subdivision Revt )', '26', 150, 1, NULL, NULL, 80, 0, '2020-09-14 23:16:41', '2020-09-14 23:16:41'),
(27, 2, 'Real Estate Broker ( Condominium and other Realty ) ', '26', 100, 1, NULL, NULL, 80, 0, '2020-09-15 01:13:08', '2020-09-15 01:13:08'),
(28, 2, 'Real Estate Broker ( Legal Aspects )', '26', 150, 1, NULL, NULL, 80, 0, '2020-09-15 16:58:47', '2020-09-15 16:58:47'),
(29, 2, 'Real Estate Broker ( Documentation and Registration )', '26', 100, 1, NULL, NULL, 80, 0, '2020-09-15 18:04:12', '2020-09-15 18:04:12'),
(30, 2, 'Real Estates Broker ( Brokerage Practice )', '26', 100, 1, NULL, NULL, 80, 0, '2020-09-15 18:42:02', '2020-09-15 18:42:02'),
(31, 2, 'Real Estate Broker ( Finance ) Part 1', '26', 100, 1, NULL, NULL, 80, 0, '2020-09-15 18:59:34', '2020-09-15 19:15:02'),
(32, 2, 'Real Estate Broker ( Finance ) Part 2', '26', 100, 1, NULL, NULL, 80, 0, '2020-09-15 19:13:58', '2020-09-15 19:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_takens`
--

CREATE TABLE `quiz_takens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `amount_paid` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Osman', 'Kanu', 'student@ulearn.com', '$2y$10$fHkZVSbE0TGz.R4S1OPRQuLlV9OAAKjhXAsrC1tZiw3w8qLmFQBQC', 1, NULL, '2020-06-30 23:58:20', '2020-06-30 23:58:20'),
(2, 'Admin', 'A', 'admin@ulearn.com', '$2y$10$c2c78A7dPR/gzAzORMT6TexIBuQfHva40kww6n/XTifImPnhlcvqG', 1, NULL, '2020-06-30 23:58:20', '2020-06-30 23:58:20'),
(3, 'Angela', 'Yu', 'instructor@ulearn.com', '$2y$10$zquivLYHHCmpzo8D57E5demtkRf/J4vWVj0hchGjDxcegM1/Amy/C', 1, NULL, '2020-06-30 23:58:20', '2020-06-30 23:58:20'),
(4, 'Kevin', 'Caliboso', 'joken767@gmail.com', '$2y$10$8bZ3A3HCLpQ1CbZL8/x47.d3jCr0tkurNc5nl8TZDZQMLjvD9LOHS', 1, NULL, '2020-06-30 23:59:32', '2020-06-30 23:59:32'),
(6, 'Tristan', 'Rosas', 'calibosokevin.20@gmail.com', '$2y$10$QPPua1GI/uCQAyKnpvr8LOeu.gTu9neLID/Hh7fsUVwNW1Gs/hvS.', 1, NULL, '2020-07-28 19:34:19', '2020-07-28 19:34:19'),
(7, 'Jeremy', 'Ibuos', 'caliboso.kevin.21@gmail.com', '$2y$10$MrSUZ8fUoNp/zRUkAY9VVOu.p1FDSSSRqsaJZPx5yiuSGoOpR4zpm', 1, NULL, '2020-08-13 16:49:32', '2020-08-13 16:49:32'),
(8, 'Juan', 'Dela Cruz', 'juantaps@gmail.com', '$2y$10$lBHbR5FS.MIA7LAJv27rhORaXE5UkEh2BPNrN6UUbWwe0SeEArLdS', 1, NULL, '2020-08-19 18:23:20', '2020-08-19 18:23:20'),
(9, 'Ralf', 'Dela Cruz', 'delacruzralf@gmail.com', '$2y$10$BYjheZQPR5IdIkrf9.KPuOmtBrooUsUlYml2AzhMD18WAtRuHtv3W', 1, NULL, '2020-08-19 18:24:47', '2020-08-19 18:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `become_instructors`
--
ALTER TABLE `become_instructors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_files`
--
ALTER TABLE `course_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD PRIMARY KEY (`progress_id`);

--
-- Indexes for table `course_ratings`
--
ALTER TABLE `course_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_taken`
--
ALTER TABLE `course_taken`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_videos`
--
ALTER TABLE `course_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curriculum_lectures_quiz`
--
ALTER TABLE `curriculum_lectures_quiz`
  ADD PRIMARY KEY (`lecture_quiz_id`);

--
-- Indexes for table `curriculum_sections`
--
ALTER TABLE `curriculum_sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instruction_levels`
--
ALTER TABLE `instruction_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_choices`
--
ALTER TABLE `multi_choices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_takens`
--
ALTER TABLE `quiz_takens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `become_instructors`
--
ALTER TABLE `become_instructors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_files`
--
ALTER TABLE `course_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_progress`
--
ALTER TABLE `course_progress`
  MODIFY `progress_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_ratings`
--
ALTER TABLE `course_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_taken`
--
ALTER TABLE `course_taken`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_videos`
--
ALTER TABLE `course_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `curriculum_lectures_quiz`
--
ALTER TABLE `curriculum_lectures_quiz`
  MODIFY `lecture_quiz_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `curriculum_sections`
--
ALTER TABLE `curriculum_sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instruction_levels`
--
ALTER TABLE `instruction_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `multi_choices`
--
ALTER TABLE `multi_choices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=787;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `quiz_takens`
--
ALTER TABLE `quiz_takens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
