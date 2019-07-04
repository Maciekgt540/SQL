-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Paź 2015, 08:14
-- Wersja serwera: 5.6.24
-- Wersja PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `pracownicy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `absencje`
--

CREATE TABLE IF NOT EXISTS `absencje` (
  `id_abs` int(11) NOT NULL,
  `id_prac` int(11) DEFAULT NULL,
  `rodzaj` enum('choroba','urlop','urlop_ok') DEFAULT NULL,
  `data_od` date DEFAULT NULL,
  `data_do` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzieci`
--

CREATE TABLE IF NOT EXISTS `dzieci` (
  `id_dziecka` int(11) NOT NULL,
  `id_prac` int(11) DEFAULT NULL,
  `nazwisko` varchar(20) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `data_ur` date DEFAULT NULL,
  `Plec` enum('dziewczyna','ch?opak') DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dzieci`
--

INSERT INTO `dzieci` (`id_dziecka`, `id_prac`, `nazwisko`, `imie`, `data_ur`, `Plec`) VALUES
(4, 5, 'Kos', 'Anna', NULL, 'dziewczyna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE IF NOT EXISTS `pracownicy` (
  `id_prac` int(11) NOT NULL,
  `nazwisko` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `imie` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `plec` enum('kobieta','mężczyzna') CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `wykszt` enum('podstawowe','średnie','wyższe') CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data_zatr` date NOT NULL,
  `placa` decimal(8,2) NOT NULL,
  `jezyk` set('angielski','niemiecki','rosyjski','chiński') CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `czy_pali` tinyint(1) NOT NULL,
  `Miasto` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id_prac`, `nazwisko`, `imie`, `plec`, `wykszt`, `data_zatr`, `placa`, `jezyk`, `czy_pali`, `Miasto`) VALUES
(1, 'Kowalski', 'Jan', 'mężczyzna', 'średnie', '1990-01-12', '2562.50', 'angielski,niemiecki', 0, 'Turek'),
(2, 'Janiak', 'Ewa', 'kobieta', 'wyższe', '2000-12-01', '2600.00', 'angielski,niemiecki', 0, 'Konin'),
(3, 'Makowski', 'Janusz', 'mężczyzna', 'wyższe', '2000-01-01', '3000.00', 'niemiecki,rosyjski', 0, 'Konin'),
(4, 'Rosiak', 'Anna', 'kobieta', 'podstawowe', '2010-01-15', '1750.00', '', 0, NULL),
(5, 'Kos', 'Adam', 'mężczyzna', 'średnie', '2012-07-01', '2000.00', 'angielski', 0, 'Turek'),
(6, 'Krótki', 'Eryk', 'mężczyzna', 'wyższe', '1995-10-01', '2650.00', 'angielski', 0, 'Konin'),
(7, 'Walczak', 'Marek', 'kobieta', 'podstawowe', '1991-08-15', '3000.00', '', 0, NULL),
(8, 'Witkowska', 'Marta', 'kobieta', 'podstawowe', '1991-08-15', '3100.00', '', 1, NULL),
(10, 'KOREK', 'MARIAN', 'mężczyzna', 'podstawowe', '1990-01-01', '2700.00', '', 1, NULL),
(12, 'Krowiak', 'Ewa', 'kobieta', 'podstawowe', '1991-08-15', '3500.00', '', 0, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `absencje`
--
ALTER TABLE `absencje`
  ADD PRIMARY KEY (`id_abs`), ADD KEY `id_prac` (`id_prac`);

--
-- Indexes for table `dzieci`
--
ALTER TABLE `dzieci`
  ADD PRIMARY KEY (`id_dziecka`), ADD KEY `id_prac` (`id_prac`);

--
-- Indexes for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_prac`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `absencje`
--
ALTER TABLE `absencje`
  MODIFY `id_abs` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `dzieci`
--
ALTER TABLE `dzieci`
  MODIFY `id_dziecka` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id_prac` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `absencje`
--
ALTER TABLE `absencje`
ADD CONSTRAINT `absencje_ibfk_1` FOREIGN KEY (`id_prac`) REFERENCES `pracownicy` (`id_prac`);

--
-- Ograniczenia dla tabeli `dzieci`
--
ALTER TABLE `dzieci`
ADD CONSTRAINT `id_prac` FOREIGN KEY (`id_prac`) REFERENCES `pracownicy` (`id_prac`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
