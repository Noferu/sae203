-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 29 mai 2024 à 16:07
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd_sae203`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `currency_name` varchar(255) NOT NULL,
  `currency_rate` double(8,2) NOT NULL,
  `tltn_image_filename` varchar(255) DEFAULT NULL,
  `currency_icon` varchar(255) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `music_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `currency_name`, `currency_rate`, `tltn_image_filename`, `currency_icon`, `date`, `music_url`) VALUES
(1, 'Néolithique', 'Marchez sur les traces de vos ancêtres du Néolithique, où la terre et la pierre façonnent notre quotidien. Venez échanger vos récits près des feux de camp et troquez vos coquillages contre nos haches taillées et nos poteries délicatement modelées. Découvrez les charmes simples mais essentiels de la vie sédentaire.', 'coquillage', 10.00, 'thumbnail-neolithique.webp', 'currency_icons/coquillage.webp', -3473, 'https://dl.dropboxusercontent.com/scl/fi/yqo7f1iir57xxr550sk7j/stone_world.mp3?rlkey=00m1p3ngrbahfcqdm8f91yn89&st=9qircazs'),
(2, 'Antiquité', 'Plongez dans l\'éclat de l\'Antiquité où les philosophes, les poètes et les guerriers forgent l\'histoire. Avec quelques deniers, vous pouvez acquérir des amphores ornées des tuniques en lin fines ou même des armes dignes des grands héros de Rome et de Grèce. Rejoignez-nous dans les agoras et les forums pour célébrer les exploits et la sagesse de notre temps.', 'denier', 2.00, 'thumbnail-antiquite.webp', 'currency_icons/denier.webp', -417, 'https://dl.dropboxusercontent.com/scl/fi/cttsenqi2ia5dg8p3tao7/ac_theflight.mp3?rlkey=9wsgb7ah6gxs6jytvvnjss6ph&st=08xlj5gy'),
(3, 'Moyen-Âge', 'Entrez dans le majestueux Moyen-Âge, une époque de nobles chevaliers et de mystérieuses légendes. Échangez vos écus contre des broches, ciselées, des capes brodées ou des manuscrits précieux. Chaque objet que vous acquérez est imprégné de l\'esprit chevaleresque et du savoir ancestral de nos artisans.', 'écu', 1.00, 'thumbnail-moyenage.webp', 'currency_icons/ecu.webp', 1275, 'https://dl.dropboxusercontent.com/scl/fi/t7xc6he771v59gmt93n0w/medieval_tavern.mp3?rlkey=exbc97mr0a2rwf32hlrwgaw0b&st=bl13shb3'),
(4, 'Renaissance', 'Vivez la splendeur de la Renaissance où l\'art et la découverte renaissent sous un jour nouveau. Venez échanger vos florins contre des œuvres d\'art, inestimables, des instruments scientifiques avancés ou des vêtements brodés de soie qui ont charmé les cours européennes. Laissez-vous séduire par le génie de notre époque et enrichissez votre monde avec nos trésors.', 'florin', 0.50, 'thumbnail-renaissance.webp', 'currency_icons/florin.webp', 1544, 'https://dl.dropboxusercontent.com/scl/fi/sulqbspaeerwtvz7ulgfv/kingdom_dance.mp3?rlkey=ftq10tuw4c0gyjxjqkydezrgj&st=uhke63bx'),
(5, 'Époque Moderne', 'Rejoignez l\'ère de l\'innovation et du progrès durant l\'Époque Moderne. Avec quelques livres, vous pouvez vous procurer des merveilles de la technologie comme des machines à écrire portables ou des bicyclettes qui ont révolutionné nos transports. Participez au grand élan vers la modernité et laissez-vous emporter par l\'élégance et le dynamisme de notre temps.', 'livre', 1.50, 'thumbnail-moderne.webp', 'currency_icons/livre.webp', 1871, 'https://dl.dropboxusercontent.com/scl/fi/kdp7d9y8xsa40tgrxckva/howls_movingcastle.mp3?rlkey=dc461wk883n4yrhk0qb9yhq1l&st=kmelccqp'),
(6, 'Futur', 'Plongez dans le futur, un monde où la technologie et l\'innovation redéfinissent les limites du possible. Utilisez vos crédits pour acquérir des gadgets révolutionnaires tels que des smartwatches holographiques ou des robots assistants domestiques. Explorez avec nous les nouvelles frontières de l\'univers et les avancées qui transforment notre quotidien.', 'crédit', 0.20, 'thumbnail-futur.webp', 'currency_icons/credit.webp', 2048, 'https://dl.dropboxusercontent.com/scl/fi/dvxrmbfymb7lnw56c3ukk/cyberpunk_spoiler.mp3?rlkey=l0tt2knbzj3t4od6f867xtlz9&st=2j8xqkxd'),
(7, 'Féodal', 'Explorez l\'époque fascinante du Japon féodal, où les samouraïs et les shoguns régnaient en maîtres. Venez échanger vos pièces de riz contre des katanas forgés, des armures imposantes et des artefacts culturels uniques. Immergez-vous dans cette époque riche en traditions et en histoires légendaires.', 'mon', 1.25, 'thumbnail-feodal.webp', 'currency_icons/mon.webp', 1558, NULL),
(8, 'Islamique', 'Plongez dans la période florissante de l\'Âge d\'Or Islamique, une ère de grandes avancées scientifiques, culturelles et économiques. Avec vos dirhams, vous pouvez acquérir des œuvres d\'art, des instruments scientifiques et des textiles exquis. Rejoignez-nous pour explorer la richesse et l\'innovation de cette époque dorée.', 'dirham', 0.30, 'thumbnail-islamique.webp', 'currency_icons/dirham.webp', 940, NULL),
(9, 'Western', 'Revivez l\'époque légendaire du Western américain, où les cowboys et les pionniers ont forgé une nouvelle nation. Échangez vos dollars contre des objets emblématiques comme des selles de cheval, des bottes en cuir et des armes à feu. Plongez dans l\'aventure et l\'esprit de l\'Ouest sauvage.', 'dollar', 1.20, 'thumbnail-western.webp', 'currency_icons/dollar.webp', 1888, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idx_category_id` (`category_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
