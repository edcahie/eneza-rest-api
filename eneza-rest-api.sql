-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 06 sep. 2018 à 18:46
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `eneza-rest-api`
--

-- --------------------------------------------------------

--
-- Structure de la table `contents`
--

DROP TABLE IF EXISTS `contents`;
CREATE TABLE IF NOT EXISTS `contents` (
  `content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  KEY `contents_subject_id_foreign` (`subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contents`
--

INSERT INTO `contents` (`content_id`, `subject_id`, `content`, `content_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'You could also say that abbreviations are shortened versions of written words or phrases used to replace the original. Here are some examples: A.D. = Anno Domini - in the year of the Lord A.M. = Ante Meridiem - before midday B.A. = Bachelor of Arts B.S. = Bachelor of Science e.g. = for example et al. = and others\", \"and co-workers\" etc. = et cetera, \"and the others\", \"and other things\", \"and the rest\"i.e. = \'that is\'N.B. = nota bene, \"note well\"Ph. D. = \"Doctor of Philosophy\" P.M. = Post Meridiem, \"after midday\" vs. = versus, \"against', 'T', '2018-09-06 10:07:46', '2018-09-06 10:07:46'),
(2, 1, 'A clause is a group of related words that include a subject and predicate. Predicate is the part of a sentence that shows action or describes the subject. A sentence may have the main clause and one or more subordinate clauses. For example: The boy who was telling a story is a prefect. \'Who\' is used to refer to the person who did the action. The pupil who worked hardest was given a reward. \'Whose\' shows ownership or possession. For example: The boy whose shirt the cows tore got injured', 'T', '2018-09-06 10:08:32', '2018-09-06 10:08:32'),
(3, 2, 'What is the largest continent in the world?', 'Q', '2018-09-06 10:15:24', '2018-09-06 10:15:24'),
(4, 2, 'Latitudes move which direction on a map?', 'Q', '2018-09-06 10:15:39', '2018-09-06 10:15:39');

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `created_at`, `updated_at`) VALUES
(1, 'Primary', '2018-09-06 09:33:11', '2018-09-06 09:33:11'),
(2, 'Secondary', '2018-09-06 09:34:11', '2018-09-06 09:34:11');

-- --------------------------------------------------------

--
-- Structure de la table `courses_subjects`
--

