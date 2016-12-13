-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.14-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para coavalieitor_db
DROP DATABASE IF EXISTS `coavalieitor_db`;
CREATE DATABASE IF NOT EXISTS `coavalieitor_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `coavalieitor_db`;


-- Copiando estrutura para tabela coavalieitor_db.aluno
DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `fk_aluno_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_aluno_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.aluno: ~100 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`usuario_id`) VALUES
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(23),
	(24),
	(25),
	(26),
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37),
	(38),
	(39),
	(40),
	(41),
	(42),
	(43),
	(44),
	(45),
	(46),
	(47),
	(48),
	(49),
	(50),
	(51),
	(52),
	(53),
	(54),
	(55),
	(56),
	(57),
	(58),
	(59),
	(60),
	(61),
	(62),
	(63),
	(64),
	(65),
	(66),
	(67),
	(68),
	(69),
	(70),
	(71),
	(72),
	(73),
	(74),
	(75),
	(76),
	(77),
	(78),
	(79),
	(80),
	(81),
	(82),
	(83),
	(84),
	(85),
	(86),
	(87),
	(88),
	(89),
	(90),
	(91),
	(92),
	(93),
	(94),
	(95),
	(96),
	(97),
	(98),
	(99),
	(100),
	(101),
	(102),
	(103),
	(104),
	(105),
	(106),
	(108),
	(110);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.avaliacao
DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE IF NOT EXISTS `avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` text,
  `requisito_adicional` text,
  `submissao_inicial` datetime DEFAULT NULL,
  `submissao_final` datetime DEFAULT NULL,
  `correcao_inicial` datetime DEFAULT NULL,
  `correcao_final` datetime DEFAULT NULL,
  `num_correcao_estudante` int(11) DEFAULT NULL,
  `nota_maxima` int(11) DEFAULT NULL,
  `criterio_correcao` text,
  `turma_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_avaliacao_turma1_idx` (`turma_id`),
  CONSTRAINT `fk_avaliacao_turma1` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.avaliacao: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` (`id`, `nome`, `descricao`, `requisito_adicional`, `submissao_inicial`, `submissao_final`, `correcao_inicial`, `correcao_final`, `num_correcao_estudante`, `nota_maxima`, `criterio_correcao`, `turma_id`) VALUES
	(1, 'Sequência inversa', 'Escreva um algoritmo que coloque os números de 1 a 100 na tela na\r\nordem inversa (começando em 100 e terminando em 1). ', '*Linguagem C++\r\n*Utlizar estrutura de repetição \'for\'', '2017-11-25 10:00:00', '2017-11-28 23:59:00', '2018-11-30 14:00:00', '2018-12-12 23:59:00', 2, 100, '20 - Legibilidade do código.\r\n20 - Elegância do código.\r\n20 - Lógica de programação.\r\n20 - Complexidade do algoritmo.\r\n20 - Indentação.', 1),
	(2, 'Converter temperatura', 'Faça um algoritmo que apresente na tela a tabela de conversão de\r\ngraus Celsius para Fahrenheit, de -100 C a 100 C. Use um incremento de 10 C. Observação: Fahrenheit = (9 / 5) × Celsius + 32', '*Linguagem C++.', '2016-10-26 00:00:00', '2016-10-28 23:59:00', '2016-12-08 14:00:00', '2016-12-18 23:59:00', 2, 100, '20 - Legibilidade do código.\r\n20 - Elegância do código.\r\n20 - Lógica de programação.\r\n20 - Complexidade do algoritmo.\r\n20 - Indentação.', 1),
	(3, 'Múltiplos 7', 'Faça um algoritmo para listar todos os múltiplos positivos do número 7 menores ou iguais a 100.\r\n ', '*Linguagem C++.', '2016-10-26 00:00:00', '2016-10-28 23:59:00', '2016-10-29 00:00:00', '2016-10-31 23:59:00', 2, 100, '20 - Legibilidade do código.\r\n20 - Elegância do código.\r\n20 - Lógica de programação.\r\n20 - Complexidade do algoritmo.\r\n20 - Indentação.', 1),
	(4, 'Calcular o número h', 'Sendo h = 1 + 1/2 + 1/3 + 1/4 + ... + 1/N, construa um algoritmo para\r\ncalcular o número h, sendo o número inteiro N fornecido pelo usuário. Seu algoritmo deve garantir que apenas um valor maior do que zero seja aceito como entrada. ', '*Linguagem PHP || C#', '2016-11-30 18:00:00', '2016-12-28 23:59:00', '2016-12-29 00:00:00', '2016-12-30 23:59:00', 2, 100, '20 - Legibilidade do código.\r\n20 - Elegância do código.\r\n20 - Lógica de programação.\r\n20 - Complexidade do algoritmo.\r\n20 - Indentação.', 1),
	(5, 'Fatorial', 'Elabore um algoritmo (pseudocódigo) que calcule N! (fatorial de N), sendo que o valor de N é fornecido pelo usuário. Lembre que N é sempre um valor inteiro e não negativo.Logo, seu algoritmo deve evitar que valores negativos sejam aceitos como entrada. Lembre também que N! = 1 × 2 × 3 × ... × (N-1) × N, e que 0! = 1 por definição. ', '*Linguagem JAVA.', '2016-10-26 00:00:00', '2016-10-28 23:59:00', '2016-10-29 00:00:00', '2016-10-31 23:59:00', 2, 100, '20 - Legibilidade do código.\r\n20 - Elegância do código.\r\n20 - Lógica de programação.\r\n20 - Complexidade do algoritmo.\r\n20 - Indentação.', 1),
	(6, 'Soma de números', 'Faça um algoritmo que pergunte ao usuário quantos números deseja somar. Em seguida, leia a quantidade informada de números e apresentar o valor da soma, quantos números são maiores que 7 e quantos números são maiores que 9. ', '*Linguagem Ruby\r\n*Utilize Do-While', '2016-11-13 00:00:00', '2016-11-15 23:59:00', '2016-11-30 15:00:00', '2016-12-19 23:59:00', 2, 100, '20 - Legibilidade do código.\r\n20 - Elegância do código.\r\n20 - Lógica de programação.\r\n20 - Complexidade do algoritmo.\r\n20 - Indentação.', 1),
	(7, 'Número primo', 'Faça método que verfique se um número é primo, ou não primo...', '*Função dever retornar true, ou false;\r\n*Escrever método em c++.', '2016-11-30 00:00:00', '2016-11-02 23:59:00', '2016-11-07 10:00:00', '2016-11-20 23:59:00', 3, 100, '20 - Legibilidade do código.\r\n20 - Elegância do código.\r\n20 - Lógica de programação.\r\n20 - Complexidade do algoritmo.\r\n20 - Indentação.', 2),
	(8, 'Exercício polimorfismo', 'Exercício 1: Implemente a classe Funcionario e a classe Gerente.\r\n\r\na. crie a classe Assistente, que também é um funcionário, e que possui um número de\r\nmatrícula (faça o método GET). Sobrescreva o método exibeDados().\r\n\r\nb. sabendo que os Assistentes Técnicos possuem um bônus salarial e que os\r\nAssistentes Administrativos possuem um turno (dia ou noite) e um adicional\r\nnoturno, crie as classes Tecnico e Administrativo', '*Resolver usando Java', '2016-11-08 00:00:00', '2016-11-11 23:59:00', '2016-11-14 00:00:00', '2016-11-18 23:59:00', 2, 100, '20 - Legibilidade do código.\r\n20 - Elegância do código.\r\n20 - Lógica de programação.\r\n20 - Complexidade do algoritmo.\r\n20 - Indentação.', 1),
	(9, 'Teste...', 'kjjkdajkdjkasjkd', 'sdaldsladaldk', '2016-11-10 10:00:00', '2016-11-10 23:59:00', '2016-11-12 00:00:00', '2016-11-18 23:59:00', 4, 100, 'sdfdsflçdsflçsflç', 10),
	(10, 'Teste 3334', 'Faça...', 'Ok', '2016-11-08 20:20:00', '2016-11-09 23:59:00', '2016-12-04 20:40:00', '2016-12-09 23:59:00', 1, 100, 'melhor mais.', 12),
	(11, 'ANTECESSOR', ' Escreva um algoritmo para ler um valor (do teclado) e escrever (na tela) o seu antecessor. ', '*Escrever algoritmo na linguagem C.', '2017-01-01 12:00:00', '2017-01-07 23:59:00', '2017-01-08 00:00:00', '2017-01-14 23:59:00', 2, 100, '-Se o programa não corresponde ao enunciado ou a solução está em branco: a nota do trabalho será ZERO.\r\n-Programa mal organizado: -20 pontos.\r\n-Programa trava em um loop infinito: -20 pontos.\r\n-Programa com baixa eficiência computacional: -20 pontos.\r\n-Comentários inexistentes ou fora dos padrões: -10 pontos.\r\n-Não seguiu os requisitos adicionais: -10 pontos.\r\n-Variáveis com nomes inválidos: -10 pontos.\r\n-Indentação mal elaborada: -10 pontos.\r\n\r\n', 3),
	(12, 'RENTÂNGULO', '    Escreva um algoritmo para ler as dimensões de um retângulo (base e altura), calcular e escrever a área do retângulo. ', '*Escrever algoritmo na linguagem PASCAL.', '2016-12-12 12:00:00', '2016-12-23 23:59:00', '2016-12-24 00:00:00', '2016-12-31 23:59:00', 2, 100, '-Se o programa não corresponde ao enunciado ou a solução está em branco: a nota do trabalho será ZERO.\r\n-Programa mal organizado: -20 pontos.\r\n-Programa trava em um loop infinito: -20 pontos.\r\n-Programa com baixa eficiência computacional: -20 pontos.\r\n-Comentários inexistentes ou fora dos padrões: -10 pontos.\r\n-Não seguiu os requisitos adicionais: -10 pontos.\r\n-Variáveis com nomes inválidos: -10 pontos.\r\n-Indentação mal elaborada: -10 pontos.\r\n\r\n', 3),
	(13, 'PLACAR', ' Ler o nome de 2 times e o número de gols marcados na partida (para cada time). Escrever o nome do vencedor. Caso não haja vencedor deverá ser impressa a palavra EMPATE. ', '*Escrever algoritmo na linguagem C.', '2016-12-12 12:00:00', '2016-12-23 23:59:00', '2016-12-24 00:00:00', '2016-12-31 23:59:00', 2, 100, '-Se o programa não corresponde ao enunciado ou a solução está em branco: a nota do trabalho será ZERO.\r\n-Programa mal organizado: -20 pontos.\r\n-Programa trava em um loop infinito: -20 pontos.\r\n-Programa com baixa eficiência computacional: -20 pontos.\r\n-Comentários inexistentes ou fora dos padrões: -10 pontos.\r\n-Não seguiu os requisitos adicionais: -10 pontos.\r\n-Variáveis com nomes inválidos: -10 pontos.\r\n-Indentação mal elaborada: -10 pontos.\r\n\r\n', 3),
	(14, 'MAIOR E MENOR', 'Faça um programa que leia 100 valores e no final, escreva o maior e o menor valor lido. ', '*Escrever algoritmo na linguagem C++.', '2016-12-04 12:00:00', '2016-12-10 23:59:00', '2016-12-11 00:00:00', '2016-12-24 23:59:00', 2, 100, '-Se o programa não corresponde ao enunciado ou a solução está em branco: a nota do trabalho será ZERO.\r\n-Programa mal organizado: -20 pontos.\r\n-Programa trava em um loop infinito: -20 pontos.\r\n-Programa com baixa eficiência computacional: -20 pontos.\r\n-Comentários inexistentes ou fora dos padrões: -10 pontos.\r\n-Não seguiu os requisitos adicionais: -10 pontos.\r\n-Variáveis com nomes inválidos: -10 pontos.\r\n-Indentação mal elaborada: -10 pontos.\r\n\r\n', 3),
	(15, 'TABUADA', 'Escreva um algoritmo que imprima a tabuada (de 1 a 10) para os números de 1 a 10. ', '*Escrever algoritmo na linguagem PHP.', '2016-12-04 12:00:00', '2016-12-10 23:59:00', '2016-12-11 00:00:00', '2016-12-24 23:59:00', 3, 100, '-Se o programa não corresponde ao enunciado ou a solução está em branco: a nota do trabalho será ZERO.\r\n-Programa mal organizado: -20 pontos.\r\n-Programa trava em um loop infinito: -20 pontos.\r\n-Programa com baixa eficiência computacional: -20 pontos.\r\n-Comentários inexistentes ou fora dos padrões: -10 pontos.\r\n-Não seguiu os requisitos adicionais: -10 pontos.\r\n-Variáveis com nomes inválidos: -10 pontos.\r\n-Indentação mal elaborada: -10 pontos.\r\n\r\n', 3),
	(16, 'REAJUSTE', ' Escreva um algoritmo para ler o salário mensal atual de um funcionário e o percentual de reajuste. Calcular e escrever o valor do novo salário. ', '*Escrever algoritmo na linguagem PHP.', '2016-11-01 12:00:00', '2016-11-12 23:59:00', '2016-11-13 00:00:00', '2016-11-19 23:59:00', 2, 100, '-Se o programa não corresponde ao enunciado ou a solução está em branco: a nota do trabalho será ZERO.\r\n-Programa mal organizado: -20 pontos.\r\n-Programa trava em um loop infinito: -20 pontos.\r\n-Programa com baixa eficiência computacional: -20 pontos.\r\n-Comentários inexistentes ou fora dos padrões: -10 pontos.\r\n-Não seguiu os requisitos adicionais: -10 pontos.\r\n-Variáveis com nomes inválidos: -10 pontos.\r\n-Indentação mal elaborada: -10 pontos.\r\n\r\n', 3);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.correcao
DROP TABLE IF EXISTS `correcao`;
CREATE TABLE IF NOT EXISTS `correcao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` text,
  `nota` double DEFAULT NULL,
  `solucao_id` int(11) NOT NULL,
  `aluno_usuario_id` int(11) NOT NULL,
  `correcao_data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_correcao_solucao1_idx` (`solucao_id`),
  KEY `fk_correcao_aluno1_idx` (`aluno_usuario_id`),
  CONSTRAINT `fk_correcao_aluno1` FOREIGN KEY (`aluno_usuario_id`) REFERENCES `aluno` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_correcao_solucao1` FOREIGN KEY (`solucao_id`) REFERENCES `solucao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.correcao: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `correcao` DISABLE KEYS */;
INSERT INTO `correcao` (`id`, `comentario`, `nota`, `solucao_id`, `aluno_usuario_id`, `correcao_data`) VALUES
	(2, 'PHP, sério mesmo?', 60, 7, 31, '2016-11-02 00:37:31'),
	(3, 'Com PHP não pode. Se esforce mais na próxima.\r\n\r\nAtt.,\r\n \r\nAnônimo.', 20, 10, 32, '2016-11-02 00:42:21'),
	(4, 'GOlll. Continue assim!', 100, 3, 32, '2016-11-02 00:42:53'),
	(5, 'Excelente', 50, 7, 29, '2016-11-02 00:45:12'),
	(6, 'Bora lá', 100, 1, 29, '2016-11-02 00:45:33'),
	(7, 'OKOK', 78, 10, 30, '2016-11-02 00:49:00'),
	(8, 'hhhhh', 76, 9, 30, '2016-11-02 00:49:20'),
	(9, 'vaii', 88, 8, 35, '2016-11-02 00:50:04'),
	(10, 'lógica de mestre PHP > ALL', 55, 7, 35, '2016-11-02 00:50:35'),
	(11, 'booaa', 77, 6, 28, '2016-11-02 00:51:36'),
	(12, 'Boaa campeão.', 33, 5, 28, '2016-11-02 00:52:01'),
	(13, 'bom. muito bom', 22, 4, 33, '2016-11-02 00:53:13'),
	(14, 'I don\'t how to comment about your solution. I only can grade you 100 points. Congratulation.', 100, 1, 33, '2016-11-02 00:54:19'),
	(15, 'HAHAHAH', 50, 10, 27, '2016-11-02 00:55:22'),
	(16, 'Excelente', 100, 9, 27, '2016-11-02 00:55:34'),
	(17, 'Boa.', 90, 8, 81, '2016-11-02 00:56:22'),
	(18, 'Booooa', 66, 9, 81, '2016-11-02 00:56:39'),
	(19, 'Boaa', 99, 5, 93, '2016-11-02 00:57:18'),
	(20, 'Good', 76, 6, 93, '2016-11-02 00:57:40'),
	(21, 'Booooa', 80, 2, 45, '2016-11-02 00:58:30'),
	(22, 'Boaaa', 77, 10, 45, '2016-11-02 00:58:43'),
	(23, 'Boaaa', 77, 12, 86, '2016-11-02 00:58:43'),
	(29, 'boa cara. Excelente resposta!', 100, 15, 74, '2016-11-07 22:01:52'),
	(30, 'Boaaa', 100, 11, 74, '2016-11-07 22:02:34'),
	(35, 'Bom trabalho!', 100, 14, 50, '2016-11-08 23:55:05'),
	(36, 'fsdlkfkdlsfkl', 100, 16, 31, '2016-11-13 15:11:22'),
	(37, 'Muito Bom', 70, 18, 41, '2016-12-04 20:42:17'),
	(38, 'Muitoo bom', 99, 17, 89, '2016-12-04 20:43:04'),
	(39, 'Excelente', 80, 19, 7, '2016-12-13 00:53:02'),
	(40, 'Excelente', 87, 20, 9, '2016-12-13 00:53:02'),
	(41, 'Excelente', 100, 21, 11, '2016-12-13 00:53:02'),
	(42, 'Melhore', 55, 22, 13, '2016-12-13 00:53:02'),
	(43, 'Bom', 70, 23, 15, '2016-12-13 00:53:02'),
	(44, 'Excelente', 80, 24, 7, '2016-12-13 00:53:02'),
	(45, 'Bom', 72, 25, 9, '2016-12-13 00:53:03'),
	(46, 'Bom', 76, 26, 11, '2016-12-13 00:53:03'),
	(47, 'Excelente', 90, 27, 13, '2016-12-13 00:53:03'),
	(48, 'Bom', 69, 28, 15, '2016-12-13 00:53:03'),
	(49, 'Excelente', 100, 19, 8, '2016-12-13 00:56:14'),
	(50, 'Excelente', 100, 20, 10, '2016-12-13 00:56:14'),
	(51, 'Melhore', 69, 21, 12, '2016-12-13 00:56:14'),
	(52, 'Bom', 60, 22, 14, '2016-12-13 00:56:14'),
	(53, 'Melhore', 50, 23, 16, '2016-12-13 00:56:14'),
	(54, 'Ruim', 40, 24, 8, '2016-12-13 00:56:14'),
	(55, 'Excelente', 80, 25, 10, '2016-12-13 00:56:14'),
	(56, 'Excelente', 98, 26, 12, '2016-12-13 00:56:14'),
	(57, 'Bom', 70, 27, 14, '2016-12-13 00:56:14'),
	(58, 'Ok', 78, 28, 16, '2016-12-13 00:56:14');
/*!40000 ALTER TABLE `correcao` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.correcao_final
DROP TABLE IF EXISTS `correcao_final`;
CREATE TABLE IF NOT EXISTS `correcao_final` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` text,
  `nota_final` double DEFAULT NULL,
  `avaliacao_id` int(11) NOT NULL,
  `aluno_usuario_id` int(11) NOT NULL,
  `correcao_visivel` tinyint(1) DEFAULT '0',
  `correcao_final_data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_correcao_final_avaliacao1_idx` (`avaliacao_id`),
  KEY `fk_correcao_final_aluno1_idx` (`aluno_usuario_id`),
  CONSTRAINT `fk_correcao_final_aluno1` FOREIGN KEY (`aluno_usuario_id`) REFERENCES `aluno` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_correcao_final_avaliacao1` FOREIGN KEY (`avaliacao_id`) REFERENCES `avaliacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.correcao_final: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `correcao_final` DISABLE KEYS */;
