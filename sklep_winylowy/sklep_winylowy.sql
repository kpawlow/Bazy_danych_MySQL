-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 13, 2026 at 08:51 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep_winylowy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `albumy`
--

CREATE TABLE `albumy` (
  `id` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `artysta_id` int(11) DEFAULT NULL,
  `gatunek_id` int(11) DEFAULT NULL,
  `rok_wydania` int(11) DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `stan_magazynowy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `albumy`
--

INSERT INTO `albumy` (`id`, `tytul`, `artysta_id`, `gatunek_id`, `rok_wydania`, `cena`, `stan_magazynowy`) VALUES
(1, 'The Dark Side of the Moon', 1, 1, 1973, 129.99, 10),
(2, 'Wish You Were Here', 1, 1, 1975, 119.99, 7),
(3, 'Abbey Road', 2, 2, 1969, 119.99, 5),
(4, 'Let It Be', 2, 2, 1970, 109.99, 6),
(5, 'Nevermind', 3, 3, 1991, 109.99, 8),
(6, 'In Utero', 3, 3, 1993, 99.99, 4),
(7, 'Random Access Memories', 4, 4, 2013, 139.99, 6),
(8, 'Discovery', 4, 4, 2001, 129.99, 5),
(9, 'Master of Puppets', 5, 5, 1986, 119.99, 9),
(10, 'Ride the Lightning', 5, 5, 1984, 114.99, 7),
(11, 'A Night at the Opera', 6, 1, 1975, 129.99, 6),
(12, 'News of the World', 6, 1, 1977, 119.99, 5),
(13, 'Back in Black', 7, 1, 1980, 109.99, 8),
(14, 'Highway to Hell', 7, 1, 1979, 104.99, 7),
(15, 'OK Computer', 8, 1, 1997, 134.99, 6),
(16, 'Kid A', 8, 1, 2000, 124.99, 5),
(17, 'The Wall', 1, 1, 1979, 139.99, 4),
(18, 'Help!', 2, 2, 1965, 99.99, 6),
(19, 'Bleach', 3, 3, 1989, 89.99, 5),
(20, 'Homework', 4, 4, 1997, 119.99, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artysci`
--

CREATE TABLE `artysci` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `kraj` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artysci`
--

INSERT INTO `artysci` (`id`, `nazwa`, `kraj`) VALUES
(1, 'Pink Floyd', 'Wielka Brytania'),
(2, 'The Beatles', 'Wielka Brytania'),
(3, 'Nirvana', 'USA'),
(4, 'Daft Punk', 'Francja'),
(5, 'Metallica', 'USA'),
(6, 'Queen', 'Wielka Brytania'),
(7, 'AC/DC', 'Australia'),
(8, 'Radiohead', 'Wielka Brytania');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunki`
--

CREATE TABLE `gatunki` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gatunki`
--

INSERT INTO `gatunki` (`id`, `nazwa`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Grunge'),
(4, 'Elektroniczna'),
(5, 'Metal');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) DEFAULT NULL,
  `nazwisko` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `email`) VALUES
(1, 'Jan', 'Kowalski', 'jan@example.com'),
(2, 'Anna', 'Nowak', 'anna@example.com'),
(3, 'Piotr', 'Zieliński', 'piotr@example.com'),
(4, 'Katarzyna', 'Wiśniewska', 'kasia@example.com'),
(5, 'Tomasz', 'Lewandowski', 'tomasz@example.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycje_zamowienia`
--

CREATE TABLE `pozycje_zamowienia` (
  `id` int(11) NOT NULL,
  `zamowienie_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pozycje_zamowienia`
--

INSERT INTO `pozycje_zamowienia` (`id`, `zamowienie_id`, `album_id`, `ilosc`) VALUES
(1, 1, 1, 1),
(2, 1, 5, 2),
(3, 2, 2, 1),
(4, 2, 3, 1),
(5, 3, 4, 1),
(6, 3, 6, 1),
(7, 4, 7, 2),
(8, 5, 8, 1),
(9, 5, 9, 1),
(10, 6, 10, 1),
(11, 6, 11, 1),
(12, 7, 12, 2),
(13, 8, 13, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(11) NOT NULL,
  `klient_id` int(11) DEFAULT NULL,
  `data_zamowienia` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `klient_id`, `data_zamowienia`) VALUES
(1, 1, '2026-04-01 00:00:00'),
(2, 1, '2026-04-05 00:00:00'),
(3, 2, '2026-04-02 00:00:00'),
(4, 2, '2026-04-06 00:00:00'),
(5, 3, '2026-04-03 00:00:00'),
(6, 3, '2026-04-07 00:00:00'),
(7, 4, '2026-04-04 00:00:00'),
(8, 5, '2026-04-08 00:00:00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `albumy`
--
ALTER TABLE `albumy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artysta_id` (`artysta_id`),
  ADD KEY `gatunek_id` (`gatunek_id`);

--
-- Indeksy dla tabeli `artysci`
--
ALTER TABLE `artysci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `gatunki`
--
ALTER TABLE `gatunki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pozycje_zamowienia`
--
ALTER TABLE `pozycje_zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zamowienie_id` (`zamowienie_id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albumy`
--
ALTER TABLE `albumy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `artysci`
--
ALTER TABLE `artysci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `gatunki`
--
ALTER TABLE `gatunki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pozycje_zamowienia`
--
ALTER TABLE `pozycje_zamowienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albumy`
--
ALTER TABLE `albumy`
  ADD CONSTRAINT `albumy_ibfk_1` FOREIGN KEY (`artysta_id`) REFERENCES `artysci` (`id`),
  ADD CONSTRAINT `albumy_ibfk_2` FOREIGN KEY (`gatunek_id`) REFERENCES `gatunki` (`id`);

--
-- Constraints for table `pozycje_zamowienia`
--
ALTER TABLE `pozycje_zamowienia`
  ADD CONSTRAINT `pozycje_zamowienia_ibfk_1` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienia` (`id`),
  ADD CONSTRAINT `pozycje_zamowienia_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `albumy` (`id`);

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
