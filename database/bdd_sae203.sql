-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 25 mai 2024 à 19:38
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
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL,
  `seller_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `sale_year` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`article_id`, `subcategory_id`, `seller_id`, `title`, `description`, `price`, `sale_year`, `stock`, `created_at`, `updated_at`, `image_url`) VALUES
(1, 1, 1, 'Hache en silex', 'Pierre forte, coupée par nos mains, pour chasser et protéger. Elle fend bois et bête, garde tribu en sécurité.', 1.50, -3500, 15, '2024-05-16 00:37:00', '2024-05-16 00:37:00', 'neolithique/hache-en-silex.webp'),
(2, 2, 2, 'Collier en os et dents de loup', 'Collier de victoire, dents de loup pour montrer force. Porté pour rappeler courage et survie face à la bête.', 0.80, -3480, 30, '2024-05-14 18:43:00', '2024-05-14 18:43:00', 'neolithique/collier-en-os-et-dents-de-loup.webp'),
(3, 3, 3, 'Cape en peau de bison', 'Peau de bison, forte contre vent et froid. Chaude pour les nuits, protège corps et os dans les plaines.', 2.00, -3475, 8, '2024-05-14 23:44:00', '2024-05-14 23:44:00', 'neolithique/cape-en-peau-de-bison.webp'),
(4, 3, 4, 'Pot en argile cuite', 'Mains d\'anciens façonnent argile. Pot garde grain et eau, essentiel pour vie sédentaire de tribu.', 1.00, -3460, 20, '2024-05-16 04:29:00', '2024-05-16 04:29:00', 'neolithique/pot-en-argile-cuite.webp'),
(5, 1, 5, 'Lance en bois avec pointe en pierre', 'Bois et pierre, assemblés pour défendre et chasser. Arme de choix pour guerrier de tribu.', 1.20, -3440, 25, '2024-05-15 01:27:00', '2024-05-15 01:27:00', 'neolithique/lance-en-bois-avec-pointe-en-pierre.webp'),
(6, 3, 6, 'Flûte en os', 'Os transformé en chant. Flûte appelle esprits, unit tribu sous étoiles et feu.', 0.70, -3430, 40, '2024-05-13 21:02:00', '2024-05-13 21:02:00', 'neolithique/flute-en-os.webp'),
(7, 3, 7, 'Sac en peau de chèvre', 'Sac de peau pour porter fruits de terre, trouvailles de voyage. Fort pour grandes migrations.', 0.90, -3470, 10, '2024-05-14 12:27:00', '2024-05-14 12:27:00', 'neolithique/sac-en-peau-de-chevre.webp'),
(8, 2, 3, 'Peinture rupestre sur plaque de pierre', 'Pierre et bois, outils pour faire feu. Feu pour nuit et froid, cadeau des esprits à tribu.', 2.50, -3485, 5, '2024-05-15 08:56:00', '2024-05-15 08:56:00', 'neolithique/peinture-rupestre-sur-plaque-de-pierre.webp'),
(9, 1, 5, 'Kit d\'allumage de feu', 'Ivoire de mammouth, sculpté en bijoux. Raconte grandeur de chasse, montre force de tribu face aux géants.', 0.50, -3490, 50, '2024-05-13 19:40:00', '2024-05-13 19:40:00', 'neolithique/kit-dallumage-de-feu.webp'),
(10, 2, 2, 'Bijoux en ivoire de mammouth', 'Ces bijouxfaçonnés dans l\'ivoire de mammouthracontent l\'histoire de notre domination sur les géants de la glace.', 3.00, -3500, 12, '2024-05-13 15:08:00', '2024-05-13 15:08:00', 'neolithique/replique-de-bijoux-en-ivoire-de-mammouth.webp'),
(11, 4, 8, 'Amphore en céramique', 'Œuvre exquise de notre céramique, créée pour les libations sacrées lors de festivités grandioses. Chaque amphore est une compagne fidèle dans les cérémonies où le vin coule en abondance.', 25.00, -450, 15, '2024-05-17 00:14:00', '2024-05-17 00:14:00', 'antiquite/amphore-en-ceramique.webp'),
(12, 4, 9, 'Tunique en lin', 'Légère comme la brise d\'été, cette tunique de lin finement tissée capture l\'essence de la beauté athénienne. Idéale pour les réunions en plein air, elle est le vêtement préféré des citoyens érudits et éloquents.', 20.00, -440, 20, '2024-05-16 22:01:00', '2024-05-16 22:01:00', 'antiquite/tunique-en-lin.webp'),
(13, 6, 8, 'Lampe à huile en terre cuite', 'Forgée de la terre bénie de notre cité, cette lampe dispense la lumière d\'Hestia au sein de chaque demeure. Son éclat guide les prières nocturnes et illumine les passages des temples sacrés.', 7.50, -430, 22, '2024-05-16 18:08:00', '2024-05-16 18:08:00', 'antiquite/lampe-a-huile-en-terre-cuite.webp'),
(14, 5, 10, 'Statuette de déesse en bronze', 'Sculptée pour faire honneur aux soldats qui protègent notre cité, cette statuette en bronze est l\'incarnation même de la majesté. Elle trône au cœur des foyers comme gardienne de notre héritage.', 50.00, -440, 8, '2024-05-15 12:18:00', '2024-05-15 12:18:00', 'antiquite/statuette-de-deesse-en-bronze.webp'),
(15, 4, 11, 'Collier en perles de verre', 'Ce collier, où chaque perle soufflée capture l\'éther du ciel et l\'abysse de la mer, est une parure de noblesse. Porté par les élites, il reflète la lumière des astres et l\'opulence de notre culture.', 12.50, -450, 18, '2024-05-17 08:15:00', '2024-05-17 08:15:00', 'antiquite/collier-en-perles-de-verre.webp'),
(16, 4, 12, 'Sandales en cuir', 'Ciselées pour les sages, ces sandales en cuir sont taillées pour arpenter les avenues de marbre. Elles sont le choix des poètes qui chantent nos exploits et des philosophes qui méditent sur les vérités éternelles.', 15.00, -455, 25, '2024-05-16 07:51:00', '2024-05-16 07:51:00', 'antiquite/sandales-en-cuir.webp'),
(17, 5, 13, 'Couronne de laurier en métal doré', 'Symbole de triomphe et de gloire, cette couronne de laurier est accordée par Apollon aux conquérants. Elle couronne les têtes des héros, récompensant leurs victoires et célébrant leur ascension vers l\'immortalité.', 30.00, -460, 5, '2024-05-17 12:53:00', '2024-05-17 12:53:00', 'antiquite/couronne-de-laurier-en-metal-dore.webp'),
(18, 5, 11, 'Fresque murale portable', 'Une fresque vibrante qui transporte les légendes de notre peuple à travers les âges. Portative, elle permet de diffuser les récits mythiques et les enseignements des ancêtres, enrichissant chaque génération nouvelle.', 60.00, -470, 4, '2024-05-14 15:59:00', '2024-05-14 15:59:00', 'antiquite/fresque-murale-portable.webp'),
(19, 6, 13, 'Parchemin écrit à la main', 'Inscrit avec soin par les scribes les plus érudits, ce parchemin détient les lois et la sagesse de notre cité. Il est un trésor de connaissances, une relique sacrée portant les mots des grands penseurs et des législateurs.', 22.50, -475, 9, '2024-05-17 05:33:00', '2024-05-17 05:33:00', 'antiquite/parchemin-ecrit-a-la-main.webp'),
(20, 6, 14, 'Gladius (épée romaine)', 'Forge dans les flammes de Vulcain, ce gladius est le fidèle compagnon du légionnaire romain. Trempé pour résister aux rigueurs du combat, il est un symbole de la puissance et de la résolution de Rome, garantissant la victoire sur les champs de bataille.', 75.00, -100, 10, '2024-05-16 19:17:00', '2024-05-16 19:17:00', 'antiquite/gladius(epee-romaine).webp'),
(21, 7, 15, 'Épée longue en acier forgé', 'Au cœur du brasier de notre forge, naît cette épée, symbole de la vaillance et de l\'honneur chevaleresque. Sa lame, aiguisée et fidèle, est prête à défendre la justice et à servir le bras des preux.', 250.00, 1250, 6, '2024-05-17 14:15:00', '2024-05-17 14:15:00', 'moyen-age/epee-longue-en-acier-forge.webp'),
(22, 8, 16, 'Broche en argent ciselé ', 'Par l\'habileté de nos orfèvres, cette broche d\'argent s\'orne de délicats motifs, capturant la lumière des bougies en nos halls. Elle scintille, telle une étoile au firmament, lors des festins et des bals.', 35.00, 1260, 15, '2024-05-17 10:55:00', '2024-05-17 10:55:00', 'moyen-age/broche-en-argent-cisele.webp'),
(23, 8, 17, 'Robe médiévale en laine', 'Tissée par les mains vertueuses des femmes de notre village, cette robe drapée de laine est l\'apanage des dames de haute lignée. Ornée de fines broderies, elle raconte les sagas de nos ancêtres, tissées en fils d\'or et d\'argent.', 90.00, 1275, 12, '2024-05-15 17:10:00', '2024-05-15 17:10:00', 'moyen-age/robe-medievale-en-laine.webp'),
(24, 7, 18, 'Casque de chevalier', 'Forgé dans le fer robuste et bénit par les prières de nos forgerons, ce heaume est le sanctuaire du guerrier. Il a vu maintes joutes et a trempé dans le sang des batailles, un rempart contre les flèches de la fortune.', 150.00, 1300, 7, '2024-05-15 21:48:00', '2024-05-15 21:48:00', 'moyen-age/casque-de-chevalier.webp'),
(25, 8, 19, 'Chope en étain gravé', 'Gravée de blasons nobles, cette chope d\'étain voyage de main en main lors des longues veillées. Compagne des récits épiques, elle est le gobelet des héros, témoin de serments et de toasts.', 25.00, 1285, 30, '2024-05-16 05:23:00', '2024-05-16 05:23:00', 'moyen-age/chope-en-etain-grave.webp'),
(26, 7, 18, 'Bouclier en bois et cuir', 'Ce bouclier, fidèle gardien du chevalier, est bâti de bois solide et bardé de cuir. Il a paré maints coups et protégé les valeureux dans l\'ardeur des combats, son écu est blason de courage.', 100.00, 1295, 9, '2024-05-18 11:51:00', '2024-05-18 11:51:00', 'moyen-age/bouclier-en-bois-et-cuir.webp'),
(27, 9, 20, 'Manuscrit enluminé', 'En ces pages se dévoile le savoir ancestral, chaque feuille richement enluminée par les moines érudits de notre abbaye. Cet ouvrage est un trésor de connaissance, un pont entre le divin et le terrestre.', 400.00, 1260, 5, '2024-05-15 18:39:00', '2024-05-15 18:39:00', 'moyen-age/manuscrit-enlumine-min.webp'),
(28, 8, 16, 'Cape en laine brodée', 'Cette cape, tissée dans la plus fine laine et brodée de symboles de notre héritage, enveloppe le noble dans les brumes du matin. Elle est à la fois bouclier contre le froid et étendard de son rang.', 120.00, 1270, 14, '2024-05-15 17:32:00', '2024-05-15 17:32:00', 'moyen-age/cape-en-laine-brodee.webp'),
(29, 9, 21, 'Herbier de plantes médicinales', 'Compilé avec soin par la sage femme de notre village, cet herbier recèle le pouvoir des herbes guérisseuses. Chaque plante est cueillie sous un signe favorable, un remède contre les maux du corps et de l\'esprit.', 50.00, 1300, 20, '2024-05-17 07:00:00', '2024-05-17 07:00:00', 'moyen-age/herbier-de-plantes-medicinales.webp'),
(30, 9, 19, 'Luth en bois', 'Ciselé avec passion, ce luth est l\'âme de la ménestrelle, éveillant les cœurs endormis et les esprits mélancoliques. Ses cordes chantent les louanges des héros et les lamentations des amants perdus.', 70.00, 1255, 15, '2024-05-17 09:12:00', '2024-05-17 09:12:00', 'moyen-age/luth-en-bois.webp'),
(31, 10, 21, 'Globe terrestre décoratif', 'Ce globe, peint avec une finesse exquise à la main, révèle les continents et les vastes océans. Il sert non seulement d\'instrument pour les érudits mais aussi d\'ornement majestueux dans les salons des nobles, où il inspire admiration et conversation.', 600.00, 1550, 10, '2024-05-17 01:36:00', '2024-05-17 01:36:00', 'renaissance/globe-terrestre-decoratif.webp'),
(32, 11, 22, 'Portrait peint à l\'huile', 'Peint avec une attention méticuleuse aux détails, ce portrait ne capte pas seulement le visage mais aussi l\'âme de son sujet, reflétant les idéaux de beauté et d\'expression propres à notre glorieuse Renaissance.', 1000.00, 1530, 3, '2024-05-19 05:33:00', '2024-05-19 05:33:00', 'renaissance/portrait-peint-a-l-huile.webp'),
(33, 12, 23, 'Robe en soie brodée', 'Cette robe, en soie aussi douce que le souffle d\'un ange, est ornée de broderies fines illustrant les floraisons du printemps italien. Elle est la quintessence de l\'élégance et du raffinement, digne des plus gracieuses dames de la cour.', 700.00, 1520, 5, '2024-05-19 04:48:00', '2024-05-19 04:48:00', 'renaissance/robe-en-soie-brodee.webp'),
(34, 10, 21, 'Astrolabe en laiton', 'Cet instrument précieux, forgé en laiton, a guidé les navigateurs audacieux vers des terres inexplorées, illustrant la puissance de l\'ingéniosité humaine et notre quête incessante de connaissance.', 500.00, 1535, 12, '2024-05-19 03:04:00', '2024-05-19 03:04:00', 'renaissance/astrolabe-en-laiton.webp'),
(35, 11, 24, 'Collier en or et émeraude', 'Ce collier, où l\'or le plus pur rencontre la brillance des émeraudes, est le symbole du luxe et du pouvoir. Porté par les plus grands de notre temps, il est un témoignage de richesse et de majesté incontestées.', 900.00, 1540, 4, '2024-05-19 00:51:00', '2024-05-19 00:51:00', 'renaissance/collier-en-or-et-emeraude.webp'),
(36, 11, 25, 'Livres imprimés de poésie', 'En ces volumes, la prose des poètes de notre ère s\'épanouit, capturant l\'essence même des passions et des contemplations humaines. Chaque livre, imprimé avec un soin méticuleux, est un véritable trésor pour l\'esprit et l\'âme, enrichissant tous ceux qui le', 300.00, 1530, 20, '2024-05-16 22:32:00', '2024-05-16 22:32:00', 'renaissance/livres-imprimes-de-poesie.webp'),
(37, 12, 23, 'Canne à pommeau sculpté', 'Ornée d\'un pommeau finement sculpté, cette canne fusionne fonctionnalité et art. Chaque détail du pommeau raconte une histoire de puissance et de prestige, destinée à reposer dans les mains des nobles, affirmant leur statut élevé.', 240.00, 1545, 8, '2024-05-16 22:19:00', '2024-05-16 22:19:00', 'renaissance/canne-a-pommeau-sculpte.webp'),
(38, 12, 26, 'Chapeau en velours avec plume', 'Ce chapeau en velours, surmonté d\'une plume imposante, est le symbole du raffinement de la Renaissance. Adopté par les élites, il déclare un statut social et un style sans égal, reflétant l\'opulence de notre époque.', 150.00, 1555, 10, '2024-05-18 15:08:00', '2024-05-18 15:08:00', 'renaissance/chapeau-en-velours-avec-plume.webp'),
(39, 12, 19, 'Viole de gambe (instrument à cordes)', 'Avec ses cordes harmonieuses, la viole de gambe charme les mélomanes de notre ère. Son timbre riche et profond séduit et enchante dans les salles ornées de nos palais, célébrant la richesse musicale de la Renaissance.', 360.00, 1560, 6, '2024-05-19 00:24:00', '2024-05-19 00:24:00', 'renaissance/viole-de-gambe-(instrument-a-cordes).webp'),
(40, 11, 26, 'Ensemble d\'échecs en ivoire et bois', 'Façonné dans l\'ivoire et le bois précieux, cet ensemble d\'échecs n\'est pas seulement un jeu mais une véritable œuvre d\'art. Chaque pièce, sculptée avec perfection, représente les dignitaires de la cour royale, invitant à un duel intellectuel aussi élégant', 400.00, 1570, 5, '2024-05-19 01:13:00', '2024-05-19 01:13:00', 'renaissance/ensemble-d-echecs-en-ivoire-et-bois.webp'),
(41, 15, 28, 'Montre de poche en or', 'Un véritable joyau d\'horlogerie, cette montre en or incrustée est le summum de l\'élégance et de la précision. Essentielle pour tout gentleman désirant mesurer le temps avec raffinement et distinction.', 250.00, 1890, 4, '2024-05-19 05:27:00', '2024-05-19 05:27:00', 'epoque-moderne/montre-de-poche-en-or.webp'),
(42, 15, 29, 'Chapeau haut-de-forme en feutre', 'Indispensable à l\'ensemble de tout gentleman, ce chapeau haut-de-forme en feutre, d\'une finesse remarquable, rehausse l\'apparence avec une majesté inégalée.', 15.00, 1865, 20, '2024-05-20 06:20:00', '2024-05-20 06:20:00', 'epoque-moderne/chapeau-haut-de-forme-en-feutre.webp'),
(43, 15, 30, 'Manteau en tweed', 'Conçu pour les matinées fraîches d\'Angleterre, ce manteau en tweed robuste allie fonctionnalité et élégance, une pièce maîtresse pour toute garde-robe distinguée.', 50.00, 1880, 15, '2024-05-19 09:07:00', '2024-05-19 09:07:00', 'epoque-moderne/manteau-en-tweed.webp'),
(44, 14, 31, 'Lanterne à huile en cuivre', 'Cette lanterne en cuivre, ornée de motifs délicatement gravés, éclaire les ruelles sombres, apportant lumière et sécurité, un indispensable pour les noctambules de la ville.', 30.00, 1870, 25, '2024-05-18 06:06:00', '2024-05-18 06:06:00', 'epoque-moderne/lanterne-a-huile-en-cuivre.webp'),
(45, 13, 32, 'Machine à écrire portable', 'Révolutionnaire, cette machine à écrire portable permet aux auteurs de saisir leurs pensées en tout lieu et à tout moment, un complice pour l\'expression littéraire en cette ère d\'innovation.', 100.00, 1895, 18, '2024-05-18 19:34:00', '2024-05-18 19:34:00', 'epoque-moderne/machine-a-ecrire-portable.webp'),
(46, 13, 32, 'Bicyclette Penny-farthing', 'Emblème de l\'innovation technique du 19e siècle, le Penny-farthing, avec sa roue avant imposante, promet une expérience de cyclisme exaltante et distinguée à travers les avenues citadines.', 120.00, 1885, 10, '2024-05-18 14:48:00', '2024-05-18 14:48:00', 'epoque-moderne/bicyclette-penny-farthing.webp'),
(47, 14, 33, 'Ensemble de thé en porcelaine', 'Peint à la main avec une grâce raffinée, cet ensemble de thé en porcelaine est parfait pour les réceptions de l\'après-midi, où la détente se marie avec des conversations cultivées.', 60.00, 1875, 22, '2024-05-18 19:02:00', '2024-05-18 19:02:00', 'epoque-moderne/ensemble-de-the-en-porcelaine.webp'),
(48, 13, 34, 'Carte du monde encadrée', 'Cette carte, méticuleusement encadrée, détaille les découvertes géographiques récentes, invitant les esprits curieux à explorer le monde connu et ses mystères encore cachés.', 25.00, 1850, 12, '2024-05-19 22:13:00', '2024-05-19 22:13:00', 'epoque-moderne/carte-du-monde-encadree.webp'),
(49, 14, 34, 'Jumelles en cuir et laiton', 'Ces jumelles, conçues pour l\'explorateur moderne, offrent une vue claire et précise des horizons lointains, ouvrant des fenêtres sur des mondes nouveaux et des possibilités sans fin.', 45.00, 1860, 15, '2024-05-18 20:34:00', '2024-05-18 20:34:00', 'epoque-moderne/jumelles-en-cuir-et-laiton.webp'),
(50, 15, 35, 'Canevas brodé', 'Ce canevas, brodé avec une minutie exemplaire, raconte des légendes du folklore, chaque point coloré capturant les traditions et les récits de notre riche héritage culturel.', 40.00, 1840, 20, '2024-05-18 08:36:00', '2024-05-18 08:36:00', 'epoque-moderne/canevas-brode.webp'),
(51, 16, 36, 'Smartwatch holographique', 'Explorez les dimensions avancées de la connectivité avec cette montre intelligente révolutionnaire, projetant des informations en hologrammes 3D. Idéale pour naviguer dans un monde dynamique et en constante mutation.', 2500.00, 2045, 30, '2024-05-21 12:01:00', '2024-05-21 12:01:00', 'futur/smartwatch-holographique.webp'),
(52, 16, 37, 'Lunettes de réalité augmentée', 'Ces lunettes, au design minimaliste, fusionnent les données virtuelles avec le monde réel, ouvrant des panoramas inédits de perception et d\'interaction. Plongez dans une réalité augmentée sans précédent.', 2250.00, 2040, 25, '2024-05-20 16:52:00', '2024-05-20 16:52:00', 'futur/lunettes-de-realite-augmentee.webp'),
(53, 18, 38, 'Combinaison spatiale légère', 'Conçue pour l\'ère de l\'exploration interstellaire, cette combinaison spatiale ultralégère et résistante définit le nouveau standard pour les frontières cosmiques. Préparez-vous à conquérir l\'espace avec une technologie qui dépasse l\'imaginable.', 4000.00, 2050, 8, '2024-05-20 05:59:00', '2024-05-20 05:59:00', 'futur/combinaison-spatiale-legere.webp'),
(54, 16, 39, 'Drone personnel de transport', 'Réinventez vos déplacements avec ce drone personnel, alliant vitesse, sécurité et une esthétique hors du commun. Transformez chaque voyage en une expérience fluide et stylée.', 5000.00, 2055, 5, '2024-05-19 19:46:00', '2024-05-19 19:46:00', 'futur/drone-personnel-de-transport.webp'),
(55, 16, 40, 'Panneau de commande domestique intelligent', 'Au cœur de la maison connectée, ce panneau de commande intelligent orchestre tous vos appareils domestiques avec une efficacité et une intuitivité sans égales. Gérez votre espace de vie avec une précision futuriste.', 1500.00, 2048, 15, '2024-05-20 19:28:00', '2024-05-20 19:28:00', 'futur/panneau-de-commande-domestique-intelligent.webp'),
(56, 18, 41, 'Kit de jardinage hydroponique', 'Cultivez l\'avenir avec ce kit hydroponique, exploitant des technologies avancées pour un développement rapide et sain de vos plantes. Un jardin futuriste à votre portée, combinant écologie et performance.', 1750.00, 2052, 12, '2024-05-21 09:48:00', '2024-05-21 09:48:00', 'futur/kit-de-jardinage-hydroponique.webp'),
(57, 17, 39, 'Robot assistant domestique', 'Votre nouveau compagnon quotidien, ce robot assistant utilise l\'intelligence artificielle pour améliorer votre quotidien de manière proactive. Découvrez l\'assistance personnalisée à l\'ère de l\'automatisation.', 4500.00, 2050, 6, '2024-05-20 20:49:00', '2024-05-20 20:49:00', 'futur/robot-assistant-domestique.webp'),
(58, 18, 40, 'Chargeur solaire portable', 'Ce chargeur solaire portable, à la fois écologique et efficace, vous permet de recharger vos appareils où que vous soyez, utilisant uniquement l\'énergie solaire. Une solution durable pour une mobilité totale.', 750.00, 2047, 20, '2024-05-20 05:17:00', '2024-05-20 05:17:00', 'futur/chargeur-solaire-portable.webp'),
(59, 17, 38, 'Lampe LED à contrôle gestuel', 'Contrôlez l\'illumination de votre environnement avec cette lampe LED révolutionnaire. Ajustez l\'éclairage par de simples gestes, sans contact, pour une ambiance totalement adaptée à vos besoins.', 600.00, 2046, 25, '2024-05-19 18:54:00', '2024-05-19 18:54:00', 'futur/lampe-led-a-controle-gestuel.webp'),
(60, 17, 42, 'Casque de musique à conduction osseuse', 'Révolutionnez votre manière d\'écouter de la musique avec ce casque à conduction osseuse, transmettant le son directement via les os de votre crâne. Profitez d\'une clarté sonore incomparable sans isoler vos oreilles du monde extérieur.', 1250.00, 2051, 10, '2024-05-19 09:14:00', '2024-05-19 09:14:00', 'futur/casque-de-musique-a-conduction-osseuse.webp');

-- --------------------------------------------------------

--
-- Structure de la table `articles_keywords`
--

CREATE TABLE `articles_keywords` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `keyword_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `articles_keywords`
--

