-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 10 nov. 2021 à 17:40
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbfret`
--

-- --------------------------------------------------------

--
-- Structure de la table `affretement`
--

CREATE TABLE `affretement` (
  `idAf` int(5) NOT NULL,
  `id` int(5) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `affretement`
--

INSERT INTO `affretement` (`idAf`, `id`, `date`, `heure`) VALUES
(14056, 15628, '2021-03-19', '21:36:49'),
(14060, 15542, '2021-05-02', '14:41:51'),
(459629, 15628, '2021-11-01', '12:45:36');

-- --------------------------------------------------------

--
-- Structure de la table `bateaufret`
--

CREATE TABLE `bateaufret` (
  `id` int(5) NOT NULL,
  `poidsMax` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bateaufret`
--

INSERT INTO `bateaufret` (`id`, `poidsMax`) VALUES
(15542, '24000'),
(15628, '60000');

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `idAf` int(5) NOT NULL,
  `idLot` int(5) NOT NULL,
  `idTran` int(5) NOT NULL,
  `poids` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`idAf`, `idLot`, `idTran`, `poids`) VALUES
(14056, 1, 16411, 2000),
(14060, 2, 15411, 4500),
(459629, 3, 15411, 4500),
(459629, 4, 15411, 5000);

-- --------------------------------------------------------

--
-- Structure de la table `tranche`
--

CREATE TABLE `tranche` (
  `idTran` int(5) NOT NULL,
  `tarifunit` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tranche`
--

INSERT INTO `tranche` (`idTran`, `tarifunit`) VALUES
(15411, 5000),
(16411, 7500);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affretement`
--
ALTER TABLE `affretement`
  ADD PRIMARY KEY (`idAf`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `bateaufret`
--
ALTER TABLE `bateaufret`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`idAf`,`idLot`),
  ADD KEY `idTran` (`idTran`);

--
-- Index pour la table `tranche`
--
ALTER TABLE `tranche`
  ADD PRIMARY KEY (`idTran`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affretement`
--
ALTER TABLE `affretement`
  ADD CONSTRAINT `affretement_ibfk_1` FOREIGN KEY (`id`) REFERENCES `bateaufret` (`id`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`idAf`) REFERENCES `affretement` (`idAf`),
  ADD CONSTRAINT `lot_ibfk_2` FOREIGN KEY (`idTran`) REFERENCES `tranche` (`idTran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
