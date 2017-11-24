-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/11/2017 às 11:50
-- Versão do servidor: 10.1.28-MariaDB
-- Versão do PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `quadras`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_adm` int(11) NOT NULL,
  `Login` varchar(20) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Telefone` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `administrador`
--

INSERT INTO `administrador` (`id_adm`, `Login`, `Password`, `Email`, `Telefone`) VALUES
(1, 'Jribarr', 'Jr18', 'J_ribarr@Hotmail.com', 51998975221);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `Nome` varchar(50) NOT NULL,
  `CEP` int(15) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  `ID_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `cidade`
--

INSERT INTO `cidade` (`Nome`, `CEP`, `descricao`, `ID_city`) VALUES
('Charqueadas', 96745000, 'Cidade da região metropolitana de porto alegre', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `horarios`
--

CREATE TABLE `horarios` (
  `Cod_quadra` int(11) NOT NULL,
  `disponibilidade` int(1) NOT NULL,
  `hr_start` datetime NOT NULL,
  `hr_fim` datetime NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `horarios`
--

INSERT INTO `horarios` (`Cod_quadra`, `disponibilidade`, `hr_start`, `hr_fim`, `ID`) VALUES
(1, 1, '2017-11-22 02:00:00', '2017-11-22 03:00:00', 1),
(1, 2, '2017-11-22 04:00:00', '2017-11-22 05:00:00', 2),
(1, 0, '2017-11-22 06:00:00', '2017-11-22 07:00:00', 3),
(1, 1, '2017-11-22 08:00:00', '2017-11-22 09:00:00', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `horarios_marcados`
--

CREATE TABLE `horarios_marcados` (
  `id_marcado` int(11) NOT NULL,
  `id_hora` int(11) NOT NULL,
  `maracado_por` int(11) NOT NULL,
  `confirmado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `horarios_marcados`
--

INSERT INTO `horarios_marcados` (`id_marcado`, `id_hora`, `maracado_por`, `confirmado_por`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `local`
--

CREATE TABLE `local` (
  `endereco` varchar(40) NOT NULL,
  `telefone` int(11) NOT NULL,
  `nome_local` varchar(40) NOT NULL,
  `id_local` int(11) NOT NULL,
  `cidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `local`
--

INSERT INTO `local` (`endereco`, `telefone`, `nome_local`, `id_local`, `cidade`) VALUES
('General câmara nº 20', 519889751, 'Quadras de Esportes TOM', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modalidades`
--

CREATE TABLE `modalidades` (
  `Nome` varchar(30) NOT NULL,
  `Descricao` varchar(100) NOT NULL,
  `ID_mod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `modalidades`
--

INSERT INTO `modalidades` (`Nome`, `Descricao`, `ID_mod`) VALUES
('Futebol', 'Esporte que usa os pés', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `moral`
--

CREATE TABLE `moral` (
  `Nome` varchar(40) NOT NULL,
  `ID_mor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `moral`
--

INSERT INTO `moral` (`Nome`, `ID_mor`) VALUES
('Boa', 1),
('Excelente', 3),
('Ruim', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quadra`
--

CREATE TABLE `quadra` (
  `id_local` int(11) NOT NULL,
  `modalidade` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `Cod_quadra` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `quadra`
--

INSERT INTO `quadra` (`id_local`, `modalidade`, `nome`, `Cod_quadra`, `descricao`) VALUES
(1, 1, 'Quadra Futebol do Tom', 1, '100mx200m');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_user` int(11) NOT NULL,
  `telefone` bigint(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `moral` varchar(1) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`id_user`, `telefone`, `login`, `moral`, `senha`, `email`) VALUES
(1, 5199897522, 'Juninho Ribarr', '1', '123456', 'j_ribarr@Hotmail.com'),
(2, 5199897524, 'Pedro Henrique', '1', 'ph123', 'Ph@gmail.com'),
(3, 5199897553, 'Mauricio Maia', '1', 'm123', 'MM@gmail.com'),
(4, 5199897544, 'Outro', '1', 'o123', 'Outro@gmail.com'),
(5, 183881, 'Novo', '1', '123', 'Novo@mail.com'),
(6, 666666, 'Alexandre Debom', '1', 'dalhepipa', 'alexandrepipa@pipashine.com'),
(7, 5198975544, 'natalia', '1', 'frank13', 'nati@gmail.com'),
(8, 5198897524, 'jean', '1', 'kdelao', 'j@gmail.com'),
(10, 51698885, 'host', '1', 'h1', 'h@gmail.com');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_adm`),
  ADD UNIQUE KEY `Login` (`Login`);

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`ID_city`);

--
-- Índices de tabela `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Cod_quadra` (`Cod_quadra`);

--
-- Índices de tabela `horarios_marcados`
--
ALTER TABLE `horarios_marcados`
  ADD PRIMARY KEY (`id_marcado`),
  ADD KEY `confirmado_por` (`confirmado_por`),
  ADD KEY `id_hora` (`id_hora`),
  ADD KEY `horarios_marcados_ibfk_4` (`maracado_por`);

--
-- Índices de tabela `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id_local`),
  ADD KEY `cidade` (`cidade`);

--
-- Índices de tabela `modalidades`
--
ALTER TABLE `modalidades`
  ADD PRIMARY KEY (`ID_mod`);

--
-- Índices de tabela `moral`
--
ALTER TABLE `moral`
  ADD PRIMARY KEY (`ID_mor`);

--
-- Índices de tabela `quadra`
--
ALTER TABLE `quadra`
  ADD PRIMARY KEY (`Cod_quadra`),
  ADD KEY `pertence` (`id_local`),
  ADD KEY `modalidade` (`modalidade`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `moral` (`moral`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_adm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `ID_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `horarios`
--
ALTER TABLE `horarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `horarios_marcados`
--
ALTER TABLE `horarios_marcados`
  MODIFY `id_marcado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `local`
--
ALTER TABLE `local`
  MODIFY `id_local` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `modalidades`
--
ALTER TABLE `modalidades`
  MODIFY `ID_mod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `moral`
--
ALTER TABLE `moral`
  MODIFY `ID_mor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `quadra`
--
ALTER TABLE `quadra`
  MODIFY `Cod_quadra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`Cod_quadra`) REFERENCES `quadra` (`Cod_quadra`);

--
-- Restrições para tabelas `horarios_marcados`
--
ALTER TABLE `horarios_marcados`
  ADD CONSTRAINT `horarios_marcados_ibfk_2` FOREIGN KEY (`confirmado_por`) REFERENCES `administrador` (`id_adm`),
  ADD CONSTRAINT `horarios_marcados_ibfk_3` FOREIGN KEY (`id_hora`) REFERENCES `horarios` (`ID`),
  ADD CONSTRAINT `horarios_marcados_ibfk_4` FOREIGN KEY (`maracado_por`) REFERENCES `usuario` (`id_user`);

--
-- Restrições para tabelas `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `local_ibfk_1` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`ID_city`);

--
-- Restrições para tabelas `quadra`
--
ALTER TABLE `quadra`
  ADD CONSTRAINT `pertence` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`),
  ADD CONSTRAINT `quadra_ibfk_1` FOREIGN KEY (`modalidade`) REFERENCES `modalidades` (`ID_mod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