INSERT INTO `articles_keywords` (`article_id`, `keyword_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 1),
(5, 13),
(5, 3),
(6, 14),
(6, 5),
(6, 15),
(7, 16),
(7, 8),
(7, 17),
(8, 18),
(8, 19),
(8, 20),
(9, 21),
(9, 22),
(9, 23),
(10, 4),
(10, 24),
(10, 25),
(11, 10),
(11, 26),
(11, 27),
(12, 7),
(12, 28),
(12, 29),
(13, 30),
(13, 31),
(13, 2),
(14, 32),
(14, 33),
(14, 34),
(15, 4),
(15, 35),
(15, 36),
(16, 37),
(16, 38),
(16, 39),
(17, 40),
(17, 41),
(17, 42),
(18, 18),
(18, 43),
(18, 44),
(19, 45),
(19, 46),
(19, 47),
(20, 48),
(20, 49),
(20, 50),
(21, 48),
(21, 51),
(21, 52),
(22, 4),
(22, 53),
(22, 54),
(23, 7),
(23, 55),
(23, 56),
(24, 57),
(24, 58),
(24, 59),
(25, 60),
(25, 61),
(25, 62),
(26, 63),
(26, 13),
(26, 64),
(27, 65),
(27, 66),
(27, 45),
(28, 7),
(28, 55),
(28, 67),
(29, 68),
(29, 69),
(29, 70),
(30, 14),
(30, 71),
(30, 13),
(31, 72),
(31, 73),
(31, 74),
(32, 75),
(32, 31),
(32, 18),
(33, 7),
(33, 76),
(33, 67),
(34, 77),
(34, 78),
(34, 79),
(35, 4),
(35, 80),
(35, 81),
(36, 82),
(36, 83),
(36, 84),
(37, 85),
(37, 86),
(37, 87),
(38, 88),
(38, 89),
(38, 90),
(39, 15),
(39, 91),
(39, 14),
(40, 92),
(40, 24),
(40, 93),
(41, 94),
(41, 95),
(41, 80),
(42, 88),
(42, 96),
(42, 36),
(43, 97),
(43, 98),
(43, 99),
(44, 100),
(44, 101),
(44, 30),
(45, 102),
(45, 103),
(45, 45),
(46, 104),
(46, 105),
(46, 17),
(47, 106),
(47, 107),
(47, 108),
(48, 109),
(48, 110),
(48, 111),
(49, 112),
(49, 113),
(49, 114),
(50, 115),
(50, 116),
(50, 52),
(51, 117),
(51, 118),
(51, 119),
(52, 120),
(52, 121),
(52, 119),
(53, 122),
(53, 123),
(53, 119),
(54, 124),
(54, 125),
(54, 17),
(55, 126),
(55, 127),
(55, 128),
(56, 129),
(56, 130),
(56, 131),
(57, 132),
(57, 133),
(57, 119),
(58, 134),
(58, 135),
(58, 103),
(59, 136),
(59, 137),
(59, 138),
(60, 58),
(60, 14),
(60, 139);

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `currency_icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `currency_name`, `currency_rate`, `tltn_image_filename`, `currency_icon`) VALUES
(1, 'Néolithique', 'Marchez sur les traces de vos ancêtres du Néolithique, où la terre et la pierre façonnent notre quotidien. Venez échanger vos récits près des feux de camp et troquez vos coquillages contre nos haches taillées et nos poteries délicatement modelées. Découvrez les charmes simples mais essentiels de la vie sédentaire.', 'coquillage', 10.00, 'thumbnail-neolithique.webp', 'currency_icons/coquillage.webp'),
(2, 'Antiquité', 'Plongez dans l\'éclat de l\'Antiquité où les philosophes, les poètes et les guerriers forgent l\'histoire. Avec quelques deniers, vous pouvez acquérir des amphores ornées des tuniques en lin fines ou même des armes dignes des grands héros de Rome et de Grèce. Rejoignez-nous dans les agoras et les forums pour célébrer les exploits et la sagesse de notre temps.', 'denier', 2.00, 'thumbnail-antiquite.webp', 'currency_icons/denier.webp'),
(3, 'Moyen-Âge', 'Entrez dans le majestueux Moyen-Âge, une époque de nobles chevaliers et de mystérieuses légendes. Échangez vos écus contre des broches, ciselées, des capes brodées ou des manuscrits précieux. Chaque objet que vous acquérez est imprégné de l\'esprit chevaleresque et du savoir ancestral de nos artisans.', 'écu', 1.00, 'thumbnail-moyenage.webp', 'currency_icons/ecu.webp'),
(4, 'Renaissance', 'Vivez la splendeur de la Renaissance où l\'art et la découverte renaissent sous un jour nouveau. Venez échanger vos florins contre des œuvres d\'art, inestimables, des instruments scientifiques avancés ou des vêtements brodés de soie qui ont charmé les cours européennes. Laissez-vous séduire par le génie de notre époque et enrichissez votre monde avec nos trésors.', 'florin', 0.50, 'thumbnail-renaissance.webp', 'currency_icons/florin.webp'),
(5, 'Époque Moderne', 'Rejoignez l\'ère de l\'innovation et du progrès durant l\'Époque Moderne. Avec quelques livres, vous pouvez vous procurer des merveilles de la technologie comme des machines à écrire portables ou des bicyclettes qui ont révolutionné nos transports. Participez au grand élan vers la modernité et laissez-vous emporter par l\'élégance et le dynamisme de notre temps.', 'livre', 1.50, 'thumbnail-moderne.webp', 'currency_icons/livre.webp'),
(6, 'Futur', 'Plongez dans le futur, un monde où la technologie et l\'innovation redéfinissent les limites du possible. Utilisez vos crédits pour acquérir des gadgets révolutionnaires tels que des smartwatches holographiques ou des robots assistants domestiques. Explorez avec nous les nouvelles frontières de l\'univers et les avancées qui transforment notre quotidien.', 'crédit', 0.20, 'thumbnail-futur.webp', 'currency_icons/credit.webp');

