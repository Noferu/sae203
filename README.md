# SAE 203 - Era Explorer

## Description

"Era Explorer" est un projet d'e-commerce scolaire réalisé dans le cadre de la troisième Situation d'Apprentissage et d'Évaluation (SAE) du deuxième semestre du BUT MMI à Haguenau. Le site propose une expérience immersive permettant aux utilisateurs de voyager à travers différentes époques historiques et d'explorer des produits typiques de chaque période. Ce projet utilise PHP, Twig, HTML, CSS, JavaScript et SQL pour créer un site web interactif et responsive.

## Objectifs

L'objectif principal de ce projet est d'être évalué sur les compétences acquises durant l'année, notamment :

- Développer pour le web et les médias numériques
- Produire du code fonctionnel, sobre et réutilisable
- Modéliser les données et les traitements d'une application web
- Intégrer des pages web fluides et accessibles

## Public Cible

Le projet est principalement destiné à être évalué par les professeurs. Il sera également visible par les camarades de promotion et potentiellement partagé publiquement pour attirer l'attention des recruteurs.

## Technologies Utilisées

- **Frontend** : HTML, CSS, JavaScript (Ajax)
- **Backend** : PHP, Twig
- **Base de Données** : MySQL (InnoDB)

## Fonctionnalités Principales

- Navigation temporelle immersive à travers différentes époques (néolithique, antiquité, moyen âge, renaissance, époque moderne, futur, féodal, islamique, western)
- Affichage des produits sous forme de vignettes ou de listes
- Possibilité de consulter et d'acheter des articles fictifs
- Système de notation et de commentaires des articles
- Connexion et inscription des utilisateurs
- Ajout de mots-clés
- Suppression de ses propres commentaires
- Affichage détaillé des produits
- Musiques d'ambiance selon les époques
- Affichage des articles les mieux notés sur la page d'accueil
- Filtres sur la vue en liste
- Ajout d'articles au panier et/ou aux favoris
- Interaction avec le panier et les favoris

## Prérequis

- Serveur web avec support PHP (ex : XAMPP, WAMP)
- Base de données MySQL
- Installation de Twig via Composer

## Installation

1. **Cloner le dépôt** :

   ```bash
   git clone https://github.com/Noferu/sae203.git
   cd sae203
   ```

2. **Installer les dépendances avec Composer** :

   ```bash
   composer install
   ```

3. **Configurer la base de données** :

   - Créez une base de données MySQL.
   - Importez le fichier `bdd_sae203.sql` situé dans le dossier `database`.
   - Modifiez les paramètres de connexion à la base de données dans le fichier `config/config.php`.

4. **Lancer le serveur local** (ex : avec XAMPP) et accéder au projet via `http://localhost/sae203/index.php`.

## Utilisation

Accédez à la racine du projet via votre navigateur : `http://localhost/sae203/index.php`.

## Contribution

Ce projet est principalement un projet scolaire. Toutefois, les contributions sont les bienvenues :

- Donnez votre avis et conseils.
- Signalez les problèmes ou proposez des améliorations via des pull requests.

## Arborescence des fichiers

