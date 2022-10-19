-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Paź 2022, 08:15
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odpowiedzi`
--

CREATE TABLE `odpowiedzi` (
  `id` int(11) NOT NULL,
  `Treść` varchar(45) DEFAULT NULL,
  `Poprawna` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `odpowiedzi`
--

INSERT INTO `odpowiedzi` (`id`, `Treść`, `Poprawna`) VALUES
(1, '15min', 'Prawda'),
(2, 'Babcia ', NULL),
(3, '20 min', NULL),
(4, '30min', NULL),
(5, 'Mama', 'Prawda'),
(6, 'Sąsiadka', NULL),
(7, 'szabli', NULL),
(8, 'szpady', 'prawda'),
(9, 'włóczni', NULL),
(10, 'Rajd rowerowy', NULL),
(11, 'Wyścig wioślarski', 'Prawda'),
(12, 'Pojedynek na szpady', NULL),
(13, 'G2', NULL),
(14, 'FPX', 'prawda'),
(15, 'T1', NULL),
(16, 'Marlang ', 'Prawda'),
(17, 'Jankos', NULL),
(18, 'Elyoya', NULL),
(19, 'G2', 'Prawda'),
(20, 'FNC', NULL),
(21, 'Schalke 04', NULL),
(22, 'DRX', NULL),
(23, 'GEN.G', NULL),
(24, 'T1', 'prawda'),
(25, 'G2 i EDG', NULL),
(26, 'DWG i Suning', 'prawda'),
(27, 'FPX i FNC', NULL),
(28, '5', NULL),
(29, '3', 'prawda'),
(30, '6', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odpowiedziuczniow`
--

CREATE TABLE `odpowiedziuczniow` (
  `id` int(11) NOT NULL,
  `Treść` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pytania`
--

CREATE TABLE `pytania` (
  `id` int(11) NOT NULL,
  `Treść` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `pytania`
--

INSERT INTO `pytania` (`id`, `Treść`) VALUES
(1, 'Ile gotuje sie bigos ?'),
(2, 'Kto robi najlepszy bigos?'),
(3, 'Mistrzami jakiej broni są Atos, Portos i Aram'),
(4, 'Między osadami uniwersytetów Oxford i Cambrid'),
(5, 'Kto wygrał worldsy w 2019 roku ?'),
(6, 'Kto jest Junglerem drużyny Rogue?'),
(7, 'Kto wygrał 18-razy LEC?'),
(8, 'Kto wygrał LCK w 2022?'),
(9, 'Kto grał w finale mistrzostw świata w 2020?'),
(10, 'Ile razy faker wygrał mistrzostwa świata ?');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pytania_has_odpowiedzi`
--

CREATE TABLE `pytania_has_odpowiedzi` (
  `Pytania_id` int(11) NOT NULL,
  `Odpowiedzi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `pytania_has_odpowiedzi`
--

INSERT INTO `pytania_has_odpowiedzi` (`Pytania_id`, `Odpowiedzi_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 2),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 16),
(6, 17),
(6, 18),
(7, 19),
(7, 20),
(7, 21),
(8, 22),
(8, 23),
(8, 24),
(9, 25),
(9, 26),
(9, 27),
(10, 28),
(10, 29),
(10, 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `id` int(11) NOT NULL,
  `Imie` varchar(45) DEFAULT NULL,
  `Nazwisko` varchar(45) DEFAULT NULL,
  `OdpowiedziUczniow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `odpowiedzi`
--
ALTER TABLE `odpowiedzi`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `odpowiedziuczniow`
--
ALTER TABLE `odpowiedziuczniow`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pytania`
--
ALTER TABLE `pytania`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pytania_has_odpowiedzi`
--
ALTER TABLE `pytania_has_odpowiedzi`
  ADD PRIMARY KEY (`Pytania_id`,`Odpowiedzi_id`),
  ADD KEY `fk_Pytania_has_Odpowiedzi_Odpowiedzi1` (`Odpowiedzi_id`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id`,`OdpowiedziUczniow_id`),
  ADD KEY `fk_Uczniowie_OdpowiedziUczniow1` (`OdpowiedziUczniow_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `odpowiedzi`
--
ALTER TABLE `odpowiedzi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `odpowiedziuczniow`
--
ALTER TABLE `odpowiedziuczniow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pytania`
--
ALTER TABLE `pytania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pytania_has_odpowiedzi`
--
ALTER TABLE `pytania_has_odpowiedzi`
  ADD CONSTRAINT `fk_Pytania_has_Odpowiedzi_Odpowiedzi1` FOREIGN KEY (`Odpowiedzi_id`) REFERENCES `odpowiedzi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pytania_has_Odpowiedzi_Pytania` FOREIGN KEY (`Pytania_id`) REFERENCES `pytania` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD CONSTRAINT `fk_Uczniowie_OdpowiedziUczniow1` FOREIGN KEY (`OdpowiedziUczniow_id`) REFERENCES `odpowiedziuczniow` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
