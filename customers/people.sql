-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 16 Septembre 2011 à 07:00
-- Version du serveur: 5.1.53
-- Version de PHP: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `people`
--

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `genre` varchar(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `adresse_IP` varchar(250) NOT NULL,
  `amount` varchar(250) NOT NULL,
  `os` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `genre`, `email`, `mdp`, `age`, `photo`, `adresse_IP`, `amount`, `os`) VALUES
(1, 'Dubuis', 'Renaud', 'M', 'r.dubuis@free.fr', 'orsys01', 33, 'images/01.jpg', '82.234.219.199', '1000', ''),
(2, 'Smith', 'Judith', 'F', 'judith@orsys.fr', 'orsys02', 26, 'images/02.jpg', '93.182.204.179', '13500', ''),
(3, 'Smith', 'Marc', 'M', 'marc@orsys.fr', 'orsys03', 35, 'images/03.jpg', '193.252.148.80', '12100', ''),
(4, 'Smith', 'Clarice', 'F', 'clarice@orsys.fr', 'orsys04', 27, 'images/04.jpg', '193.252.148.80', '9000', ''),
(5, 'Smith', 'Eva', 'F', 'eva@orsys.fr', 'orsys05', 37, 'images/05.jpg', '82.234.219.199', '7000', ''),
(6, 'Smith', 'Robert', 'M', 'robert@orsys.fr', 'orsys06', 41, 'images/06.jpg', '96.2.2.142', '16350', ''),
(7, 'Smith', 'Paul', 'M', 'paul@orsys.fr', 'orsys07', 54, 'images/07.jpg', '195.154.120.129', '12400', ''),
(8, 'Smith', 'Lea', 'F', 'lea@orsys.fr', 'orsys08', 21, 'images/01.jpg', '96.2.2.142', '11000', '');