DROP TABLE IF EXISTS `courses_subjects`;
CREATE TABLE IF NOT EXISTS `courses_subjects` (
  `course_subject_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`course_subject_id`),
  KEY `courses_subjects_course_id_foreign` (`course_id`),
  KEY `courses_subjects_subject_id_foreign` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2018_09_06_095500_create_products_table', 2),
(9, '2018_09_06_101758_create_subjects_table', 3),
(10, '2018_09_06_101900_create_courses_table', 3),
(11, '2018_09_06_101936_create_courses_subjects_table', 3),
(12, '2018_09_06_102008_create_contents__table', 3),
(13, '2018_09_06_102040_create_quizz_answers__table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('b73d3e9e0920d3d25df492e09d2799232f08556ba7317cfd8b57979805ee88b577483d8b76a5a0ad', 1, 1, 'Edcahie', '[]', 0, '2018-09-06 09:00:57', '2018-09-06 09:00:57', '2019-09-06 10:00:57'),
('af39010a72312ee63673dd11556aceb680853b1269cdd9d13e69865d0ffbdc8b67bc9b1e0669e215', 1, 1, 'Edcahie', '[]', 0, '2018-09-06 09:01:32', '2018-09-06 09:01:32', '2019-09-06 10:01:32'),
('cbbaac4bfff54314393ab6317bd98135b89d1cb437e02c0eddf0a12e7c1239a8d163afe8ab180d49', 1, 1, 'Edcahie', '[]', 0, '2018-09-06 11:28:51', '2018-09-06 11:28:51', '2019-09-06 12:28:51'),
('9872c51dfb5b98cabdb0b51a856e12b89017a033dba7f3ef501e905f2f799bef493bca7015cb008a', 1, 1, 'Edcahie', '[]', 0, '2018-09-06 11:39:45', '2018-09-06 11:39:45', '2019-09-06 12:39:45'),
('da7a20378c3de3c3590558932226b74d1cb290dc97bb8c6fd63eaf897b1b8d21693a38f7cd4e28e2', 1, 1, 'Edcahie', '[]', 0, '2018-09-06 11:52:22', '2018-09-06 11:52:22', '2019-09-06 12:52:22'),
('219510a2ae2055a169338b47308c84b40d6be4a4f5865e9a619380d67fa04b890eea10cd55c0c91e', 2, 1, 'Edcahie', '[]', 0, '2018-09-06 11:52:46', '2018-09-06 11:52:46', '2019-09-06 12:52:46'),
('bf7ee0d2aca066f7a7addd2a1f6629bf6e56460a888c6a0f202b2fa8b58a2ea6423fc105e9544701', 3, 1, 'Edcahie', '[]', 0, '2018-09-06 11:53:17', '2018-09-06 11:53:17', '2019-09-06 12:53:17'),
('4be94cd2327a71952d682bda119d8be91f993aeaa518a9148fe1a42c025ed5dc94940ed82a00247e', 3, 1, 'Edcahie', '[]', 0, '2018-09-06 11:54:02', '2018-09-06 11:54:02', '2019-09-06 12:54:02'),
('e17d28fc8d53d19623ac66a320032e4b5cbe2514b59a3465d390ac8d99d89a913807b2e8a6098938', 3, 1, 'Edcahie', '[]', 0, '2018-09-06 11:54:50', '2018-09-06 11:54:50', '2019-09-06 12:54:50'),
('54dd8da17514613df4c4321ebf2f38d31566a48119b654cecdc14bc66994893dc595503c4582085b', 4, 1, 'Edcahie', '[]', 0, '2018-09-06 12:29:58', '2018-09-06 12:29:58', '2019-09-06 13:29:58'),
('7c5b451e4bbdcfc4e9e599e52b98a597f67e941942386dcc9b8d6c8d6e1e5923fddf2dda2a21c051', 1, 1, 'Edcahie', '[]', 0, '2018-09-06 12:57:57', '2018-09-06 12:57:57', '2019-09-06 13:57:57');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '47q9BDXRy4FXvfEZjyDyU0AzvnzTC6oMngjAbKTW', 'http://localhost', 1, 0, 0, '2018-09-06 08:50:42', '2018-09-06 08:50:42'),
(2, NULL, 'Laravel Password Grant Client', 'kxflkYHkmqjHiMrja21JnkqWsan76uvXJo96Q35l', 'http://localhost', 0, 1, 0, '2018-09-06 08:50:42', '2018-09-06 08:50:42');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-09-06 08:50:42', '2018-09-06 08:50:42');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'calculator', 10, '2018-09-06 09:06:02', '2018-09-06 09:06:02');

-- --------------------------------------------------------

--
-- Structure de la table `quizz_answers`
--

DROP TABLE IF EXISTS `quizz_answers`;
CREATE TABLE IF NOT EXISTS `quizz_answers` (
  `quizz_answer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isanswer` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`quizz_answer_id`),
  KEY `quizz_answers_content_id_foreign` (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quizz_answers`
--

INSERT INTO `quizz_answers` (`quizz_answer_id`, `content_id`, `answer`, `isanswer`, `created_at`, `updated_at`) VALUES
(1, 3, 'Asia', 'Y', '2018-09-06 10:32:11', '2018-09-06 10:32:11'),
(2, 3, 'America', 'N', '2018-09-06 10:32:31', '2018-09-06 10:32:31'),
(3, 3, 'Africa', 'N', '2018-09-06 10:33:25', '2018-09-06 10:33:25'),
(4, 4, 'East to West', 'N', '2018-09-06 10:34:09', '2018-09-06 10:34:09'),
(5, 4, 'North to South', 'Y', '2018-09-06 10:34:20', '2018-09-06 10:34:20');

-- --------------------------------------------------------

--
-- Structure de la table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `created_at`, `updated_at`) VALUES
(1, 'English', '2018-09-06 09:57:47', '2018-09-06 10:00:01'),
(2, 'Mathematics', '2018-09-06 10:13:55', '2018-09-06 10:13:55'),
(3, 'Science', '2018-09-06 11:55:18', '2018-09-06 11:55:18');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'edcahie', 'edmondcahie@gmail.com', '$2y$10$kCePlsseGvusyprMumxbMe9Rvn8V5ySvJf6DpIMmb9KxhOVP2rbRm', NULL, '2018-09-06 09:00:57', '2018-09-06 09:00:57'),
(2, 'sdfd', 'ed@hghdf.ffr', '$2y$10$sAWrViCGnK.m4cj6cLx9EOz9q16VJ9Ehtmvtmzjko08BTZ.T4f27e', NULL, '2018-09-06 11:52:46', '2018-09-06 11:52:46'),
(3, 'oumar', 'oumar@gmail.com', '$2y$10$ddyGcCI6MK4UK8HFvSf.FOM6vg8gidHbzNYq91.KLNVAXC3hX5BQO', NULL, '2018-09-06 11:53:17', '2018-09-06 11:53:17'),
(4, 'yourname', 'youremail@adresse.com', '$2y$10$Eq3tGcPR5PRy.iFIumEwY.eJVk9v2Q2ZLL7RBqtfebdtoH5qmGcYq', NULL, '2018-09-06 12:29:58', '2018-09-06 12:29:58');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
