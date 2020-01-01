-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 21 déc. 2019 à 01:33
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `isga_app`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

CREATE TABLE `absence` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `justification` tinyint(1) NOT NULL,
  `nbr_heure` double NOT NULL,
  `etudiant_id` int(11) DEFAULT NULL,
  `matiere_id` int(11) DEFAULT NULL,
  `administrateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `absence`
--

INSERT INTO `absence` (`id`, `date`, `justification`, `nbr_heure`, `etudiant_id`, `matiere_id`, `administrateur_id`) VALUES
(61, '2019-12-21 01:26:34', 0, 9, 65, 69, 125),
(62, '2019-12-21 01:26:34', 0, 9, 72, 67, 125),
(63, '2019-12-21 01:26:34', 0, 9, 66, 66, 129),
(64, '2019-12-21 01:26:34', 0, 9, 64, 64, 126),
(65, '2019-12-21 01:26:34', 0, 9, 66, 69, 123),
(66, '2019-12-21 01:26:34', 0, 9, 72, 69, 128),
(67, '2019-12-21 01:26:34', 0, 9, 67, 66, 126),
(68, '2019-12-21 01:26:34', 0, 9, 71, 65, 128),
(69, '2019-12-21 01:26:34', 0, 9, 66, 71, 127),
(70, '2019-12-21 01:26:34', 0, 9, 67, 69, 127);

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom`, `prenom`, `password`, `email`, `tel`, `role`) VALUES
(121, 'nom_admin_0', 'prenom_admin_0', 'ZGmNc9GH/dV+bpyhale+', 'admin0@isga.ma', '0666666666', 'Admin'),
(122, 'nom_admin_1', 'prenom_admin_1', 'ZGmNc9GH/dV+bpyhale+', 'admin1@isga.ma', '0666666666', 'Admin'),
(123, 'nom_admin_2', 'prenom_admin_2', 'ZGmNc9GH/dV+bpyhale+', 'admin2@isga.ma', '0666666666', 'Admin'),
(124, 'nom_admin_3', 'prenom_admin_3', 'ZGmNc9GH/dV+bpyhale+', 'admin3@isga.ma', '0666666666', 'Admin'),
(125, 'nom_admin_4', 'prenom_admin_4', 'ZGmNc9GH/dV+bpyhale+', 'admin4@isga.ma', '0666666666', 'Admin'),
(126, 'nom_admin_5', 'prenom_admin_5', 'ZGmNc9GH/dV+bpyhale+', 'admin5@isga.ma', '0666666666', 'Admin'),
(127, 'nom_admin_6', 'prenom_admin_6', 'ZGmNc9GH/dV+bpyhale+', 'admin6@isga.ma', '0666666666', 'Admin'),
(128, 'nom_admin_7', 'prenom_admin_7', 'ZGmNc9GH/dV+bpyhale+', 'admin7@isga.ma', '0666666666', 'Admin'),
(129, 'nom_admin_8', 'prenom_admin_8', 'ZGmNc9GH/dV+bpyhale+', 'admin8@isga.ma', '0666666666', 'Admin'),
(130, 'nom_admin_9', 'prenom_admin_9', 'ZGmNc9GH/dV+bpyhale+', 'admin9@isga.ma', '0666666666', 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filiere` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emploi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `nom`, `filiere`, `promotion`, `emploi`, `administrateur_id`) VALUES
(121, '5ILDW', 'EI', '2019-2020', 'emploi_0', 126),
(122, '5ILDW', 'EI', '2019-2020', 'emploi_1', 129),
(123, '5ILDW', 'EI', '2019-2020', 'emploi_2', 128),
(124, '5ILDW', 'EI', '2019-2020', 'emploi_3', 130),
(125, '5ILDW', 'EI', '2019-2020', 'emploi_4', 130),
(126, '5ILDW', 'EI', '2019-2020', 'emploi_5', 123),
(127, '5ILDW', 'EI', '2019-2020', 'emploi_6', 126),
(128, '5ILDW', 'EI', '2019-2020', 'emploi_7', 126),
(129, '5ILDW', 'EI', '2019-2020', 'emploi_8', 127),
(130, '5ILDW', 'EI', '2019-2020', 'emploi_9', 128);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_etd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrateur_id` int(11) DEFAULT NULL,
  `classe_id` int(11) DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `password`, `email`, `code_etd`, `tel`, `administrateur_id`, `classe_id`, `role`) VALUES