-- --------------------------------------------------------

--
-- Structure de la table `category_styles`
--

CREATE TABLE `category_styles` (
  `style_id` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `music_url` text DEFAULT NULL,
  `background_image_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `category_styles`
--

INSERT INTO `category_styles` (`style_id`, `category_id`, `music_url`, `background_image_url`) VALUES
(1, 1, 'https://www.youtube.com/watch?v=8myYyMg1fFE', 'https://images.unsplash.com/photo-1436657640247-282c9abfb832?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(2, 2, 'https://www.youtube.com/watch?v=tAKAkhwEf0M', 'https://image.jimcdn.com/app/cms/image/transf/dimension=2080x10000:format=jpg/path/s2217cd0bb1220415/image/i6a8db93d0691e189/version/1695812958/classical-athens-and-acropolis.jpg'),
(3, 3, 'https://www.youtube.com/watch?v=vyg5jJrZ42s', 'https://images.nightcafe.studio/jobs/bonIgRNoUWvHZo2bUlZs/bonIgRNoUWvHZo2bUlZs--1--bf3hn.jpg?tr=w-1600,c-at_max'),
(4, 4, 'https://www.youtube.com/watch?v=VeS7PxGeJJI', 'https://www.connollycove.com/wp-content/uploads/2024/03/image-1956.jpeg'),
(5, 5, 'https://www.youtube.com/watch?v=J6qIzKxmW8Y', 'https://cdn.vox-cdn.com/thumbor/N8oPhh9ueroPPQWjfN9ibvMTCEM=/0x0:1200x615/2400x1356/filters:focal(600x307:601x308)/cdn.vox-cdn.com/uploads/chorus_asset/file/13080163/V5.0.0.1447176373.jpg'),
(6, 6, 'https://www.youtube.com/watch?v=tCGQLAhhF5I', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/bbaa048a-5807-4dc1-b2d3-766796da9c8f/d83vjqq-1ec3205a-3bc5-4739-a703-075489395d4c.jpg/v1/fill/w_1024,h_547,q_75,strp/cyberpunk_cityscape_by_klauspillon_d83vjqq-fullview.jpg?token=eyJ0eXAiOiJKV1QiLC');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rating_score` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favorites`
--

CREATE TABLE `favorites` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `keywords`
--

CREATE TABLE `keywords` (
  `keyword_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `keywords`
--

INSERT INTO `keywords` (`keyword_id`, `name`) VALUES
(1, 'arme'),
(2, 'outil'),
(3, 'chasse'),
(4, 'bijou'),
(5, 'os'),
(6, 'tribal'),
(7, 'vêtement'),
(8, 'peau'),
(9, 'protection'),
(10, 'poterie'),
(11, 'argile'),
(12, 'conservation'),
(13, 'bois'),
(14, 'musique'),
(15, 'instrument'),
(16, 'sac'),
(17, 'transport'),
(18, 'art'),
(19, 'peinture'),
(20, 'pierre'),
(21, 'feu'),
(22, 'survie'),
(23, 'silex'),
(24, 'ivoire'),
(25, 'animal'),
(26, 'céramique'),
(27, 'stockage'),
(28, 'lin'),
(29, 'quotidien'),
(30, 'éclairage'),
(31, 'huile'),
(32, 'statuette'),
(33, 'bronze'),
(34, 'miniature'),
(35, 'verre'),
(36, 'élégance'),
(37, 'chaussure'),
(38, 'cuir'),
(39, 'confort'),
(40, 'couronne'),
(41, 'laurier'),
(42, 'victoire'),
(43, 'fresque'),
(44, 'transportable'),
(45, 'écriture'),
(46, 'parchemin'),
(47, 'document'),
(48, 'épée'),
(49, 'Rome'),
(50, 'combat'),
(51, 'acier'),
(52, 'artisanat'),
(53, 'argent'),
(54, 'ciselé'),
(55, 'laine'),
(56, 'femme'),
(57, 'armure'),
(58, 'casque'),
(59, 'chevalier'),
(60, 'chope'),
(61, 'étain'),
(62, 'boisson'),
(63, 'bouclier'),
(64, 'défense'),
(65, 'manuscrit'),
(66, 'enluminure'),
(67, 'broderie'),
(68, 'herbier'),
(69, 'plantes'),
(70, 'médicinal'),
(71, 'luth'),
(72, 'globe'),
(73, 'décoratif'),
(74, 'éducation'),
(75, 'portrait'),
(76, 'soie'),
(77, 'astrolabe'),
(78, 'laiton'),
(79, 'navigation'),
(80, 'or'),
(81, 'émeraude'),
(82, 'livres'),
(83, 'poésie'),
(84, 'imprimé'),
(85, 'canne'),
(86, 'pommeau'),
(87, 'sculpté'),
(88, 'chapeau'),
(89, 'velours'),
(90, 'plume'),
(91, 'cordes'),
(92, 'échecs'),
(93, 'jeu'),
(94, 'montre'),
(95, 'poche'),
(96, 'haut-de-forme'),
(97, 'manteau'),
(98, 'tweed'),
(99, 'mode'),
(100, 'lanterne'),
(101, 'cuivre'),
(102, 'machine à écrire'),
(103, 'portable'),
(104, 'bicyclette'),
(105, 'Penny-farthing'),
(106, 'thé'),
(107, 'porcelaine'),
(108, 'service'),
(109, 'carte'),
(110, 'monde'),
(111, 'exploration'),
(112, 'jumelles'),
(113, 'observation'),
(114, 'optique'),
(115, 'canevas'),
(116, 'brodé'),
(117, 'smartwatch'),
(118, 'holographique'),
(119, 'technologie'),
(120, 'lunettes'),
(121, 'réalité augmentée'),
(122, 'combinaison'),
(123, 'spatiale'),
(124, 'drone'),
(125, 'personnel'),
(126, 'panneau'),
(127, 'intelligent'),
(128, 'maison'),
(129, 'jardinage'),
(130, 'hydroponique'),
(131, 'écologie'),
(132, 'robot'),
(133, 'assistant'),
(134, 'chargeur'),
(135, 'solaire'),
(136, 'lampe'),
(137, 'LED'),
(138, 'contrôle gestuel'),
(139, 'conduction osseuse');

-- --------------------------------------------------------

--
-- Structure de la table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `name`) VALUES
(1, 'Orog le Tailleur'),
(2, 'Lena la Tisseuse'),
(3, 'Tor le Chasseur'),
(4, 'Kara la Potière'),
(5, 'Sarn le Sculpteur'),
(6, 'Bato le Musicien'),
(7, 'Nila la Guérisseuse'),
(8, 'Hephaistios le Potier'),
(9, 'Dorothea la Tisserande'),
(10, 'Phoebe la Bijoutière'),
(11, 'Julia la Peintre'),
(12, 'Gaius le Marchand'),
(13, 'Lucius le Scribe'),
(14, 'Marcus le Forgeron'),
(15, 'Alaric le Forgeron'),
(16, 'Cécile la Couturière'),
(17, 'Isolde la Brodeuse'),
(18, 'Hugo le Chevalier'),
(19, 'Tristan le Luthier'),
(20, 'Roland le Scribe'),
(21, 'Margot la Guérisseuse'),
(22, 'Francesco le Navigateur'),
(23, 'Beatrice la Peintre'),
(24, 'Giulia la Couturière'),
(25, 'Matteo le Joaillier'),
(26, 'Laura la Poétesse'),
(27, 'Roberto le Maître d\'Échecs'),
(28, 'Victor l\'Horloger'),
(29, 'Edward le Chapelier'),
(30, 'Margaret la Couturière'),
(31, 'Albert le Ferronnier'),
(32, 'Charles l\'Inventeur'),
(33, 'Elizabeth la Céramiste'),
(34, 'James l\'Explorateur'),
(35, 'Sarah la Brodeuse'),
(36, 'Neo l\'Innovateur'),
(37, 'Ava la Technologue'),
(38, 'Orion le Constructeur'),
(39, 'Elara l\'Ingénieure'),
(40, 'Titan le Concepteur'),
(41, 'Nova la Biotechnologue'),
(42, 'Atlas le Révolutionnaire');

