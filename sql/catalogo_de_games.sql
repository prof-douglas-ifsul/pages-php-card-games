-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Abr-2022 às 04:37
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catalogo_de_games`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `link` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `games`
--

INSERT INTO `games` (`id`, `nome`, `link`) VALUES
(1, 'Dota 2', 'https://mrreiha.keybase.pub/codepen/hover-fx/1.jpg'),
(2, 'Stick Fight', 'https://mrreiha.keybase.pub/codepen/hover-fx/2.jpg'),
(3, 'Minion Masters', 'https://mrreiha.keybase.pub/codepen/hover-fx/3.jpg'),
(4, 'KoseBoz!', 'https://mrreiha.keybase.pub/codepen/hover-fx/4.jpg'),
(5, 'Game 1', './'),
(6, 'Game 2', './');

-- --------------------------------------------------------

--
-- Estrutura da tabela `games_novidades`
--

CREATE TABLE `games_novidades` (
  `id` int(11) NOT NULL,
  `id_game` int(11) NOT NULL,
  `data` date NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `link` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `games_novidades`
--

INSERT INTO `games_novidades` (`id`, `id_game`, `data`, `titulo`, `descricao`, `link`) VALUES
(1, 5, '2022-04-07', 'New Item', 'In today’s update, two heads are better than one, and three heads are better than that, as the all-new Flockheart’s Gamble Arcana item for Ogre Magi makes its grand debut.', 'https://mrreiha.keybase.pub/codepen/hover-fx/news1.jpg'),
(2, 6, '2022-04-07', 'Update', 'Just in time for Lunar New Year and the Rat’s time in the cyclical place of honor, the Treasure of Unbound Majesty is now available.', 'https://mrreiha.keybase.pub/codepen/hover-fx/news2.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games_novidades`
--
ALTER TABLE `games_novidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_games` (`id_game`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `games_novidades`
--
ALTER TABLE `games_novidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `games_novidades`
--
ALTER TABLE `games_novidades`
  ADD CONSTRAINT `fk_games` FOREIGN KEY (`id_game`) REFERENCES `games` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
