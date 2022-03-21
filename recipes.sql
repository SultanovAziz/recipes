-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 21 2022 г., 04:06
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `recipes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `alias`, `description`) VALUES
(1, 'Гарниры', 'garnier', 'Категория гарниры'),
(2, 'Горячие блюда', 'hot_dishes', 'Категория горячих блюд'),
(3, 'Супы', 'soup', 'Категория супов'),
(4, 'Салаты', 'salads', 'Категория салаты');

-- --------------------------------------------------------

--
-- Структура таблицы `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ingredients`
--

INSERT INTO `ingredients` (`id`, `title`, `unit_id`) VALUES
(1, 'говядина', 2),
(2, 'картошка', 2),
(3, 'соль', 3),
(4, 'перец(приправа)', 3),
(5, 'лук', 2),
(6, 'морковка', 2),
(7, 'яйцо', 4),
(8, 'молоко', 1),
(9, 'растительное масло', 1),
(10, 'масло', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `ingredients_in_recipe`
--

CREATE TABLE `ingredients_in_recipe` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredients_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ingredients_in_recipe`
--

INSERT INTO `ingredients_in_recipe` (`id`, `recipe_id`, `ingredients_id`, `quantity`) VALUES
(1, 2, 2, 2),
(2, 2, 8, 1),
(3, 2, 3, 20),
(4, 4, 1, 1),
(5, 4, 6, 1),
(6, 4, 2, 1),
(7, 4, 5, 2),
(8, 4, 9, 1),
(9, 5, 1, 2),
(10, 5, 4, 20),
(11, 5, 3, 20),
(12, 5, 7, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `number_of_step`
--

CREATE TABLE `number_of_step` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `number_step` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `number_of_step`
--

INSERT INTO `number_of_step` (`id`, `recipe_id`, `number_step`, `description`) VALUES
(1, 2, 1, 'Очистить картошку'),
(2, 2, 2, 'Вскипятить воду'),
(3, 2, 3, 'Отварить картошку'),
(4, 2, 4, 'Размельчить картошку'),
(5, 2, 5, 'Добавить соли'),
(6, 2, 6, 'Добавить молока');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `calories` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `recipe`
--

INSERT INTO `recipe` (`id`, `category_id`, `name`, `calories`, `time`, `img`, `description`) VALUES
(2, 2, 'Картофельное пюре', '1000', '00:00:25', 'img-2.png', 'Пюре одно из самых простых блюд.'),
(3, 4, 'Оливия', '2030', '00:01:20', 'img-3.png', 'Вкусный салат в зимний период времени'),
(4, 3, 'Острый суп-гуляш из говядины', '1500', '00:01:30', 'img-4.png', 'Острый суп из говядины с овощами'),
(5, 2, 'Вырезка фаршированная овощами', '2300', '00:01:00', 'img-5.png', 'Фаршированная вырезка ');

-- --------------------------------------------------------

--
-- Структура таблицы `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit`
--

INSERT INTO `unit` (`id`, `name`) VALUES
(3, 'грам'),
(12, 'дюжина'),
(2, 'Килограм'),
(1, 'литр'),
(11, 'милиграм'),
(5, 'порция'),
(6, 'упаковка'),
(4, 'штука');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`unit_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Индексы таблицы `ingredients_in_recipe`
--
ALTER TABLE `ingredients_in_recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `ingredients_id` (`ingredients_id`);

--
-- Индексы таблицы `number_of_step`
--
ALTER TABLE `number_of_step`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Индексы таблицы `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `ingredients_in_recipe`
--
ALTER TABLE `ingredients_in_recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `number_of_step`
--
ALTER TABLE `number_of_step`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

--
-- Ограничения внешнего ключа таблицы `ingredients_in_recipe`
--
ALTER TABLE `ingredients_in_recipe`
  ADD CONSTRAINT `ingredients_in_recipe_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingredients_in_recipe_ibfk_2` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `number_of_step`
--
ALTER TABLE `number_of_step`
  ADD CONSTRAINT `number_of_step_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