-- --------------------------------------------------------

--
-- Structure de la table `subcategories`
--

CREATE TABLE `subcategories` (
  `subcategory_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `subcategories`
--

INSERT INTO `subcategories` (`subcategory_id`, `category_id`, `name`) VALUES
(1, 1, 'Outils et Survie'),
(2, 1, 'Art et Ornements'),
(3, 1, 'Vie Quotidienne'),
(4, 2, 'Artisanat et Mode'),
(5, 2, 'Décor et Luxe'),
(6, 2, 'Usage Quotidien et Combat'),
(7, 3, 'Armes et Armures'),
(8, 3, 'Vêtements et Accessoires'),
(9, 3, 'Art et Culture'),
(10, 4, 'Exploration et Science'),
(11, 4, 'Art et Luxe'),
(12, 4, 'Mode et Musique'),
(13, 5, 'Technologie et Transport'),
(14, 5, 'Maison et Quotidien'),
(15, 5, 'Mode et Loisirs'),
(16, 6, 'Technologie Avancée'),
(17, 6, 'Vie Quotidienne et Loisirs'),
(18, 6, 'Environnement et Énergie');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` char(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `last_connexion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `created_at`, `is_admin`, `last_connexion`) VALUES
(1, 'nawfel', 'nawfel.idaali@free.fr', '$2y$10$bQuKCibaLN6Crelr66Qtoe7nEBWzmEXDMf1E.J3dA3EBJmkYnO/za', '2024-05-18 02:07:28', 1, '2024-05-25 18:26:46'),
(2, 'test', 'random@gmail.com', '$2y$10$sGqFX3ZiA0Gh/KUTI0DqN.wTbJvW.lYCcAumiSNuHVFGSzJp1zH3u', '2024-05-20 13:16:11', 0, NULL),
(3, 'EZAEZA', 'nawfelejziao@jieza.fr', '$2y$10$RzBTHGNDNFLx6JhIs/zwBeeNtq/bYN/.wg4WIhPS6IkAXSpb8ZobG', '2024-05-20 13:17:53', 0, NULL),
(4, '6-Tadelle', 'mohamed.idaali@free.fr', '$2y$10$KoYQ8E3QPkjC4/JcBVygEuemgEVfWDjPA6RG4fJVREMl/LGfZbcUO', '2024-05-20 23:07:23', 0, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `seller_id` (`seller_id`);
ALTER TABLE `articles` ADD FULLTEXT KEY `title` (`title`,`description`);

--
-- Index pour la table `articles_keywords`
--
ALTER TABLE `articles_keywords`
  ADD KEY `article_id` (`article_id`),
  ADD KEY `keyword_id` (`keyword_id`);

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idx_category_id` (`category_id`);

--
-- Index pour la table `category_styles`
--
ALTER TABLE `category_styles`
  ADD PRIMARY KEY (`style_id`),
  ADD KEY `idx_category_id` (`category_id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `favorites`
--
ALTER TABLE `favorites`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Index pour la table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`keyword_id`);
ALTER TABLE `keywords` ADD FULLTEXT KEY `name` (`name`);

--
-- Index pour la table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`);

--
-- Index pour la table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `category_styles`
--
ALTER TABLE `category_styles`
  MODIFY `style_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `keyword_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT pour la table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `subcategory_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcategory_id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

--
-- Contraintes pour la table `articles_keywords`
--
ALTER TABLE `articles_keywords`
  ADD CONSTRAINT `articles_keywords_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`),
  ADD CONSTRAINT `articles_keywords_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`keyword_id`);

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`);

--
-- Contraintes pour la table `category_styles`
--
ALTER TABLE `category_styles`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Contraintes pour la table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`);

--
-- Contraintes pour la table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