INSERT INTO `correcao_final` (`id`, `feedback`, `nota_final`, `avaliacao_id`, `aluno_usuario_id`, `correcao_visivel`, `correcao_final_data`) VALUES
	(1, 'Excelente. Continue assim.', 100, 1, 31, 1, '2016-11-05 16:36:18'),
	(2, 'sfsddfdsfsfs', 84.81599999999999, 1, 32, 1, '2016-11-05 14:24:44'),
	(3, 'Excelente trabalho, Harumi Kat.', 88, 1, 29, 1, '2016-11-03 21:41:52'),
	(4, 'Legal2', 100, 2, 29, 1, '2016-11-05 16:52:18'),
	(5, NULL, NULL, 2, 32, 1, NULL),
	(6, 'Bom trabalho.', 60, 2, 31, 1, '2016-11-05 21:12:13'),
	(7, 'olá. katoooooo', 50, 1, 30, 1, '2016-11-03 22:09:03'),
	(8, 'Excelente trabalho.', 100, 7, 50, 1, '2016-11-03 22:10:27'),
	(9, '77,2 vai ser sua nota Yasuyuki!', 77.2, 1, 35, 1, '2016-11-05 16:06:41'),
	(10, 'Parabéns Pessoa!', 76.5, 1, 28, 1, '2016-11-05 16:51:00'),
	(12, 'Bom trabalho nas correções', 100, 1, 45, 1, '2016-11-05 16:51:21'),
	(13, 'ok', 96.134, 1, 93, 1, '2016-11-05 16:53:48'),
	(14, 'Seja mais criterioso da próxima vez. Obrigado!', 50, 7, 74, 1, '2016-11-07 22:08:18'),
	(15, 'fdsfdsfsfsdfs', 98, 1, 33, 0, '2016-11-08 18:43:30'),
	(16, 'Ótimo!!', 95, 9, 31, 1, '2016-11-13 16:24:26'),
	(17, 'Ok. Muito bom. Ok', 88.85, 10, 41, 1, '2016-12-04 20:47:28'),
	(18, 'Excelente.', 100, 10, 89, 1, '2016-12-04 20:48:02'),
	(19, 'Continue Assim.', 82.5, 16, 7, 1, '2016-12-13 01:03:40'),
	(20, 'Muito bom!', 93.5, 16, 8, 1, '2016-12-13 01:04:08'),
	(21, 'Ok.', 73.4, 16, 9, 1, '2016-12-13 01:04:27'),
	(22, 'Excelente.', 95.75, 16, 10, 1, '2016-12-13 01:04:59'),
	(23, 'Excelente.', 76, 16, 11, 1, '2016-12-13 01:06:01'),
	(24, 'Ok', 60, 16, 12, 1, '2016-12-13 01:06:28'),
	(25, 'Você fez um bom trabalho...', 100, 16, 13, 1, '2016-12-13 01:06:52'),
	(26, 'Bom.. Ok!', 90, 16, 14, 1, '2016-12-13 01:07:43');
