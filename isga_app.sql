-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 10 jan. 2020 à 20:47
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
  `date` date NOT NULL,
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
(142, '2020-01-10', 1, 5, 154, 164, 221),
(143, '2020-01-10', 1, 9, 154, 169, 221),
(144, '2020-01-10', 0, 4, 157, 162, 221),
(145, '2020-01-10', 1, 17, 160, 171, 230),
(146, '2020-01-10', 0, 13, 158, 168, 228),
(147, '2020-01-10', 1, 6, 155, 169, 228),
(148, '2020-01-10', 1, 16, 154, 171, 225),
(149, '2020-01-10', 1, 0, 162, 167, 222),
(150, '2020-01-10', 1, 2, 153, 162, 225),
(151, '2020-01-10', 0, 10, 158, 169, 228);

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom`, `prenom`, `password`, `email`, `tel`, `role`) VALUES
(221, 'Swaniawski', 'Gilda', '$2y$13$hvWynTbkhOyCrdP9Zea00.hSALDxrAzOBnABLC9bTDdCRQGBPvdAG', 'bo.bruen@yahoo.com', '508-870-0340 x358', 'Admin'),
(222, 'Mosciski', 'Syble', '$2y$13$MIZzRCzmF6U7rTWihDkCtu7EnY8QzEzphT.gSmZXCJ1lK1mxoDpyi', 'hhackett@gmail.com', '+1 (763) 546-1829', 'Admin'),
(223, 'Stamm', 'Kyle', '$2y$13$nYnpvSDvnxD5ZA4e1j/i/eWWzyGPY.XEwEV.BpK9BaPGMIkNiiZbG', 'ypfeffer@gmail.com', '(921) 712-0015', 'Admin'),
(224, 'Robel', 'Tessie', '$2y$13$Eu1he1.uqpiqpJh3GHqoBuVJjRP2g97uTFBBHfLdAsUSK8/C9fdY.', 'thompson.dangelo@koepp.com', '464-310-5253 x36696', 'Admin'),
(225, 'Beahan', 'Tony', '$2y$13$br91J2pFIHHPkWfjDX7H9ek4nOiA7TOcmmwbA5HfIDrCsRZPyWluq', 'kbode@greenfelder.biz', '1-819-412-6232 x1246', 'Admin'),
(226, 'Windler', 'Gerald', '$2y$13$WtLDhVzZuq4T5UvkoFuAXuBzvxSCMVR89pnruaR5stwVigXccpxHi', 'reinger.darwin@hotmail.com', '404-256-5169', 'Admin'),
(227, 'Smitham', 'Kirk', '$2y$13$7VQOxgiHBLuW6eb/Qci8suG.K42gtqJ9q5wO/uGwGqIgqxyxNmj/C', 'teagan.schinner@mitchell.com', '(561) 679-0585', 'Admin'),
(228, 'Miller', 'Franz', '$2y$13$4qz0C1/A1OzChjnqkvbOgOlK0YtQO6R/Umi01EFuHAYcGqVg5mV2q', 'kfritsch@hotmail.com', '(496) 819-6466 x295', 'Admin'),
(229, 'Bailey', 'Stacey', '$2y$13$TYxGaJrkXt92fv5xGJ2gpO4AsBu3OQXFi8dBN3qyte17yUOOJ0Gly', 'jjakubowski@weissnat.com', '1-952-553-4922 x142', 'Admin'),
(230, 'Dach', 'Jerrod', '$2y$13$qXDzwuqOWH7H7kfE.7KhTu7fdC0uftVRDJMhyfkqooMHSWXeWIOeW', 'gvonrueden@gmail.com', '1-634-299-9816 x805', 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filiere` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `nom`, `filiere`, `promotion`, `administrateur_id`) VALUES
(221, '5ILDW', 'EI', '2019-2020', 230),
(222, '5ILDW', 'EI', '2019-2020', 229),
(223, '5ILDW', 'EI', '2019-2020', 227),
(224, '5ILDW', 'EI', '2019-2020', 230),
(225, '5ILDW', 'EI', '2019-2020', 225),
(226, '5ILDW', 'EI', '2019-2020', 227),
(227, '5ILDW', 'EI', '2019-2020', 221),
(228, '5ILDW', 'EI', '2019-2020', 228),
(229, '5ILDW', 'EI', '2019-2020', 226),
(230, '5ILDW', 'EI', '2019-2020', 222);

