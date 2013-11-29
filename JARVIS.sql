-- phpMyAdmin SQL Dump
-- version 4.0.7
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 11-Out-2013 às 10:37
-- Versão do servidor: 5.6.13-log
-- versão do PHP: 5.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `JARVIS`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `perguntas`
--

CREATE TABLE IF NOT EXISTS `perguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` text,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `perguntas`
--

INSERT INTO `perguntas` (`id`, `pergunta`, `description`) VALUES
(1, 'qual é o seu nome', NULL),
(2, 'quantos anos você tem', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `respostas`
--

CREATE TABLE IF NOT EXISTS `respostas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pergunta` int(11) DEFAULT NULL,
  `resposta` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `respostas`
--

INSERT INTO `respostas` (`id`, `id_pergunta`, `resposta`) VALUES
(1, 1, 'meu nome'),
(2, 1, 'meu nome é laura'),
(3, 2, 'tenho milhões de anos'),
(4, 2, 'para que você quer saber'),
(5, 2, 'giga bytes megabytes de anos de idade');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
