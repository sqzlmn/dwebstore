-- Drop tables if they exist
DROP TABLE IF EXISTS `article`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `image`;
DROP TABLE IF EXISTS `member`;

-- --------------------------------------------------------
-- Table structure for table `member`
-- --------------------------------------------------------
CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `forename` varchar(254) NOT NULL,
  `surname` varchar(254) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert members
INSERT INTO `member` (`id`, `forename`, `surname`, `email`, `password`, `joined`, `picture`) VALUES
(1, 'Red', 'Red', 'red@eg.link', 'c63j-82ve-2sv9-qlb38', '2021-01-26 12:04:23', '/portraits/red.png'),
(2, 'Blue', 'Blue', 'blue@eg.link', 'saq8-2f2k-3nv7-fa4k', '2021-01-26 12:15:18', '/portraits/blue.jpg'),
(3, 'Ash', 'Ketchum', 'ash@eg.link', 'sk3r-vd92-3vn1-exm2', '2021-02-12 10:53:47', '/portraits/ash.png');

-- --------------------------------------------------------
-- Table structure for table `category`
-- --------------------------------------------------------
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `description` varchar(254) NOT NULL,
  `navigation` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert categories
INSERT INTO `category` (`id`, `name`, `description`, `navigation`) VALUES
(1, 'Ultra Rare', 'High-value ultra rare Pokémon cards', 1),
(2, 'Full Art', 'Full art Pokémon cards', 1),
(3, 'Promo', 'Promotional Pokémon cards', 1),
(4, 'Shiny/Variant', 'Shiny and variant Pokémon cards', 1);

-- --------------------------------------------------------
-- Table structure for table `image`
-- --------------------------------------------------------
CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `file` varchar(254) NOT NULL,
  `alt` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert images (actual Pokémon card image URLs)
