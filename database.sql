-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Трв 29 2017 р., 12:22
-- Версія сервера: 5.7.14
-- Версія PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `aniart`
--

-- --------------------------------------------------------

--
-- Структура таблиці `nest`
--

CREATE TABLE `nest` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `nest`
--

INSERT INTO `nest` (`id`, `name`, `lft`, `rgt`, `level`) VALUES
(1, 'transport', 1, 14, 0),
(2, 'motorcycles', 2, 7, 1),
(3, 'aprilia', 3, 4, 2),
(4, 'honda', 5, 6, 2),
(5, 'cars', 8, 13, 1),
(6, 'nissan', 9, 10, 2),
(7, 'alfa-romeo', 11, 12, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `posts`
--

INSERT INTO `posts` (`id`, `Name`) VALUES
(1, 'Директор'),
(2, 'Начальник відділу продаж'),
(3, 'Начальник охорони'),
(4, 'охоронець #1'),
(5, 'охоронець #2'),
(6, 'Продавець #1'),
(7, 'Продавець #2');

-- --------------------------------------------------------

--
-- Структура таблиці `posts_tree`
--

CREATE TABLE `posts_tree` (
  `id` int(11) NOT NULL,
  `ancestor` int(11) NOT NULL,
  `descendant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `posts_tree`
--

INSERT INTO `posts_tree` (`id`, `ancestor`, `descendant`) VALUES
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(9, 2, 6),
(10, 2, 7),
(11, 3, 4),
(12, 3, 5);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `nest`
--
ALTER TABLE `nest`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Індекси таблиці `posts_tree`
--
ALTER TABLE `posts_tree`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ancentor` (`ancestor`,`descendant`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `nest`
--
ALTER TABLE `nest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблиці `posts_tree`
--
ALTER TABLE `posts_tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