-- --------------------------------------------------------

--
-- Structure de la table `classe_image`
--

CREATE TABLE `classe_image` (
  `classe_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe_image`
--

INSERT INTO `classe_image` (`classe_id`, `image_id`) VALUES
(222, 14),
(222, 15),
(223, 14);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(153, 'Hartmann', 'Lue', '$2y$13$nlsgleb2Mv3l0bdfuftYJeTOHLGYlezxk4nsLLNtqeJBXucTY4lF.', 'jbergstrom@yahoo.com', '78693401', '1-281-831-8451', 223, 224, 'Etudiant'),
(154, 'Cole', 'Reuben', '$2y$13$MhzARQeVw84zoltIc7vxpup1JnTP.ncKb9sQHIKxvmDBD5rx1uB8u', 'manley.beatty@mcdermott.com', '75476854', '+1-374-331-1765', 226, 224, 'Etudiant'),
(155, 'Shields', 'Keegan', '$2y$13$70AVk.qBI.jlFv9n1Lb59eZCdpebXgYG5jfBvg2vPQ0MkYKwkw7Ui', 'hoeger.alexie@rippin.com', '12609123', '+1.317.213.0017', 224, 228, 'Etudiant'),
(156, 'Heller', 'Randi', '$2y$13$FqRWn2LmfhpJ.7YXpcWlROkre3.AMXD6qGFAeF7VWvIP81mSwfTN6', 'tillman.chaya@gmail.com', '58852750', '+1-570-318-2190', 224, 227, 'Etudiant'),
(157, 'Dibbert', 'Lea', '$2y$13$vLM4xZydI.jSxw92Znk4ruPM2TqPBr2h.pACuht2aADLUu/gLiZdS', 'qkeeling@borer.org', '89177150', '464.223.8248 x0352', 227, 225, 'Etudiant'),
(158, 'Heaney', 'Darby', '$2y$13$pRKpmyDFVmrQndukkMOqouyuO7A.3xSrCXUhI2Fxpg8DF.4MwepiG', 'pouros.alana@corwin.com', '52067464', '+1 (280) 283-8223', 230, 225, 'Etudiant'),
(159, 'Rolfson', 'Maxine', '$2y$13$qMtWCcnSdLZZM8.c0BL1F.d2AFVe/ekKfTKV0LddUHIIMf5ZfvJyG', 'ykunde@goodwin.net', '78246157', '708.842.8252', 229, 223, 'Etudiant'),
(160, 'Gleason', 'Johann', '$2y$13$jZaqFYisjyfzw2UjIxLLRuBCoiCoFjJTimr1fVAYzz035m/kdIxNi', 'yhills@yahoo.com', '16877443', '(660) 496-7764', 221, 227, 'Etudiant'),
(161, 'Beatty', 'Arlo', '$2y$13$ISTDPCA4ZZi9eM80BtO/rekPG9lC8vbpaUBRPhLH1Cn3dRMGIDIJ6', 'squigley@gmail.com', '16469433', '(785) 591-5186', 222, 228, 'Etudiant'),
(162, 'Gleason', 'Verner', '$2y$13$oebXM9VG.debEUH3jytmz.aniZ7Qwc2e0OtEsFzY10SzDtT12cm5y', 'sdubuque@zieme.com', '73151012', '1-315-466-3333 x6043', 230, 228, 'Etudiant');

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
(151, '2020-01-10 19:06:05', 13, 1, 167, 226, 160, 'DM0'),
(152, '2020-01-10 19:06:05', 12, 1, 164, 227, 160, 'DM1'),
(153, '2020-01-10 19:06:05', 12, 1, 163, 226, 159, 'DM2'),
(154, '2020-01-10 19:06:05', 17, 1, 166, 228, 155, 'DM3'),
(155, '2020-01-10 19:06:05', 20, 0, 171, 222, 158, 'DM4'),
(156, '2020-01-10 19:06:05', 16, 0, 162, 222, 161, 'DM5'),
(157, '2020-01-10 19:06:05', 13, 0, 167, 226, 159, 'DM6'),
(158, '2020-01-10 19:06:05', 20, 1, 165, 226, 162, 'DM7'),
(159, '2020-01-10 19:06:05', 20, 1, 163, 225, 156, 'DM8'),
(160, '2020-01-10 19:06:05', 10, 0, 166, 223, 161, 'DM9');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `url`, `alt`) VALUES
(14, '5e18beebc87f3282936466.jpg', '3isi'),
(15, '5e18bf07bbae3506277181.png', '4isi'),
(16, '5e18bf203d370724421564.jpg', '5ildw');

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
(162, 'Matiere_0', 28, '1A', '2020-01-10 19:05:42', 230, 224),
(163, 'Matiere_1', 28, '1A', '2020-01-10 19:05:42', 221, 229),
(164, 'Matiere_2', 28, '1A', '2020-01-10 19:05:42', 230, 227),
(165, 'Matiere_3', 28, '1A', '2020-01-10 19:05:42', 228, 224),
(166, 'Matiere_4', 28, '1A', '2020-01-10 19:05:42', 227, 230),
(167, 'Matiere_5', 28, '1A', '2020-01-10 19:05:42', 222, 229),
(168, 'Matiere_6', 28, '1A', '2020-01-10 19:05:42', 223, 223),
(169, 'Matiere_7', 28, '1A', '2020-01-10 19:05:42', 222, 224),
(170, 'Matiere_8', 28, '1A', '2020-01-10 19:05:42', 226, 222),
(171, 'Matiere_9', 28, '1A', '2020-01-10 19:05:42', 225, 226);

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
('20191212174525', '2019-12-12 17:46:25'),
('20200108181558', '2020-01-08 18:16:27'),
('20200108183606', '2020-01-08 18:36:20'),
('20200110173512', '2020-01-10 17:36:54');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `ques` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rep` tinyint(1) NOT NULL,
  `justification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `quiz_id`, `ques`, `rep`, `justification`) VALUES
