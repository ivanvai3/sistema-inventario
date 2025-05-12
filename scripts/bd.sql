/*
 Navicat Premium Data Transfer

 Source Server         : cliskin
 Source Server Type    : MySQL
 Source Server Version : 50723 (5.7.23-23)
 Source Host           : cliskin.com:3306
 Source Schema         : cliskinc_bd_gravity

 Target Server Type    : MySQL
 Target Server Version : 50723 (5.7.23-23)
 File Encoding         : 65001

 Date: 12/05/2025 07:05:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_11_000000_create_roles_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2025_05_12_075648_create_products_table', 1);
INSERT INTO `migrations` VALUES (6, '2025_05_12_080158_create_movements_table', 1);

-- ----------------------------
-- Table structure for movements
-- ----------------------------
DROP TABLE IF EXISTS `movements`;
CREATE TABLE `movements`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('entrada','salida') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `movements_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `movements_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `movements_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `movements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movements
-- ----------------------------
INSERT INTO `movements` VALUES (1, 1, 1, 'entrada', 1, '2025-05-12 09:46:19', '2025-05-12 09:46:19');
INSERT INTO `movements` VALUES (2, 1, 1, 'entrada', 1, '2025-05-12 09:48:43', '2025-05-12 09:48:43');
INSERT INTO `movements` VALUES (3, 2, 1, 'entrada', 10, '2025-05-12 09:50:08', '2025-05-12 09:50:08');
INSERT INTO `movements` VALUES (4, 2, 1, 'salida', 1, '2025-05-12 09:50:36', '2025-05-12 09:50:36');
INSERT INTO `movements` VALUES (5, 5, 1, 'entrada', 10, '2025-05-12 10:41:03', '2025-05-12 10:41:03');
INSERT INTO `movements` VALUES (6, 5, 2, 'salida', 1, '2025-05-12 10:44:40', '2025-05-12 10:44:40');
INSERT INTO `movements` VALUES (7, 5, 2, 'salida', 1, '2025-05-12 10:47:37', '2025-05-12 10:47:37');
INSERT INTO `movements` VALUES (8, 5, 2, 'salida', 1, '2025-05-12 10:52:02', '2025-05-12 10:52:02');
INSERT INTO `movements` VALUES (9, 4, 2, 'salida', 5, '2025-05-12 10:52:44', '2025-05-12 10:52:44');
INSERT INTO `movements` VALUES (10, 3, 1, 'entrada', 12, '2025-05-12 12:16:43', '2025-05-12 12:16:43');
INSERT INTO `movements` VALUES (11, 3, 1, 'entrada', 3, '2025-05-12 12:17:29', '2025-05-12 12:17:29');
INSERT INTO `movements` VALUES (12, 3, 1, 'entrada', 3, '2025-05-12 12:17:45', '2025-05-12 12:17:45');
INSERT INTO `movements` VALUES (13, 7, 1, 'entrada', 30, '2025-05-12 12:27:24', '2025-05-12 12:27:24');
INSERT INTO `movements` VALUES (14, 7, 2, 'salida', 10, '2025-05-12 12:28:43', '2025-05-12 12:28:43');
INSERT INTO `movements` VALUES (15, 8, 1, 'entrada', 50, '2025-05-12 12:54:00', '2025-05-12 12:54:00');
INSERT INTO `movements` VALUES (16, 8, 2, 'salida', 25, '2025-05-12 12:55:30', '2025-05-12 12:55:30');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'producto 1', NULL, 2, 0, NULL, '2025-05-12 10:09:59');
INSERT INTO `products` VALUES (2, 'producto 2', NULL, 9, 1, NULL, '2025-05-12 09:50:36');
INSERT INTO `products` VALUES (3, 'producto 3', NULL, 18, 1, NULL, '2025-05-12 12:17:45');
INSERT INTO `products` VALUES (4, 'test', 'descrip test', 5, 1, '2025-05-12 08:57:30', '2025-05-12 10:52:44');
INSERT INTO `products` VALUES (5, 'test2', 'descrip2', 7, 1, '2025-05-12 10:40:50', '2025-05-12 10:52:01');
INSERT INTO `products` VALUES (6, 'test 3', 'descrip 3', 0, 0, '2025-05-12 12:15:50', '2025-05-12 12:27:08');
INSERT INTO `products` VALUES (7, 'producto nuevo', 'alguna descripcion', 20, 1, '2025-05-12 12:26:41', '2025-05-12 12:28:42');
INSERT INTO `products` VALUES (8, 'producto de prueba', 'descripcion de producto demo', 25, 1, '2025-05-12 12:53:27', '2025-05-12 12:55:30');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrador', '2025-05-12 08:27:33', '2025-05-12 08:27:33');
INSERT INTO `roles` VALUES (2, 'Almacenista', '2025-05-12 08:27:34', '2025-05-12 08:27:34');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `estatus` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@mail.com', '$2y$10$/PCQLZcJRHKPQ8pXXEgV8uAqthtUNlBR8lqRV760JS9GHsLMJFkh.', 1, 1, NULL, '2025-05-12 08:27:47', '2025-05-12 08:27:47');
INSERT INTO `users` VALUES (2, 'almacenista', 'almacen@mail.com', '$2y$10$/PCQLZcJRHKPQ8pXXEgV8uAqthtUNlBR8lqRV760JS9GHsLMJFkh.', 2, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 'ivan', 'ivan@correo.com', '$2y$10$/PCQLZcJRHKPQ8pXXEgV8uAqthtUNlBR8lqRV760JS9GHsLMJFkh.', 2, 1, NULL, '2025-05-12 10:56:43', '2025-05-12 10:56:43');

SET FOREIGN_KEY_CHECKS = 1;