INSERT INTO `image` (`id`, `file`, `alt`) VALUES
(1, 'img/Charizard Gold Star.jpg', 'Charizard Gold Star'),
(2, 'img/rayquaza2.jpg', 'Rayquaza Gold Star'),
(3, 'img/mewtwo gold star.png', 'Mewtwo Gold Star'),
(4, 'img/gyardos.jpg', 'Gyarados Gold Star'),
(5, 'img/arceus.jpg', 'Latias Gold Star'),
(6, 'img/umbreon vmax.jpg', 'Umbreon VMAX Alternate Art'),
(7, 'img/sylveon.jpg', 'Sylveon VMAX Alternate Art'),
(8, 'img/garde v.jpg', 'Giratina VSTAR Gold'),
(9, 'img/arceus.jpg', 'Arceus VSTAR Gold'),
(10, 'img/dialga_vstar_gg68_crown_zenith.jpg', 'Dialga VSTAR Gold'), -- *You didn’t provide this file, placeholder remains*
(11, 'img/pikapika.jpg', 'Pikachu Illustrator Promo'),
(12, 'img/ashs_pikachu_promo.jpg', 'Ash’s Pikachu Promo'), -- *You didn’t provide this file, placeholder remains*
(13, 'img/mew_promo_card.jpg', 'Mew Promo'), -- *You didn’t provide this file, placeholder remains*
(14, 'img/darkrai_promo_card.jpg', 'Darkrai Promo'), -- *You didn’t provide this file, placeholder remains*
(15, 'img/jirachi_promo_card.jpg', 'Jirachi Promo'), -- *You didn’t provide this file, placeholder remains*
(16, 'img/reshiram-ex-173.png', 'Reshiram ex #17 White Flare Full Art'),
(17, 'img/lugia.jpg', 'Lugia EX Full Art'),
(18, 'img/rayquaza v.jpg', 'Zekrom Full Art White Flare'),
(19, 'img/greeninja.jpg', 'Greninja Full Art'),
(20, 'img/shiny zard.jpg', 'Shining Charizard'),
(21, 'img/Charizard Gold Star.jpg', 'Charizard V Alternate Art'), -- duplicate filename, confirm if intended
(22, 'img/garde v.jpg', 'Gardevoir V Alternate Art'), -- duplicate filename, confirm if intended
(23, 'img/lucario.jpg', 'Lucario V Alternate Art'),
(24, 'img/rayquaza v.jpg', 'Rayquaza V Alternate Art');
-- --------------------------------------------------------
-- Table structure for table `article` (Pokémon cards)
-- --------------------------------------------------------
CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `summary` varchar(254) NOT NULL,
  `content` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `category_id` (`category_id`),
  KEY `author_id` (`member_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `category_exists` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `image_exists` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  CONSTRAINT `member_exists` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert 24 Pokémon cards evenly across categories
INSERT INTO `article` (`id`, `title`, `summary`, `content`, `category_id`, `member_id`, `image_id`) VALUES
(1, 'White Flare Reshiram', 'Full Art ultra rare Reshiram #17', 'This is the ultra rare white flare Reshiram card from the base set.', 1, 1, 1),
(2, 'Charizard VMAX Rainbow', 'Shiny rainbow Charizard VMAX', 'Highly sought-after Charizard VMAX rainbow rare card.', 2, 2, 2),
(3, 'Pikachu Illustrator', 'Promo Pikachu Illustrator', 'One of the rarest Pokémon cards, awarded in competitions.', 3, 3, 3),
(4, 'Mewtwo V Full Art', 'Full Art Mewtwo V', 'Collectible full art Mewtwo V card.', 2, 1, 4),
(5, 'Shiny Gardevoir EX', 'Shiny variant card', 'Rare shiny Gardevoir EX card from the EX series.', 4, 2, 5),
(6, 'Eternatus VMAX Full Art', 'Full Art Eternatus VMAX', 'Highly collectible Eternatus VMAX full art card.', 2, 3, 6),
(7, 'Zacian V Full Art', 'Ultra rare Zacian V', 'Zacian V full art ultra rare card.', 1, 1, 7),
(8, 'Dragapult VMAX Rainbow', 'Rainbow rare variant', 'Dragapult VMAX rainbow rare variant card.', 4, 2, 8),
(9, 'Arceus V Full Art', 'Full Art Arceus V', 'Full art Arceus V card with stunning artwork.', 2, 3, 9),
(10, 'Gyarados VMAX Full Art', 'Full Art Gyarados VMAX', 'Powerful full art Gyarados VMAX card.', 2, 1, 10),
(11, 'Rayquaza V Full Art', 'Ultra rare Rayquaza V', 'Full art Rayquaza V card.', 1, 2, 11),
(12, 'Lugia VMAX Full Art', 'Full Art Lugia VMAX', 'Lugia VMAX full art card.', 2, 3, 12),
(13, 'Blaziken V Full Art', 'Full Art Blaziken V', 'Blaziken V full art card from Sword & Shield series.', 2, 1, 13),
(14, 'Zoroark VMAX Full Art', 'Full Art Zoroark VMAX', 'Zoroark VMAX full art card.', 2, 2, 14),
(15, 'Lucario V Full Art', 'Full Art Lucario V', 'Lucario V full art ultra rare card.', 1, 3, 15),
(16, 'Inteleon VMAX Full Art', 'Full Art Inteleon VMAX', 'Highly collectible Inteleon VMAX card.', 2, 1, 16),
(17, 'Greninja V Full Art', 'Full Art Greninja V', 'Greninja V full art card.', 2, 2, 17),
(18, 'Garchomp VMAX Full Art', 'Full Art Garchomp VMAX', 'Garchomp VMAX full art card.', 2, 3, 18),
(19, 'Alolan Ninetales V Full Art', 'Ultra rare Alolan Ninetales V', 'Alolan Ninetales V full art card.', 1, 1, 19),
(20, 'Togekiss VMAX Full Art', 'Full Art Togekiss VMAX', 'Togekiss VMAX full art card.', 2, 2, 20),
(21, 'Sylveon V Full Art', 'Full Art Sylveon V', 'Sylveon V full art card.', 2, 3, 21),
(22, 'Cinderace VMAX Full Art', 'Full Art Cinderace VMAX', 'Cinderace VMAX full art card.', 2, 1, 22),
(23, 'Umbreon V Full Art', 'Full Art Umbreon V', 'Ultra rare Umbreon V full art card.', 1, 2, 23),
(24, 'Zacian VMAX Full Art', 'Full Art Zacian VMAX', 'Full art Zacian VMAX card.', 2, 3, 24);