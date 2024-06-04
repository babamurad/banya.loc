--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.1.22.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 04.06.2024 22:50:47
-- Версия сервера: 5.7.39
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE banya;

--
-- Удалить процедуру `procedure2`
--
DROP PROCEDURE IF EXISTS procedure2;

--
-- Удалить процедуру `procTimeList`
--
DROP PROCEDURE IF EXISTS procTimeList;

--
-- Удалить таблицу `addresses`
--
DROP TABLE IF EXISTS addresses;

--
-- Удалить таблицу `discounts`
--
DROP TABLE IF EXISTS discounts;

--
-- Удалить таблицу `failed_jobs`
--
DROP TABLE IF EXISTS failed_jobs;

--
-- Удалить таблицу `migrations`
--
DROP TABLE IF EXISTS migrations;

--
-- Удалить таблицу `newtable`
--
DROP TABLE IF EXISTS newtable;

--
-- Удалить таблицу `numerators`
--
DROP TABLE IF EXISTS numerators;

--
-- Удалить таблицу `password_reset_tokens`
--
DROP TABLE IF EXISTS password_reset_tokens;

--
-- Удалить таблицу `permissions`
--
DROP TABLE IF EXISTS permissions;

--
-- Удалить таблицу `personal_access_tokens`
--
DROP TABLE IF EXISTS personal_access_tokens;

--
-- Удалить таблицу `posts`
--
DROP TABLE IF EXISTS posts;

--
-- Удалить таблицу `table1`
--
DROP TABLE IF EXISTS table1;

--
-- Удалить таблицу `temp_orders`
--
DROP TABLE IF EXISTS temp_orders;

--
-- Удалить таблицу `temp_order_details`
--
DROP TABLE IF EXISTS temp_order_details;

--
-- Удалить таблицу `time_list`
--
DROP TABLE IF EXISTS time_list;

--
-- Удалить таблицу `users`
--
DROP TABLE IF EXISTS users;

--
-- Удалить таблицу `user_roles`
--
DROP TABLE IF EXISTS user_roles;

--
-- Удалить процедуру `procGetOrderTime`
--
DROP PROCEDURE IF EXISTS procGetOrderTime;

--
-- Удалить процедуру `ClearOrderTime`
--
DROP PROCEDURE IF EXISTS ClearOrderTime;

--
-- Удалить таблицу `time_tb`
--
DROP TABLE IF EXISTS time_tb;

--
-- Удалить таблицу `events`
--
DROP TABLE IF EXISTS events;

--
-- Удалить процедуру `procDelIfEmpty`
--
DROP PROCEDURE IF EXISTS procDelIfEmpty;

--
-- Удалить процедуру `procNewNumber`
--
DROP PROCEDURE IF EXISTS procNewNumber;

--
-- Удалить процедуру `procTimeDiff`
--
DROP PROCEDURE IF EXISTS procTimeDiff;

--
-- Удалить таблицу `orders`
--
DROP TABLE IF EXISTS orders;

--
-- Удалить таблицу `clients`
--
DROP TABLE IF EXISTS clients;

--
-- Удалить таблицу `order_details`
--
DROP TABLE IF EXISTS order_details;

--
-- Удалить таблицу `employes`
--
DROP TABLE IF EXISTS employes;

--
-- Удалить таблицу `job_titles`
--
DROP TABLE IF EXISTS job_titles;

--
-- Удалить таблицу `departments`
--
DROP TABLE IF EXISTS departments;

--
-- Удалить таблицу `roles`
--
DROP TABLE IF EXISTS roles;

--
-- Установка базы данных по умолчанию
--
USE banya;

