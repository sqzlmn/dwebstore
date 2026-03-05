-- --------------------------------------------------------
-- Create image table if it doesn't exist
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(254) NOT NULL,
  `alt` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Create pokemon_card table if it doesn't exist
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokemon_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_name` varchar(254) NOT NULL,
  `pokemon_name` varchar(254) NOT NULL,
  `card_set` varchar(254) NOT NULL,
  `card_number` varchar(50) NOT NULL,
  `rarity` varchar(50) NOT NULL,
  `estimated_value` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Insert Images
-- --------------------------------------------------------
INSERT INTO `image` (`id`,`file`,`alt`) VALUES
(1,'https://pkmncards.com/wp-content/uploads/charizard_gold_star_dragon_frontiers.jpg','Charizard Gold Star'),
(2,'https://pkmncards.com/wp-content/uploads/rayquaza_gold_star_ex_deoxys.jpg','Rayquaza Gold Star'),
(3,'https://pkmncards.com/wp-content/uploads/mewtwo_gold_star_holon_phantoms.jpg','Mewtwo Gold Star'),
(4,'https://pkmncards.com/wp-content/uploads/gyarados_gold_star_holon_phantoms.jpg','Gyarados Gold Star'),
(5,'https://pkmncards.com/wp-content/uploads/latias_gold_star_ex_deoxys.jpg','Latias Gold Star'),
(6,'https://pkmncards.com/wp-content/uploads/umbreon_vmax_215_evolving_skies.jpg','Umbreon VMAX Alternate Art'),
(7,'https://pkmncards.com/wp-content/uploads/sylveon_vmax_212_evolving_skies.jpg','Sylveon VMAX Alternate Art'),
(8,'https://pkmncards.com/wp-content/uploads/giratina_vstar_gg69_crown_zenith.jpg','Giratina VSTAR Gold'),
(9,'https://pkmncards.com/wp-content/uploads/arceus_vstar_184_brilliant_stars.jpg','Arceus VSTAR Gold'),
(10,'https://pkmncards.com/wp-content/uploads/dialga_vstar_gg68_crown_zenith.jpg','Dialga VSTAR Gold'),
(11,'https://pkmncards.com/wp-content/uploads/pikachu_illustrator_promo.jpg','Pikachu Illustrator Promo'),
(12,'https://pkmncards.com/wp-content/uploads/ashs_pikachu_promo.jpg','Ash’s Pikachu Promo'),
(13,'https://pkmncards.com/wp-content/uploads/mew_promo_card.jpg','Mew Promo'),
(14,'https://pkmncards.com/wp-content/uploads/darkrai_promo_card.jpg','Darkrai Promo'),
(15,'https://pkmncards.com/wp-content/uploads/jirachi_promo_card.jpg','Jirachi Promo'),
(16,'https://assets.pokemon.com/assets/cms2/img/cards/web/SV11W/SV11W_017.png','Reshiram ex #17 White Flare Full Art'),
(17,'https://pkmncards.com/wp-content/uploads/lugia_ex_134_plasma_storm.jpg','Lugia EX Full Art'),
(18,'https://assets.pokemon.com/assets/cms2/img/cards/web/SV11W/SV11W_018.png','Zekrom Full Art White Flare'),
(19,'https://pkmncards.com/wp-content/uploads/greninja_full_art_shining_legends.jpg','Greninja Full Art'),
(20,'https://pkmncards.com/wp-content/uploads/shining_charizard_neo_destiny.jpg','Shining Charizard'),
(21,'https://pkmncards.com/wp-content/uploads/charizard_v_alternate_art.jpg','Charizard V Alternate Art'),
(22,'https://pkmncards.com/wp-content/uploads/gardevoir_v_alternate_art.jpg','Gardevoir V Alternate Art'),
(23,'https://pkmncards.com/wp-content/uploads/lucario_v_alternate_art.jpg','Lucario V Alternate Art'),
(24,'https://pkmncards.com/wp-content/uploads/rayquaza_v_alternate_art.jpg','Rayquaza V Alternate Art');

-- --------------------------------------------------------
-- Insert Pokémon Cards
-- --------------------------------------------------------
INSERT INTO `pokemon_card`
(`card_name`,`pokemon_name`,`card_set`,`card_number`,`rarity`,`estimated_value`,`description`,`stock`,`category_id`,`image_id`,`available`)
VALUES
('Charizard Gold Star','Charizard','EX Dragon Frontiers','100/101','Gold Star',3500.00,'One of the rarest Charizard cards.',1,1,1,1),
('Rayquaza Gold Star','Rayquaza','EX Deoxys','107/107','Gold Star',2000.00,'Highly collectible shiny Rayquaza.',1,1,2,1),
('Mewtwo Gold Star','Mewtwo','EX Holon Phantoms','103/110','Gold Star',1800.00,'Shiny Mewtwo collectible card.',1,1,3,1),
('Gyarados Gold Star','Gyarados','EX Holon Phantoms','102/110','Gold Star',1500.00,'Rare shiny Gyarados.',1,1,4,1),
('Latias Gold Star','Latias','EX Deoxys','105/107','Gold Star',1200.00,'Highly collectible Latias.',1,1,5,1),
('Umbreon VMAX Alt Art','Umbreon','Evolving Skies','215/203','Secret Rare',1200.00,'Moonbreon card with iconic artwork.',3,2,6,1),
('Sylveon VMAX Alt Art','Sylveon','Evolving Skies','212/203','Secret Rare',400.00,'Colorful alternate art Sylveon.',3,2,7,1),
('Giratina VSTAR Gold','Giratina','Crown Zenith','GG69','Secret Rare',500.00,'Gold textured legendary card.',2,2,8,1),
('Arceus VSTAR Gold','Arceus','Brilliant Stars','184/172','Secret Rare',450.00,'Golden Arceus card.',2,2,9,1),
('Dialga VSTAR Gold','Dialga','Astral Radiance','GG68','Secret Rare',420.00,'Gold legendary Dialga card.',2,2,10,1),
('Pikachu Illustrator','Pikachu','Promo','ILLUSTRATOR','Promo Ultra Rare',5000000.00,'Awarded in a Japanese illustration contest.',1,3,11,1),
('Ash’s Pikachu Promo','Pikachu','Promo','001/001','Promo Ultra Rare',1000.00,'Special Ash’s Pikachu promo card.',2,3,12,1),
('Mew Promo','Mew','Promo','002/002','Promo Ultra Rare',1200.00,'Rare Mew promo card.',2,3,13,1),
('Darkrai Promo','Darkrai','Promo','003/002','Promo Ultra Rare',1300.00,'Darkrai special promo card.',2,3,14,1),
('Jirachi Promo','Jirachi','Promo','004/002','Promo Ultra Rare',1500.00,'Limited Jirachi promo card.',1,3,15,1),
('Reshiram ex #17','Reshiram','White Flare','017/086','Ultra Rare',250.00,'All-white Reshiram from the White Flare set.',2,4,16,1),
('Lugia EX Full Art','Lugia','Plasma Storm','134/135','Full Art',300.00,'Powerful Lugia EX full art.',4,4,17,1),
('Zekrom Full Art','Zekrom','White Flare','018/086','Full Art',260.00,'Matching White Flare Zekrom full art.',2,4,18,1),
('Greninja Full Art','Greninja','Shining Legends','45/73','Full Art',220.00,'Shiny Greninja full art card.',2,4,19,1),
('Shining Charizard','Charizard','Neo Destiny','107/105','Secret Rare',2500.00,'Classic shiny Charizard card.',1,5,20,1),
('Charizard V Alternate Art','Charizard','Champion’s Path','25/73','Alternate Art',400.00,'Charizard V alternate artwork.',1,5,21,1),
('Gardevoir V Alternate Art','Gardevoir','Shining Legends','38/73','Alternate Art',300.00,'Alternate art Gardevoir V.',1,5,22,1),
('Lucario V Alternate Art','Lucario','Shining Legends','15/73','Alternate Art',280.00,'Alternate art Lucario V card.',1,5,23,1),
('Rayquaza V Alternate Art','Rayquaza','Shining Legends','12/73','Alternate Art',320.00,'Rayquaza V alternate artwork.',1,5,24,1);