(21, 11, 'Question #0', 0, 'Quam voluptates similique iste nulla magni temporibus.'),
(22, 12, 'Question #1', 0, 'Ut a tempora consequatur eos id aut.'),
(23, 12, 'Question #2', 0, 'In velit hic consequuntur velit vitae.'),
(24, 11, 'Question #3', 1, 'Quo dolor quo animi voluptates suscipit eos at.'),
(25, 14, 'Question #4', 1, 'Possimus ipsam dolores cumque hic.'),
(26, 13, 'Question #5', 1, 'Sint exercitationem sint aliquam nulla fugiat ipsum.'),
(27, 12, 'Question #6', 0, 'Beatae rerum voluptas accusamus at qui nihil explicabo excepturi.'),
(28, 12, 'Question #7', 0, 'Unde praesentium dolore officia temporibus quae perferendis.'),
(29, 14, 'Question #8', 1, 'Qui dolore voluptatum sapiente aut suscipit ut voluptate ea.'),
(30, 13, 'Question #9', 0, 'Perspiciatis possimus aut et quos et delectus.');

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filiere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `niveau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id`, `titre`, `filiere`, `niveau`) VALUES
(11, 'Quiz #0', 'EI', 'isi'),
(12, 'Quiz #1', 'EI', 'isi'),
(13, 'Quiz #2', 'EI', 'isi'),
(14, 'Quiz #3', 'EI', 'isi'),
(15, 'Quiz #4', 'EI', 'isi');

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
-- Index pour la table `classe_image`
--
ALTER TABLE `classe_image`
  ADD PRIMARY KEY (`classe_id`,`image_id`),
  ADD KEY `IDX_8C4A50678F5EA509` (`classe_id`),
  ADD KEY `IDX_8C4A50673DA5256D` (`image_id`);

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
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6F7494E853CD175` (`quiz_id`);

--
-- Index pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT pour la table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- Contraintes pour la table `classe_image`
--
ALTER TABLE `classe_image`
  ADD CONSTRAINT `FK_8C4A50673DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8C4A50678F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`) ON DELETE CASCADE;

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

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_B6F7494E853CD175` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
