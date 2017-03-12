CREATE TABLE `tbl_feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` varchar(243) NOT NULL,
  `show_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_show_at` (`show_at`)
) ENGINE=InnoDB;

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `tbl_category_feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_category_feed` (`category_id`,`feed_id`)
) ENGINE=InnoDB;
ALTER TABLE `tbl_category_feed`
  ADD CONSTRAINT `fk_tbl_category_feed_1` FOREIGN KEY (`feed_id`) REFERENCES `tbl_feed` (`id`);
ALTER TABLE `tbl_category_feed`
  ADD CONSTRAINT `fk_tbl_category_feed_2` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`);

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_name` (`name`)
) ENGINE=InnoDB;

CREATE TABLE `tbl_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `i_user_feed` (`user_id`,`feed_id`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
ALTER TABLE `tbl_like`
  ADD CONSTRAINT `fk_tbl_like_1` FOREIGN KEY (`feed_id`) REFERENCES `tbl_feed` (`id`);
ALTER TABLE `tbl_like`
  ADD CONSTRAINT `fk_tbl_like_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);