(63, 'nom_etudiant_0', 'prenom_etudiant_0', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant0@isga.ma', 'E1110', '0666666666', 126, 122, 'Etudiant'),
(64, 'nom_etudiant_1', 'prenom_etudiant_1', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant1@isga.ma', 'E1111', '0666666666', 124, 124, 'Etudiant'),
(65, 'nom_etudiant_2', 'prenom_etudiant_2', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant2@isga.ma', 'E1112', '0666666666', 129, 124, 'Etudiant'),
(66, 'nom_etudiant_3', 'prenom_etudiant_3', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant3@isga.ma', 'E1113', '0666666666', 128, 126, 'Etudiant'),
(67, 'nom_etudiant_4', 'prenom_etudiant_4', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant4@isga.ma', 'E1114', '0666666666', 130, 121, 'Etudiant'),
(68, 'nom_etudiant_5', 'prenom_etudiant_5', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant5@isga.ma', 'E1115', '0666666666', 124, 127, 'Etudiant'),
(69, 'nom_etudiant_6', 'prenom_etudiant_6', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant6@isga.ma', 'E1116', '0666666666', 130, 130, 'Etudiant'),
(70, 'nom_etudiant_7', 'prenom_etudiant_7', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant7@isga.ma', 'E1117', '0666666666', 124, 124, 'Etudiant'),
(71, 'nom_etudiant_8', 'prenom_etudiant_8', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant8@isga.ma', 'E1118', '0666666666', 130, 123, 'Etudiant'),
(72, 'nom_etudiant_9', 'prenom_etudiant_9', 'dCZPDUzfTw0SpSSQgCY3', 'etudiant9@isga.ma', 'E1119', '0666666666', 130, 125, 'Etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `note` double DEFAULT NULL,
  `validation` tinyint(1) DEFAULT NULL,
  `matiere_id` int(11) DEFAULT NULL,
  `administrateur_id` int(11) DEFAULT NULL,
  `etudiant_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `exam`
--

INSERT INTO `exam` (`id`, `date`, `note`, `validation`, `matiere_id`, `administrateur_id`, `etudiant_id`, `nom`) VALUES
(61, '2019-12-21 01:26:34', 6, 1, 71, 129, 64, 'DM0'),
(62, '2019-12-21 01:26:34', 11, 1, 63, 124, 63, 'DM1'),
(63, '2019-12-21 01:26:34', 13, 1, 66, 130, 67, 'DM2'),
(64, '2019-12-21 01:26:34', 6, 1, 65, 127, 68, 'DM3'),
(65, '2019-12-21 01:26:34', 19, 1, 67, 121, 65, 'DM4'),
(66, '2019-12-21 01:26:34', 19, 1, 63, 126, 67, 'DM5'),
(67, '2019-12-21 01:26:34', 9, 1, 68, 129, 71, 'DM6'),
(68, '2019-12-21 01:26:34', 14, 1, 69, 121, 67, 'DM7'),
(69, '2019-12-21 01:26:34', 5, 1, 62, 130, 72, 'DM8'),
(70, '2019-12-21 01:26:34', 8, 1, 66, 124, 65, 'DM9');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbr_heure` double NOT NULL,
  `salle` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `classe_id` int(11) DEFAULT NULL,
  `administrateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `nom`, `nbr_heure`, `salle`, `date`, `classe_id`, `administrateur_id`) VALUES
(62, 'Matiere_0', 28, '1A', '2019-12-21 01:26:34', 128, 123),
(63, 'Matiere_1', 28, '1A', '2019-12-21 01:26:34', 123, 125),
(64, 'Matiere_2', 28, '1A', '2019-12-21 01:26:34', 127, 123),
(65, 'Matiere_3', 28, '1A', '2019-12-21 01:26:34', 127, 130),
(66, 'Matiere_4', 28, '1A', '2019-12-21 01:26:34', 128, 130),
(67, 'Matiere_5', 28, '1A', '2019-12-21 01:26:34', 122, 127),
(68, 'Matiere_6', 28, '1A', '2019-12-21 01:26:34', 130, 130),
(69, 'Matiere_7', 28, '1A', '2019-12-21 01:26:34', 130, 123),
(70, 'Matiere_8', 28, '1A', '2019-12-21 01:26:34', 129, 122),
(71, 'Matiere_9', 28, '1A', '2019-12-21 01:26:34', 130, 128);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191209015325', '2019-12-09 01:54:24'),
('20191210003338', '2019-12-10 00:33:53'),
('20191210004533', '2019-12-10 00:50:33'),
('20191212170557', '2019-12-12 17:07:04'),
('20191212174525', '2019-12-12 17:46:25');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_765AE0C9DDEAB1A3` (`etudiant_id`),
  ADD KEY `IDX_765AE0C9F46CD258` (`matiere_id`),
  ADD KEY `IDX_765AE0C97EE5403C` (`administrateur_id`);

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8F87BF967EE5403C` (`administrateur_id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_717E22E37EE5403C` (`administrateur_id`),
  ADD KEY `IDX_717E22E38F5EA509` (`classe_id`);

--
-- Index pour la table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_38BBA6C6F46CD258` (`matiere_id`),
  ADD KEY `IDX_38BBA6C67EE5403C` (`administrateur_id`),
  ADD KEY `IDX_38BBA6C6DDEAB1A3` (`etudiant_id`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9014574A8F5EA509` (`classe_id`),
  ADD KEY `IDX_9014574A7EE5403C` (`administrateur_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absence`
--
ALTER TABLE `absence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `FK_765AE0C97EE5403C` FOREIGN KEY (`administrateur_id`) REFERENCES `administrateur` (`id`),
  ADD CONSTRAINT `FK_765AE0C9DDEAB1A3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `FK_765AE0C9F46CD258` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_8F87BF967EE5403C` FOREIGN KEY (`administrateur_id`) REFERENCES `administrateur` (`id`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_717E22E37EE5403C` FOREIGN KEY (`administrateur_id`) REFERENCES `administrateur` (`id`),
  ADD CONSTRAINT `FK_717E22E38F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`);

--
-- Contraintes pour la table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `FK_38BBA6C67EE5403C` FOREIGN KEY (`administrateur_id`) REFERENCES `administrateur` (`id`),
  ADD CONSTRAINT `FK_38BBA6C6DDEAB1A3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `FK_38BBA6C6F46CD258` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `FK_9014574A7EE5403C` FOREIGN KEY (`administrateur_id`) REFERENCES `administrateur` (`id`),
  ADD CONSTRAINT `FK_9014574A8F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