--
-- Создать таблицу `roles`
--
CREATE TABLE roles (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  `group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `name` для объекта типа таблица `roles`
--
ALTER TABLE roles
ADD UNIQUE INDEX name (name);

--
-- Создать таблицу `departments`
--
CREATE TABLE departments (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  price decimal(19, 2) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `job_titles`
--
CREATE TABLE job_titles (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  employe_id bigint(20) DEFAULT NULL,
  sum decimal(10, 2) DEFAULT NULL,
  qty decimal(10, 2) DEFAULT NULL,
  time smallint(6) DEFAULT NULL,
  price decimal(10, 2) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 21,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `job_titles_name_unique` для объекта типа таблица `job_titles`
--
ALTER TABLE job_titles
ADD UNIQUE INDEX job_titles_name_unique (name);

--
-- Создать таблицу `employes`
--
CREATE TABLE employes (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  image varchar(255) DEFAULT NULL,
  first_name varchar(255) DEFAULT NULL,
  last_name varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  address text DEFAULT NULL,
  department_id bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  jobtitle_id bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  role_id bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE employes
ADD CONSTRAINT employes_department_id_foreign FOREIGN KEY (department_id)
REFERENCES departments (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE employes
ADD CONSTRAINT employes_jobtitle_id_foreign FOREIGN KEY (jobtitle_id)
REFERENCES job_titles (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE employes
ADD CONSTRAINT employes_role_id_foreign FOREIGN KEY (role_id)
REFERENCES roles (id) ON DELETE CASCADE;

--
-- Создать таблицу `order_details`
--
CREATE TABLE order_details (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  num int(11) DEFAULT NULL,
  order_id bigint(20) UNSIGNED NOT NULL,
  jobtitle_id bigint(20) UNSIGNED NOT NULL,
  employes_id bigint(20) UNSIGNED NOT NULL,
  start time DEFAULT NULL,
  end time DEFAULT NULL,
  qty decimal(10, 2) DEFAULT NULL,
  price decimal(10, 2) DEFAULT NULL,
  sum decimal(10, 2) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 67,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE order_details
ADD CONSTRAINT FK_order_details_employes FOREIGN KEY (employes_id)
REFERENCES employes (id);

--
-- Создать внешний ключ
--
ALTER TABLE order_details
ADD CONSTRAINT order_details_jobtitle_id_foreign FOREIGN KEY (jobtitle_id)
REFERENCES job_titles (id) ON DELETE CASCADE;

--
-- Создать таблицу `clients`
--
CREATE TABLE clients (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 137,
AVG_ROW_LENGTH = 207,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `orders`
--
CREATE TABLE orders (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  num varchar(255) NOT NULL,
  data date NOT NULL,
  employes_id bigint(20) UNSIGNED NOT NULL,
  clients_id bigint(20) UNSIGNED NOT NULL,
  department_id bigint(20) UNSIGNED DEFAULT NULL,
  user_id bigint(20) DEFAULT NULL,
  start time DEFAULT NULL,
  end time DEFAULT NULL,
  sum decimal(10, 2) NOT NULL DEFAULT 0.00,
  `desc` text DEFAULT NULL,
  gender tinyint(4) DEFAULT 1,
  adults smallint(6) DEFAULT NULL,
  children smallint(6) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 264,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `orders_num_unique` для объекта типа таблица `orders`
--
ALTER TABLE orders
ADD UNIQUE INDEX orders_num_unique (num);

--
-- Создать внешний ключ
--
ALTER TABLE orders
ADD CONSTRAINT FK_orders_department_id FOREIGN KEY (department_id)
REFERENCES departments (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE orders
ADD CONSTRAINT orders_clients_id_foreign FOREIGN KEY (clients_id)
REFERENCES clients (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE orders
ADD CONSTRAINT orders_employes_id_foreign FOREIGN KEY (employes_id)
REFERENCES employes (id);

DELIMITER $$

--
-- Создать процедуру `procTimeDiff`
--
CREATE DEFINER = 'root'@'%'
PROCEDURE procTimeDiff (IN num int)
BEGIN
  SELECT
    TIME_TO_SEC(TIMEDIFF(od.end, od.start)) / 3600 AS tDiff
  FROM orders od
  WHERE od.num = num;
END
$$

--
-- Создать процедуру `procNewNumber`
--
CREATE DEFINER = 'root'@'%'
PROCEDURE procNewNumber ()
BEGIN
  SELECT
    (num + 1) AS Number
  FROM orders o
  ORDER BY id DESC LIMIT 0, 1;
END
$$

--
-- Создать процедуру `procDelIfEmpty`
--
CREATE DEFINER = 'root'@'%'
PROCEDURE procDelIfEmpty (IN order_id int)
BEGIN
  DELETE
    FROM orders
  WHERE num = order_id
    AND start IS NULL
    OR end IS NULL;
END
$$

DELIMITER ;

--
-- Создать таблицу `events`
--
CREATE TABLE events (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  start varchar(255) DEFAULT NULL,
  end varchar(255) DEFAULT NULL,
  order_id bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  client_id bigint(20) UNSIGNED ZEROFILL NOT NULL,
  department_id bigint(20) UNSIGNED NOT NULL,
  startOrder timestamp NOT NULL DEFAULT '2023-12-28 09:28:45',
  endOrder timestamp NOT NULL DEFAULT '2023-12-28 09:28:45',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE events
ADD CONSTRAINT FK_events_clients FOREIGN KEY (client_id)
REFERENCES clients (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE events
ADD CONSTRAINT FK_events_departments FOREIGN KEY (department_id)
REFERENCES departments (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `time_tb`
--
CREATE TABLE time_tb (
  id int(11) NOT NULL AUTO_INCREMENT,
  data date DEFAULT NULL,
  time time DEFAULT NULL,
  order_time varchar(50) DEFAULT NULL,
  order_id bigint(20) DEFAULT NULL,
  busy tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 94,
AVG_ROW_LENGTH = 170,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

DELIMITER $$

--
-- Создать процедуру `ClearOrderTime`
--
CREATE DEFINER = 'root'@'%'
PROCEDURE ClearOrderTime ()
BEGIN
  UPDATE time_tb tt
  SET tt.busy = FALSE,
      tt.order_time = '',
      tt.order_id = 0;
END
$$

--
-- Создать процедуру `procGetOrderTime`
--
CREATE DEFINER = 'root'@'%'
PROCEDURE procGetOrderTime (IN data date, IN department int)
BEGIN
  CALL ClearOrderTime();
  IF department IS NULL THEN
    SET department = 1;
  END IF;


  UPDATE time_tb tt, order_details od, orders o
  SET tt.busy = TRUE,
      tt.order_time = tt.time,
      od.order_id = o.id,
      tt.order_id = o.id
  WHERE tt.time >= o.start
  AND tt.time <= o.end
  AND o.data = data
  AND o.department_id = department;
-- Добавить время заказа в таблицу заказов
END
$$

DELIMITER ;

--
-- Создать таблицу `user_roles`
--
CREATE TABLE user_roles (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED NOT NULL,
  role_id bigint(20) UNSIGNED NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `users`
--
CREATE TABLE users (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  first_name varchar(255) DEFAULT NULL,
  last_name varchar(255) DEFAULT NULL,
  email varchar(255) NOT NULL,
  email_verified_at timestamp NULL DEFAULT NULL,
  password varchar(255) NOT NULL,
  remember_token varchar(100) DEFAULT NULL,
  post_id bigint(20) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  utype varchar(255) NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for Normal user',
  status enum ('Активирован', 'Не активирован') NOT NULL DEFAULT 'Не активирован',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 136,
AVG_ROW_LENGTH = 472,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `users_email_unique` для объекта типа таблица `users`
--
ALTER TABLE users
ADD UNIQUE INDEX users_email_unique (email);

--
-- Создать таблицу `time_list`
--
CREATE TABLE time_list (
  id int(11) NOT NULL AUTO_INCREMENT,
  time time DEFAULT NULL,
  busy tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 94,
AVG_ROW_LENGTH = 170,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `temp_order_details`
--
CREATE TABLE temp_order_details (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  num int(11) DEFAULT NULL,
  order_id bigint(20) UNSIGNED NOT NULL,
  jobtitle_id bigint(20) UNSIGNED NOT NULL,
  employes_id bigint(20) UNSIGNED NOT NULL,
  start time DEFAULT NULL,
  end time DEFAULT NULL,
  qty decimal(10, 2) DEFAULT NULL,
  price decimal(10, 2) DEFAULT NULL,
  sum decimal(10, 2) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `temp_orders`
--
CREATE TABLE temp_orders (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  num varchar(255) NOT NULL,
  data date NOT NULL,
  employes_id bigint(20) UNSIGNED NOT NULL,
  user_id bigint(20) UNSIGNED NOT NULL,
  clients_id bigint(20) UNSIGNED NOT NULL,
  department_id bigint(20) UNSIGNED DEFAULT NULL,
  sum decimal(10, 2) NOT NULL DEFAULT 0.00,
  `desc` text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `table1`
--
CREATE TABLE table1 (
  id int(11) NOT NULL,
  name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `posts`
--
CREATE TABLE posts (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  salary varchar(255) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `personal_access_tokens`
--
CREATE TABLE personal_access_tokens (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  tokenable_type varchar(255) NOT NULL,
  tokenable_id bigint(20) UNSIGNED NOT NULL,
  name varchar(255) NOT NULL,
  token varchar(64) NOT NULL,
  abilities text DEFAULT NULL,
  last_used_at timestamp NULL DEFAULT NULL,
  expires_at timestamp NULL DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `personal_access_tokens_token_unique` для объекта типа таблица `personal_access_tokens`
--
ALTER TABLE personal_access_tokens
ADD UNIQUE INDEX personal_access_tokens_token_unique (token);

--
-- Создать индекс `personal_access_tokens_tokenable_type_tokenable_id_index` для объекта типа таблица `personal_access_tokens`
--
ALTER TABLE personal_access_tokens
ADD INDEX personal_access_tokens_tokenable_type_tokenable_id_index (tokenable_type, tokenable_id);

--
-- Создать таблицу `permissions`
--
CREATE TABLE permissions (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  `group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `name` для объекта типа таблица `permissions`
--
ALTER TABLE permissions
ADD UNIQUE INDEX name (name);

--
-- Создать таблицу `password_reset_tokens`
--
CREATE TABLE password_reset_tokens (
  email varchar(255) NOT NULL,
  token varchar(255) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (email)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `numerators`
--
CREATE TABLE numerators (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  prefix varchar(255) DEFAULT NULL,
  num int(11) NOT NULL,
  postfix varchar(255) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `newtable`
--
CREATE TABLE newtable (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `migrations`
--
CREATE TABLE migrations (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  migration varchar(255) NOT NULL,
  batch int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 27,
AVG_ROW_LENGTH = 910,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `failed_jobs`
--
CREATE TABLE failed_jobs (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  uuid varchar(255) NOT NULL,
  `connection` text NOT NULL,
  queue text NOT NULL,
  payload longtext NOT NULL,
  exception longtext NOT NULL,
  failed_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `failed_jobs_uuid_unique` для объекта типа таблица `failed_jobs`
--
ALTER TABLE failed_jobs
ADD UNIQUE INDEX failed_jobs_uuid_unique (uuid);

--
-- Создать таблицу `discounts`
--
CREATE TABLE discounts (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  percent decimal(10, 2) NOT NULL DEFAULT 0.00,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `addresses`
--
CREATE TABLE addresses (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED NOT NULL,
  address text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 21,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `addresses_user_id_foreign` для объекта типа таблица `addresses`
--
ALTER TABLE addresses
ADD INDEX addresses_user_id_foreign (user_id);

DELIMITER $$

--
-- Создать процедуру `procTimeList`
--
CREATE DEFINER = 'root'@'%'
PROCEDURE procTimeList (IN department_id int, IN data date)
BEGIN
  SELECT
    tl.id,
    tl.time
  FROM time_list tl;
/*WHERE tl.time NOT IN 
(SELECT
    tl.time
  FROM time_list tl,
       (SELECT
           od.start,
           od.end
         FROM order_details od,
              orders o
         WHERE od.order_id = o.id
         AND o.department_id = department_id
         AND o.data = data) AS od*/

/*    WHERE tl.time >= od.start
    AND tl.time <= od.end - 900;*/
-- В модальном окне добавления/редактирования показывать только доступное время
-- Это свободное время которое не было заказано и можно заказать
END
$$

--
-- Создать процедуру `procedure2`
--
CREATE DEFINER = 'root'@'%'
PROCEDURE procedure2 ()
BEGIN
  SET @i = 0;
  SET @j = 0;

  WHILE @i <= 24 DO
    WHILE @j <= 45 DO
      IF (LENGTH(@i) = 1)
        AND (LENGTH(@j) = 1) THEN
        INSERT INTO dc_time (data, time, order_id)
          VALUE (CURDATE(), CONCAT('0', @i, ':', '0', @j), 1);

        SET @t = CONCAT('0', @i, ':', '0', @j);
      ELSE
        INSERT INTO dc_time (data, time, order_id)
          VALUE (CURDATE(), CONCAT(@i, ':', @j), 1);
        SET @t = CONCAT(@i, ':', @j);
      END IF;
      SET @j = @j + 15;
    END WHILE;
    SET @i = @i + 1;

  END WHILE;
END
$$

DELIMITER ;

-- 
-- Вывод данных для таблицы roles
--
INSERT INTO roles VALUES
(1, 'Admin', 1, '2023-11-12 22:00:00', '2023-11-12 22:00:00'),
(2, 'User', 2, '2023-11-12 22:00:00', '2023-11-12 22:00:00');

-- 
-- Вывод данных для таблицы departments
--
INSERT INTO departments VALUES
(1, 'Obshiy', 100.00, NULL, '2024-02-04 11:28:31'),
(2, 'Sauna ', 125.00, NULL, '2024-02-04 11:34:24'),
(3, 'Vip Sauna', 150.00, NULL, '2024-02-04 11:28:53'),
(4, 'Basseynn', 70.00, NULL, '2024-02-10 09:44:26'),
(6, 'Finskaya Sauna', 125.00, '2024-02-29 09:20:39', '2024-02-29 09:20:39'),
(7, 'Myles Garza', 75.00, '2024-06-04 16:03:40', '2024-06-04 16:03:48');

-- 
-- Вывод данных для таблицы job_titles
--
INSERT INTO job_titles VALUES
(1, 'Banya', 3, NULL, 1.00, NULL, 154.00, NULL, NULL, NULL),
(2, 'Sauna', 3, NULL, 1.00, NULL, 62.00, NULL, NULL, NULL),
(3, 'Basseyn', 4, NULL, 1.00, NULL, 56.00, NULL, NULL, NULL),
(10, 'Fatima', 4, NULL, 2.00, NULL, 575.00, 'Deleniti suscipit ne', '2023-11-18 19:58:44', '2023-11-18 20:10:54'),
(12, 'Sauna Basseyn', 6, NULL, 1.00, NULL, 100.00, NULL, '2024-01-11 19:59:01', '2024-01-11 19:59:01'),
(13, 'Danielle', 3, NULL, 2.00, NULL, 405.00, 'Totam asperiores min', '2024-01-11 19:59:19', '2024-01-12 16:53:04'),
(14, 'Basseyny', 6, NULL, 2.00, NULL, 43.00, '', '2024-01-12 16:52:05', '2024-01-12 16:52:05'),
(15, 'Massazh', 4, NULL, 1.00, NULL, 125.00, NULL, '2024-02-03 18:29:35', '2024-02-03 18:29:35'),
(16, 'Sauna2', 8, NULL, 1.00, NULL, 148.00, NULL, '2024-03-28 08:11:24', '2024-03-28 08:11:24'),
(17, 'Kemp', 8, NULL, 1.00, NULL, 160.00, 'Voluptas eveniet un', '2024-03-28 08:12:07', '2024-03-28 08:12:07'),
(18, 'Claire Wolf', 12, NULL, 1.00, 30, 170.00, 'Non modi dolore pari', '2024-06-04 16:07:04', '2024-06-04 17:34:15'),
(19, 'Gregory Bolton', 8, NULL, 1.00, 45, 476.00, 'Maxime alias dolor o', '2024-06-04 17:21:22', '2024-06-04 17:33:21'),
(20, 'Ebony Hodges', 12, NULL, 2.00, 70, 290.00, 'Culpa et voluptatib', '2024-06-04 17:34:00', '2024-06-04 17:34:00');

-- 
-- Вывод данных для таблицы employes
--
INSERT INTO employes VALUES
(3, 'John', NULL, 'John', 'Velda', '123456', '16', 1, 1, 1, NULL, NULL),
(4, 'Hebar Fay', NULL, 'Hebar', 'Fey', '123456', 'Ullamco optio quia ', 1, 1, 1, NULL, NULL),
(6, 'Marylyne Crooks', NULL, 'Marylyne', 'Crooks', '12345', 'Ullamco optio quia ', 1, 1, 1, NULL, NULL),
(8, NULL, NULL, 'Wendy', 'Hinton', '4212354', 'Ullamco optio quia ', 1, 1, 1, '2024-03-28 08:10:00', '2024-03-28 08:10:00'),
(11, NULL, NULL, 'Raphael Little', 'Blair', '245687', 'Autem amet voluptat', 1, 1, 1, '2024-06-04 15:57:34', '2024-06-04 15:57:34'),
(12, NULL, NULL, 'Willa Hunt', 'Stanton', '30456', 'Perspiciatis do in ', 1, 1, 1, '2024-06-04 16:02:38', '2024-06-04 16:02:38');

-- 
-- Вывод данных для таблицы clients
--
INSERT INTO clients VALUES
(2, 'Emilio', 'Harvey', 'dach.vidal@donnelly.com', '128 Ritchie Hill Apt. 738\nSanfordfurt, NM 22382-8341', '+1-539-226-0369', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(3, 'Beverli', 'Hills', 'lswaniawski@yahoo.com', '40935 Boyer Ports\nNorth Gabe, LA 03623-0614', '(248) 344-3127', '2023-11-16 04:44:06', '2023-11-18 17:45:20'),
(7, 'Kaylee', 'DuBuque', 'joana.rohan@hotmail.com', '867 Kuphal Light\nBradtkeview, NH 76803-1696', '1-936-609-4746', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(8, 'Sonia', 'O''Kon', 'natasha.thiel@yahoo.com', '15886 Louie Turnpike\nPort Christianbury, ND 72058-5537', '+1 (352) 909-4336', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(9, 'Michelle', 'Cummings', 'frogahn@yahoo.com', '70220 Grady Cliff\nWest Mabel, CT 76488', '+1 (475) 985-6072', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(11, 'Jana', 'Casper', 'amir37@sawayn.org', '223 Natalia Port Suite 188\nPort Bell, AZ 44174', '351.842.5090', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(13, 'Lurline', 'Schowalter', 'gretchen.steuber@gmail.com', '552 Schinner Route Suite 962\nPort Wilfredo, DE 22762', '669-487-0242', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(14, 'Desiree', 'Hagenes', 'elaina47@yahoo.com', '273 Ivory Centers Suite 772\nLebsackhaven, NH 62105', '765.357.2658', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(15, 'Horace', 'Witting', 'jesse08@wolf.com', '440 Rodrick Plaza Apt. 895\nLeonoraton, AZ 81410', '+12014161320', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(16, 'Barney', 'Veum', 'manuel75@gmail.com', '780 Anabel Park Suite 631\nReesemouth, OR 93308-8954', '+1.979.413.4197', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(17, 'Ted', 'Johnston', 'marvin.schmitt@hotmail.com', '241 Dayana Canyon\nShieldsfurt, TX 73428-5346', '+1.425.389.4906', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(18, 'Briana', 'Bartoletti', 'stoltenberg.camille@hotmail.com', '7382 Welch Hollow Apt. 450\nJohnsmouth, OR 89727-3225', '+13147441284', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(19, 'Jairo', 'Lebsack', 'ramon03@gmail.com', '3083 Raynor Park Apt. 515\nSouth Isaias, SD 03125', '1-630-908-4787', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(20, 'Marley', 'Spinka', 'block.hector@yahoo.com', '5133 Brown Ramp\nSouth Delbertside, KS 95872', '937-325-6331', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(22, 'Lorenz', 'Smith', 'roy.rempel@lockman.com', '16825 Bednar Valley\nEast Kassandra, KS 29245-1943', '774.762.4182', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(24, 'Alda', 'Veum', 'haylie67@satterfield.org', '97562 Considine Expressway Suite 136\nOkunevaview, GA 41197', '+19473198563', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(25, 'Mossie', 'Rogahn', 'baron.douglas@hermiston.com', '63060 Blick Center\nNienowfurt, AR 16188-1086', '573.542.4374', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(26, 'Leonel', 'Funk', 'ludwig.okeefe@gmail.com', '316 Sid Lake\nFadelfort, MI 59673', '361-209-9878', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(27, 'Dariana', 'Wintheiser', 'hosinski@boehm.com', '5149 Ayana Island\nFeiltown, WI 68041-3357', '629-207-8356', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(28, 'Raymond', 'Olson', 'champlin.oren@yahoo.com', '273 Satterfield Path\nFayview, AK 33856-1851', '+1-234-320-7467', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(29, 'Aliya', 'Ferry', 'prohaska.rowland@maggio.org', '58393 Tad Causeway\nWindlerton, KS 73845-4619', '386-898-2689', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(30, 'Cyrus', 'Beer', 'doyle77@cronin.com', '389 Hessel Forest\nWeldonberg, GA 49188-3106', '1-218-499-4252', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(31, 'Ed', 'Daniel', 'jacobi.andrew@yahoo.com', '37796 Hilpert Ramp Apt. 264\nAxelfort, DE 64229-6404', '(309) 615-7694', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(32, 'Rosanna', 'Mills', 'ajohns@moen.org', '385 Buckridge Vista Suite 216\nHaneborough, ME 57416-1173', '903.618.6675', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(33, 'Margaret', 'Welch', 'reilly.jackeline@yahoo.com', '51478 Vince Cove Suite 266\nWest Vito, KS 52621-7933', '1-540-776-2679', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(34, 'Denis', 'Durgan', 'ajenkins@okuneva.com', '6553 Nolan Stravenue\nWaelchiberg, MN 76115-2959', '+1.480.263.4019', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(35, 'Liam', 'Nikolaus', 'flarkin@yahoo.com', '59487 Lia Forest\nEmmettport, NM 57501', '816.562.2657', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(36, 'Adele', 'Kassulke', 'ogottlieb@tremblay.com', '7804 Wuckert Dale Apt. 316\nIsobelhaven, TX 30215-5412', '+1-361-822-6123', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(37, 'Gennaro', 'Wehner', 'xcummings@gmail.com', '7476 Terrence Underpass Apt. 468\nBudfort, OR 23513', '920.767.4706', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(38, 'Wendy', 'Kub', 'kayleigh.haag@marks.com', '1308 Marvin Hill\nLake Estellefort, WV 97802-2281', '(951) 505-1645', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(39, 'Kaelyn', 'Turcotte', 'greichert@gmail.com', '739 Jerde Lake Suite 972\nJamesonview, TN 75870', '(305) 568-0210', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(40, 'Pierre', 'Ruecker', 'madelyn29@hotmail.com', '1852 Vida Keys\nDibberthaven, UT 00141-5002', '1-785-794-5437', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(41, 'Estelle', 'Boyer', 'bradford.mitchell@gerhold.com', '9319 Dach Union\nGoyetteside, MT 58915', '(601) 583-7644', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(42, 'Ola', 'West', 'lkuhn@gmail.com', '890 Braun Trafficway Suite 072\nThompsonhaven, DE 90864-1381', '989.926.7517', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(43, 'Lysanne', 'Bernier', 'gladys47@rolfson.com', '2722 Dennis Ranch Suite 466\nWest Nataliemouth, TN 69487', '1-443-739-2216', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(44, 'Alexys', 'Frami', 'anderson.orin@hotmail.com', '458 Vandervort Circles Suite 426\nBertramborough, AR 32835', '440.578.7314', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(45, 'Katharina', 'Hamill', 'ghickle@rath.com', '534 Willms Corner Suite 051\nDooleyburgh, WY 58522-9067', '+1-802-914-0040', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(46, 'Kathryn', 'Kutch', 'easter.rodriguez@yahoo.com', '46276 Carmen Track\nWest Kailey, MN 09328', '+1.678.816.4611', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(47, 'Caleigh', 'Grady', 'zjohns@hammes.net', '391 Austyn Knolls Suite 143\nNorth Ellie, NJ 90965-4920', '754.576.8483', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(48, 'Raphael', 'Quigley', 'sharon.murray@hagenes.com', '1873 Stan Vista\nLake Eladio, AK 18236-5863', '320-390-5082', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(49, 'Geovanni', 'Dickinson', 'daniela67@yahoo.com', '633 Bridget View\nValentinland, NC 30452-9219', '+1-458-567-6771', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(50, 'Sidney', 'Sawayn', 'gbergstrom@mcclure.org', '14036 Hahn Burg Apt. 107\nLake Domingo, KY 42867-7946', '339.758.2779', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(51, 'Francisca', 'Balistreri', 'johnson.feil@powlowski.com', '820 Stark Pike Apt. 467\nSouth Joetown, OK 54527-7255', '620.269.9118', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(52, 'Levi', 'Grady', 'borer.verda@yahoo.com', '772 Zelda Plains\nEphraimhaven, VT 30696-8503', '+18313718173', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(53, 'Jany', 'Maggio', 'kayli.lubowitz@nikolaus.net', '3424 Waino Park\nTiaraport, NH 22458-6410', '480.470.5819', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(54, 'Roel', 'Denesik', 'flatley.amanda@roob.com', '43232 Nolan Burg Apt. 379\nPort Eldon, AZ 56477-5562', '339.255.1484', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(55, 'Judy', 'Wiegand', 'cmante@yahoo.com', '20926 Lela Roads\nLake Fred, AR 65637', '+1 (469) 798-9523', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(56, 'Moses', 'Hermiston', 'yschmidt@yahoo.com', '20745 Beer Locks Suite 507\nBoehmbury, GA 75245-6465', '+1-915-598-9009', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(57, 'Fleta', 'Smith', 'zieme.bridgette@hotmail.com', '9066 Jeanie Oval Suite 584\nLake Elzastad, IA 88247-4561', '(820) 829-3720', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(58, 'Odie', 'Gulgowski', 'mante.catalina@casper.com', '1932 Deckow Plains\nMarquardtmouth, HI 47594-3136', '+1.229.952.7732', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(59, 'Jade', 'Sauer', 'rheller@yahoo.com', '4118 Donna Land\nMosesberg, DC 42872', '+1-779-604-2318', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(60, 'Amos', 'Bernier', 'lottie.langworth@hotmail.com', '9970 Friesen Fords\nWest Reaganville, UT 96578', '+1 (860) 282-2635', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(61, 'Marguerite', 'Champlin', 'vreichel@gmail.com', '734 Jordy Mountains Apt. 109\nVandervortside, HI 24621', '+17547817799', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(62, 'Chauncey', 'Corwin', 'pbrown@yahoo.com', '5521 Gottlieb Circles\nSouth Vaughn, DE 02042', '386.445.3591', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(63, 'Santa', 'Swift', 'grimes.darius@corkery.com', '9802 Lesly Key Suite 198\nLake Ethanshire, TN 78357', '1-669-701-8199', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(64, 'Idella', 'Botsford', 'sydnie36@gmail.com', '930 Bogisich Summit Apt. 854\nDevenbury, CA 65593-3427', '+1-539-799-0315', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(65, 'Dorothy', 'Stracke', 'krystal36@yahoo.com', '156 Ewell Pike\nNew Cecil, IL 43602-1141', '+13218125919', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(66, 'Erich', 'Bogisich', 'harmony.gleichner@olson.com', '946 Kyla River\nThielhaven, MA 40140', '208.509.2093', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(67, 'Jarod', 'Keeling', 'larkin.okey@hotmail.com', '5765 Joana Hills Apt. 835\nNew Arashire, NH 77421', '1-440-209-3948', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(68, 'Lucy', 'Steuber', 'jtorphy@hotmail.com', '31956 Stracke Cape Apt. 231\nSouth Caterina, AR 76170-6380', '+1.480.356.8839', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(69, 'Elijah', 'Stanton', 'vandervort.leonard@yahoo.com', '83213 Graham Mall Suite 536\nMarisaview, CT 40763-1816', '1-770-650-4121', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(70, 'Avery', 'Batz', 'kmante@pagac.com', '6218 Hills Springs Apt. 287\nRempelmouth, WV 11094', '347.243.7287', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(71, 'Marlene', 'Hammes', 'aweissnat@hotmail.com', '717 Shaun Wells Suite 407\nBaumbachton, HI 44693-7660', '630-828-6255', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(72, 'Paula', 'Bergstrom', 'gkuphal@gmail.com', '9923 Rau Court\nKodyhaven, DE 38734-9832', '+1-740-786-2859', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(73, 'Isabelle', 'Lockman', 'albert92@dare.org', '20982 Trevion Club\nHuelsmouth, KS 10271-5685', '231-693-0301', '2023-11-16 04:44:06', '2023-11-16 04:44:06'),
(85, 'Linda Schroeder', 'Rina', 'regumu@mailinator.com', 'Vel non ut expedita ', '+1 (408) 876-5159', '2023-12-24 10:56:15', '2023-12-24 10:56:15'),
(86, 'Robin Silva', 'Samson', 'tiluv@mailinator.com', 'Suscipit qui quam ex', '+1 (903) 632-1939', '2023-12-24 11:02:00', '2023-12-24 11:02:00'),
(87, 'Kalia Dunn', 'Darrel', 'xokadyhi@mailinator.com', 'Sed est inventore mo', '+1 (328) 514-6716', '2024-01-05 15:31:07', '2024-01-05 15:31:07'),
(88, 'Kalia Dunn', 'Darrel', NULL, NULL, NULL, '2024-01-11 14:41:00', '2024-01-11 14:41:00'),
(89, 'Ria Haley', 'Darrel', NULL, NULL, NULL, '2024-01-11 14:41:34', '2024-01-11 14:41:34'),
(90, 'Robin Silva', 'Samson', NULL, NULL, '19036321939', '2024-01-11 14:42:42', '2024-01-11 14:42:42'),
(91, 'Borielle', 'Schneider', NULL, NULL, '15187026755', '2024-01-11 14:44:32', '2024-01-11 14:44:32'),
(92, 'Barclay', 'Ingram', NULL, NULL, '1545785546', '2024-01-11 14:45:27', '2024-01-11 14:45:27'),
(93, 'Emmanuel', 'Vega', NULL, NULL, '9034598712', '2024-01-11 14:46:47', '2024-01-11 14:46:47'),
(133, 'Brent Burns', 'Calderon', NULL, 'Magna pariatur Sint', '26', '2024-03-22 05:17:03', '2024-03-22 05:17:03');

-- 
-- Вывод данных для таблицы user_roles
--
-- Таблица banya.user_roles не содержит данных

-- 
-- Вывод данных для таблицы users
--
INSERT INTO users VALUES
(112, 'Dr. Tyree Effertz', 'Elliot', 'Kris', 'savanah.marks@example.com', '2023-11-16 04:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'AmUHk5lgTx', NULL, '2023-11-16 04:25:28', '2024-03-19 09:44:34', 'KSS', 'Активирован'),
(113, 'Quinten Moore', 'Icie', 'Cassin', 'clebsack@example.org', '2023-11-16 04:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'R0V2BkHYsf', NULL, '2023-11-16 04:25:28', '2024-06-04 15:47:24', 'USR', 'Не активирован'),
(114, 'Dahlia DuBuque', 'Casper', 'Langosh', 'jade.schamberger@example.org', '2023-11-16 04:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', '2tz4oBinQg', NULL, '2023-11-16 04:25:28', '2023-11-16 04:25:28', 'USR', 'Не активирован'),
(128, 'Bobo', 'Bobo', 'Develop', 'employe@tm.tm', NULL, '$2y$12$0xx8g9GAhO7CdUCz428av.OmZDZdANXYAVcjr99TJnOzj4PX3sb/i', NULL, NULL, '2024-03-12 10:34:54', '2024-03-12 10:34:54', 'ADM', 'Активирован'),
(131, 'Quisquam', 'Quisquam', 'Praesentium', 'bikomo@mailinator.com', NULL, '$2y$12$xIgru6bnKPY.eJ7CJmWVr.nhHc2wlb.ax05ySW4EV8Wg4e7Ida1lq', NULL, NULL, '2024-03-12 10:38:27', '2024-03-19 09:25:41', 'KSS', 'Активирован'),
(132, 'Aute', 'Aute', 'Autem', 'noro@mailinator.com', NULL, '$2y$12$LHilB23f3Id8m8pm.ltpRe86jg22DSEiAOaTEU2Ln81e9/drppPOe', NULL, NULL, '2024-03-12 10:44:42', '2024-03-13 09:44:18', 'KSS', 'Активирован'),
(134, 'dsa', 'sdfs', 'sdfsd', 'fdsf@sdf.tn', NULL, '1231123', NULL, NULL, NULL, NULL, 'USR', 'Не активирован');

-- 
-- Вывод данных для таблицы time_tb
--
INSERT INTO time_tb VALUES
(25, '2024-01-07', '06:00:00', '', 0, 0),
(26, '2024-01-07', '06:15:00', '', 0, 0),
(27, '2024-01-07', '06:30:00', '', 0, 0),
(28, '2024-01-07', '06:45:00', '', 0, 0),
(29, '2024-01-07', '07:00:00', '', 0, 0),
(30, '2024-01-07', '07:15:00', '', 0, 0),
(31, '2024-01-07', '07:30:00', '', 0, 0),
(32, '2024-01-07', '07:45:00', '', 0, 0),
(33, '2024-01-07', '08:00:00', '08:00:00', 258, 1),
(34, '2024-01-07', '08:15:00', '08:15:00', 258, 1),
(35, '2024-01-07', '08:30:00', '08:30:00', 258, 1),
(36, '2024-01-07', '08:45:00', '08:45:00', 258, 1),
(37, '2024-01-07', '09:00:00', '09:00:00', 258, 1),
(38, '2024-01-07', '09:15:00', '09:15:00', 258, 1),
(39, '2024-01-07', '09:30:00', '09:30:00', 258, 1),
(40, '2024-01-07', '09:45:00', '09:45:00', 258, 1),
(41, '2024-01-07', '10:00:00', '10:00:00', 258, 1),
(42, '2024-01-07', '10:15:00', '', 0, 0),
(43, '2024-01-07', '10:30:00', '', 0, 0),
(44, '2024-01-07', '10:45:00', '', 0, 0),
(45, '2024-01-07', '11:00:00', '', 0, 0),
(46, '2024-01-07', '11:15:00', '', 0, 0),
(47, '2024-01-07', '11:30:00', '', 0, 0),
(48, '2024-01-07', '11:45:00', '', 0, 0),
(49, '2024-01-07', '12:00:00', '', 0, 0),
(50, '2024-01-07', '12:15:00', '', 0, 0),
(51, '2024-01-07', '12:30:00', '', 0, 0),
(52, '2024-01-07', '12:45:00', '', 0, 0),
(53, '2024-01-07', '13:00:00', '', 0, 0),
(54, '2024-01-07', '13:15:00', '', 0, 0),
(55, '2024-01-07', '13:30:00', '', 0, 0),
(56, '2024-01-07', '13:45:00', '', 0, 0),
(57, '2024-01-07', '14:00:00', '', 0, 0),
(58, '2024-01-07', '14:15:00', '', 0, 0),
(59, '2024-01-07', '14:30:00', '', 0, 0),
(60, '2024-01-07', '14:45:00', '', 0, 0),
(61, '2024-01-07', '15:00:00', '', 0, 0),
(62, '2024-01-07', '15:15:00', '', 0, 0),
(63, '2024-01-07', '15:30:00', '', 0, 0),
(64, '2024-01-07', '15:45:00', '', 0, 0),
(65, '2024-01-07', '16:00:00', '', 0, 0),
(66, '2024-01-07', '16:15:00', '', 0, 0),
(67, '2024-01-07', '16:30:00', '', 0, 0),
(68, '2024-01-07', '16:45:00', '', 0, 0),
(69, '2024-01-07', '17:00:00', '', 0, 0),
(70, '2024-01-07', '17:15:00', '', 0, 0),
(71, '2024-01-07', '17:30:00', '', 0, 0),
(72, '2024-01-07', '17:45:00', '', 0, 0),
(73, '2024-01-07', '18:00:00', '', 0, 0),
(74, '2024-01-07', '18:15:00', '', 0, 0),
(75, '2024-01-07', '18:30:00', '', 0, 0),
(76, '2024-01-07', '18:45:00', '', 0, 0),
(77, '2024-01-07', '19:00:00', '', 0, 0),
(78, '2024-01-07', '19:15:00', '', 0, 0),
(79, '2024-01-07', '19:30:00', '', 0, 0),
(80, '2024-01-07', '19:45:00', '', 0, 0),
(81, '2024-01-07', '20:00:00', '', 0, 0),
(82, '2024-01-07', '20:15:00', '', 0, 0),
(83, '2024-01-07', '20:30:00', '', 0, 0),
(84, '2024-01-07', '20:45:00', '', 0, 0),
(85, '2024-01-07', '21:00:00', '', 0, 0),
(86, '2024-01-07', '21:15:00', '', 0, 0),
(87, '2024-01-07', '21:30:00', '', 0, 0),
(88, '2024-01-07', '21:45:00', '', 0, 0),
(89, '2024-01-07', '22:00:00', '', 0, 0),
(90, '2024-01-07', '22:15:00', '', 0, 0),
(91, '2024-01-07', '22:30:00', '', 0, 0),
(92, '2024-01-07', '22:45:00', '', 0, 0),
(93, '2024-01-07', '23:00:00', '', 0, 0);

-- 
-- Вывод данных для таблицы time_list
--
INSERT INTO time_list VALUES
(25, '06:00:00', 0),
(26, '06:15:00', 0),
(27, '06:30:00', 0),
(28, '06:45:00', 0),
(29, '07:00:00', 0),
(30, '07:15:00', 0),
(31, '07:30:00', 0),
(32, '07:45:00', 0),
(33, '08:00:00', 0),
(34, '08:15:00', 0),
(35, '08:30:00', 0),
(36, '08:45:00', 0),
(37, '09:00:00', 0),
(38, '09:15:00', 0),
(39, '09:30:00', 0),
(40, '09:45:00', 0),
(41, '10:00:00', 0),
(42, '10:15:00', 0),
(43, '10:30:00', 0),
(44, '10:45:00', 0),
(45, '11:00:00', 0),
(46, '11:15:00', 0),
(47, '11:30:00', 0),
(48, '11:45:00', 0),
(49, '12:00:00', 0),
(50, '12:15:00', 0),
(51, '12:30:00', 0),
(52, '12:45:00', 0),
(53, '13:00:00', 0),
(54, '13:15:00', 0),
(55, '13:30:00', 0),
(56, '13:45:00', 0),
(57, '14:00:00', 0),
(58, '14:15:00', 0),
(59, '14:30:00', 0),
(60, '14:45:00', 0),
(61, '15:00:00', 0),
(62, '15:15:00', 0),
(63, '15:30:00', 0),
(64, '15:45:00', 0),
(65, '16:00:00', 0),
(66, '16:15:00', 0),
(67, '16:30:00', 0),
(68, '16:45:00', 0),
(69, '17:00:00', 0),
(70, '17:15:00', 0),
(71, '17:30:00', 0),
(72, '17:45:00', 0),
(73, '18:00:00', 0),
(74, '18:15:00', 0),
(75, '18:30:00', 0),
(76, '18:45:00', 0),
(77, '19:00:00', 0),
(78, '19:15:00', 0),
(79, '19:30:00', 0),
(80, '19:45:00', 0),
(81, '20:00:00', 0),
(82, '20:15:00', 0),
(83, '20:30:00', 0),
(84, '20:45:00', 0),
(85, '21:00:00', 0),
(86, '21:15:00', 0),
(87, '21:30:00', 0),
(88, '21:45:00', 0),
(89, '22:00:00', 0),
(90, '22:15:00', 0),
(91, '22:30:00', 0),
(92, '22:45:00', 0),
(93, '23:00:00', 0);

-- 
-- Вывод данных для таблицы temp_order_details
--
-- Таблица banya.temp_order_details не содержит данных

-- 
-- Вывод данных для таблицы temp_orders
--
INSERT INTO temp_orders VALUES
(1, '1', '2024-01-27', 1, 1, 1, 1, 0.00, NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы table1
--
-- Таблица banya.table1 не содержит данных

-- 
-- Вывод данных для таблицы posts
--
INSERT INTO posts VALUES
(1, 'Kassir', '100', '2024-02-29 14:12:04', '2024-02-29 14:12:05');

-- 
-- Вывод данных для таблицы personal_access_tokens
--
-- Таблица banya.personal_access_tokens не содержит данных

-- 
-- Вывод данных для таблицы permissions
--
-- Таблица banya.permissions не содержит данных

-- 
-- Вывод данных для таблицы password_reset_tokens
--
-- Таблица banya.password_reset_tokens не содержит данных

-- 
-- Вывод данных для таблицы order_details
--
INSERT INTO order_details VALUES
(34, 'Sauna', 89, 258, 2, 3, NULL, NULL, 3.00, 62.00, NULL, '2024-03-24 05:35:22', '2024-03-24 05:35:22'),
(35, 'Fatima', 90, 258, 10, 4, NULL, NULL, 1.00, 575.00, NULL, '2024-03-24 05:43:46', '2024-03-24 05:43:46'),
(36, 'Massazh', 90, 258, 15, 4, NULL, NULL, 2.00, 125.00, NULL, '2024-03-24 05:43:58', '2024-03-24 05:43:58'),
(45, 'Sauna', 94, 258, 2, 3, NULL, NULL, 1.00, 62.00, 62.00, '2024-03-26 06:45:15', '2024-03-26 06:45:15'),
(46, 'Banya', 97, 258, 1, 4, NULL, NULL, 1.00, 154.00, 154.00, '2024-03-26 06:47:31', '2024-03-26 06:47:31'),
(47, 'Sauna', 101, 258, 2, 3, NULL, NULL, 2.00, 62.00, 124.00, '2024-03-28 08:29:33', '2024-03-28 08:29:33'),
(48, 'Sauna', 114, 258, 2, 3, NULL, NULL, 1.00, 62.00, 62.00, '2024-03-28 10:52:24', '2024-03-28 10:52:24'),
(49, 'Banya', 117, 258, 1, 3, NULL, NULL, 1.00, 154.00, 154.00, '2024-03-29 08:03:43', '2024-03-29 08:03:43'),
(50, 'Basseyny', 119, 258, 14, 6, NULL, NULL, 2.00, 43.00, 86.00, '2024-03-29 10:41:53', '2024-03-29 10:41:53'),
(53, 'Massazh', 119, 258, 15, 4, NULL, NULL, 1.00, 125.00, 125200.00, '2024-03-29 10:58:29', '2024-03-29 10:58:29'),
(55, 'Basseyny', 120, 258, 14, 6, NULL, NULL, 2.00, 43.00, 86200.00, '2024-04-02 08:01:31', '2024-04-02 08:01:31'),
(56, 'Banya', 193, 258, 1, 4, NULL, NULL, 1.00, 154.00, 154200.00, '2024-04-03 10:09:13', '2024-04-03 10:09:13'),
(57, 'Kemp', 193, 258, 17, 8, NULL, NULL, 2.00, 160.00, 320200.00, '2024-04-03 10:09:50', '2024-04-03 10:09:50'),
(58, 'Banya', 196, 258, 1, 3, NULL, NULL, 1.00, 154.00, 154200.00, '2024-04-05 10:55:50', '2024-04-05 10:55:50'),
(59, 'Massazh', 197, 258, 15, 4, NULL, NULL, 2.00, 125.00, 250200.00, '2024-04-15 09:26:37', '2024-04-15 09:26:37'),
(60, 'Kemp', 197, 258, 17, 8, NULL, NULL, 1.00, 160.00, 160200.00, '2024-04-15 09:26:58', '2024-04-15 09:26:58'),
(61, 'Banya', 198, 258, 1, 4, NULL, NULL, 1.00, 154.00, 154200.00, '2024-04-16 01:27:23', '2024-04-16 01:27:23'),
(62, 'Sauna Basseyn', 219, 258, 12, 6, NULL, NULL, 2.00, NULL, 200.00, '2024-05-04 03:11:52', '2024-05-04 03:11:52'),
(63, 'Sauna Basseyn', 234, 258, 12, 6, NULL, NULL, 2.00, NULL, 200.00, '2024-05-16 02:49:18', '2024-05-16 02:49:18'),
(64, 'Sauna', 236, 258, 2, 3, NULL, NULL, 1.25, 62.00, 77250.00, '2024-05-16 04:42:45', '2024-05-16 04:42:45'),
(65, 'Basseyn', 236, 258, 2, 4, NULL, NULL, 3.25, 56.00, 182200.00, '2024-05-16 04:42:57', '2024-05-16 04:42:57'),
(66, 'Banya', 247, 258, 1, 12, NULL, NULL, NULL, 154.00, 200.00, '2024-06-04 16:20:40', '2024-06-04 16:20:40');

-- 
-- Вывод данных для таблицы orders
--
INSERT INTO orders VALUES
(2, '2', '2024-02-03', 3, 44, 1, 22, '07:00:00', '08:00:00', 0.00, NULL, 2, 1, NULL, '2024-02-03 16:52:58', '2024-02-03 18:27:48'),
(3, '3', '2024-02-04', 3, 60, 1, 22, '08:00:00', '09:00:00', 0.00, NULL, 2, 1, NULL, '2024-02-03 20:46:20', '2024-02-03 20:46:30'),
(4, '4', '2024-02-02', 3, 92, 1, 22, '12:00:00', '12:45:00', 0.00, NULL, 2, 1, NULL, '2024-02-03 21:34:08', '2024-02-03 21:34:22'),
(5, '5', '2024-02-02', 3, 60, 1, 22, '07:00:00', '07:30:00', 0.00, NULL, 2, 1, NULL, '2024-02-03 21:35:20', '2024-02-03 21:35:29'),
(6, '6', '2024-02-01', 3, 60, 1, 22, '07:00:00', '07:30:00', 0.00, NULL, 2, 1, NULL, '2024-02-04 02:57:15', '2024-02-04 02:57:31'),
(7, '7', '2024-02-04', 3, 44, 1, 22, '09:30:00', '09:45:00', 0.00, NULL, 2, 1, NULL, '2024-02-04 06:03:17', '2024-02-04 06:03:30'),
(11, '11', '2024-02-01', 3, 16, 1, 22, '10:00:00', '10:30:00', 0.00, NULL, 2, 1, NULL, '2024-02-04 10:06:38', '2024-02-04 10:06:49'),
(18, '18', '2024-02-01', 3, 30, 2, 22, '06:00:00', '08:15:00', 0.00, NULL, 2, 1, NULL, '2024-02-04 13:39:10', '2024-02-04 16:44:19'),
(21, '21', '2024-02-03', 3, 29, 2, 22, '08:00:00', '10:15:00', 0.00, NULL, 2, 1, NULL, '2024-02-04 17:00:31', '2024-02-04 17:14:09'),
(28, '28', '2024-02-02', 3, 29, 2, 22, '07:00:00', '09:15:00', 0.00, NULL, 2, 1, NULL, '2024-02-05 03:07:07', '2024-02-05 03:23:21'),
(29, '29', '2024-02-03', 3, 24, 3, 22, '06:00:00', '07:15:00', 0.00, NULL, 2, 1, NULL, '2024-02-05 03:23:57', '2024-02-05 09:21:58'),
(30, '30', '2024-02-04', 3, 44, 2, 22, '07:15:00', '11:00:00', 343.75, NULL, 2, 1, NULL, '2024-02-05 09:23:58', '2024-02-05 17:00:07'),
(32, '32', '2024-02-02', 3, 92, 2, 22, '10:00:00', '10:45:00', 93.75, NULL, 2, 1, NULL, '2024-02-05 17:16:21', '2024-02-05 17:16:38'),
(34, '34', '2024-03-19', 3, 36, 1, 22, '08:00:00', '09:30:00', 150.00, NULL, 2, 1, NULL, '2024-03-19 09:44:49', '2024-03-19 09:45:15'),
(38, '38', '2024-03-19', 3, 16, 1, 22, '06:00:00', '06:45:00', 75.00, NULL, 2, 1, NULL, '2024-03-19 10:05:45', '2024-03-19 10:06:14'),
(39, '39', '2024-03-20', 3, 18, 1, 22, '06:00:00', '07:00:00', 100.00, NULL, 2, 1, NULL, '2024-03-19 10:07:05', '2024-03-19 10:07:19'),
(41, '41', '2024-03-19', 3, 92, 1, 22, '13:00:00', '13:45:00', 75.00, NULL, 2, 1, NULL, '2024-03-19 10:56:21', '2024-03-19 10:56:47'),
(43, '43', '2024-03-20', 3, 18, 1, 22, '07:00:00', '07:45:00', 75.00, NULL, 2, 1, NULL, '2024-03-20 02:13:18', '2024-03-20 02:14:17'),
(46, '46', '2024-03-19', 3, 34, 1, 22, '19:00:00', '20:00:00', 100.00, NULL, 2, 1, NULL, '2024-03-20 02:17:34', '2024-03-20 02:18:28'),
(49, '49', '2024-03-20', 3, 34, 1, 22, '12:45:00', '16:15:00', 350.00, NULL, 2, 1, NULL, '2024-03-20 02:34:13', '2024-03-20 02:34:33'),
(57, '57', '2024-03-20', 3, 54, 1, 22, '17:00:00', '18:15:00', 125.00, NULL, 2, 1, NULL, '2024-03-20 09:48:17', '2024-03-20 09:48:34'),
(59, '59', '2024-03-20', 3, 3, 1, 22, '13:00:00', '13:45:00', 75.00, NULL, 2, 1, NULL, '2024-03-20 10:36:58', '2024-03-20 10:37:11'),
(60, '60', '2024-03-22', 3, 16, 1, 22, '07:00:00', '08:00:00', 100.00, NULL, 2, 1, NULL, '2024-03-22 03:24:37', '2024-03-22 03:24:54'),
(67, '67', '2024-03-22', 3, 18, 1, 22, '08:15:00', '09:30:00', 125.00, NULL, 2, 1, NULL, '2024-03-22 04:03:27', '2024-03-22 04:08:46'),
(68, '68', '2024-03-22', 3, 44, 1, 22, '11:00:00', '13:30:00', 250.00, NULL, 2, 1, NULL, '2024-03-22 04:09:00', '2024-03-22 04:14:25'),
(69, '69', '2024-03-22', 3, 88, 1, 22, '10:00:00', '10:30:00', 50.00, NULL, 2, 1, NULL, '2024-03-22 04:15:06', '2024-03-22 04:15:26'),
(72, '72', '2024-03-20', 3, 53, 1, 22, '09:00:00', '11:00:00', 200.00, NULL, 2, 1, NULL, '2024-03-22 04:27:21', '2024-03-22 04:29:44'),
(74, '74', '2024-03-22', 3, 30, 1, 22, '16:00:00', '18:00:00', 200.00, NULL, 2, 1, NULL, '2024-03-22 04:40:46', '2024-03-22 08:32:04'),
(75, '75', '2024-03-22', 3, 27, 2, 22, '07:00:00', '08:30:00', 187.50, NULL, 2, 1, NULL, '2024-03-22 08:32:52', '2024-03-22 08:33:20'),
(76, '76', '2024-03-22', 3, 64, 2, 22, '09:00:00', '10:00:00', 125.00, NULL, 2, 1, NULL, '2024-03-22 08:41:04', '2024-03-22 08:41:36'),
(78, '78', '2024-03-22', 3, 64, 2, 22, '10:30:00', '12:00:00', 187.50, NULL, 2, 1, NULL, '2024-03-22 09:05:13', '2024-03-22 09:09:39'),
(79, '79', '2024-03-22', 3, 64, 3, 22, '08:00:00', '10:15:00', 337.50, NULL, 2, 1, NULL, '2024-03-22 09:31:54', '2024-03-22 10:15:13'),
(82, '82', '2024-03-22', 3, 37, 1, 22, '19:00:00', '20:30:00', 150.00, NULL, 2, 1, NULL, '2024-03-24 04:10:09', '2024-03-24 04:10:59'),
(85, '85', '2024-03-23', 3, 55, 1, 22, '07:00:00', '08:00:00', 100.00, NULL, 2, 1, NULL, '2024-03-24 04:30:41', '2024-03-24 04:30:57'),
(97, '97', '2024-03-24', 3, 133, 2, 22, '08:00:00', '10:00:00', 250.00, NULL, 2, 1, NULL, '2024-03-26 06:47:10', '2024-03-26 06:47:34'),
(99, '99', '2024-03-24', 3, 133, 2, 22, '12:00:00', '13:30:00', 187.50, NULL, 2, 1, NULL, '2024-03-26 06:50:58', '2024-03-26 06:51:14'),
(100, '100', '2024-03-24', 3, 18, 1, 22, '10:00:00', '11:30:00', 150.00, NULL, 1, 1, NULL, '2024-03-28 08:27:38', '2024-03-28 08:27:55'),
(101, '101', '2024-03-24', 3, 34, 4, 22, '08:00:00', '10:30:00', 175.00, NULL, 1, 1, NULL, '2024-03-28 08:29:00', '2024-03-28 08:29:37'),
(103, '103', '2024-03-24', 3, 64, 3, 22, '07:00:00', '09:00:00', 300.00, NULL, 1, 1, NULL, '2024-03-28 09:38:28', '2024-03-28 09:38:41'),
(108, '107', '2024-03-24', 3, 2, 1, NULL, '06:00:00', '07:15:00', 0.00, NULL, 1, 1, NULL, '2024-03-28 09:44:19', '2024-03-28 09:44:40'),
(110, '110', '2024-03-24', 3, 73, 2, 22, '06:00:00', '07:15:00', 156.25, NULL, 1, 1, NULL, '2024-03-28 09:46:49', '2024-03-28 09:47:00'),
(113, '113', '2024-03-24', 3, 73, 3, 22, '10:00:00', '11:00:00', 150.00, NULL, 1, 1, NULL, '2024-03-28 10:31:23', '2024-03-28 10:31:37'),
(114, '114', '2024-03-25', 3, 73, 2, 22, '08:00:00', '09:00:00', 125.00, NULL, 1, 1, NULL, '2024-03-28 10:52:01', '2024-03-28 10:52:26'),
(115, '115', '2024-03-25', 3, 13, 1, 22, '07:00:00', '09:15:00', 225.00, NULL, 1, 1, NULL, '2024-03-28 10:52:40', '2024-03-28 10:52:53'),
(117, '117', '2024-03-31', 3, 2, 2, NULL, '07:00:00', '08:00:00', 0.00, NULL, 1, 1, NULL, '2024-03-29 08:03:26', '2024-03-29 08:03:37'),
(118, '118', '2024-03-31', 3, 70, 2, 22, '08:30:00', '10:00:00', 187.50, NULL, 1, 1, NULL, '2024-03-29 08:42:58', '2024-03-29 08:43:11'),
(119, '119', '2024-03-31', 3, 133, 2, 22, '10:30:00', '11:30:00', 125.00, NULL, 1, 1, NULL, '2024-03-29 10:41:20', '2024-03-29 10:43:39'),
(173, '173', '2024-04-02', 3, 27, 1, 22, '10:00:00', '10:45:00', 0.00, NULL, 1, 1, NULL, '2024-04-02 09:47:38', '2024-04-02 09:47:44'),
(174, '174', '2024-04-02', 3, 27, 2, 22, '06:00:00', '07:00:00', 0.00, NULL, 1, 1, NULL, '2024-04-02 09:47:53', '2024-04-02 09:48:02'),
(176, '175', '2024-04-02', 3, 27, 2, 22, '07:30:00', '09:30:00', 0.00, NULL, 1, 1, NULL, '2024-04-02 09:50:12', '2024-04-02 10:09:50'),
(177, '177', '2024-04-02', 3, 27, 1, 22, '08:00:00', '09:00:00', 0.00, NULL, 1, 1, NULL, '2024-04-02 09:52:07', '2024-04-02 09:52:17'),
(178, '178', '2024-04-02', 3, 27, 1, 22, '11:30:00', '12:00:00', 0.00, NULL, 1, 1, NULL, '2024-04-02 09:52:46', '2024-04-02 09:52:58'),
(179, '179', '2024-04-02', 3, 27, 2, 22, '10:00:00', '12:30:00', 0.00, NULL, 1, 1, NULL, '2024-04-02 09:53:33', '2024-04-02 10:10:02'),
(181, '180', '2024-04-02', 3, 27, 1, 22, '12:30:00', '14:00:00', 0.00, NULL, 1, 1, NULL, '2024-04-02 10:21:06', '2024-04-02 10:21:16'),
(186, '182', '2024-04-02', 3, 27, 2, 22, '14:00:00', '15:30:00', 0.00, NULL, 1, 1, NULL, '2024-04-02 10:33:49', '2024-04-02 10:34:58'),
(192, '192', '2024-04-03', 3, 60, 1, 22, '07:30:00', '09:00:00', 150.00, NULL, 1, 1, NULL, '2024-04-03 09:51:14', '2024-04-05 09:48:32'),
(193, '193', '2024-04-03', 3, 60, 1, 22, '08:30:00', '10:30:00', 175.00, NULL, 1, 1, NULL, '2024-04-03 09:53:52', '2024-04-05 09:46:33'),
(194, '194', '2024-04-03', 3, 60, 1, 22, '11:00:00', '13:30:00', 175.00, NULL, 1, 1, NULL, '2024-04-03 10:10:54', '2024-04-05 10:09:56'),
(195, '195', '2024-04-03', 3, 62, 1, 22, '06:00:00', '06:30:00', 50.00, NULL, 1, 1, NULL, '2024-04-05 09:48:39', '2024-04-05 10:02:08'),
(196, '196', '2024-04-03', 3, 62, 1, 22, '14:00:00', '15:30:00', 150.00, NULL, 1, 1, NULL, '2024-04-05 10:55:33', '2024-04-05 10:55:54'),
(197, '197', '2024-04-16', 3, 2, 1, NULL, '08:00:00', '09:30:00', 150.00, NULL, 1, 2, NULL, '2024-04-15 09:25:56', '2024-04-15 09:26:17'),
(198, '198', '2024-04-16', 3, 60, 2, 22, '08:00:00', '09:45:00', 218.75, NULL, 1, 1, NULL, '2024-04-16 01:26:49', '2024-04-16 01:27:26'),
(201, '201', '2024-04-16', 3, 91, 2, 22, '12:30:00', '14:00:00', 187.50, NULL, 1, 4, NULL, '2024-04-16 01:35:47', '2024-04-16 01:35:59'),
(202, '202', '2024-04-16', 3, 91, 1, 22, '12:00:00', '14:00:00', 200.00, NULL, 1, 2, NULL, '2024-04-16 01:36:36', '2024-04-16 01:36:49'),
(203, '203', '2024-04-16', 3, 11, 1, 22, '10:00:00', '11:00:00', 100.00, NULL, 1, 3, 3, '2024-04-16 01:38:20', '2024-04-16 01:38:50'),
(204, '204', '2024-04-16', 3, 11, 2, 22, '10:30:00', '11:45:00', 156.25, NULL, 1, 8, 2, '2024-04-16 01:41:52', '2024-04-16 01:43:07'),
(205, '205', '2024-04-16', 3, 2, 2, NULL, '14:30:00', '16:30:00', 125.00, NULL, 1, 7, 1, '2024-04-16 01:43:16', '2024-04-16 02:36:32'),
(207, '206', '2024-04-16', 3, 2, 2, NULL, '06:30:00', '07:30:00', 125.00, NULL, 1, 6, 2, '2024-04-16 02:07:01', '2024-04-16 02:08:40'),
(210, '208', '2024-04-16', 3, 11, 1, 22, '15:00:00', '16:00:00', 100.00, NULL, 1, 2, 4, '2024-04-16 02:32:27', '2024-04-16 02:32:46'),
(234, '218', '2024-04-29', 3, 2, NULL, NULL, '06:00:00', '07:00:00', 300.00, NULL, 1, 1, 5, '2024-04-29 09:43:15', '2024-04-29 09:43:15'),
(235, '219', '2024-05-04', 3, 2, NULL, NULL, '04:00:00', '05:00:00', 200.00, NULL, 1, 3, 3, '2024-05-04 03:11:40', '2024-05-04 03:11:40'),
(236, '220', '2024-05-15', 3, 2, NULL, NULL, '02:00:00', '03:00:00', 402.50, NULL, 1, 4, 1, '2024-05-15 08:42:35', '2024-05-15 08:42:35'),
(237, '221', '2024-05-15', 3, 2, NULL, NULL, '01:00:00', '02:00:00', 170.00, NULL, 1, 5, 1, '2024-05-15 08:43:19', '2024-05-15 08:43:19'),
(243, '227', '2024-05-15', 3, 2, NULL, NULL, '07:00:00', '08:30:00', 255.00, NULL, 1, 2, 3, '2024-05-15 10:21:05', '2024-05-15 10:21:05'),
(244, '228', '2024-05-15', 3, 2, NULL, NULL, '07:30:00', '09:15:00', 122.50, NULL, 1, 1, 2, '2024-05-15 10:24:30', '2024-05-15 10:24:30'),
(245, '229', '2024-05-15', 3, 2, NULL, NULL, '07:30:00', '09:15:00', 297.50, NULL, 1, 2, 1, '2024-05-15 10:53:05', '2024-05-15 10:53:05'),
(246, '230', '2024-05-15', 3, 2, NULL, NULL, '06:00:00', '06:45:00', 52.50, NULL, 1, 1, 0, '2024-05-15 10:54:01', '2024-05-15 10:54:01'),
(247, '231', '2024-05-16', 3, 2, NULL, NULL, '08:00:00', '09:15:00', 212.50, NULL, 1, 2, 1, '2024-05-16 02:24:46', '2024-05-16 02:24:46'),
(248, '232', '2024-05-16', 3, 2, NULL, NULL, '08:00:00', '09:30:00', 210.00, NULL, 1, 2, 0, '2024-05-16 02:45:05', '2024-05-16 02:45:05'),
(249, '233', '2024-05-16', 3, 2, NULL, NULL, '06:00:00', '06:30:00', 70.00, NULL, 1, 2, 0, '2024-05-16 02:47:11', '2024-05-16 02:47:11'),
(250, '234', '2024-05-16', 3, 2, NULL, NULL, '06:00:00', '07:30:00', 210.00, NULL, 1, 2, 0, '2024-05-16 02:47:32', '2024-05-16 02:47:32'),
(251, '235', '2024-05-16', 3, 2, NULL, NULL, '06:30:00', '08:30:00', 340.00, NULL, 1, 2, 1, '2024-05-16 04:32:21', '2024-05-16 04:32:21'),
(252, '236', '2024-05-16', 3, 2, NULL, NULL, '08:00:00', '09:15:00', 250.00, NULL, 1, 2, 2, '2024-05-16 04:40:24', '2024-05-16 04:40:24'),
(253, '237', '2024-05-16', 3, 2, NULL, NULL, '08:00:00', '09:15:00', 250.00, NULL, 1, 2, 2, '2024-05-16 04:44:57', '2024-05-16 04:44:57'),
(254, '238', '2024-05-16', 3, 2, NULL, NULL, '06:00:00', '07:15:00', 87.50, NULL, 1, 1, 0, '2024-05-16 04:49:56', '2024-05-16 04:49:56'),
(255, '239', '2024-05-16', 3, 2, NULL, NULL, '06:00:00', '08:00:00', 340.00, NULL, 1, 2, 1, '2024-05-16 04:52:57', '2024-05-16 04:52:57'),
(256, '240', '2024-05-16', 3, 2, NULL, NULL, '09:00:00', '10:30:00', 105.00, NULL, 1, 1, 0, '2024-05-16 04:57:14', '2024-05-16 04:57:14'),
(257, '241', '2024-06-04', 3, 2, NULL, NULL, '12:00:00', '14:00:00', 260.00, NULL, 1, 1, 2, '2024-06-04 15:28:57', '2024-06-04 15:28:57'),
(258, '242', '2024-06-04', 3, 27, 4, 22, '08:00:00', '10:00:00', 140.00, NULL, 1, NULL, NULL, '2024-06-04 16:08:13', '2024-06-04 16:08:24'),
(259, '243', '2024-06-04', 3, 2, NULL, NULL, '07:30:00', '09:45:00', 450.00, NULL, 2, 2, 2, '2024-06-04 16:10:41', '2024-06-04 16:10:41'),
(260, '244', '2024-06-04', 3, 2, NULL, NULL, '09:30:00', '11:00:00', 195.00, NULL, 2, 1, 2, '2024-06-04 16:11:56', '2024-06-04 16:11:56'),
(261, '245', '2024-06-04', 3, 2, NULL, NULL, '09:30:00', '11:00:00', 195.00, NULL, 1, 1, 2, '2024-06-04 16:12:04', '2024-06-04 16:12:04'),
(263, '247', '2024-06-04', 3, 8, 1, 22, '08:00:00', '09:00:00', 100.00, NULL, 1, NULL, NULL, '2024-06-04 16:19:51', '2024-06-04 16:20:14');

-- 
-- Вывод данных для таблицы numerators
--
-- Таблица banya.numerators не содержит данных

-- 
-- Вывод данных для таблицы newtable
--
-- Таблица banya.newtable не содержит данных

-- 
-- Вывод данных для таблицы migrations
--
INSERT INTO migrations VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_13_012630_create_departments_table', 1),
(6, '2023_11_13_012704_create_roles_table', 1),
(7, '2023_11_13_013437_create_permissions_table', 1),
(8, '2023_11_13_013456_create_user_roles_table', 1),
(9, '2023_11_13_013824_create_addresses_table', 1),
(10, '2023_11_13_014444_create_job_titles_table', 1),
(11, '2023_11_13_014625_create_employes_table', 2),
(12, '2023_11_15_204639_create_clients_table', 2),
(13, '2023_11_15_205131_create_orders_table', 3),
(14, '2023_11_15_205141_create_order_details_table', 3),
(15, '2023_11_15_212307_add_column_to_job_title_table', 4),
(16, '2023_11_15_212621_add_image_column_to_employes_table', 4),
(17, '2023_11_21_211924_create_discounts_table', 5),
(20, '2023_12_24_141733_create_events_table', 6),
(21, '2024_01_26_200248_create_numerators_table', 7),
(22, '2024_02_29_105736_create_posts_table', 7),
(23, '2024_02_29_110318_add_post_field_to_users_table', 7),
(24, '2024_03_12_123930_alter_table_users_field_utype', 8),
(26, '2024_03_13_112510_alter_table_users_add_status_field', 9);

-- 
-- Вывод данных для таблицы failed_jobs
--
-- Таблица banya.failed_jobs не содержит данных

-- 
-- Вывод данных для таблицы events
--
INSERT INTO events VALUES
(1, 'Booking', NULL, NULL, 1, 00000000000000000036, 1, '2024-01-02 23:00:00', '2024-01-02 23:15:00', '2024-01-05 16:13:33', '2024-01-05 16:13:33'),
(2, 'Booking', NULL, NULL, 1, 00000000000000000016, 1, '2024-01-05 00:00:00', '2024-01-05 00:30:00', '2024-01-05 16:14:03', '2024-01-05 16:14:03'),
(3, 'Booking', NULL, NULL, 1, 00000000000000000047, 3, '2024-01-06 01:00:00', '2024-01-06 01:15:00', '2024-01-05 16:15:03', '2024-01-05 16:15:03'),
(4, 'Booking', NULL, NULL, 1, 00000000000000000029, 2, '2024-01-05 23:30:00', '2024-01-05 23:45:00', '2024-01-05 16:17:07', '2024-01-05 16:17:07'),
(5, 'Booking', NULL, NULL, 1, 00000000000000000024, 2, '2024-01-05 00:45:00', '2024-01-05 01:15:00', '2024-01-05 16:30:38', '2024-01-05 16:30:38'),
(6, 'Booking', NULL, NULL, 1, 00000000000000000027, 2, '2024-01-07 01:45:00', '2024-01-07 03:30:00', '2024-01-07 09:22:19', '2024-01-07 09:22:19');

-- 
-- Вывод данных для таблицы discounts
--
-- Таблица banya.discounts не содержит данных

-- 
-- Вывод данных для таблицы addresses
--
INSERT INTO addresses VALUES
(11, 3, '237 Lee Drive\nMcKenzieport, KY 46393', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(12, 3, '812 Weimann Track\nMrazmouth, RI 24069', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(13, 3, '703 Cartwright Station\nNorth Emmymouth, NM 86767', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(14, 1, '5026 Isabelle Island\nKochtown, MA 59273-6265', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(15, 2, '447 Ford Streets\nSouth Levibury, FL 48109-3062', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(16, 1, '17453 Shields Falls\nZoeborough, OK 42642', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(17, 1, '6039 Schmidt Forest\nNew Katelynnton, SD 17245-6572', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(18, 3, '30713 Lennie Fort Suite 518\nKuvalismouth, IL 01614', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(19, 2, '3180 Houston Manor Apt. 147\nFeilstad, IA 80115', '2023-11-16 04:31:00', '2023-11-16 04:31:00'),
(20, 1, '80192 Leanne Track\nPamelaside, IN 71926', '2023-11-16 04:31:00', '2023-11-16 04:31:00');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;