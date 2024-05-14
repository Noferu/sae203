CREATE TABLE `subcategories`(
    `subcategory_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `subcategories` ADD INDEX `subcategories_category_id_index`(`category_id`);
CREATE TABLE `comments`(
    `comment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `article_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `rating_score` INT NOT NULL,
    `content` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL
);
ALTER TABLE
    `comments` ADD INDEX `comments_article_id_index`(`article_id`);
ALTER TABLE
    `comments` ADD INDEX `comments_user_id_index`(`user_id`);
CREATE TABLE `images`(
    `image_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `article_id` INT NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `images` ADD INDEX `images_article_id_index`(`article_id`);
CREATE TABLE `keywords`(
    `keyword_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `keyword` VARCHAR(255) NOT NULL
);
CREATE TABLE `in_basket`(
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT INDEX,
    `article_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `date` DATETIME NOT NULL
);
ALTER TABLE
    `in_basket` ADD INDEX `in_basket_article_id_index`(`article_id`);
CREATE TABLE `categories`(
    `category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `currency_name` VARCHAR(255) NOT NULL,
    `currency_rate` DOUBLE(8, 2) NOT NULL
);
ALTER TABLE
    `categories` ADD UNIQUE `categories_name_unique`(`name`);
CREATE TABLE `favorites`(
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT INDEX,
    `article_id` INT NOT NULL
);
ALTER TABLE
    `favorites` ADD INDEX `favorites_article_id_index`(`article_id`);
CREATE TABLE `articles`(
    `article_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `subcategory_id` INT NOT NULL,
    `seller_id` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `price` DOUBLE(8, 2) NOT NULL,
    `sale_year` INT NOT NULL,
    `stock` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `articles` ADD INDEX `articles_subcategory_id_index`(`subcategory_id`);
ALTER TABLE
    `articles` ADD INDEX `articles_seller_id_index`(`seller_id`);
CREATE TABLE `sellers`(
    `seller_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `articles_keywords`(
    `article_id` INT UNSIGNED NOT NULL AUTO_INCREMENT INDEX,
    `keyword_id` INT NOT NULL
);
ALTER TABLE
    `articles_keywords` ADD INDEX `articles_keywords_keyword_id_index`(`keyword_id`);
CREATE TABLE `users`(
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password_hash` CHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `is_admin` TINYINT(1) NOT NULL
);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `images` ADD CONSTRAINT `images_article_id_foreign` FOREIGN KEY(`article_id`) REFERENCES `articles`(`article_id`);
ALTER TABLE
    `subcategories` ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`);
ALTER TABLE
    `articles_keywords` ADD CONSTRAINT `articles_keywords_article_id_foreign` FOREIGN KEY(`article_id`) REFERENCES `articles`(`article_id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`);
ALTER TABLE
    `favorites` ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `articles`(`article_id`);
ALTER TABLE
    `in_basket` ADD CONSTRAINT `in_basket_article_id_foreign` FOREIGN KEY(`article_id`) REFERENCES `articles`(`article_id`);
ALTER TABLE
    `favorites` ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`);
ALTER TABLE
    `articles_keywords` ADD CONSTRAINT `articles_keywords_keyword_id_foreign` FOREIGN KEY(`keyword_id`) REFERENCES `keywords`(`keyword_id`);
ALTER TABLE
    `articles` ADD CONSTRAINT `articles_subcategory_id_foreign` FOREIGN KEY(`subcategory_id`) REFERENCES `subcategories`(`subcategory_id`);
ALTER TABLE
    `in_basket` ADD CONSTRAINT `in_basket_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`);
ALTER TABLE
    `articles` ADD CONSTRAINT `articles_seller_id_foreign` FOREIGN KEY(`seller_id`) REFERENCES `sellers`(`seller_id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY(`article_id`) REFERENCES `articles`(`article_id`);