/*!40000 ALTER TABLE `correcao_final` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.curso
DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `instituicao_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_curso_instituicao1_idx` (`instituicao_id`),
  CONSTRAINT `fk_curso_instituicao1` FOREIGN KEY (`instituicao_id`) REFERENCES `instituicao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.curso: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`id`, `nome`, `instituicao_id`) VALUES
	(1, 'Tecnologia em Análise e Desenvolvimento de Sistemas', 1),
	(2, 'Tecnologia em Gestão de Qualidade', 1),
	(3, 'Química', 2),
	(4, 'Engenharia Civil', 2),
	(5, 'Letras em Inglês', 1),
	(8, 'História', 5);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.disciplina
DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE IF NOT EXISTS `disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_disciplina_curso1_idx` (`curso_id`),
  CONSTRAINT `fk_disciplina_curso1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.disciplina: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`id`, `nome`, `curso_id`) VALUES
	(1, 'Estrutura de dados', 1),
	(2, 'Algoritmo I', 1),
	(3, 'Banco de dados', 1),
	(4, 'Química Orgânica', 3),
	(5, 'Química Inorgânica', 3),
	(6, 'Estudos da Tradução', 5),
	(7, 'Gerência de projetos', 1),
	(9, 'Culturas ocidentais II', 8);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.instituicao
DROP TABLE IF EXISTS `instituicao`;
CREATE TABLE IF NOT EXISTS `instituicao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.instituicao: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `instituicao` DISABLE KEYS */;
INSERT INTO `instituicao` (`id`, `nome`) VALUES
	(1, 'Universidade Federal do Paraná'),
	(2, 'Universidade Positivo'),
	(3, 'Pontifícia Universidade Católica do Paraná'),
	(5, 'UEL');
/*!40000 ALTER TABLE `instituicao` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.matricula
DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `aluno_usuario_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
  KEY `fk_matricula_aluno1_idx` (`aluno_usuario_id`),
  KEY `fk_matricula_turma1_idx` (`turma_id`),
  CONSTRAINT `fk_matricula_aluno1` FOREIGN KEY (`aluno_usuario_id`) REFERENCES `aluno` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_turma1` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.matricula: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` (`aluno_usuario_id`, `turma_id`) VALUES
	(31, 1),
	(32, 1),
	(29, 1),
	(30, 1),
	(35, 1),
	(28, 1),
	(33, 1),
	(27, 1),
	(81, 1),
	(93, 1),
	(45, 1),
	(50, 2),
	(51, 9),
	(106, 1),
	(73, 2),
	(77, 2),
	(74, 2),
	(86, 2),
	(31, 10),
	(41, 12),
	(89, 12),
	(31, 12),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 3),
	(11, 3),
	(12, 3),
	(13, 3),
	(14, 3),
	(15, 3),
	(16, 3);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.perfil
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.perfil: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`id`, `nome`) VALUES
	(1, 'Administrador'),
	(2, 'Aluno'),
	(3, 'Professor');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.professor
DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `fk_professor_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_professor_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.professor: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` (`usuario_id`) VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(107),
	(109),
	(111);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.solucao
DROP TABLE IF EXISTS `solucao`;
CREATE TABLE IF NOT EXISTS `solucao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resposta` text,
  `avaliacao_id` int(11) NOT NULL,
  `aluno_usuario_id` int(11) NOT NULL,
  `solucao_data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solucao_avaliacao1_idx` (`avaliacao_id`),
  KEY `fk_solucao_aluno1_idx` (`aluno_usuario_id`),
  CONSTRAINT `fk_solucao_aluno1` FOREIGN KEY (`aluno_usuario_id`) REFERENCES `aluno` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_solucao_avaliacao1` FOREIGN KEY (`avaliacao_id`) REFERENCES `avaliacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.solucao: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `solucao` DISABLE KEYS */;
