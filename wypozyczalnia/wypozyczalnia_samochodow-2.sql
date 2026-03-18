-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 16, 2026 at 08:01 PM
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
-- Database: `wypozyczalnia_samochodow`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nr_prawa_jazdy` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `imie`, `nazwisko`, `telefon`, `email`, `nr_prawa_jazdy`) VALUES
(1, 'Jan', 'Kowalski', '500600700', 'jan@test.pl', 'PJ123456'),
(2, 'Anna', 'Nowak', '501222333', 'anna@test.pl', 'PJ654321'),
(3, 'Piotr', 'Zielinski', '502333444', 'piotr@test.pl', 'PJ777888'),
(4, 'Marek', 'Lewandowski', '503111222', 'marek@test.pl', 'PJ998877'),
(5, 'Karolina', 'Wiśniewska', '504222333', 'karolina@test.pl', 'PJ112233'),
(6, 'Tomasz', 'Kaczmarek', '505333444', 'tomasz@test.pl', 'PJ445566'),
(7, 'Magdalena', 'Piotrowska', '506444555', 'magda@test.pl', 'PJ778899'),
(8, 'Paweł', 'Dąbrowski', '507555666', 'pawel@test.pl', 'PJ223344'),
(9, 'Katarzyna', 'Wójcik', '508666777', 'kasia@test.pl', 'PJ556677'),
(10, 'Adam', 'Mazur', '509777888', 'adam@test.pl', 'PJ889900'),
(11, 'Natalia', 'Krawczyk', '510888999', 'natalia@test.pl', 'PJ990011');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `id_samochodu` int(11) NOT NULL,
  `marka` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `rok_produkcji` int(11) DEFAULT NULL,
  `nr_rejestracyjny` varchar(15) DEFAULT NULL,
  `status` enum('wolny','zajety','serwis') DEFAULT 'wolny'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `samochody`
--

INSERT INTO `samochody` (`id_samochodu`, `marka`, `model`, `rok_produkcji`, `nr_rejestracyjny`, `status`) VALUES
(1, 'Toyota', 'Corolla', 2020, 'WA12345', 'wolny'),
(2, 'Ford', 'Focus', 2019, 'WA54321', 'zajety'),
(3, 'Skoda', 'Octavia', 2021, 'KR22222', 'wolny'),
(4, 'Volkswagen', 'Golf', 2018, 'PO11111', 'serwis'),
(5, 'Opel', 'Astra', 2017, 'GD33333', 'wolny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `id_wypozyczenia` int(11) NOT NULL,
  `id_samochodu` int(11) DEFAULT NULL,
  `id_klienta` int(11) DEFAULT NULL,
  `data_wypozyczenia` date DEFAULT NULL,
  `data_zwrotu` date DEFAULT NULL,
  `status` enum('aktywne','zakonczone','anulowane') DEFAULT 'aktywne'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`id_wypozyczenia`, `id_samochodu`, `id_klienta`, `data_wypozyczenia`, `data_zwrotu`, `status`) VALUES
(1, 2, 1, '2026-03-10', '2026-03-15', 'aktywne'),
(2, 1, 2, '2026-03-01', '2026-03-05', 'zakonczone'),
(27, 1, 3, '2026-02-10', '2026-02-15', 'zakonczone'),
(28, 3, 4, '2026-02-18', '2026-02-22', 'zakonczone'),
(29, 5, 5, '2026-03-01', '2026-03-07', 'zakonczone'),
(30, 2, 6, '2026-03-12', '2026-03-18', 'aktywne'),
(31, 3, 7, '2026-03-14', '2026-03-20', 'aktywne'),
(32, 1, 8, '2026-01-05', '2026-01-10', 'zakonczone'),
(33, 5, 9, '2026-01-12', '2026-01-18', 'zakonczone'),
(34, 2, 10, '2026-03-02', '2026-03-09', 'zakonczone'),
(35, 3, 1, '2025-12-10', '2025-12-15', 'zakonczone'),
(36, 5, 1, '2026-01-08', '2026-01-12', 'zakonczone'),
(37, 1, 1, '2026-02-02', '2026-02-07', 'zakonczone'),
(38, 2, 1, '2026-03-10', '2026-03-15', 'aktywne');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`id_samochodu`),
  ADD UNIQUE KEY `nr_rejestracyjny` (`nr_rejestracyjny`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`id_wypozyczenia`),
  ADD KEY `id_samochodu` (`id_samochodu`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `samochody`
--
ALTER TABLE `samochody`
  MODIFY `id_samochodu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `id_wypozyczenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `wypozyczenia_ibfk_1` FOREIGN KEY (`id_samochodu`) REFERENCES `samochody` (`id_samochodu`),
  ADD CONSTRAINT `wypozyczenia_ibfk_2` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
