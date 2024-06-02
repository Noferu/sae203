-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 02 juin 2024 à 13:59
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
(21, 7, 15, 'Épée longue en acier forgé', 'Au cœur du brasier de notre forge, naît cette épée, symbole de la vaillance et de l\'honneur chevaleresque. Sa lame, aiguisée et fidèle, est prête à défendre la justice et à servir le bras des preux.', 250.00, 1250, 6, '2024-05-17 14:15:00', '2024-06-02 13:31:11', 'moyen-age/epee-longue-en-acier-forge.webp'),
(22, 8, 16, 'Broche en argent ciselé ', 'Par l\'habileté de nos orfèvres, cette broche d\'argent s\'orne de délicats motifs, capturant la lumière des bougies en nos halls. Elle scintille, telle une étoile au firmament, lors des festins et des bals.', 35.00, 1260, 15, '2024-05-17 10:55:00', '2024-05-17 10:55:00', 'moyen-age/broche-en-argent-cisele.webp'),
(23, 8, 17, 'Robe médiévale en laine', 'Tissée par les mains vertueuses des femmes de notre village, cette robe drapée de laine est l\'apanage des dames de haute lignée. Ornée de fines broderies, elle raconte les sagas de nos ancêtres, tissées en fils d\'or et d\'argent.', 90.00, 1275, 12, '2024-05-15 17:10:00', '2024-05-15 17:10:00', 'moyen-age/robe-medievale-en-laine.webp'),
(24, 7, 18, 'Casque de chevalier', 'Forgé dans le fer robuste et bénit par les prières de nos forgerons, ce heaume est le sanctuaire du guerrier. Il a vu maintes joutes et a trempé dans le sang des batailles, un rempart contre les flèches de la fortune.', 150.00, 1300, 7, '2024-05-15 21:48:00', '2024-05-15 21:48:00', 'moyen-age/casque-de-chevalier.webp'),
(25, 8, 19, 'Chope en étain gravé', 'Gravée de blasons nobles, cette chope d\'étain voyage de main en main lors des longues veillées. Compagne des récits épiques, elle est le gobelet des héros, témoin de serments et de toasts.', 25.00, 1285, 30, '2024-05-16 05:23:00', '2024-05-16 05:23:00', 'moyen-age/chope-en-etain-grave.webp'),
(26, 7, 18, 'Bouclier en bois et cuir', 'Ce bouclier, fidèle gardien du chevalier, est bâti de bois solide et bardé de cuir. Il a paré maints coups et protégé les valeureux dans l\'ardeur des combats, son écu est blason de courage.', 100.00, 1295, 9, '2024-05-18 11:51:00', '2024-05-18 11:51:00', 'moyen-age/bouclier-en-bois-et-cuir.webp'),
(27, 9, 20, 'Manuscrit enluminé', 'En ces pages se dévoile le savoir ancestral, chaque feuille richement enluminée par les moines érudits de notre abbaye. Cet ouvrage est un trésor de connaissance, un pont entre le divin et le terrestre.', 400.00, 1260, 5, '2024-05-15 18:39:00', '2024-05-15 18:39:00', 'moyen-age/manuscrit-enlumine-min.webp'),
(28, 8, 16, 'Cape en laine brodée', 'Cette cape, tissée dans la plus fine laine et brodée de symboles de notre héritage, enveloppe le noble dans les brumes du matin. Elle est à la fois bouclier contre le froid et étendard de son rang.', 120.00, 1270, 14, '2024-05-15 17:32:00', '2024-05-15 17:32:00', 'moyen-age/cape-en-laine-brodee.webp'),
(29, 9, 21, 'Herbier de plantes médicinales', 'Compilé avec soin par la sage femme de notre village, cet herbier recèle le pouvoir des herbes guérisseuses. Chaque plante est cueillie sous un signe favorable, un remède contre les maux du corps et de l\'esprit.', 50.00, 1300, 20, '2024-05-17 07:00:00', '2024-05-17 07:00:00', 'moyen-age/herbier-de-plantes-medicinales.webp'),
(30, 9, 19, 'Luth en bois', 'Ciselé avec passion, ce luth est l\'âme de la ménestrelle, éveillant les cœurs endormis et les esprits mélancoliques. Ses cordes chantent les louanges des héros et les lamentations des amants perdus.', 70.00, 1255, 15, '2024-05-17 09:12:00', '2024-05-17 09:12:00', 'moyen-age/luth-en-bois.webp'),
(31, 10, 21, 'Globe terrestre décoratif', 'Ce globe, peint avec une finesse exquise à la main, révèle les continents et les vastes océans. Il sert non seulement d\'instrument pour les érudits mais aussi d\'ornement majestueux dans les salons des nobles, où il inspire admiration et conversation.', 600.00, 1550, 10, '2024-05-17 01:36:00', '2024-05-29 12:06:10', 'renaissance/globe-terrestre-decoratif.webp'),
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
(60, 17, 42, 'Casque de musique à conduction osseuse', 'Révolutionnez votre manière d\'écouter de la musique avec ce casque à conduction osseuse, transmettant le son directement via les os de votre crâne. Profitez d\'une clarté sonore incomparable sans isoler vos oreilles du monde extérieur.', 1250.00, 2051, 10, '2024-05-19 09:14:00', '2024-05-19 09:14:00', 'futur/casque-de-musique-a-conduction-osseuse.webp'),
(61, 19, 43, 'Katana forgé à la main', 'Lame tranchante forgée par les meilleurs artisans du Japon féodal. Parfait pour les samouraïs cherchant l\'excellence au combat.', 300.00, 1550, 5, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/katana-forge-a-la-main.webp'),
(62, 19, 44, 'Armure de samouraï', 'Armure imposante en cuir et métal, portée par les guerriers nobles. Elle offre une protection supérieure et incarne l\'honneur du samouraï.', 500.00, 1600, 3, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/armure-de-samourai.webp'),
(63, 19, 45, 'Yumi (arc japonais)', 'Arc traditionnel utilisé par les samouraïs pour le tir à l\'arc à longue distance. Fait de bambou et de bois, il est à la fois puissant et élégant.', 150.00, 1580, 10, '2024-05-27 21:22:46', '2024-05-29 23:40:29', 'hoken-seido/yumi-(arc-japonais).webp'),
(64, 19, 46, 'Tanto (dague)', 'Dague courte et tranchante utilisée par les samouraïs pour le combat rapproché et les cérémonies. Lame en acier, manche orné.', 100.00, 1570, 8, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/tanto-(dague).webp'),
(65, 20, 47, 'Théière en fonte', 'Théière traditionnelle utilisée pour les cérémonies du thé au Japon féodal. Fait de fonte robuste avec des motifs élégants.', 75.00, 1500, 15, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/theiere-en-fonte.webp'),
(66, 20, 48, 'Kimono en soie', 'Vêtement traditionnel en soie porté lors des cérémonies et des festivals. Orné de motifs floraux délicats.', 200.00, 1540, 12, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/kimono-en-soie.webp'),
(67, 20, 49, 'Éventail pliant en papier', 'Éventail délicatement peint à la main, utilisé par les nobles pour se rafraîchir et pour des performances artistiques.', 20.00, 1530, 30, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/eventail-pliant-en-papier.webp'),
(68, 20, 50, 'Lanternes en papier', 'Lanternes traditionnelles illuminant les festivals et les rues du Japon féodal. Papier coloré, structure en bambou.', 30.00, 1555, 25, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/lanternes-en-papier.webp'),
(69, 21, 51, 'Peinture sur rouleau de soie', 'Peinture détaillée sur rouleau de soie, représentant des paysages et des scènes mythologiques du Japon féodal.', 120.00, 1560, 6, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/peinture-sur-rouleau-de-soie.webp'),
(70, 21, 52, 'Poupées Hina', 'Poupées traditionnelles utilisées lors du festival Hinamatsuri. Fabriquées à la main avec des vêtements traditionnels.', 50.00, 1590, 20, '2024-05-27 21:22:46', '2024-05-27 21:22:46', 'hoken-seido/poupees-hina.webp'),
(71, 22, 53, 'Tapis persan', 'Un tapis persan richement décoré, parfait pour embellir votre maison.', 300.00, 900, 5, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/tapis-persan.webp'),
(72, 22, 53, 'Vase en céramique', 'Un vase en céramique délicatement peint, idéal pour les fleurs ou comme pièce décorative.', 150.00, 910, 10, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/vase-en-ceramique.webp'),
(73, 22, 55, 'Bijou en or', 'Un bijou en or finement ciselé, symbole de richesse et de beauté.', 500.00, 920, 3, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/bijou-en-or.webp'),
(74, 23, 56, 'Astrolabe en laiton', 'Un astrolabe en laiton utilisé pour les observations astronomiques.', 250.00, 930, 7, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/astrolabe-en-laiton.webp'),
(75, 23, 57, 'Manuscrit médical', 'Un manuscrit médical détaillant les découvertes en médecine de l\'époque.', 400.00, 940, 4, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/manuscrit-medical.webp'),
(76, 23, 58, 'Globe terrestre', 'Un globe terrestre illustrant les connaissances géographiques de l\'époque.', 350.00, 950, 6, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/globe-terrestre.webp'),
(77, 24, 59, 'Robe en soie', 'Une robe en soie luxueuse, parfaite pour les occasions spéciales.', 200.00, 960, 8, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/robe-en-soie.webp'),
(78, 24, 60, 'Turban en soie', 'Un turban en soie élégamment tissé, symbole de statut et de raffinement.', 180.00, 970, 12, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/turban-en-soie.webp'),
(79, 24, 61, 'Tunique brodée', 'Une tunique brodée avec des motifs complexes, représentant l\'artisanat raffiné de l\'époque.', 220.00, 980, 10, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'islamique/tunique-brodee.webp'),
(80, 23, 56, 'Lanterne en laiton', 'Lanterne en laiton finement gravée, utilisée pour illuminer les espaces intérieurs et extérieurs. Symbole de l\'artisanat raffiné de l\'époque.', 100.00, 970, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'islamique/lanterne-en-laiton.webp'),
(81, 25, 62, 'Selle de cheval', 'Une selle de cheval robuste et confortable, parfaite pour les longs trajets.', 120.00, 1880, 5, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/selle-de-cheval.webp'),
(82, 25, 63, 'Bottes en cuir', 'Des bottes en cuir durables, idéales pour les cowboys et les aventuriers.', 90.00, 1885, 8, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/bottes-en-cuir.webp'),
(83, 25, 64, 'Ceinture à revolver', 'Une ceinture à revolver en cuir, pratique pour garder votre arme à portée de main.', 60.00, 1890, 15, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/ceinture-a-revolver.webp'),
(84, 26, 65, 'Revolver', 'Un revolver fiable, essentiel pour la défense personnelle dans le Far West.', 250.00, 1895, 6, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/revolver.webp'),
(85, 26, 65, 'Fusil à levier', 'Un fusil à levier puissant, utilisé pour la chasse et la protection.', 300.00, 1887, 4, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/fusil-a-levier.webp'),
(86, 26, 67, 'Couteau de chasse', 'Un couteau de chasse robuste, indispensable pour les tâches quotidiennes et la survie.', 50.00, 1892, 12, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/couteau-de-chasse.webp'),
(87, 27, 68, 'Chapeau de cowboy', 'Un chapeau de cowboy emblématique, protégeant du soleil et ajoutant du style.', 40.00, 1888, 20, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/chapeau-de-cowboy.webp'),
(88, 27, 69, 'Lanterne à pétrole', 'Une lanterne à pétrole, essentielle pour l\'éclairage des camps et des maisons.', 30.00, 1883, 10, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/lanterne-a-petrole.webp'),
(89, 27, 70, 'Harmonica', 'Un harmonica en métal, parfait pour les soirées autour du feu de camp.', 20.00, 1889, 15, '2024-05-28 14:43:10', '2024-05-28 14:43:10', 'western/harmonica.webp'),
(90, 26, 67, 'Corde de lasso', 'Une corde de lasso de haute qualité, idéale pour les travaux de ranch et les compétitions de rodéo.', 35.00, 1886, 7, '2024-05-29 10:00:00', '2024-05-29 10:00:00', 'western/corde-de-lasso.webp');

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
(60, 139),
(25, 140),
(25, 141),
(11, 142),
(21, 38),
(20, 143),
(12, 144),
(17, 145),
(14, 146),
(19, 147),
(19, 148),
(45, 149),
(45, 150),
(51, 151),
(59, 152),
(55, 153),
(41, 154),
(41, 155),
(35, 156),
(37, 13),
(26, 9),
(3, 38),
(39, 13),
(5, 20),
(5, 23),
(5, 157),
(23, 158),
(23, 159),
(23, 160),
(2, 161),
(2, 162),
(5, 162),
(61, 1),
(61, 50),
(61, 51),
(62, 9),
(62, 38),
(63, 1),
(64, 50),
(64, 51),
(65, 62),
(66, 7),
(66, 76),
(66, 99),
(67, 18),
(68, 30),
(69, 19),
(69, 76),
(69, 18),
(71, 52),
(72, 26),
(72, 19),
(72, 52),
(73, 4),
(73, 80),
(73, 52),
(74, 77),
(74, 78),
(74, 15),
(75, 65),
(76, 72),
(76, 73),
(76, 74),
(77, 7),
(77, 76),
(77, 99),
(78, 76),
(78, 99),
(79, 67),
(79, 7),
(79, 52),
(80, 38),
(80, 17),
(81, 38),
(81, 99),
(82, 1),
(82, 38),
(83, 1),
(83, 9),
(83, 50),
(84, 1),
(84, 3),
(84, 9),
(85, 1),
(85, 3),
(85, 22),
(86, 88),
(86, 99),
(86, 9),
(87, 100),
(87, 30),
(88, 14),
(88, 15),
(31, 163),
(63, 13),
(63, 164),
(63, 162),
(21, 165);

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

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`user_id`, `article_id`, `quantity`, `datetime`) VALUES
(1, 1, 5, '2024-05-29 18:26:46'),
(1, 21, 4, '2024-06-01 21:52:11'),
(1, 22, 1, '2024-06-02 03:13:42'),
(1, 33, 2, '2024-06-02 03:13:52'),
(1, 67, 1, '2024-06-02 03:14:00'),
(1, 81, 1, '2024-06-02 03:15:02'),
(1, 73, 1, '2024-06-02 03:16:14');

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
(1, 'Néolithique', 'Revivez les premiers pas de l\'humanité, où la terre et la pierre façonnent notre quotidien.', 'coquillage', 10.00, 'thumbnail-neolithique.webp', 'currency_icons/coquillage.webp', -3473, 'https://dl.dropboxusercontent.com/scl/fi/yqo7f1iir57xxr550sk7j/stone_world.mp3?rlkey=00m1p3ngrbahfcqdm8f91yn89&st=9qircazs'),
(2, 'Antiquité', 'Plongez dans l\'éclat de l\'Antiquité avec ses philosophes, poètes et guerriers légendaires.', 'denier', 2.00, 'thumbnail-antiquite.webp', 'currency_icons/denier.webp', -417, 'https://dl.dropboxusercontent.com/scl/fi/cttsenqi2ia5dg8p3tao7/ac_theflight.mp3?rlkey=9wsgb7ah6gxs6jytvvnjss6ph&st=08xlj5gy'),
(3, 'Moyen-Âge', 'Entrez dans le majestueux Moyen-Âge, une époque de chevaliers et de légendes mystérieuses.', 'écu', 1.00, 'thumbnail-moyenage.webp', 'currency_icons/ecu.webp', 1275, 'https://dl.dropboxusercontent.com/scl/fi/t7xc6he771v59gmt93n0w/medieval_tavern.mp3?rlkey=exbc97mr0a2rwf32hlrwgaw0b&st=bl13shb3'),
(4, 'Renaissance', 'Vivez la splendeur de la Renaissance, où l\'art et la découverte illuminent notre monde.', 'florin', 0.50, 'thumbnail-renaissance.webp', 'currency_icons/florin.webp', 1544, 'https://dl.dropboxusercontent.com/scl/fi/sulqbspaeerwtvz7ulgfv/kingdom_dance.mp3?rlkey=ftq10tuw4c0gyjxjqkydezrgj&st=uhke63bx'),
(5, 'Époque Moderne', 'Rejoignez l\'ère de l\'innovation avec ses merveilles technologiques et son dynamisme.', 'livre', 1.50, 'thumbnail-moderne.webp', 'currency_icons/livre.webp', 1871, 'https://dl.dropboxusercontent.com/scl/fi/kdp7d9y8xsa40tgrxckva/howls_movingcastle.mp3?rlkey=dc461wk883n4yrhk0qb9yhq1l&st=kmelccqp'),
(6, 'Futur', 'Plongez dans le futur, un monde où technologie et innovation redéfinissent les possibles.', 'crédit', 0.20, 'thumbnail-futur.webp', 'currency_icons/credit.webp', 2048, 'https://dl.dropboxusercontent.com/scl/fi/dvxrmbfymb7lnw56c3ukk/cyberpunk_spoiler.mp3?rlkey=l0tt2knbzj3t4od6f867xtlz9&st=2j8xqkxd'),
(7, 'Hōken-seido', 'Explorez le pays du Soleil levant, où traditions et histoires légendaires forgent chaque artefact.', 'mon', 1.25, 'thumbnail-hoken-seido.webp', 'currency_icons/mon.webp', 1558, 'https://dl.dropboxusercontent.com/scl/fi/z5qhvjte7s2lb21466gsx/rapid-as-wildfire.mp3?rlkey=5312jyzxr1ppsnly6fjcopm10&st=3bsfaa2w'),
(8, 'Islamique', 'Plongez dans l\'Âge d\'Or Islamique, une ère de grandes avancées et de richesse culturelle.', 'dirham', 0.30, 'thumbnail-islamique.webp', 'currency_icons/dirham.webp', 940, 'https://dl.dropboxusercontent.com/scl/fi/lka7it99g91mpsc45gsu4/the_great_fortress.mp3?rlkey=snh6hbls3fgzku7kp9ik9vuiu&st=jqdqol3v'),
(9, 'Western', 'Revivez l\'épopée du Western américain, où cowboys et pionniers forgent une nouvelle nation.', 'dollar', 1.20, 'thumbnail-western.webp', 'currency_icons/dollar.webp', 1888, 'https://dl.dropboxusercontent.com/scl/fi/m2pios2wr3revnk32kq8z/american_venom.mp3?rlkey=m1gvtav2ivqpv4vry8xe30doy&st=ejyjxw8g');

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
  `created_at` datetime NOT NULL,
  `display` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`comment_id`, `article_id`, `user_id`, `rating_score`, `content`, `created_at`, `display`) VALUES
(1, 1, 1, 5, 'Une arme exceptionnelle, très bien conçue. Parfaite pour la chasse.', '2024-05-26 23:16:25', 1),
(2, 2, 1, 2, 'Collier sympa mais je crois que le loup était végétarien.', '2024-05-26 23:16:25', 1),
(3, 3, 1, 5, 'Cape très chaude, parfaite pour les nuits froides.', '2024-05-26 23:16:25', 1),
(4, 4, 1, 3, 'Pot pratique, mais un peu lourd. Mon dos s\'en souvient encore.', '2024-05-26 23:16:25', 1),
(5, 5, 1, 4, 'Bonne lance, idéale pour la chasse.', '2024-05-26 23:16:25', 1),
(6, 6, 1, 5, 'Flûte merveilleuse, le son est incroyable. Mes voisins moins.', '2024-05-26 23:16:25', 1),
(7, 7, 1, 4, 'Sac solide, parfait pour les longues marches.', '2024-05-26 23:16:25', 1),
(8, 8, 1, 5, 'Superbe peinture rupestre, très détaillée. Presque moderne !', '2024-05-26 23:16:25', 1),
(9, 9, 1, 4, 'Kit d\'allumage efficace, très utile. Sauf sous la pluie.', '2024-05-26 23:16:25', 1),
(10, 10, 1, 5, 'Bijoux magnifiques, très bien sculptés. Parfait pour les mammouths.', '2024-05-26 23:16:25', 1),
(11, 11, 1, 3, 'Amphore belle, mais fragile. Elle a survécu deux fêtes.', '2024-05-26 23:16:25', 1),
(12, 12, 1, 5, 'Tunique en lin légère et confortable. Parfaite pour les étés grecs.', '2024-05-26 23:16:25', 1),
(13, 13, 1, 4, 'Lampe à huile très utile, éclaire bien. Mais l\'huile, ça coûte !', '2024-05-26 23:16:25', 1),
(14, 14, 1, 5, 'Statuette de déesse impressionnante, très bien faite.', '2024-05-26 23:16:25', 1),
(15, 15, 1, 2, 'Collier élégant, mais les perles se détachent. Dommage.', '2024-05-26 23:16:25', 1),
(16, 16, 1, 3, 'Sandales confortables, mais usure rapide. Mes pieds n\'ont pas apprécié.', '2024-05-26 23:16:25', 1),
(17, 17, 1, 5, 'Couronne de laurier magnifique, très symbolique. Idéale pour les selfies.', '2024-05-26 23:16:25', 1),
(18, 18, 1, 4, 'Fresque murale très belle, mais chère. Parfait pour les riches.', '2024-05-26 23:16:25', 1),
(19, 19, 1, 5, 'Parchemin écrit avec soin, très informatif. La meilleure lecture.', '2024-05-26 23:16:25', 1),
(20, 20, 1, 4, 'Gladius robuste, parfait pour un légionnaire. Un peu lourd.', '2024-05-26 23:16:25', 1),
(21, 21, 1, 5, 'Épée longue magnifique, très bien équilibrée. Prêt pour le cosplay.', '2024-05-26 23:16:25', 1),
(22, 22, 1, 4, 'Broche en argent délicate, très belle. Mais se perd facilement.', '2024-05-26 23:16:25', 1),
(24, 24, 1, 4, 'Casque de chevalier solide, bonne protection. Mon crâne remercie.', '2024-05-26 23:16:25', 1),
(25, 25, 1, 5, 'Chope en étain gravée, idéale pour les banquets. À la santé !', '2024-05-26 23:16:25', 1),
(26, 26, 1, 4, 'Bouclier solide, bonne protection en combat. Moins contre les factures.', '2024-05-26 23:16:25', 1),
(27, 27, 1, 5, 'Manuscrit enluminé magnifique, très bien conservé. Une vraie œuvre d\'art.', '2024-05-26 23:16:25', 1),
(28, 28, 1, 4, 'Cape en laine brodée, très chaude et confortable. Parfaite pour l\'hiver.', '2024-05-26 23:16:25', 1),
(29, 29, 1, 5, 'Herbier de plantes médicinales très utile et bien fait. Mon herboriste approuve.', '2024-05-26 23:16:25', 1),
(30, 30, 1, 4, 'Luth en bois avec un son magnifique. Parfait pour les soirées mélancoliques.', '2024-05-26 23:16:25', 1),
(31, 31, 1, 5, 'Globe terrestre décoratif très détaillé. Parfait pour les géographes.', '2024-05-26 23:16:25', 1),
(32, 32, 1, 2, 'Un portrait magnifique, les détails sont incroyables. Un peu cher cependant.', '2024-05-26 23:16:25', 1),
(33, 33, 1, 5, 'Robe en soie brodée magnifique, très élégante. Idéale pour les soirées de gala.', '2024-05-26 23:16:25', 1),
(34, 34, 1, 4, 'Astrolabe en laiton, très bien fabriqué. Je me perds toujours.', '2024-05-26 23:16:25', 1),
(35, 35, 1, 5, 'Collier en or et émeraude splendide, très luxueux. Un peu trop voyant.', '2024-05-26 23:16:25', 1),
(36, 36, 1, 3, 'Livres de poésie bien imprimés, très inspirants. Certains poèmes sont trop tristes.', '2024-05-26 23:16:25', 1),
(37, 37, 1, 5, 'Canne à pommeau sculpté, très élégante. Parfaite pour les promenades.', '2024-05-26 23:16:25', 1),
(38, 38, 1, 4, 'Chapeau en velours avec plume, très stylé. Un peu trop extravagant.', '2024-05-26 23:16:25', 1),
(39, 39, 1, 5, 'Viole de gambe, son magnifique. Presque trop parfait.', '2024-05-26 23:16:25', 1),
(40, 40, 1, 4, 'Ensemble d\'échecs très bien sculpté. Les pions sont trop petits.', '2024-05-26 23:16:25', 1),
(41, 41, 1, 5, 'Montre de poche en or, très précise et élégante. Parfaite pour les gentlemen.', '2024-05-26 23:16:25', 1),
(42, 42, 1, 4, 'Chapeau haut-de-forme en feutre, très chic. Un peu trop rigide.', '2024-05-26 23:16:25', 1),
(43, 43, 1, 5, 'Manteau en tweed, très bien fait et chaud. Idéal pour l\'hiver anglais.', '2024-05-26 23:16:25', 1),
(44, 44, 1, 4, 'Lanterne à huile en cuivre, éclaire bien. Mais consomme beaucoup d\'huile.', '2024-05-26 23:16:25', 1),
(45, 45, 1, 5, 'Machine à écrire portable, très pratique. Parfaite pour les écrivains itinérants.', '2024-05-26 23:16:25', 1),
(46, 46, 1, 2, 'Bicyclette Penny-farthing, très originale. Pas très stable.', '2024-05-26 23:16:25', 1),
(47, 47, 1, 5, 'Ensemble de thé en porcelaine, très élégant. Parfait pour les tea parties.', '2024-05-26 23:16:25', 1),
(48, 48, 1, 4, 'Carte du monde encadrée, très détaillée. Les couleurs sont un peu ternes.', '2024-05-26 23:16:25', 1),
(49, 49, 1, 5, 'Jumelles en cuir et laiton, très utiles. Idéales pour l\'observation des oiseaux.', '2024-05-26 23:16:25', 1),
(50, 50, 1, 4, 'Canevas brodé, très bien fait. Un peu trop coloré à mon goût.', '2024-05-26 23:16:25', 1),
(51, 51, 1, 5, 'Smartwatch holographique, très avancée. Comme dans un film de science-fiction.', '2024-05-26 23:16:25', 1),
(52, 52, 1, 4, 'Lunettes de réalité augmentée, très pratiques. Sauf quand on les perd.', '2024-05-26 23:16:25', 1),
(53, 53, 1, 5, 'Combinaison spatiale légère, très innovante. Parfaite pour les astronautes en herbe.', '2024-05-26 23:16:25', 1),
(54, 54, 1, 4, 'Drone personnel de transport, très utile. Un peu bruyant.', '2024-05-26 23:16:25', 1),
(55, 55, 1, 5, 'Panneau de commande domestique intelligent, très pratique. La maison du futur.', '2024-05-26 23:16:25', 1),
(56, 56, 1, 4, 'Kit de jardinage hydroponique, très utile. Un peu cher.', '2024-05-26 23:16:25', 1),
(57, 57, 1, 5, 'Robot assistant domestique, très avancé. J\'espère qu\'il ne se rebellera pas.', '2024-05-26 23:16:25', 1),
(58, 58, 1, 4, 'Chargeur solaire portable, très pratique. Mais le soleil est capricieux.', '2024-05-26 23:16:25', 1),
(59, 59, 1, 5, 'Lampe LED à contrôle gestuel, très innovante. Parfaite pour les geeks.', '2024-05-26 23:16:25', 1),
(60, 60, 1, 4, 'Casque de musique à conduction osseuse, très confortable. Un peu bizarre au début.', '2024-05-26 23:16:25', 1),
(69, 25, 1, 5, 'Il est bien goulu.', '2024-05-27 19:31:16', 1),
(70, 1, 5, 1, 'Une hache en silex... sérieusement ? On est en -3500 et on n\'a rien de mieux ?', '2024-05-27 21:22:46', 1),
(71, 1, 6, 3, 'Une hache de plus. Elle fait le job.', '2024-05-27 21:22:46', 1),
(72, 1, 7, 5, 'Wow, cette hache en silex est vraiment bien faite et super pratique pour la chasse!', '2024-05-27 21:22:46', 1),
(73, 2, 5, 1, 'Un collier en os et dents de loup, parfait pour effrayer les voisins. Bravo...', '2024-05-27 21:22:46', 1),
(74, 2, 6, 2, 'Un autre collier. J\'ai déjà vu mieux.', '2024-05-27 21:22:46', 1),
(75, 2, 7, 4, 'Ce collier en os et dents de loup est tellement impressionnant, un vrai bijou!', '2024-05-27 21:22:46', 1),
(76, 3, 5, 1, 'Une cape en peau de bison ? Parfait pour les soirées déguisées chez les mammouths.', '2024-05-27 21:22:46', 1),
(77, 3, 6, 4, 'Encore une cape. Au moins, elle est chaude.', '2024-05-27 21:22:46', 1),
(78, 3, 7, 4, 'La cape en peau de bison est parfaite pour les nuits froides, vraiment géniale!', '2024-05-27 21:22:46', 1),
(79, 4, 5, 2, 'Un pot en argile cuite. J\'espère qu\'il ne fuit pas comme le dernier.', '2024-05-27 21:22:46', 1),
(80, 4, 6, 3, 'Un pot en argile, pratique pour les grains.', '2024-05-27 21:22:46', 1),
(81, 4, 7, 4, 'Ce pot en argile est magnifique, parfait pour stocker des grains!', '2024-05-27 21:22:46', 1),
(82, 5, 5, 1, 'Encore une lance en bois, je parie qu\'elle casse à la première utilisation.', '2024-05-27 21:22:46', 1),
(83, 5, 6, 4, 'Une autre lance. Ça fait le boulot.', '2024-05-27 21:22:46', 1),
(84, 5, 7, 5, 'Cette lance en bois avec pointe en pierre est vraiment bien conçue pour la chasse!', '2024-05-27 21:22:46', 1),
(85, 6, 5, 1, 'Une flûte en os... parce que c\'est ce qu\'il manquait à ma collection de bric-à-brac.', '2024-05-27 21:22:46', 1),
(86, 6, 6, 2, 'Une flûte. Sympa pour les soirées.', '2024-05-27 21:22:46', 1),
(87, 6, 7, 4, 'La flûte en os est parfaite pour des soirées autour du feu!', '2024-05-27 21:22:46', 1),
(88, 7, 5, 2, 'Un sac en peau de chèvre. Génial pour transporter... des cailloux.', '2024-05-27 21:22:46', 1),
(89, 7, 6, 4, 'Un autre sac. Rien de spécial.', '2024-05-27 21:22:46', 1),
(90, 7, 7, 5, 'Ce sac en peau de chèvre est idéal pour les voyages, vraiment robuste!', '2024-05-27 21:22:46', 1),
(91, 8, 5, 1, 'Peinture rupestre... je préfère les gribouillis de mes enfants.', '2024-05-27 21:22:46', 1),
(92, 8, 6, 4, 'Une peinture. Rien de nouveau.', '2024-05-27 21:22:46', 1),
(93, 8, 7, 4, 'La peinture rupestre est vraiment inspirante, j\'aime beaucoup!', '2024-05-27 21:22:46', 1),
(94, 9, 5, 1, 'Un kit d\'allumage de feu. Est-ce qu\'il fonctionne au moins ?', '2024-05-27 21:22:46', 1),
(95, 9, 6, 4, 'Un kit pour faire du feu. Pratique.', '2024-05-27 21:22:46', 1),
(96, 9, 7, 4, 'Ce kit d\'allumage de feu est tellement utile pour les nuits froides!', '2024-05-27 21:22:46', 1),
(97, 10, 5, 1, 'Des bijoux en ivoire de mammouth. Parfait pour ceux qui aiment vivre dans le passé.', '2024-05-27 21:22:46', 1),
(98, 10, 6, 4, 'Des bijoux encore. Classique.', '2024-05-27 21:22:46', 1),
(99, 10, 7, 5, 'Les bijoux en ivoire de mammouth sont vraiment élégants, j\'adore!', '2024-05-27 21:22:46', 1),
(100, 11, 5, 1, 'Une amphore en céramique. Espérons qu\'elle ne casse pas au premier choc.', '2024-05-27 21:22:46', 1),
(101, 11, 6, 2, 'Une autre amphore. Rien de spécial.', '2024-05-27 21:22:46', 1),
(102, 11, 7, 4, 'Cette amphore en céramique est superbe, parfaite pour les fêtes!', '2024-05-27 21:22:46', 1),
(103, 12, 5, 1, 'Une tunique en lin, vraiment ? On dirait une nappe.', '2024-05-27 21:22:46', 1),
(104, 12, 6, 3, 'Encore une tunique. Au moins, elle est légère.', '2024-05-27 21:22:46', 1),
(105, 12, 7, 5, 'La tunique en lin est parfaite pour l\'été, tellement confortable!', '2024-05-27 21:22:46', 1),
(106, 13, 5, 2, 'Une lampe à huile. Ça ira bien avec ma collection de vieilleries.', '2024-05-27 21:22:46', 1),
(107, 13, 6, 2, 'Une lampe à huile. Pratique.', '2024-05-27 21:22:46', 1),
(108, 13, 7, 4, 'Cette lampe à huile en terre cuite est vraiment charmante, j\'adore!', '2024-05-27 21:22:46', 1),
(109, 14, 5, 2, 'Une statuette de déesse en bronze. Je vais l\'utiliser comme presse-papier.', '2024-05-27 21:22:46', 1),
(110, 14, 6, 2, 'Une autre statuette. Pas très impressionnant.', '2024-05-27 21:22:46', 1),
(111, 14, 7, 5, 'La statuette de déesse en bronze est magnifique, un vrai trésor!', '2024-05-27 21:22:46', 1),
(112, 15, 5, 2, 'Un collier en perles de verre. Vraiment ?', '2024-05-27 21:22:46', 1),
(113, 15, 6, 3, 'Un collier encore. Rien de spécial.', '2024-05-27 21:22:46', 1),
(114, 15, 7, 5, 'Ce collier en perles de verre est tellement élégant, j\'adore!', '2024-05-27 21:22:46', 1),
(115, 16, 5, 1, 'Des sandales en cuir, parce que marcher pieds nus c\'est trop mainstream.', '2024-05-27 21:22:46', 1),
(116, 16, 6, 3, 'Des sandales. Fonctionnelles.', '2024-05-27 21:22:46', 1),
(117, 16, 7, 5, 'Les sandales en cuir sont parfaites pour marcher dans les rues pavées!', '2024-05-27 21:22:46', 1),
(118, 17, 5, 1, 'Une couronne de laurier en métal doré, parfait pour se prendre pour un empereur.', '2024-05-27 21:22:46', 1),
(119, 17, 6, 2, 'Une couronne de plus. Mouais.', '2024-05-27 21:22:46', 1),
(120, 17, 7, 4, 'La couronne de laurier en métal doré est vraiment belle, symbole de triomphe!', '2024-05-27 21:22:46', 1),
(121, 18, 5, 2, 'Une fresque murale portable... vraiment nécessaire ?', '2024-05-27 21:22:46', 1),
(122, 18, 6, 2, 'Une fresque. Classique.', '2024-05-27 21:22:46', 1),
(123, 18, 7, 5, 'Cette fresque murale portable est magnifique, parfaite pour raconter des histoires!', '2024-05-27 21:22:46', 1),
(124, 19, 5, 2, 'Un parchemin écrit à la main. Encore un truc à ramasser la poussière.', '2024-05-27 21:22:46', 1),
(125, 19, 6, 2, 'Un parchemin de plus. Pas très excitant.', '2024-05-27 21:22:46', 1),
(126, 19, 7, 5, 'Le parchemin écrit à la main est un trésor de connaissances!', '2024-05-27 21:22:46', 1),
(127, 20, 5, 1, 'Un gladius (épée romaine). Encore une arme de plus.', '2024-05-27 21:22:46', 1),
(128, 20, 6, 3, 'Une épée de plus. Classique.', '2024-05-27 21:22:46', 1),
(129, 20, 7, 5, 'Le gladius est une arme magnifique, symbole de puissance romaine!', '2024-05-27 21:22:46', 1),
(130, 21, 5, 2, 'Une épée longue en acier forgé, super pour se prendre pour un chevalier.', '2024-05-27 21:22:46', 1),
(131, 21, 6, 2, 'Une autre épée. Pas très excitant.', '2024-05-27 21:22:46', 1),
(132, 21, 7, 4, 'L\'épée longue en acier forgé est parfaite pour un chevalier!', '2024-05-27 21:22:46', 1),
(133, 22, 5, 2, 'Une broche en argent ciselé. Très original... ou pas.', '2024-05-27 21:22:46', 1),
(134, 22, 6, 3, 'Une autre broche. Classique.', '2024-05-27 21:22:46', 1),
(135, 22, 7, 4, 'Cette broche en argent ciselé est vraiment élégante!', '2024-05-27 21:22:46', 1),
(136, 23, 5, 1, 'Une robe médiévale en laine. Encore une robe. Super.', '2024-05-27 21:22:46', 1),
(137, 23, 6, 4, 'Une autre robe. Rien de spécial.', '2024-05-27 21:22:46', 1),
(138, 23, 7, 5, 'La robe médiévale en laine est superbe et bien faite!', '2024-05-27 21:22:46', 1),
(139, 24, 5, 1, 'Un casque de chevalier. Peut-être utile pour Halloween.', '2024-05-27 21:22:46', 1),
(140, 24, 6, 2, 'Un autre casque. Pas très excitant.', '2024-05-27 21:22:46', 1),
(141, 24, 7, 5, 'Le casque de chevalier est parfait pour les batailles!', '2024-05-27 21:22:46', 1),
(142, 25, 5, 2, 'Une chope en étain gravé. Parfait pour la déco, je suppose.', '2024-05-27 21:22:46', 1),
(143, 25, 6, 2, 'Une autre chope. Bof.', '2024-05-27 21:22:46', 1),
(144, 25, 7, 4, 'La chope en étain gravé est parfaite pour les soirées!', '2024-05-27 21:22:46', 1),
(145, 26, 5, 2, 'Un bouclier en bois et cuir. Espérons qu\'il soit solide.', '2024-05-27 21:22:46', 1),
(146, 26, 6, 2, 'Un autre bouclier. Pas très excitant.', '2024-05-27 21:22:46', 1),
(147, 26, 7, 5, 'Le bouclier en bois et cuir est parfait pour les combats!', '2024-05-27 21:22:46', 1),
(148, 27, 5, 2, 'Un manuscrit enluminé. Bof. Encore des pages.', '2024-05-27 21:22:46', 1),
(149, 27, 6, 2, 'Un autre manuscrit. Classique.', '2024-05-27 21:22:46', 1),
(150, 27, 7, 4, 'Le manuscrit enluminé est un trésor de connaissances!', '2024-05-27 21:22:46', 1),
(151, 28, 5, 1, 'Une cape en laine brodée. Encore une cape. Super.', '2024-05-27 21:22:46', 1),
(152, 28, 6, 2, 'Une autre cape. Pas très excitant.', '2024-05-27 21:22:46', 1),
(153, 28, 7, 4, 'La cape en laine brodée est magnifique et bien faite!', '2024-05-27 21:22:46', 1),
(154, 29, 5, 1, 'Un herbier de plantes médicinales. Bof. Encore des plantes.', '2024-05-27 21:22:46', 1),
(155, 29, 6, 2, 'Un autre herbier. Rien de spécial.', '2024-05-27 21:22:46', 1),
(156, 29, 7, 5, 'L\'herbier de plantes médicinales est un trésor de savoir!', '2024-05-27 21:22:46', 1),
(157, 30, 5, 1, 'Un luth en bois. Super pour les soirées entre amis... ou pas.', '2024-05-27 21:22:46', 1),
(158, 30, 6, 3, 'Un autre luth. Pas très excitant.', '2024-05-27 21:22:46', 1),
(159, 30, 7, 4, 'Le luth en bois est parfait pour les soirées musicales!', '2024-05-27 21:22:46', 1),
(160, 31, 5, 1, 'Un globe terrestre décoratif. Qui a besoin de ça ?', '2024-05-27 21:22:46', 1),
(161, 31, 6, 3, 'Un autre globe. Pas très excitant.', '2024-05-27 21:22:46', 1),
(162, 31, 7, 5, 'Le globe terrestre décoratif est magnifique et informatif!', '2024-05-27 21:22:46', 1),
(163, 32, 5, 1, 'Un portrait peint à l\'huile. Juste une autre image pour les murs.', '2024-05-27 21:22:46', 1),
(164, 32, 6, 2, 'Un portrait. Encore un.', '2024-05-27 21:22:46', 1),
(165, 32, 7, 5, 'Le portrait peint à l\'huile est vraiment captivant!', '2024-05-27 21:22:46', 1),
(166, 33, 5, 2, 'Une robe en soie brodée. Pour ceux qui veulent se sentir comme des rois.', '2024-05-27 21:22:46', 1),
(167, 33, 6, 4, 'Une autre robe. Rien de spécial.', '2024-05-27 21:22:46', 1),
(168, 33, 7, 4, 'La robe en soie brodée est magnifique et élégante!', '2024-05-27 21:22:46', 1),
(169, 34, 5, 1, 'Un astrolabe en laiton. Super pour les amateurs d\'étoiles.', '2024-05-27 21:22:46', 1),
(170, 34, 6, 2, 'Un autre astrolabe. Classique.', '2024-05-27 21:22:46', 1),
(171, 34, 7, 4, 'L\'astrolabe en laiton est un outil fascinant et beau!', '2024-05-27 21:22:46', 1),
(172, 35, 5, 1, 'Un collier en or et émeraude. Juste ce qu\'il fallait pour attirer les voleurs.', '2024-05-27 21:22:46', 1),
(173, 35, 6, 4, 'Un autre collier. Pas très excitant.', '2024-05-27 21:22:46', 1),
(174, 35, 7, 4, 'Le collier en or et émeraude est absolument magnifique!', '2024-05-27 21:22:46', 1),
(175, 36, 5, 1, 'Des livres imprimés de poésie. Parfait pour les soirées ennuyeuses.', '2024-05-27 21:22:46', 1),
(176, 36, 6, 3, 'Des livres de poésie. Mouais.', '2024-05-27 21:22:46', 1),
(177, 36, 7, 5, 'Les livres imprimés de poésie sont un vrai régal pour l\'âme!', '2024-05-27 21:22:46', 1),
(178, 37, 5, 1, 'Une canne à pommeau sculpté. Pour ceux qui veulent marcher avec style.', '2024-05-27 21:22:46', 1),
(179, 37, 6, 2, 'Une autre canne. Classique.', '2024-05-27 21:22:46', 1),
(180, 37, 7, 4, 'La canne à pommeau sculpté est vraiment élégante!', '2024-05-27 21:22:46', 1),
(181, 38, 5, 1, 'Un chapeau en velours avec plume. Parfait pour les déguisements.', '2024-05-27 21:22:46', 1),
(182, 38, 6, 4, 'Un autre chapeau. Rien de spécial.', '2024-05-27 21:22:46', 1),
(183, 38, 7, 4, 'Le chapeau en velours avec plume est très chic!', '2024-05-27 21:22:46', 1),
(184, 39, 5, 2, 'Une viole de gambe. Pour les amateurs de musique ancienne.', '2024-05-27 21:22:46', 1),
(185, 39, 6, 4, 'Une autre viole. Pas très excitant.', '2024-05-27 21:22:46', 1),
(186, 39, 7, 5, 'La viole de gambe a un son merveilleux!', '2024-05-27 21:22:46', 1),
(187, 40, 5, 2, 'Un ensemble d\'échecs en ivoire et bois. Juste pour ceux qui aiment les jeux lents.', '2024-05-27 21:22:46', 1),
(188, 40, 6, 3, 'Un autre ensemble d\'échecs. Classique.', '2024-05-27 21:22:46', 1),
(189, 40, 7, 5, 'L\'ensemble d\'échecs en ivoire et bois est une œuvre d\'art!', '2024-05-27 21:22:46', 1),
(190, 41, 5, 2, 'Une montre de poche en or. Pour ceux qui veulent se la jouer gentleman.', '2024-05-27 21:22:46', 1),
(191, 41, 6, 4, 'Une autre montre. Rien de spécial.', '2024-05-27 21:22:46', 1),
(192, 41, 7, 4, 'La montre de poche en or est absolument magnifique!', '2024-05-27 21:22:46', 1),
(193, 42, 5, 2, 'Un chapeau haut-de-forme en feutre. Parfait pour se prendre pour un lord.', '2024-05-27 21:22:46', 1),
(194, 42, 6, 3, 'Un autre chapeau. Pas très excitant.', '2024-05-27 21:22:46', 1),
(195, 42, 7, 5, 'Le chapeau haut-de-forme en feutre est très élégant!', '2024-05-27 21:22:46', 1),
(196, 43, 5, 1, 'Un manteau en tweed. Pour les amateurs de mode vieillotte.', '2024-05-27 21:22:46', 1),
(197, 43, 6, 4, 'Un autre manteau. Rien de spécial.', '2024-05-27 21:22:46', 1),
(198, 43, 7, 5, 'Le manteau en tweed est parfait pour les matinées fraîches!', '2024-05-27 21:22:46', 1),
(199, 44, 5, 2, 'Une lanterne à huile en cuivre. Idéale pour les amateurs de vintage.', '2024-05-27 21:22:46', 1),
(200, 44, 6, 4, 'Une autre lanterne. Pas très excitant.', '2024-05-27 21:22:46', 1),
(201, 44, 7, 4, 'La lanterne à huile en cuivre est vraiment charmante!', '2024-05-27 21:22:46', 1),
(202, 45, 5, 1, 'Une machine à écrire portable. Pour ceux qui aiment l\'écriture rétro.', '2024-05-27 21:22:46', 1),
(203, 45, 6, 4, 'Une autre machine à écrire. Rien de spécial.', '2024-05-27 21:22:46', 1),
(204, 45, 7, 4, 'La machine à écrire portable est un outil fantastique!', '2024-05-27 21:22:46', 1),
(205, 46, 5, 1, 'Une bicyclette Penny-farthing. Super pour ceux qui aiment tomber de haut.', '2024-05-27 21:22:46', 1),
(206, 46, 6, 3, 'Une autre bicyclette. Classique.', '2024-05-27 21:22:46', 1),
(207, 46, 7, 5, 'La bicyclette Penny-farthing est vraiment unique!', '2024-05-27 21:22:46', 1),
(208, 47, 5, 1, 'Un ensemble de thé en porcelaine. Idéal pour les amateurs de thé.', '2024-05-27 21:22:46', 1),
(209, 47, 6, 4, 'Un autre ensemble de thé. Pas très excitant.', '2024-05-27 21:22:46', 1),
(210, 47, 7, 4, 'L\'ensemble de thé en porcelaine est très raffiné!', '2024-05-27 21:22:46', 1),
(211, 48, 5, 1, 'Une carte du monde encadrée. Super pour les amateurs de géographie.', '2024-05-27 21:22:46', 1),
(212, 48, 6, 3, 'Une autre carte. Classique.', '2024-05-27 21:22:46', 1),
(213, 48, 7, 5, 'La carte du monde encadrée est magnifique!', '2024-05-27 21:22:46', 1),
(214, 49, 5, 2, 'Des jumelles en cuir et laiton. Pour ceux qui aiment espionner.', '2024-05-27 21:22:46', 1),
(215, 49, 6, 3, 'Un autre paire de jumelles. Pas très excitant.', '2024-05-27 21:22:46', 1),
(216, 49, 7, 5, 'Les jumelles en cuir et laiton sont parfaites pour les explorations!', '2024-05-27 21:22:46', 1),
(217, 50, 5, 1, 'Un canevas brodé. Pour les amateurs d\'artisanat.', '2024-05-27 21:22:46', 1),
(218, 50, 6, 4, 'Un autre canevas. Rien de spécial.', '2024-05-27 21:22:46', 1),
(219, 50, 7, 4, 'Le canevas brodé est très joli!', '2024-05-27 21:22:46', 1),
(220, 51, 5, 1, 'Une smartwatch holographique. Pour ceux qui veulent impressionner.', '2024-05-27 21:22:46', 1),
(221, 51, 6, 2, 'Une autre smartwatch. Rien de spécial.', '2024-05-27 21:22:46', 1),
(222, 51, 7, 5, 'La smartwatch holographique est incroyable!', '2024-05-27 21:22:46', 1),
(223, 52, 5, 2, 'Des lunettes de réalité augmentée. Idéales pour les amateurs de technologie.', '2024-05-27 21:22:46', 1),
(224, 52, 6, 2, 'Une autre paire de lunettes. Pas très excitant.', '2024-05-27 21:22:46', 1),
(225, 52, 7, 5, 'Les lunettes de réalité augmentée sont fascinantes!', '2024-05-27 21:22:46', 1),
(226, 53, 5, 1, 'Une combinaison spatiale légère. Parfait pour ceux qui veulent jouer aux astronautes.', '2024-05-27 21:22:46', 1),
(227, 53, 6, 2, 'Une autre combinaison. Classique.', '2024-05-27 21:22:46', 1),
(228, 53, 7, 5, 'La combinaison spatiale légère est vraiment bien conçue!', '2024-05-27 21:22:46', 1),
(229, 54, 5, 1, 'Un drone personnel de transport. Pour ceux qui détestent marcher.', '2024-05-27 21:22:46', 1),
(230, 54, 6, 3, 'Un autre drone. Rien de spécial.', '2024-05-27 21:22:46', 1),
(231, 54, 7, 5, 'Le drone personnel de transport est fantastique!', '2024-05-27 21:22:46', 1),
(232, 55, 5, 1, 'Un panneau de commande domestique intelligent. Pour les amateurs de gadgets.', '2024-05-27 21:22:46', 1),
(233, 55, 6, 3, 'Un autre panneau de commande. Classique.', '2024-05-27 21:22:46', 1),
(234, 55, 7, 4, 'Le panneau de commande domestique intelligent est très pratique!', '2024-05-27 21:22:46', 1),
(235, 56, 5, 1, 'Un kit de jardinage hydroponique. Pour ceux qui aiment les plantes futuristes.', '2024-05-27 21:22:46', 1),
(236, 56, 6, 3, 'Un autre kit de jardinage. Rien de spécial.', '2024-05-27 21:22:46', 1),
(237, 56, 7, 4, 'Le kit de jardinage hydroponique est vraiment innovant!', '2024-05-27 21:22:46', 1),
(238, 57, 5, 2, 'Un robot assistant domestique. Pour ceux qui détestent faire les corvées.', '2024-05-27 21:22:46', 1),
(239, 57, 6, 3, 'Un autre robot. Classique.', '2024-05-27 21:22:46', 1),
(240, 57, 7, 5, 'Le robot assistant domestique est très utile!', '2024-05-27 21:22:46', 1),
(241, 58, 5, 2, 'Un chargeur solaire portable. Pour ceux qui veulent être écolos.', '2024-05-27 21:22:46', 1),
(242, 58, 6, 3, 'Un autre chargeur. Rien de spécial.', '2024-05-27 21:22:46', 1),
(243, 58, 7, 4, 'Le chargeur solaire portable est très pratique!', '2024-05-27 21:22:46', 1),
(244, 59, 5, 2, 'Une lampe LED à contrôle gestuel. Parfait pour les amateurs de technologie.', '2024-05-27 21:22:46', 1),
(245, 59, 6, 4, 'Une autre lampe. Classique.', '2024-05-27 21:22:46', 1),
(246, 59, 7, 5, 'La lampe LED à contrôle gestuel est vraiment cool!', '2024-05-27 21:22:46', 1),
(247, 60, 5, 1, 'Un casque de musique à conduction osseuse. Pour ceux qui veulent se démarquer.', '2024-05-27 21:22:46', 1),
(248, 60, 6, 4, 'Un autre casque. Pas très excitant.', '2024-05-27 21:22:46', 1),
(249, 60, 7, 4, 'Le casque de musique à conduction osseuse est fantastique!', '2024-05-27 21:22:46', 1),
(250, 61, 1, 5, 'Katana forgé à la main, absolument magnifique et tranchant.', '2024-05-28 15:30:00', 1),
(251, 61, 5, 1, 'Un katana forgé à la main... trop dangereux pour moi.', '2024-05-28 15:30:00', 1),
(252, 61, 6, 3, 'Katana bien fait, mais je ne m\'y connais pas vraiment en sabres.', '2024-05-28 15:30:00', 1),
(253, 61, 7, 5, 'Katana forgé à la main, impressionnant et bien équilibré.', '2024-05-28 15:30:00', 1),
(254, 62, 1, 5, 'Armure de samouraï, elle est magnifique et bien détaillée.', '2024-05-28 15:30:00', 1),
(255, 62, 5, 1, 'Armure de samouraï... trop encombrante.', '2024-05-28 15:30:00', 1),
(256, 62, 6, 3, 'Armure bien faite, mais vraiment lourde.', '2024-05-28 15:30:00', 1),
(257, 62, 7, 5, 'L\'armure de samouraï est incroyablement détaillée et bien conçue.', '2024-05-28 15:30:00', 1),
(258, 63, 1, 5, 'Yumi, arc japonais, très précis et bien fait.', '2024-05-28 15:30:00', 1),
(259, 63, 5, 1, 'Un arc japonais... pas très utile pour moi.', '2024-05-28 15:30:00', 1),
(260, 63, 6, 3, 'Arc intéressant, mais je ne suis pas archer.', '2024-05-28 15:30:00', 1),
(261, 63, 7, 5, 'Le yumi est magnifique et très efficace pour le tir à l\'arc.', '2024-05-28 15:30:00', 1),
(262, 64, 1, 5, 'Tanto, une dague courte mais extrêmement tranchante.', '2024-05-28 15:30:00', 1),
(263, 64, 5, 1, 'Dague... vraiment pas mon style.', '2024-05-28 15:30:00', 1),
(264, 64, 6, 3, 'Dague bien faite, mais je préfère les épées.', '2024-05-28 15:30:00', 1),
(265, 64, 7, 5, 'Le tanto est parfaitement équilibré et magnifiquement orné.', '2024-05-28 15:30:00', 1),
(266, 71, 1, 5, 'Tapis persan, absolument magnifique et riche en détails.', '2024-05-28 15:30:00', 1),
(267, 71, 5, 1, 'Un tapis persan... trop coloré pour mon goût.', '2024-05-28 15:30:00', 1),
(268, 71, 6, 3, 'J\'ai vu des tapis plus intéressants. Celui-ci est juste correct.', '2024-05-28 15:30:00', 1),
(269, 71, 7, 5, 'Ce tapis persan est magnifique ! Il embellit vraiment ma maison.', '2024-05-28 15:30:00', 1),
(270, 72, 1, 5, 'Vase en céramique, délicatement peint et très élégant.', '2024-05-28 15:30:00', 1),
(271, 72, 5, 1, 'Un vase en céramique... utile pour les fleurs peut-être.', '2024-05-28 15:30:00', 1),
(272, 72, 6, 4, 'Céramique classique, mais rien d\'exceptionnel.', '2024-05-28 15:30:00', 1),
(273, 72, 7, 4, 'Le vase en céramique est très joli et bien peint.', '2024-05-28 15:30:00', 1),
(274, 73, 1, 5, 'Bijou en or, finement ciselé et très élégant.', '2024-05-28 15:30:00', 1),
(275, 73, 5, 1, 'Un bijou en or... juste pour frimer.', '2024-05-28 15:30:00', 1),
(276, 73, 6, 3, 'Bijou élégant, mais rien de vraiment unique.', '2024-05-28 15:30:00', 1),
(277, 73, 7, 5, 'Ce bijou en or est absolument magnifique, j\'adore!', '2024-05-28 15:30:00', 1),
(278, 74, 1, 5, 'Astrolabe en laiton, très bien fait et fascinant.', '2024-05-28 15:30:00', 1),
(279, 74, 5, 1, 'Un astrolabe en laiton... pourquoi pas ?', '2024-05-28 15:30:00', 1),
(280, 74, 6, 3, 'Astrolabe intéressant, mais pas très utile de nos jours.', '2024-05-28 15:30:00', 1),
(281, 74, 7, 5, 'L\'astrolabe en laiton est très bien fait et fascinant.', '2024-05-28 15:30:00', 1),
(282, 80, 1, 5, 'Selle de cheval, robuste et très confortable.', '2024-05-28 15:30:00', 1),
(283, 80, 5, 1, 'Une selle de cheval... qui monte encore à cheval ?', '2024-05-28 15:30:00', 1),
(284, 80, 6, 4, 'Selle robuste, mais je n\'en ai pas vraiment besoin.', '2024-05-28 15:30:00', 1),
(285, 80, 7, 4, 'Cette selle de cheval est vraiment bien conçue et confortable.', '2024-05-28 15:30:00', 1),
(286, 81, 1, 5, 'Bottes en cuir, durables et très élégantes.', '2024-05-28 15:30:00', 1),
(287, 81, 5, 1, 'Des bottes en cuir... trop classiques.', '2024-05-28 15:30:00', 1),
(288, 81, 6, 3, 'Bottes solides, mais pas très stylées.', '2024-05-28 15:30:00', 1),
(289, 81, 7, 5, 'Les bottes en cuir sont parfaites pour l\'aventure!', '2024-05-28 15:30:00', 1),
(290, 82, 1, 5, 'Ceinture à revolver, pratique et bien conçue.', '2024-05-28 15:30:00', 1),
(291, 82, 5, 1, 'Une ceinture à revolver... sérieusement ?', '2024-05-28 15:30:00', 1),
(292, 82, 6, 3, 'Ceinture pratique, mais qui porte encore des revolvers ?', '2024-05-28 15:30:00', 1),
(293, 82, 7, 5, 'La ceinture à revolver est super pratique et bien faite!', '2024-05-28 15:30:00', 1),
(296, 31, 1, 5, 'Le globe tourne et a tourné !', '2024-05-29 04:29:41', 1),
(302, 21, 1, 4, 'Franchement pas mal, mais il faut l\'aiguiser avant de l\'utiliser.', '2024-06-02 13:36:52', 1);

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
(139, 'conduction osseuse'),
(140, 'boire'),
(141, 'clenche'),
(142, 'beige'),
(143, 'rouille'),
(144, 'léger'),
(145, 'tête'),
(146, 'association'),
(147, 'fragile'),
(148, 'encre'),
(149, 'touches'),
(150, 'papier'),
(151, 'poignet'),
(152, 'lumière'),
(153, 'domestique'),
(154, 'cher'),
(155, 'heure'),
(156, 'collier'),
(157, 'corde'),
(158, 'robe'),
(159, 'tissu'),
(160, 'brodée'),
(161, 'ramage'),
(162, 'ficelle'),
(163, 'Terre'),
(164, 'arc'),
(165, 'poigne');

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
(42, 'Atlas le Révolutionnaire'),
(43, 'Takeshi le Forgeron'),
(44, 'Hiroshi l\'Armurier'),
(45, 'Akira l\'Archer'),
(46, 'Kenji le Daguier'),
(47, 'Yuki la Céramiste'),
(48, 'Aiko la Couturière'),
(49, 'Sakura l\'Artiste'),
(50, 'Nobu l\'Illuminateur'),
(51, 'Hina la Peintre'),
(52, 'Mika la Fabricante de Poupées'),
(53, 'Ali le Tisserand'),
(54, 'Fatima la Céramiste'),
(55, 'Ibrahim le Bijoutier'),
(56, 'Omar l\'Astronome'),
(57, 'Aisha la Scribe'),
(58, 'Yusuf le Géographe'),
(59, 'Layla la Couturière'),
(60, 'Hassan le Tisseur'),
(61, 'Zahra la Brodeuse'),
(62, 'Billy le Maréchal-ferrant'),
(63, 'Sarah la Cordonnière'),
(64, 'John le Sellier'),
(65, 'Wyatt le Pistoleiro'),
(66, 'Clara la Chasseresse'),
(67, 'Sam le Trappeur'),
(68, 'Jessie la Modiste'),
(69, 'Tom le Forgeron'),
(70, 'Nancy l\'Artisane');

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
(18, 6, 'Environnement et Énergie'),
(19, 7, 'Armes et Armures'),
(20, 7, 'Vie Quotidienne et Culture'),
(21, 7, 'Artisanat et Décoration'),
(22, 8, 'Art et Ornements'),
(23, 8, 'Instruments Scientifiques'),
(24, 8, 'Textiles et Vêtements'),
(25, 9, 'Équipement de Cowboy'),
(26, 9, 'Armes et Défense'),
(27, 9, 'Objets de Vie Quotidienne');

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
(1, 'nawfel', 'nawfel.idaali@free.fr', '$2y$10$bQuKCibaLN6Crelr66Qtoe7nEBWzmEXDMf1E.J3dA3EBJmkYnO/za', '2024-05-18 02:07:28', 1, '2024-06-02 13:36:35'),
(5, 'chat_malo', 'chat_malo@example.com', '$2y$10$chamaloPasswordHash', '2024-05-27 21:10:00', 0, '2024-05-27 21:10:00'),
(6, 'bavard_flu', 'bavard_flu@example.com', '$2y$10$bavardfluPasswordHash', '2024-05-27 21:10:00', 0, '2024-05-27 21:10:00'),
(7, 'tarte_ocitron', 'tarte_ocitron@example.com', '$2y$10$tarteocitronPasswordHash', '2024-05-27 21:10:00', 0, '2024-05-27 21:10:00');

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
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT pour la table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `keyword_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT pour la table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `subcategory_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
