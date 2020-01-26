CREATE TABLE `colors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `pelicula_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`pelicula_id`),
  UNIQUE KEY `unique_colors_key` (`id`),
  KEY `index_colors_pelicula` (`pelicula_id`),
  CONSTRAINT `colors_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

CREATE TABLE `directors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `pelicula_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`pelicula_id`),
  UNIQUE KEY `unique_directors_key` (`id`),
  KEY `index_directors_pelicula` (`pelicula_id`),
  CONSTRAINT `directors_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

CREATE TABLE `elencos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `personaje` varchar(50) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `pelicula_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`pelicula_id`),
  UNIQUE KEY `unique_elencos_key` (`id`),
  KEY `index_elencos_pelicula` (`pelicula_id`),
  CONSTRAINT `elencos_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8;

CREATE TABLE `generos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `pelicula_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`pelicula_id`),
  UNIQUE KEY `unique_generos_key` (`id`),
  KEY `index_generos_pelicula` (`pelicula_id`),
  CONSTRAINT `generos_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

CREATE TABLE `idiomas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `pelicula_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`pelicula_id`),
  UNIQUE KEY `unique_idiomas_key` (`id`),
  KEY `index_idiomas_pelicula` (`pelicula_id`),
  CONSTRAINT `idiomas_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

CREATE TABLE `nacions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `pelicula_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`pelicula_id`),
  UNIQUE KEY `unique_nacions_key` (`id`),
  KEY `index_nacions_pelicula` (`pelicula_id`),
  CONSTRAINT `nacions_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

CREATE TABLE `peliculas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `titulo_original` varchar(100) DEFAULT NULL,
  `anio` varchar(15) NOT NULL,
  `imdb_code` varchar(15) DEFAULT NULL,
  `formato` varchar(15) DEFAULT NULL,
  `media` varchar(15) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IND_TITULO_ANIO` (`titulo_original`,`anio`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

CREATE TABLE `sonidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `pelicula_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`pelicula_id`),
  UNIQUE KEY `unique_sonidos_key` (`id`),
  KEY `index_sonidos_pelicula` (`pelicula_id`),
  CONSTRAINT `sonidos_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

CREATE TABLE `writers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `pelicula_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`pelicula_id`),
  UNIQUE KEY `unique_writers_key` (`id`),
  KEY `index_writers_pelicula` (`pelicula_id`),
  CONSTRAINT `writers_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

