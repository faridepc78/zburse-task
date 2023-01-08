-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 08, 2023 at 09:41 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zburse-task`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('in_cart','in_order') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_cart',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'in_order', '2023-01-08 21:26:39', '2023-01-08 21:26:48'),
(2, 1, 'in_cart', '2023-01-08 21:29:54', '2023-01-08 21:29:54'),
(4, 4, 'in_order', '2023-01-08 21:35:29', '2023-01-08 21:36:10'),
(5, 13, 'in_order', '2023-01-08 21:38:04', '2023-01-08 21:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `itemable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `product_id`, `quantity`, `itemable_type`, `itemable_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'App\\Models\\Cart', 1, '2023-01-08 21:26:39', '2023-01-08 21:26:39'),
(2, 4, 2, 'App\\Models\\Cart', 1, '2023-01-08 21:26:39', '2023-01-08 21:26:39'),
(3, 12, 3, 'App\\Models\\Cart', 1, '2023-01-08 21:26:39', '2023-01-08 21:26:39'),
(4, 17, 4, 'App\\Models\\Cart', 1, '2023-01-08 21:26:39', '2023-01-08 21:26:39'),
(5, 2, 1, 'App\\Models\\Order', 1, '2023-01-08 21:26:48', '2023-01-08 21:26:48'),
(6, 4, 2, 'App\\Models\\Order', 1, '2023-01-08 21:26:48', '2023-01-08 21:26:48'),
(7, 12, 3, 'App\\Models\\Order', 1, '2023-01-08 21:26:48', '2023-01-08 21:26:48'),
(8, 17, 4, 'App\\Models\\Order', 1, '2023-01-08 21:26:48', '2023-01-08 21:26:48'),
(9, 2, 1, 'App\\Models\\Cart', 2, '2023-01-08 21:29:54', '2023-01-08 21:29:54'),
(10, 4, 2, 'App\\Models\\Cart', 2, '2023-01-08 21:29:54', '2023-01-08 21:29:54'),
(11, 12, 3, 'App\\Models\\Cart', 2, '2023-01-08 21:29:54', '2023-01-08 21:29:54'),
(15, 2, 1, 'App\\Models\\Cart', 4, '2023-01-08 21:35:29', '2023-01-08 21:35:29'),
(16, 4, 2, 'App\\Models\\Cart', 4, '2023-01-08 21:35:29', '2023-01-08 21:35:29'),
(17, 12, 3, 'App\\Models\\Cart', 4, '2023-01-08 21:35:29', '2023-01-08 21:35:29'),
(18, 2, 1, 'App\\Models\\Order', 2, '2023-01-08 21:36:10', '2023-01-08 21:36:10'),
(19, 4, 2, 'App\\Models\\Order', 2, '2023-01-08 21:36:10', '2023-01-08 21:36:10'),
(20, 12, 3, 'App\\Models\\Order', 2, '2023-01-08 21:36:10', '2023-01-08 21:36:10'),
(21, 2, 1, 'App\\Models\\Cart', 5, '2023-01-08 21:38:04', '2023-01-08 21:38:04'),
(22, 4, 2, 'App\\Models\\Cart', 5, '2023-01-08 21:38:04', '2023-01-08 21:38:04'),
(23, 12, 3, 'App\\Models\\Cart', 5, '2023-01-08 21:38:04', '2023-01-08 21:38:04'),
(24, 2, 1, 'App\\Models\\Order', 3, '2023-01-08 21:38:15', '2023-01-08 21:38:15'),
(25, 4, 2, 'App\\Models\\Order', 3, '2023-01-08 21:38:15', '2023-01-08 21:38:15'),
(26, 12, 3, 'App\\Models\\Order', 3, '2023-01-08 21:38:15', '2023-01-08 21:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
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

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2023_01_05_085531_create_jobs_table', 1),
(14, '2023_01_07_183316_create_products_table', 1),
(15, '2023_01_07_183720_create_carts_table', 1),
(16, '2023_01_07_183812_create_orders_table', 1),
(17, '2023_01_07_212025_create_items_table', 1),
(18, '2023_01_07_235726_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(1, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','rejected','awaiting_payment','payment_confirmation','preparation','submit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '9484667987', 'payment_confirmation', '2023-01-08 21:26:48', '2023-01-08 21:27:07'),
(2, 4, 4, '9942761939', 'payment_confirmation', '2023-01-08 21:36:10', '2023-01-08 21:36:37'),
(3, 13, 5, '6195179211', 'pending', '2023-01-08 21:38:15', '2023-01-08 21:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage orders', 'web', '2023-01-08 21:24:30', '2023-01-08 21:24:30'),
(2, 'manage products', 'web', '2023-01-08 21:24:30', '2023-01-08 21:24:30'),
(3, 'manage carts', 'web', '2023-01-08 21:24:30', '2023-01-08 21:24:30'),
(4, 'audit management', 'web', '2023-01-08 21:24:30', '2023-01-08 21:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 11, 'farid@gmail.com_api_token', 'f98392f7cb2136b12c569b828943a2ec50aa6f85e2396835d049dd4f358d241c', '[\"*\"]', '2023-01-08 21:39:58', NULL, '2023-01-08 21:25:09', '2023-01-08 21:39:58'),
(2, 'App\\Models\\User', 1, 'charles73@example.org_api_token', '444b1d16cd8599dd477f8de924c42e305fb492b59e7469bd69800b911d5b31de', '[\"*\"]', '2023-01-08 21:34:25', NULL, '2023-01-08 21:25:58', '2023-01-08 21:34:25'),
(3, 'App\\Models\\User', 4, 'mraynor@example.net_api_token', '4eb4eedd0b245f4550bd8e9fce1b39ebe6a931111d66f028cd9df71b507dec4f', '[\"*\"]', '2023-01-08 21:36:37', NULL, '2023-01-08 21:35:20', '2023-01-08 21:36:37'),
(4, 'App\\Models\\User', 13, 'reza@gmail.com_api_token', '71cd90112d5dd9d43f9196a769e750dcf1a9463d33e0d979c57c20ddc36e1f3e', '[\"*\"]', '2023-01-08 21:38:15', NULL, '2023-01-08 21:37:55', '2023-01-08 21:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `discount` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `status` enum('active','inactive','unavailable') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `discount`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Carmen Roob', 'adipisci-dicta-commodi-ratione-ipsa-quibusdam', 7328952, 49, 678, 'unavailable', '2023-01-08 21:24:32', '2023-01-08 21:24:32'),
(2, 'Aaliyah Rau', 'ipsam-fuga-non-velit-aliquid', 8344056, 59, 829, 'active', '2023-01-08 21:24:32', '2023-01-08 21:36:37'),
(3, 'Crystel Zulauf', 'aspernatur-consequuntur-sint-odit-at-cupiditate-delectus-qui', 6055901, 92, 368, 'unavailable', '2023-01-08 21:24:32', '2023-01-08 21:24:32'),
(4, 'Vickie Tremblay DVM', 'culpa-temporibus-pariatur-omnis-ipsa', 4966968, 20, 691, 'active', '2023-01-08 21:24:32', '2023-01-08 21:36:37'),
(5, 'Riley Armstrong', 'amet-dolore-sint-ut-id-consectetur', 202808, 83, 828, 'inactive', '2023-01-08 21:24:32', '2023-01-08 21:24:32'),
(6, 'Presley Schumm', 'qui-rerum-nulla-quae-nisi', 7852479, 6, 585, 'inactive', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(7, 'Brianne Medhurst DDS', 'aliquam-voluptas-sint-numquam-debitis', 8806891, 69, 302, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(8, 'Pietro Douglas', 'pariatur-velit-natus-quasi-officia-est-aliquam', 3330755, 69, 541, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(9, 'Prof. Mariana Wiegand', 'rerum-deleniti-id-velit-sunt-nostrum-et', 1843589, 28, 212, 'inactive', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(10, 'Camila Corkery', 'dolor-molestiae-excepturi-quia-rerum-voluptates-illo-adipisci', 8916347, 53, 529, 'inactive', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(11, 'Cale Stamm Jr.', 'numquam-cumque-sint-sed-enim-quo-sint', 3580886, 61, 83, 'inactive', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(12, 'Rory Volkman', 'eos-excepturi-commodi-et-nihil-eligendi', 7715380, 57, 391, 'active', '2023-01-08 21:24:33', '2023-01-08 21:36:37'),
(13, 'Wilfrid Tillman V', 'voluptates-iste-tempore-cumque-illum-ut', 5298488, 91, 442, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(14, 'Wanda Jones', 'placeat-nemo-et-rerum-voluptas-cumque', 8977711, 86, 918, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(15, 'Chaim Shields', 'alias-laboriosam-unde-consectetur', 9095559, 15, 939, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(16, 'Ms. Filomena Schuppe', 'qui-possimus-et-mollitia-facere-ea-aut', 3762535, 37, 193, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(17, 'Dr. Madison Fisher', 'libero-ad-dolores-tenetur-quo-nostrum-vel', 2227277, 4, 265, 'active', '2023-01-08 21:24:33', '2023-01-08 21:27:07'),
(18, 'Casper Mertz', 'ea-soluta-enim-corporis-dignissimos', 8385092, 81, 648, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(19, 'Charles Labadie', 'et-porro-ipsa-unde-recusandae-porro-rerum', 7772697, 86, 504, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(20, 'Mr. Jaycee Gutmann', 'est-ea-dolores-repudiandae-ab-qui-aut-et', 7857296, 25, 119, 'active', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(21, 'Janiya Bernier', 'quod-vitae-voluptatem-vel', 8644497, 89, 675, 'active', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(22, 'Kale Cassin', 'laudantium-distinctio-maiores-porro-quia-consequatur-pariatur-voluptate', 4769377, 48, 377, 'inactive', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(23, 'Maeve Douglas', 'aut-alias-accusamus-placeat-quia', 6883149, 4, 34, 'active', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(24, 'Rickie Rohan', 'corrupti-consequatur-excepturi-exercitationem-maiores', 7678152, 22, 794, 'active', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(25, 'Mr. Keaton Brakus Jr.', 'in-modi-non-harum', 9329224, 90, 911, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(26, 'Lavada Goyette II', 'dolorem-consequuntur-blanditiis-aliquam-dolorem-rerum-id-similique', 6596852, 4, 365, 'active', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(27, 'Mr. Ricky Langosh Jr.', 'porro-eveniet-porro-voluptas-quis-et-non-unde', 1920275, 43, 116, 'inactive', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(28, 'Jacinthe Legros', 'sed-nostrum-quo-ullam-voluptatum-debitis-saepe-ut', 2213600, 96, 418, 'active', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(29, 'Chadrick O\'Keefe', 'ipsa-voluptas-quisquam-autem-labore-asperiores-voluptatibus-modi-vitae', 2806554, 12, 172, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(30, 'Brenda Greenfelder', 'tenetur-sit-quis-architecto-dolores', 1649108, 76, 196, 'inactive', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(31, 'Victor Emmerich', 'harum-expedita-repellat-cum-nihil-ipsam-laudantium', 8264080, 38, 693, 'unavailable', '2023-01-08 21:24:33', '2023-01-08 21:24:33'),
(32, 'Morton Fahey', 'est-animi-provident-dolores-rerum-consequatur-incidunt', 4202333, 33, 10, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(33, 'Vincent Zboncak', 'eos-temporibus-fuga-est-voluptatem-non', 8553154, 21, 946, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(34, 'Dr. Erling Bednar IV', 'nihil-non-aut-laborum-aut-velit-dolor-asperiores', 1367066, 20, 828, 'unavailable', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(35, 'Nikita Goodwin', 'quasi-reprehenderit-illum-sit-iusto-doloribus', 5883762, 4, 595, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(36, 'Andy Bauch', 'et-dicta-est-non-et', 5052225, 51, 301, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(37, 'Dr. Bobbie Altenwerth PhD', 'quibusdam-dolorum-dolores-pariatur-eos-delectus-provident-ratione-ut', 931120, 20, 112, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(38, 'Dr. Everett Mann II', 'iusto-accusamus-illum-dolores-voluptas', 7309417, 63, 769, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(39, 'Ms. Cayla Fay III', 'voluptatibus-quia-rerum-eveniet-nemo-enim-ut-provident', 8676645, 18, 953, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(40, 'Ozella Toy', 'voluptatem-neque-saepe-labore-quas', 2519160, 59, 347, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(41, 'Ms. Kira Russel Sr.', 'enim-pariatur-et-vel-qui-ea-laboriosam-et', 1846825, 53, 882, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(42, 'Cloyd Swift', 'sit-dolores-illum-fugit-nostrum-qui', 8498076, 29, 825, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(43, 'Georgiana Eichmann', 'dicta-est-in-ut', 315836, 39, 32, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(44, 'Mazie Bashirian', 'deleniti-eaque-aperiam-ipsa-aut-aut-aut', 68950, 74, 592, 'unavailable', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(45, 'Aron Torphy', 'ut-omnis-consequatur-fugit-illo-in-repellat', 8488787, 47, 734, 'unavailable', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(46, 'Violette Okuneva PhD', 'nostrum-aut-sed-autem-ex', 8732650, 34, 190, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(47, 'Salma Hermiston', 'aut-quae-molestiae-dolorem-totam-rerum', 3195295, 19, 792, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(48, 'Chance Mohr', 'quod-est-et-ex-nesciunt-quam-repudiandae', 5717427, 30, 58, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(49, 'Ms. Trinity Lemke', 'accusamus-inventore-quis-omnis-odit-eos', 7042608, 21, 811, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(50, 'Chadrick Cummerata', 'magni-accusantium-eveniet-quis-sed-itaque-consequuntur', 6839637, 14, 790, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(51, 'Ayana Marquardt PhD', 'sed-voluptas-excepturi-qui-eligendi', 199757, 21, 732, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(52, 'Miss Vernice Marks Jr.', 'et-quod-aut-incidunt-explicabo-voluptatem-voluptas-voluptatem', 4863784, 75, 373, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(53, 'Ruth Walker', 'dolorem-iusto-animi-quisquam-sit', 4392333, 23, 417, 'unavailable', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(54, 'Victor Raynor', 'quam-aut-harum-nihil', 6134331, 20, 636, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(55, 'Dejuan Glover', 'neque-nihil-enim-aspernatur-sit-quae-et-facere-nobis', 5252841, 56, 888, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(56, 'Emile Gaylord', 'voluptas-iusto-aut-amet-repellat-vero-quis', 6574534, 17, 210, 'unavailable', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(57, 'Mr. Garnett Sporer PhD', 'doloribus-autem-neque-iure-quo', 981557, 90, 159, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(58, 'Werner Treutel MD', 'qui-velit-et-voluptas-corrupti-autem', 796795, 15, 598, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(59, 'Jaleel Littel', 'quibusdam-consequuntur-corrupti-voluptatibus-voluptatem-dignissimos-ipsa-aperiam', 9671184, 37, 146, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(60, 'Logan Zulauf', 'voluptas-fuga-quidem-expedita-voluptatem-quas-sit-eos-et', 5588927, 59, 796, 'unavailable', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(61, 'Cristina O\'Connell', 'neque-quia-reiciendis-quod-iste', 5420883, 50, 360, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(62, 'Douglas Jast', 'tempora-inventore-magni-at-quis-qui', 5844026, 34, 484, 'unavailable', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(63, 'Graham Turner', 'consequatur-quae-vel-similique-aut-accusamus-accusantium', 3672986, 27, 868, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(64, 'Karson Green Sr.', 'animi-voluptatibus-voluptas-ducimus-enim-quod', 5080848, 24, 894, 'active', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(65, 'Adelia Hoeger', 'fugiat-consectetur-optio-numquam-non-consequuntur-sunt', 5609887, 49, 471, 'inactive', '2023-01-08 21:24:34', '2023-01-08 21:24:34'),
(66, 'Dawson Gerhold', 'consectetur-autem-neque-eum-sint-assumenda-libero-ipsam', 2058949, 26, 487, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(67, 'Mr. Arlo Zboncak Jr.', 'aut-in-laudantium-delectus-tempora-expedita-recusandae', 5594399, 55, 424, 'active', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(68, 'Cesar Thompson', 'similique-at-id-sequi-et-similique-mollitia-eum-laudantium', 820451, 25, 911, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(69, 'Brody Leffler', 'porro-fuga-corrupti-voluptate', 864559, 40, 450, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(70, 'Mr. Luigi Kihn MD', 'suscipit-quia-architecto-pariatur-et', 2882331, 35, 879, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(71, 'Prof. Raymond Sanford MD', 'qui-eligendi-atque-explicabo-perspiciatis-numquam-in-aliquam-animi', 5338713, 88, 108, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(72, 'Miss Chanelle Jerde', 'sit-reiciendis-quisquam-ut-adipisci', 5842597, 9, 663, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(73, 'Raina Rippin', 'expedita-est-illum-rerum-cupiditate', 4768206, 17, 746, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(74, 'Claire Reinger', 'ab-eos-nobis-hic-quo', 9871212, 56, 337, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(75, 'Jazmin Durgan', 'et-quaerat-veritatis-quia-earum', 8952292, 18, 322, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(76, 'Rico Hartmann', 'consequuntur-expedita-ut-iure-sed-ut-facere-distinctio', 2406846, 81, 916, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(77, 'Lily Littel', 'ducimus-voluptates-in-a-est-et-ut', 4209421, 76, 757, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(78, 'Willie Denesik', 'dolor-quisquam-facere-ut-nihil-sint-non', 7155684, 97, 272, 'active', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(79, 'Miss Golda Monahan I', 'nam-porro-cumque-quo-tempora', 3436506, 63, 409, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(80, 'Jada Jerde', 'vitae-cum-inventore-voluptates', 9231549, 65, 376, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(81, 'Magali Conroy', 'mollitia-rerum-ea-nihil-architecto-qui-fugiat', 2075875, 58, 236, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(82, 'Braden Bogisich', 'aut-dolorum-ea-unde-officia', 4826535, 12, 209, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(83, 'Lucas Zieme DVM', 'rerum-nam-numquam-nulla-hic', 9888987, 28, 858, 'active', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(84, 'Arturo Welch', 'quia-aut-nulla-doloremque-sequi-ut-distinctio', 2745317, 21, 762, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(85, 'Christop McDermott', 'et-rerum-eos-non-minus-facere-amet', 9505145, 84, 686, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(86, 'Prof. Hal Reilly DDS', 'in-sunt-facere-voluptas-ut-ut', 981528, 68, 412, 'active', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(87, 'Milton Aufderhar III', 'nobis-voluptas-asperiores-rerum-perspiciatis', 1999074, 32, 569, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(88, 'Fernando Hane', 'in-deserunt-non-pariatur-doloribus-nihil-qui-nihil', 8064655, 93, 881, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(89, 'Cletus Hermiston', 'voluptates-sit-eligendi-aut-dolorum-mollitia-dicta-facere-earum', 2594057, 43, 30, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(90, 'Dereck Stoltenberg V', 'facilis-ad-praesentium-iure-fuga-soluta-voluptatibus-dolorum', 1920715, 19, 282, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(91, 'Mr. Alberto Bednar', 'reprehenderit-quam-doloribus-ut-quisquam-similique-et-magni-et', 6514614, 12, 279, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(92, 'Adelia Jacobson', 'ducimus-ipsum-et-ipsa-impedit-beatae', 1937606, 26, 692, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(93, 'Ms. Clarissa Hegmann V', 'aspernatur-esse-ullam-enim', 8827780, 1, 802, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(94, 'Caterina Klocko', 'vero-aut-nisi-optio-vel-dolorem-omnis-maiores', 5238308, 20, 170, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(95, 'Prof. Violet Connelly', 'porro-quia-id-ut', 8829682, 61, 450, 'active', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(96, 'Kristin Shields', 'nulla-omnis-impedit-non-repellendus', 5554610, 36, 17, 'unavailable', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(97, 'Curt Hartmann', 'nulla-omnis-dolores-rerum-eos-soluta-ipsa-tempore-ipsa', 4977770, 34, 960, 'inactive', '2023-01-08 21:24:35', '2023-01-08 21:24:35'),
(98, 'Terence Hackett', 'quos-et-autem-soluta-qui-architecto-incidunt', 2627516, 38, 543, 'inactive', '2023-01-08 21:24:36', '2023-01-08 21:24:36'),
(99, 'Jo Mayert', 'dolorum-numquam-quia-asperiores-vel-velit-odio', 6802374, 57, 108, 'active', '2023-01-08 21:24:36', '2023-01-08 21:24:36'),
(100, 'Monica Cole MD', 'blanditiis-in-eos-sunt-quasi', 1798969, 61, 535, 'unavailable', '2023-01-08 21:24:36', '2023-01-08 21:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-01-08 21:24:30', '2023-01-08 21:24:30'),
(2, 'accountant', 'web', '2023-01-08 21:24:30', '2023-01-08 21:24:30'),
(3, 'user', 'web', '2023-01-08 21:24:30', '2023-01-08 21:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Mrs. America Greenholt', 'charles73@example.org', '$2y$10$J7pECntOwXTmz5w8H80lnO/z.TN/H2kuNRD6gpS.OLFYmxKcyyO0m', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(2, 'Ms. Clarissa Moore', 'mohammad47@example.com', '$2y$10$s.bWmygqPGpZFhafQnVSgu.eLgxyiEFTOzPY2F7qA4PlHY3ry2vUC', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(3, 'Alvis Tremblay', 'emmanuelle.morar@example.net', '$2y$10$ckAIKSzdEcsUAAxpIw7bK.L2Mp1gv0KNLcnoJJzRcaNZDM.421E/2', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(4, 'Dr. Dexter Mueller', 'mraynor@example.net', '$2y$10$btOd.KAdgKNguE2ekx4wO.YJKTtRPc.LJncEhZhsanM9OCrspM2ze', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(5, 'Prof. Cary Bahringer', 'xberge@example.net', '$2y$10$cSJApbLmYHHz8GpmwNOhOe9hIOkycuzS4yM7izI2a.8.uHCDaSU8q', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(6, 'Porter Terry', 'kub.elliot@example.net', '$2y$10$iKUD7Y1iiT.yyxibIr2Q3.kspKmMEsH/NvJuU3rXLglRc6ec9Rnvi', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(7, 'Prof. Roselyn Leuschke', 'king.ryan@example.com', '$2y$10$vG03TTCt/8U2zFQSLydzYOJLbp3ZEo1D.ZHRZ9ldxJsUngsoq2Csu', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(8, 'Prof. Florida Blick', 'rahul22@example.com', '$2y$10$iUiqcO7LzN7lFnR60Ei.Z.LxXjMYBLNT/xlJ7fj0gdfekN8zSq6v6', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(9, 'Kendrick Rosenbaum', 'harvey13@example.com', '$2y$10$LQjopFxJw9YOy6sKBIOOiOlz6eP2wNLMMTjQr4lSAntZmXa13SY6u', '2023-01-08 21:24:31', '2023-01-08 21:24:31'),
(10, 'Cloyd Shanahan Sr.', 'lhoeger@example.com', '$2y$10$emEvdTzhfDRPoh9XLUWHPe7czj.paWReCSPz/.zGs0Wi2Nl2Tsg4q', '2023-01-08 21:24:32', '2023-01-08 21:24:32'),
(11, 'farid', 'farid@gmail.com', '$2y$10$i/03PeXTqUu3mrvSfHBKmuUFXNLnjVh.Ki..Y4ydqkoB9jaQ15ifq', '2023-01-08 21:24:32', '2023-01-08 21:24:32'),
(12, 'ali', 'ali@gmail.com', '$2y$10$l1XhtRXm5vV3I918f5blk.nKyg/2IV0/UmXHUeSu0FmLz2Pqm5mAG', '2023-01-08 21:24:32', '2023-01-08 21:24:32'),
(13, 'reza', 'reza@gmail.com', '$2y$10$1I.pxpJU7ZXghxyzGQsrz.Nq7/kmQVLcexyfj4kBZUZ1X/K1jqoMS', '2023-01-08 21:24:32', '2023-01-08 21:24:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_itemable_type_itemable_id_index` (`itemable_type`,`itemable_id`),
  ADD KEY `items_product_id_foreign` (`product_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_unique` (`code`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
