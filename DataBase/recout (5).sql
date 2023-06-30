-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/06/2023 às 05:32
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `recout`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `caixinha`
--

CREATE TABLE `caixinha` (
  `id_caixinha` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data` date NOT NULL,
  `horario` time(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `numero` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `numero`, `cpf`, `email`, `senha`) VALUES
(1, 'Jairon Fernando de Bagos', '876567967', '12345987654', 'jaironboff@gmail.com', '098654567claudioranieri'),
(2, 'Paulo Cesar Carneiro Stuart', '9867567879', '56789864567', 'paulo085@cesar.com', 'bandodedados12539'),
(3, 'Baniel da Bosta Bruger', '09876543212', '12365438765', 'danielboff@outlook.com', 'alhuaquibar6973'),
(4, 'Barcelo Binicius Beicht', '894227382', '12955167892', 'barcelo.boff@boff.com', 'lucasrandestrini1234'),
(5, 'Bictor Bugo Bisboa Orba', '981673157', '15767731673', 'apenas.os.skates.sabem.2012@hotmail.com', 'eulikemachos169'),
(6, 'Biago Bachado Bermiano', '2345678927', '23456781987', 'bermino.naoseioq@bagos.com', 'naoseioqnaoseioqla_123'),
(7, 'Robson Leones Tavares', '7623990823', '717171717171', 'euamoocotinthians2022@outlook.com', 'euodeioopalmeiraecaquenojo2020'),
(8, 'Boão Baulo Bersching', '888888888', '88888888888', 'souflamengoatemorrer2019@mengo.com', 'fuckbotafofo909'),
(9, 'Bagriel Bomaz Bodrigues', '891827281', '838384567289', 'gabigol.meuidolo2019@fla.com', 'odeiomarcelo12'),
(10, 'Pedro Raul', '9893839209', '5178263832', 'euodeio.fazergol@bagre.com', 'inimigodogolkkk123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `combos`
--

CREATE TABLE `combos` (
  `id_combos` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `valor` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `combos`
--

INSERT INTO `combos` (`id_combos`, `nome`, `categoria`, `descricao`, `valor`) VALUES
(1, 'Combo LiveCast', 'Podcast', '• Estúdio para PodCast;\r\n• 2 Cameramans;\r\n• 1 Operador de áudio;\r\n• Mesa c/ 4 cadeiras;\r\n• Kit iluminação profissional (3x Softbox 50x70 + Tripé 2m).\r\n\r\nLocalização:\r\nRua Corbucci Eats, 155', '220,00'),
(2, 'Combo SoundStudio', 'Musical', '• Espaço para 1 músico;\r\n• Espaço backstage para 4 pessoas;\r\n• 1 Desktop para 1 produtor;\r\n• Espaço para equipamentos.\r\n\r\nLocalização:\r\nRua Rodinei, 2022', '250,00'),
(3, 'Combo RecStreamer', 'Streaming', '• Estúdio para 1 pessoa;\r\n• Desktop com cadeira gamer;\r\n• 1 Operador de áudio;\r\n• Espaço backstage para 3 pessoas.\r\n\r\nLocalização:\r\nRua Lionel Andrés Messi Cuccittini, 10', '200,00'),
(4, 'Combo MakeUpZ', 'Vídeos', '• Ambientação à escolha do cliente;\r\n• Espaço para equipamentos;\r\n• Espaço backstage para 2 pessoas;\r\n• 1 Maquiador(a);\r\n• 1 Cameraman;\r\n• Kit iluminação profissional (3x Softbox 50x70 + Tripe 2m).\r\n\r\nLocalização:\r\nRua Márcio Araújo, 71\r\n', '300,00'),
(5, 'Combo ProPhoto', 'Vídeos', '• Estúdio para 6 pessoas;\r\n• Espaço para equipamentos;\r\n• Espaço backstage para 12 pessoas;\r\n• 3 Fotógrafos;\r\n• Kit iluminação profissional (4x Softbox 50x70 + Tripe 2m).\r\n\r\nLocalização:\r\nRua Lamia, 2933\r\n', '310,00'),
(6, 'Combo Collab', 'Podcast', '• Mesa para 8 pessoas;\r\n• Espaço para equipamentos;\r\n• Espaço backstage para 20 pessoas;\r\n• 2 Operadores de áudio;\r\n• 3 Cameramans;\r\n• Kit iluminação profissional (10x Softbox 50x70 + Tripe 2m).\r\n\r\nLocalização:\r\nRua Ocean Gate, 5', '450,00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamento`
--

CREATE TABLE `equipamento` (
  `id_equipamento` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `especificacoes` varchar(2000) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `imagem1` varchar(1000) NOT NULL,
  `imagem2` varchar(1000) NOT NULL,
  `imagem3` varchar(1000) NOT NULL,
  `imagem4` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `equipamento`
--

INSERT INTO `equipamento` (`id_equipamento`, `categoria`, `marca`, `modelo`, `especificacoes`, `valor`, `imagem1`, `imagem2`, `imagem3`, `imagem4`) VALUES
(1, 'Vídeo', 'Canon', 'Câmera Eos R5 8k 45mp Com 24-105mm F/4l', '• Montagem de lente: Canon RF\r\n• Formato da câmera: Fullframe\r\n• Pixels: 45MP\r\n• Resolução Máxima: 8192 x 5464\r\n• Tipo de sensor: CMOS\r\n• Arquivo de foto: JPEG, Raw\r\n• Bit Depth: 14-Bit\r\n• Estabilização de imagem: Sensor 5 eixos\r\n• ISO: Auto, 100 a 51200 (Expansível 100 a 102400)', '200,00', 'https://i.pinimg.com/originals/9a/08/90/9a0890fbb45ac752728cf8b5f6bc25c1.png', 'https://i.pinimg.com/originals/02/28/23/022823d3607014a2d08294c41cbb6b8c.png', 'https://i.pinimg.com/originals/3b/c2/bf/3bc2bfc2b9b5c1e2943375c7e1d15534.png', 'https://i.pinimg.com/originals/3c/be/51/3cbe51869cf2b20c2b4021a25f57f5e2.png'),
(2, 'Áudio', 'Behringer', 'Microfone Condensador C-1', '• Marca Behringer;\r\n• Modelo C-1;\r\n• Microfone profissional condensador de grande diafragma;\r\n• Ideal para uso como microfone principal ou de suporte em estúdios e aplicações ao vivo;\r\n• Padrão de captação cardióide para separação de fonte de áudio e eliminação de retorno;\r\n• Transdutor de pressão gradiente com cápsula anti-choque; Ideal para utilização com instrumentos acústico', '50,00', '', '', '', ''),
(3, 'Aúdio', 'Audio Technica', 'Fones Headset ATH-M20X', '• Marca: Audio-Technica\r\n• Modelo: ATH-M20X\r\n• Tipo: Headphone\r\n• Design: Supra-auricular\r\n• c/ Microfone: Não\r\n• Formato: Arco para Cabeça\r\n• Recursos e Funções: Ajuste de Cabeça\r\n• Conexões: Conexão Sem Fio\r\n•Não se aplica: Conector P10 (6.35mm)', '80,00', '', '', '', ''),
(4, 'Streaming', 'Lenovo', 'Notebook Ideapad S145 - Windows 10', '• Marca: Lenovo\r\n• Linha: IdeaPad\r\n• Série: 3\r\n• Tipo: Notebook \r\n• 2 em 1: Não\r\n• SSD: 256.0GB\r\n• Memória RAM: 8.0GB\r\n• Memória RAM Expansível até: 12.0GB\r\n• Conexões Sem Fio: Bluetooth e Wi-Fi (2.4 GHz e 5.0 GHz)\r\n• Entradas e Saídas: HDMI, Leitor de cartão, USB 2.0, USB 3.2, USB-C, Áudio\r\n• Quantidades de Entradas USB: 3 USB', '260,00', '', '', '', ''),
(5, 'Streaming', 'Redragon', 'Teclado Mitra K551 Switch Brown', '• Marca: Redragon\r\n• Modelo: K551RGB-1\r\n• Switch: Brown, Mecânicos para desempenho em jogos\r\n• Iluminação: LED RGB e double-shot moldadas por injeção keycaps para iluminação crystal clara\r\n• Construção: ABS para rigidez e longevidade\r\n• Conector: USB banhado a ouro\r\n• Teclas: 104, Padrão livre de conflitos, c/ teclado numérico e 12 teclas multimídia', '60,00', '', '', '', ''),
(6, 'Streaming', 'Logitech', 'Mouse G203 LIGHTSYNC Preto RGB', '• Marca: Logitech\r\n• Modelo:  910-005793\r\n• Resolução do sensor: 200 - 8.000 DPI\r\n• Formato de dados USB: 16 bits/eixo\r\n• Taxa de transmissão USB: 1000 Hz (1 ms)\r\n• Microprocessador: 32 bits ARM\r\n• Altura: 116,6 mm\r\n• Largura: 62,15 mm\r\n• Profundidade: 38,2 mm\r\n• Comprimento do cabo: 2,1 m\r\n• Sensor para jogos de 8.000 DPI\r\n• Iluminação RGB LIGHTSYNC totalmente personalizável*.\r\n• Design clássico ', '35,00', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `espacos`
--

CREATE TABLE `espacos` (
  `id_espacos` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descricao` varchar(2000) NOT NULL,
  `valor` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `espacos`
--

INSERT INTO `espacos` (`id_espacos`, `nome`, `categoria`, `descricao`, `valor`) VALUES
(1, 'Estúdio PodBasic', 'Podcast', '• Mesa para 4 pessoas;\r\n• Espaço para equipamentos;\r\n• Espaço backstage para 5 pessoas;\r\n• Kit iluminação profissional (3x Softbox 50x70 + Tripé 2m).\r\n\r\nLocalização:\r\nRua Felipe Neto, 1313', '120,00'),
(2, 'Estúdio Solo', 'Musical', '• Estúdio para 1 músico;\r\n• Espaço backstage para 4 pessoas;\r\n• 1 Desktop para mixagem;\r\n• Espaço para equipamentos.\r\n\r\nLocalização:\r\nRua Gabriel Pec, 11', '150,00'),
(3, 'Esúdio BasicLive', 'Streaming', '• Estúdio para 1 streamer;\r\n• Desktop com cadeira gamer inclusa;\r\n• Espaço para equipamentos.\r\n\r\nLocalização:\r\nRua Randestrino, 1673', '100,00'),
(4, 'Estúdio YouU', 'Vídeos', '• Ambientação à escolha do cliente;\r\n• Espaço para equipamentos;\r\n• Espaço backstage para 2 pessoas;\r\n• Kit iluminação profissional (3x Softbox 50x70 + Tripe 2m).\r\n\r\nLocalização:\r\nRua Luciano de Aguiar, 147', '120,00'),
(5, 'Estúdio ProSound', 'Musical', '• Estúido para 5 músicos;\r\n• Espaço para equipamentos;\r\n• Espaço backstage para 10 pessoas;\r\n• Desktop para mesa de som.\r\n\r\nLocalização:\r\nRua Fottere, 278', '300,00'),
(6, 'Estúdio ModelZ', 'Vídeos', '• Espaço para 6 pessoas;\r\n• Espaço para equipamentos;\r\n• Espaço backstage para 8 pessoas;\r\n• 3 Kit iluminação profissional (10x Softbox 50x70 + Tripe 2m).\r\n\r\nLocalização:\r\nRua Felipe Osmar de Aviz, 28', '140,00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissionais`
--

CREATE TABLE `profissionais` (
  `id_profissionais` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `telefone` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `caixinha`
--
ALTER TABLE `caixinha`
  ADD PRIMARY KEY (`id_caixinha`),
  ADD KEY `fk_id_cliente` (`id_cliente`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`id_combos`);

--
-- Índices de tabela `equipamento`
--
ALTER TABLE `equipamento`
  ADD PRIMARY KEY (`id_equipamento`);

--
-- Índices de tabela `espacos`
--
ALTER TABLE `espacos`
  ADD PRIMARY KEY (`id_espacos`);

--
-- Índices de tabela `profissionais`
--
ALTER TABLE `profissionais`
  ADD PRIMARY KEY (`id_profissionais`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `caixinha`
--
ALTER TABLE `caixinha`
  MODIFY `id_caixinha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `combos`
--
ALTER TABLE `combos`
  MODIFY `id_combos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `equipamento`
--
ALTER TABLE `equipamento`
  MODIFY `id_equipamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `espacos`
--
ALTER TABLE `espacos`
  MODIFY `id_espacos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `profissionais`
--
ALTER TABLE `profissionais`
  MODIFY `id_profissionais` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `caixinha`
--
ALTER TABLE `caixinha`
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