INSERT INTO `solucao` (`id`, `resposta`, `avaliacao_id`, `aluno_usuario_id`, `solucao_data`) VALUES
	(1, '#include <iostream>\r\nusing namespace std;\r\n\r\nint main() {\r\n	for(int i=100;i>=1;i--){\r\n	    cout << i << "\\n";\r\n	}\r\n	return 0;\r\n}\r\n', 1, 31, '2016-11-02 00:06:27'),
	(2, '#include <iostream>\r\nusing namespace std;\r\n\r\nint main() {\r\n	for(int i=100;i>=1;i--){\r\n	    cout << i << "\\n";\r\n	}\r\n	return 0;\r\n}\r\n', 1, 33, '2016-11-02 00:11:17'),
	(3, '#include <iostream>\r\nusing namespace std;\r\n\r\nint main() {\r\n	for(int i=100;i>=1;i--){\r\n	    cout << i << \'\\n\';\r\n	}\r\n	return 0;\r\n}\r\n', 1, 29, '2016-11-02 00:11:17'),
	(4, '#include <iostream>\r\nusing namespace std;\r\n\r\nint main() {\r\n	for(int i=100;i>=1;i--){\r\n	    cout << i << \'\\n\';\r\n	}\r\n	return 0;\r\n}\r\n', 1, 30, '2016-11-02 00:11:17'),
	(5, '#include <iostream>\r\nusing namespace std;\r\n\r\nint main() {\r\n	for(int i=100;i>=1;i--){\r\n	    cout << i << \'\\n\';\r\n	}\r\n	return 0;\r\n}\r\n', 1, 35, '2016-11-02 00:11:17'),
	(6, '#include <iostream>\r\nusing namespace std;\r\n\r\nint main() {\r\n	for(int i=100;i>=1;i--){\r\n	    cout << i << \'\\n\';\r\n	}\r\n	return 0;\r\n}\r\n', 1, 28, '2016-11-02 00:11:17'),
	(7, '<?php\r\n\r\n	for($i=100;$i>=0;$i++){\r\n		echo $i . \'<br>\';\r\n	}\r\n?>', 1, 27, '2016-11-02 00:11:17'),
	(8, '<?php\r\n\r\n	for($i=100;$i>=0;$i++){\r\n		echo $i . \'<br>\';\r\n	}\r\n?>', 1, 81, '2016-11-02 00:11:17'),
	(9, '<?php\r\n\r\n	for($i=100;$i>=0;$i++){\r\n		echo $i . \'<br>\';\r\n	}\r\n?>', 1, 93, '2016-10-12 00:11:17'),
	(10, '<?php\r\n\r\n	for($i=100;$i>=0;$i++){\r\n		echo $i . \'<br>\';\r\n	}\r\n?>', 1, 32, '2016-10-12 00:11:17'),
	(11, '-------------------------\r\n\r\nBy Armando Vaugh', 7, 86, '2016-11-07 19:56:17'),
	(12, '-------------------------\r\n\r\nBy Kent Burgess', 7, 73, '2016-11-07 19:56:17'),
	(13, 'void primenumber(int number)\r\n{\r\n    for(int i=1; i<number; i++)\r\n    {\r\n       if(number%i!=0)\r\n          cout<<\'Number is prime:\'<<endl;\r\n       else \r\n          cout<<\'number is NOt prime\'<<endl;\r\n    }  \r\n}', 7, 77, '2016-11-07 19:56:17'),
	(14, '-------------------------\r\n\r\nBy Long', 7, 74, '2016-11-07 19:56:17'),
	(15, '-------------------------\r\n\r\nBy Wayne', 7, 50, '2016-11-07 19:56:17'),
	(16, 'ótimo ABIGUINHO', 9, 31, '2016-11-13 14:37:03'),
	(17, 'fsfkdsfklçsflksflkçsdfklçsdkflçdsf', 10, 41, '2016-12-04 20:33:02'),
	(18, 'skjsdfjkdsfjkdsfjkdsjfkdsjfkdfs', 10, 89, '2016-12-04 20:34:25'),
	(19, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 7, '2016-12-12 23:54:14'),
	(20, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 8, '2016-12-13 00:05:33'),
	(21, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 9, '2016-12-13 00:06:42'),
	(22, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 10, '2016-12-13 00:06:42'),
	(23, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 11, '2016-12-13 00:06:42'),
	(24, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 12, '2016-12-13 00:06:42'),
	(25, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 13, '2016-12-13 00:08:50'),
	(26, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 14, '2016-12-13 00:06:42'),
	(27, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 15, '2016-12-13 00:06:42'),
	(28, '#include <stdio.h>\r\n\r\nvoid main() {\r\n  float salario, reajuste, novoSalario;\r\n\r\n  printf(\'Informe o salario mensal:\\n\');\r\n  scanf(\'%f\', &salario);\r\n\r\n  printf(\'\\nInforme o percentual de reajuste:\\n\');\r\n  scanf(\'%f\', &reajuste);\r\n\r\n  novoSalario = salario + (salario * (reajuste / 100));\r\n  printf(\'\\n\\nSalario novo = R$ %.2f\', novoSalario);\r\n}', 16, 16, '2016-12-13 00:08:36'),
	(29, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 7, '2016-12-13 01:34:45'),
	(30, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 8, '2016-12-13 01:34:45'),
	(31, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 9, '2016-12-13 01:34:45'),
	(32, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 10, '2016-12-13 01:34:45'),
	(33, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 11, '2016-12-13 01:34:45'),
	(34, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 12, '2016-12-13 01:34:45'),
	(35, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 13, '2016-12-13 01:34:45'),
	(36, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 14, '2016-12-13 01:34:45'),
	(37, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 15, '2016-12-13 01:34:45'),
	(38, 'Program AREATRI; \r\nvar A,B: integer; \r\nBegin \r\nwrite (\'Informe o valor da base: \'); \r\nreadln (A); \r\nwrite (\'Informe o valor da altura: \'); \r\nreadln (B); \r\nwriteln (\'O valor da área é de: \',A*B,\' cm.\'); \r\nEnd.', 12, 16, '2016-12-13 01:34:45'),
	(39, '#include <iostream> \r\n\r\nusing namespace std; \r\n\r\nint main(){ \r\n\r\nfloat numero,maior,menor; \r\nint contar = 0; \r\nwhile(contar < 100 ){//troque por 50 \r\n\r\ncout<<\'informe o numero\'; \r\n\r\ncin>>numero; \r\n\r\nif(contar == 0){ \r\nmaior = numero; \r\nmenor = numero; \r\n} \r\n\r\nif(numero > maior) \r\nmaior = numero; \r\n\r\nif(numero < menor) \r\nmenor = numero; \r\ncontar++; \r\n}//fim laço \r\n\r\ncout<<endl<< \'MAIOR numero\' <<maior<<endl; \r\n\r\ncout<<\'MENOR numero\'<<menor<<endl; \r\n\r\nreturn 0; \r\n\r\n}//fim programa', 14, 7, '2016-12-13 02:34:52'),
	(40, '#include <iostream> \r\n\r\nusing namespace std; \r\n\r\nint main(){ \r\n\r\nfloat numero,maior,menor; \r\nint contar = 0; \r\nwhile(contar < 100 ){//troque por 50 \r\n\r\ncout<<\'informe o numero\'; \r\n\r\ncin>>numero; \r\n\r\nif(contar == 0){ \r\nmaior = numero; \r\nmenor = numero; \r\n} \r\n\r\nif(numero > maior) \r\nmaior = numero; \r\n\r\nif(numero < menor) \r\nmenor = numero; \r\ncontar++; \r\n}//fim laço \r\n\r\ncout<<endl<< \'MAIOR numero\' <<maior<<endl; \r\n\r\ncout<<\'MENOR numero\'<<menor<<endl; \r\n\r\nreturn 0; \r\n\r\n}//fim programa', 14, 8, '2016-12-13 02:34:52'),
	(41, '#include <iostream> \r\n\r\nusing namespace std; \r\n\r\nint main(){ \r\n\r\nfloat numero,maior,menor; \r\nint contar = 0; \r\nwhile(contar < 100 ){//troque por 50 \r\n\r\ncout<<\'informe o numero\'; \r\n\r\ncin>>numero; \r\n\r\nif(contar == 0){ \r\nmaior = numero; \r\nmenor = numero; \r\n} \r\n\r\nif(numero > maior) \r\nmaior = numero; \r\n\r\nif(numero < menor) \r\nmenor = numero; \r\ncontar++; \r\n}//fim laço \r\n\r\ncout<<endl<< \'MAIOR numero\' <<maior<<endl; \r\n\r\ncout<<\'MENOR numero\'<<menor<<endl; \r\n\r\nreturn 0; \r\n\r\n}//fim programa', 14, 9, '2016-12-13 02:34:52'),
	(42, 'int min = 0;\r\nint max = 0;\r\nint user_input = 0;\r\nfor (int i = 0 ; i < 100; i++) {\r\n    get user input in user_input;\r\n    \r\n     if (user_input < min) {\r\n          min = user_input;\r\n    } else if (user_input > max) {\r\n          max = user_input;\r\n    }\r\n}\r\n \r\nprint out min\r\nprint out max', 14, 10, '2016-12-13 02:34:52'),
	(43, '#include <iostream> \r\n\r\nusing namespace std; \r\n\r\nint main(){ \r\n\r\nfloat numero,maior,menor; \r\nint contar = 0; \r\nwhile(contar < 100 ){//troque por 50 \r\n\r\ncout<<\'informe o numero\'; \r\n\r\ncin>>numero; \r\n\r\nif(contar == 0){ \r\nmaior = numero; \r\nmenor = numero; \r\n} \r\n\r\nif(numero > maior) \r\nmaior = numero; \r\n\r\nif(numero < menor) \r\nmenor = numero; \r\ncontar++; \r\n}//fim laço \r\n\r\ncout<<endl<< \'MAIOR numero\' <<maior<<endl; \r\n\r\ncout<<\'MENOR numero\'<<menor<<endl; \r\n\r\nreturn 0; \r\n\r\n}//fim programa', 14, 11, '2016-12-13 02:34:52'),
	(44, 'int min = 0;\r\nint max = 0;\r\nint user_input = 0;\r\nfor (int i = 0 ; i < 100; i++) {\r\n    get user input in user_input;\r\n    \r\n     if (user_input < min) {\r\n          min = user_input;\r\n    } else if (user_input > max) {\r\n          max = user_input;\r\n    }\r\n}\r\n \r\nprint out min\r\nprint out max', 14, 12, '2016-12-13 02:37:45'),
	(45, 'int min = 0;\r\nint max = 0;\r\nint user_input = 0;\r\nfor (int i = 0 ; i < 100; i++) {\r\n    get user input in user_input;\r\n    \r\n     if (user_input < min) {\r\n          min = user_input;\r\n    } else if (user_input > max) {\r\n          max = user_input;\r\n    }\r\n}\r\n \r\nprint out min\r\nprint out max', 14, 13, '2016-12-13 02:38:13'),
	(46, '#include <iostream> \r\n\r\nusing namespace std; \r\n\r\nint main(){ \r\n\r\nfloat numero,maior,menor; \r\nint contar = 0; \r\nwhile(contar < 100 ){//troque por 50 \r\n\r\ncout<<\'informe o numero\'; \r\n\r\ncin>>numero; \r\n\r\nif(contar == 0){ \r\nmaior = numero; \r\nmenor = numero; \r\n} \r\n\r\nif(numero > maior) \r\nmaior = numero; \r\n\r\nif(numero < menor) \r\nmenor = numero; \r\ncontar++; \r\n}//fim laço \r\n\r\ncout<<endl<< \'MAIOR numero\' <<maior<<endl; \r\n\r\ncout<<\'MENOR numero\'<<menor<<endl; \r\n\r\nreturn 0; \r\n\r\n}//fim programa', 14, 14, '2016-12-13 02:37:52'),
	(47, 'int min = 0;\r\nint max = 0;\r\nint user_input = 0;\r\nfor (int i = 0 ; i < 100; i++) {\r\n    get user input in user_input;\r\n    \r\n     if (user_input < min) {\r\n          min = user_input;\r\n    } else if (user_input > max) {\r\n          max = user_input;\r\n    }\r\n}\r\n \r\nprint out min\r\nprint out max', 14, 15, '2016-12-13 02:34:52'),
	(48, '#include <iostream> \r\n\r\nusing namespace std; \r\n\r\nint main(){ \r\n\r\nfloat numero,maior,menor; \r\nint contar = 0; \r\nwhile(contar < 100 ){//troque por 50 \r\n\r\ncout<<\'informe o numero\'; \r\n\r\ncin>>numero; \r\n\r\nif(contar == 0){ \r\nmaior = numero; \r\nmenor = numero; \r\n} \r\n\r\nif(numero > maior) \r\nmaior = numero; \r\n\r\nif(numero < menor) \r\nmenor = numero; \r\ncontar++; \r\n}//fim laço \r\n\r\ncout<<endl<< \'MAIOR numero\' <<maior<<endl; \r\n\r\ncout<<\'MENOR numero\'<<menor<<endl; \r\n\r\nreturn 0; \r\n\r\n}//fim programa', 14, 16, '2016-12-13 02:38:03'),
	(49, '<?php\r\n\r\n$j=1;\r\n\r\nwhile($j<11){\r\n\r\n$X=0;\r\n\r\nfor($i = $X; $i < 11; $i++) {\r\n\r\necho \'$j x $i=\';\r\n\r\necho $j*$i;\r\n\r\necho \'<br>\';\r\n\r\n$X++ ;\r\n\r\n}\r\n\r\n$j++;\r\n\r\n}', 15, 7, '2016-12-13 02:38:03'),
	(50, '<?php\r\n\r\n$j=1;\r\n\r\nwhile($j<11){\r\n\r\n$X=0;\r\n\r\nfor($i = $X; $i < 11; $i++) {\r\n\r\necho \'$j x $i=\';\r\n\r\necho $j*$i;\r\n\r\necho \'<br>\';\r\n\r\n$X++ ;\r\n\r\n}\r\n\r\n$j++;\r\n\r\n}', 15, 8, '2016-12-13 02:38:03'),
	(51, '<?php\r\n\r\n$j=1;\r\n\r\nwhile($j<11){\r\n\r\n$X=0;\r\n\r\nfor($i = $X; $i < 11; $i++) {\r\n\r\necho \'$j x $i=\';\r\n\r\necho $j*$i;\r\n\r\necho \'<br>\';\r\n\r\n$X++ ;\r\n\r\n}\r\n\r\n$j++;\r\n\r\n}', 15, 9, '2016-12-13 02:38:03'),
	(52, '<?php\r\n\r\n	$j=1;\r\n\r\n	while($j<11){\r\n\r\n		$X=0;\r\n\r\n		for($i = $X; $i < 11; $i++) {\r\n\r\n			echo \'$j x $i=\';\r\n\r\n			echo $j*$i;\r\n\r\n			echo \'<br>\';\r\n\r\n			$X++ ;\r\n\r\n		}\r\n\r\n		$j++;\r\n\r\n	}\r\n?>', 15, 10, '2016-12-13 02:38:03'),
	(53, '<?php\r\n\r\n	$j=1;\r\n\r\n	while($j<11){\r\n\r\n		$X=0;\r\n\r\n		for($i = $X; $i < 11; $i++) {\r\n\r\n			echo \'$j x $i=\';\r\n\r\n			echo $j*$i;\r\n\r\n			echo \'<br>\';\r\n\r\n			$X++ ;\r\n\r\n		}\r\n\r\n		$j++;\r\n\r\n	}\r\n?>', 15, 11, '2016-12-13 02:38:03'),
	(54, '<?php\r\n\r\n	$j=1;\r\n\r\n	while($j<11){\r\n\r\n		$X=0;\r\n\r\n		for($i = $X; $i < 11; $i++) {\r\n\r\n			echo \'$j x $i=\';\r\n\r\n			echo $j*$i;\r\n\r\n			echo \'<br>\';\r\n\r\n			$X++ ;\r\n\r\n		}\r\n\r\n		$j++;\r\n\r\n	}\r\n?>', 15, 12, '2016-12-13 02:38:03'),
	(55, '<?php\r\n\r\n	$j=1;\r\n\r\n	while($j<11){\r\n\r\n		$X=0;\r\n\r\n		for($i = $X; $i < 11; $i++) {\r\n\r\n			echo \'$j x $i=\';\r\n\r\n			echo $j*$i;\r\n\r\n			echo \'<br>\';\r\n\r\n			$X++ ;\r\n\r\n		}\r\n\r\n		$j++;\r\n\r\n	}\r\n?>', 15, 13, '2016-12-13 02:38:03'),
	(56, '<?php\r\n\r\n	$j=1;\r\n\r\n	while($j<11){\r\n\r\n		$X=0;\r\n\r\n		for($i = $X; $i < 11; $i++) {\r\n\r\n			echo \'$j x $i=\';\r\n\r\n			echo $j*$i;\r\n\r\n			echo \'<br>\';\r\n\r\n			$X++ ;\r\n\r\n		}\r\n\r\n		$j++;\r\n\r\n	}\r\n?>', 15, 14, '2016-12-13 02:38:03'),
	(57, '<?php\r\n\r\n	$j=1;\r\n\r\n	while($j<11){\r\n\r\n		$X=0;\r\n\r\n		for($i = $X; $i < 11; $i++) {\r\n\r\n			echo \'$j x $i=\';\r\n\r\n			echo $j*$i;\r\n\r\n			echo \'<br>\';\r\n\r\n			$X++ ;\r\n\r\n		}\r\n\r\n		$j++;\r\n\r\n	}\r\n?>', 15, 15, '2016-12-13 02:38:03'),
	(58, '<?php\r\n\r\n	$j=1;\r\n\r\n	while($j<11){\r\n\r\n		$X=0;\r\n\r\n		for($i = $X; $i < 11; $i++) {\r\n\r\n			echo \'$j x $i=\';\r\n\r\n			echo $j*$i;\r\n\r\n			echo \'<br>\';\r\n\r\n			$X++ ;\r\n\r\n		}\r\n\r\n		$j++;\r\n\r\n	}\r\n?>', 15, 16, '2016-12-13 02:38:03');
