-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 28 mai 2024 à 12:24
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
  `date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `currency_name`, `currency_rate`, `tltn_image_filename`, `currency_icon`, `date`) VALUES
(1, 'Néolithique', 'Marchez sur les traces de vos ancêtres du Néolithique, où la terre et la pierre façonnent notre quotidien. Venez échanger vos récits près des feux de camp et troquez vos coquillages contre nos haches taillées et nos poteries délicatement modelées. Découvrez les charmes simples mais essentiels de la vie sédentaire.', 'coquillage', 10.00, 'thumbnail-neolithique.webp', 'currency_icons/coquillage.webp', -3473),
(2, 'Antiquité', 'Plongez dans l\'éclat de l\'Antiquité où les philosophes, les poètes et les guerriers forgent l\'histoire. Avec quelques deniers, vous pouvez acquérir des amphores ornées des tuniques en lin fines ou même des armes dignes des grands héros de Rome et de Grèce. Rejoignez-nous dans les agoras et les forums pour célébrer les exploits et la sagesse de notre temps.', 'denier', 2.00, 'thumbnail-antiquite.webp', 'currency_icons/denier.webp', -417),
(3, 'Moyen-Âge', 'Entrez dans le majestueux Moyen-Âge, une époque de nobles chevaliers et de mystérieuses légendes. Échangez vos écus contre des broches, ciselées, des capes brodées ou des manuscrits précieux. Chaque objet que vous acquérez est imprégné de l\'esprit chevaleresque et du savoir ancestral de nos artisans.', 'écu', 1.00, 'thumbnail-moyenage.webp', 'currency_icons/ecu.webp', 1275),
(4, 'Renaissance', 'Vivez la splendeur de la Renaissance où l\'art et la découverte renaissent sous un jour nouveau. Venez échanger vos florins contre des œuvres d\'art, inestimables, des instruments scientifiques avancés ou des vêtements brodés de soie qui ont charmé les cours européennes. Laissez-vous séduire par le génie de notre époque et enrichissez votre monde avec nos trésors.', 'florin', 0.50, 'thumbnail-renaissance.webp', 'currency_icons/florin.webp', 1544),
(5, 'Époque Moderne', 'Rejoignez l\'ère de l\'innovation et du progrès durant l\'Époque Moderne. Avec quelques livres, vous pouvez vous procurer des merveilles de la technologie comme des machines à écrire portables ou des bicyclettes qui ont révolutionné nos transports. Participez au grand élan vers la modernité et laissez-vous emporter par l\'élégance et le dynamisme de notre temps.', 'livre', 1.50, 'thumbnail-moderne.webp', 'currency_icons/livre.webp', 1871),
(6, 'Futur', 'Plongez dans le futur, un monde où la technologie et l\'innovation redéfinissent les limites du possible. Utilisez vos crédits pour acquérir des gadgets révolutionnaires tels que des smartwatches holographiques ou des robots assistants domestiques. Explorez avec nous les nouvelles frontières de l\'univers et les avancées qui transforment notre quotidien.', 'crédit', 0.20, 'thumbnail-futur.webp', 'currency_icons/credit.webp', 2048),
(7, 'Japon Féodal', 'Explorez l\'époque fascinante du Japon féodal, où les samouraïs et les shoguns régnaient en maîtres. Venez échanger vos pièces de riz contre des katanas forgés, des armures imposantes et des artefacts culturels uniques. Immergez-vous dans cette époque riche en traditions et en histoires légendaires.', 'mon', 1.25, 'thumbnail-japon-feodal.webp', 'currency_icons/mon.webp', 1558);

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
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