```
sae203/
├── .htaccess
├── composer.json
├── composer.lock
├── index.php
├── LICENSE
├── README.md
├── assets/
│ ├── audio/
│ │ └── sfx/
│ │ ├── boing.mp3
│ │ ├── click.mp3
│ │ ├── clicked.mp3
│ │ ├── pow.mp3
│ │ ├── running.mp3
│ │ ├── water_rush.mp3
│ │ ├── whoosh1.mp3
│ │ ├── whoosh2.mp3
│ │ ├── whoosh3.mp3
│ │ ├── whoosh4.mp3
│ │ ├── whoosh5.mp3
│ │ ├── whoosh6.mp3
│ │ └── whoosh7.mp3
│ ├── css/
│ │ ├── command.css
│ │ ├── favcart.css
│ │ ├── home.css
│ │ ├── product_detail.css
│ │ ├── product_grid.css
│ │ ├── product_list.css
│ │ ├── product_search.css
│ │ ├── reset.css
│ │ ├── style.css
│ │ └── user_connexion.css
│ ├── images/
│ │ ├── articles/
│ │ │ ├── antiquite/
│ │ │ │ ├── amphore-en-ceramique.webp
│ │ │ │ ├── collier-en-perles-de-verre.webp
│ │ │ │ ├── couronne-de-laurier-en-metal-dore.webp
│ │ │ │ └── fresque-murale-portable.webp
│ │ ├── banner/
│ │ │ ├── panoramic_sunset_landscape.webp
│ │ │ └── panoramic_sunset_landscape_blurred.webp
│ │ ├── currency_icons/
│ │ │ ├── coquillage.webp
│ │ │ ├── credit.webp
│ │ │ ├── denier.webp
│ │ │ ├── dirham.webp
│ │ │ ├── dirham1.webp
│ │ │ ├── dirham2.webp
│ │ │ ├── dollar.webp
│ │ │ ├── ecu.webp
│ │ │ ├── florin.webp
│ │ │ ├── livre.webp
│ │ │ └── mon.webp
│ │ ├── icons/
│ │ │ └── wave.ico
│ │ └── timeline_images/
│ │ ├── thumbnail-antiquite.webp
│ │ ├── thumbnail-futur.webp
│ │ ├── thumbnail-hoken-seido.webp
│ │ ├── thumbnail-islamique.webp
│ │ ├── thumbnail-moderne.webp
│ │ ├── thumbnail-moyenage.webp
│ │ ├── thumbnail-neolithique.webp
│ │ ├── thumbnail-renaissance.webp
│ │ └── thumbnail-western.webp
│ ├── js/
│ ├── articleFilterManager.js
│ ├── articleLens.js
│ ├── articleListAnimation.js
│ ├── backButton.js
│ ├── cardHoverEffect.js
│ ├── commentRatingManager.js
│ ├── dynamicFaviconAnimator.js
│ ├── favcartManager.js
│ ├── homeEffects.js
│ ├── interactiveTimeline.js
│ ├── keywordAdder.js
│ ├── loginFormHandler.js
│ ├── miscellaneousEffects.js
│ └── soundsEffectManager.js
├── config/
│ └── config.php
├── database/
│ ├── bdd_sae203.sql
│ └── MCD_BDD.png
├── include/
│ ├── add_keyword.php
│ ├── comment_controller.php
│ ├── connexion.php
│ ├── connexion_controller.php
│ ├── data_access.php
│ ├── favcart_controller.php
│ ├── fetch_articles.php
│ ├── twig.php
│ └── UserService.php
├── pages/
│ ├── checkout.php
│ ├── error.php
│ ├── product.php
│ └── user_connexion.php
├── templates/
│ ├── checkout.twig
│ ├── error.twig
│ ├── home.twig
│ ├── user_connexion.twig
│ ├── includes/
│ │ ├── base.twig
│ │ ├── footer.twig
│ │ └── header.twig
│ └── product/
│ ├── product_detail.twig
│ ├── product_grid.twig
│ ├── product_list.twig
│ └── product_search.twig
├── wireframes/
│ ├── article_page.png
│ ├── cart_confirmation_page.png
│ ├── checkout_page.png
│ ├── favorites_page.png
│ ├── grid_page.png
│ ├── home_page.png
│ ├── list_page.png
│ ├── login_page.png
│ └── maquettes.pdf
```

## Modèle Conceptuel de Données (MCD)

Voici le Modèle Conceptuel de Données utilisé pour ce projet :

![Modèle Conceptuel de Données](database/MCD_BDD.png)

## Consignes et Objectifs Pédagogiques

Ce projet vise à valider plusieurs compétences clés :

- Combiner les ressources liées au développement et à la gestion des bases de données.
- Produire des pages fluides, valides et accessibles en respectant les normes du W3C.
- Mettre en ligne une application Web en utilisant une solution d’hébergement standard.

## Portfolio

Découvrez mes autres projets sur mon [portfolio](https://www.ida.etu.mmi-unistra.fr/).

## Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.
