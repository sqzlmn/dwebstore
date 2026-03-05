--
-- Database: `anime_figurine_store`
--

-- --------------------------------------------------------
-- Table structure for table `figurine`
--

CREATE TABLE `figurine` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `series` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sample Figurine Data
--

INSERT INTO `figurine`
(`id`,`name`,`series`,`description`,`price`,`stock`,`created`,`category_id`,`image_id`,`available`)
VALUES
(1,'Naruto Uzumaki Figure','Naruto','Highly detailed Naruto Uzumaki figurine in Sage Mode.',39.99,20,'2024-01-01 10:00:00',1,1,1),
(2,'Goku Super Saiyan Figure','Dragon Ball Z','Dynamic Super Saiyan Goku action pose figurine.',45.50,15,'2024-01-02 11:30:00',1,2,1),
(3,'Levi Ackerman Figure','Attack on Titan','Levi Ackerman figure with ODM gear.',42.75,10,'2024-01-03 12:15:00',2,3,1),
(4,'Sailor Moon Figure','Sailor Moon','Classic Sailor Moon collectible figurine.',34.99,18,'2024-01-04 14:10:00',3,4,1),
(5,'Luffy Gear 5 Figure','One Piece','Monkey D. Luffy Gear 5 collectible figurine.',49.99,12,'2024-01-05 16:00:00',1,5,1);

-- --------------------------------------------------------
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `navigation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Figurine Categories
--

INSERT INTO `category` (`id`,`name`,`description`,`navigation`) VALUES
(1,'Shonen','Figurines from popular shonen anime',1),
(2,'Attack on Titan','Characters from Attack on Titan',1),
(3,'Magical Girl','Magical girl anime figurines',1),
(4,'Classic Anime','Figurines from classic anime series',1);

-- --------------------------------------------------------
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sample Images
--

INSERT INTO `image` (`id`,`file`,`alt`) VALUES
(1,'naruto-figure.jpg','Naruto Uzumaki Figurine'),
(2,'goku-figure.jpg','Super Saiyan Goku Figurine'),
(3,'levi-figure.jpg','Levi Ackerman Figurine'),
(4,'sailor-moon-figure.jpg','Sailor Moon Figurine'),
(5,'luffy-gear5.jpg','Luffy Gear 5 Figurine');

-- --------------------------------------------------------
-- Table structure for table `member`
-- (Admins or shop managers)
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `forename` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `member` (`id`,`forename`,`surname`,`email`,`password`,`joined`)
VALUES
(1,'Admin','User','admin@figurineshop.com','adminpass','2024-01-01 09:00:00');

-- --------------------------------------------------------
-- Indexes
--

ALTER TABLE `figurine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `image_id` (`image_id`);

ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

-- --------------------------------------------------------
-- AUTO_INCREMENT
--

ALTER TABLE `figurine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
-- Foreign Keys
--

ALTER TABLE `figurine`
  ADD CONSTRAINT `category_exists`
  FOREIGN KEY (`category_id`) REFERENCES `category`(`id`);

ALTER TABLE `figurine`
  ADD CONSTRAINT `image_exists`
  FOREIGN KEY (`image_id`) REFERENCES `image`(`id`);