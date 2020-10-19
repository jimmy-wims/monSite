-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 13 oct. 2020 à 16:50
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `monsite`
--

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

DROP TABLE IF EXISTS `competence`;
CREATE TABLE IF NOT EXISTS `competence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` int(11) NOT NULL,
  `domaine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domaine` (`domaine_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20200927195221', '2020-09-27 19:53:24', 97),
('DoctrineMigrations\\Version20200927195956', '2020-09-27 20:01:53', 147),
('DoctrineMigrations\\Version20200928153021', '2020-09-28 15:32:06', 135),
('DoctrineMigrations\\Version20201006141044', '2020-10-06 14:11:26', 135);

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `domaine`
--

INSERT INTO `domaine` (`id`, `nom`) VALUES
(1, 'Programmation'),
(2, 'Web'),
(3, 'Base de données'),
(4, 'Frameworks/Librairies'),
(5, 'IDEs'),
(6, 'Outils de programmation');

-- --------------------------------------------------------

--
-- Structure de la table `langage`
--

DROP TABLE IF EXISTS `langage`;
CREATE TABLE IF NOT EXISTS `langage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `langage`
--

INSERT INTO `langage` (`id`, `nom`) VALUES
(1, 'Java'),
(2, 'C'),
(3, 'HTML');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `langage_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_50159CA9957BB53C` (`langage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`id`, `langage_id`, `nom`, `description`, `lien`, `image`) VALUES
(1, 1, 'Space Invaders', 'Reproduction du célèbre jeu Space Invaders en langage java. Le but de ce jeu est de tuer les extraterrestres avec un vaisseau. Pour la création de ce projet nous avions accès à différentes ressources, notamment les fichiers concernant l\'interface. Projet réalisé avec Samir BOUKRI.', 'https://github.com/jimmy-wims/SpaceInvaders.git', 'spaceInvaders.jpg'),
(2, 2, 'Casse-briques', 'Création du jeu Casse-briques en langage C. Le but de ce jeu est de casser les briques en faisant rebondir une balle sur une raquette. Pour la création de ce projet j\'ai utilisé la librairie SDL2 permettant de créer une interface graphique 2D.', 'https://github.com/jimmy-wims/CasseBriques.git', 'casseBriques');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `FK_50159CA9957BB53C` FOREIGN KEY (`langage_id`) REFERENCES `langage` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
