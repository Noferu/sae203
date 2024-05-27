-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 27 mai 2024 à 21:25
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
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rating_score` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`comment_id`, `article_id`, `user_id`, `rating_score`, `content`, `created_at`) VALUES
(1, 1, 1, 5, 'Une arme exceptionnelle, très bien conçue. Parfaite pour la chasse.', '2024-05-26 23:16:25'),
(2, 2, 1, 2, 'Collier sympa mais je crois que le loup était végétarien.', '2024-05-26 23:16:25'),
(3, 3, 1, 5, 'Cape très chaude, parfaite pour les nuits froides.', '2024-05-26 23:16:25'),
(4, 4, 1, 3, 'Pot pratique, mais un peu lourd. Mon dos s\'en souvient encore.', '2024-05-26 23:16:25'),
(5, 5, 1, 4, 'Bonne lance, idéale pour la chasse.', '2024-05-26 23:16:25'),
(6, 6, 1, 5, 'Flûte merveilleuse, le son est incroyable. Mes voisins moins.', '2024-05-26 23:16:25'),
(7, 7, 1, 4, 'Sac solide, parfait pour les longues marches.', '2024-05-26 23:16:25'),
(8, 8, 1, 5, 'Superbe peinture rupestre, très détaillée. Presque moderne !', '2024-05-26 23:16:25'),
(9, 9, 1, 4, 'Kit d\'allumage efficace, très utile. Sauf sous la pluie.', '2024-05-26 23:16:25'),
(10, 10, 1, 5, 'Bijoux magnifiques, très bien sculptés. Parfait pour les mammouths.', '2024-05-26 23:16:25'),
(11, 11, 1, 3, 'Amphore belle, mais fragile. Elle a survécu deux fêtes.', '2024-05-26 23:16:25'),
(12, 12, 1, 5, 'Tunique en lin légère et confortable. Parfaite pour les étés grecs.', '2024-05-26 23:16:25'),
(13, 13, 1, 4, 'Lampe à huile très utile, éclaire bien. Mais l\'huile, ça coûte !', '2024-05-26 23:16:25'),
(14, 14, 1, 5, 'Statuette de déesse impressionnante, très bien faite.', '2024-05-26 23:16:25'),
(15, 15, 1, 2, 'Collier élégant, mais les perles se détachent. Dommage.', '2024-05-26 23:16:25'),
(16, 16, 1, 3, 'Sandales confortables, mais usure rapide. Mes pieds n\'ont pas apprécié.', '2024-05-26 23:16:25'),
(17, 17, 1, 5, 'Couronne de laurier magnifique, très symbolique. Idéale pour les selfies.', '2024-05-26 23:16:25'),
(18, 18, 1, 4, 'Fresque murale très belle, mais chère. Parfait pour les riches.', '2024-05-26 23:16:25'),
(19, 19, 1, 5, 'Parchemin écrit avec soin, très informatif. La meilleure lecture.', '2024-05-26 23:16:25'),
(20, 20, 1, 4, 'Gladius robuste, parfait pour un légionnaire. Un peu lourd.', '2024-05-26 23:16:25'),
(21, 21, 1, 5, 'Épée longue magnifique, très bien équilibrée. Prêt pour le cosplay.', '2024-05-26 23:16:25'),
(22, 22, 1, 4, 'Broche en argent délicate, très belle. Mais se perd facilement.', '2024-05-26 23:16:25'),
(24, 24, 1, 4, 'Casque de chevalier solide, bonne protection. Mon crâne remercie.', '2024-05-26 23:16:25'),
(25, 25, 1, 5, 'Chope en étain gravée, idéale pour les banquets. À la santé !', '2024-05-26 23:16:25'),
(26, 26, 1, 4, 'Bouclier solide, bonne protection en combat. Moins contre les factures.', '2024-05-26 23:16:25'),
(27, 27, 1, 5, 'Manuscrit enluminé magnifique, très bien conservé. Une vraie œuvre d\'art.', '2024-05-26 23:16:25'),
(28, 28, 1, 4, 'Cape en laine brodée, très chaude et confortable. Parfaite pour l\'hiver.', '2024-05-26 23:16:25'),
(29, 29, 1, 5, 'Herbier de plantes médicinales très utile et bien fait. Mon herboriste approuve.', '2024-05-26 23:16:25'),
(30, 30, 1, 4, 'Luth en bois avec un son magnifique. Parfait pour les soirées mélancoliques.', '2024-05-26 23:16:25'),
(31, 31, 1, 5, 'Globe terrestre décoratif très détaillé. Parfait pour les géographes.', '2024-05-26 23:16:25'),
(32, 32, 1, 2, 'Un portrait magnifique, les détails sont incroyables. Un peu cher cependant.', '2024-05-26 23:16:25'),
(33, 33, 1, 5, 'Robe en soie brodée magnifique, très élégante. Idéale pour les soirées de gala.', '2024-05-26 23:16:25'),
(34, 34, 1, 4, 'Astrolabe en laiton, très bien fabriqué. Je me perds toujours.', '2024-05-26 23:16:25'),
(35, 35, 1, 5, 'Collier en or et émeraude splendide, très luxueux. Un peu trop voyant.', '2024-05-26 23:16:25'),
(36, 36, 1, 3, 'Livres de poésie bien imprimés, très inspirants. Certains poèmes sont trop tristes.', '2024-05-26 23:16:25'),
(37, 37, 1, 5, 'Canne à pommeau sculpté, très élégante. Parfaite pour les promenades.', '2024-05-26 23:16:25'),
(38, 38, 1, 4, 'Chapeau en velours avec plume, très stylé. Un peu trop extravagant.', '2024-05-26 23:16:25'),
(39, 39, 1, 5, 'Viole de gambe, son magnifique. Presque trop parfait.', '2024-05-26 23:16:25'),
(40, 40, 1, 4, 'Ensemble d\'échecs très bien sculpté. Les pions sont trop petits.', '2024-05-26 23:16:25'),
(41, 41, 1, 5, 'Montre de poche en or, très précise et élégante. Parfaite pour les gentlemen.', '2024-05-26 23:16:25'),
(42, 42, 1, 4, 'Chapeau haut-de-forme en feutre, très chic. Un peu trop rigide.', '2024-05-26 23:16:25'),
(43, 43, 1, 5, 'Manteau en tweed, très bien fait et chaud. Idéal pour l\'hiver anglais.', '2024-05-26 23:16:25'),
(44, 44, 1, 4, 'Lanterne à huile en cuivre, éclaire bien. Mais consomme beaucoup d\'huile.', '2024-05-26 23:16:25'),
(45, 45, 1, 5, 'Machine à écrire portable, très pratique. Parfaite pour les écrivains itinérants.', '2024-05-26 23:16:25'),
(46, 46, 1, 2, 'Bicyclette Penny-farthing, très originale. Pas très stable.', '2024-05-26 23:16:25'),
(47, 47, 1, 5, 'Ensemble de thé en porcelaine, très élégant. Parfait pour les tea parties.', '2024-05-26 23:16:25'),
(48, 48, 1, 4, 'Carte du monde encadrée, très détaillée. Les couleurs sont un peu ternes.', '2024-05-26 23:16:25'),
(49, 49, 1, 5, 'Jumelles en cuir et laiton, très utiles. Idéales pour l\'observation des oiseaux.', '2024-05-26 23:16:25'),
(50, 50, 1, 4, 'Canevas brodé, très bien fait. Un peu trop coloré à mon goût.', '2024-05-26 23:16:25'),
(51, 51, 1, 5, 'Smartwatch holographique, très avancée. Comme dans un film de science-fiction.', '2024-05-26 23:16:25'),
(52, 52, 1, 4, 'Lunettes de réalité augmentée, très pratiques. Sauf quand on les perd.', '2024-05-26 23:16:25'),
(53, 53, 1, 5, 'Combinaison spatiale légère, très innovante. Parfaite pour les astronautes en herbe.', '2024-05-26 23:16:25'),
(54, 54, 1, 4, 'Drone personnel de transport, très utile. Un peu bruyant.', '2024-05-26 23:16:25'),
(55, 55, 1, 5, 'Panneau de commande domestique intelligent, très pratique. La maison du futur.', '2024-05-26 23:16:25'),
(56, 56, 1, 4, 'Kit de jardinage hydroponique, très utile. Un peu cher.', '2024-05-26 23:16:25'),
(57, 57, 1, 5, 'Robot assistant domestique, très avancé. J\'espère qu\'il ne se rebellera pas.', '2024-05-26 23:16:25'),
(58, 58, 1, 4, 'Chargeur solaire portable, très pratique. Mais le soleil est capricieux.', '2024-05-26 23:16:25'),
(59, 59, 1, 5, 'Lampe LED à contrôle gestuel, très innovante. Parfaite pour les geeks.', '2024-05-26 23:16:25'),
(60, 60, 1, 4, 'Casque de musique à conduction osseuse, très confortable. Un peu bizarre au début.', '2024-05-26 23:16:25'),
(69, 25, 1, 5, 'Il est bien goulu.', '2024-05-27 19:31:16'),
(70, 1, 5, 1, 'Une hache en silex... sérieusement ? On est en -3500 et on n\'a rien de mieux ?', '2024-05-27 21:22:46'),
(71, 1, 6, 3, 'Une hache de plus. Elle fait le job.', '2024-05-27 21:22:46'),
(72, 1, 7, 5, 'Wow, cette hache en silex est vraiment bien faite et super pratique pour la chasse!', '2024-05-27 21:22:46'),
(73, 2, 5, 1, 'Un collier en os et dents de loup, parfait pour effrayer les voisins. Bravo...', '2024-05-27 21:22:46'),
(74, 2, 6, 2, 'Un autre collier. J\'ai déjà vu mieux.', '2024-05-27 21:22:46'),
(75, 2, 7, 4, 'Ce collier en os et dents de loup est tellement impressionnant, un vrai bijou!', '2024-05-27 21:22:46'),
(76, 3, 5, 1, 'Une cape en peau de bison ? Parfait pour les soirées déguisées chez les mammouths.', '2024-05-27 21:22:46'),
(77, 3, 6, 4, 'Encore une cape. Au moins, elle est chaude.', '2024-05-27 21:22:46'),
(78, 3, 7, 4, 'La cape en peau de bison est parfaite pour les nuits froides, vraiment géniale!', '2024-05-27 21:22:46'),
(79, 4, 5, 2, 'Un pot en argile cuite. J\'espère qu\'il ne fuit pas comme le dernier.', '2024-05-27 21:22:46'),
(80, 4, 6, 3, 'Un pot en argile, pratique pour les grains.', '2024-05-27 21:22:46'),
(81, 4, 7, 4, 'Ce pot en argile est magnifique, parfait pour stocker des grains!', '2024-05-27 21:22:46'),
(82, 5, 5, 1, 'Encore une lance en bois, je parie qu\'elle casse à la première utilisation.', '2024-05-27 21:22:46'),
(83, 5, 6, 4, 'Une autre lance. Ça fait le boulot.', '2024-05-27 21:22:46'),
(84, 5, 7, 5, 'Cette lance en bois avec pointe en pierre est vraiment bien conçue pour la chasse!', '2024-05-27 21:22:46'),
(85, 6, 5, 1, 'Une flûte en os... parce que c\'est ce qu\'il manquait à ma collection de bric-à-brac.', '2024-05-27 21:22:46'),
(86, 6, 6, 2, 'Une flûte. Sympa pour les soirées.', '2024-05-27 21:22:46'),
(87, 6, 7, 4, 'La flûte en os est parfaite pour des soirées autour du feu!', '2024-05-27 21:22:46'),
(88, 7, 5, 2, 'Un sac en peau de chèvre. Génial pour transporter... des cailloux.', '2024-05-27 21:22:46'),
(89, 7, 6, 4, 'Un autre sac. Rien de spécial.', '2024-05-27 21:22:46'),
(90, 7, 7, 5, 'Ce sac en peau de chèvre est idéal pour les voyages, vraiment robuste!', '2024-05-27 21:22:46'),
(91, 8, 5, 1, 'Peinture rupestre... je préfère les gribouillis de mes enfants.', '2024-05-27 21:22:46'),
(92, 8, 6, 4, 'Une peinture. Rien de nouveau.', '2024-05-27 21:22:46'),
(93, 8, 7, 4, 'La peinture rupestre est vraiment inspirante, j\'aime beaucoup!', '2024-05-27 21:22:46'),
(94, 9, 5, 1, 'Un kit d\'allumage de feu. Est-ce qu\'il fonctionne au moins ?', '2024-05-27 21:22:46'),
(95, 9, 6, 4, 'Un kit pour faire du feu. Pratique.', '2024-05-27 21:22:46'),
(96, 9, 7, 4, 'Ce kit d\'allumage de feu est tellement utile pour les nuits froides!', '2024-05-27 21:22:46'),
(97, 10, 5, 1, 'Des bijoux en ivoire de mammouth. Parfait pour ceux qui aiment vivre dans le passé.', '2024-05-27 21:22:46'),
(98, 10, 6, 4, 'Des bijoux encore. Classique.', '2024-05-27 21:22:46'),
(99, 10, 7, 5, 'Les bijoux en ivoire de mammouth sont vraiment élégants, j\'adore!', '2024-05-27 21:22:46'),
(100, 11, 5, 1, 'Une amphore en céramique. Espérons qu\'elle ne casse pas au premier choc.', '2024-05-27 21:22:46'),
(101, 11, 6, 2, 'Une autre amphore. Rien de spécial.', '2024-05-27 21:22:46'),
(102, 11, 7, 4, 'Cette amphore en céramique est superbe, parfaite pour les fêtes!', '2024-05-27 21:22:46'),
(103, 12, 5, 1, 'Une tunique en lin, vraiment ? On dirait une nappe.', '2024-05-27 21:22:46'),
(104, 12, 6, 3, 'Encore une tunique. Au moins, elle est légère.', '2024-05-27 21:22:46'),
(105, 12, 7, 5, 'La tunique en lin est parfaite pour l\'été, tellement confortable!', '2024-05-27 21:22:46'),
(106, 13, 5, 2, 'Une lampe à huile. Ça ira bien avec ma collection de vieilleries.', '2024-05-27 21:22:46'),
(107, 13, 6, 2, 'Une lampe à huile. Pratique.', '2024-05-27 21:22:46'),
(108, 13, 7, 4, 'Cette lampe à huile en terre cuite est vraiment charmante, j\'adore!', '2024-05-27 21:22:46'),
(109, 14, 5, 2, 'Une statuette de déesse en bronze. Je vais l\'utiliser comme presse-papier.', '2024-05-27 21:22:46'),
(110, 14, 6, 2, 'Une autre statuette. Pas très impressionnant.', '2024-05-27 21:22:46'),
(111, 14, 7, 5, 'La statuette de déesse en bronze est magnifique, un vrai trésor!', '2024-05-27 21:22:46'),
(112, 15, 5, 2, 'Un collier en perles de verre. Vraiment ?', '2024-05-27 21:22:46'),
(113, 15, 6, 3, 'Un collier encore. Rien de spécial.', '2024-05-27 21:22:46'),
(114, 15, 7, 5, 'Ce collier en perles de verre est tellement élégant, j\'adore!', '2024-05-27 21:22:46'),
(115, 16, 5, 1, 'Des sandales en cuir, parce que marcher pieds nus c\'est trop mainstream.', '2024-05-27 21:22:46'),
(116, 16, 6, 3, 'Des sandales. Fonctionnelles.', '2024-05-27 21:22:46'),
(117, 16, 7, 5, 'Les sandales en cuir sont parfaites pour marcher dans les rues pavées!', '2024-05-27 21:22:46'),
(118, 17, 5, 1, 'Une couronne de laurier en métal doré, parfait pour se prendre pour un empereur.', '2024-05-27 21:22:46'),
(119, 17, 6, 2, 'Une couronne de plus. Mouais.', '2024-05-27 21:22:46'),
(120, 17, 7, 4, 'La couronne de laurier en métal doré est vraiment belle, symbole de triomphe!', '2024-05-27 21:22:46'),
(121, 18, 5, 2, 'Une fresque murale portable... vraiment nécessaire ?', '2024-05-27 21:22:46'),
(122, 18, 6, 2, 'Une fresque. Classique.', '2024-05-27 21:22:46'),
(123, 18, 7, 5, 'Cette fresque murale portable est magnifique, parfaite pour raconter des histoires!', '2024-05-27 21:22:46'),
(124, 19, 5, 2, 'Un parchemin écrit à la main. Encore un truc à ramasser la poussière.', '2024-05-27 21:22:46'),
(125, 19, 6, 2, 'Un parchemin de plus. Pas très excitant.', '2024-05-27 21:22:46'),
(126, 19, 7, 5, 'Le parchemin écrit à la main est un trésor de connaissances!', '2024-05-27 21:22:46'),
(127, 20, 5, 1, 'Un gladius (épée romaine). Encore une arme de plus.', '2024-05-27 21:22:46'),
(128, 20, 6, 3, 'Une épée de plus. Classique.', '2024-05-27 21:22:46'),
(129, 20, 7, 5, 'Le gladius est une arme magnifique, symbole de puissance romaine!', '2024-05-27 21:22:46'),
(130, 21, 5, 2, 'Une épée longue en acier forgé, super pour se prendre pour un chevalier.', '2024-05-27 21:22:46'),
(131, 21, 6, 2, 'Une autre épée. Pas très excitant.', '2024-05-27 21:22:46'),
(132, 21, 7, 4, 'L\'épée longue en acier forgé est parfaite pour un chevalier!', '2024-05-27 21:22:46'),
(133, 22, 5, 2, 'Une broche en argent ciselé. Très original... ou pas.', '2024-05-27 21:22:46'),
(134, 22, 6, 3, 'Une autre broche. Classique.', '2024-05-27 21:22:46'),
(135, 22, 7, 4, 'Cette broche en argent ciselé est vraiment élégante!', '2024-05-27 21:22:46'),
(136, 23, 5, 1, 'Une robe médiévale en laine. Encore une robe. Super.', '2024-05-27 21:22:46'),
(137, 23, 6, 4, 'Une autre robe. Rien de spécial.', '2024-05-27 21:22:46'),
(138, 23, 7, 5, 'La robe médiévale en laine est superbe et bien faite!', '2024-05-27 21:22:46'),
(139, 24, 5, 1, 'Un casque de chevalier. Peut-être utile pour Halloween.', '2024-05-27 21:22:46'),
(140, 24, 6, 2, 'Un autre casque. Pas très excitant.', '2024-05-27 21:22:46'),
(141, 24, 7, 5, 'Le casque de chevalier est parfait pour les batailles!', '2024-05-27 21:22:46'),
(142, 25, 5, 2, 'Une chope en étain gravé. Parfait pour la déco, je suppose.', '2024-05-27 21:22:46'),
(143, 25, 6, 2, 'Une autre chope. Bof.', '2024-05-27 21:22:46'),
(144, 25, 7, 4, 'La chope en étain gravé est parfaite pour les soirées!', '2024-05-27 21:22:46'),
(145, 26, 5, 2, 'Un bouclier en bois et cuir. Espérons qu\'il soit solide.', '2024-05-27 21:22:46'),
(146, 26, 6, 2, 'Un autre bouclier. Pas très excitant.', '2024-05-27 21:22:46'),
(147, 26, 7, 5, 'Le bouclier en bois et cuir est parfait pour les combats!', '2024-05-27 21:22:46'),
(148, 27, 5, 2, 'Un manuscrit enluminé. Bof. Encore des pages.', '2024-05-27 21:22:46'),
(149, 27, 6, 2, 'Un autre manuscrit. Classique.', '2024-05-27 21:22:46'),
(150, 27, 7, 4, 'Le manuscrit enluminé est un trésor de connaissances!', '2024-05-27 21:22:46'),
(151, 28, 5, 1, 'Une cape en laine brodée. Encore une cape. Super.', '2024-05-27 21:22:46'),
(152, 28, 6, 2, 'Une autre cape. Pas très excitant.', '2024-05-27 21:22:46'),
(153, 28, 7, 4, 'La cape en laine brodée est magnifique et bien faite!', '2024-05-27 21:22:46'),
(154, 29, 5, 1, 'Un herbier de plantes médicinales. Bof. Encore des plantes.', '2024-05-27 21:22:46'),
(155, 29, 6, 2, 'Un autre herbier. Rien de spécial.', '2024-05-27 21:22:46'),
(156, 29, 7, 5, 'L\'herbier de plantes médicinales est un trésor de savoir!', '2024-05-27 21:22:46'),
(157, 30, 5, 1, 'Un luth en bois. Super pour les soirées entre amis... ou pas.', '2024-05-27 21:22:46'),
(158, 30, 6, 3, 'Un autre luth. Pas très excitant.', '2024-05-27 21:22:46'),
(159, 30, 7, 4, 'Le luth en bois est parfait pour les soirées musicales!', '2024-05-27 21:22:46'),
(160, 31, 5, 1, 'Un globe terrestre décoratif. Qui a besoin de ça ?', '2024-05-27 21:22:46'),
(161, 31, 6, 3, 'Un autre globe. Pas très excitant.', '2024-05-27 21:22:46'),
(162, 31, 7, 5, 'Le globe terrestre décoratif est magnifique et informatif!', '2024-05-27 21:22:46'),
(163, 32, 5, 1, 'Un portrait peint à l\'huile. Juste une autre image pour les murs.', '2024-05-27 21:22:46'),
(164, 32, 6, 2, 'Un portrait. Encore un.', '2024-05-27 21:22:46'),
(165, 32, 7, 5, 'Le portrait peint à l\'huile est vraiment captivant!', '2024-05-27 21:22:46'),
(166, 33, 5, 2, 'Une robe en soie brodée. Pour ceux qui veulent se sentir comme des rois.', '2024-05-27 21:22:46'),
(167, 33, 6, 4, 'Une autre robe. Rien de spécial.', '2024-05-27 21:22:46'),
(168, 33, 7, 4, 'La robe en soie brodée est magnifique et élégante!', '2024-05-27 21:22:46'),
(169, 34, 5, 1, 'Un astrolabe en laiton. Super pour les amateurs d\'étoiles.', '2024-05-27 21:22:46'),
(170, 34, 6, 2, 'Un autre astrolabe. Classique.', '2024-05-27 21:22:46'),
(171, 34, 7, 4, 'L\'astrolabe en laiton est un outil fascinant et beau!', '2024-05-27 21:22:46'),
(172, 35, 5, 1, 'Un collier en or et émeraude. Juste ce qu\'il fallait pour attirer les voleurs.', '2024-05-27 21:22:46'),
(173, 35, 6, 4, 'Un autre collier. Pas très excitant.', '2024-05-27 21:22:46'),
(174, 35, 7, 4, 'Le collier en or et émeraude est absolument magnifique!', '2024-05-27 21:22:46'),
(175, 36, 5, 1, 'Des livres imprimés de poésie. Parfait pour les soirées ennuyeuses.', '2024-05-27 21:22:46'),
(176, 36, 6, 3, 'Des livres de poésie. Mouais.', '2024-05-27 21:22:46'),
(177, 36, 7, 5, 'Les livres imprimés de poésie sont un vrai régal pour l\'âme!', '2024-05-27 21:22:46'),
(178, 37, 5, 1, 'Une canne à pommeau sculpté. Pour ceux qui veulent marcher avec style.', '2024-05-27 21:22:46'),
(179, 37, 6, 2, 'Une autre canne. Classique.', '2024-05-27 21:22:46'),
(180, 37, 7, 4, 'La canne à pommeau sculpté est vraiment élégante!', '2024-05-27 21:22:46'),
(181, 38, 5, 1, 'Un chapeau en velours avec plume. Parfait pour les déguisements.', '2024-05-27 21:22:46'),
(182, 38, 6, 4, 'Un autre chapeau. Rien de spécial.', '2024-05-27 21:22:46'),
(183, 38, 7, 4, 'Le chapeau en velours avec plume est très chic!', '2024-05-27 21:22:46'),
(184, 39, 5, 2, 'Une viole de gambe. Pour les amateurs de musique ancienne.', '2024-05-27 21:22:46'),
(185, 39, 6, 4, 'Une autre viole. Pas très excitant.', '2024-05-27 21:22:46'),
(186, 39, 7, 5, 'La viole de gambe a un son merveilleux!', '2024-05-27 21:22:46'),
(187, 40, 5, 2, 'Un ensemble d\'échecs en ivoire et bois. Juste pour ceux qui aiment les jeux lents.', '2024-05-27 21:22:46'),
(188, 40, 6, 3, 'Un autre ensemble d\'échecs. Classique.', '2024-05-27 21:22:46'),
(189, 40, 7, 5, 'L\'ensemble d\'échecs en ivoire et bois est une œuvre d\'art!', '2024-05-27 21:22:46'),
(190, 41, 5, 2, 'Une montre de poche en or. Pour ceux qui veulent se la jouer gentleman.', '2024-05-27 21:22:46'),
(191, 41, 6, 4, 'Une autre montre. Rien de spécial.', '2024-05-27 21:22:46'),
(192, 41, 7, 4, 'La montre de poche en or est absolument magnifique!', '2024-05-27 21:22:46'),
(193, 42, 5, 2, 'Un chapeau haut-de-forme en feutre. Parfait pour se prendre pour un lord.', '2024-05-27 21:22:46'),
(194, 42, 6, 3, 'Un autre chapeau. Pas très excitant.', '2024-05-27 21:22:46'),
(195, 42, 7, 5, 'Le chapeau haut-de-forme en feutre est très élégant!', '2024-05-27 21:22:46'),
(196, 43, 5, 1, 'Un manteau en tweed. Pour les amateurs de mode vieillotte.', '2024-05-27 21:22:46'),
(197, 43, 6, 4, 'Un autre manteau. Rien de spécial.', '2024-05-27 21:22:46'),
(198, 43, 7, 5, 'Le manteau en tweed est parfait pour les matinées fraîches!', '2024-05-27 21:22:46'),
(199, 44, 5, 2, 'Une lanterne à huile en cuivre. Idéale pour les amateurs de vintage.', '2024-05-27 21:22:46'),
(200, 44, 6, 4, 'Une autre lanterne. Pas très excitant.', '2024-05-27 21:22:46'),
(201, 44, 7, 4, 'La lanterne à huile en cuivre est vraiment charmante!', '2024-05-27 21:22:46'),
(202, 45, 5, 1, 'Une machine à écrire portable. Pour ceux qui aiment l\'écriture rétro.', '2024-05-27 21:22:46'),
(203, 45, 6, 4, 'Une autre machine à écrire. Rien de spécial.', '2024-05-27 21:22:46'),
(204, 45, 7, 4, 'La machine à écrire portable est un outil fantastique!', '2024-05-27 21:22:46'),
(205, 46, 5, 1, 'Une bicyclette Penny-farthing. Super pour ceux qui aiment tomber de haut.', '2024-05-27 21:22:46'),
(206, 46, 6, 3, 'Une autre bicyclette. Classique.', '2024-05-27 21:22:46'),
(207, 46, 7, 5, 'La bicyclette Penny-farthing est vraiment unique!', '2024-05-27 21:22:46'),
(208, 47, 5, 1, 'Un ensemble de thé en porcelaine. Idéal pour les amateurs de thé.', '2024-05-27 21:22:46'),
(209, 47, 6, 4, 'Un autre ensemble de thé. Pas très excitant.', '2024-05-27 21:22:46'),
(210, 47, 7, 4, 'L\'ensemble de thé en porcelaine est très raffiné!', '2024-05-27 21:22:46'),
(211, 48, 5, 1, 'Une carte du monde encadrée. Super pour les amateurs de géographie.', '2024-05-27 21:22:46'),
(212, 48, 6, 3, 'Une autre carte. Classique.', '2024-05-27 21:22:46'),
(213, 48, 7, 5, 'La carte du monde encadrée est magnifique!', '2024-05-27 21:22:46'),
(214, 49, 5, 2, 'Des jumelles en cuir et laiton. Pour ceux qui aiment espionner.', '2024-05-27 21:22:46'),
(215, 49, 6, 3, 'Un autre paire de jumelles. Pas très excitant.', '2024-05-27 21:22:46'),
(216, 49, 7, 5, 'Les jumelles en cuir et laiton sont parfaites pour les explorations!', '2024-05-27 21:22:46'),
(217, 50, 5, 1, 'Un canevas brodé. Pour les amateurs d\'artisanat.', '2024-05-27 21:22:46'),
(218, 50, 6, 4, 'Un autre canevas. Rien de spécial.', '2024-05-27 21:22:46'),
(219, 50, 7, 4, 'Le canevas brodé est très joli!', '2024-05-27 21:22:46'),
(220, 51, 5, 1, 'Une smartwatch holographique. Pour ceux qui veulent impressionner.', '2024-05-27 21:22:46'),
(221, 51, 6, 2, 'Une autre smartwatch. Rien de spécial.', '2024-05-27 21:22:46'),
(222, 51, 7, 5, 'La smartwatch holographique est incroyable!', '2024-05-27 21:22:46'),
(223, 52, 5, 2, 'Des lunettes de réalité augmentée. Idéales pour les amateurs de technologie.', '2024-05-27 21:22:46'),
(224, 52, 6, 2, 'Une autre paire de lunettes. Pas très excitant.', '2024-05-27 21:22:46'),
(225, 52, 7, 5, 'Les lunettes de réalité augmentée sont fascinantes!', '2024-05-27 21:22:46'),
(226, 53, 5, 1, 'Une combinaison spatiale légère. Parfait pour ceux qui veulent jouer aux astronautes.', '2024-05-27 21:22:46'),
(227, 53, 6, 2, 'Une autre combinaison. Classique.', '2024-05-27 21:22:46'),
(228, 53, 7, 5, 'La combinaison spatiale légère est vraiment bien conçue!', '2024-05-27 21:22:46'),
(229, 54, 5, 1, 'Un drone personnel de transport. Pour ceux qui détestent marcher.', '2024-05-27 21:22:46'),
(230, 54, 6, 3, 'Un autre drone. Rien de spécial.', '2024-05-27 21:22:46'),
(231, 54, 7, 5, 'Le drone personnel de transport est fantastique!', '2024-05-27 21:22:46'),
(232, 55, 5, 1, 'Un panneau de commande domestique intelligent. Pour les amateurs de gadgets.', '2024-05-27 21:22:46'),
(233, 55, 6, 3, 'Un autre panneau de commande. Classique.', '2024-05-27 21:22:46'),
(234, 55, 7, 4, 'Le panneau de commande domestique intelligent est très pratique!', '2024-05-27 21:22:46'),
(235, 56, 5, 1, 'Un kit de jardinage hydroponique. Pour ceux qui aiment les plantes futuristes.', '2024-05-27 21:22:46'),
(236, 56, 6, 3, 'Un autre kit de jardinage. Rien de spécial.', '2024-05-27 21:22:46'),
(237, 56, 7, 4, 'Le kit de jardinage hydroponique est vraiment innovant!', '2024-05-27 21:22:46'),
(238, 57, 5, 2, 'Un robot assistant domestique. Pour ceux qui détestent faire les corvées.', '2024-05-27 21:22:46'),
(239, 57, 6, 3, 'Un autre robot. Classique.', '2024-05-27 21:22:46'),
(240, 57, 7, 5, 'Le robot assistant domestique est très utile!', '2024-05-27 21:22:46'),
(241, 58, 5, 2, 'Un chargeur solaire portable. Pour ceux qui veulent être écolos.', '2024-05-27 21:22:46'),
(242, 58, 6, 3, 'Un autre chargeur. Rien de spécial.', '2024-05-27 21:22:46'),
(243, 58, 7, 4, 'Le chargeur solaire portable est très pratique!', '2024-05-27 21:22:46'),
(244, 59, 5, 2, 'Une lampe LED à contrôle gestuel. Parfait pour les amateurs de technologie.', '2024-05-27 21:22:46'),
(245, 59, 6, 4, 'Une autre lampe. Classique.', '2024-05-27 21:22:46'),
(246, 59, 7, 5, 'La lampe LED à contrôle gestuel est vraiment cool!', '2024-05-27 21:22:46'),
(247, 60, 5, 1, 'Un casque de musique à conduction osseuse. Pour ceux qui veulent se démarquer.', '2024-05-27 21:22:46'),
(248, 60, 6, 4, 'Un autre casque. Pas très excitant.', '2024-05-27 21:22:46'),
(249, 60, 7, 4, 'Le casque de musique à conduction osseuse est fantastique!', '2024-05-27 21:22:46');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