/*!40000 ALTER TABLE `solucao` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.turma
DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `palavra_chave` varchar(45) DEFAULT NULL,
  `disciplina_id` int(11) NOT NULL,
  `professor_usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_turma_disciplina1_idx` (`disciplina_id`),
  KEY `fk_turma_professor1_idx` (`professor_usuario_id`),
  CONSTRAINT `fk_turma_disciplina1` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_professor1` FOREIGN KEY (`professor_usuario_id`) REFERENCES `professor` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.turma: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`id`, `nome`, `palavra_chave`, `disciplina_id`, `professor_usuario_id`) VALUES
	(1, 'Turma Matutina', 'BATATA1', 2, 1),
	(2, 'Turma Vespertina', 'BATATA2', 2, 1),
	(3, 'Turma Noturna', 'BATATA3', 2, 1),
	(4, 'Turma Matutina', 'QUIMICA1', 4, 3),
	(5, 'Turma Noturna', 'QUIMICA2', 5, 3),
	(6, 'Turma Matutina', 'LETRAS1', 6, 2),
	(7, 'Turma Noturna', 'LETRAS2', 6, 2),
	(8, 'Turma Mat. Inorgânica', 'QUIMICAIII', 5, 1),
	(9, 'ET - Baggio Carmen - I', 'ETI', 6, 4),
	(10, 'M1', 'gerencia', 7, 1),
	(12, 'Turma Noturna', 'abacate', 9, 1);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;


-- Copiando estrutura para tabela coavalieitor_db.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `perfil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_perfil1_idx` (`perfil_id`),
  CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela coavalieitor_db.usuario: ~106 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `email`, `senha`, `nome`, `telefone`, `nascimento`, `sexo`, `perfil_id`) VALUES
	(1, 'albertokatojr@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Alberto', NULL, NULL, NULL, 1),
	(2, 'ivoneterq@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ivonete', NULL, NULL, NULL, 1),
	(3, 'welyngton.dp@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Welyngton', NULL, NULL, NULL, 1),
	(4, 'professor1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Carmem Baggio', NULL, NULL, NULL, 3),
	(5, 'professor2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Amélia da Silva', NULL, NULL, NULL, 3),
	(6, 'professor3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Roberto Ivanoviski', NULL, NULL, NULL, 3),
	(7, 'aluno1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Alfredo Caballero', NULL, NULL, NULL, 2),
	(8, 'aluno2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Allan', NULL, NULL, NULL, 2),
	(9, 'aluno3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Antonia', NULL, NULL, NULL, 2),
	(10, 'aluno4@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Brock', NULL, NULL, NULL, 2),
	(11, 'aluno5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Bruno', NULL, NULL, NULL, 2),
	(12, 'aluno6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Calvin', NULL, NULL, NULL, 2),
	(13, 'aluno7@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cameron', NULL, NULL, NULL, 2),
	(14, 'aluno8@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cortez Poland', NULL, NULL, NULL, 2),
	(15, 'aluno9@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Donny', NULL, NULL, NULL, 2),
	(16, 'aluno10@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Elissa', NULL, NULL, NULL, 2),
	(17, 'aluno11@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Esmeralda', NULL, NULL, NULL, 2),
	(18, 'aluno12@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Fernanda', NULL, NULL, NULL, 2),
	(19, 'aluno13@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Flora Leblanc', NULL, NULL, NULL, 2),
	(20, 'aluno14@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Gladys', NULL, NULL, NULL, 2),
	(21, 'aluno15@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ivana', NULL, NULL, NULL, 2),
	(22, 'aluno16@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jeannie', NULL, NULL, NULL, 2),
	(23, 'aluno17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Kimberlee Underwood', NULL, NULL, NULL, 2),
	(24, 'aluno18@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Melody', NULL, NULL, NULL, 2),
	(25, 'aluno19@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nancee Trammell', NULL, NULL, NULL, 2),
	(26, 'aluno20@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Zelda Link', NULL, NULL, NULL, 2),
	(27, 'aluno21@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Maria da Silva', NULL, NULL, NULL, 2),
	(28, 'aluno22@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jose da Silva', NULL, NULL, NULL, 2),
	(29, 'aluno23@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Harumi Kato', NULL, NULL, NULL, 2),
	(30, 'aluno24@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tieko Kato', NULL, NULL, NULL, 2),
	(31, 'aluno25@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Joshua Wright', NULL, NULL, NULL, 2),
	(32, 'aluno26@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Roger Wright', NULL, NULL, NULL, 2),
	(33, 'aluno27@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Luiz Gonçalvez da Silva', NULL, NULL, NULL, 2),
	(34, 'aluno28@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Luiz Eduardo Bueno', NULL, NULL, NULL, 2),
	(35, 'aluno29@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Yasuyuki Kato', NULL, NULL, NULL, 2),
	(36, 'aluno30@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Maria Helena Menezes', NULL, NULL, NULL, 2),
	(37, 'aluno31@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Johanna	Thomas', NULL, NULL, NULL, 2),
	(38, 'aluno32@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Michele	Farmer', NULL, NULL, NULL, 2),
	(39, 'aluno33@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Geoffrey Day', NULL, NULL, NULL, 2),
	(40, 'aluno34@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Maria Mitchell', NULL, NULL, NULL, 2),
	(41, 'aluno35@gmail.com', '04b6e1a104ba0ed5e7985abde3e13140', 'Rosie Gutierrez', '(99)99999999', '1992-02-12', 'F', 2),
	(42, 'aluno36@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Arlene Page', NULL, NULL, NULL, 2),
	(43, 'aluno37@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Bruce Peters', NULL, NULL, NULL, 2),
	(44, 'aluno38@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lynn Weber', NULL, NULL, NULL, 2),
	(45, 'aluno39@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mario Jacobs', NULL, NULL, NULL, 2),
	(46, 'aluno40@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jimmie Neal', NULL, NULL, NULL, 2),
	(47, 'aluno41@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hugh Moreno', NULL, NULL, NULL, 2),
	(48, 'aluno42@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cathy Schultz', NULL, NULL, NULL, 2),
	(49, 'aluno43@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'John Mccormick', NULL, NULL, NULL, 2),
	(50, 'aluno44@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Wayne Graves', NULL, NULL, NULL, 2),
	(51, 'aluno45@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Carole Vasquez', NULL, NULL, NULL, 2),
	(52, 'aluno46@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Luther Holland', NULL, NULL, NULL, 2),
	(53, 'aluno47@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ella Wheeler', NULL, NULL, NULL, 2),
	(54, 'aluno48@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mandy Smith', NULL, NULL, NULL, 2),
	(55, 'aluno49@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nathaniel Grant', NULL, NULL, NULL, 2),
	(56, 'aluno50@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ebony Stone', NULL, NULL, NULL, 2),
	(57, 'aluno51@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Luz	Sullivan', NULL, NULL, NULL, 2),
	(58, 'aluno52@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nelson Banks', NULL, NULL, NULL, 2),
	(59, 'aluno53@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Glen Zimmerman', NULL, NULL, NULL, 2),
	(60, 'aluno54@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Elias Graham', NULL, NULL, NULL, 2),
	(61, 'aluno55@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Travis Simon', NULL, NULL, NULL, 2),
	(62, 'aluno56@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Amos Thornton', NULL, NULL, NULL, 2),
	(63, 'aluno57@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Dolores Cobb', NULL, NULL, NULL, 2),
	(64, 'aluno58@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lois Lamb', NULL, NULL, NULL, 2),
	(65, 'aluno59@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Wilbur Bates', NULL, NULL, NULL, 2),
	(66, 'aluno60@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Candice Park', NULL, NULL, NULL, 2),
	(67, 'aluno61@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Leonard Cain', NULL, NULL, NULL, 2),
	(68, 'aluno62@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Alberto Sparks', NULL, NULL, NULL, 2),
	(69, 'aluno63@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Irving Morton', NULL, NULL, NULL, 2),
	(70, 'aluno64@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Alvin Gonzales', NULL, NULL, NULL, 2),
	(71, 'aluno65@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Corey Gibson', NULL, NULL, NULL, 2),
	(72, 'aluno66@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Daryl Stevens', NULL, NULL, NULL, 2),
	(73, 'aluno67@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Kent Burgess', NULL, NULL, NULL, 2),
	(74, 'aluno68@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Shaun Long', NULL, NULL, NULL, 2),
	(75, 'aluno69@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Erika Palmer', NULL, NULL, NULL, 2),
	(76, 'aluno70@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cary Jackson', NULL, NULL, NULL, 2),
	(77, 'aluno71@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lorene Andrews', NULL, NULL, NULL, 2),
	(78, 'aluno72@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jo West', NULL, NULL, NULL, 2),
	(79, 'aluno73@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jaime Hamilton', NULL, NULL, NULL, 2),
	(80, 'aluno74@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lorraine Jefferson', NULL, NULL, NULL, 2),
	(81, 'aluno75@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Eddie Parks', NULL, NULL, NULL, 2),
	(82, 'aluno76@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Emma Washington', NULL, NULL, NULL, 2),
	(83, 'aluno77@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Shane Wallace', NULL, NULL, NULL, 2),
	(84, 'aluno78@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Winston Yates', NULL, NULL, NULL, 2),
	(85, 'aluno79@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Violet Lucas', NULL, NULL, NULL, 2),
	(86, 'aluno80@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Armando Vaughn', NULL, NULL, NULL, 2),
	(87, 'aluno81@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Allison Strickland', NULL, NULL, NULL, 2),
	(88, 'aluno82@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Enrique Newman', NULL, NULL, NULL, 2),
	(89, 'aluno83@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Maryann Arnold', NULL, NULL, NULL, 2),
	(90, 'aluno84@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Wm Simmons', NULL, NULL, NULL, 2),
	(91, 'aluno85@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Celia Alvarado', NULL, NULL, NULL, 2),
	(92, 'aluno86@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Carroll Barnett', NULL, NULL, NULL, 2),
	(93, 'aluno87@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Vicky Gill', NULL, NULL, NULL, 2),
	(94, 'aluno88@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Michelle Garrett', NULL, NULL, NULL, 2),
	(95, 'aluno89@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Fernando Caldwell', NULL, NULL, NULL, 2),
	(96, 'aluno90@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Elsie Keller', NULL, NULL, NULL, 2),
	(97, 'aluno91@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Elvira Peterson', NULL, NULL, NULL, 2),
	(98, 'aluno92@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Bridget Mclaughlin', NULL, NULL, NULL, 2),
	(99, 'aluno93@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cristina Wilson', NULL, NULL, NULL, 2),
	(100, 'aluno94@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Rebecca Salazar', NULL, NULL, NULL, 2),
	(101, 'aluno95@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lena Ramsey', NULL, NULL, NULL, 2),
	(102, 'aluno96@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Anna Reid', NULL, NULL, NULL, 2),
	(103, 'aluno97@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Sophie Lawrence', NULL, NULL, NULL, 2),
	(104, 'aluno98@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Sonya Shelton', NULL, NULL, NULL, 2),
	(105, 'aluno99@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Donald Harvey', NULL, NULL, NULL, 2),
	(106, 'aluno100@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jodi Lopez', NULL, NULL, NULL, 2),
	(107, 'professor4@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Carmen Lucia', '(41) 95000-676', '2016-11-10', 'F', 3),
	(108, 'aluno101@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Taguchi', NULL, NULL, NULL, 2),
	(109, 'professor5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jeroniza', NULL, NULL, NULL, 3),
	(110, 'aluno102@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hugo Vaslequez', NULL, NULL, NULL, 2),
	(111, 'professor6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Vitória Silva', NULL, NULL, NULL, 3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
